package com.cisco.constellation.cli;

import com.cisco.constellation.srcparser.ISourceParser;
import com.cisco.constellation.srcparser.CSVParser.CSVSourceParser;

/**
 * Created by Wenyu on 01/06/15.
 */
public enum AsyncSourceType {
	CSV(CSVSourceParser.class);
	
	private Class<? extends ISourceParser> clz;
	private AsyncSourceType(Class<? extends ISourceParser> clz) {
		this.clz = clz;
	}
	public ISourceParser getSourceParser() {
		try {
			ISourceParser parser = clz.newInstance();
			return parser;
		} catch(Exception ex) {
			return null;
		}
	}
	
	public static ISourceParser getSourceParser(String type) {
		try {
			AsyncSourceType srcType = AsyncSourceType.valueOf(type);
			if(srcType != null) {
				return srcType.getSourceParser();
			} else {
				return null;
			}
		} catch (Exception ex) {
			return null;
		}
	}
}
