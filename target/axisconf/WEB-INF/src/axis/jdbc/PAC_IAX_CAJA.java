package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CAJA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ADM.class);
	private Connection conn = null;

	public PAC_IAX_CAJA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CAJA.F_LEE_PAGOS_MAS_PDTES(PCAGENTE)

	private HashMap callPAC_IAX_CAJA__F_LEE_PAGOS_MAS_PDTES(java.math.BigDecimal pPCAGENTE, String pCMONOPE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_LEE_PAGOS_MAS_PDTES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pCMONOPE" }, new Object[] { pPCAGENTE, pCMONOPE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pCMONOPE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_LEE_PAGOS_MAS_PDTES(java.math.BigDecimal pPCAGENTE, String pCMONOPE)
			throws Exception {
		return this.callPAC_IAX_CAJA__F_LEE_PAGOS_MAS_PDTES(pPCAGENTE, pCMONOPE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_LEE_PAGOS_MAS_PDTES

	// --START-PAC_IAX_CAJA.F_UPD_PAGOS_MASIVO(PCADENA, PCADFORPAG, PCEMPRES,
	// PCUSUARI, PSPERSON, PCTIPMOV, PIMOVIMI, PIAUTLIQ, PIPAGSIN, PCMONEOP,
	// PIAUTLIQP, PIDIFCAMBIO)
	private HashMap callPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(String pPCADENA, String pPCADFORPAG,
			java.math.BigDecimal pPCEMPRES, String pPCUSUARI, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPIAUTLIQ,
			java.math.BigDecimal pPIPAGSIN, String pPCMONEOP, java.math.BigDecimal pPIAUTLIQP,
			java.math.BigDecimal pPIDIFCAMBIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_UPD_PAGOS_MASIVO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCADENA", "pPCADFORPAG", "pPCEMPRES", "pPCUSUARI", "pPSPERSON", "pPCTIPMOV",
						"pPIMOVIMI", "pPIAUTLIQ", "pPIPAGSIN", "pPCMONEOP", "pPIAUTLIQP", "pPIDIFCAMBIO" },
				new Object[] { pPCADENA, pPCADFORPAG, pPCEMPRES, pPCUSUARI, pPSPERSON, pPCTIPMOV, pPIMOVIMI, pPIAUTLIQ,
						pPIPAGSIN, pPCMONEOP, pPIAUTLIQP, pPIDIFCAMBIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCADENA);
		cStmt.setObject(3, pPCADFORPAG);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPCUSUARI);
		cStmt.setObject(6, pPSPERSON);
		cStmt.setObject(7, pPCTIPMOV);
		cStmt.setObject(8, pPIMOVIMI);
		cStmt.setObject(9, pPIAUTLIQ);
		cStmt.setObject(10, pPIPAGSIN);
		cStmt.setObject(11, pPCMONEOP);
		cStmt.setObject(12, pPIAUTLIQP);
		cStmt.setObject(13, pPIDIFCAMBIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(String pPCADENA, String pPCADFORPAG,
			java.math.BigDecimal pPCEMPRES, String pPCUSUARI, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPIAUTLIQ,
			java.math.BigDecimal pPIPAGSIN, String pPCMONEOP, java.math.BigDecimal pPIAUTLIQP,
			java.math.BigDecimal pPIDIFCAMBIO) throws Exception {
		return this.callPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(pPCADENA, pPCADFORPAG, pPCEMPRES, pPCUSUARI, pPSPERSON,
				pPCTIPMOV, pPIMOVIMI, pPIAUTLIQ, pPIPAGSIN, pPCMONEOP, pPIAUTLIQP, pPIDIFCAMBIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_UPD_PAGOS_MASIVO

	// Bug 0032660/0190245 - 12/11/2014 - JMF
	// --START-PAC_IAX_CAJA.F_INS_MOVTOCAJA(PSPERSON, PCTIPMOV, PIMOVIMI, PIAUTLIQ,
	// PIPAGSIN, PCMONEOP, PCMEDMOV, PNCHEQUE, PCBANCO, PCCC, PCTIPTAR, PNTARGET,
	// PFCADTAR, PCMANUAL, PCESTADO, PSSEGURO, PSSEGURO_D, PPAMOUNT, PCRAZON)
	private HashMap callPAC_IAX_CAJA__F_INS_MOVTOCAJA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPMOV,
			java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPIAUTLIQ, java.math.BigDecimal pPIPAGSIN,
			String pPCMONEOP, java.math.BigDecimal pPCMEDMOV, String pPNCHEQUE, java.math.BigDecimal pPCBANCO,
			String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET, String pPFCADTAR,
			java.math.BigDecimal pPCMANUAL, java.math.BigDecimal pPCESTADO, String pPSSEGURO, String pPSSEGURO_D,
			java.math.BigDecimal pPPAMOUNT, java.math.BigDecimal pPCRAZON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_INS_MOVTOCAJA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCTIPMOV", "pPIMOVIMI", "pPIAUTLIQ", "pPIPAGSIN", "pPCMONEOP",
						"pPCMEDMOV", "pPNCHEQUE", "pPCBANCO", "pPCCC", "pPCTIPTAR", "pPNTARGET", "pPFCADTAR",
						"pPCMANUAL", "pPCESTADO", "pPSSEGURO", "pPSSEGURO_D", "pPPAMOUNT", "pPCRAZON" },
				new Object[] { pPSPERSON, pPCTIPMOV, pPIMOVIMI, pPIAUTLIQ, pPIPAGSIN, pPCMONEOP, pPCMEDMOV, pPNCHEQUE,
						pPCBANCO, pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPCMANUAL, pPCESTADO, pPSSEGURO, pPSSEGURO_D,
						pPPAMOUNT, pPCRAZON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPMOV);
		cStmt.setObject(4, pPIMOVIMI);
		cStmt.setObject(5, pPIAUTLIQ);
		cStmt.setObject(6, pPIPAGSIN);
		cStmt.setObject(7, pPCMONEOP);
		cStmt.setObject(8, pPCMEDMOV);
		cStmt.setObject(9, pPNCHEQUE);
		cStmt.setObject(10, pPCBANCO);
		cStmt.setObject(11, pPCCC);
		cStmt.setObject(12, pPCTIPTAR);
		cStmt.setObject(13, pPNTARGET);
		cStmt.setObject(14, pPFCADTAR);
		cStmt.setObject(17, pPCMANUAL);
		cStmt.setObject(18, pPCESTADO);
		cStmt.setObject(19, pPSSEGURO);
		cStmt.setObject(20, pPSSEGURO_D);
		cStmt.setObject(21, pPPAMOUNT);
		cStmt.setObject(22, pPCRAZON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de "PSEQCAJA"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSEQCAJA", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PSEQCAJA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_INS_MOVTOCAJA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPMOV,
			java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPIAUTLIQ, java.math.BigDecimal pPIPAGSIN,
			String pPCMONEOP, java.math.BigDecimal pPCMEDMOV, String pPNCHEQUE, java.math.BigDecimal pPCBANCO,
			String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET, String pPFCADTAR,
			java.math.BigDecimal pPCMANUAL, java.math.BigDecimal pPCESTADO, String pPSSEGURO, String pPSSEGURO_D,
			java.math.BigDecimal pPPAMOUNT, java.math.BigDecimal pPCRAZON) throws Exception {
		return this.callPAC_IAX_CAJA__F_INS_MOVTOCAJA(pPSPERSON, pPCTIPMOV, pPIMOVIMI, pPIAUTLIQ, pPIPAGSIN, pPCMONEOP,
				pPCMEDMOV, pPNCHEQUE, pPCBANCO, pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPCMANUAL, pPCESTADO, pPSSEGURO,
				pPSSEGURO_D, pPPAMOUNT, pPCRAZON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_INS_MOVTOCAJA

	// --START-PAC_IAX_CAJA.F_OBTENERMVTOCAJA(PCUSUARI, PFFECMOV_INI, PFFECMOV_FIN,
	// PCTIPMOV, PCMEDMOV)

	private HashMap callPAC_IAX_CAJA__F_OBTENERMVTOCAJA(String pPCUSUARI, java.sql.Date pPFFECMOV_INI,
			java.sql.Date pPFFECMOV_FIN, java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPCMEDMOV)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_OBTENERMVTOCAJA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCUSUARI", "pPFFECMOV_INI", "pPFFECMOV_FIN", "pPCTIPMOV", "pPCMEDMOV" },
				new Object[] { pPCUSUARI, pPFFECMOV_INI, pPFFECMOV_FIN, pPCTIPMOV, pPCMEDMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSUARI);
		cStmt.setObject(3, pPFFECMOV_INI);
		cStmt.setObject(4, pPFFECMOV_FIN);
		cStmt.setObject(5, pPCTIPMOV);
		cStmt.setObject(6, pPCMEDMOV);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_OBTENERMVTOCAJA(String pPCUSUARI, java.sql.Date pPFFECMOV_INI,
			java.sql.Date pPFFECMOV_FIN, java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPCMEDMOV)
			throws Exception {
		return this.callPAC_IAX_CAJA__F_OBTENERMVTOCAJA(pPCUSUARI, pPFFECMOV_INI, pPFFECMOV_FIN, pPCTIPMOV, pPCMEDMOV); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_OBTENERMVTOCAJA

	// --START-PAC_IAX_CAJA.F_GET_AGENTE(PCAGENTE)

	private HashMap callPAC_IAX_CAJA__F_GET_AGENTE(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_GET_AGENTE(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_GET_AGENTE(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_CAJA__F_GET_AGENTE(pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_GET_AGENTE
	// --START-PAC_IAX_CAJA.F_INS_DET_AUTLIQ(PCAGENTE, PSPROCES, PCMONOPE, PSPRODUC,
	// PIAUTLIQ)

	private HashMap callPAC_IAX_CAJA__F_INS_DET_AUTLIQ(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCMONOPE, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPIAUTLIQ)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_INS_DET_AUTLIQ(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPSPROCES", "pPCMONOPE", "pPSPRODUC", "pPIAUTLIQ" },
				new Object[] { pPCAGENTE, pPSPROCES, pPCMONOPE, pPSPRODUC, pPIAUTLIQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPCMONOPE);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPIAUTLIQ);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_INS_DET_AUTLIQ(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCMONOPE, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPIAUTLIQ)
			throws Exception {
		return this.callPAC_IAX_CAJA__F_INS_DET_AUTLIQ(pPCAGENTE, pPSPROCES, pPCMONOPE, pPSPRODUC, pPIAUTLIQ); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_INS_DET_AUTLIQ

	// Bug 0032660/0190245 - 12/11/2014 - JMF
	// --START-PAC_IAX_CAJA.F_INS_MOVTO_PINICIAL(PSPERSON, PCTIPMOV, PIMOVIMI,
	// PSPRODUC, PCMONEOP, PCMEDMOV, PNCHEQUE, PCBANCO, PCCC, PCTIPTAR, PNTARGET,
	// PFCADTAR, PFCAMBIO, PCAUTORIZA, PNULTDIGTAR, PNCUOTAS, PCCOMERCIO)
	private HashMap callPAC_IAX_CAJA__F_INS_MOVTO_PINICIAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPSPRODUC,
			String pPCMONEOP, java.math.BigDecimal pPCMEDMOV, String pPNCHEQUE, java.math.BigDecimal pPCBANCO,
			String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET, String pPFCADTAR,
			java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCAUTORIZA, java.math.BigDecimal pPNULTDIGTAR,
			java.math.BigDecimal pPNCUOTAS, java.math.BigDecimal pPCCOMERCIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_INS_MOVTO_PINICIAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCTIPMOV", "pPIMOVIMI", "pPSPRODUC", "pPCMONEOP", "pPCMEDMOV",
						"pPNCHEQUE", "pPCBANCO", "pPCCC", "pPCTIPTAR", "pPNTARGET", "pPFCADTAR", "pPFCAMBIO",
						"pPCAUTORIZA", "pPNULTDIGTAR", "pPNCUOTAS", "pPCCOMERCIO" },
				new Object[] { pPSPERSON, pPCTIPMOV, pPIMOVIMI, pPSPRODUC, pPCMONEOP, pPCMEDMOV, pPNCHEQUE, pPCBANCO,
						pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPFCAMBIO, pPCAUTORIZA, pPNULTDIGTAR, pPNCUOTAS,
						pPCCOMERCIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPMOV);
		cStmt.setObject(4, pPIMOVIMI);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCMONEOP);
		cStmt.setObject(7, pPCMEDMOV);
		cStmt.setObject(8, pPNCHEQUE);
		cStmt.setObject(9, pPCBANCO);
		cStmt.setObject(10, pPCCC);
		cStmt.setObject(11, pPCTIPTAR);
		cStmt.setObject(12, pPNTARGET);
		cStmt.setObject(13, pPFCADTAR);
		cStmt.setObject(14, pPFCAMBIO);
		cStmt.setObject(17, pPCAUTORIZA);
		cStmt.setObject(18, pPNULTDIGTAR);
		cStmt.setObject(19, pPNCUOTAS);
		cStmt.setObject(20, pPCCOMERCIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de "PSEQCAJA"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSEQCAJA", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PSEQCAJA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_INS_MOVTO_PINICIAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPSPRODUC,
			String pPCMONEOP, java.math.BigDecimal pPCMEDMOV, String pPNCHEQUE, java.math.BigDecimal pPCBANCO,
			String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET, String pPFCADTAR,
			java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCAUTORIZA, java.math.BigDecimal pPNULTDIGTAR,
			java.math.BigDecimal pPNCUOTAS, java.math.BigDecimal pPCCOMERCIO) throws Exception {
		return this.callPAC_IAX_CAJA__F_INS_MOVTO_PINICIAL(pPSPERSON, pPCTIPMOV, pPIMOVIMI, pPSPRODUC, pPCMONEOP,
				pPCMEDMOV, pPNCHEQUE, pPCBANCO, pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPFCAMBIO, pPCAUTORIZA,
				pPNULTDIGTAR, pPNCUOTAS, pPCCOMERCIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_INS_MOVTO_PINICIAL

	// Bug 0032660/0190245 - 12/11/2014 - JMF
	// --START-PAC_IAX_CAJA.F_INS_PAGOS_REC(LISTA_RECIBOS, PSPERSON, PCTIPMOV,
	// PIMOVIMI, PIAUTLIQ, PIPAGSIN, PCMONEOP, PCMEDMOV, PNCHEQUE, PCBANCO, PCCC,
	// PCTIPTAR, PNTARGET, PFCADTAR, PFCAMBIO, PIDIFCAMBIO, PCAUTORIZA, PNULTDIGTAR,
	// PNCUOTAS, PCCOMERCIO)
	private HashMap callPAC_IAX_CAJA__F_INS_PAGOS_REC(String pLISTA_RECIBOS, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPIAUTLIQ,
			java.math.BigDecimal pPIPAGSIN, String pPCMONEOP, java.math.BigDecimal pPCMEDMOV, String pPNCHEQUE,
			java.math.BigDecimal pPCBANCO, String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET,
			String pPFCADTAR, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPIDIFCAMBIO,
			java.math.BigDecimal pPCAUTORIZA, java.math.BigDecimal pPNULTDIGTAR, java.math.BigDecimal pPNCUOTAS,
			java.math.BigDecimal pPCCOMERCIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_INS_PAGOS_REC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pLISTA_RECIBOS", "pPSPERSON", "pPCTIPMOV", "pPIMOVIMI", "pPIAUTLIQ",
				"pPIPAGSIN", "pPCMONEOP", "pPCMEDMOV", "pPNCHEQUE", "pPCBANCO", "pPCCC", "pPCTIPTAR", "pPNTARGET",
				"pPFCADTAR", "pPFCAMBIO", "pPIDIFCAMBIO", "pPCAUTORIZA", "pPNULTDIGTAR", "pPNCUOTAS", "pPCCOMERCIO" },
				new Object[] { pLISTA_RECIBOS, pPSPERSON, pPCTIPMOV, pPIMOVIMI, pPIAUTLIQ, pPIPAGSIN, pPCMONEOP,
						pPCMEDMOV, pPNCHEQUE, pPCBANCO, pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPFCAMBIO, pPIDIFCAMBIO,
						pPCAUTORIZA, pPNULTDIGTAR, pPNCUOTAS, pPCCOMERCIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pLISTA_RECIBOS);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPCTIPMOV);
		cStmt.setObject(5, pPIMOVIMI);
		cStmt.setObject(6, pPIAUTLIQ);
		cStmt.setObject(7, pPIPAGSIN);
		cStmt.setObject(8, pPCMONEOP);
		cStmt.setObject(9, pPCMEDMOV);
		cStmt.setObject(10, pPNCHEQUE);
		cStmt.setObject(11, pPCBANCO);
		cStmt.setObject(12, pPCCC);
		cStmt.setObject(13, pPCTIPTAR);
		cStmt.setObject(14, pPNTARGET);
		cStmt.setObject(15, pPFCADTAR);
		cStmt.setObject(18, pPFCAMBIO);
		cStmt.setObject(19, pPIDIFCAMBIO);
		cStmt.setObject(20, pPCAUTORIZA);
		cStmt.setObject(21, pPNULTDIGTAR);
		cStmt.setObject(22, pPNCUOTAS);
		cStmt.setObject(23, pPCCOMERCIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de "PSEQCAJA"
		cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSEQCAJA", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("PSEQCAJA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_INS_PAGOS_REC(String pLISTA_RECIBOS, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPIAUTLIQ,
			java.math.BigDecimal pPIPAGSIN, String pPCMONEOP, java.math.BigDecimal pPCMEDMOV, String pPNCHEQUE,
			java.math.BigDecimal pPCBANCO, String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET,
			String pPFCADTAR, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPIDIFCAMBIO,
			java.math.BigDecimal pPCAUTORIZA, java.math.BigDecimal pPNULTDIGTAR, java.math.BigDecimal pPNCUOTAS,
			java.math.BigDecimal pPCCOMERCIO) throws Exception {
		return this.callPAC_IAX_CAJA__F_INS_PAGOS_REC(pLISTA_RECIBOS, pPSPERSON, pPCTIPMOV, pPIMOVIMI, pPIAUTLIQ,
				pPIPAGSIN, pPCMONEOP, pPCMEDMOV, pPNCHEQUE, pPCBANCO, pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPFCAMBIO,
				pPIDIFCAMBIO, pPCAUTORIZA, pPNULTDIGTAR, pPNCUOTAS, pPCCOMERCIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_INS_PAGOS_REC

	// --START-PAC_IAX_CAJA.F_LEE_SOBRANTE(PCAGENTE, PTFICHERO)
	private HashMap callPAC_IAX_CAJA__F_LEE_SOBRANTE(java.math.BigDecimal pPCAGENTE, String pPTFICHERO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_LEE_SOBRANTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPTFICHERO" }, new Object[] { pPCAGENTE, pPTFICHERO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPTFICHERO);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_LEE_SOBRANTE(java.math.BigDecimal pPCAGENTE, String pPTFICHERO)
			throws Exception {
		return this.callPAC_IAX_CAJA__F_LEE_SOBRANTE(pPCAGENTE, pPTFICHERO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_LEE_SOBRANTE

	// --START-PAC_IAX_CAJA.F_LEE_PAGOS_PDTES(PCAGENTE)
	private HashMap callPAC_IAX_CAJA__F_LEE_PAGOS_PDTES(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_LEE_PAGOS_PDTES(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_LEE_PAGOS_PDTES(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_CAJA__F_LEE_PAGOS_PDTES(pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_LEE_PAGOS_PDTES

	// --START-PAC_IAX_CAJA.F_INS_DEVOLUCION(PCADENA)
	private HashMap callPAC_IAX_CAJA__F_INS_DEVOLUCION(String pPCADENA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_INS_DEVOLUCION(?, ?)}";

		logCall(callQuery, new String[] { "pPCADENA" }, new Object[] { pPCADENA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCADENA);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_INS_DEVOLUCION(String pPCADENA) throws Exception {
		return this.callPAC_IAX_CAJA__F_INS_DEVOLUCION(pPCADENA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAJA.F_INS_DEVOLUCION
	// --START-PAC_IAX_CAJA.F_GETDESCRIPVALORES(CLAVE, VALOR)
	private HashMap callPAC_IAX_CAJA__F_GETDESCRIPVALORES(java.math.BigDecimal pCLAVE, java.math.BigDecimal pVALOR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_GETDESCRIPVALORES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCLAVE", "pVALOR" }, new Object[] { pCLAVE, pVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
		cStmt.setObject(3, pVALOR);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CAJA__F_GETDESCRIPVALORES(java.math.BigDecimal pCLAVE, java.math.BigDecimal pVALOR)
			throws Exception {
		return this.callPAC_IAX_CAJA__F_GETDESCRIPVALORES(pCLAVE, pVALOR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_GETDESCRIPVALORES

	// Bug 0032660/0190245 - 12/11/2014 - JMF
	// --START-PAC_IAX_CAJA.F_APUNTEMANUAL(PCTIPMOV, PCUSUARI1, PCUSUARI2, PCMONEOP,
	// PIMOVIMI, PFFECMOV, PTMOTAPU)
	private HashMap callPAC_IAX_CAJA__F_APUNTEMANUAL(java.math.BigDecimal pPCTIPMOV, String pPCUSUARI1,
			String pPCUSUARI2, String pPCMONEOP, java.math.BigDecimal pPIMOVIMI, java.sql.Date pPFFECMOV,
			String pPTMOTAPU) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_APUNTEMANUAL(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPMOV", "pPCUSUARI1", "pPCUSUARI2", "pPCMONEOP", "pPIMOVIMI", "pPFFECMOV",
						"pPTMOTAPU" },
				new Object[] { pPCTIPMOV, pPCUSUARI1, pPCUSUARI2, pPCMONEOP, pPIMOVIMI, pPFFECMOV, pPTMOTAPU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPMOV);
		cStmt.setObject(3, pPCUSUARI1);
		cStmt.setObject(4, pPCUSUARI2);
		cStmt.setObject(5, pPCMONEOP);
		cStmt.setObject(6, pPIMOVIMI);
		cStmt.setObject(7, pPFFECMOV);
		cStmt.setObject(8, pPTMOTAPU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CAJA__F_APUNTEMANUAL(java.math.BigDecimal pPCTIPMOV, String pPCUSUARI1,
			String pPCUSUARI2, String pPCMONEOP, java.math.BigDecimal pPIMOVIMI, java.sql.Date pPFFECMOV,
			String pPTMOTAPU) throws Exception {
		return this.callPAC_IAX_CAJA__F_APUNTEMANUAL(pPCTIPMOV, pPCUSUARI1, pPCUSUARI2, pPCMONEOP, pPIMOVIMI, pPFFECMOV,
				pPTMOTAPU);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_APUNTEMANUAL

	// --START-PAC_IAX_CAJA.F_VALIDA_VALOR_INGRESADO(PNREFDEPOSITO, PIMOVIMI,
	// PCMONEOP)
	private HashMap callPAC_IAX_CAJA__F_VALIDA_VALOR_INGRESADO(java.math.BigDecimal pPNREFDEPOSITO,
			java.math.BigDecimal pPIMOVIMI, String pPCMONEOP) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_VALIDA_VALOR_INGRESADO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREFDEPOSITO", "pPIMOVIMI", "pPCMONEOP" },
				new Object[] { pPNREFDEPOSITO, pPIMOVIMI, pPCMONEOP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREFDEPOSITO);
		cStmt.setObject(3, pPIMOVIMI);
		cStmt.setObject(4, pPCMONEOP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PCONFIRM"
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
			retVal.put("PCONFIRM", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCONFIRM", null);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_VALIDA_VALOR_INGRESADO(java.math.BigDecimal pPNREFDEPOSITO,
			java.math.BigDecimal pPIMOVIMI, String pPCMONEOP) throws Exception {
		return this.callPAC_IAX_CAJA__F_VALIDA_VALOR_INGRESADO(pPNREFDEPOSITO, pPIMOVIMI, pPCMONEOP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_VALIDA_VALOR_INGRESADO

	// --START-PAC_IAX_CAJA.F_GET_CHEQUES(PNREFDEPOSITO, PIMOVIMI, PCMONEOP)
	private HashMap callPAC_IAX_CAJA__F_GET_CHEQUES(java.math.BigDecimal pPNREFDEPOSITO, java.math.BigDecimal pPIMOVIMI,
			String pPCMONEOP) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_GET_CHEQUES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREFDEPOSITO", "pPIMOVIMI", "pPCMONEOP" },
				new Object[] { pPNREFDEPOSITO, pPIMOVIMI, pPCMONEOP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREFDEPOSITO);
		cStmt.setObject(3, pPIMOVIMI);
		cStmt.setObject(4, pPCMONEOP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CAJA__F_GET_CHEQUES(java.math.BigDecimal pPNREFDEPOSITO,
			java.math.BigDecimal pPIMOVIMI, String pPCMONEOP) throws Exception {
		return this.callPAC_IAX_CAJA__F_GET_CHEQUES(pPNREFDEPOSITO, pPIMOVIMI, pPCMONEOP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_GET_CHEQUES

	// --START-PAC_IAX_CAJA.F_CONFIRMADEPOSITO(PCMONEOP, PIMOVIMI, PNREFDEPOSITO,
	// PCMEDMOV, PCHEQUES)
	private HashMap callPAC_IAX_CAJA__F_CONFIRMADEPOSITO(java.math.BigDecimal pPCMONEOP, java.math.BigDecimal pPIMOVIMI,
			java.math.BigDecimal pPNREFDEPOSITO, java.math.BigDecimal pPCMEDMOV, String pPCHEQUES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_CONFIRMADEPOSITO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMONEOP", "pPIMOVIMI", "pPNREFDEPOSITO", "pPCMEDMOV", "pPCHEQUES" },
				new Object[] { pPCMONEOP, pPIMOVIMI, pPNREFDEPOSITO, pPCMEDMOV, pPCHEQUES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMONEOP);
		cStmt.setObject(3, pPIMOVIMI);
		cStmt.setObject(4, pPNREFDEPOSITO);
		cStmt.setObject(5, pPCMEDMOV);
		cStmt.setObject(6, pPCHEQUES);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_CONFIRMADEPOSITO(java.math.BigDecimal pPCMONEOP,
			java.math.BigDecimal pPIMOVIMI, java.math.BigDecimal pPNREFDEPOSITO, java.math.BigDecimal pPCMEDMOV,
			String pPCHEQUES) throws Exception {
		return this.callPAC_IAX_CAJA__F_CONFIRMADEPOSITO(pPCMONEOP, pPIMOVIMI, pPNREFDEPOSITO, pPCMEDMOV, pPCHEQUES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_CONFIRMADEPOSITO

	// --START-PAC_IAX_CAJA.F_COMERCIO_USUARIO()
	private HashMap callPAC_IAX_CAJA__F_COMERCIO_USUARIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_COMERCIO_USUARIO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PCOMERCIO"
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
			retVal.put("PCOMERCIO", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCOMERCIO", null);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_COMERCIO_USUARIO() throws Exception {
		return this.callPAC_IAX_CAJA__F_COMERCIO_USUARIO();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAJA.F_COMERCIO_USUARIO
	// --START-PAC_IAX_CAJA.F_LEE_CAJAMOV(PSSEGURO, PSEQCAJA, PSTATUS)
	private HashMap callPAC_IAX_CAJA__F_LEE_CAJAMOV(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSEQCAJA,
			java.math.BigDecimal pPSTATUS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_LEE_CAJAMOV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSEQCAJA", "pPSTATUS" },
				new Object[] { pPSSEGURO, pPSEQCAJA, pPSTATUS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSEQCAJA);
		cStmt.setObject(4, pPSTATUS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CAJA__F_LEE_CAJAMOV(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSEQCAJA,
			java.math.BigDecimal pPSTATUS) throws Exception {
		return this.callPAC_IAX_CAJA__F_LEE_CAJAMOV(pPSSEGURO, pPSEQCAJA, pPSTATUS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAJA.F_LEE_CAJAMOV
	// --START-PAC_IAX_CAJA.F_INSMOVCAJA_SPL(PCEMPRES, PSSEGURO, PIMPORTE, PNCHEQUE,
	// PCESTCHQ, PCBANCO, PCCC, PCTIPTAR, PNTARGET, PFCADTAR, PCMEDMOV, PCMONEOP,
	// PNREFDEPOSITO, PCAUTORIZA, PNULTDIGTAR, PNCUOTAS, PCCOMERCIO, PCESTADO,
	// PSSEGURO_D, PCRAZON, PSEQCAJA_O, PSPERSON)
	private HashMap callPAC_IAX_CAJA__F_INSMOVCAJA_SPL(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPIMPORTE, String pPNCHEQUE, java.math.BigDecimal pPCESTCHQ,
			java.math.BigDecimal pPCBANCO, String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET,
			String pPFCADTAR, java.math.BigDecimal pPCMEDMOV, java.math.BigDecimal pPCMONEOP,
			java.math.BigDecimal pPNREFDEPOSITO, java.math.BigDecimal pPCAUTORIZA, java.math.BigDecimal pPNULTDIGTAR,
			java.math.BigDecimal pPNCUOTAS, java.math.BigDecimal pPCCOMERCIO, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPSSEGURO_D, java.math.BigDecimal pPCRAZON, java.math.BigDecimal pPSEQCAJA_O,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_INSMOVCAJA_SPL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPSSEGURO", "pPIMPORTE", "pPNCHEQUE", "pPCESTCHQ", "pPCBANCO", "pPCCC",
						"pPCTIPTAR", "pPNTARGET", "pPFCADTAR", "pPCMEDMOV", "pPCMONEOP", "pPNREFDEPOSITO",
						"pPCAUTORIZA", "pPNULTDIGTAR", "pPNCUOTAS", "pPCCOMERCIO", "pPCESTADO", "pPSSEGURO_D",
						"pPCRAZON", "pPSEQCAJA_O", "pPSPERSON" },
				new Object[] { pPCEMPRES, pPSSEGURO, pPIMPORTE, pPNCHEQUE, pPCESTCHQ, pPCBANCO, pPCCC, pPCTIPTAR,
						pPNTARGET, pPFCADTAR, pPCMEDMOV, pPCMONEOP, pPNREFDEPOSITO, pPCAUTORIZA, pPNULTDIGTAR,
						pPNCUOTAS, pPCCOMERCIO, pPCESTADO, pPSSEGURO_D, pPCRAZON, pPSEQCAJA_O, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPIMPORTE);
		cStmt.setObject(5, pPNCHEQUE);
		cStmt.setObject(6, pPCESTCHQ);
		cStmt.setObject(7, pPCBANCO);
		cStmt.setObject(8, pPCCC);
		cStmt.setObject(9, pPCTIPTAR);
		cStmt.setObject(10, pPNTARGET);
		cStmt.setObject(11, pPFCADTAR);
		cStmt.setObject(12, pPCMEDMOV);
		cStmt.setObject(13, pPCMONEOP);
		cStmt.setObject(14, pPNREFDEPOSITO);
		cStmt.setObject(15, pPCAUTORIZA);
		cStmt.setObject(16, pPNULTDIGTAR);
		cStmt.setObject(17, pPNCUOTAS);
		cStmt.setObject(18, pPCCOMERCIO);
		cStmt.setObject(19, pPCESTADO);
		cStmt.setObject(20, pPSSEGURO_D);
		cStmt.setObject(21, pPCRAZON);
		cStmt.setObject(22, pPSEQCAJA_O);
		cStmt.setObject(23, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(24, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(24));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAJA__F_INSMOVCAJA_SPL(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPIMPORTE, String pPNCHEQUE, java.math.BigDecimal pPCESTCHQ,
			java.math.BigDecimal pPCBANCO, String pPCCC, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPNTARGET,
			String pPFCADTAR, java.math.BigDecimal pPCMEDMOV, java.math.BigDecimal pPCMONEOP,
			java.math.BigDecimal pPNREFDEPOSITO, java.math.BigDecimal pPCAUTORIZA, java.math.BigDecimal pPNULTDIGTAR,
			java.math.BigDecimal pPNCUOTAS, java.math.BigDecimal pPCCOMERCIO, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPSSEGURO_D, java.math.BigDecimal pPCRAZON, java.math.BigDecimal pPSEQCAJA_O,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_CAJA__F_INSMOVCAJA_SPL(pPCEMPRES, pPSSEGURO, pPIMPORTE, pPNCHEQUE, pPCESTCHQ, pPCBANCO,
				pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPCMEDMOV, pPCMONEOP, pPNREFDEPOSITO, pPCAUTORIZA, pPNULTDIGTAR,
				pPNCUOTAS, pPCCOMERCIO, pPCESTADO, pPSSEGURO_D, pPCRAZON, pPSEQCAJA_O, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAJA.F_INSMOVCAJA_SPL
	// --START-PAC_IAX_CAJA.F_GET_SUMA_CAJA(PSSEGURO, PSPERSON, PCESTADO)
	private HashMap callPAC_IAX_CAJA__F_GET_SUMA_CAJA(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_GET_SUMA_CAJA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSPERSON", "pPCESTADO" },
				new Object[] { pPSSEGURO, pPSPERSON, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPCESTADO);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_GET_SUMA_CAJA(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_CAJA__F_GET_SUMA_CAJA(pPSSEGURO, pPSPERSON, pPCESTADO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAJA.F_GET_SUMA_CAJA
	// --START-PAC_IAX_CAJA.F_DELMOVCAJA_SPL(PSSEGURO, PSEQCAJA, PNNUMLIN, PCESTADO)
	private HashMap callPAC_IAX_CAJA__F_DELMOVCAJA_SPL(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSEQCAJA,
			java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_DELMOVCAJA_SPL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSEQCAJA", "pPNNUMLIN", "pPCESTADO" },
				new Object[] { pPSSEGURO, pPSEQCAJA, pPNNUMLIN, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSEQCAJA);
		cStmt.setObject(4, pPNNUMLIN);
		cStmt.setObject(5, pPCESTADO);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_DELMOVCAJA_SPL(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSEQCAJA,
			java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_CAJA__F_DELMOVCAJA_SPL(pPSSEGURO, pPSEQCAJA, pPNNUMLIN, pPCESTADO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_DELMOVCAJA_SPL

	// --START-PAC_IAX_CAJA.F_INSMOVCAJA_APPLY(PSSEGURO, PSPERSON)
	private HashMap callPAC_IAX_CAJA__F_INSMOVCAJA_APPLY(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_INSMOVCAJA_APPLY(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSPERSON" }, new Object[] { pPSSEGURO, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_INSMOVCAJA_APPLY(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_CAJA__F_INSMOVCAJA_APPLY(pPSSEGURO, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_INSMOVCAJA_APPLY

	// --START-PAC_IAX_CAJA.F_LEE_DATMEDIO_REEMBOLSO(PSSEGURO, PSPERSON, PCESTADO)
	private HashMap callPAC_IAX_CAJA__F_LEE_DATMEDIO_REEMBOLSO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_LEE_DATMEDIO_REEMBOLSO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSPERSON", "pPCESTADO" },
				new Object[] { pPSSEGURO, pPSPERSON, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPCESTADO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CAJA__F_LEE_DATMEDIO_REEMBOLSO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_CAJA__F_LEE_DATMEDIO_REEMBOLSO(pPSSEGURO, pPSPERSON, pPCESTADO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAJA.F_LEE_DATMEDIO_REEMBOLSO
	// --START-PAC_IAX_CAJA.F_APRUEBA_CAJA_SPL(PSSEGURO, PSPERSON, PSEQCAJA,
	// PAUTORIZA)
	private HashMap callPAC_IAX_CAJA__F_APRUEBA_CAJA_SPL(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSEQCAJA, java.math.BigDecimal pPAUTORIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA.F_APRUEBA_CAJA_SPL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSPERSON", "pPSEQCAJA", "pPAUTORIZA" },
				new Object[] { pPSSEGURO, pPSPERSON, pPSEQCAJA, pPAUTORIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPSEQCAJA);
		cStmt.setObject(5, pPAUTORIZA);
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

	public HashMap ejecutaPAC_IAX_CAJA__F_APRUEBA_CAJA_SPL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSEQCAJA, java.math.BigDecimal pPAUTORIZA)
			throws Exception {
		return this.callPAC_IAX_CAJA__F_APRUEBA_CAJA_SPL(pPSSEGURO, pPSPERSON, pPSEQCAJA, pPAUTORIZA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA.F_APRUEBA_CAJA_SPL

}
