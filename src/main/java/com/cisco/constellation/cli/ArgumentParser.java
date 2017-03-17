package com.cisco.constellation.cli;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

/**
 * Created by Wenyu on 01/06/15.
 */
public class ArgumentParser {
	private static CommandLineParser parser = new DefaultParser();
	private static Options options = new Options();
	
	public static CommandLine parse(String[] args) {
		Option help = new Option("h", "help", false, "print help message" );
		options.addOption(help);
		
		Option optionActionTypeGen = Option.builder("gen")
				.longOpt("generate-sstable")
				.desc("Action Type: Generate SSTable files")
				.build();
		options.addOption(optionActionTypeGen);
		
		Option optionActionTypeImport = Option.builder("import")
				.longOpt("import-sstable")
				.desc("Action Type: Import SSTable files into existence C*")
				.build();
		options.addOption(optionActionTypeImport);
		
		Option optionIpAddr = Option.builder("ipaddr")
				.longOpt("import-address")
				.hasArg()
				.desc("The ip address of C* nodes to load SSTables. <ip1,ip2,ip3...>")
				.argName("IP").build();
		options.addOption(optionIpAddr);
		
		Option authIpAddr = Option.builder("auth")
				.hasArg()
				.desc("The username and password to do the importing. [username:password]")
				.argName("USERNAME:PASSWORD").build();
		options.addOption(authIpAddr);
		
		Option optionSrcType = Option.builder("st")
				.longOpt("source-type")
				.hasArg()
				.desc("Data source type. [CSV]")
				.argName("SOURCE-TYPE").build();
		options.addOption(optionSrcType);
		
		Option optionSiteType = Option.builder("site")
				.longOpt("site-name")
				.hasArg()
				.desc("Site name. [FOC]")
				.argName("SITE-NAME").build();
		options.addOption(optionSiteType);
		
		Option optionSrc = Option.builder("src")
				.longOpt("source")
				.hasArg()
				.desc("source")
				.argName("SOURCE").build();
		options.addOption(optionSrc);
		
		Option optionDest = Option.builder("dest")
				.longOpt("destation")
				.hasArg()
				.desc("destation")
				.argName("DESTATION").build();
		options.addOption(optionDest);
		
		Option optionSchema = Option.builder("schema")
				.longOpt("schema-path")
				.hasArg()
				.desc("The path of schema cql files to be parse.")
				.argName("SCHEMA-PATH").build();
		options.addOption(optionSchema);
		
		Option optionLog = Option.builder("l")
				.longOpt("log")
				.hasArg()
				.desc("Log level")
				.argName("LEVEL").build();
		options.addOption(optionLog);
		
		Option optionLogPath = Option.builder("lp")
				.longOpt("log-path")
				.hasArg()
				.desc("The log file path.")
				.argName("LOG-PATH").build();
		options.addOption(optionLogPath);
	
		try {
		    CommandLine line = parser.parse( options, args );
		    if(line.hasOption("h")) showHelp(true);
		    return line;
		} catch(ParseException ex) {
		    showHelp(true);
		}
		return null;
	}
	
	private static void showHelp(boolean exit) {
		HelpFormatter formater = new HelpFormatter();
    	formater.printHelp("java -jar SSTableGenerator -st <source_type> -src <source_path> [-dest dest_path]", options);
    	if(exit) System.exit(0);
	}
}
