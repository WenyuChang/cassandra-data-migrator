package com.cisco.constellation.srcparser;

import java.util.Iterator;

import org.apache.commons.cli.CommandLine;

import com.cisco.constellation.schema.TableDefinition;

/**
 * Created by Wenyu on 01/06/15.
 */
public interface ISourceParser extends Iterator<ISourceLine>, Iterable<ISourceLine> {
	public boolean prepare(CommandLine cli, TableDefinition def);
	public Iterator<ISourceLine> parse();
	public long getLineCount();
}
