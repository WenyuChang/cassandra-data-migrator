package com.cisco.constellation.action;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;
import java.util.UUID;

import org.apache.cassandra.config.Config;
import org.apache.cassandra.io.sstable.CQLSSTableWriter;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cisco.constellation.schema.TableDefinition;
import com.cisco.constellation.srcparser.ISourceLine;
import com.cisco.constellation.srcparser.ISourceParser;
import com.cisco.constellation.utils.ExceptionUtils;

/**
 * Created by wenyu on 12/03/15.
 */

public class SSTableGeneratorActionForTST {
	private final static Logger logger = LoggerFactory.getLogger(SSTableGeneratorActionForTST.class);
	private final static String KEYSPACE = "mfgprod";
	private final static String TABLE = "test_results";
	private final static int DEFAULT_TTL = 63072000; // 2 years
	private final static String SOURCE_TEMPLATE = "CMASDI-%sDC";

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
			+ "tst_id 		  timestamp,"
			+ "site_id 		  int,"
			+ "source         text,"
			+ "tsd_timestamp  timestamp,"
			+ "attributes     text,"
			+ "primary key ((sernum),rectime))"
			+ "with clustering order by (rectime desc);", KEYSPACE, TABLE);

	private final static String INSERT = String
			.format("INSERT into %s.%s "
					+ "(sernum, rectime, machine, area, uuttype, passfail, bfstatus, mode, parentsernum, tst_id, site_id, source, tsd_timestamp, attributes) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?) USING TTL ?", KEYSPACE, TABLE);

	public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static List<Pair<String, ISourceLine>> execute(ISourceParser parser, TableDefinition def , File outputDir, String site) {
		CQLSSTableWriter writer = null;
		try {
			Config.setClientMode(true);
			CQLSSTableWriter.Builder builder = CQLSSTableWriter.builder();
			builder.inDirectory(outputDir).forTable(SCHEMA).using(INSERT);
			writer = builder.build();
		} catch (Exception ex) {
			logger.error("Failed to initialize CQLSStableWriter for " + def.key + ": " + ExceptionUtils.stackTrace(ex));
			return null;
		}
		
		Iterator<ISourceLine> it = parser.parse();
		if(it == null) {
			logger.error("Failed to parse source for " + def.key);
			return null;
		}
		
		List<Pair<String, ISourceLine>> errorLines = new ArrayList<Pair<String, ISourceLine>>();
		while (it.hasNext()) {
			ISourceLine srcLine = null;
			try {
				srcLine = it.next();
				if(srcLine != null) {
					logger.debug(srcLine.toString());
					HashMap<String, Object> valueMap = srcLine.getLineResult();
					if(valueMap != null) {
						writer.addRow(
								valueMap.get("sernum"),
								valueMap.get("rectime"),
								valueMap.get("machine"),
								valueMap.get("area"),
								valueMap.get("uuttype"),
								valueMap.get("passfail"),
								valueMap.get("bfstatus"),
								valueMap.get("mode"),
								valueMap.get("parentsernum"),
								valueMap.get("tst_id"),
								valueMap.get("site_id"),
								String.format(SOURCE_TEMPLATE, site),
								valueMap.get("tsd_timestamp"),
								valueMap.get("attributes"),
								calTTL((Date) valueMap.get("rectime")));
					}
				}
			} catch (Exception ex) {
				errorLines.add(new ImmutablePair<String, ISourceLine>(def.key, srcLine));
				logger.error("Failed to write row for table " + def.key + ": " + srcLine);
				logger.error("Failed to write row for table " + def.key + ": " + ExceptionUtils.stackTrace(ex));
			}
		}
		
		try {
			writer.close();
		} catch (Exception ex) {
			logger.error(ExceptionUtils.stackTrace(ex));
		}
		
		return errorLines;
	}
	
	private static int calTTL(Date rectime) {
		try {
			SimpleDateFormat dateFormatGmt = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss");
			dateFormatGmt.setTimeZone(TimeZone.getTimeZone("GMT")); 
			SimpleDateFormat dateFormatLocal = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss");
			Timestamp curr = new Timestamp(dateFormatLocal.parse(dateFormatGmt.format(new Date())).getTime());
			long remain = (curr.getTime() - rectime.getTime())/1000;
			remain = DEFAULT_TTL - remain;
			return remain>0 ? (int)remain : 0;
		} catch(Exception ex) {
			logger.error(ExceptionUtils.stackTrace(ex));
		}
		
		return DEFAULT_TTL;
	}
}
