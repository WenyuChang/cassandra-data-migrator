package com.cisco.constellation.cli;

import com.cisco.constellation.srcparser.ISourceParser;
import com.cisco.constellation.srcparser.CSVParser.CSVSourceParser;

/**
 * Created by Wenyu on 01/06/15.
 */
public enum SourceType {
	CSV(new CSVSourceParser());
	
	private ISourceParser parser;
	private SourceType(ISourceParser parser) {
		this.parser = parser;
	}
	public ISourceParser getSourceParser() {
		return parser;
	}
	
	public static ISourceParser getSourceParser(String type) {
		try {
			SourceType srcType = SourceType.valueOf(type);
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
