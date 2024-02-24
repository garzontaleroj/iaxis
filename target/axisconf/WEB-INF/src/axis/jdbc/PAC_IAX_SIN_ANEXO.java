package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_ANEXO extends AccesoPL {
	static Log logger = LogFactory.getLog(axis.jdbc.PAC_IAX_SIN_ANEXO.class);
	private Connection conn = null;

	public PAC_IAX_SIN_ANEXO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_ANEXO.F_GET_DATOS_SIN(PSPROFES, PNNUMIDE, PTNOMBRE,
	// PNSINIES)
	private HashMap callPAC_IAX_SIN_ANEXO__F_GET_DATOS_SIN(java.math.BigDecimal pPSPROFES, String pPNNUMIDE,
			String pPTNOMBRE, java.math.BigDecimal pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_ANEXO.F_GET_DATOS_SIN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES", "pPNNUMIDE", "pPTNOMBRE", "pPNSINIES" },
				new Object[] { pPSPROFES, pPNNUMIDE, pPTNOMBRE, pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPNNUMIDE);
		cStmt.setObject(4, pPTNOMBRE);
		cStmt.setObject(5, pPNSINIES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_ANEXO__F_GET_DATOS_SIN(java.math.BigDecimal pPSPROFES, String pPNNUMIDE,
			String pPTNOMBRE, java.math.BigDecimal pPNSINIES) throws Exception {
		return this.callPAC_IAX_SIN_ANEXO__F_GET_DATOS_SIN(pPSPROFES, pPNNUMIDE, pPTNOMBRE, pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_ANEXO.F_GET_DATOS_SIN
}
