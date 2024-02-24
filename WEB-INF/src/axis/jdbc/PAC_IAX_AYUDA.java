//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_AYUDA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AYUDA.class);
	private Connection conn = null;

	public PAC_IAX_AYUDA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AYUDA.F_GET_AYUDA()

	private HashMap callPAC_IAX_AYUDA__F_GET_AYUDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_AYUDA.F_GET_AYUDA(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "AYUDACURSOR"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("AYUDACURSOR", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("AYUDACURSOR", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AYUDA__F_GET_AYUDA() throws Exception {
		return this.callPAC_IAX_AYUDA__F_GET_AYUDA();
	}
//--END-PAC_IAX_AYUDA.F_GET_AYUDA

	// --START-PAC_IAX_AYUDA.F_GET_AYUDA(CIDIOMA, CFORM)
	private HashMap callPAC_IAX_AYUDA__F_GET_AYUDA(java.math.BigDecimal pCIDIOMA, String pCFORM) throws Exception {
		String callQuery = "{?=call PAC_IAX_AYUDA.F_GET_AYUDA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCIDIOMA", "pCFORM" }, new Object[] { pCIDIOMA, pCFORM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCIDIOMA);
		cStmt.setObject(3, pCFORM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "AYUDACURSOR"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("AYUDACURSOR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("AYUDACURSOR", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AYUDA__F_GET_AYUDA(java.math.BigDecimal pCIDIOMA, String pCFORM) throws Exception {
		return this.callPAC_IAX_AYUDA__F_GET_AYUDA(pCIDIOMA, pCFORM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AYUDA.F_GET_AYUDA

}
