package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_AGENTES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENDA.class);
	private Connection conn = null;

	public PAC_IAX_SIN_AGENTES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES(PFECHA, PCAGENTE)
	private HashMap callPAC_IAX_AGE_SINIESTROS__F_GET_ACTORES(java.sql.Date pPFECHA, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFECHA", "pPCAGENTE" }, new Object[] { pPFECHA, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFECHA);
		cStmt.setObject(3, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_AGE_SINIESTROS__F_GET_ACTORES(java.sql.Date pPFECHA, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		return this.callPAC_IAX_AGE_SINIESTROS__F_GET_ACTORES(pPFECHA, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES
	// --START-PAC_IAX_AGE_SINIESTROS.F_REMOVE_ACTOR(PSCLAVE, PFFIN)
	private HashMap callPAC_IAX_AGE_SINIESTROS__F_REMOVE_ACTOR(java.math.BigDecimal pPSCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_SINIESTROS.F_REMOVE_ACTOR(?, ?)}";

		logCall(callQuery, new String[] { "pPSCLAVE" }, new Object[] { pPSCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAVE);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AGE_SINIESTROS__F_REMOVE_ACTOR(java.math.BigDecimal pPSCLAVE) throws Exception {
		return this.callPAC_IAX_AGE_SINIESTROS__F_REMOVE_ACTOR(pPSCLAVE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_SINIESTROS.F_REMOVE_ACTOR
	// --START-PAC_IAX_AGE_SINIESTROS.F_SET_ACTOR(PSCLAVE, PCAGENTE, PCTRAMTE,
	// PCRAMO, PCTIPCOD, PCTRAMITAD, PSPROFES, PCVALORA, PFINICIO, PFFIN, PCUSUARI,
	// PFALTA)
	private HashMap callPAC_IAX_AGE_SINIESTROS__F_SET_ACTOR(java.math.BigDecimal pPSCLAVE,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTRAMTE, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTIPCOD, String pPCTRAMITAD, java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCVALORA, java.sql.Date pPFINICIO, java.sql.Date pPFFIN, String pPCUSUARI,
			java.sql.Date pPFALTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_SINIESTROS.F_SET_ACTOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSCLAVE", "pPCAGENTE", "pPCTRAMTE", "pPCRAMO", "pPCTIPCOD", "pPCTRAMITAD", "pPSPROFES",
						"pPCVALORA", "pPFINICIO", "pPFFIN", "pPCUSUARI", "pPFALTA" },
				new Object[] { pPSCLAVE, pPCAGENTE, pPCTRAMTE, pPCRAMO, pPCTIPCOD, pPCTRAMITAD, pPSPROFES, pPCVALORA,
						pPFINICIO, pPFFIN, pPCUSUARI, pPFALTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAVE);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCTRAMTE);
		cStmt.setObject(5, pPCRAMO);
		cStmt.setObject(6, pPCTIPCOD);
		cStmt.setObject(7, pPCTRAMITAD);
		cStmt.setObject(8, pPSPROFES);
		cStmt.setObject(9, pPCVALORA);
		cStmt.setObject(10, pPFINICIO);
		cStmt.setObject(11, pPFFIN);
		cStmt.setObject(12, pPCUSUARI);
		cStmt.setObject(13, pPFALTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGE_SINIESTROS__F_SET_ACTOR(java.math.BigDecimal pPSCLAVE,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTRAMTE, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTIPCOD, String pPCTRAMITAD, java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCVALORA, java.sql.Date pPFINICIO, java.sql.Date pPFFIN, String pPCUSUARI,
			java.sql.Date pPFALTA) throws Exception {
		return this.callPAC_IAX_AGE_SINIESTROS__F_SET_ACTOR(pPSCLAVE, pPCAGENTE, pPCTRAMTE, pPCRAMO, pPCTIPCOD,
				pPCTRAMITAD, pPSPROFES, pPCVALORA, pPFINICIO, pPFFIN, pPCUSUARI, pPFALTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGE_SINIESTROS.F_SET_ACTOR

}
