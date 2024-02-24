package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_ESC_RIESGO extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CUMULOS_CONF.class);
	private Connection conn = null;

	public PAC_IAX_ESC_RIESGO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ESC_RIESGO.F_GET_ESCALA_RIESGO(MENSAJES)
	private HashMap callPAC_IAX_ESC_RIESGO__F_GET_ESCALA_RIESGO() throws Exception {
		String callQuery = "{?=call PAC_IAX_ESC_RIESGO.F_GET_ESCALA_RIESGO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ESC_RIESGO__F_GET_ESCALA_RIESGO() throws Exception {
		return this.callPAC_IAX_ESC_RIESGO__F_GET_ESCALA_RIESGO();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_ESC_RIESGO.F_GET_ESCALA_RIESGO
	// --START-PAC_IAX_ESC_RIESGO.F_GRABAR_ESCALA_RIESGO(PCESCRIE, PNDESDE, PNHASTA,
	// PINDICAD, MENSAJES)
	private HashMap callPAC_IAX_ESC_RIESGO__F_GRABAR_ESCALA_RIESGO(java.math.BigDecimal pPCESCRIE,
			java.math.BigDecimal pPNDESDE, java.math.BigDecimal pPNHASTA, String pPINDICAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESC_RIESGO.F_GRABAR_ESCALA_RIESGO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCESCRIE", "pPNDESDE", "pPNHASTA", "pPINDICAD" },
				new Object[] { pPCESCRIE, pPNDESDE, pPNHASTA, pPINDICAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESCRIE);
		cStmt.setObject(3, pPNDESDE);
		cStmt.setObject(4, pPNHASTA);
		cStmt.setObject(5, pPINDICAD);
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

	public HashMap ejecutaPAC_IAX_ESC_RIESGO__F_GRABAR_ESCALA_RIESGO(java.math.BigDecimal pPCESCRIE,
			java.math.BigDecimal pPNDESDE, java.math.BigDecimal pPNHASTA, String pPINDICAD) throws Exception {
		return this.callPAC_IAX_ESC_RIESGO__F_GRABAR_ESCALA_RIESGO(pPCESCRIE, pPNDESDE, pPNHASTA, pPINDICAD);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_ESC_RIESGO.F_GRABAR_ESCALA_RIESGO
	// --START-PAC_IAX_ESC_RIESGO.F_GET_SCORING_GENERAL(PSPERSON, MENSAJES)
	private HashMap callPAC_IAX_ESC_RIESGO__F_GET_SCORING_GENERAL(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESC_RIESGO.F_GET_SCORING_GENERAL(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_ESC_RIESGO__F_GET_SCORING_GENERAL(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_ESC_RIESGO__F_GET_SCORING_GENERAL(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESC_RIESGO.F_GET_SCORING_GENERAL

	// Inicio IAXIS-2016: Scoring 11/03/2019
	// --START-PAC_IAX_ESC_RIESGO.F_CALCULA_MODELO(pPSPERSON, pPSPRODUC, pPCCANAL,
	// pPCDOMICI, MENSAJES)
	// Inicio IAXIS-2016: Scoring 10/08/2020 BJHB
	private HashMap callPAC_IAX_ESC_RIESGO__F_CALCULA_MODELO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCANAL, java.math.BigDecimal pPCDOMICI,
			java.math.BigDecimal pPCAGRUPA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESC_RIESGO.F_CALCULA_MODELO(?, ?, ?, ?, ?,?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPSPRODUC", "pPCCANAL", "pPCDOMICI", "pPCAGRUPA" },
				new Object[] { pPSPERSON, pPSPRODUC, pPCCANAL, pPCDOMICI, pPCAGRUPA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCCANAL);
		cStmt.setObject(5, pPCDOMICI);
		cStmt.setObject(6, pPCAGRUPA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ESC_RIESGO__F_CALCULA_MODELO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCANAL, java.math.BigDecimal pPCDOMICI,
			java.math.BigDecimal pPCAGRUPA) throws Exception {
		return this.callPAC_IAX_ESC_RIESGO__F_CALCULA_MODELO(pPSPERSON, pPSPRODUC, pPCCANAL, pPCDOMICI, pPCAGRUPA);// AXIS-WLS1SERVER-Ready
	}
	// Fin IAXIS-2016: Scoring 10/08/2020 BJHB
	// --END-PAC_IAX_ESC_RIESGO.F_CALCULA_MODELO
	// Fin IAXIS-2016: Scoring 11/03/2019

}