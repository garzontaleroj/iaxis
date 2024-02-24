package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

//WLS-Ready

public class PAC_IAX_REHABILITA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_REHABILITA.class);
	private Connection conn = null;

	public PAC_IAX_REHABILITA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_REHABILITA.F_GET_FSUPLEM(PSSEGURO)

	private HashMap callPAC_IAX_REHABILITA__F_GET_FSUPLEM(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REHABILITA.F_GET_FSUPLEM(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REHABILITA__F_GET_FSUPLEM(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_REHABILITA__F_GET_FSUPLEM(pPSSEGURO);
	}
	// --END-PAC_IAX_REHABILITA.F_GET_FSUPLEM
	// --START-PAC_IAX_REHABILITA.F_GET_MOTANUL(PSSEGURO)

	private HashMap callPAC_IAX_REHABILITA__F_GET_MOTANUL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REHABILITA.F_GET_MOTANUL(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REHABILITA__F_GET_MOTANUL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_REHABILITA__F_GET_MOTANUL(pPSSEGURO);
	}
	// --END-PAC_IAX_REHABILITA.F_GET_MOTANUL
	// --START-PAC_IAX_REHABILITA.F_GET_POLIZASANUL(PSPRODUC, PNPOLIZA, PNCERTIF,
	// PNNUMIDE, PBUSCAR, PSNIP, PTIPOPERSONA)
	/*
	 * private HashMap callPAC_IAX_REHABILITA__F_GET_POLIZASANUL
	 * (java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
	 * java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPBUSCAR, String
	 * pPSNIP, java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE,
	 * java.math.BigDecimal pPCRAMO) throws Exception { String
	 * callQuery="{?=call PAC_IAX_REHABILITA.F_GET_POLIZASANUL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPSPRODUC", "pPNPOLIZA", "pPNCERTIF",
	 * "pPNNUMIDE", "pPBUSCAR", "pPSNIP", "pPTIPOPERSONA", "pPCAGENTE", "pPCRAMO"},
	 * new Object[] {pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNNUMIDE, pPBUSCAR, pPSNIP,
	 * pPTIPOPERSONA, pPCAGENTE, pPCRAMO}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSPRODUC); cStmt.setObject(3, pPNPOLIZA); cStmt.setObject(4, pPNCERTIF);
	 * cStmt.setObject(5, pPNNUMIDE); cStmt.setObject(6, pPBUSCAR);
	 * cStmt.setObject(7, pPSNIP); cStmt.setObject(8, pPTIPOPERSONA);
	 * cStmt.setObject(9, pPCAGENTE); cStmt.setObject(10, pPCRAMO);
	 * cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de
	 * "RETURN" cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(11)); } catch (SQLException e) { retVal.put("MENSAJES",
	 * null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_REHABILITA__F_GET_POLIZASANUL
	 * (java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
	 * java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPBUSCAR, String
	 * pPSNIP, java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE,
	 * java.math.BigDecimal pPCRAMO) throws Exception { return
	 * this.callPAC_IAX_REHABILITA__F_GET_POLIZASANUL(pPSPRODUC, pPNPOLIZA,
	 * pPNCERTIF, pPNNUMIDE, pPBUSCAR, pPSNIP, pPTIPOPERSONA, pPCAGENTE, pPCRAMO); }
	 */
	// --END-PAC_IAX_REHABILITA.F_GET_POLIZASANUL

	// --START-PAC_IAX_REHABILITA.F_GET_PREGUNTA(PSSEGURO)

	private HashMap callPAC_IAX_REHABILITA__F_GET_PREGUNTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REHABILITA.F_GET_PREGUNTA(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REHABILITA__F_GET_PREGUNTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_REHABILITA__F_GET_PREGUNTA(pPSSEGURO);
	}
	// --END-PAC_IAX_REHABILITA.F_GET_PREGUNTA
	// --START-PAC_IAX_REHABILITA.F_REHABILITAPOL(PSSEGURO, PCMOTMOV, PANULA_EXTORN)

	private HashMap callPAC_IAX_REHABILITA__F_REHABILITAPOL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPANULA_EXTORN) throws Exception {
		String callQuery = "{?=call PAC_IAX_REHABILITA.F_REHABILITAPOL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMOTMOV", "pPANULA_EXTORN" },
				new Object[] { pPSSEGURO, pPCMOTMOV, pPANULA_EXTORN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(4, pPANULA_EXTORN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REHABILITA__F_REHABILITAPOL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPANULA_EXTORN) throws Exception {
		return this.callPAC_IAX_REHABILITA__F_REHABILITAPOL(pPSSEGURO, pPCMOTMOV, pPANULA_EXTORN);
	}
	// --END-PAC_IAX_REHABILITA.F_REHABILITAPOL

	// --START-PAC_IAX_REHABILITA.F_VALIDA_REHABILITA(PSSEGURO)

	private HashMap callPAC_IAX_REHABILITA__F_VALIDA_REHABILITA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REHABILITA.F_VALIDA_REHABILITA(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REHABILITA__F_VALIDA_REHABILITA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_REHABILITA__F_VALIDA_REHABILITA(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REHABILITA.F_VALIDA_REHABILITA

	// --START-PAC_IAX_REHABILITA.F_GET_POLIZASANUL(PSPRODUC, PNPOLIZA, PNCERTIF,
	// PNNUMIDE, PBUSCAR, PSNIP, PTIPOPERSONA, PCMATRIC, PCPOSTAL, PTDOMICI,
	// PTNATRIE, PCAGENTE, PCRAMO, PCPOLCIA, PCCOMPANI, PCACTIVI, PFILAGE,
	// PCSUCURSAL, PCADM, PCMOTOR, PCCHASIS, PNBASTID)
	private HashMap callPAC_IAX_REHABILITA__F_GET_POLIZASANUL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPBUSCAR,
			String pPSNIP, java.math.BigDecimal pPTIPOPERSONA, String pPCMATRIC, String pPCPOSTAL, String pPTDOMICI,
			String pPTNATRIE, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCRAMO, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPFILAGE,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID) throws Exception {
		String callQuery = "{?=call PAC_IAX_REHABILITA.F_GET_POLIZASANUL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPNNUMIDE", "pPBUSCAR", "pPSNIP",
						"pPTIPOPERSONA", "pPCMATRIC", "pPCPOSTAL", "pPTDOMICI", "pPTNATRIE", "pPCAGENTE", "pPCRAMO",
						"pPCPOLCIA", "pPCCOMPANI", "pPCACTIVI", "pPFILAGE", "pPCSUCURSAL", "pPCADM", "pPCMOTOR",
						"pPCCHASIS", "pPNBASTID" },
				new Object[] { pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNNUMIDE, pPBUSCAR, pPSNIP, pPTIPOPERSONA, pPCMATRIC,
						pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCAGENTE, pPCRAMO, pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPFILAGE,
						pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNCERTIF);
		cStmt.setObject(5, pPNNUMIDE);
		cStmt.setObject(6, pPBUSCAR);
		cStmt.setObject(7, pPSNIP);
		cStmt.setObject(8, pPTIPOPERSONA);
		cStmt.setObject(9, pPCMATRIC);
		cStmt.setObject(10, pPCPOSTAL);
		cStmt.setObject(11, pPTDOMICI);
		cStmt.setObject(12, pPTNATRIE);
		cStmt.setObject(13, pPCAGENTE);
		cStmt.setObject(14, pPCRAMO);
		cStmt.setObject(15, pPCPOLCIA);
		cStmt.setObject(16, pPCCOMPANI);
		cStmt.setObject(17, pPCACTIVI);
		cStmt.setObject(18, pPFILAGE);
		cStmt.setObject(20, pPCSUCURSAL);
		cStmt.setObject(21, pPCADM);
		cStmt.setObject(22, pPCMOTOR);
		cStmt.setObject(23, pPCCHASIS);
		cStmt.setObject(24, pPNBASTID);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REHABILITA__F_GET_POLIZASANUL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPBUSCAR,
			String pPSNIP, java.math.BigDecimal pPTIPOPERSONA, String pPCMATRIC, String pPCPOSTAL, String pPTDOMICI,
			String pPTNATRIE, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCRAMO, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPFILAGE,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID) throws Exception {
		return this.callPAC_IAX_REHABILITA__F_GET_POLIZASANUL(pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNNUMIDE, pPBUSCAR,
				pPSNIP, pPTIPOPERSONA, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCAGENTE, pPCRAMO, pPCPOLCIA,
				pPCCOMPANI, pPCACTIVI, pPFILAGE, pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REHABILITA.F_GET_POLIZASANUL

	// --START-PAC_IAX_REHABILITA.F_SET_SOLREHAB(PSSEGURO, PCMOTMOV, PNRIESGO,
	// PFREHAB, PTOBSERV)
	private HashMap callPAC_IAX_REHABILITA__F_SET_SOLREHAB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPNRIESGO, java.sql.Date pPFREHAB, String pPTOBSERV)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REHABILITA.F_SET_SOLREHAB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMOTMOV", "pPNRIESGO", "pPFREHAB", "pPTOBSERV" },
				new Object[] { pPSSEGURO, pPCMOTMOV, pPNRIESGO, pPFREHAB, pPTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPFREHAB);
		cStmt.setObject(6, pPTOBSERV);
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

	public HashMap ejecutaPAC_IAX_REHABILITA__F_SET_SOLREHAB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPNRIESGO, java.sql.Date pPFREHAB, String pPTOBSERV)
			throws Exception {
		return this.callPAC_IAX_REHABILITA__F_SET_SOLREHAB(pPSSEGURO, pPCMOTMOV, pPNRIESGO, pPFREHAB, pPTOBSERV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REHABILITA.F_SET_SOLREHAB

}
