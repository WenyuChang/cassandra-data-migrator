package com.cisco.constellation.schema;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * Created by Wenyu on 01/06/15.
 */
public class TableDefinition {
	private final static Logger logger = Logger.getLogger(TableDefinition.class);
	private static List<TableDefinition> defs = new ArrayList<TableDefinition>();
	public String keyspace;
	public String table;
	public String key;

	public TableDefinition(String keyspace, String table) {
		this.keyspace = keyspace;
		this.table = table;
		this.key = keyspace + "." + table;
	}
	
	public static List<TableDefinition> getDefs() {
		return defs;
	}
	
	public static TableDefinition findByTable(String table) {
		for(TableDefinition tableDef : defs) {
			if(tableDef.table.equals(table)) {
				return tableDef;
			}
		}
		
		return null;
	}
	
	public LinkedHashMap<String, TypeConverter> getColumnDef() {
		if (SchemaParser.colDefMap.containsKey(key)) {
			logger.debug("Get " + key + "'s column definition from schema files.");
			return SchemaParser.colDefMap.get(key);
		} else {
			logger.debug("Get " + key + "'s column definition from pre-defined schema.");
			return null;
		}
	}
	
	public String getSchema() {
		if (SchemaParser.schema.containsKey(key)) {
			logger.debug("Get " + key + "'s schema from schema files.");
			return SchemaParser.schema.get(key);
		} else {
			logger.debug("Get " + key + "'s schema from pre-defined schema.");
			return null;
		}
	}

	public String getInsert() {
		if (SchemaParser.insert.containsKey(key)) {
			logger.debug("Get " + key + "'s insert statement from schema files.");
			return SchemaParser.insert.get(key);
		} else {
			logger.debug("Get " + key + "'s insert statement from pre-defined schema.");
			return null;
		}
	}
}
