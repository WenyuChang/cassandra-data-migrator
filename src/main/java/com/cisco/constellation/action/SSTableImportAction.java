package com.cisco.constellation.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.log4j.Logger;

import com.cisco.constellation.utils.ExceptionUtils;
import com.cisco.constellation.utils.StringUtils;

/**
 * Created by Wenyu on 09/06/15.
 */
public class SSTableImportAction {
	private final static Logger logger = Logger.getLogger(SSTableImportAction.class);
	public static void execute(CommandLine line) {
		if(!line.hasOption("src")) {
			logger.error("Source path is not specified.");
			return;
		}
		
		if(!line.hasOption("ipaddr")) {
			logger.error("C* ip addresses are not specified.");
			return;
		}
		
		String path = line.getOptionValue("src");
		File dir = new File(path);
		if(!dir.exists()) {
			logger.error("Source path does not exist.");
			return;
		}
		
		String ips = line.getOptionValue("ipaddr");
		if(StringUtils.isNullOrWhiteSpaces(ips)) {
			logger.error("C* ip addresses are not specified.");
			return;
		}
		
		String username = "";
		String password = "";
		String auth = line.getOptionValue("auth");
		if(!StringUtils.isNullOrWhiteSpaces(auth)) {
			String[] auths = auth.split(":");
			if(auths.length != 2) {
				logger.error("Wrong auth string.");
				return;
			} else {
				username = auths[0];
				password = auths[1];
			}
		}
		
		Long entireStartTime = System.currentTimeMillis();
		File[] directoryListing = dir.listFiles();
		if (directoryListing != null) {
			for (File keyspaceFolder : directoryListing) {
				if(keyspaceFolder.isDirectory()) {
					for(File tableFolder : keyspaceFolder.listFiles()) {
						if(tableFolder.isDirectory()) {
							logger.debug("Start to import " + keyspaceFolder.getName() + "." + tableFolder.getName());
							Long startTime = System.currentTimeMillis();
							String table = tableFolder.getAbsolutePath();
							String authOp = "";
							if(!StringUtils.isNullOrWhiteSpaces(username) && !StringUtils.isNullOrWhiteSpaces(password)) {
								authOp = "-u " + username + " -pw " + password;
							}
							String cmd = "sstableloader -d " + ips + " " + authOp + " " + table;
							logger.debug("Going to execute " + cmd);
							org.apache.commons.exec.CommandLine cmdLine = org.apache.commons.exec.CommandLine.parse(cmd);
							DefaultExecutor executor = new DefaultExecutor();
							executor.setExitValue(0); //Define the exit value of "0" to be considered as successful execution.
							try {
								int exitValue = executor.execute(cmdLine);
								logger.debug("Exit Value: " + exitValue);
							} catch (Exception ex) {
								logger.error("Failed to execute " + cmd);
								logger.error(ExceptionUtils.stackTrace(ex));
							}
							Long endTime = System.currentTimeMillis();
							logger.info("Finish to import " + keyspaceFolder.getName() + "." + tableFolder.getName() 
									+ ". And it takes " + (endTime-startTime)/1000 + "s to load " + humanReadableByteCount(folderSize(tableFolder),false) + " data.");
						}
					}
				}
			}
		}

		Long entireEndTime = System.currentTimeMillis();
		logger.info("Finish to import all the data." 
				+ " And it takes " + (entireEndTime-entireStartTime)/1000 + "s to load " + humanReadableByteCount(folderSize(dir),false) + " data.");
	}
	
	private static long folderSize(File directory) {
	    long length = 0;
	    for (File file : directory.listFiles()) {
	        if (file.isFile())
	            length += file.length();
	        else
	            length += folderSize(file);
	    }
	    return length;
	}
	
	private static String humanReadableByteCount(long bytes, boolean si) {
	    int unit = si ? 1000 : 1024;
	    if (bytes < unit) return bytes + " B";
	    int exp = (int) (Math.log(bytes) / Math.log(unit));
	    String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp-1) + (si ? "" : "i");
	    return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
	}
}
