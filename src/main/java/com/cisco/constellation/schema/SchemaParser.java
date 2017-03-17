package com.cisco.constellation.schema;

import java.io.File;
import java.io.FileInputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import com.cisco.constellation.utils.ExceptionUtils;
import com.cisco.constellation.utils.StringUtils;

/**
 * Created by Wenyu on 01/06/15.
 */
public class SchemaParser {
	private final static Logger logger = Logger.getLogger(SchemaParser.class);
	
	public static final HashMap<String, String> schema = new HashMap<String, String>();
	public static final HashMap<String, String> insert = new HashMap<String, String>();
	public static final HashMap<String, LinkedHashMap<String, TypeConverter>> colDefMap = new HashMap<String, LinkedHashMap<String, TypeConverter>>();
	
	public static void parseSchema(String path) {
		schema.clear();
		insert.clear();
		colDefMap.clear();
		if(StringUtils.isNullOrWhiteSpaces(path)) {
			logger.info("Client doesn't pass in the schema file path.");
			return;
		}
		
		File dir = new File(path);
		File[] directoryListing = dir.listFiles();
		if (directoryListing != null) {
			for (File cql : directoryListing) {
				String fileName = cql.getName();
				if(fileName.endsWith("cql")) {
					logger.debug("Find CQL schema file: " + fileName + " under " + path);
					logger.debug("Start to parse schema from " + fileName);
					FileInputStream fis = null;
					try {
						fis = new FileInputStream(cql);
						byte[] data = new byte[(int) cql.length()];
						fis.read(data);
						fis.close();
						String str = new String(data);
						str = str.toLowerCase();
						
						Pattern p = Pattern.compile("create table [^;]*;");
						Matcher matcher = p.matcher(str);
						String tableSchema = "";
						String tableName = "";
						while (matcher.find()) {
							try {
								// Parse schema
								tableSchema = matcher.group(0).trim();
								tableName = tableSchema.split("\r\n|\n")[0].split(" ")[2].trim();

								String finalTblSchema = "";
								String[] tmpSplitSchema = tableSchema.split("\r\n|\n");
								for(int i=0; i<tmpSplitSchema.length; i++) {
									if(!tmpSplitSchema[i].trim().matches("and .*=.*")) {
										finalTblSchema += tmpSplitSchema[i].trim() + "\n";
									}
								}
								if(!finalTblSchema.endsWith(";")) {
									finalTblSchema += ";";
								}
								
								schema.put(tableName, finalTblSchema.replaceAll("(\\r|\\n|\\t)", ""));
								
								// Parse insert statement
								// Attention: This schema format is based on the format returned by C* desc command
								// TODO find a better way to split the columns rows
								String[] cols = tableSchema.split("\\) with");
								cols = cols[0].split("\n");
								if(cols[cols.length-1].contains("primary key")) {
									cols = Arrays.copyOfRange(cols, 0, cols.length-1);
								}
								StringBuilder colsNameStrBuilder = new StringBuilder();
								StringBuilder colsValueStrBuilder = new StringBuilder();
								for(int i=1; i<cols.length; i++) {
									String col = cols[i].trim();
									if(StringUtils.isNullOrWhiteSpaces(col)) {
										continue;
									}
									col = col.split(" ")[0];
									colsNameStrBuilder.append(col + ",");
									colsValueStrBuilder.append("?,");
								}
								String colsName = colsNameStrBuilder.substring(0, colsNameStrBuilder.length()-1).toString().trim();
								String colsValue =  colsValueStrBuilder.substring(0, colsValueStrBuilder.length()-1).toString().trim();
								String insertStr = String.format("INSERT into %s " + "(%s)" + " VALUES (%s);", tableName, colsName, colsValue);
								insert.put(tableName, insertStr.trim());
								
								// Parse column definition
								LinkedHashMap<String, TypeConverter> colDef = new LinkedHashMap<String, TypeConverter>();
								for(int i=1; i<cols.length; i++) {
									String colStr = cols[i].trim();
									if(StringUtils.isNullOrWhiteSpaces(colStr.trim())) {
										continue;
									}
									String[] colSplits = colStr.split(" ");
									String colName = colSplits[0].trim();
									String colType = "";
									for(int j=1; j<colSplits.length; j++) {
										if(!StringUtils.isNullOrWhiteSpaces(colSplits[j])) {
											colType = colSplits[j].trim();
											break;
										}
									}
									colType = colType.split(",")[0].trim();
									colDef.put(colName, TypeConverter.get(colType.toLowerCase()));
								}
								colDefMap.put(tableName, colDef);
								
								// Generate table definition
								TableDefinition table = new TableDefinition(tableName.split("\\.")[0], tableName.split("\\.")[1]);
								TableDefinition.getDefs().add(table);
							
							} catch (Exception ex) {
								logger.error("Failed to parse for " + tableName + " :" + ExceptionUtils.stackTrace(ex));
							}
						}
					} catch (Exception ex) {
						logger.error("Failed to parse from " + fileName + " :" + ExceptionUtils.stackTrace(ex));
					} finally {
						try {
							if(fis != null) fis.close();
						} catch (Exception ex) {
							logger.error("Failed to close  FileInputStream:" + ExceptionUtils.stackTrace(ex));
						}
					}
				}
			}
		} else {
			// Handle the case where dir is not really a directory.
			// Checking dir.isDirectory() above would not be sufficient
			// to avoid race conditions with another process that deletes
			// directories.
			logger.error(dir + " is not a directory.");
		}
	}
	
	public static void main(String[] args) {
		SchemaParser.parseSchema("./src/main/java/com/cisco/constellation/schema/");
		
		System.out.println(SchemaParser.insert.get("erp.tsd_cnfv2"));
		System.out.println(SchemaParser.schema.get("erp.tsd_cnfv2"));
		System.out.println(SchemaParser.colDefMap.get("erp.tsd_cnfv2"));
	}
}
