package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_ACTIVIDADES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ACTIVIDADES.class);
	private Connection conn = null;

	public PAC_IAX_ACTIVIDADES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ACTIVIDADES.F_GET_ACTIVIRAMO(PCRAMO)

	private HashMap callPAC_IAX_ACTIVIDADES__F_GET_ACTIVIRAMO(java.math.BigDecimal pPCRAMO) throws Exception {

		String callQuery = "{?=call PAC_IAX_ACTIVIDADES.F_GET_ACTIVIRAMO(?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO" }, new Object[] { pPCRAMO });
		CallableStatement cStmt = null;
		HashMap retVal = new HashMap();
		try {
			cStmt = conn.prepareCall(callQuery);
			String USERNAME = conn.getMetaData().getUserName().toUpperCase();
			cStmt.setObject(2, pPCRAMO);
			cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
			cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
					UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
			cStmt.execute();

			try {
				retVal.put("RETURN", cStmt.getObject(1));
			} catch (SQLException e) {
				retVal.put("RETURN", null);
			}
			try {
				retVal.put("MENSAJES", cStmt.getObject(3));
			} catch (SQLException e) {
				retVal.put("MENSAJES", null);
			}
		} finally {
			retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
			cStmt.close();// AXIS-WLS1SERVER-Ready
		}
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ACTIVIDADES__F_GET_ACTIVIRAMO(java.math.BigDecimal pPCRAMO) throws Exception {
		return this.callPAC_IAX_ACTIVIDADES__F_GET_ACTIVIRAMO(pPCRAMO);
	}
	// --END-PAC_IAX_ACTIVIDADES.F_GET_ACTIVIRAMO

}
