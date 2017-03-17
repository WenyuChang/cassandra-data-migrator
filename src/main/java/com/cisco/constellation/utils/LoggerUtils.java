package com.cisco.constellation.utils;

import java.io.OutputStreamWriter;

import org.apache.commons.cli.CommandLine;
import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.FileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.SimpleLayout;

public class LoggerUtils {
	private static Level DEFAULT_LOG_LEVEL = Level.INFO;
	private static final String LOG_PATTERN = "%d{YYYY-MM-dd HH:mm:ss.SSS} [%-5p] [%l] - %m (%r)%n";
	
	public static void initLogger(CommandLine line) {
		Logger rootLogger = Logger.getLogger("com.cisco.constellation");
		rootLogger.setLevel(DEFAULT_LOG_LEVEL);
		
		try {
			// Prepare logger
			if(line.hasOption("l")) {
				String logLevel = line.getOptionValue("l");
				rootLogger.setLevel(Level.toLevel(logLevel, DEFAULT_LOG_LEVEL));
			}
			
			if(line.hasOption("lp")) {
				String logPath = line.getOptionValue("lp");
				FileAppender fileA = new FileAppender(new SimpleLayout(), logPath);
				fileA.setLayout(new PatternLayout(LOG_PATTERN));
				rootLogger.addAppender(fileA);
			} else {
				ConsoleAppender consoleA = new ConsoleAppender();
				consoleA.setWriter(new OutputStreamWriter(System.out));
				consoleA.setLayout(new PatternLayout(LOG_PATTERN));
				rootLogger.addAppender(consoleA);
			}
			
		} catch (Exception ex) {
			
		}
	}
}
