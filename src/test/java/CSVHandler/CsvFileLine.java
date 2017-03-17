package CSVHandler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cisco.constellation.srcparser.ISourceLine;
import com.google.common.base.CharMatcher;
import com.google.common.base.Objects;
import com.google.common.base.Splitter;

/**
 * Simple holder for a line value. Handles per-line parsing
 */
public class CsvFileLine {

	public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	public static final char COMMA = ',';
	public static final String COLON = ":";
	private static final char MATCH = '\'';
	public static final char OPEN_BRACKET = '{';
	public static final char CLOSE_BRACKET = '}';

	public String sernum;
	public Date rectime;
	public String area;
	public Map<String, Object> attributes;
	public String bfstatus;
	public String machine;
	public String mode;
	public String parentsernum;
	public String passfail;
	public String server;
	public String uuttype;
	public Date tstId;
	private boolean parseable;

	private CsvFileLine() {}

	public static CsvFileLine instance(List<String> line) {
		CsvFileLine fileLine = new CsvFileLine();
		fileLine.attributes = new HashMap<String, Object>();

		try {
			fileLine.sernum = line.get(1);
			if(line.get(1) != null) {
				fileLine.rectime = DATE_FORMAT.parse(line.get(2));
			} else {
				fileLine.rectime = new Date();
			}
			fileLine.server = line.get(3);
			fileLine.machine = line.get(4);
			fileLine.uuttype = line.get(5);
			fileLine.area = line.get(6);
			fileLine.passfail = line.get(7);
			fileLine.bfstatus = line.get(8);
			fileLine.mode = line.get(9);
			fileLine.parentsernum = line.get(10);
			if(line.get(11) != null) {
				fileLine.tstId = DATE_FORMAT.parse(line.get(11));
			} else {
				fileLine.tstId = null;
			}

			try {
				if (line.get(12) != null) {
					for (String val : Splitter.on(COMMA).trimResults().omitEmptyStrings().split(line.get(3))) {
						List<String> list = Splitter.on(COLON).splitToList(val);
	
						fileLine.attributes.put(
								CharMatcher.is(MATCH).or(CharMatcher.is(OPEN_BRACKET)).removeFrom(list.get(0)),
								CharMatcher.is(MATCH).or(CharMatcher.is(CLOSE_BRACKET)).removeFrom(list.get(1))
								);
					}
				}
			} catch (Exception ex) {
				fileLine.attributes = new HashMap<String, Object>();
			}
			
			fileLine.parseable = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return fileLine;
	}

	public boolean parseable() {
		return parseable;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public String getAttributeMapAsString() {
		StringBuilder val = new StringBuilder();
		val.append(OPEN_BRACKET);
		for (Map.Entry entry : attributes.entrySet()) {
			val.append(MATCH).append(entry.getKey()).append(MATCH)
					.append(COLON).append(MATCH).append(entry.getValue())
					.append(MATCH);
		}
		val.append(CLOSE_BRACKET);
		return val.toString();
	}

	@Override
	public String toString() {
		return Objects.toStringHelper(this)
				.add("sernum", sernum)
				.add("rectime", rectime)
				.add("area", area)
				.add("attributes", attributes)
				.add("bfstatus", bfstatus)
				.add("machine", machine)
				.add("mode", mode)
				.add("parentsernum", parentsernum)
				.add("passfail", passfail)
				.add("server", server)
				.add("uutype", uuttype)
				.add("tst_id", tstId)
				.toString();

	}
}
