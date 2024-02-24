package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FUSIONPERSONA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_FUSIONPERSONA.class);
	private Connection conn = null;

	public PAC_IAX_FUSIONPERSONA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_FUSIONPERSONA.F_FUSIONAR_PER(PSPERSON1, PCAGENTE1, PSPERSON2,
	// PCAGENTE2)
	private HashMap callPAC_IAX_FUSIONPERSONA__F_FUSIONAR_PER(java.math.BigDecimal pPSPERSON1,
			java.math.BigDecimal pPCAGENTE1, java.math.BigDecimal pPSPERSON2, java.math.BigDecimal pPCAGENTE2)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FUSIONPERSONA.F_FUSIONAR_PER(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON1", "pPCAGENTE1", "pPSPERSON2", "pPCAGENTE2" },
				new Object[] { pPSPERSON1, pPCAGENTE1, pPSPERSON2, pPCAGENTE2 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON1);
		cStmt.setObject(3, pPCAGENTE1);
		cStmt.setObject(4, pPSPERSON2);
		cStmt.setObject(5, pPCAGENTE2);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_FUSIONPERSONA__F_FUSIONAR_PER(java.math.BigDecimal pPSPERSON1,
			java.math.BigDecimal pPCAGENTE1, java.math.BigDecimal pPSPERSON2, java.math.BigDecimal pPCAGENTE2)
			throws Exception {
		return this.callPAC_IAX_FUSIONPERSONA__F_FUSIONAR_PER(pPSPERSON1, pPCAGENTE1, pPSPERSON2, pPCAGENTE2);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FUSIONPERSONA.F_FUSIONAR_PER

	// --START-PAC_IAX_FUSIONPERSONA.F_GET_PERDUPLICADA(PSPERSON, PCAGENTE)
	private HashMap callPAC_IAX_FUSIONPERSONA__F_GET_PERDUPLICADA(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FUSIONPERSONA.F_GET_PERDUPLICADA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPERSON2"
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
			retVal.put("PSPERSON2", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPERSON2", null);
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

	public HashMap ejecutaPAC_IAX_FUSIONPERSONA__F_GET_PERDUPLICADA(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_FUSIONPERSONA__F_GET_PERDUPLICADA(pPSPERSON, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FUSIONPERSONA.F_GET_PERDUPLICADA

}
