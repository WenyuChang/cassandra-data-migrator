package com.cisco.constellation.srcparser.CSVParser;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;

import org.apache.commons.cli.CommandLine;
import org.apache.log4j.Logger;
import org.supercsv.io.CsvListReader;
import org.supercsv.prefs.CsvPreference;

import com.cisco.constellation.schema.SchemaParser;
import com.cisco.constellation.schema.TableDefinition;
import com.cisco.constellation.schema.TypeConverter;
import com.cisco.constellation.srcparser.ISourceLine;
import com.cisco.constellation.srcparser.ISourceParser;
import com.cisco.constellation.utils.ExceptionUtils;

/**
 * Created by Wenyu on 01/06/15.
 */
public class CSVSourceParser implements ISourceParser {
	private final static Logger logger = Logger.getLogger(CSVSourceParser.class);

	public final char QUOTE_CHAR = '"';
	public final char DELIMITER_CHAR = ',';
	public final String END_OF_LINE_SYMBOLS = "\r\n";
	public final boolean HAS_TITLE = true;
	
	private File inputFile;
	private CsvListReader csvReader;
    private List<String> line;
    private TableDefinition def;
    public long lineNumber = 0;
    
	public Iterator<ISourceLine> parse() {
		if(csvReader == null) {
			logger.error("CSV reader is null.");
			return null;
		} else {
			return iterator();
		}
	}

	public boolean prepare(CommandLine cli, TableDefinition def) {
		if(!cli.hasOption("src")) {
			logger.error("Source path is not specified.");
			return false;
		}
		this.def = def;
		
		String srcPath = cli.getOptionValue("src") + File.separator + def.table;
		inputFile = new File(srcPath);
		if (!inputFile.exists()) {
			srcPath += ".csv";
			inputFile = new File(srcPath);
			if(!inputFile.exists()) {
				logger.info("Don't need to load data for " + def.table + " as it's data file doesn't exist.");
				return false;
			}
		}

		CsvPreference csvPreference = new CsvPreference.Builder(QUOTE_CHAR, DELIMITER_CHAR, END_OF_LINE_SYMBOLS).build();
        try {
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            csvReader = new CsvListReader(reader, csvPreference);
        } catch (Exception ex) {
            logger.error(ExceptionUtils.stackTrace(ex));
            return false;
        }
        
        lineNumber = 0;
		return true;
	}

	public boolean hasNext() {
		try {
			if(HAS_TITLE && lineNumber == 0) {
				// Re-order the column order of table definition
				line = csvReader.read();
				LinkedHashMap<String, TypeConverter> map = def.getColumnDef();
				LinkedHashMap<String, TypeConverter> orderedMap = new LinkedHashMap<String, TypeConverter>();
				for(String col : line) {
					if(map.containsKey(col)) {
						orderedMap.put(col, map.get(col));
					}
				}
				
				// Add the missing columns which is not provided in CSV files
				for(Entry<String, TypeConverter> colEntry : map.entrySet()) {
					String colName = colEntry.getKey();
					TypeConverter converter = colEntry.getValue();
					if(!orderedMap.containsKey(colName)) {
						orderedMap.put(colName, converter);
					}
				}
				
				SchemaParser.colDefMap.put(def.key, orderedMap);
			}
            line = csvReader.read();
        } catch (IOException ioe) {
            ioe.printStackTrace();
            ioe.printStackTrace();
        }

        return line != null;
	}

	public ISourceLine next() {
		lineNumber++;
		CsvSourceLine currLine = new CsvSourceLine().instance(line, def.table);
		while(currLine==null && hasNext()) {
			currLine = new CsvSourceLine().instance(line, def.table);
		}
		if(currLine == null) {
			lineNumber--;
		}
		return currLine;
	}

	public void remove() {
		// TODO Auto-generated method stub
	}

	public Iterator<ISourceLine> iterator() {
		return this;
	}
	
	public long getLineCount() {
		return lineNumber;
	}
	
}
