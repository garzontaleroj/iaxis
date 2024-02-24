package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DINCARTERA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DINCARTERA.class);
	private Connection conn = null;

	public PAC_IAX_DINCARTERA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DINCARTERA.F_EVAL_GENERA_DIFERIDOS(PCEMPRES, PSPROCES)
	private HashMap callPAC_IAX_DINCARTERA__F_EVAL_GENERA_DIFERIDOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_EVAL_GENERA_DIFERIDOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES" }, new Object[] { pPCEMPRES, pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PGENERAMAP"
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
			retVal.put("PGENERAMAP", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PGENERAMAP", null);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_EVAL_GENERA_DIFERIDOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_EVAL_GENERA_DIFERIDOS(pPCEMPRES, pPSPROCES);
	}
	// --END-PAC_IAX_DINCARTERA.F_EVAL_GENERA_DIFERIDOS

	// --START-PAC_IAX_DINCARTERA.F_GET_ANYO_CARTERA(PCEMPRES, PNPOLIZA, PNMES,
	// PSPROCAR)
	private HashMap callPAC_IAX_DINCARTERA__F_GET_ANYO_CARTERA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNMES, java.math.BigDecimal pPSPROCAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_ANYO_CARTERA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPNPOLIZA", "pPNMES", "pPSPROCAR" },
				new Object[] { pPCEMPRES, pPNPOLIZA, pPNMES, pPSPROCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNMES);
		cStmt.setObject(7, pPSPROCAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PNANYO"
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
			retVal.put("PNANYO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PNANYO", null);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_ANYO_CARTERA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNMES, java.math.BigDecimal pPSPROCAR)
			throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_ANYO_CARTERA(pPCEMPRES, pPNPOLIZA, pPNMES, pPSPROCAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_GET_ANYO_CARTERA

	// --START-PAC_IAX_DINCARTERA.F_GET_MES_CARTERA(PNPOLIZA, PCEMPRES, PCMODO,
	// PSPROCAR)
	private HashMap callPAC_IAX_DINCARTERA__F_GET_MES_CARTERA(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPCEMPRES, String pPCMODO, java.math.BigDecimal pPSPROCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_MES_CARTERA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPCEMPRES", "pPCMODO", "pPSPROCAR" },
				new Object[] { pPNPOLIZA, pPCEMPRES, pPCMODO, pPSPROCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCMODO);
		cStmt.setObject(7, pPSPROCAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURMESCAR"
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
			retVal.put("PCURMESCAR", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURMESCAR", null);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_MES_CARTERA(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPCEMPRES, String pPCMODO, java.math.BigDecimal pPSPROCAR) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_MES_CARTERA(pPNPOLIZA, pPCEMPRES, pPCMODO, pPSPROCAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_GET_MES_CARTERA

	// --START-PAC_IAX_DINCARTERA.F_GET_PROCESO()
	private HashMap callPAC_IAX_DINCARTERA__F_GET_PROCESO() throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_PROCESO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
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
			retVal.put("PSPROCES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_PROCESO() throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_PROCESO();
	}

	// --END-PAC_IAX_DINCARTERA.F_GET_PROCESO
	// --START-PAC_IAX_DINCARTERA.F_GET_PRODCARTERA(PCEMPRES, PCRAMO, PSPRODUC)
	private HashMap callPAC_IAX_DINCARTERA__F_GET_PRODCARTERA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSPROCAR,
			java.lang.String pMODOCARTERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_PRODCARTERA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPSPROCAR", "pMODOCARTERA" },
				new Object[] { pPCEMPRES, pPCRAMO, pPSPRODUC, pPSPROCAR, pMODOCARTERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPSPROCAR);
		cStmt.setObject(6, pMODOCARTERA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURPRCAR"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCURPRCAR", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCURPRCAR", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_PRODCARTERA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSPROCAR,
			java.lang.String pMODOCARTERA) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_PRODCARTERA(pPCEMPRES, pPCRAMO, pPSPRODUC, pPSPROCAR, pMODOCARTERA);
	}

	// --END-PAC_IAX_DINCARTERA.F_GET_PRODCARTERA
	// --START-PAC_IAX_DINCARTERA.F_LANZA_CARTERA(PSPROCES, PCEMPRES, PMES, PANYO,
	// PNPOLIZA, PNCERTIF, PSPROCAR, PFCARTERA)
	private HashMap callPAC_IAX_DINCARTERA__F_LANZA_CARTERA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.sql.Date pPFCARTERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_LANZA_CARTERA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPMES", "pPANYO", "pPNPOLIZA", "pPNCERTIF", "pPSPROCAR",
						"pPFCARTERA" },
				new Object[] { pPSPROCES, pPCEMPRES, pPMES, pPANYO, pPNPOLIZA, pPNCERTIF, pPSPROCAR, pPFCARTERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPMES);
		cStmt.setObject(5, pPANYO);
		cStmt.setObject(6, pPNPOLIZA);
		cStmt.setObject(7, pPNCERTIF);
		cStmt.setObject(8, pPSPROCAR);
		cStmt.setObject(9, pPFCARTERA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_LANZA_CARTERA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.sql.Date pPFCARTERA) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_LANZA_CARTERA(pPSPROCES, pPCEMPRES, pPMES, pPANYO, pPNPOLIZA, pPNCERTIF,
				pPSPROCAR, pPFCARTERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_LANZA_CARTERA

	// --START-PAC_IAX_DINCARTERA.F_LANZA_PREVIO(PSPROCES, PCEMPRES, PMES, PANYO,
	// PNPOLIZA, PNCERTIF, PSPROCAR, PRENUEVAN, PFCARTERA)
	private HashMap callPAC_IAX_DINCARTERA__F_LANZA_PREVIO(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.math.BigDecimal pPRENUEVAN, java.sql.Date pPFCARTERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_LANZA_PREVIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPMES", "pPANYO", "pPNPOLIZA", "pPNCERTIF", "pPSPROCAR",
						"pPRENUEVAN", "pPFCARTERA" },
				new Object[] { pPSPROCES, pPCEMPRES, pPMES, pPANYO, pPNPOLIZA, pPNCERTIF, pPSPROCAR, pPRENUEVAN,
						pPFCARTERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPMES);
		cStmt.setObject(5, pPANYO);
		cStmt.setObject(6, pPNPOLIZA);
		cStmt.setObject(7, pPNCERTIF);
		cStmt.setObject(8, pPSPROCAR);
		cStmt.setObject(9, pPRENUEVAN);
		cStmt.setObject(10, pPFCARTERA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_LANZA_PREVIO(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.math.BigDecimal pPRENUEVAN, java.sql.Date pPFCARTERA) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_LANZA_PREVIO(pPSPROCES, pPCEMPRES, pPMES, pPANYO, pPNPOLIZA, pPNCERTIF,
				pPSPROCAR, pPRENUEVAN, pPFCARTERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_LANZA_PREVIO

	// --START-PAC_IAX_DINCARTERA.F_LISTADO_CARTERA(REPORT, PCEMPRES, PSELPROD,
	// PSPROCES, PMES, PANYO, PSPROCAR)
	private HashMap callPAC_IAX_DINCARTERA__F_LISTADO_CARTERA(String pREPORT, java.math.BigDecimal pPCEMPRES,
			String pPSELPROD, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPSPROCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_LISTADO_CARTERA(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pREPORT", "pPCEMPRES", "pPSELPROD", "pPSPROCES", "pPMES", "pPANYO", "pPSPROCAR" },
				new Object[] { pREPORT, pPCEMPRES, pPSELPROD, pPSPROCES, pPMES, pPANYO, pPSPROCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pREPORT);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPSELPROD);
		cStmt.setObject(5, pPSPROCES);
		cStmt.setObject(6, pPMES);
		cStmt.setObject(7, pPANYO);
		cStmt.setObject(8, pPSPROCAR);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_LISTADO_CARTERA(String pREPORT, java.math.BigDecimal pPCEMPRES,
			String pPSELPROD, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPSPROCAR) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_LISTADO_CARTERA(pREPORT, pPCEMPRES, pPSELPROD, pPSPROCES, pPMES, pPANYO,
				pPSPROCAR);
	}

	// --END-PAC_IAX_DINCARTERA.F_LISTADO_CARTERA
	// --START-PAC_IAX_DINCARTERA.F_REGISTRA_PROCESO(PMODO, PMES, PANYO, PCEMPRES,
	// PFCARTERA)
	private HashMap callPAC_IAX_DINCARTERA__F_REGISTRA_PROCESO(String pPMODO, java.math.BigDecimal pPMES,
			java.math.BigDecimal pPANYO, java.math.BigDecimal pPCEMPRES, java.sql.Date pPFCARTERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_REGISTRA_PROCESO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMODO", "pPMES", "pPANYO", "pPCEMPRES", "pPFCARTERA" },
				new Object[] { pPMODO, pPMES, pPANYO, pPCEMPRES, pPFCARTERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMODO);
		cStmt.setObject(3, pPMES);
		cStmt.setObject(4, pPANYO);
		cStmt.setObject(5, pPCEMPRES);
		cStmt.setObject(6, pPFCARTERA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PNPROCESO"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PNPROCESO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PNPROCESO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_REGISTRA_PROCESO(String pPMODO, java.math.BigDecimal pPMES,
			java.math.BigDecimal pPANYO, java.math.BigDecimal pPCEMPRES, java.sql.Date pPFCARTERA) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_REGISTRA_PROCESO(pPMODO, pPMES, pPANYO, pPCEMPRES, pPFCARTERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_REGISTRA_PROCESO

	// --START-PAC_IAX_DINCARTERA.F_SET_PRODCARTERA(PCEMPRES, PSPROCAR, PSPRODUC,
	// PSELECCIO)
	private HashMap callPAC_IAX_DINCARTERA__F_SET_PRODCARTERA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCAR, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSELECCIO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_SET_PRODCARTERA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCAR", "pPSPRODUC", "pPSELECCIO" },
				new Object[] { pPCEMPRES, pPSPROCAR, pPSPRODUC, pPSELECCIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCAR);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPSELECCIO);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_SET_PRODCARTERA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCAR, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSELECCIO)
			throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_SET_PRODCARTERA(pPCEMPRES, pPSPROCAR, pPSPRODUC, pPSELECCIO);
	}
	// --END-PAC_IAX_DINCARTERA.F_SET_PRODCARTERA

	// --START-PAC_IAX_DINCARTERA.F_ACT_CBLOQUEOCOL(PSSEGURO, PCBLOQUEOCOL)
	private HashMap callPAC_IAX_DINCARTERA__F_ACT_CBLOQUEOCOL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCBLOQUEOCOL) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_ACT_CBLOQUEOCOL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCBLOQUEOCOL" }, new Object[] { pPSSEGURO, pPCBLOQUEOCOL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCBLOQUEOCOL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_ACT_CBLOQUEOCOL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCBLOQUEOCOL) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_ACT_CBLOQUEOCOL(pPSSEGURO, pPCBLOQUEOCOL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DINCARTERA.F_ACT_CBLOQUEOCOL
	// --START-PAC_IAX_DINCARTERA.F_BOTONES_GESTRENOVA(PSSEGURO)
	private HashMap callPAC_IAX_DINCARTERA__F_BOTONES_GESTRENOVA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_BOTONES_GESTRENOVA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OPERMITEEMITIR"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "OPERMITEPROPRET"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "OPERMITESUPLEMENTO"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "OPERMITERENOVAR"
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
			retVal.put("OPERMITEEMITIR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OPERMITEEMITIR", null);
		}
		try {
			retVal.put("OPERMITEPROPRET", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("OPERMITEPROPRET", null);
		}
		try {
			retVal.put("OPERMITESUPLEMENTO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OPERMITESUPLEMENTO", null);
		}
		try {
			retVal.put("OPERMITERENOVAR", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("OPERMITERENOVAR", null);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_BOTONES_GESTRENOVA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_BOTONES_GESTRENOVA(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_BOTONES_GESTRENOVA

	// --START-PAC_IAX_DINCARTERA.F_CONSULTA_GESTRENOVA(PRAMO, PSPRODUC, PNPOLIZA,
	// PNCERT, PNNUMIDE, PSNIP, PBUSCAR, PNSOLICI, PTIPOPERSONA, PCAGENTE, PCMATRIC,
	// PCPOSTAL, PTDOMICI, PTNATRIE, PCSITUAC, P_FILTROPROD, PCPOLCIA, PCCOMPANI,
	// PCACTIVI, PCESTSUPL, PNPOLINI, PFILAGE, PFVENCIMINI, PFVENCIMFIN, PSUCUROFI,
	// PMODO)
	private HashMap callPAC_IAX_DINCARTERA__F_CONSULTA_GESTRENOVA(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			String pPNPOLINI, java.math.BigDecimal pPFILAGE, java.sql.Date pPFVENCIMINI, java.sql.Date pPFVENCIMFIN,
			String pPSUCUROFI, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_CONSULTA_GESTRENOVA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERT", "pPNNUMIDE", "pPSNIP", "pPBUSCAR",
						"pPNSOLICI", "pPTIPOPERSONA", "pPCAGENTE", "pPCMATRIC", "pPCPOSTAL", "pPTDOMICI", "pPTNATRIE",
						"pPCSITUAC", "pP_FILTROPROD", "pPCPOLCIA", "pPCCOMPANI", "pPCACTIVI", "pPCESTSUPL", "pPNPOLINI",
						"pPFILAGE", "pPFVENCIMINI", "pPFVENCIMFIN", "pPSUCUROFI", "pPMODO" },
				new Object[] { pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP, pPBUSCAR, pPNSOLICI,
						pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCSITUAC, pP_FILTROPROD,
						pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLINI, pPFILAGE, pPFVENCIMINI, pPFVENCIMFIN,
						pPSUCUROFI, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPRAMO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPNCERT);
		cStmt.setObject(6, pPNNUMIDE);
		cStmt.setObject(7, pPSNIP);
		cStmt.setObject(8, pPBUSCAR);
		cStmt.setObject(9, pPNSOLICI);
		cStmt.setObject(10, pPTIPOPERSONA);
		cStmt.setObject(11, pPCAGENTE);
		cStmt.setObject(12, pPCMATRIC);
		cStmt.setObject(13, pPCPOSTAL);
		cStmt.setObject(14, pPTDOMICI);
		cStmt.setObject(15, pPTNATRIE);
		cStmt.setObject(16, pPCSITUAC);
		cStmt.setObject(17, pP_FILTROPROD);
		cStmt.setObject(18, pPCPOLCIA);
		cStmt.setObject(19, pPCCOMPANI);
		cStmt.setObject(20, pPCACTIVI);
		cStmt.setObject(21, pPCESTSUPL);
		cStmt.setObject(22, pPNPOLINI);
		cStmt.setObject(23, pPFILAGE);
		cStmt.setObject(24, pPFVENCIMINI);
		cStmt.setObject(25, pPFVENCIMFIN);
		cStmt.setObject(26, pPSUCUROFI);
		cStmt.setObject(27, pPMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(28, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(28));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_CONSULTA_GESTRENOVA(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			String pPNPOLINI, java.math.BigDecimal pPFILAGE, java.sql.Date pPFVENCIMINI, java.sql.Date pPFVENCIMFIN,
			String pPSUCUROFI, String pPMODO) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_CONSULTA_GESTRENOVA(pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE,
				pPSNIP, pPBUSCAR, pPNSOLICI, pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE,
				pPCSITUAC, pP_FILTROPROD, pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLINI, pPFILAGE,
				pPFVENCIMINI, pPFVENCIMFIN, pPSUCUROFI, pPMODO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DINCARTERA.F_CONSULTA_GESTRENOVA
	// --START-PAC_IAX_DINCARTERA.F_SUPLEMENTO_RENOVACION(PSSEGURO)
	private HashMap callPAC_IAX_DINCARTERA__F_SUPLEMENTO_RENOVACION(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_SUPLEMENTO_RENOVACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "OTEXTO"
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
			retVal.put("OTEXTO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OTEXTO", null);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_SUPLEMENTO_RENOVACION(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_SUPLEMENTO_RENOVACION(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_SUPLEMENTO_RENOVACION

	// --START-PAC_IAX_DINCARTERA.F_GET_CARTERADIARIA_POLIZA(PNPOLIZA)
	private HashMap callPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_POLIZA(java.math.BigDecimal pPNPOLIZA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_CARTERADIARIA_POLIZA(?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA" }, new Object[] { pPNPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_POLIZA(java.math.BigDecimal pPNPOLIZA)
			throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_POLIZA(pPNPOLIZA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_GET_CARTERADIARIA_POLIZA

	// --START-PAC_IAX_DINCARTERA.F_GET_CARTERADIARIA_PRODUCTO(PSPRODUC)
	private HashMap callPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_PRODUCTO(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_CARTERADIARIA_PRODUCTO(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_PRODUCTO(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_PRODUCTO(pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_GET_CARTERADIARIA_PRODUCTO

	// --START-PAC_IAX_DINCARTERA.F_GET_CARTERAPROG_PRODUCTO(PSPRODUC)
	private HashMap callPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_PRODUCTO(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_CARTERAPROG_PRODUCTO(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_PRODUCTO(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_PRODUCTO(pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_GET_CARTERAPROG_PRODUCTO

	// --START-PAC_IAX_DINCARTERA.F_PROGRAMAR_CARTERA(PSPROCES, PMODO, PCEMPRES,
	// PMES, PANYO, PPRODUCTOS, PNPOLIZA, PNCERTIF, PSPROCAR, PFEJECUCION,
	// PFCARTERA)
	private HashMap callPAC_IAX_DINCARTERA__F_PROGRAMAR_CARTERA(java.math.BigDecimal pPSPROCES, String pPMODO,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO, String pPPRODUCTOS,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.sql.Date pPFEJECUCION, java.sql.Date pPFCARTERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_PROGRAMAR_CARTERA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPMODO", "pPCEMPRES", "pPMES", "pPANYO", "pPPRODUCTOS", "pPNPOLIZA",
						"pPNCERTIF", "pPSPROCAR", "pPFEJECUCION", "pPFCARTERA" },
				new Object[] { pPSPROCES, pPMODO, pPCEMPRES, pPMES, pPANYO, pPPRODUCTOS, pPNPOLIZA, pPNCERTIF,
						pPSPROCAR, pPFEJECUCION, pPFCARTERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPMODO);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPMES);
		cStmt.setObject(6, pPANYO);
		cStmt.setObject(7, pPPRODUCTOS);
		cStmt.setObject(8, pPNPOLIZA);
		cStmt.setObject(9, pPNCERTIF);
		cStmt.setObject(10, pPSPROCAR);
		cStmt.setObject(11, pPFEJECUCION);
		cStmt.setObject(12, pPFCARTERA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_PROGRAMAR_CARTERA(java.math.BigDecimal pPSPROCES, String pPMODO,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO, String pPPRODUCTOS,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.sql.Date pPFEJECUCION, java.sql.Date pPFCARTERA) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_PROGRAMAR_CARTERA(pPSPROCES, pPMODO, pPCEMPRES, pPMES, pPANYO,
				pPPRODUCTOS, pPNPOLIZA, pPNCERTIF, pPSPROCAR, pPFEJECUCION, pPFCARTERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_PROGRAMAR_CARTERA

	// --START-PAC_IAX_DINCARTERA.F_GET_CARTERAPROG_POLIZA(PNPOLIZA)
	private HashMap callPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_POLIZA(java.math.BigDecimal pPNPOLIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_GET_CARTERAPROG_POLIZA(?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA" }, new Object[] { pPNPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_POLIZA(java.math.BigDecimal pPNPOLIZA)
			throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_POLIZA(pPNPOLIZA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_GET_CARTERAPROG_POLIZA

	// --START-PAC_IAX_DINCARTERA.F_LANZA_CARTERA_CERO(PNPOLIZA, PNCERTIF)
	private HashMap callPAC_IAX_DINCARTERA__F_LANZA_CARTERA_CERO(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_LANZA_CARTERA_CERO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNCERTIF" }, new Object[] { pPNPOLIZA, pPNCERTIF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
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
			retVal.put("PSPROCES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_LANZA_CARTERA_CERO(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_LANZA_CARTERA_CERO(pPNPOLIZA, pPNCERTIF);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_LANZA_CARTERA_CERO

	// --START-PAC_IAX_DINCARTERA.F_RETROCEDER_CARTERA_CERO(PSSEGURO)
	private HashMap callPAC_IAX_DINCARTERA__F_RETROCEDER_CARTERA_CERO(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_RETROCEDER_CARTERA_CERO(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_RETROCEDER_CARTERA_CERO(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_RETROCEDER_CARTERA_CERO(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_RETROCEDER_CARTERA_CERO

	// --START-PAC_IAX_DINCARTERA.F_VALIDACION_CARTERA(PSPROCES, PCEMPRES, PMES,
	// PANYO, PNPOLIZA, PNCERTIF, PSPROCAR, PFCARTERA)
	private HashMap callPAC_IAX_DINCARTERA__F_VALIDACION_CARTERA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.sql.Date pPFCARTERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DINCARTERA.F_VALIDACION_CARTERA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPMES", "pPANYO", "pPNPOLIZA", "pPNCERTIF", "pPSPROCAR",
						"pPFCARTERA" },
				new Object[] { pPSPROCES, pPCEMPRES, pPMES, pPANYO, pPNPOLIZA, pPNCERTIF, pPSPROCAR, pPFCARTERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPMES);
		cStmt.setObject(5, pPANYO);
		cStmt.setObject(6, pPNPOLIZA);
		cStmt.setObject(7, pPNCERTIF);
		cStmt.setObject(8, pPSPROCAR);
		cStmt.setObject(9, pPFCARTERA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DINCARTERA__F_VALIDACION_CARTERA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPMES, java.math.BigDecimal pPANYO,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSPROCAR,
			java.sql.Date pPFCARTERA) throws Exception {
		return this.callPAC_IAX_DINCARTERA__F_VALIDACION_CARTERA(pPSPROCES, pPCEMPRES, pPMES, pPANYO, pPNPOLIZA,
				pPNCERTIF, pPSPROCAR, pPFCARTERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DINCARTERA.F_VALIDACION_CARTERA

}