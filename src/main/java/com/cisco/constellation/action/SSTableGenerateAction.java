package com.cisco.constellation.action;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.cassandra.config.Config;
import org.apache.cassandra.io.sstable.CQLSSTableWriter;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.log4j.Logger;

import com.cisco.constellation.cli.SourceType;
import com.cisco.constellation.schema.SchemaParser;
import com.cisco.constellation.schema.TableDefinition;
import com.cisco.constellation.srcparser.ISourceLine;
import com.cisco.constellation.srcparser.ISourceParser;
import com.cisco.constellation.utils.ExceptionUtils;
import com.cisco.constellation.utils.LoggerUtils;
import com.cisco.constellation.utils.StringUtils;

/**
 * Created by Wenyu on 09/06/15.
 */
public class SSTableGenerateAction {
	private final static Logger logger = Logger.getLogger(SSTableGenerateAction.class);
	private static final String DEFAULT_OUTPUT_DIR = "./data";
	
	public static void execute(CommandLine line) {
		String srcType = line.getOptionValue("st", "CSV").toUpperCase();
		ISourceParser parser = SourceType.getSourceParser(srcType);
		if(parser == null) {
			logger.error("Failed to get source parser: " + srcType);
			System.exit(1);
		}
		
		String site = line.getOptionValue("site", "").toUpperCase();
		
		// Parse schema
		SchemaParser.parseSchema(line.getOptionValue("schema", null));
		
		String dest = line.getOptionValue("dest", DEFAULT_OUTPUT_DIR);
		List<Pair<String, ISourceLine>> errorLines = new ArrayList<Pair<String, ISourceLine>>();
		long entireStartTime = System.currentTimeMillis();
		for(int i=0; i<TableDefinition.getDefs().size(); i++) {
			logger.info("Start to generate " + TableDefinition.getDefs().get(i).keyspace + "." + TableDefinition.getDefs().get(i).table);			
			long startTime = System.currentTimeMillis();
			
			TableDefinition def = TableDefinition.getDefs().get(i);
			boolean prepareResult = parser.prepare(line, def);
			if(!prepareResult) {
				continue;
			}
			
			// Prepare output directory.
			File outputDir = new File(dest + File.separator + def.keyspace + File.separator + def.table);
			if (!outputDir.exists() && !outputDir.mkdirs()) {
				logger.error("Cannot create output directory: " + outputDir);
				continue;
			}
			
			if(StringUtils.isNullOrWhiteSpaces(def.getSchema())) {
				logger.error("Failed to generate data for table: " + def.keyspace + "." + def.table);
				continue;
			}
			if(StringUtils.isNullOrWhiteSpaces(def.getInsert())) {
				logger.error("Failed to generate data for table: " + def.keyspace + "." + def.table);
				continue;
			}
			
			// TODO Workaround for test_results table
			if("test_results".equals(def.table)) {
				List<Pair<String, ISourceLine>> tmpErrLines = SSTableGeneratorActionForTST.execute(parser, def, outputDir, site);
				if(tmpErrLines!=null && tmpErrLines.size()>0) {
					errorLines.addAll(tmpErrLines);
				}
				long endTime = System.currentTimeMillis();
				logger.info("Finish to generate " + def.key 
						+ ". Total row count is " + parser.getLineCount()
						+ ". And it takes " + (endTime-startTime) + "ms.");
				continue;
			}
			
			CQLSSTableWriter writer = null;
			try {
				Config.setClientMode(true);
				CQLSSTableWriter.Builder builder = CQLSSTableWriter.builder();
				logger.debug(def.getSchema());
				logger.debug(def.getInsert());
				builder.inDirectory(outputDir).forTable(def.getSchema()).using(def.getInsert());
				writer = builder.build();
			} catch (Exception ex) {
				logger.error("Failed to initialize CQLSStableWriter for " + def.key + ": " + ExceptionUtils.stackTrace(ex));
				continue;
			}
			
			Iterator<ISourceLine> it = parser.parse();
			if(it == null) {
				logger.error("Failed to parse source for " + def.key);
				continue;
			}
			
			ISourceLine srcLine = null;
			while (it.hasNext()) {
				try {
					srcLine = it.next();
					if(srcLine != null) {
						logger.debug(srcLine.toString());
						HashMap<String, Object> valueMap = srcLine.getLineResult();
						if(valueMap != null) {
							writer.addRow(valueMap);
						}
					}
				} catch (Exception ex) {
					errorLines.add(new ImmutablePair<String, ISourceLine>(def.key, srcLine));
					logger.error("Failed to write row for table " + def.key + ": " + srcLine);
					logger.error("Failed to write row for table " + def.key + ": " + ExceptionUtils.stackTrace(ex));
				}
			}
			
			try {
				writer.close();
			} catch (Exception ex) {
				logger.error(ExceptionUtils.stackTrace(ex));
			}
			
			long endTime = System.currentTimeMillis();
			logger.info("Finish to generate " + def.key 
					+ ". Total row count is " + parser.getLineCount()
					+ ". And it takes " + (endTime-startTime) + "ms.");
		}

		int errorLineCount = 0;
		if(errorLines!=null && errorLines.size()>0) {
			logger.error("##################################################################");
			logger.error("Following it error lines: " + errorLines.size());
			errorLineCount = errorLines.size();
			for(Pair<String, ISourceLine> pair : errorLines) {
				if(pair.getLeft()!=null && pair.getRight()!=null) {
					logger.error(pair.getLeft() + ": " + pair.getRight().toString());
				}
			}
			logger.error("##################################################################");
		}
		
		long entireEndTime = System.currentTimeMillis();
		logger.info("Finish generating sstalbes. "
				+ "And it takes " + (entireEndTime-entireStartTime)/1000 + "s. "
				+ "And there are " + errorLineCount + " error writes.");
	}
}
