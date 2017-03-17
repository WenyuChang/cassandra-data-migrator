package com.cisco.constellation.srcparser.CSVParser;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.cisco.constellation.schema.TableDefinition;
import com.cisco.constellation.schema.TypeConverter;
import com.cisco.constellation.srcparser.ISourceLine;
import com.google.common.base.Objects;
import com.google.common.base.Objects.ToStringHelper;

/**
 * Created by Wenyu on 01/06/15.
 */
public class CsvSourceLine implements ISourceLine {	
	private final static Logger logger = Logger.getLogger(CsvSourceLine.class);
	
	private HashMap<String, Object> lineResult;
	public HashMap<String, Object> getLineResult() {
		return lineResult;
	}
	
	public CsvSourceLine instance(List<String> line, String table) {
		lineResult = new HashMap<String, Object>();
		
		TableDefinition def = TableDefinition.findByTable(table);
		if(def == null) {
			logger.error("Failed to get definition for table: " + table);
			return null;
		}
		
		LinkedHashMap<String, TypeConverter> colDef = def.getColumnDef();
		Iterator<Map.Entry<String, TypeConverter>> it = colDef.entrySet().iterator();
		int idx = 0;
		while(it.hasNext()) {
			Map.Entry<String, TypeConverter> entry = it.next();
			String colName = entry.getKey();
			TypeConverter converter = entry.getValue();
			
			if(idx < line.size()) {
				// Workaround for csv files containing multiply column name row
				if(colName.equals(line.get(idx))) {
					idx++;
					continue;
				}
				
				lineResult.put(colName, converter.convert(table+"."+colName, line.get(idx++)));
			} else {
				lineResult.put(colName, converter.convert(table+"."+colName, null));
			}
			
			
		}
		if(lineResult.size() == 0) {
			return null;
		}
		return this;
	}

	@Override
	public String toString() {
		if(lineResult == null) {
			return "";
		}
		
		ToStringHelper helper = Objects.toStringHelper(this);
		for(String key : lineResult.keySet()) {
			helper.add(key, lineResult.get(key));
		}
		
		return helper.toString();
	}
}
