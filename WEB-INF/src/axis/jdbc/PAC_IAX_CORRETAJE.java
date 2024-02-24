package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CORRETAJE extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CORRETAJE.class);
	private Connection conn = null;

	public PAC_IAX_CORRETAJE(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CORRETAJE.F_CALCULAR_COMISION_CORRETAJE(PCAGENTE, PNRIESGO,
	// PPARTICI)
	private HashMap callPAC_IAX_CORRETAJE__F_CALCULAR_COMISION_CORRETAJE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPPARTICI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CORRETAJE.F_CALCULAR_COMISION_CORRETAJE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPNRIESGO", "pPPARTICI" },
				new Object[] { pPCAGENTE, pPNRIESGO, pPPARTICI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPPARTICI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PPCOMISI"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PPRETENC"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PPCOMISI", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PPCOMISI", null);
		}
		try {
			retVal.put("PPRETENC", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PPRETENC", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CORRETAJE__F_CALCULAR_COMISION_CORRETAJE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPPARTICI) throws Exception {
		return this.callPAC_IAX_CORRETAJE__F_CALCULAR_COMISION_CORRETAJE(pPCAGENTE, pPNRIESGO, pPPARTICI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CORRETAJE.F_CALCULAR_COMISION_CORRETAJE

	// Inicio IAXIS-3591 17/07/2019
	// --START-PAC_IAX_CORRETAJE.F_LEECORRETAJE
	private HashMap callPAC_IAX_CORRETAJE__F_LEECORRETAJE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CORRETAJE.F_LEECORRETAJE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRECIBO" }, new Object[] { pPSSEGURO, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CORRETAJE__F_LEECORRETAJE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_CORRETAJE__F_LEECORRETAJE(pPSSEGURO, pPNRECIBO);
	}
	// Fin IAXIS-3591 17/07/2019

	// INI IAXIS-12960 05/03/2020
	private HashMap callPAC_IAX_CORRETAJE__F_CORRETAJE(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CORRETAJE.F_CORRETAJE(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.setObject(2, pPNRECIBO);
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
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CORRETAJE__F_CORRETAJE(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_CORRETAJE__F_CORRETAJE(pPNRECIBO);
	}
	// FIN IAXIS-12960 05/03/2020

	// INI IAXIS-5428 01/11/2019
	// --START-PAC_IAX_CORRETAJE.F_LEECORRETAJE
	private HashMap callPAC_IAX_CORRETAJE__F_TRAPASO_INTERMEDIARIO(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CORRETAJE.F_TRAPASO_INTERMEDIARIO(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CORRETAJE__F_TRAPASO_INTERMEDIARIO(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_CORRETAJE__F_TRAPASO_INTERMEDIARIO(pPCAGENTE);
	}
	// FIN IAXIS-5428 01/11/2019
}
