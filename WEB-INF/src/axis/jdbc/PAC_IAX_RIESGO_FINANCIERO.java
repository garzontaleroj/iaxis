//Revision:# bsdZD6WqF0M0MS5ZoPl1xw== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_RIESGO_FINANCIERO extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_RIESGO_FINANCIERO.class);
	private Connection conn = null;

	public PAC_IAX_RIESGO_FINANCIERO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_RIESGO_FINANCIERO.F_CALCULA_RIESGO(SPERSON, FEFECTO, MONTO)
	private HashMap callPAC_IAX_RIESGO_FINANCIERO__F_CALCULA_RIESGO(java.math.BigDecimal pSPERSON,
			java.sql.Date pFEFECTO, java.math.BigDecimal pMONTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RIESGO_FINANCIERO.F_CALCULA_RIESGO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON", "pFEFECTO", "pMONTO" },
				new Object[] { pSPERSON, pFEFECTO, pMONTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.setObject(3, pFEFECTO);
		cStmt.setObject(4, pMONTO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_RIESGO_FINANCIERO__F_CALCULA_RIESGO(java.math.BigDecimal pSPERSON,
			java.sql.Date pFEFECTO, java.math.BigDecimal pMONTO) throws Exception {
		return this.callPAC_IAX_RIESGO_FINANCIERO__F_CALCULA_RIESGO(pSPERSON, pFEFECTO, pMONTO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RIESGO_FINANCIERO.F_CALCULA_RIESGO
	// --START-PAC_IAX_RIESGO_FINANCIERO.F_GET_RIESGOS_CALCULADOS(SPERSON)
	private HashMap callPAC_IAX_RIESGO_FINANCIERO__F_GET_RIESGOS_CALCULADOS(java.math.BigDecimal pSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RIESGO_FINANCIERO.F_GET_RIESGOS_CALCULADOS(?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_RIESGO_FINANCIERO__F_GET_RIESGOS_CALCULADOS(java.math.BigDecimal pSPERSON)
			throws Exception {
		return this.callPAC_IAX_RIESGO_FINANCIERO__F_GET_RIESGOS_CALCULADOS(pSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RIESGO_FINANCIERO.F_GET_RIESGOS_CALCULADOS

}
