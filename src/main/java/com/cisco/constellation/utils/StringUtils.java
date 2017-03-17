package com.cisco.constellation.utils;

public class StringUtils {
	public static boolean isNullOrWhiteSpaces(String str) {
		if(str == null) {
			return true;
		}
		
		return str.trim().length() == 0;
	}
}
