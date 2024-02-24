//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

//WLS-Ready

public class PAC_IAX_ADM extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ADM.class);
	private Connection conn = null;

	public PAC_IAX_ADM(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ADM.F_GET_CONSULTARECIBOS(PNRECIBO, PCEMPRES, PSPRODUC,
	// PNPOLIZA, PNCERTIF, PCIPREC, PCESTREC, PFEMISIOINI, PFEMISIOFIN, PFEFEINI,
	// PFEFEFIN, PTIPO, PSPERSON, PCRECCIA, PCPOLCIA, PCRAMO, PCSUCURSAL, PCAGENTE,
	// PCTIPCOB, PCONDICION)
	private HashMap callPAC_IAX_ADM__F_GET_CONSULTARECIBOS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPCIPREC, java.math.BigDecimal pPCESTREC,
			java.sql.Date pPFEMISIOINI, java.sql.Date pPFEMISIOFIN, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN,
			java.math.BigDecimal pPTIPO, java.math.BigDecimal pPSPERSON, String pPCRECCIA, String pPCPOLCIA,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPCOB, String pPCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_CONSULTARECIBOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRECIBO", "pPCEMPRES", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPCIPREC", "pPCESTREC",
						"pPFEMISIOINI", "pPFEMISIOFIN", "pPFEFEINI", "pPFEFEFIN", "pPTIPO", "pPSPERSON", "pPCRECCIA",
						"pPCPOLCIA", "pPCRAMO", "pPCSUCURSAL", "pPCAGENTE", "pPCTIPCOB", "pPCONDICION" },
				new Object[] { pPNRECIBO, pPCEMPRES, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPCIPREC, pPCESTREC, pPFEMISIOINI,
						pPFEMISIOFIN, pPFEFEINI, pPFEFEFIN, pPTIPO, pPSPERSON, pPCRECCIA, pPCPOLCIA, pPCRAMO,
						pPCSUCURSAL, pPCAGENTE, pPCTIPCOB, pPCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNCERTIF);
		cStmt.setObject(7, pPCIPREC);
		cStmt.setObject(8, pPCESTREC);
		cStmt.setObject(9, pPFEMISIOINI);
		cStmt.setObject(10, pPFEMISIOFIN);
		cStmt.setObject(11, pPFEFEINI);
		cStmt.setObject(12, pPFEFEFIN);
		cStmt.setObject(13, pPTIPO);
		cStmt.setObject(14, pPSPERSON);
		cStmt.setObject(15, pPCRECCIA);
		cStmt.setObject(16, pPCPOLCIA);
		cStmt.setObject(17, pPCRAMO);
		cStmt.setObject(18, pPCSUCURSAL);
		cStmt.setObject(19, pPCAGENTE);
		cStmt.setObject(20, pPCTIPCOB);
		cStmt.setObject(21, pPCONDICION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(22, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ADM__F_GET_CONSULTARECIBOS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPCIPREC, java.math.BigDecimal pPCESTREC,
			java.sql.Date pPFEMISIOINI, java.sql.Date pPFEMISIOFIN, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN,
			java.math.BigDecimal pPTIPO, java.math.BigDecimal pPSPERSON, String pPCRECCIA, String pPCPOLCIA,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPCOB, String pPCONDICION) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_CONSULTARECIBOS(pPNRECIBO, pPCEMPRES, pPSPRODUC, pPNPOLIZA, pPNCERTIF,
				pPCIPREC, pPCESTREC, pPFEMISIOINI, pPFEMISIOFIN, pPFEFEINI, pPFEFEFIN, pPTIPO, pPSPERSON, pPCRECCIA,
				pPCPOLCIA, pPCRAMO, pPCSUCURSAL, pPCAGENTE, pPCTIPCOB, pPCONDICION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_CONSULTARECIBOS

	// INI BUG IAXIS-13049 JRVG 15/07/2020 cambio a String de pPNRECCAJ
	// --START-PAC_IAX_ADM.F_GET_CONSULTARECIBOS_MV(PNRECIBO, PCEMPRES, PSPRODUC,
	// PNPOLIZA, PNCERTIF, PCIPREC, PCESTREC, PFEMISIOINI, PFEMISIOFIN, PFEFEINI,
	// PFEFEFIN, PTIPO, PSPERSON, PRECUNIF, PCESTIMP, PCRECCIA, PCPOLCIA, PCCOMPANI,
	// PLIQUIDAD, PFILTRO, PCRAMO, PCSUCURSAL, PCAGENTE, PCTIPCOB, PDOMI_SN, CBANCO,
	// CTIPCUENTA, COBBAN, PREBUT_INI, PNANUALI, PNFRACCI, PTIPNEGOC, PCONDICION,
	// PCTIPAGE01, PNRECCAJ, PCMRECA)
	private HashMap callPAC_IAX_ADM__F_GET_CONSULTARECIBOS_MV(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPCIPREC, java.math.BigDecimal pPCESTREC,
			java.sql.Date pPFEMISIOINI, java.sql.Date pPFEMISIOFIN, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN,
			java.math.BigDecimal pPTIPO, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPRECUNIF,
			java.math.BigDecimal pPCESTIMP, String pPCRECCIA, String pPCPOLCIA, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPLIQUIDAD, java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPCOB,
			java.math.BigDecimal pPDOMI_SN, java.math.BigDecimal pCBANCO, java.math.BigDecimal pCTIPCUENTA,
			java.math.BigDecimal pCOBBAN, String pPREBUT_INI, java.math.BigDecimal pPNANUALI,
			java.math.BigDecimal pPNFRACCI, java.math.BigDecimal pPTIPNEGOC, String pPCONDICION,
			java.math.BigDecimal pPCTIPAGE01, String pPNRECCAJ, java.math.BigDecimal pPCMRECA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_CONSULTARECIBOS_MV(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRECIBO", "pPCEMPRES", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPCIPREC", "pPCESTREC",
						"pPFEMISIOINI", "pPFEMISIOFIN", "pPFEFEINI", "pPFEFEFIN", "pPTIPO", "pPSPERSON", "pPRECUNIF",
						"pPCESTIMP", "pPCRECCIA", "pPCPOLCIA", "pPCCOMPANI", "pPLIQUIDAD", "pPFILTRO", "pPCRAMO",
						"pPCSUCURSAL", "pPCAGENTE", "pPCTIPCOB", "pPDOMI_SN", "pCBANCO", "pCTIPCUENTA", "pCOBBAN",
						"pPREBUT_INI", "pPNANUALI", "pPNFRACCI", "pPTIPNEGOC", "pPCONDICION", "pPCTIPAGE01",
						"pPNRECCAJ", "pPCMRECA" },
				new Object[] { pPNRECIBO, pPCEMPRES, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPCIPREC, pPCESTREC, pPFEMISIOINI,
						pPFEMISIOFIN, pPFEFEINI, pPFEFEFIN, pPTIPO, pPSPERSON, pPRECUNIF, pPCESTIMP, pPCRECCIA,
						pPCPOLCIA, pPCCOMPANI, pPLIQUIDAD, pPFILTRO, pPCRAMO, pPCSUCURSAL, pPCAGENTE, pPCTIPCOB,
						pPDOMI_SN, pCBANCO, pCTIPCUENTA, pCOBBAN, pPREBUT_INI, pPNANUALI, pPNFRACCI, pPTIPNEGOC,
						pPCONDICION, pPCTIPAGE01, pPNRECCAJ, pPCMRECA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNCERTIF);
		cStmt.setObject(7, pPCIPREC);
		cStmt.setObject(8, pPCESTREC);
		cStmt.setObject(9, pPFEMISIOINI);
		cStmt.setObject(10, pPFEMISIOFIN);
		cStmt.setObject(11, pPFEFEINI);
		cStmt.setObject(12, pPFEFEFIN);
		cStmt.setObject(13, pPTIPO);
		cStmt.setObject(14, pPSPERSON);
		cStmt.setObject(15, pPRECUNIF);
		cStmt.setObject(16, pPCESTIMP);
		cStmt.setObject(17, pPCRECCIA);
		cStmt.setObject(18, pPCPOLCIA);
		cStmt.setObject(19, pPCCOMPANI);
		cStmt.setObject(20, pPLIQUIDAD);
		cStmt.setObject(21, pPFILTRO);
		cStmt.setObject(22, pPCRAMO);
		cStmt.setObject(23, pPCSUCURSAL);
		cStmt.setObject(24, pPCAGENTE);
		cStmt.setObject(25, pPCTIPCOB);
		cStmt.setObject(26, pPDOMI_SN);
		cStmt.setObject(27, pCBANCO);
		cStmt.setObject(28, pCTIPCUENTA);
		cStmt.setObject(29, pCOBBAN);
		cStmt.setObject(30, pPREBUT_INI);
		cStmt.setObject(31, pPNANUALI);
		cStmt.setObject(32, pPNFRACCI);
		cStmt.setObject(33, pPTIPNEGOC);
		cStmt.setObject(34, pPCONDICION);
		cStmt.setObject(36, pPCTIPAGE01);
		cStmt.setObject(37, pPNRECCAJ);
		cStmt.setObject(38, pPCMRECA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(35, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(35));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ADM__F_GET_CONSULTARECIBOS_MV(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPCIPREC, java.math.BigDecimal pPCESTREC,
			java.sql.Date pPFEMISIOINI, java.sql.Date pPFEMISIOFIN, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN,
			java.math.BigDecimal pPTIPO, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPRECUNIF,
			java.math.BigDecimal pPCESTIMP, String pPCRECCIA, String pPCPOLCIA, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPLIQUIDAD, java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPCOB,
			java.math.BigDecimal pPDOMI_SN, java.math.BigDecimal pCBANCO, java.math.BigDecimal pCTIPCUENTA,
			java.math.BigDecimal pCOBBAN, String pPREBUT_INI, java.math.BigDecimal pPNANUALI,
			java.math.BigDecimal pPNFRACCI, java.math.BigDecimal pPTIPNEGOC, String pPCONDICION,
			java.math.BigDecimal pPCTIPAGE01, String pPNRECCAJ, java.math.BigDecimal pPCMRECA) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_CONSULTARECIBOS_MV(pPNRECIBO, pPCEMPRES, pPSPRODUC, pPNPOLIZA, pPNCERTIF,
				pPCIPREC, pPCESTREC, pPFEMISIOINI, pPFEMISIOFIN, pPFEFEINI, pPFEFEFIN, pPTIPO, pPSPERSON, pPRECUNIF,
				pPCESTIMP, pPCRECCIA, pPCPOLCIA, pPCCOMPANI, pPLIQUIDAD, pPFILTRO, pPCRAMO, pPCSUCURSAL, pPCAGENTE,
				pPCTIPCOB, pPDOMI_SN, pCBANCO, pCTIPCUENTA, pCOBBAN, pPREBUT_INI, pPNANUALI, pPNFRACCI, pPTIPNEGOC,
				pPCONDICION, pPCTIPAGE01, pPNRECCAJ, pPCMRECA);// AXIS-WLS1SERVER-Ready
	}
	// FIN BUG IAXIS-13049 JRVG 15/07/2020
	// --END-PAC_IAX_ADM.F_GET_CONSULTARECIBOS_MV

	// --START-PAC_IAX_ADM.F_GET_DATOSRECIBO(PNRECIBO)

	// --START-PAC_IAX_ADM.F_GET_DATOSRECIBO(PNRECIBO, PTOTAGRUP)

	private HashMap callPAC_IAX_ADM__F_GET_DATOSRECIBO(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPTOTAGRUP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_DATOSRECIBO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPTOTAGRUP" }, new Object[] { pPNRECIBO, pPTOTAGRUP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPTOTAGRUP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_RECIBOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPTOTAGRUP) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_DATOSRECIBO(pPNRECIBO, pPTOTAGRUP);
	}
	// --END-PAC_IAX_ADM.F_GET_DATOSRECIBO

	// --START-PAC_IAX_ADM.F_GET_DATOSRECIBO_MV(PNRECIBO, PTOTAGRUP)
	private HashMap callPAC_IAX_ADM__F_GET_DATOSRECIBO_MV(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPTOTAGRUP) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_DATOSRECIBO_MV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPTOTAGRUP" }, new Object[] { pPNRECIBO, pPTOTAGRUP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPTOTAGRUP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_RECIBOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO_MV(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPTOTAGRUP) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_DATOSRECIBO_MV(pPNRECIBO, pPTOTAGRUP);
	}
	// --END-PAC_IAX_ADM.F_GET_DATOSRECIBO_MV

	// --START-PAC_IAX_ADM.F_GET_IMPAGADOS(PSSEGURO, PNRECIBO, PSMOVREC)

	private HashMap callPAC_IAX_ADM__F_GET_IMPAGADOS(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_IMPAGADOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRECIBO", "pPSMOVREC" },
				new Object[] { pPSSEGURO, pPNRECIBO, pPSMOVREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPSMOVREC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ADM__F_GET_IMPAGADOS(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_IMPAGADOS(pPSSEGURO, pPNRECIBO, pPSMOVREC);
	}
	// --END-PAC_IAX_ADM.F_GET_IMPAGADOS

	// --START-PAC_IAX_ADM.F_AGRUPARECIBO(P_NRECIBOS)
	private HashMap callPAC_IAX_ADM__F_AGRUPARECIBO(String pP_NRECIBOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_AGRUPARECIBO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NRECIBOS" }, new Object[] { pP_NRECIBOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NRECIBOS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "P_NRECUNIF"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_LSTRECIBOSUNIF"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_NRECUNIF", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_NRECUNIF", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		try {
			retVal.put("P_LSTRECIBOSUNIF", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_LSTRECIBOSUNIF", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ADM__F_AGRUPARECIBO(String pP_NRECIBOS) throws Exception {
		return this.callPAC_IAX_ADM__F_AGRUPARECIBO(pP_NRECIBOS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_AGRUPARECIBO

	// --START-PAC_IAX_ADM.F_SET_IMPRECIBO(PNRECIBO, PNRIESGO, PIT1DTO, PIPRINET,
	// PIT1REC, PIT1CON, PIIPS, PIDGS, PIARBITR, PIFNG, PFEFECTO, PFVENCIM,
	// PCRECCIA, PICOMBRU, PCVALIDADO)

	private HashMap callPAC_IAX_ADM__F_SET_IMPRECIBO(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPIT1DTO, java.math.BigDecimal pPIPRINET, java.math.BigDecimal pPIT1REC,
			java.math.BigDecimal pPIT1CON, java.math.BigDecimal pPIIPS, java.math.BigDecimal pPIDGS,
			java.math.BigDecimal pPIARBITR, java.math.BigDecimal pPIFNG, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIM, String pPCRECCIA, java.math.BigDecimal pPICOMBRU, java.math.BigDecimal pPCVALIDADO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_SET_IMPRECIBO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRECIBO", "pPNRIESGO", "pPIT1DTO", "pPIPRINET", "pPIT1REC", "pPIT1CON", "pPIIPS",
						"pPIDGS", "pPIARBITR", "pPIFNG", "pPFEFECTO", "pPFVENCIM", "pPCRECCIA", "pPICOMBRU",
						"pPCVALIDADO" },
				new Object[] { pPNRECIBO, pPNRIESGO, pPIT1DTO, pPIPRINET, pPIT1REC, pPIT1CON, pPIIPS, pPIDGS, pPIARBITR,
						pPIFNG, pPFEFECTO, pPFVENCIM, pPCRECCIA, pPICOMBRU, pPCVALIDADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPIT1DTO);
		cStmt.setObject(5, pPIPRINET);
		cStmt.setObject(6, pPIT1REC);
		cStmt.setObject(7, pPIT1CON);
		cStmt.setObject(8, pPIIPS);
		cStmt.setObject(9, pPIDGS);
		cStmt.setObject(10, pPIARBITR);
		cStmt.setObject(11, pPIFNG);
		cStmt.setObject(12, pPFEFECTO);
		cStmt.setObject(13, pPFVENCIM);
		cStmt.setObject(14, pPCRECCIA);
		cStmt.setObject(15, pPICOMBRU);
		cStmt.setObject(16, pPCVALIDADO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ADM__F_SET_IMPRECIBO(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPIT1DTO, java.math.BigDecimal pPIPRINET, java.math.BigDecimal pPIT1REC,
			java.math.BigDecimal pPIT1CON, java.math.BigDecimal pPIIPS, java.math.BigDecimal pPIDGS,
			java.math.BigDecimal pPIARBITR, java.math.BigDecimal pPIFNG, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIM, String pPCRECCIA, java.math.BigDecimal pPICOMBRU, java.math.BigDecimal pPCVALIDADO)
			throws Exception {
		return this.callPAC_IAX_ADM__F_SET_IMPRECIBO(pPNRECIBO, pPNRIESGO, pPIT1DTO, pPIPRINET, pPIT1REC, pPIT1CON,
				pPIIPS, pPIDGS, pPIARBITR, pPIFNG, pPFEFECTO, pPFVENCIM, pPCRECCIA, pPICOMBRU, pPCVALIDADO);
	}
	// --END-PAC_IAX_ADM.F_SET_IMPRECIBO

	// --START-PAC_IAX_ADM.F_SET_ESTADOREC(PNRECIBO, PCESTREC)

	private HashMap callPAC_IAX_ADM__F_SET_ESTADOREC(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTREC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_SET_ESTADOREC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPCESTREC" }, new Object[] { pPNRECIBO, pPCESTREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCESTREC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ADM__F_SET_ESTADOREC(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTREC)
			throws Exception {
		return this.callPAC_IAX_ADM__F_SET_ESTADOREC(pPNRECIBO, pPCESTREC);
	}
	// --END-PAC_IAX_ADM.F_SET_ESTADOREC

	// --START-PAC_IAX_ADM.F_DESCOBRADOR(P_CCOBBAN)

	private HashMap callPAC_IAX_ADM__F_DESCOBRADOR(java.math.BigDecimal pP_CCOBBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_DESCOBRADOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CCOBBAN" }, new Object[] { pP_CCOBBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CCOBBAN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "P_TDESCRIP"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "P_TCOBBAN"
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
			retVal.put("P_TDESCRIP", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_TDESCRIP", null);
		}
		try {
			retVal.put("P_TCOBBAN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_TCOBBAN", null);
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

	public HashMap ejecutaPAC_IAX_ADM__F_DESCOBRADOR(java.math.BigDecimal pP_CCOBBAN) throws Exception {
		return this.callPAC_IAX_ADM__F_DESCOBRADOR(pP_CCOBBAN);
	}
	// --END-PAC_IAX_ADM.F_DESCOBRADOR

	// --START-PAC_IAX_ADM.F_GET_MATRICULAS(PCEMPRES, PNPOLIZA, PNCERTIF, PNRECIBO,
	// PCCOBBAN, PNMATRIC, PFENVINI, PFENVFIN, PSPERSON, PTIPO, PCIDIOMA)
	private HashMap callPAC_IAX_ADM__F_GET_MATRICULAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCCOBBAN,
			String pPNMATRIC, java.sql.Date pPFENVINI, java.sql.Date pPFENVFIN, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPTIPO, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_MATRICULAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPNPOLIZA", "pPNCERTIF", "pPNRECIBO", "pPCCOBBAN", "pPNMATRIC",
						"pPFENVINI", "pPFENVFIN", "pPSPERSON", "pPTIPO", "pPCIDIOMA" },
				new Object[] { pPCEMPRES, pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPCCOBBAN, pPNMATRIC, pPFENVINI, pPFENVFIN,
						pPSPERSON, pPTIPO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNCERTIF);
		cStmt.setObject(5, pPNRECIBO);
		cStmt.setObject(6, pPCCOBBAN);
		cStmt.setObject(7, pPNMATRIC);
		cStmt.setObject(8, pPFENVINI);
		cStmt.setObject(9, pPFENVFIN);
		cStmt.setObject(10, pPSPERSON);
		cStmt.setObject(11, pPTIPO);
		cStmt.setObject(12, pPCIDIOMA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_MATRICULAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCCOBBAN,
			String pPNMATRIC, java.sql.Date pPFENVINI, java.sql.Date pPFENVFIN, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPTIPO, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_MATRICULAS(pPCEMPRES, pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPCCOBBAN, pPNMATRIC,
				pPFENVINI, pPFENVFIN, pPSPERSON, pPTIPO, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_MATRICULAS

	// --START-PAC_IAX_ADM.F_GET_MATRICULAS_DET(PNMATRIC, PCIDIOMA)
	private HashMap callPAC_IAX_ADM__F_GET_MATRICULAS_DET(String pPNMATRIC, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_MATRICULAS_DET(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNMATRIC", "pPCIDIOMA" }, new Object[] { pPNMATRIC, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNMATRIC);
		cStmt.setObject(3, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_MATRICULAS_DET(String pPNMATRIC, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		return this.callPAC_IAX_ADM__F_GET_MATRICULAS_DET(pPNMATRIC, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_MATRICULAS_DET

	// --START-PAC_IAX_ADM.F_GET_RECDOCS(PNRECIBO)
	private HashMap callPAC_IAX_ADM__F_GET_RECDOCS(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_RECDOCS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_RECDOCS(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_RECDOCS(pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_ADM.F_GET_RECDOCS
	// --START-PAC_IAX_ADM.F_SET_DOCIMP(PNRECIBO, PNDOCUME)
	private HashMap callPAC_IAX_ADM__F_SET_DOCIMP(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNDOCUME)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_SET_DOCIMP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPNDOCUME" }, new Object[] { pPNRECIBO, pPNDOCUME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPNDOCUME);
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

	public HashMap ejecutaPAC_IAX_ADM__F_SET_DOCIMP(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNDOCUME)
			throws Exception {
		return this.callPAC_IAX_ADM__F_SET_DOCIMP(pPNRECIBO, pPNDOCUME);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_SET_DOCIMP

	// --START-PAC_IAX_ADM.F_GET_DATOSRECIBO_DET(PCEMPRES, PNRECIBO, PCIDIOMA)
	private HashMap callPAC_IAX_ADM__F_GET_DATOSRECIBO_DET(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_DATOSRECIBO_DET(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPNRECIBO", "pPCIDIOMA" },
				new Object[] { pPCEMPRES, pPNRECIBO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO_DET(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_DATOSRECIBO_DET(pPCEMPRES, pPNRECIBO, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_DATOSRECIBO_DET

	// --START-PAC_IAX_ADM.F_GET_RECIBOS_COMP(PNRECIBO, PCIDIOMA)
	private HashMap callPAC_IAX_ADM__F_GET_RECIBOS_COMP(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_RECIBOS_COMP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPCIDIOMA" }, new Object[] { pPNRECIBO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_RECIBOS_COMP(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_RECIBOS_COMP(pPNRECIBO, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_RECIBOS_COMP

	// --START-PAC_IAX_ADM.F_GET_DETRECIBO_GTIAS(PNRECIBO, PCIDIOMA, PNRIESGO,
	// PCGARANT)
	private HashMap callPAC_IAX_ADM__F_GET_DETRECIBO_GTIAS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_DETRECIBO_GTIAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPCIDIOMA", "pPNRIESGO", "pPCGARANT" },
				new Object[] { pPNRECIBO, pPCIDIOMA, pPNRIESGO, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_DETRECIBO_GTIAS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAX_ADM__F_GET_DETRECIBO_GTIAS(pPNRECIBO, pPCIDIOMA, pPNRIESGO, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_DETRECIBO_GTIAS

	// --START-PAC_IAX_ADM.F_GET_ADM_RECUNIF(PNRECIBO, PCIDIOMA)
	private HashMap callPAC_IAX_ADM__F_GET_ADM_RECUNIF(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_ADM_RECUNIF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPCIDIOMA" }, new Object[] { pPNRECIBO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_ADM_RECUNIF(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		return this.callPAC_IAX_ADM__F_GET_ADM_RECUNIF(pPNRECIBO, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_ADM_RECUNIF

	// --START-PAC_IAX_ADM.F_DESAGRUPARECIBO(PNRECUNIF, PFANULAC, PCIDIOMA)
	private HashMap callPAC_IAX_ADM__F_DESAGRUPARECIBO(String pPNRECUNIF, java.sql.Date pPFANULAC,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_DESAGRUPARECIBO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECUNIF", "pPFANULAC", "pPCIDIOMA" },
				new Object[] { pPNRECUNIF, pPFANULAC, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECUNIF);
		cStmt.setObject(3, pPFANULAC);
		cStmt.setObject(4, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_ADM__F_DESAGRUPARECIBO(String pPNRECUNIF, java.sql.Date pPFANULAC,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_ADM__F_DESAGRUPARECIBO(pPNRECUNIF, pPFANULAC, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_DESAGRUPARECIBO

	private HashMap callPAC_IAX_ADM__F_GET_CONSRECIBOS_MULTIMONEDA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPITEM,
			java.math.BigDecimal pPCESTREC, java.math.BigDecimal pPCMONPAG, java.math.BigDecimal pPTIPO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCIDIOMA, java.sql.Date pFEMISIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_CONSRECIBOS_MULTIMONEDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPNRECIBO", "pPNPOLIZA", "pPITEM", "pPCESTREC", "pPCMONPAG", "pPTIPO",
						"pPSPERSON", "pPCIDIOMA", "pFEMISIO" },
				new Object[] { pPCEMPRES, pPNRECIBO, pPNPOLIZA, pPITEM, pPCESTREC, pPCMONPAG, pPTIPO, pPSPERSON,
						pPCIDIOMA, pFEMISIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPITEM);
		cStmt.setObject(6, pPCESTREC);
		cStmt.setObject(7, pPCMONPAG);
		cStmt.setObject(8, pPTIPO);
		cStmt.setObject(9, pPSPERSON);
		cStmt.setObject(10, pPCIDIOMA);
		cStmt.setObject(11, pFEMISIO);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY,
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_CONSRECIBOS_MULTIMONEDA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPITEM,
			java.math.BigDecimal pPCESTREC, java.math.BigDecimal pPCMONPAG, java.math.BigDecimal pPTIPO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCIDIOMA, java.sql.Date pFEMISIO) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_CONSRECIBOS_MULTIMONEDA(pPCEMPRES, pPNRECIBO, pPNPOLIZA, pPITEM, pPCESTREC,
				pPCMONPAG, pPTIPO, pPSPERSON, pPCIDIOMA, pFEMISIO);// AXIS-WLS1SERVER-Ready
	}

	// SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
	// --START-PAC_IAX_ADM.F_GET_RECIBOS_SALDOS(PNPOLIZA)
	private HashMap callPAC_IAX_ADM__F_GET_RECIBOS_SALDOS(BigDecimal sSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_RECIBOS_SALDOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA" }, new Object[] { sSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, sSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "CUR"
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
			retVal.put("CUR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("CUR", null);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_RECIBOS_SALDOS(BigDecimal sSEGURO) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_RECIBOS_SALDOS(sSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_GET_RECIBOS_SALDOS

	// Inicio IAXIS-3651 09/07/2019
	// --START-PAC_IAX_ADM.F_CALCULA_COMISIONES(pPNRECIBO)
	private HashMap callPAC_IAX_ADM__F_CALCULA_COMISIONES(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_CALCULA_COMISIONES(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_ADM__F_CALCULA_COMISIONES(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_ADM__F_CALCULA_COMISIONES(pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ADM.F_CALCULA_COMISIONES

	private HashMap callPAC_IAX_ADM__F_GET_INFO_PAGOS_OUT(String pPNNUMIDE, java.math.BigDecimal pPNNUMORD)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_INFO_PAGOS_OUT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNNUMIDE", "pPNNUMORD" }, new Object[] { pPNNUMIDE, pPNNUMORD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMIDE);
		cStmt.setObject(3, pPNNUMORD);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_INFO_PAGOS_OUT(String pPNNUMIDE, java.math.BigDecimal pPNNUMORD)
			throws Exception {
		return this.callPAC_IAX_ADM__F_GET_INFO_PAGOS_OUT(pPNNUMIDE, pPNNUMORD);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_ADM__F_SET_INFO_PAGO_OUT(java.math.BigDecimal pPNNUMORD, java.math.BigDecimal pPCESTERP,
			java.math.BigDecimal pPNPRCERP, java.sql.Date pPFFECPAGERP, java.math.BigDecimal pPIVALPAGERP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_SET_INFO_PAGO_OUT(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNNUMORD", "pPCESTERP", "pPNPRCERP", "pPFFECPAGERP", "pPIVALPAGERP", },
				new Object[] { pPNNUMORD, pPCESTERP, pPNPRCERP, pPFFECPAGERP, pPIVALPAGERP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMORD);
		cStmt.setObject(3, pPCESTERP);
		cStmt.setObject(4, pPNPRCERP);
		cStmt.setObject(5, pPFFECPAGERP);
		cStmt.setObject(6, pPIVALPAGERP);
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

	public HashMap ejecutaPAC_IAX_ADM__F_SET_INFO_PAGO_OUT(java.math.BigDecimal pPNNUMORD,
			java.math.BigDecimal pPCESTERP, java.math.BigDecimal pPNPRCERP, java.sql.Date pPFFECPAGERP,
			java.math.BigDecimal pPIVALPAGERP) throws Exception {
		return this.callPAC_IAX_ADM__F_SET_INFO_PAGO_OUT(pPNNUMORD, pPCESTERP, pPNPRCERP, pPFFECPAGERP, pPIVALPAGERP);// AXIS-WLS1SERVER-Ready
	}
	// Fin IAXIS-3651 09/07/2019

	// Inicio IAXIS-3591 17/07/2019
	private HashMap callPAC_IAX_ADM__F_GET_INFO_COA(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_INFO_COA(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_INFO_COA(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_INFO_COA(pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// Fin IAXIS-3591 17/07/2019

	// Inicio IAXIS-3590 11/06/2020
	private HashMap callPAC_IAX_ADM__F_GET_INFO_TOM(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ADM.F_GET_INFO_TOM(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_ADM__F_GET_INFO_TOM(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_ADM__F_GET_INFO_TOM(pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// Fin IAXIS-3590 11/06/2020

}
