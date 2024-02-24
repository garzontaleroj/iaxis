//Revision:# lgEQiGbxpxx0WNQjCGzX1Q== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GESTION_CAR extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_PERSONA.class);
	private Connection conn = null;

	public PAC_IAX_GESTION_CAR(Connection conn) {
		this.conn = conn;
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_SET_GCA_PARAMPRE_CONC(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPCODSECCION, java.math.BigDecimal pPCIDIOMA, String pPPREGUNTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_GCA_PARAMPRE_CONC(?,?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPNCODPARCON", "pPCODSECCION", "pPCIDIOMA", "pPPREGUNTA" },
				new Object[] { pPNCODPARCON, pPCODSECCION, pPCIDIOMA, pPPREGUNTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODPARCON);
		cStmt.setObject(3, pPCODSECCION);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.setObject(5, pPPREGUNTA);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_PARAMPRE_CONC(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPCODSECCION, java.math.BigDecimal pPCIDIOMA, String pPPREGUNTA) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_GCA_PARAMPRE_CONC(pPNCODPARCON, pPCODSECCION, pPCIDIOMA, pPPREGUNTA);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPCODSECCION, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_PARAMPRE_CONC(?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPNCODPARCON", "pPCODSECCION", "pPCIDIOMA" },
				new Object[] { pPNCODPARCON, pPCODSECCION, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODPARCON);
		cStmt.setObject(3, pPCODSECCION);
		cStmt.setObject(4, pPCIDIOMA);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPCODSECCION, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(pPNCODPARCON, pPCODSECCION, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONCAB(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPACON, java.math.BigDecimal pPMCON, String pPTDESC, java.math.BigDecimal pPCSUCURSAL,
			String pPNNUMIDEAGE, java.math.BigDecimal pPCFICHERO, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNCODACTA, String pPCUSUALT, java.util.Date pPFALTA,
			String pPCUSUMOD, java.util.Date pPFMODIFI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_GCA_CONCILIACIONCAB(?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPSIDCON", "pPACON", "pPMCON", "pPTDESC", "pPCSUCURSAL", "pPNNUMIDEAGE", "pPCFICHERO",
						"pPSPROCES", "pPCESTADO", "pPNCODACTA", "pPCUSUALT", "pPFALTA", "pPCUSUMOD", "pPFMODIFI" },
				new Object[] { pPSIDCON, pPACON, pPMCON, pPTDESC, pPCSUCURSAL, pPNNUMIDEAGE, pPCFICHERO, pPSPROCES,
						pPCESTADO, pPNCODACTA, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDCON);
		cStmt.setObject(3, pPACON);
		cStmt.setObject(4, pPMCON);
		cStmt.setObject(5, pPTDESC);
		cStmt.setObject(6, pPCSUCURSAL);
		cStmt.setObject(7, pPNNUMIDEAGE);
		cStmt.setObject(8, pPCFICHERO);
		cStmt.setObject(9, pPSPROCES);
		cStmt.setObject(10, pPCESTADO);
		cStmt.setObject(11, pPNCODACTA);
		cStmt.setObject(12, pPCUSUALT);
		cStmt.setObject(13, pPFALTA);
		cStmt.setObject(14, pPCUSUMOD);
		cStmt.setObject(15, pPFMODIFI);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONCAB(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPACON, java.math.BigDecimal pPMCON, String pPTDESC, java.math.BigDecimal pPCSUCURSAL,
			String pPNNUMIDEAGE, java.math.BigDecimal pPCFICHERO, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNCODACTA, String pPCUSUALT, java.util.Date pPFALTA,
			String pPCUSUMOD, java.util.Date pPFMODIFI) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONCAB(pPSIDCON, pPACON, pPMCON, pPTDESC, pPCSUCURSAL,
				pPNNUMIDEAGE, pPCFICHERO, pPSPROCES, pPCESTADO, pPNCODACTA, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONCAB(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPACON, java.math.BigDecimal pPMCON, java.math.BigDecimal pPCSUCURSAL,
			String pPNNUMIDEAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_CONCILIACIONCAB(?,?,?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPSIDCON", "pPACON", "pPMCON", "pPCSUCURSAL", "pPNNUMIDEAGE" },
				new Object[] { pPSIDCON, pPACON, pPMCON, pPCSUCURSAL, pPNNUMIDEAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDCON);
		cStmt.setObject(3, pPACON);
		cStmt.setObject(4, pPMCON);
		cStmt.setObject(5, pPCSUCURSAL);
		cStmt.setObject(6, pPNNUMIDEAGE);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONCAB(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPACON, java.math.BigDecimal pPMCON, java.math.BigDecimal pPCSUCURSAL,
			String pPNNUMIDEAGE) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONCAB(pPSIDCON, pPACON, pPMCON, pPCSUCURSAL,
				pPNNUMIDEAGE);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACIONCAB(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPACON, java.math.BigDecimal pPMCON, java.math.BigDecimal pPCSUCURSAL,
			String pPNNUMIDEAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_DEL_GCA_CONCILIACIONCAB(?,?,?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPSIDCON", "pPACON", "pPMCON", "pPCSUCURSAL", "pPNNUMIDEAGE" },
				new Object[] { pPSIDCON, pPACON, pPMCON, pPCSUCURSAL, pPNNUMIDEAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDCON);
		cStmt.setObject(3, pPACON);
		cStmt.setObject(4, pPMCON);
		cStmt.setObject(5, pPCSUCURSAL);
		cStmt.setObject(6, pPNNUMIDEAGE);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACIONCAB(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPACON, java.math.BigDecimal pPMCON, java.math.BigDecimal pPCSUCURSAL,
			String pPNNUMIDEAGE) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACIONCAB(pPSIDCON, pPACON, pPMCON, pPCSUCURSAL,
				pPNNUMIDEAGE);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONDET(java.math.BigDecimal pPTIPO,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCAGENTE,
			String pPNNUMIDECLI, String pPTNOMCLI, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNMADUREZ, java.math.BigDecimal pPITOTALR,
			java.math.BigDecimal pPICOMISION, String pPCMONEDA, java.math.BigDecimal pPCOUTSOURCING,
			java.math.BigDecimal pPTNOMCLI_FIC, java.math.BigDecimal pPNPOLIZA_FIC, java.math.BigDecimal pPNRECIBO_FIC,
			java.math.BigDecimal pPNMADUREZ_FIC, java.math.BigDecimal pPITOTALR_FIC,
			java.math.BigDecimal pPICOMISION_FIC, String pPCMONEDA_FIC, java.math.BigDecimal pPCOUTSOURCING_FIC,
			java.math.BigDecimal pPCREPETIDO, java.math.BigDecimal pPCCRUCE, java.math.BigDecimal pPCCRUCEDET,
			java.math.BigDecimal pPCESTADOI, java.math.BigDecimal pPCESTADO, String pPTOBSERVA, String pPCUSUALT,
			java.util.Date pPFALTA, String pPCUSUMOD, java.util.Date pPFMODIFI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_GCA_CONCILIACIONDET(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPSIDCON", "pPNLINEA", "pPCAGENTE", "pPNNUMIDECLI", "pPTNOMCLI",
				"pPNPOLIZA", "pPNCERTIF", "pPNRECIBO", "pPNMADUREZ", "pPITOTALR", "pPICOMISION", "pPCMONEDA",
				"pPCOUTSOURCING", "pPTNOMCLI_FIC", "pPNPOLIZA_FIC", "pPNRECIBO_FIC", "pPNMADUREZ_FIC", "pPITOTALR_FIC",
				"pPICOMISION_FIC", "pPCMONEDA_FIC", "pPCOUTSOURCING_FIC", "pPCREPETIDO", "pPCCRUCE", "pPCCRUCEDET",
				"pPCESTADOI", "pPCESTADO", "pPTOBSERVA", "pPCUSUALT", "pPFALTA", "pPCUSUMOD", "pPFMODIFI" },
				new Object[] { pPTIPO, pPSIDCON, pPNLINEA, pPCAGENTE, pPNNUMIDECLI, pPTNOMCLI, pPNPOLIZA, pPNCERTIF,
						pPNRECIBO, pPNMADUREZ, pPITOTALR, pPICOMISION, pPCMONEDA, pPCOUTSOURCING, pPTNOMCLI_FIC,
						pPNPOLIZA_FIC, pPNRECIBO_FIC, pPNMADUREZ_FIC, pPITOTALR_FIC, pPICOMISION_FIC, pPCMONEDA_FIC,
						pPCOUTSOURCING_FIC, pPCREPETIDO, pPCCRUCE, pPCCRUCEDET, pPCESTADOI, pPCESTADO, pPTOBSERVA,
						pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPSIDCON);
		cStmt.setObject(4, pPNLINEA);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPNNUMIDECLI);
		cStmt.setObject(7, pPTNOMCLI);
		cStmt.setObject(8, pPNPOLIZA);
		cStmt.setObject(9, pPNCERTIF);
		cStmt.setObject(10, pPNRECIBO);
		cStmt.setObject(11, pPNMADUREZ);
		cStmt.setObject(12, pPITOTALR);
		cStmt.setObject(13, pPICOMISION);
		cStmt.setObject(14, pPCMONEDA);
		cStmt.setObject(15, pPCOUTSOURCING);
		cStmt.setObject(16, pPTNOMCLI_FIC);
		cStmt.setObject(17, pPNPOLIZA_FIC);
		cStmt.setObject(18, pPNRECIBO_FIC);
		cStmt.setObject(19, pPNMADUREZ_FIC);
		cStmt.setObject(20, pPITOTALR_FIC);
		cStmt.setObject(21, pPICOMISION_FIC);
		cStmt.setObject(22, pPCMONEDA_FIC);
		cStmt.setObject(23, pPCOUTSOURCING_FIC);
		cStmt.setObject(24, pPCREPETIDO);
		cStmt.setObject(25, pPCCRUCE);
		cStmt.setObject(26, pPCCRUCEDET);
		cStmt.setObject(27, pPCESTADOI);
		cStmt.setObject(28, pPCESTADO);
		cStmt.setObject(29, pPTOBSERVA);
		cStmt.setObject(30, pPCUSUALT);
		cStmt.setObject(31, pPFALTA);
		cStmt.setObject(32, pPCUSUMOD);
		cStmt.setObject(33, pPFMODIFI);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(34, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(33));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONDET(java.math.BigDecimal pPTIPO,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCAGENTE,
			String pPNNUMIDECLI, String pPTNOMCLI, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNMADUREZ, java.math.BigDecimal pPITOTALR,
			java.math.BigDecimal pPICOMISION, String pPCMONEDA, java.math.BigDecimal pPCOUTSOURCING,
			java.math.BigDecimal pPTNOMCLI_FIC, java.math.BigDecimal pPNPOLIZA_FIC, java.math.BigDecimal pPNRECIBO_FIC,
			java.math.BigDecimal pPNMADUREZ_FIC, java.math.BigDecimal pPITOTALR_FIC,
			java.math.BigDecimal pPICOMISION_FIC, String pPCMONEDA_FIC, java.math.BigDecimal pPCOUTSOURCING_FIC,
			java.math.BigDecimal pPCREPETIDO, java.math.BigDecimal pPCCRUCE, java.math.BigDecimal pPCCRUCEDET,
			java.math.BigDecimal pPCESTADOI, java.math.BigDecimal pPCESTADO, String pPTOBSERVA, String pPCUSUALT,
			java.util.Date pPFALTA, String pPCUSUMOD, java.util.Date pPFMODIFI) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONDET(pPTIPO, pPSIDCON, pPNLINEA, pPCAGENTE,
				pPNNUMIDECLI, pPTNOMCLI, pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPNMADUREZ, pPITOTALR, pPICOMISION, pPCMONEDA,
				pPCOUTSOURCING, pPTNOMCLI_FIC, pPNPOLIZA_FIC, pPNRECIBO_FIC, pPNMADUREZ_FIC, pPITOTALR_FIC,
				pPICOMISION_FIC, pPCMONEDA_FIC, pPCOUTSOURCING_FIC, pPCREPETIDO, pPCCRUCE, pPCCRUCEDET, pPCESTADOI,
				pPCESTADO, pPTOBSERVA, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONDET(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCAGENTE, String pPNNUMIDECLI, String pPTNOMCLI,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPNMADUREZ, java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPICOMISION,
			String pPCMONEDA, java.math.BigDecimal pPCOUTSOURCING, java.math.BigDecimal pPTNOMCLI_FIC,
			java.math.BigDecimal pPNPOLIZA_FIC, java.math.BigDecimal pPNRECIBO_FIC, java.math.BigDecimal pPNMADUREZ_FIC,
			java.math.BigDecimal pPITOTALR_FIC, java.math.BigDecimal pPICOMISION_FIC, String pPCMONEDA_FIC,
			java.math.BigDecimal pPCOUTSOURCING_FIC, java.math.BigDecimal pPCREPETIDO, java.math.BigDecimal pPCCRUCE,
			java.math.BigDecimal pPCCRUCEDET, java.math.BigDecimal pPCESTADOI, java.math.BigDecimal pPCESTADO,
			String pPTOBSERVA, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD, java.util.Date pPFMODIFI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_CONCILIACIONDET(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPSIDCON", "pPNLINEA", "pPCAGENTE", "pPNNUMIDECLI", "pPTNOMCLI", "pPNPOLIZA",
				"pPNCERTIF", "pPNRECIBO", "pPNMADUREZ", "pPITOTALR", "pPICOMISION", "pPCMONEDA", "pPCOUTSOURCING",
				"pPTNOMCLI_FIC", "pPNPOLIZA_FIC", "pPNRECIBO_FIC", "pPNMADUREZ_FIC", "pPITOTALR_FIC", "pPICOMISION_FIC",
				"pPCMONEDA_FIC", "pPCOUTSOURCING_FIC", "pPCREPETIDO", "pPCCRUCE", "pPCCRUCEDET", "pPCESTADOI",
				"pPCESTADO", "pPTOBSERVA", "pPCUSUALT", "pPFALTA", "pPCUSUMOD", "pPFMODIFI" },
				new Object[] { pPSIDCON, pPNLINEA, pPCAGENTE, pPNNUMIDECLI, pPTNOMCLI, pPNPOLIZA, pPNCERTIF, pPNRECIBO,
						pPNMADUREZ, pPITOTALR, pPICOMISION, pPCMONEDA, pPCOUTSOURCING, pPTNOMCLI_FIC, pPNPOLIZA_FIC,
						pPNRECIBO_FIC, pPNMADUREZ_FIC, pPITOTALR_FIC, pPICOMISION_FIC, pPCMONEDA_FIC,
						pPCOUTSOURCING_FIC, pPCREPETIDO, pPCCRUCE, pPCCRUCEDET, pPCESTADOI, pPCESTADO, pPTOBSERVA,
						pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDCON);
		cStmt.setObject(3, pPNLINEA);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPNNUMIDECLI);
		cStmt.setObject(6, pPTNOMCLI);
		cStmt.setObject(7, pPNPOLIZA);
		cStmt.setObject(8, pPNCERTIF);
		cStmt.setObject(9, pPNRECIBO);
		cStmt.setObject(10, pPNMADUREZ);
		cStmt.setObject(11, pPITOTALR);
		cStmt.setObject(12, pPICOMISION);
		cStmt.setObject(13, pPCMONEDA);
		cStmt.setObject(14, pPCOUTSOURCING);
		cStmt.setObject(15, pPTNOMCLI_FIC);
		cStmt.setObject(16, pPNPOLIZA_FIC);
		cStmt.setObject(17, pPNRECIBO_FIC);
		cStmt.setObject(18, pPNMADUREZ_FIC);
		cStmt.setObject(19, pPITOTALR_FIC);
		cStmt.setObject(20, pPICOMISION_FIC);
		cStmt.setObject(21, pPCMONEDA_FIC);
		cStmt.setObject(22, pPCOUTSOURCING_FIC);
		cStmt.setObject(23, pPCREPETIDO);
		cStmt.setObject(24, pPCCRUCE);
		cStmt.setObject(25, pPCCRUCEDET);
		cStmt.setObject(26, pPCESTADOI);
		cStmt.setObject(27, pPCESTADO);
		cStmt.setObject(28, pPTOBSERVA);
		cStmt.setObject(29, pPCUSUALT);
		cStmt.setObject(30, pPFALTA);
		cStmt.setObject(31, pPCUSUMOD);
		cStmt.setObject(32, pPFMODIFI);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(33, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(33));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONDET(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCAGENTE, String pPNNUMIDECLI, String pPTNOMCLI,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPNMADUREZ, java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPICOMISION,
			String pPCMONEDA, java.math.BigDecimal pPCOUTSOURCING, java.math.BigDecimal pPTNOMCLI_FIC,
			java.math.BigDecimal pPNPOLIZA_FIC, java.math.BigDecimal pPNRECIBO_FIC, java.math.BigDecimal pPNMADUREZ_FIC,
			java.math.BigDecimal pPITOTALR_FIC, java.math.BigDecimal pPICOMISION_FIC, String pPCMONEDA_FIC,
			java.math.BigDecimal pPCOUTSOURCING_FIC, java.math.BigDecimal pPCREPETIDO, java.math.BigDecimal pPCCRUCE,
			java.math.BigDecimal pPCCRUCEDET, java.math.BigDecimal pPCESTADOI, java.math.BigDecimal pPCESTADO,
			String pPTOBSERVA, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD, java.util.Date pPFMODIFI)
			throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONDET(pPSIDCON, pPNLINEA, pPCAGENTE, pPNNUMIDECLI,
				pPTNOMCLI, pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPNMADUREZ, pPITOTALR, pPICOMISION, pPCMONEDA,
				pPCOUTSOURCING, pPTNOMCLI_FIC, pPNPOLIZA_FIC, pPNRECIBO_FIC, pPNMADUREZ_FIC, pPITOTALR_FIC,
				pPICOMISION_FIC, pPCMONEDA_FIC, pPCOUTSOURCING_FIC, pPCREPETIDO, pPCCRUCE, pPCCRUCEDET, pPCESTADOI,
				pPCESTADO, pPTOBSERVA, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACIONDET(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCAGENTE, String pPNNUMIDECLI, String pPTNOMCLI,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPNMADUREZ, java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPICOMISION,
			String pPCMONEDA, java.math.BigDecimal pPCOUTSOURCING, java.math.BigDecimal pPTNOMCLI_FIC,
			java.math.BigDecimal pPNPOLIZA_FIC, java.math.BigDecimal pPNRECIBO_FIC, java.math.BigDecimal pPNMADUREZ_FIC,
			java.math.BigDecimal pPITOTALR_FIC, java.math.BigDecimal pPICOMISION_FIC, String pPCMONEDA_FIC,
			java.math.BigDecimal pPCOUTSOURCING_FIC, java.math.BigDecimal pPCREPETIDO, java.math.BigDecimal pPCCRUCE,
			java.math.BigDecimal pPCCRUCEDET, java.math.BigDecimal pPCESTADOI, java.math.BigDecimal pPCESTADO,
			String pPTOBSERVA, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD, java.util.Date pPFMODIFI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_DEL_GCA_CONCILIACIONDET(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPSIDCON", "pPNLINEA", "pPCAGENTE", "pPNNUMIDECLI", "pPTNOMCLI", "pPNPOLIZA",
				"pPNCERTIF", "pPNRECIBO", "pPNMADUREZ", "pPITOTALR", "pPICOMISION", "pPCMONEDA", "pPCOUTSOURCING",
				"pPTNOMCLI_FIC", "pPNPOLIZA_FIC", "pPNRECIBO_FIC", "pPNMADUREZ_FIC", "pPITOTALR_FIC", "pPICOMISION_FIC",
				"pPCMONEDA_FIC", "pPCOUTSOURCING_FIC", "pPCREPETIDO", "pPCCRUCE", "pPCCRUCEDET", "pPCESTADOI",
				"pPCESTADO", "pPTOBSERVA", "pPCUSUALT", "pPFALTA", "pPCUSUMOD", "pPFMODIFI" },
				new Object[] { pPSIDCON, pPNLINEA, pPCAGENTE, pPNNUMIDECLI, pPTNOMCLI, pPNPOLIZA, pPNCERTIF, pPNRECIBO,
						pPNMADUREZ, pPITOTALR, pPICOMISION, pPCMONEDA, pPCOUTSOURCING, pPTNOMCLI_FIC, pPNPOLIZA_FIC,
						pPNRECIBO_FIC, pPNMADUREZ_FIC, pPITOTALR_FIC, pPICOMISION_FIC, pPCMONEDA_FIC,
						pPCOUTSOURCING_FIC, pPCREPETIDO, pPCCRUCE, pPCCRUCEDET, pPCESTADOI, pPCESTADO, pPTOBSERVA,
						pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDCON);
		cStmt.setObject(3, pPNLINEA);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPNNUMIDECLI);
		cStmt.setObject(6, pPTNOMCLI);
		cStmt.setObject(7, pPNPOLIZA);
		cStmt.setObject(8, pPNCERTIF);
		cStmt.setObject(9, pPNRECIBO);
		cStmt.setObject(10, pPNMADUREZ);
		cStmt.setObject(11, pPITOTALR);
		cStmt.setObject(12, pPICOMISION);
		cStmt.setObject(13, pPCMONEDA);
		cStmt.setObject(14, pPCOUTSOURCING);
		cStmt.setObject(15, pPTNOMCLI_FIC);
		cStmt.setObject(16, pPNPOLIZA_FIC);
		cStmt.setObject(17, pPNRECIBO_FIC);
		cStmt.setObject(18, pPNMADUREZ_FIC);
		cStmt.setObject(19, pPITOTALR_FIC);
		cStmt.setObject(20, pPICOMISION_FIC);
		cStmt.setObject(21, pPCMONEDA_FIC);
		cStmt.setObject(22, pPCOUTSOURCING_FIC);
		cStmt.setObject(23, pPCREPETIDO);
		cStmt.setObject(24, pPCCRUCE);
		cStmt.setObject(25, pPCCRUCEDET);
		cStmt.setObject(26, pPCESTADOI);
		cStmt.setObject(27, pPCESTADO);
		cStmt.setObject(28, pPTOBSERVA);
		cStmt.setObject(29, pPCUSUALT);
		cStmt.setObject(30, pPFALTA);
		cStmt.setObject(31, pPCUSUMOD);
		cStmt.setObject(32, pPFMODIFI);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(33, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(33));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACIONDET(java.math.BigDecimal pPSIDCON,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCAGENTE, String pPNNUMIDECLI, String pPTNOMCLI,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPNMADUREZ, java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPICOMISION,
			String pPCMONEDA, java.math.BigDecimal pPCOUTSOURCING, java.math.BigDecimal pPTNOMCLI_FIC,
			java.math.BigDecimal pPNPOLIZA_FIC, java.math.BigDecimal pPNRECIBO_FIC, java.math.BigDecimal pPNMADUREZ_FIC,
			java.math.BigDecimal pPITOTALR_FIC, java.math.BigDecimal pPICOMISION_FIC, String pPCMONEDA_FIC,
			java.math.BigDecimal pPCOUTSOURCING_FIC, java.math.BigDecimal pPCREPETIDO, java.math.BigDecimal pPCCRUCE,
			java.math.BigDecimal pPCCRUCEDET, java.math.BigDecimal pPCESTADOI, java.math.BigDecimal pPCESTADO,
			String pPTOBSERVA, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD, java.util.Date pPFMODIFI)
			throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACIONDET(pPSIDCON, pPNLINEA, pPCAGENTE, pPNNUMIDECLI,
				pPTNOMCLI, pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPNMADUREZ, pPITOTALR, pPICOMISION, pPCMONEDA,
				pPCOUTSOURCING, pPTNOMCLI_FIC, pPNPOLIZA_FIC, pPNRECIBO_FIC, pPNMADUREZ_FIC, pPITOTALR_FIC,
				pPICOMISION_FIC, pPCMONEDA_FIC, pPCOUTSOURCING_FIC, pPCREPETIDO, pPCCRUCE, pPCCRUCEDET, pPCESTADOI,
				pPCESTADO, pPTOBSERVA, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(java.math.BigDecimal pPNCONCIACT,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPCCONACTA, java.math.BigDecimal pPNCANTIDAD,
			java.math.BigDecimal pPNVALOR, java.math.BigDecimal pPCRESPAGE, java.math.BigDecimal pPCRESPCIA,
			java.util.Date pPFSOLUCION, String pPTOBS, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD,
			java.util.Date pPFMODIFI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_GCA_CONCILIACION_ACTA(?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPNCONCIACT", "pPSIDCON", "pPCCONACTA", "pPNCANTIDAD", "pPNVALOR", "pPCRESPAGE",
						"pPCRESPCIA", "pPFSOLUCION", "pPTOBS", "pPCUSUALT", "pPFALTA", "pPCUSUMOD", "pPFMODIFI" },
				new Object[] { pPNCONCIACT, pPSIDCON, pPCCONACTA, pPNCANTIDAD, pPNVALOR, pPCRESPAGE, pPCRESPCIA,
						pPFSOLUCION, pPTOBS, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCONCIACT);
		cStmt.setObject(3, pPSIDCON);
		cStmt.setObject(4, pPCCONACTA);
		cStmt.setObject(5, pPNCANTIDAD);
		cStmt.setObject(6, pPNVALOR);
		cStmt.setObject(7, pPCRESPAGE);
		cStmt.setObject(8, pPCRESPCIA);
		cStmt.setObject(9, pPFSOLUCION);
		cStmt.setObject(10, pPTOBS);
		cStmt.setObject(11, pPCUSUALT);
		cStmt.setObject(12, pPFALTA);
		cStmt.setObject(13, pPCUSUMOD);
		cStmt.setObject(14, pPFMODIFI);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(java.math.BigDecimal pPNCONCIACT,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPCCONACTA, java.math.BigDecimal pPNCANTIDAD,
			java.math.BigDecimal pPNVALOR, java.math.BigDecimal pPCRESPAGE, java.math.BigDecimal pPCRESPCIA,
			java.util.Date pPFSOLUCION, String pPTOBS, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD,
			java.util.Date pPFMODIFI) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(pPNCONCIACT, pPSIDCON, pPCCONACTA, pPNCANTIDAD,
				pPNVALOR, pPCRESPAGE, pPCRESPCIA, pPFSOLUCION, pPTOBS, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(java.math.BigDecimal pPNCONCIACT,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPCCONACTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_CONCILIACION_ACTA(?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPNCONCIACT", "pPSIDCON", "pPCCONACTA" },
				new Object[] { pPNCONCIACT, pPSIDCON, pPCCONACTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCONCIACT);
		cStmt.setObject(3, pPSIDCON);
		cStmt.setObject(4, pPCCONACTA);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(java.math.BigDecimal pPNCONCIACT,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPCCONACTA) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(pPNCONCIACT, pPSIDCON, pPCCONACTA);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACION_ACTA(java.math.BigDecimal pPNCONCIACT,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPCCONACTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_DEL_GCA_CONCILIACION_ACTA(?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPNCONCIACT", "pPSIDCON", "pPCCONACTA" },
				new Object[] { pPNCONCIACT, pPSIDCON, pPCCONACTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCONCIACT);
		cStmt.setObject(3, pPSIDCON);
		cStmt.setObject(4, pPCCONACTA);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACION_ACTA(java.math.BigDecimal pPNCONCIACT,
			java.math.BigDecimal pPSIDCON, java.math.BigDecimal pPCCONACTA) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_DEL_GCA_CONCILIACION_ACTA(pPNCONCIACT, pPSIDCON, pPCCONACTA);// AXIS-WLS1SERVER-Ready
	}

	// INI - ML - 27/05/2019 - EL NIT DE UN CONSORCIO PODRIA CONTENER CARACTERES
	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GESTION_CARTERA_RECOBRO(String pPNNUMIDE,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			String pPNCERTIF, java.math.BigDecimal pPNSINIES, java.util.Date pPFINICIO, java.util.Date pPFFINAL,
			java.math.BigDecimal pPCRECOPEN, java.math.BigDecimal pPTIPO, java.math.BigDecimal pPRECURSO,
			java.math.BigDecimal pPOPCION) throws Exception {
		// INI - ML - 27/05/2019 - EL NIT DE UN CONSORCIO PODRIA CONTENER CARACTERES
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GESTION_CARTERA_RECOBRO(?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPNNUMIDE", "pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPFINICIO",
						"pPFFINAL", "pPCRECOPEN", "pPTIPO", "pPRECURSO", "pPOPCION" },
				new Object[] { pPNNUMIDE, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPFINICIO, pPFFINAL,
						pPCRECOPEN, pPTIPO, pPRECURSO, pPOPCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMIDE);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNCERTIF);
		cStmt.setObject(7, pPNSINIES);
		cStmt.setObject(8, pPFINICIO);
		cStmt.setObject(9, pPFFINAL);
		cStmt.setObject(10, pPCRECOPEN);
		cStmt.setObject(11, pPTIPO);
		cStmt.setObject(12, pPRECURSO);
		cStmt.setObject(13, pPOPCION);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	// INI - ML - 27/05/2019 - EL NIT DE UN CONSORCIO PODRIA CONTENER CARACTERES
	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GESTION_CARTERA_RECOBRO(String pPNNUMIDE,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			String pPNCERTIF, java.math.BigDecimal pPNSINIES, java.util.Date pPFINICIO, java.util.Date pPFFINAL,
			java.math.BigDecimal pPCRECOPEN, java.math.BigDecimal pPTIPO, java.math.BigDecimal pPRECURSO,
			java.math.BigDecimal pPOPCION) throws Exception {
		// FIN - ML - 27/05/2019 - EL NIT DE UN CONSORCIO PODRIA CONTENER CARACTERES
		return this.callPAC_IAX_GESTION_CAR__F_GET_GESTION_CARTERA_RECOBRO(pPNNUMIDE, pPCRAMO, pPSPRODUC, pPNPOLIZA,
				pPNCERTIF, pPNSINIES, pPFINICIO, pPFFINAL, pPCRECOPEN, pPTIPO, pPRECURSO, pPOPCION);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_DEPU_SALDOFAVCLI(java.util.Date pPPERCORTE,
			java.math.BigDecimal pPCPENDIENTES, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPNNUMIDEAGE,
			java.math.BigDecimal pPNNUMIDECLI, java.util.Date pPFDOCINI, java.util.Date pPFDOCFIN,
			java.math.BigDecimal pPNDOCSAP, java.util.Date pPFCONTINI, java.util.Date pPFCONTFIN,
			java.math.BigDecimal pPNTIPO, java.math.BigDecimal pPNOPCION, java.math.BigDecimal pPNMODO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_DEPU_SALDOFAVCLI(?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery, new String[] { "pPPERCORTE", "pPCPENDIENTES", "pPCSUCURSAL", "pPNNUMIDEAGE", "pPNNUMIDECLI",
				"pPFDOCINI", "pPFDOCFIN", "pPNDOCSAP", "pPFCONTINI", "pPFCONTFIN", "pPNTIPO", "pPNOPCION", "pPNMODO" },
				new Object[] { pPPERCORTE, pPCPENDIENTES, pPCSUCURSAL, pPNNUMIDEAGE, pPNNUMIDECLI, pPFDOCINI, pPFDOCFIN,
						pPNDOCSAP, pPFCONTINI, pPFCONTFIN, pPNTIPO, pPNOPCION, pPNMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPERCORTE);
		cStmt.setObject(3, pPCPENDIENTES);
		cStmt.setObject(4, pPCSUCURSAL);
		cStmt.setObject(5, pPNNUMIDEAGE);
		cStmt.setObject(6, pPNNUMIDECLI);
		cStmt.setObject(7, pPFDOCINI);
		cStmt.setObject(8, pPFDOCFIN);
		cStmt.setObject(9, pPNDOCSAP);
		cStmt.setObject(10, pPFCONTINI);
		cStmt.setObject(11, pPFCONTFIN);
		cStmt.setObject(12, pPNTIPO);
		cStmt.setObject(13, pPNOPCION);
		cStmt.setObject(14, pPNMODO);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_DEPU_SALDOFAVCLI(java.util.Date pPPERCORTE,
			java.math.BigDecimal pPCPENDIENTES, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPNNUMIDEAGE,
			java.math.BigDecimal pPNNUMIDECLI, java.util.Date pPFDOCINI, java.util.Date pPFDOCFIN,
			java.math.BigDecimal pPNDOCSAP, java.util.Date pPFCONTINI, java.util.Date pPFCONTFIN,
			java.math.BigDecimal pPNTIPO, java.math.BigDecimal pPNOPCION, java.math.BigDecimal pPNMODO)
			throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_DEPU_SALDOFAVCLI(pPPERCORTE, pPCPENDIENTES, pPCSUCURSAL,
				pPNNUMIDEAGE, pPNNUMIDECLI, pPFDOCINI, pPFDOCFIN, pPNDOCSAP, pPFCONTINI, pPFCONTFIN, pPNTIPO, pPNOPCION,
				pPNMODO);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_SET_SIN_APUNTES_REC(java.math.BigDecimal pPIDOBS_GR,
			java.math.BigDecimal pPNSINIES_R, java.math.BigDecimal pPNTRAMIT_R, java.math.BigDecimal pPNPOLIZA_R,
			String pPTTITOBS, java.util.Date pPFALTA_GR, String pPCUSUALT_GR, String pPTOBS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_SIN_APUNTES_REC(?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDOBS_GR", "pPNSINIES_R", "pPNTRAMIT_R", "pPNPOLIZA_R", "pPTTITOBS", "pPFALTA_GR",
						"pPCUSUALT_GR", "pPTOBS" },
				new Object[] { pPIDOBS_GR, pPNSINIES_R, pPNTRAMIT_R, pPNPOLIZA_R, pPTTITOBS, pPFALTA_GR, pPCUSUALT_GR,
						pPTOBS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS_GR);
		cStmt.setObject(3, pPNSINIES_R);
		cStmt.setObject(4, pPNTRAMIT_R);
		cStmt.setObject(5, pPNPOLIZA_R);
		cStmt.setObject(6, pPTTITOBS);
		cStmt.setObject(7, pPFALTA_GR);
		cStmt.setObject(8, pPCUSUALT_GR);
		cStmt.setObject(9, pPTOBS);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_SIN_APUNTES_REC(java.math.BigDecimal pPIDOBS_GR,
			java.math.BigDecimal pPNSINIES_R, java.math.BigDecimal pPNTRAMIT_R, java.math.BigDecimal pPNPOLIZA_R,
			String pPTTITOBS, java.util.Date pPFALTA_GR, String pPCUSUALT_GR, String pPTOBS) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_SIN_APUNTES_REC(pPIDOBS_GR, pPNSINIES_R, pPNTRAMIT_R, pPNPOLIZA_R,
				pPTTITOBS, pPFALTA_GR, pPCUSUALT_GR, pPTOBS);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_SIN_APUNTES_REC(java.math.BigDecimal pPIDOBS_GR,
			java.math.BigDecimal pPNSINIES_R, java.math.BigDecimal pPNTRAMIT_R, java.math.BigDecimal pPNPOLIZA_R,
			String pPTTITOBS, java.util.Date pPFALTA_GR, String pPCUSUALT_GR, String pPTOBS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_SIN_APUNTES_REC(?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDOBS_GR", "pPNSINIES_R", "pPNTRAMIT_R", "pPNPOLIZA_R", "pPTTITOBS", "pPFALTA_GR",
						"pPCUSUALT_GR", "pPTOBS" },
				new Object[] { pPIDOBS_GR, pPNSINIES_R, pPNTRAMIT_R, pPNPOLIZA_R, pPTTITOBS, pPFALTA_GR, pPCUSUALT_GR,
						pPTOBS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS_GR);
		cStmt.setObject(3, pPNSINIES_R);
		cStmt.setObject(4, pPNTRAMIT_R);
		cStmt.setObject(5, pPNPOLIZA_R);
		cStmt.setObject(6, pPTTITOBS);
		cStmt.setObject(7, pPFALTA_GR);
		cStmt.setObject(8, pPCUSUALT_GR);
		cStmt.setObject(9, pPTOBS);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_SIN_APUNTES_REC(java.math.BigDecimal pPIDOBS_GR,
			java.math.BigDecimal pPNSINIES_R, java.math.BigDecimal pPNTRAMIT_R, java.math.BigDecimal pPNPOLIZA_R,
			String pPTTITOBS, java.util.Date pPFALTA_GR, String pPCUSUALT_GR, String pPTOBS) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_SIN_APUNTES_REC(pPIDOBS_GR, pPNSINIES_R, pPNTRAMIT_R, pPNPOLIZA_R,
				pPTTITOBS, pPFALTA_GR, pPCUSUALT_GR, pPTOBS);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_DEL_SIN_APUNTES_REC(java.math.BigDecimal pPIDOBS_GR,
			java.math.BigDecimal pPNSINIES_R, java.math.BigDecimal pPNTRAMIT_R, java.math.BigDecimal pPNPOLIZA_R,
			String pPTTITOBS, java.util.Date pPFALTA_GR, String pPCUSUALT_GR, String pPTOBS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_DEL_SIN_APUNTES_REC(?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDOBS_GR", "pPNSINIES_R", "pPNTRAMIT_R", "pPNPOLIZA_R", "pPTTITOBS", "pPFALTA_GR",
						"pPCUSUALT_GR", "pPTOBS" },
				new Object[] { pPIDOBS_GR, pPNSINIES_R, pPNTRAMIT_R, pPNPOLIZA_R, pPTTITOBS, pPFALTA_GR, pPCUSUALT_GR,
						pPTOBS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS_GR);
		cStmt.setObject(3, pPNSINIES_R);
		cStmt.setObject(4, pPNTRAMIT_R);
		cStmt.setObject(5, pPNPOLIZA_R);
		cStmt.setObject(6, pPTTITOBS);
		cStmt.setObject(7, pPFALTA_GR);
		cStmt.setObject(8, pPCUSUALT_GR);
		cStmt.setObject(9, pPTOBS);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_DEL_SIN_APUNTES_REC(java.math.BigDecimal pPIDOBS_GR,
			java.math.BigDecimal pPNSINIES_R, java.math.BigDecimal pPNTRAMIT_R, java.math.BigDecimal pPNPOLIZA_R,
			String pPTTITOBS, java.util.Date pPFALTA_GR, String pPCUSUALT_GR, String pPTOBS) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_DEL_SIN_APUNTES_REC(pPIDOBS_GR, pPNSINIES_R, pPNTRAMIT_R, pPNPOLIZA_R,
				pPTTITOBS, pPFALTA_GR, pPCUSUALT_GR, pPTOBS);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_AGD_OBSERVACIONES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNSINIES,
			String pPNTRAMIT, java.util.Date pPTIPO, String pPPARAMA, String pPPARAMB, java.math.BigDecimal pPSGSFAVCLI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_AGD_OBSERVACIONES(?,?,?,?,?,?,?,?, ?,?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRECIBO", "pPCAGENTE", "pPNSINIES", "pPNTRAMIT", "pPTIPO", "pPPARAMA",
						"pPPARAMB", "pPSGSFAVCLI" },
				new Object[] { pPSSEGURO, pPNRECIBO, pPCAGENTE, pPNSINIES, pPNTRAMIT, pPTIPO, pPPARAMA, pPPARAMB,
						pPSGSFAVCLI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPNSINIES);
		cStmt.setObject(6, pPNTRAMIT);
		cStmt.setObject(7, pPTIPO);
		cStmt.setObject(8, pPPARAMA);
		cStmt.setObject(9, pPPARAMB);
		cStmt.setObject(10, pPSGSFAVCLI);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_AGD_OBSERVACIONES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNSINIES,
			String pPNTRAMIT, java.util.Date pPTIPO, String pPPARAMA, String pPPARAMB, java.math.BigDecimal pPSGSFAVCLI)
			throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_AGD_OBSERVACIONES(pPSSEGURO, pPNRECIBO, pPCAGENTE, pPNSINIES,
				pPNTRAMIT, pPTIPO, pPPARAMA, pPPARAMB, pPSGSFAVCLI);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_CARGACONC(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCFICHERO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_CARGACONC(?,?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFICHERO" }, new Object[] { pPCEMPRES, pPCFICHERO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFICHERO);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CARGACONC(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCFICHERO) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_CARGACONC(pPCEMPRES, pPCFICHERO);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_SET_GCA_SALFAVCLI(java.math.BigDecimal pPSGSFAVCLI, String pPNNUMIDECLI,
			String pPTNOMCLI, java.math.BigDecimal pPNDOCSAP, java.util.Date pPFDOC, java.util.Date pPFCONTAB,
			java.math.BigDecimal pPCSUCURSAL, String pPNNUMIDEAGE, String pPTNOMAGE, java.math.BigDecimal pPNPOLIZA,
			String pPNCERTIF, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPIMOVIMI_MONCIA,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCGESTION,
			String pPTINCONSISTENCIA, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD,
			java.util.Date pPFMODIFI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_GCA_SALFAVCLI(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPSGSFAVCLI", "pPNNUMIDECLI", "pPTNOMCLI", "pPNDOCSAP", "pPFDOC", "pPFCONTAB",
						"pPCSUCURSAL", "pPNNUMIDEAGE", "pPTNOMAGE", "pPNPOLIZA", "pPNCERTIF", "pPNRECIBO",
						"pPIMOVIMI_MONCIA", "pPSPROCES", "pPCESTADO", "pPCGESTION", "pPTINCONSISTENCIA", "pPCUSUALT",
						"pPFALTA", "pPCUSUMOD", "pPFMODIFI" },
				new Object[] { pPSGSFAVCLI, pPNNUMIDECLI, pPTNOMCLI, pPNDOCSAP, pPFDOC, pPFCONTAB, pPCSUCURSAL,
						pPNNUMIDEAGE, pPTNOMAGE, pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPIMOVIMI_MONCIA, pPSPROCES,
						pPCESTADO, pPCGESTION, pPTINCONSISTENCIA, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSGSFAVCLI);
		cStmt.setObject(3, pPNNUMIDECLI);
		cStmt.setObject(4, pPTNOMCLI);
		cStmt.setObject(5, pPNDOCSAP);
		cStmt.setObject(6, pPFDOC);
		cStmt.setObject(7, pPFCONTAB);
		cStmt.setObject(8, pPCSUCURSAL);
		cStmt.setObject(9, pPNNUMIDEAGE);
		cStmt.setObject(10, pPTNOMAGE);
		cStmt.setObject(11, pPNPOLIZA);
		cStmt.setObject(12, pPNCERTIF);
		cStmt.setObject(13, pPNRECIBO);
		cStmt.setObject(14, pPIMOVIMI_MONCIA);
		cStmt.setObject(15, pPSPROCES);
		cStmt.setObject(16, pPCESTADO);
		cStmt.setObject(17, pPCGESTION);
		cStmt.setObject(18, pPTINCONSISTENCIA);
		cStmt.setObject(19, pPCUSUALT);
		cStmt.setObject(20, pPFALTA);
		cStmt.setObject(21, pPCUSUMOD);
		cStmt.setObject(22, pPFMODIFI);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(23, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_SALFAVCLI(java.math.BigDecimal pPSGSFAVCLI,
			String pPNNUMIDECLI, String pPTNOMCLI, java.math.BigDecimal pPNDOCSAP, java.util.Date pPFDOC,
			java.util.Date pPFCONTAB, java.math.BigDecimal pPCSUCURSAL, String pPNNUMIDEAGE, String pPTNOMAGE,
			java.math.BigDecimal pPNPOLIZA, String pPNCERTIF, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPIMOVIMI_MONCIA, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCGESTION, String pPTINCONSISTENCIA, String pPCUSUALT, java.util.Date pPFALTA,
			String pPCUSUMOD, java.util.Date pPFMODIFI) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_GCA_SALFAVCLI(pPSGSFAVCLI, pPNNUMIDECLI, pPTNOMCLI, pPNDOCSAP,
				pPFDOC, pPFCONTAB, pPCSUCURSAL, pPNNUMIDEAGE, pPTNOMAGE, pPNPOLIZA, pPNCERTIF, pPNRECIBO,
				pPIMOVIMI_MONCIA, pPSPROCES, pPCESTADO, pPCGESTION, pPTINCONSISTENCIA, pPCUSUALT, pPFALTA, pPCUSUMOD,
				pPFMODIFI);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTION_CAR__F_SET_AGD_OBSERVACIONES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPCCONOBS, java.math.BigDecimal pPCTIPOBS,
			String pPTTITOBS, String pPTOBS, java.util.Date pPFOBS, java.util.Date pPFRECORDATORIO,
			java.math.BigDecimal pPCTIPAGD, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCAGENTE, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCAMBITO, java.math.BigDecimal pPCPRIORI, java.math.BigDecimal pPCPRIVOBS,
			java.math.BigDecimal pPPUBLICO, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD,
			java.util.Date pPFMODIFI, java.math.BigDecimal pPSGSFAVCLI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_AGD_OBSERVACIONES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPIDOBS", "pPCCONOBS", "pPCTIPOBS", "pPTTITOBS", "pPTOBS", "pPFOBS",
						"pPFRECORDATORIO", "pPCTIPAGD", "pPSSEGURO", "pPNRECIBO", "pPCAGENTE", "pPNSINIES", "pPNTRAMIT",
						"pPCAMBITO", "pPCPRIORI", "pPCPRIVOBS", "pPPUBLICO", "pPCUSUALT", "pPFALTA", "pPCUSUMOD",
						"pPFMODIFI", "pPSGSFAVCLI" },
				new Object[] { pPCEMPRES, pPIDOBS, pPCCONOBS, pPCTIPOBS, pPTTITOBS, pPTOBS, pPFOBS, pPFRECORDATORIO,
						pPCTIPAGD, pPSSEGURO, pPNRECIBO, pPCAGENTE, pPNSINIES, pPNTRAMIT, pPCAMBITO, pPCPRIORI,
						pPCPRIVOBS, pPPUBLICO, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI, pPSGSFAVCLI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPIDOBS);
		cStmt.setObject(4, pPCCONOBS);
		cStmt.setObject(5, pPCTIPOBS);
		cStmt.setObject(6, pPTTITOBS);
		cStmt.setObject(7, pPTOBS);
		cStmt.setObject(8, pPFOBS);
		cStmt.setObject(9, pPFRECORDATORIO);
		cStmt.setObject(10, pPCTIPAGD);
		cStmt.setObject(11, pPSSEGURO);
		cStmt.setObject(12, pPNRECIBO);
		cStmt.setObject(13, pPCAGENTE);
		cStmt.setObject(14, pPNSINIES);
		cStmt.setObject(15, pPNTRAMIT);
		cStmt.setObject(16, pPCAMBITO);
		cStmt.setObject(17, pPCPRIORI);
		cStmt.setObject(18, pPCPRIVOBS);
		cStmt.setObject(19, pPPUBLICO);
		cStmt.setObject(20, pPCUSUALT);
		cStmt.setObject(21, pPFALTA);
		cStmt.setObject(22, pPCUSUMOD);
		cStmt.setObject(23, pPFMODIFI);
		cStmt.setObject(24, pPSGSFAVCLI);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(25, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(25));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_AGD_OBSERVACIONES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPCCONOBS, java.math.BigDecimal pPCTIPOBS,
			String pPTTITOBS, String pPTOBS, java.util.Date pPFOBS, java.util.Date pPFRECORDATORIO,
			java.math.BigDecimal pPCTIPAGD, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCAGENTE, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCAMBITO, java.math.BigDecimal pPCPRIORI, java.math.BigDecimal pPCPRIVOBS,
			java.math.BigDecimal pPPUBLICO, String pPCUSUALT, java.util.Date pPFALTA, String pPCUSUMOD,
			java.util.Date pPFMODIFI, java.math.BigDecimal pPSGSFAVCLI) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_AGD_OBSERVACIONES(pPCEMPRES, pPIDOBS, pPCCONOBS, pPCTIPOBS,
				pPTTITOBS, pPTOBS, pPFOBS, pPFRECORDATORIO, pPCTIPAGD, pPSSEGURO, pPNRECIBO, pPCAGENTE, pPNSINIES,
				pPNTRAMIT, pPCAMBITO, pPCPRIORI, pPCPRIVOBS, pPPUBLICO, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI,
				pPSGSFAVCLI);// AXIS-WLS1SERVER-Ready
	}

	// --START-PAC_IAX_GESTION_CAR.F_GET_GCA_DOCGSFAVCLI(PIDOBS)
	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_DOCGSFAVCLI(java.math.BigDecimal pPIDOBS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_DOCGSFAVCLI(?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS" }, new Object[] { pPIDOBS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_DOCGSFAVCLI(java.math.BigDecimal pPIDOBS) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_DOCGSFAVCLI(pPIDOBS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_CAR.F_GET_GCA_DOCGSFAVCLI

	// --START-PAC_IAX_GESTION_CAR.F_INS_GCA_DOCGSFAVCLI(PIDOBS, PIDDOCGDX,
	// PCTIPO, PTOBSERV, PTFILENAME, PFCADUCI, PFALTA)
	private HashMap callPAC_IAX_GESTION_CAR__F_INS_GCA_DOCGSFAVCLI(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO, String pPTOBSERV, String pPTFILENAME,
			java.sql.Date pPFCADUCI, java.sql.Date pPFALTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_INS_GCA_DOCGSFAVCLI(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDOBS", "pPIDDOCGDX", "pPCTIPO", "pPTOBSERV", "pPTFILENAME", "pPFCADUCI", "pPFALTA" },
				new Object[] { pPIDOBS, pPIDDOCGDX, pPCTIPO, pPTOBSERV, pPTFILENAME, pPFCADUCI, pPFALTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPIDDOCGDX);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPTOBSERV);
		cStmt.setObject(6, pPTFILENAME);
		cStmt.setObject(7, pPFCADUCI);
		cStmt.setObject(8, pPFALTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_INS_GCA_DOCGSFAVCLI(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO, String pPTOBSERV, String pPTFILENAME,
			java.sql.Date pPFCADUCI, java.sql.Date pPFALTA) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_INS_GCA_DOCGSFAVCLI(pPIDOBS, pPIDDOCGDX, pPCTIPO, pPTOBSERV, pPTFILENAME,
				pPFCADUCI, pPFALTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_CAR.F_INS_GCA_DOCGSFAVCLI

	// --START-PAC_IAX_GESTION_CAR.F_GET_GCA_DOCGSFAVCLIS(PIDOBS)
	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_DOCGSFAVCLIS(java.math.BigDecimal pPIDOBS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_DOCGSFAVCLIS(?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS" }, new Object[] { pPIDOBS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_DOCGSFAVCLIS(java.math.BigDecimal pPIDOBS) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_DOCGSFAVCLIS(pPIDOBS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTION_CAR.F_GET_GCA_DOCGSFAVCLIS
	// --START-PAC_IAX_GESTION_CAR.F_GET_CANTIDAD_ACTA_CON(PNCODPARCON, PSIDCON)
	private HashMap callPAC_IAX_GESTION_CAR__F_GET_CANTIDAD_ACTA_CON(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPSIDCON) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_CANTIDAD_ACTA_CON(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNCODPARCON", "pPSIDCON" }, new Object[] { pPNCODPARCON, pPSIDCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODPARCON);
		cStmt.setObject(3, pPSIDCON);
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_CANTIDAD_ACTA_CON(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPSIDCON) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_CANTIDAD_ACTA_CON(pPNCODPARCON, pPSIDCON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTION_CAR.F_GET_CANTIDAD_ACTA_CON
	// --START-PAC_IAX_GESTION_CAR.F_GET_VALOR_ACTA_CON(PNCODPARCON, PSIDCON)
	private HashMap callPAC_IAX_GESTION_CAR__F_GET_VALOR_ACTA_CON(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPSIDCON) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_VALOR_ACTA_CON(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNCODPARCON", "pPSIDCON" }, new Object[] { pPNCODPARCON, pPSIDCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODPARCON);
		cStmt.setObject(3, pPSIDCON);
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_VALOR_ACTA_CON(java.math.BigDecimal pPNCODPARCON,
			java.math.BigDecimal pPSIDCON) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_VALOR_ACTA_CON(pPNCODPARCON, pPSIDCON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTION_CAR.F_GET_VALOR_ACTA_CON
	// --START-PAC_IAX_GESTION_CAR.F_GET_GCA_MAPEO(PCFICHERO)
	private HashMap callPAC_IAX_GESTION_CAR__F_GET_GCA_MAPEO(java.math.BigDecimal pPCFICHERO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_GET_GCA_MAPEO(?, ?)}";

		logCall(callQuery, new String[] { "pPCFICHERO" }, new Object[] { pPCFICHERO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCFICHERO);
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_MAPEO(java.math.BigDecimal pPCFICHERO) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_GET_GCA_MAPEO(pPCFICHERO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTION_CAR.F_GET_GCA_MAPEO
	// --START-PAC_IAX_GESTION_CAR.F_SET_GCA_MAPEO(PCFICHERO, PTCOLIR, PTCOLDEST)
	private HashMap callPAC_IAX_GESTION_CAR__F_SET_GCA_MAPEO(java.math.BigDecimal pPCFICHERO, String pPTCOLIR,
			String pPTCOLDEST) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_CAR.F_SET_GCA_MAPEO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCFICHERO", "pPTCOLIR", "pPTCOLDEST" },
				new Object[] { pPCFICHERO, pPTCOLIR, pPTCOLDEST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCFICHERO);
		cStmt.setObject(3, pPTCOLIR);
		cStmt.setObject(4, pPTCOLDEST);
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

	public HashMap ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_MAPEO(java.math.BigDecimal pPCFICHERO, String pPTCOLIR,
			String pPTCOLDEST) throws Exception {
		return this.callPAC_IAX_GESTION_CAR__F_SET_GCA_MAPEO(pPCFICHERO, pPTCOLIR, pPTCOLDEST);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_CAR.F_SET_GCA_MAPEO

}
