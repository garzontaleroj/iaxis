package axis.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.util.ConversionUtil;

public class AccesoSQL {
	static Log logger = LogFactory.getLog(AccesoSQL.class);
	private Connection conn = null;

	public AccesoSQL(Connection conn) {
		super();
		this.conn = conn;
	}

	public int executeUpdate(Connection conn, String sql, Object[] params) throws Exception {
		logger.debug("...llamando sql:" + sql + " con:" + paramsToString(params));
		PreparedStatement stmt = conn.prepareStatement(sql);
		for (int i = 0; i < params.length; i++) {
			stmt.setObject(i + 1, params[i]);
		}
		int retVal = stmt.executeUpdate();
		stmt.close();
		return retVal;
	}

	public ArrayList executeQuery(Connection conn, String sql, Object[] params) throws Exception {
		logger.debug("...llamando sql:" + sql + " con:" + paramsToString(params));
		PreparedStatement stmt = conn.prepareStatement(sql);
		for (int i = 0; i < params.length; i++) {
			stmt.setObject(i + 1, params[i]);
		}
		ResultSet rs = stmt.executeQuery();
		ArrayList retVal = ConversionUtil.resultSet2ArrayList(rs);
		stmt.close();
		return retVal;
	}

	public static String paramsToString(Object[] params) {
		StringBuffer sB = new StringBuffer();
		if (sB == null) {
			sB.append("(null)");
		} else {
			for (int i = 0; i < params.length; i++) {
				sB.append(params[i]).append(", ");
			}
		}
		return sB.toString();

	}

	public ArrayList executeQuery(Connection conn, String sql) throws Exception {
		logger.warn("...llamando sql query:" + sql);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList retVal = ConversionUtil.resultSet2ArrayList(rs);
		stmt.close();
		return retVal;
	}

	public int executeUpdate(Connection conn, String sql) throws Exception {
		logger.warn("...llamando sql update:" + sql);
		Statement stmt = conn.createStatement();
		int retVal = stmt.executeUpdate(sql);
		stmt.close();
		return retVal;
	}

	public boolean execute(Connection conn, String sql) throws Exception {
		logger.debug("...llamando instruccion:" + sql);
		Statement stmt = conn.createStatement();
		boolean retVal = stmt.execute(sql);
		stmt.close();
		return retVal;
	}

}
