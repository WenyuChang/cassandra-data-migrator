package com.cisco.constellation.utils;

import java.io.PrintWriter;
import java.io.StringWriter;

public class ExceptionUtils {
	public static String stackTrace(Exception ex) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		ex.printStackTrace(pw);
		return sw.toString();
	}
}
