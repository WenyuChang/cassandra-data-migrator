package com.cisco.constellation.schema;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;





import java.util.Set;
import java.util.TimeZone;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import com.cisco.constellation.srcparser.CSVParser.CsvSourceLine;
import com.cisco.constellation.utils.ExceptionUtils;
import com.cisco.constellation.utils.StringUtils;
import com.google.common.base.CharMatcher;
import com.google.common.base.Splitter;
import com.google.gson.GsonBuilder;

/**
 * Created by Wenyu on 01/06/15.
 */
public enum TypeConverter {
	NULL {
		@Override
		public Object convert(String colName, String strVal) {
			return null;
		}
	}, 
	
	INT {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return null;
			}
			try {
				if(strVal.contains(".")) {
					double tmpDouble = Double.parseDouble(strVal);
					Integer intResult = (int) tmpDouble;
					return intResult;
				} else {	
					return Integer.parseInt(strVal);
				}
			} catch (Exception ex) {
				logger.error("Failed to convert '" + strVal + "' to INT. The column is " + colName);
				logger.error(ExceptionUtils.stackTrace(ex));
				return null;
			}
		}
	},
	
	BIGINT {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return null;
			}
			try {
				return Long.parseLong(strVal);
			} catch (Exception ex) {
				logger.error("Failed to convert '" + strVal + "' to Long. The column is " + colName);
				logger.error(ExceptionUtils.stackTrace(ex));
				return null;
			}
		}
	},
	
	BOOLEAN {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return null;
			}
			try {
				return Boolean.parseBoolean(strVal);
			} catch (Exception ex) {
				logger.error("Failed to convert '" + strVal + "' to Boolean. The column is " + colName);
				logger.error(ExceptionUtils.stackTrace(ex));
				return null;
			}
		}
	},
	
	TEXT {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return "";
			}
			return strVal;
		}
	},
	
	SET {
		@Override
		public Object convert(String colName, String strVal) {
			Set<String> result = new HashSet<String>();
			// set(['DECLARED', 'DERIVED'])
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return result;
			}
			
			Pattern p = Pattern.compile("'[^']*'");
			Matcher matcher = p.matcher(strVal);
			while (matcher.find()) {
				String item = matcher.group(0).trim();
				if("''".equals(item)) {
					result.add("");
				} else {
					result.add(item.substring(1, item.length()-1));
				}
			}
			return result;
		}
	},
	
	TIMESTAMP {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				// Workaround for column "cas_timestamp"
				if(colName.toLowerCase().contains(".cas_timestamp")) {
					return new Date();
				}
				
				return null;
			}
			final String[] dateStringPatterns = new String[] {
		            "yyyy-MM-dd HH:mm:ss",
		            "yyyy-MM-dd HH:mm:ss.SSSXXX",
		            "yyyy-MM-dd HH:mm:ss.SSSXX",
		            "yyyy-MM-dd HH:mm:ss.SSSX",
		            "yyyy-MM-dd HH:mm:ss.SSS",
		            "yyyy-MM-dd HH:mm:ssXXX",
		            "yyyy-MM-dd HH:mm:ssXX",
		            "yyyy-MM-dd HH:mm:ssX",
		            "yyyy-MM-dd HH:mmXXX",
		            "yyyy-MM-dd HH:mm",
		            "yyyy-MM-dd HH:mmX",
		            "yyyy-MM-dd HH:mmXX",
		            "yyyy-MM-dd'T'HH:mm:ss.SSSXXX",
		            "yyyy-MM-dd'T'HH:mm:ss.SSSXX",
		            "yyyy-MM-dd'T'HH:mm:ss.SSSX",
		            "yyyy-MM-dd'T'HH:mm:ss.SSS",
		            "yyyy-MM-dd'T'HH:mm:ssXXX",
		            "yyyy-MM-dd'T'HH:mm:ssXX",
		            "yyyy-MM-dd'T'HH:mm:ssX",
		            "yyyy-MM-dd'T'HH:mm:ss",
		            "yyyy-MM-dd'T'HH:mmXXX",
		            "yyyy-MM-dd'T'HH:mmXX",
		            "yyyy-MM-dd'T'HH:mmX",
		            "yyyy-MM-dd'T'HH:mm",
		            "yyyy-MM-dd"};

			for (String pattern : dateStringPatterns) {
				try {
					SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(pattern);
					Date date = DATE_FORMAT.parse(strVal);
					return date;
				} catch (Exception ex) {}
			}
			return null;
		}
	},
	
	MAP {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return new HashMap<String, Object>();
			}
			if("{}".equals(strVal.trim())) {
				return new HashMap<String, Object>();
			}
			
			final char COMMA = ',';
			final String COLON = ":";
			final char MATCH = '\'';
			final char OPEN_BRACKET = '{';
			final char CLOSE_BRACKET = '}';
			
			HashMap<String, Object> mapCol = new HashMap<String, Object>();
			try {
				for (String val : Splitter.on(COMMA).trimResults().omitEmptyStrings().split(strVal)) {
					List<String> list = Splitter.on(COLON).splitToList(val);
					mapCol.put(
							CharMatcher.is(MATCH).or(CharMatcher.is(OPEN_BRACKET)).removeFrom(list.get(0)),
							CharMatcher.is(MATCH).or(CharMatcher.is(CLOSE_BRACKET)).removeFrom(list.get(1))
							);
				}
			} catch (Exception ex) {
				try {
					mapCol = (HashMap<String, Object>) MAP1.convert(colName, strVal);
				} catch (Exception e) {
					logger.error("Failed to convert '" + strVal + "' to MAP. The column is " + colName);
					logger.error(ExceptionUtils.stackTrace(e));
				}
			}
			return mapCol;
		}
	},
	
	MAP1 {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return new HashMap<String, Object>();
			}
			if("{}".equals(strVal.trim())) {
				return new HashMap<String, Object>();
			}
			if(!strVal.startsWith("{") || !strVal.endsWith("}")) {
				// logger.error("Failed to convert '" + strVal + "' to MAP. The column is " + colName);
				return new HashMap<String, Object>();
			}
			
			final char COMMA = ',';
			final String COLON = ":";
			final char MATCH = '\'';
			final char OPEN_BRACKET = '{';
			final char CLOSE_BRACKET = '}';
			
			HashMap<String, Object> mapCol = new HashMap<String, Object>();
			strVal = strVal.substring(1, strVal.length()-1);
			Pattern p = Pattern.compile("(u'[^']*': u'[^']*')");
			Matcher matcher = p.matcher(strVal);
			while (matcher.find()) {
				String item = matcher.group(0).trim();
				Pattern p1 = Pattern.compile("'[^']*'");
				Matcher m1 = p1.matcher(item);
				String key = "";
				String value = "";
				int count = 0;
				while(m1.find()) {
					if(count == 0) {
						key = m1.group(0).trim();
						key = key.substring(1, key.length()-1);
					} else if(count == 1) {
						value = m1.group(0).trim();
						value = value.substring(1, value.length()-1);
					}
					count ++;
				}
				if(count == 2) {
					mapCol.put(key, value);
				}
			}

			return mapCol;
		}
	},
	
	TIMEUUID {
		@Override
		public Object convert(String colName, String strVal) {
			if(StringUtils.isNullOrWhiteSpaces(strVal)) {
				return null;
			}
			
			try {
				return UUID.fromString(strVal);
			} catch (Exception ex) {
				logger.error("Failed to convert '" + strVal + "' to TIMEUUID. The column is " + colName);
				logger.error(ExceptionUtils.stackTrace(ex));
				return null;
			}
		}
		
	},
	
	BLOB {
		@Override
		public Object convert(String colName, String strVal) {
			return strVal;
		}
	};
	
	private final static Logger logger = Logger.getLogger(TypeConverter.class);
	public abstract Object convert(String colName, String strVal);
	public static TypeConverter get(String key) {
		if("int".equals(key)) {
			return INT;
		} else if("bigint".equals(key)) {
			return BIGINT;
		} else if("boolean".equals(key)) {
			return BOOLEAN;
		} else if("text".equals(key)) {
			return TEXT;
		} else if("timestamp".equals(key)) {
			return TIMESTAMP;
		} else if("timeuuid".equals(key)) {
			return TIMEUUID;
		} else if(key!=null && key.contains("map")) {
			return MAP;
		} else if(key!=null && key.contains("set")) {
			return SET;
		} else if(key!=null && key.contains("blob")) {
			return BLOB;
		} else {
			logger.warn("Failed to find the column type: " + key);
			return NULL;
		}
	}
}
