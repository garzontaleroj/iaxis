package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.util.ConversionUtil;

//WLS-Ready 

public class DBMS_SESSION extends AccesoPL {
	static Log logger = LogFactory.getLog(DBMS_SESSION.class);
	private Connection conn = null;

	public DBMS_SESSION(Connection conn) {
		this.conn = conn;
	}

	private HashMap callDBMS_SESSION__FREE_UNUSED_USER_MEMORY() throws Exception {
		String callQuery = "{call DBMS_SESSION.FREE_UNUSED_USER_MEMORY()}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = null;
		HashMap retVal = new HashMap();
		try {
			cStmt = conn.prepareCall(callQuery);
			String USERNAME = conn.getMetaData().getUserName().toUpperCase();
			cStmt.execute();
			retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		} finally {
			cStmt.close(); // AXIS-WLS1SERVER-Ready
		}

		return retVal;
	}

	public HashMap ejecutaDBMS_SESSION__FREE_UNUSED_USER_MEMORY() throws Exception {
		return this.callDBMS_SESSION__FREE_UNUSED_USER_MEMORY(); // AXIS-WLS1SERVER-Ready
	}

	private HashMap callDBMS_SESSION__SET_CLOSE_CACHED_OPEN_CURSORS(boolean trueFalse) throws Exception {
		String callQuery = "{call DBMS_SESSION.SET_CLOSE_CACHED_OPEN_CURSORS(" + ("" + trueFalse).toUpperCase() + ")}";

		logCall(callQuery, new String[] { "trueFalse" }, new Object[] { trueFalse });
		CallableStatement cStmt = null;
		HashMap retVal = new HashMap();
		try {
			cStmt = conn.prepareCall(callQuery);
			String USERNAME = conn.getMetaData().getUserName().toUpperCase();
			cStmt.execute();
			retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		} finally {
			cStmt.close(); // AXIS-WLS1SERVER-Ready
		}

		return retVal;
	}

	public HashMap ejecutaDBMS_SESSION__SET_CLOSE_CACHED_OPEN_CURSORS(boolean trueFalse) throws Exception {
		return this.callDBMS_SESSION__SET_CLOSE_CACHED_OPEN_CURSORS(trueFalse); // AXIS-WLS1SERVER-Ready
	}

}
