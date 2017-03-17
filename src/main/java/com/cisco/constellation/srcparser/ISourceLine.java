package com.cisco.constellation.srcparser;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Wenyu on 01/06/15.
 */
public interface ISourceLine {
	public ISourceLine instance(List<String> line, String table);
	public HashMap<String, Object> getLineResult();
}
