//Revision:# sTS/xbjlL71ZRoUosAuUzg== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_COA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COA.class);
	private Connection conn = null;

	public PAC_IAX_COA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COA.F_GET_CTACOASEGURO_DET(PCCOMPANI, PFCIERRE, PCIAPROP,
	// PTIPOCOASEGURO, PCEMPRES, PCRAMO, PSPRODUC, PNPOLIZA, PNCERTIF, PCESTADO,
	// PSSEGURO, PCINVERFAS, PSPROCES, PLIQUIDABLE)
	private HashMap callPAC_IAX_COA__F_GET_CTACOASEGURO_DET(java.math.BigDecimal pPCCOMPANI, java.sql.Date pPFCIERRE,
			java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPTIPOCOASEGURO, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCINVERFAS, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPLIQUIDABLE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_GET_CTACOASEGURO_DET(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMPANI", "pPFCIERRE", "pPCIAPROP", "pPTIPOCOASEGURO", "pPCEMPRES", "pPCRAMO",
						"pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPCESTADO", "pPSSEGURO", "pPCINVERFAS", "pPSPROCES",
						"pPLIQUIDABLE" },
				new Object[] { pPCCOMPANI, pPFCIERRE, pPCIAPROP, pPTIPOCOASEGURO, pPCEMPRES, pPCRAMO, pPSPRODUC,
						pPNPOLIZA, pPNCERTIF, pPCESTADO, pPSSEGURO, pPCINVERFAS, pPSPROCES, pPLIQUIDABLE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPFCIERRE);
		cStmt.setObject(4, pPCIAPROP);
		cStmt.setObject(5, pPTIPOCOASEGURO);
		cStmt.setObject(6, pPCEMPRES);
		cStmt.setObject(7, pPCRAMO);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPNPOLIZA);
		cStmt.setObject(10, pPNCERTIF);
		cStmt.setObject(11, pPCESTADO);
		cStmt.setObject(12, pPSSEGURO);
		cStmt.setObject(13, pPCINVERFAS);
		cStmt.setObject(14, pPSPROCES);
		cStmt.setObject(15, pPLIQUIDABLE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COA__F_GET_CTACOASEGURO_DET(java.math.BigDecimal pPCCOMPANI, java.sql.Date pPFCIERRE,
			java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPTIPOCOASEGURO, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCINVERFAS, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPLIQUIDABLE)
			throws Exception {
		return this.callPAC_IAX_COA__F_GET_CTACOASEGURO_DET(pPCCOMPANI, pPFCIERRE, pPCIAPROP, pPTIPOCOASEGURO,
				pPCEMPRES, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPCESTADO, pPSSEGURO, pPCINVERFAS, pPSPROCES,
				pPLIQUIDABLE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_GET_CTACOASEGURO_DET

	// --START-PAC_IAX_COA.F_DEL_MOV_CTACOA(PCEMPRES, PCCOMPANI, PSSEGURO, PFCIERRE,
	// PNNUMLIN)

	private HashMap callPAC_IAX_COA__F_DEL_MOV_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSSEGURO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPNNUMLIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_DEL_MOV_CTACOA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCOMPANI", "pPSSEGURO", "pPFCIERRE", "pPNNUMLIN" },
				new Object[] { pPCEMPRES, pPCCOMPANI, pPSSEGURO, pPFCIERRE, pPNNUMLIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPFCIERRE);
		cStmt.setObject(6, pPNNUMLIN);
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

	public HashMap ejecutaPAC_IAX_COA__F_DEL_MOV_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSSEGURO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPNNUMLIN) throws Exception {
		return this.callPAC_IAX_COA__F_DEL_MOV_CTACOA(pPCEMPRES, pPCCOMPANI, pPSSEGURO, pPFCIERRE, pPNNUMLIN); // AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COA.F_DEL_MOV_CTACOA
	// --START-PAC_IAX_COA.F_GET_CAB_CTACOA(PCEMPRES, PCCOMPAPR, PCCOMPANI,
	// PSSEGURO, PFCIERRE)
	private HashMap callPAC_IAX_COA__F_GET_CAB_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPAPR,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSSEGURO, java.sql.Date pPFCIERRE) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_GET_CAB_CTACOA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCOMPAPR", "pPCCOMPANI", "pPSSEGURO", "pPFCIERRE" },
				new Object[] { pPCEMPRES, pPCCOMPAPR, pPCCOMPANI, pPSSEGURO, pPFCIERRE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOMPAPR);
		cStmt.setObject(4, pPCCOMPANI);
		cStmt.setObject(5, pPSSEGURO);
		cStmt.setObject(6, pPFCIERRE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COA__F_GET_CAB_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPAPR,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSSEGURO, java.sql.Date pPFCIERRE) throws Exception {
		return this.callPAC_IAX_COA__F_GET_CAB_CTACOA(pPCEMPRES, pPCCOMPAPR, pPCCOMPANI, pPSSEGURO, pPFCIERRE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_GET_CAB_CTACOA

	// --START-PAC_IAX_COA.F_GET_CTACOASEGURO(PCEMPRES, PCCOMPANI, PCRAMO, PSPRODUC,
	// PFCIERRE, PSSEGURO, PCESTADO, PCIAPROP, PTIPOCOASEGURO, PNPOLIZA, PNCERTIF,
	// PCINVERFAS, PSPROCES, PFCIERREDESDE, PFCIERREHASTA)
	private HashMap callPAC_IAX_COA__F_GET_CTACOASEGURO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.sql.Date pPFCIERRE,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCIAPROP,
			java.math.BigDecimal pPTIPOCOASEGURO, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPCINVERFAS, java.math.BigDecimal pPSPROCES, java.sql.Date pPFCIERREDESDE,
			java.sql.Date pPFCIERREHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_GET_CTACOASEGURO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCOMPANI", "pPCRAMO", "pPSPRODUC", "pPFCIERRE", "pPSSEGURO", "pPCESTADO",
						"pPCIAPROP", "pPTIPOCOASEGURO", "pPNPOLIZA", "pPNCERTIF", "pPCINVERFAS", "pPSPROCES",
						"pPFCIERREDESDE", "pPFCIERREHASTA" },
				new Object[] { pPCEMPRES, pPCCOMPANI, pPCRAMO, pPSPRODUC, pPFCIERRE, pPSSEGURO, pPCESTADO, pPCIAPROP,
						pPTIPOCOASEGURO, pPNPOLIZA, pPNCERTIF, pPCINVERFAS, pPSPROCES, pPFCIERREDESDE,
						pPFCIERREHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPFCIERRE);
		cStmt.setObject(7, pPSSEGURO);
		cStmt.setObject(8, pPCESTADO);
		cStmt.setObject(9, pPCIAPROP);
		cStmt.setObject(10, pPTIPOCOASEGURO);
		cStmt.setObject(11, pPNPOLIZA);
		cStmt.setObject(12, pPNCERTIF);
		cStmt.setObject(13, pPCINVERFAS);
		cStmt.setObject(14, pPSPROCES);
		cStmt.setObject(15, pPFCIERREDESDE);
		cStmt.setObject(16, pPFCIERREHASTA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COA__F_GET_CTACOASEGURO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFCIERRE, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPTIPOCOASEGURO, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPCINVERFAS, java.math.BigDecimal pPSPROCES,
			java.sql.Date pPFCIERREDESDE, java.sql.Date pPFCIERREHASTA) throws Exception {
		return this.callPAC_IAX_COA__F_GET_CTACOASEGURO(pPCEMPRES, pPCCOMPANI, pPCRAMO, pPSPRODUC, pPFCIERRE, pPSSEGURO,
				pPCESTADO, pPCIAPROP, pPTIPOCOASEGURO, pPNPOLIZA, pPNCERTIF, pPCINVERFAS, pPSPROCES, pPFCIERREDESDE,
				pPFCIERREHASTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_GET_CTACOASEGURO

	// --START-PAC_IAX_COA.F_LIQUIDA_CTATEC_COA(PCEMPRES, PCCOMPANI, PCCOMPAPR,
	// PFCIERRE, PFCIERREDESDE, PFCIERREHASTA, PCTIPCOA, PSPROCES_ANT, PSPROCES_NOU)
	private HashMap callPAC_IAX_COA__F_LIQUIDA_CTATEC_COA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCCOMPAPR, java.sql.Date pPFCIERRE,
			java.sql.Date pPFCIERREDESDE, java.sql.Date pPFCIERREHASTA, java.math.BigDecimal pPCTIPCOA,
			java.math.BigDecimal pPSPROCES_ANT, java.math.BigDecimal pPSPROCES_NOU) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_LIQUIDA_CTATEC_COA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCOMPANI", "pPCCOMPAPR", "pPFCIERRE", "pPFCIERREDESDE", "pPFCIERREHASTA",
						"pPCTIPCOA", "pPSPROCES_ANT", "pPSPROCES_NOU" },
				new Object[] { pPCEMPRES, pPCCOMPANI, pPCCOMPAPR, pPFCIERRE, pPFCIERREDESDE, pPFCIERREHASTA, pPCTIPCOA,
						pPSPROCES_ANT, pPSPROCES_NOU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPCCOMPAPR);
		cStmt.setObject(5, pPFCIERRE);
		cStmt.setObject(6, pPFCIERREDESDE);
		cStmt.setObject(7, pPFCIERREHASTA);
		cStmt.setObject(8, pPCTIPCOA);
		cStmt.setObject(9, pPSPROCES_ANT);
		cStmt.setObject(10, pPSPROCES_NOU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "INDICE"
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
			retVal.put("INDICE", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("INDICE", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COA__F_LIQUIDA_CTATEC_COA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCCOMPAPR, java.sql.Date pPFCIERRE,
			java.sql.Date pPFCIERREDESDE, java.sql.Date pPFCIERREHASTA, java.math.BigDecimal pPCTIPCOA,
			java.math.BigDecimal pPSPROCES_ANT, java.math.BigDecimal pPSPROCES_NOU) throws Exception {
		return this.callPAC_IAX_COA__F_LIQUIDA_CTATEC_COA(pPCEMPRES, pPCCOMPANI, pPCCOMPAPR, pPFCIERRE, pPFCIERREDESDE,
				pPFCIERREHASTA, pPCTIPCOA, pPSPROCES_ANT, pPSPROCES_NOU);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_LIQUIDA_CTATEC_COA

	// --START-PAC_IAX_COA.F_SET_MOV_CTACOA(PCEMPRES, PCCOMPANI, PNNUMLIN, PCTIPCOA,
	// PCDEBHAB, PSSEGURO, PNRECIBO, PSIDEPAG, PFCIERRE, PCMOVIMI, PCIMPORT,
	// PIMOVIMI, PFCAMBIO, PCESTADO, PTDESCRI, PTDOCUME, PMODO)

	private HashMap callPAC_IAX_COA__F_SET_MOV_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCTIPCOA, java.math.BigDecimal pPCDEBHAB,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSIDEPAG,
			java.sql.Date pPFCIERRE, java.math.BigDecimal pPCMOVIMI, java.math.BigDecimal pPCIMPORT,
			java.math.BigDecimal pPIMOVIMI, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCESTADO, String pPTDESCRI,
			String pPTDOCUME, java.math.BigDecimal pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_SET_MOV_CTACOA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCOMPANI", "pPNNUMLIN", "pPCTIPCOA", "pPCDEBHAB", "pPSSEGURO",
						"pPNRECIBO", "pPSIDEPAG", "pPFCIERRE", "pPCMOVIMI", "pPCIMPORT", "pPIMOVIMI", "pPFCAMBIO",
						"pPCESTADO", "pPTDESCRI", "pPTDOCUME", "pPMODO" },
				new Object[] { pPCEMPRES, pPCCOMPANI, pPNNUMLIN, pPCTIPCOA, pPCDEBHAB, pPSSEGURO, pPNRECIBO, pPSIDEPAG,
						pPFCIERRE, pPCMOVIMI, pPCIMPORT, pPIMOVIMI, pPFCAMBIO, pPCESTADO, pPTDESCRI, pPTDOCUME,
						pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPNNUMLIN);
		cStmt.setObject(5, pPCTIPCOA);
		cStmt.setObject(6, pPCDEBHAB);
		cStmt.setObject(7, pPSSEGURO);
		cStmt.setObject(8, pPNRECIBO);
		cStmt.setObject(9, pPSIDEPAG);
		cStmt.setObject(10, pPFCIERRE);
		cStmt.setObject(11, pPCMOVIMI);
		cStmt.setObject(12, pPCIMPORT);
		cStmt.setObject(13, pPIMOVIMI);
		cStmt.setObject(14, pPFCAMBIO);
		cStmt.setObject(15, pPCESTADO);
		cStmt.setObject(16, pPTDESCRI);
		cStmt.setObject(17, pPTDOCUME);
		cStmt.setObject(18, pPMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COA__F_SET_MOV_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCTIPCOA, java.math.BigDecimal pPCDEBHAB,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSIDEPAG,
			java.sql.Date pPFCIERRE, java.math.BigDecimal pPCMOVIMI, java.math.BigDecimal pPCIMPORT,
			java.math.BigDecimal pPIMOVIMI, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCESTADO, String pPTDESCRI,
			String pPTDOCUME, java.math.BigDecimal pPMODO) throws Exception {
		return this.callPAC_IAX_COA__F_SET_MOV_CTACOA(pPCEMPRES, pPCCOMPANI, pPNNUMLIN, pPCTIPCOA, pPCDEBHAB, pPSSEGURO,
				pPNRECIBO, pPSIDEPAG, pPFCIERRE, pPCMOVIMI, pPCIMPORT, pPIMOVIMI, pPFCAMBIO, pPCESTADO, pPTDESCRI,
				pPTDOCUME, pPMODO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_SET_MOV_CTACOA

	// --START-PAC_IAX_COA.F_GET_MOV_CTACOA(PCEMPRES, PCCOMPAPR, PCCOMPANI,
	// PSSEGURO, PFCIERRE, PCESTADO, PSPROCES, PLIQUIDABLE)
	private HashMap callPAC_IAX_COA__F_GET_MOV_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPAPR,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSSEGURO, java.sql.Date pPFCIERRE,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPLIQUIDABLE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_GET_MOV_CTACOA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCOMPAPR", "pPCCOMPANI", "pPSSEGURO", "pPFCIERRE", "pPCESTADO",
						"pPSPROCES", "pPLIQUIDABLE" },
				new Object[] { pPCEMPRES, pPCCOMPAPR, pPCCOMPANI, pPSSEGURO, pPFCIERRE, pPCESTADO, pPSPROCES,
						pPLIQUIDABLE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOMPAPR);
		cStmt.setObject(4, pPCCOMPANI);
		cStmt.setObject(5, pPSSEGURO);
		cStmt.setObject(6, pPFCIERRE);
		cStmt.setObject(7, pPCESTADO);
		cStmt.setObject(8, pPSPROCES);
		cStmt.setObject(9, pPLIQUIDABLE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COA__F_GET_MOV_CTACOA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPAPR,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSSEGURO, java.sql.Date pPFCIERRE,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPLIQUIDABLE)
			throws Exception {
		return this.callPAC_IAX_COA__F_GET_MOV_CTACOA(pPCEMPRES, pPCCOMPAPR, pPCCOMPANI, pPSSEGURO, pPFCIERRE,
				pPCESTADO, pPSPROCES, pPLIQUIDABLE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_GET_MOV_CTACOA

	// --START-PAC_IAX_COA.F_REGISTRA_PROCESO(PFPERFIN, PCEMPRES)

	private HashMap callPAC_IAX_COA__F_REGISTRA_PROCESO(java.sql.Date pPFPERFIN, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_REGISTRA_PROCESO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFPERFIN", "pPCEMPRES" }, new Object[] { pPFPERFIN, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFPERFIN);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNPROCESO"
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
			retVal.put("PNPROCESO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNPROCESO", null);
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

	public HashMap ejecutaPAC_IAX_COA__F_REGISTRA_PROCESO(java.sql.Date pPFPERFIN, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		return this.callPAC_IAX_COA__F_REGISTRA_PROCESO(pPFPERFIN, pPCEMPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_REGISTRA_PROCESO

	// --START-PAC_IAX_COA.F_SET_ESTADO_CTACOA(PCCOMPANI, PCOMPAPR, PCTIPCOA,
	// PCEMPRES, PSPROCES, PCMOVIMI, PFCIERRE, PESTADONEW, PESTADOOLD)
	private HashMap callPAC_IAX_COA__F_SET_ESTADO_CTACOA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCOMPAPR, java.math.BigDecimal pPCTIPCOA, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCMOVIMI, java.sql.Date pPFCIERRE,
			java.math.BigDecimal pPESTADONEW, java.math.BigDecimal pPESTADOOLD) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_SET_ESTADO_CTACOA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMPANI", "pPCOMPAPR", "pPCTIPCOA", "pPCEMPRES", "pPSPROCES", "pPCMOVIMI",
						"pPFCIERRE", "pPESTADONEW", "pPESTADOOLD" },
				new Object[] { pPCCOMPANI, pPCOMPAPR, pPCTIPCOA, pPCEMPRES, pPSPROCES, pPCMOVIMI, pPFCIERRE,
						pPESTADONEW, pPESTADOOLD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPCOMPAPR);
		cStmt.setObject(4, pPCTIPCOA);
		cStmt.setObject(5, pPCEMPRES);
		cStmt.setObject(6, pPSPROCES);
		cStmt.setObject(7, pPCMOVIMI);
		cStmt.setObject(8, pPFCIERRE);
		cStmt.setObject(9, pPESTADONEW);
		cStmt.setObject(10, pPESTADOOLD);
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

	public HashMap ejecutaPAC_IAX_COA__F_SET_ESTADO_CTACOA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCOMPAPR, java.math.BigDecimal pPCTIPCOA, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCMOVIMI, java.sql.Date pPFCIERRE,
			java.math.BigDecimal pPESTADONEW, java.math.BigDecimal pPESTADOOLD) throws Exception {
		return this.callPAC_IAX_COA__F_SET_ESTADO_CTACOA(pPCCOMPANI, pPCOMPAPR, pPCTIPCOA, pPCEMPRES, pPSPROCES,
				pPCMOVIMI, pPFCIERRE, pPESTADONEW, pPESTADOOLD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_SET_ESTADO_CTACOA

	// --START-PAC_IAX_COA.F_RESET_ESTADO(PCEMPRES)
	private HashMap callPAC_IAX_COA__F_RESET_ESTADO(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_RESET_ESTADO(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_COA__F_RESET_ESTADO(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_COA__F_RESET_ESTADO(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_RESET_ESTADO

	// --START-PAC_IAX_COA.F_SET_REMESA_DET(PCEMPRES, PCCOMPANI, PNNUMLIN, PCTIPCOA,
	// PCDEBHAB, PSSEGURO, PNRECIBO, PSIDEPAG, PFCIERRE, PCMOVIMI, PCIMPORT,
	// PIMOVIMI, PFCAMBIO, PCESTADO, PTDESCRI, PTDOCUME, PMODO, PNPOLCIA,
	// PCSUCURSAL, PMONEDA, PSMVCOA)
	private HashMap callPAC_IAX_COA__F_SET_REMESA_DET(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCTIPCOA, java.math.BigDecimal pPCDEBHAB,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSIDEPAG,
			java.sql.Date pPFCIERRE, java.math.BigDecimal pPCMOVIMI, java.math.BigDecimal pPCIMPORT,
			java.math.BigDecimal pPIMOVIMI, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCESTADO, String pPTDESCRI,
			String pPTDOCUME, java.math.BigDecimal pPMODO, java.math.BigDecimal pPNPOLCIA,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPMONEDA, java.math.BigDecimal pPSMVCOA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_SET_REMESA_DET(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCOMPANI", "pPNNUMLIN", "pPCTIPCOA", "pPCDEBHAB", "pPSSEGURO",
				"pPNRECIBO", "pPSIDEPAG", "pPFCIERRE", "pPCMOVIMI", "pPCIMPORT", "pPIMOVIMI", "pPFCAMBIO", "pPCESTADO",
				"pPTDESCRI", "pPTDOCUME", "pPMODO", "pPNPOLCIA", "pPCSUCURSAL", "pPMONEDA", "pPSMVCOA" },
				new Object[] { pPCEMPRES, pPCCOMPANI, pPNNUMLIN, pPCTIPCOA, pPCDEBHAB, pPSSEGURO, pPNRECIBO, pPSIDEPAG,
						pPFCIERRE, pPCMOVIMI, pPCIMPORT, pPIMOVIMI, pPFCAMBIO, pPCESTADO, pPTDESCRI, pPTDOCUME, pPMODO,
						pPNPOLCIA, pPCSUCURSAL, pPMONEDA, pPSMVCOA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPNNUMLIN);
		cStmt.setObject(5, pPCTIPCOA);
		cStmt.setObject(6, pPCDEBHAB);
		cStmt.setObject(7, pPSSEGURO);
		cStmt.setObject(8, pPNRECIBO);
		cStmt.setObject(9, pPSIDEPAG);
		cStmt.setObject(10, pPFCIERRE);
		cStmt.setObject(11, pPCMOVIMI);
		cStmt.setObject(12, pPCIMPORT);
		cStmt.setObject(13, pPIMOVIMI);
		cStmt.setObject(14, pPFCAMBIO);
		cStmt.setObject(15, pPCESTADO);
		cStmt.setObject(16, pPTDESCRI);
		cStmt.setObject(17, pPTDOCUME);
		cStmt.setObject(18, pPMODO);
		cStmt.setObject(19, pPNPOLCIA);
		cStmt.setObject(20, pPCSUCURSAL);
		cStmt.setObject(21, pPMONEDA);
		cStmt.setObject(22, pPSMVCOA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(23, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COA__F_SET_REMESA_DET(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCTIPCOA, java.math.BigDecimal pPCDEBHAB,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSIDEPAG,
			java.sql.Date pPFCIERRE, java.math.BigDecimal pPCMOVIMI, java.math.BigDecimal pPCIMPORT,
			java.math.BigDecimal pPIMOVIMI, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCESTADO, String pPTDESCRI,
			String pPTDOCUME, java.math.BigDecimal pPMODO, java.math.BigDecimal pPNPOLCIA,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPMONEDA, java.math.BigDecimal pPSMVCOA)
			throws Exception {
		return this.callPAC_IAX_COA__F_SET_REMESA_DET(pPCEMPRES, pPCCOMPANI, pPNNUMLIN, pPCTIPCOA, pPCDEBHAB, pPSSEGURO,
				pPNRECIBO, pPSIDEPAG, pPFCIERRE, pPCMOVIMI, pPCIMPORT, pPIMOVIMI, pPFCAMBIO, pPCESTADO, pPTDESCRI,
				pPTDOCUME, pPMODO, pPNPOLCIA, pPCSUCURSAL, pPMONEDA, pPSMVCOA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_SET_REMESA_DET

	// --START-PAC_IAX_COA.F_GET_REMESA_DET(PCCOMPANI, PCSUCURSAL, PFCIERRE,
	// PCIAPROP, PCTIPCOA, PCEMPRES, PCRAMO, PSPRODUC, PNPOLCIA, PCESTADO, PSSEGURO,
	// PSMOVCOA)
	private HashMap callPAC_IAX_COA__F_GET_REMESA_DET(java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCSUCURSAL,
			java.sql.Date pPFCIERRE, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPCTIPCOA,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLCIA, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSMOVCOA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COA.F_GET_REMESA_DET(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMPANI", "pPCSUCURSAL", "pPFCIERRE", "pPCIAPROP", "pPCTIPCOA", "pPCEMPRES",
						"pPCRAMO", "pPSPRODUC", "pPNPOLCIA", "pPCESTADO", "pPSSEGURO", "pPSMOVCOA" },
				new Object[] { pPCCOMPANI, pPCSUCURSAL, pPFCIERRE, pPCIAPROP, pPCTIPCOA, pPCEMPRES, pPCRAMO, pPSPRODUC,
						pPNPOLCIA, pPCESTADO, pPSSEGURO, pPSMOVCOA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPCSUCURSAL);
		cStmt.setObject(4, pPFCIERRE);
		cStmt.setObject(5, pPCIAPROP);
		cStmt.setObject(6, pPCTIPCOA);
		cStmt.setObject(7, pPCEMPRES);
		cStmt.setObject(8, pPCRAMO);
		cStmt.setObject(9, pPSPRODUC);
		cStmt.setObject(10, pPNPOLCIA);
		cStmt.setObject(11, pPCESTADO);
		cStmt.setObject(12, pPSSEGURO);
		cStmt.setObject(13, pPSMOVCOA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COA__F_GET_REMESA_DET(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCSUCURSAL, java.sql.Date pPFCIERRE, java.math.BigDecimal pPCIAPROP,
			java.math.BigDecimal pPCTIPCOA, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLCIA, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSMOVCOA) throws Exception {
		return this.callPAC_IAX_COA__F_GET_REMESA_DET(pPCCOMPANI, pPCSUCURSAL, pPFCIERRE, pPCIAPROP, pPCTIPCOA,
				pPCEMPRES, pPCRAMO, pPSPRODUC, pPNPOLCIA, pPCESTADO, pPSSEGURO, pPSMOVCOA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COA.F_GET_REMESA_DET

}
