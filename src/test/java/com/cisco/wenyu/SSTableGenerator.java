package com.cisco.wenyu;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import org.apache.cassandra.config.Config;
import org.apache.cassandra.io.sstable.CQLSSTableWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by wenyu on 12/03/15.
 */

public class SSTableGenerator {
	private final static Logger logger = LoggerFactory.getLogger(SSTableGenerator.class);

	private final static String KEYSPACE = "mfgprod1";
	private final static String TABLE = "test_results";

	private final static String SCHEMA = String.format("CREATE TABLE %s.%s ("
			+ "sernum         text," 
			+ "rectime        timestamp,"
			+ "machine        text," 
			+ "area           text,"
			+ "uuttype        text," 
			+ "passfail       text,"
			+ "bfstatus       text," 
			+ "mode           text,"
			+ "parentsernum   text," 
			+ "server         text,"
			+ "tst_id 		  timestamp,"
			+ "attributes     map <text,text>,"
			+ "primary key ((sernum),rectime))"
			+ "with clustering order by (rectime desc);", KEYSPACE, TABLE);

	// We would want to insert all the columns we have data for
	// this one is based on the sample data I have from the Jan onsite.
	private final static String INSERT = String
			.format("INSERT into %s.%s "
					+ "(sernum, rectime, area, attributes, bfstatus, machine, mode, parentsernum, passfail, server, uuttype) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?) USING TTL ?", KEYSPACE, TABLE);

	// directory we will create the SSTables in
	// They will have the same layout at the ones created by the Cassandra
	// storage engine
	// KEYSPACE/TABLE/SSTABLE
	public static final String DEFAULT_OUTPUT_DIR = "./data";

	// Used to parse the data from the CSV file, expecting 2014-05-14 12:28:23
	public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static void execute(String[] args) {		
//		if (args.length!=1 && args.length!=2) {
//			System.out.println("usage: java -jar SSTableGenerator <source_path> [dest_path]");
//			return;
//		}

		// Ensure the source file exists.
		// File inputFile = new File(args[0].trim());
//		if (!inputFile.exists()) {
//			throw new RuntimeException("Cannot find input file: " + inputFile);
//		}
		
		// Integer ttl = Integer.valueOf(args[0].trim());
		Integer ttl = 100;

		System.out.println(SCHEMA);
		
		String destPath = DEFAULT_OUTPUT_DIR;
		if(args.length == 2) {
			destPath = args[1].trim();
		}
		
		// Ensure the output directory exists.
		File outputDir = new File(destPath + File.separator + KEYSPACE + File.separator + TABLE);
		if (!outputDir.exists() && !outputDir.mkdirs()) {
			throw new RuntimeException("Cannot create output directory: " + outputDir);
		}

		// Setting 'client mode' means that all configuration is set back to
		// defaults as
		// defined in org.apache.cassandra.config.DatabaseDescriptor
		//
		// The ramifications of *not* setting this option from the context of a
		// tool could, depending on configuration
		// cause the process to attempt to join the ring as a new node.
		//
		// Most tools in the Cassandra src package set this option unless they
		// require access to specific runtime
		// configurations.
		Config.setClientMode(true);

		// Create the write we need
		// use the default buffer size of 128 MB, this is how much it will put
		// in memmory before flushing to disk.
		CQLSSTableWriter.Builder builder = CQLSSTableWriter.builder();
		builder.inDirectory(outputDir).forTable(SCHEMA).using(INSERT);

		CQLSSTableWriter writer = builder.build();
		Timestamp start = new Timestamp(new Date().getTime());

		// CsvFileIterator it = CsvFileIterator.instance(inputFile);
		int count = 100;
		try {
			while (count-- > 0) {
				// CsvFileLine line = it.next();
				writer.addRow(
						UUID.randomUUID().toString(),
						new Date(), 
						"area" + count,
						new HashMap<String, String>(), 
						"bfstat" + count, 
						"machine" + count,
						"mode" + count, 
						"parentsernum" + count, 
						"Y",
						"server" + count, 
						"uuttype" + count,
						ttl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				writer.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Timestamp point = new Timestamp(new Date().getTime());
			double diff = (double) point.getTime()/1000 - start.getTime()/1000;
			System.out.println("Total time: " + diff);
		}
		System.out.println("Files written to: " + outputDir);

	}
}
