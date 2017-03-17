package com.cisco.constellation;

import org.apache.commons.cli.CommandLine;
import org.apache.log4j.Logger;

import com.cisco.constellation.action.SSTableGenerateAction;
import com.cisco.constellation.action.SSTableImportAction;
import com.cisco.constellation.cli.ArgumentParser;
import com.cisco.constellation.utils.LoggerUtils;

/**
 * Created by Wenyu on 01/06/15.
 */
public class SSTableGenerator {
	private final static Logger logger = Logger.getLogger(SSTableGenerator.class);

	public static void main(String[] args) {
		// Parse arguments
		CommandLine line = ArgumentParser.parse(args);
		// Initialize logger
		LoggerUtils.initLogger(line);
		
		if(line.hasOption("gen")) {
			logger.info("Start to generate SSTable files.");
			SSTableGenerateAction.execute(line);
		} else if(line.hasOption("import")) {
			logger.info("Start to import SSTable files into existence C*");
			SSTableImportAction.execute(line);
		}
	}
}
