//Revision:# CBsb2l7KqXDbtzEe3KwCYg== #
package axis.jdbc;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PRODUCCION extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRODUCCION.class);
	private Connection conn = null;

	public PAC_IAX_PRODUCCION(Connection conn) {
		this.conn = conn;
	}

	// ---START-PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS(PNRIESGO, PCPARTIDA, PCGARANT,
	// PSELGAR)
	private HashMap callPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSELGAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS(?, ?, ?, ?, ?)}";
		// Number x = Double.valueOf("");

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCPARTIDA", "pPCGARANT", "pPSELGAR" },
				new Object[] { pPNRIESGO, pPCPARTIDA, pPCGARANT, pPSELGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCPARTIDA);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPSELGAR);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_BF_PROACTGRUP".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSELGAR)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(pPNRIESGO, pPCPARTIDA, pPCGARANT, pPSELGAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS

	// --START-PAC_IAX_PRODUCCION.F_ANULARPROPUESTA(PSSEGURO, PNSUPLEM, PCMOTMOV,
	// PTOBSERVA)

	private HashMap callPAC_IAX_PRODUCCION__F_ANULARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNSUPLEM, java.math.BigDecimal pPCMOTMOV, String pPTOBSERVA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ANULARPROPUESTA(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSUPLEM", "pPCMOTMOV", "pPTOBSERVA" },
				new Object[] { pPSSEGURO, pPNSUPLEM, pPCMOTMOV, pPTOBSERVA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSUPLEM);
		cStmt.setObject(4, pPCMOTMOV);
		cStmt.setObject(5, pPTOBSERVA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ANULARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNSUPLEM, java.math.BigDecimal pPCMOTMOV, String pPTOBSERVA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ANULARPROPUESTA(pPSSEGURO, pPNSUPLEM, pPCMOTMOV, pPTOBSERVA);
	}
	// --END-PAC_IAX_PRODUCCION.F_ANULARPROPUESTA
	// --START-PAC_IAX_PRODUCCION.F_CAMBIARPERSONATOMASE(SPERSONACT, SPERSONPOS,
	// TIPO)

	private HashMap callPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(java.math.BigDecimal pSPERSONACT,
			java.math.BigDecimal pSPERSONPOS, String pTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CAMBIARPERSONATOMASE(?,?,?,?)}";
		logCall(callQuery, new String[] { "pSPERSONACT", "pSPERSONPOS", "pTIPO" },
				new Object[] { pSPERSONACT, pSPERSONPOS, pTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSONACT);
		cStmt.setObject(3, pSPERSONPOS);
		cStmt.setObject(4, pTIPO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(java.math.BigDecimal pSPERSONACT,
			java.math.BigDecimal pSPERSONPOS, String pTIPO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(pSPERSONACT, pSPERSONPOS, pTIPO);
	}
	// --END-PAC_IAX_PRODUCCION.F_CAMBIARPERSONATOMASE

	// --START-PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA(PRAMO, PSPRODUC, PNPOLIZA,
	// PNCERT, PNNUMIDE, PSNIP, PBUSCAR, PNSOLICI, PTIPOPERSONA, PCAGENTE, PCMATRIC,
	// PCPOSTAL, PTDOMICI, PTNATRIE, PCSITUAC, P_FILTROPROD, PCPOLCIA, PCCOMPANI,
	// PCACTIVI, PCESTSUPL, PNPOLRELACIONADA, PNPOLINI, PFILAGE, PCSUCURSAL, PCADM,
	// PCMOTOR, PCCHASIS, PNBASTID, PCMODO, PNCONTRATO, PFEMISIOINI, PFEMISIOFIN,
	// PFEFEINI, PFEFEFIN, PCUSUARIO)
	private HashMap callPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			java.math.BigDecimal pPNPOLRELACIONADA, String pPNPOLINI, java.math.BigDecimal pPFILAGE,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, java.math.BigDecimal pPCMODO, String pPNCONTRATO, java.sql.Date pPFEMISIOINI,
			java.sql.Date pPFEMISIOFIN, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN, String pPCUSUARIO,
			String pPNNUMIDEASE, String pPBUSCARASE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERT", "pPNNUMIDE", "pPSNIP", "pPBUSCAR",
						"pPNSOLICI", "pPTIPOPERSONA", "pPCAGENTE", "pPCMATRIC", "pPCPOSTAL", "pPTDOMICI", "pPTNATRIE",
						"pPCSITUAC", "pP_FILTROPROD", "pPCPOLCIA", "pPCCOMPANI", "pPCACTIVI", "pPCESTSUPL",
						"pPNPOLRELACIONADA", "pPNPOLINI", "pPFILAGE", "pPCSUCURSAL", "pPCADM", "pPCMOTOR", "pPCCHASIS",
						"pPNBASTID", "pPCMODO", "pPNCONTRATO", "pPFEMISIOINI", "pPFEMISIOFIN", "pPFEFEINI", "pPFEFEFIN",
						"pPCUSUARIO", "pPNNUMIDEASE", "pPBUSCARASE" },
				new Object[] { pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP, pPBUSCAR, pPNSOLICI,
						pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCSITUAC, pP_FILTROPROD,
						pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLRELACIONADA, pPNPOLINI, pPFILAGE,
						pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPCMODO, pPNCONTRATO, pPFEMISIOINI,
						pPFEMISIOFIN, pPFEFEINI, pPFEFEFIN, pPCUSUARIO, pPNNUMIDEASE, pPBUSCARASE });
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
		cStmt.setObject(22, pPNPOLRELACIONADA);
		cStmt.setObject(23, pPNPOLINI);
		cStmt.setObject(25, pPFILAGE);
		cStmt.setObject(26, pPCSUCURSAL);
		cStmt.setObject(27, pPCADM);
		cStmt.setObject(28, pPCMOTOR);
		cStmt.setObject(29, pPCCHASIS);
		cStmt.setObject(30, pPNBASTID);
		cStmt.setObject(31, pPCMODO);
		cStmt.setObject(32, pPNCONTRATO);
		cStmt.setObject(33, pPFEMISIOINI);
		cStmt.setObject(34, pPFEMISIOFIN);
		cStmt.setObject(35, pPFEFEINI);
		cStmt.setObject(36, pPFEFEFIN);
		cStmt.setObject(37, pPCUSUARIO);
		cStmt.setObject(38, pPNNUMIDEASE);
		cStmt.setObject(39, pPBUSCARASE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			java.math.BigDecimal pPNPOLRELACIONADA, String pPNPOLINI, java.math.BigDecimal pPFILAGE,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, java.math.BigDecimal pPCMODO, String pPNCONTRATO, java.sql.Date pFEMISIOINI,
			java.sql.Date pFEMISIOFIN, java.sql.Date pFEFEINI, java.sql.Date pFEFEFIN, String pCUSUARIO,
			String pNNUMIDEASE, String pBUSCARASE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP,
				pPBUSCAR, pPNSOLICI, pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCSITUAC,
				pP_FILTROPROD, pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLRELACIONADA, pPNPOLINI, pPFILAGE,
				pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPCMODO, pPNCONTRATO, pFEMISIOINI, pFEMISIOFIN,
				pFEFEINI, pFEFEFIN, pCUSUARIO, pNNUMIDEASE, pBUSCARASE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA

	// bug_27766 sobreescribo el m�todo anterior para utilzarlo en Axisctr019Service
	// --START-PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA(PRAMO, PSPRODUC, PNPOLIZA,
	// PNCERT, PNNUMIDE, PSNIP, PBUSCAR, PNSOLICI, PTIPOPERSONA, PCAGENTE, PCMATRIC,
	// PCPOSTAL, PTDOMICI, PTNATRIE, PCSITUAC, P_FILTROPROD, PCPOLCIA, PCCOMPANI,
	// PCACTIVI, PCESTSUPL, PNPOLINI, PFILAGE, PCSUCURSAL, PCADM, PCMOTOR, PCCHASIS,
	// PNBASTID, pCMODO)

	private HashMap callPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			String pPNPOLINI, java.math.BigDecimal pPFILAGE, java.math.BigDecimal pPCSUCURSAL,
			java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS, String pPNBASTID, BigDecimal pPCMODO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERT", "pPNNUMIDE", "pPSNIP", "pPBUSCAR",
						"pPNSOLICI", "pPTIPOPERSONA", "pPCAGENTE", "pPCMATRIC", "pPCPOSTAL", "pPTDOMICI", "pPTNATRIE",
						"pPCSITUAC", "pP_FILTROPROD", "pPCPOLCIA", "pPCCOMPANI", "pPCACTIVI", "pPCESTSUPL", "pPNPOLINI",
						"pPFILAGE", "pPCSUCURSAL", "pPCADM", "pPCMOTOR", "pPCCHASIS", "pPNBASTID", "pPCMODO" },
				new Object[] { pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP, pPBUSCAR, pPNSOLICI,
						pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCSITUAC, pP_FILTROPROD,
						pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLINI, pPFILAGE, pPCSUCURSAL, pPCADM,
						pPCMOTOR, pPCCHASIS, pPNBASTID, pPCMODO });
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
		cStmt.setObject(24, pPFILAGE);
		cStmt.setObject(25, pPCSUCURSAL);
		cStmt.setObject(26, pPCADM);
		cStmt.setObject(27, pPCMOTOR);
		cStmt.setObject(28, pPCCHASIS);
		cStmt.setObject(29, pPNBASTID);
		cStmt.setObject(30, pPCMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			String pPNPOLINI, java.math.BigDecimal pPFILAGE, java.math.BigDecimal pPCSUCURSAL,
			java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS, String pPNBASTID, BigDecimal pPCMODO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP,
				pPBUSCAR, pPNSOLICI, pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCSITUAC,
				pP_FILTROPROD, pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLINI, pPFILAGE, pPCSUCURSAL, pPCADM,
				pPCMOTOR, pPCCHASIS, pPNBASTID, pPCMODO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA

	// --START-PAC_IAX_PRODUCCION.F_CONTROL_EMISION()

	private HashMap callPAC_IAX_PRODUCCION__F_CONTROL_EMISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CONTROL_EMISION(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CONTROL_EMISION() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CONTROL_EMISION();
	}
	// --END-PAC_IAX_PRODUCCION.F_CONTROL_EMISION
	// --START-PAC_IAX_PRODUCCION.F_EDITARPROPUESTA(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_EDITARPROPUESTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_EDITARPROPUESTA(?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OSSEGURO"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ONMOVIMI"
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
			retVal.put("OSSEGURO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OSSEGURO", null);
		}
		try {
			retVal.put("ONMOVIMI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("ONMOVIMI", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_EDITARPROPUESTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_EDITARPROPUESTA(pPSSEGURO);
	}
	// --END-PAC_IAX_PRODUCCION.F_EDITARPROPUESTA

	// --START-PAC_IAX_PRODUCCION.F_EDITARPROPUESTARETENIDA(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_EDITARPROPUESTARETENIDA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_EDITARPROPUESTARETENIDA(?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OSSEGURO"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ONMOVIMI"
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
			retVal.put("OSSEGURO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OSSEGURO", null);
		}
		try {
			retVal.put("ONMOVIMI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("ONMOVIMI", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_EDITARPROPUESTARETENIDA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_EDITARPROPUESTARETENIDA(pPSSEGURO);
	}
	// --START-PAC_IAX_PRODUCCION.F_ELIMINAASEGURADO(SPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINAASEGURADO(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINAASEGURADO(?,?)}";
		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINAASEGURADO(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINAASEGURADO(pSPERSON);
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINAASEGURADO
	// --START-PAC_IAX_PRODUCCION.F_ELIMINACLAUSULAESP(CIDENTITY)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINACLAUSULAESP(java.math.BigDecimal pCIDENTITY) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINACLAUSULAESP(?,?)}";
		logCall(callQuery, new String[] { "pCIDENTITY" }, new Object[] { pCIDENTITY });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCIDENTITY);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINACLAUSULAESP(java.math.BigDecimal pCIDENTITY) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINACLAUSULAESP(pCIDENTITY);
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINACLAUSULAESP
	// --START-PAC_IAX_PRODUCCION.F_ELIMINARIESGO(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINARIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINARIESGO(?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINARIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINARIESGO(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINARIESGO
	// --START-PAC_IAX_PRODUCCION.F_ELIMINATOMADOR(SPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINATOMADOR(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINATOMADOR(?,?)}";
		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINATOMADOR(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINATOMADOR(pSPERSON);
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINATOMADOR

	// --START-PAC_IAX_PRODUCCION.F_EMITIR()

	private HashMap callPAC_IAX_PRODUCCION__F_EMITIR() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_EMITIR(?,?,?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "ONPOLIZA"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "OSSEGURO"
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
		try {
			retVal.put("ONPOLIZA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("ONPOLIZA", null);
		}
		try {
			retVal.put("OSSEGURO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("OSSEGURO", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_EMITIR() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_EMITIR();
	}
	// --END-PAC_IAX_PRODUCCION.F_EMITIR
	// --START-PAC_IAX_PRODUCCION.F_EMITIRPROPUESTA(PSSEGURO, PNMOVIMI)

	private HashMap callPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_EMITIRPROPUESTA(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ONPOLIZA"
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
			retVal.put("ONPOLIZA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("ONPOLIZA", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(pPSSEGURO, pPNMOVIMI);
	}
	// --END-PAC_IAX_PRODUCCION.F_EMITIRPROPUESTA

	// --START-PAC_IAX_PRODUCCION.F_GET_FINIEFE()
	private HashMap callPAC_IAX_PRODUCCION__F_GET_FINIEFE() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_FINIEFE(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_FINIEFE() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_FINIEFE();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_FINIEFE

	// --START-PAC_IAX_PRODUCCION.F_GET_ACTIVIDAD()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_ACTIVIDAD() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_ACTIVIDAD(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_ACTIVIDAD() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_ACTIVIDAD();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_ACTIVIDAD
	// --START-PAC_IAX_PRODUCCION.F_GET_ASEGURADO(SPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_ASEGURADO(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_ASEGURADO(?,?)}";
		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_ASEGURADO(pSPERSON);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_ASEGURADO
	// --START-PAC_IAX_PRODUCCION.F_GET_CAPTITALGARANTIA(NRIESGO, CGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CAPTITALGARANTIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CAPTITALGARANTIA(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT" }, new Object[] { pNRIESGO, pCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CAPTITALGARANTIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CAPTITALGARANTIA(pNRIESGO, pCGARANT);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CAPTITALGARANTIA
	// --START-PAC_IAX_PRODUCCION.F_GET_CLAUBENEFICIARIO(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CLAUBENEFICIARIO(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CLAUBENEFICIARIO(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BENEFICIARIOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CLAUBENEFICIARIO(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CLAUBENEFICIARIO(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CLAUBENEFICIARIO
	// --START-PAC_IAX_PRODUCCION.F_GET_CLAUSULASPRODCONSULTA()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CLAUSULASPRODCONSULTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CLAUSULASPRODCONSULTA(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CLAUSULASPRODCONSULTA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CLAUSULASPRODCONSULTA();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CLAUSULASPRODCONSULTA
	// --START-PAC_IAX_PRODUCCION.F_GET_DATPOLIZA(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DATPOLIZA(?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GENPOLIZA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(pPSSEGURO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DATPOLIZA
	// --START-PAC_IAX_PRODUCCION.F_GET_DESCRIESGO(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DESCRIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DESCRIESGO(?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DESCRIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DESCRIESGO(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DESCRIESGO
	// --START-PAC_IAX_PRODUCCION.F_GET_DETAILPRIMASGARANT(NRIESGO, CGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DETAILPRIMASGARANT(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DETAILPRIMASGARANT(?,?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT" }, new Object[] { pNRIESGO, pCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRIMAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DETAILPRIMASGARANT(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DETAILPRIMASGARANT(pNRIESGO, pCGARANT);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DETAILPRIMASGARANT

	// --START-PAC_IAX_PRODUCCION.F_GET_CERTDIAN(NRECIBO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CERTDIAN(java.math.BigDecimal pSSEGURO, java.math.BigDecimal pNRECIBO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CERTDIAN(?,?,?)}";
		// logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRECIBO});
		logCall(callQuery, new String[] { "pSSEGURO", "pNRECIBO" }, new Object[] { pSSEGURO, pNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSSEGURO);
		cStmt.setObject(3, pNRECIBO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CERTDIAN(java.math.BigDecimal pSSEGURO,
			java.math.BigDecimal pNRECIBO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CERTDIAN(pSSEGURO, pNRECIBO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DATPOLIZA
	// --START-PAC_IAX_PRODUCCION.F_GET_DETALLEGARANTIA(PNRIESGO, PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DETALLEGARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNDETGAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DETALLEGARANTIA(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO", "pPCGARANT", "pPNDETGAR" },
				new Object[] { pPNRIESGO, pPCGARANT, pPNDETGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPNDETGAR);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLEGARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNDETGAR) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DETALLEGARANTIA(pPNRIESGO, pPCGARANT, pPNDETGAR);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DETALLEGARANTIA
	// --START-PAC_IAX_PRODUCCION.F_GET_DETALLERIESGOASEG(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DETALLERIESGOASEG(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DETALLERIESGOASEG(?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLERIESGOASEG(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DETALLERIESGOASEG(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DETALLERIESGOASEG
	// --START-PAC_IAX_PRODUCCION.F_GET_DOCUMENTACION()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DOCUMENTACION() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DOCUMENTACION(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DOCUMENTACION() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DOCUMENTACION();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DOCUMENTACION
	// --START-PAC_IAX_PRODUCCION.F_GET_ESSUPLEMENTO()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_ESSUPLEMENTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_ESSUPLEMENTO()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_ESSUPLEMENTO() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_ESSUPLEMENTO();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_ESSUPLEMENTO
	// --START-PAC_IAX_PRODUCCION.F_GET_FECHACEPTAR()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_FECHACEPTAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_FECHACEPTAR()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_FECHACEPTAR() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_FECHACEPTAR();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_FECHACEPTAR
	// --START-PAC_IAX_PRODUCCION.F_GET_GARFORPAG()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_GARFORPAG() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_GARFORPAG(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_GARFORPAG();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_GARFORPAG
	// --START-PAC_IAX_PRODUCCION.F_GET_GESTRIESGO(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_GESTRIESGO(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_GESTRIESGO(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGO(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_GESTRIESGO(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_GESTRIESGO

	// --START-PAC_IAX_PRODUCCION.F_GET_GESTRIESGOS()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_GESTRIESGOS(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GESTRIESGOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_GESTRIESGOS
	// --START-PAC_IAX_PRODUCCION.F_GET_IDIOMADEF()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_IDIOMADEF() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_IDIOMADEF(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_IDIOMADEF() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_IDIOMADEF();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_IDIOMADEF
	// --START-PAC_IAX_PRODUCCION.F_GET_MOTRETENMOV(PSSEGURO, PNMOVIMI)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_MOTRETENMOV(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLMVTRETEN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(pPSSEGURO, pPNMOVIMI);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_MOTRETENMOV
	// --START-PAC_IAX_PRODUCCION.F_GET_MVTPOLIZA()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_MVTPOLIZA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_MVTPOLIZA(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_MVTPOLIZA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_MVTPOLIZA();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_MVTPOLIZA
	// --START-PAC_IAX_PRODUCCION.F_GET_MVTRETENCION()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_MVTRETENCION() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_MVTRETENCION(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLMVTRETEN".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_MVTRETENCION() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_MVTRETENCION();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_MVTRETENCION
	// --START-PAC_IAX_PRODUCCION.F_GET_POLIZASRETEN(PCAGENTE, PCRAMO, PSPRODUC,
	// PNPOLIZA, PNSOLICI, PNCERTIF, PNNUMIDE, PSNIP, PNOMBRE, PCSITUAC, PCMATRIC,
	// PCPOSTAL, PTDOMICI, PTNATRIE, P_FILTROPROD, PCSUCURSAL, PCADM, PCMOTOR,
	// PCCHASIS, PNBASTID)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNSOLICI, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPSNIP,
			String pPNOMBRE, java.math.BigDecimal pPCSITUAC, String pPCMATRIC, String pPCPOSTAL, String pPTDOMICI,
			String pPTNATRIE, String pP_FILTROPROD, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM,
			String pPCMOTOR, String pPCCHASIS, String pPNBASTID) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_POLIZASRETEN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNSOLICI", "pPNCERTIF", "pPNNUMIDE",
						"pPSNIP", "pPNOMBRE", "pPCSITUAC", "pPCMATRIC", "pPCPOSTAL", "pPTDOMICI", "pPTNATRIE",
						"pP_FILTROPROD", "pPCSUCURSAL", "pPCADM", "pPCMOTOR", "pPCCHASIS", "pPNBASTID" },
				new Object[] { pPCAGENTE, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNSOLICI, pPNCERTIF, pPNNUMIDE, pPSNIP,
						pPNOMBRE, pPCSITUAC, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pP_FILTROPROD, pPCSUCURSAL,
						pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNSOLICI);
		cStmt.setObject(7, pPNCERTIF);
		cStmt.setObject(8, pPNNUMIDE);
		cStmt.setObject(9, pPSNIP);
		cStmt.setObject(10, pPNOMBRE);
		cStmt.setObject(11, pPCSITUAC);
		cStmt.setObject(12, pPCMATRIC);
		cStmt.setObject(13, pPCPOSTAL);
		cStmt.setObject(14, pPTDOMICI);
		cStmt.setObject(15, pPTNATRIE);
		cStmt.setObject(16, pP_FILTROPROD);
		cStmt.setObject(18, pPCSUCURSAL);
		cStmt.setObject(19, pPCADM);
		cStmt.setObject(20, pPCMOTOR);
		cStmt.setObject(21, pPCCHASIS);
		cStmt.setObject(22, pPNBASTID);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLIZASRETEN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNSOLICI, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPSNIP,
			String pPNOMBRE, java.math.BigDecimal pPCSITUAC, String pPCMATRIC, String pPCPOSTAL, String pPTDOMICI,
			String pPTNATRIE, String pP_FILTROPROD, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM,
			String pPCMOTOR, String pPCCHASIS, String pPNBASTID) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(pPCAGENTE, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNSOLICI,
				pPNCERTIF, pPNNUMIDE, pPSNIP, pPNOMBRE, pPCSITUAC, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE,
				pP_FILTROPROD, pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_POLIZASRETEN

	private HashMap callPAC_IAX_PRODUCCION__F_GET_POLMVTRETEN(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_POLMVTRETEN(?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLMVTRETEN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_POLMVTRETEN(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_POLMVTRETEN(pPSSEGURO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_POLMVTRETEN
	// --START-PAC_IAX_PRODUCCION.F_GET_PREGGARANT(NRIESGO, CGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_PREGGARANT(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PREGGARANT(?,?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT" }, new Object[] { pNRIESGO, pCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PREGGARANT(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PREGGARANT(pNRIESGO, pCGARANT);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_PREGGARANT
	// --START-PAC_IAX_PRODUCCION.F_GET_PREGUNPOLIZACONSULTA()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_PREGUNPOLIZACONSULTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PREGUNPOLIZACONSULTA(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTAS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNPOLIZACONSULTA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PREGUNPOLIZACONSULTA();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_PREGUNPOLIZACONSULTA
	// --START-PAC_IAX_PRODUCCION.F_GET_PRIMASGARANTTOT(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PRIMASGARANTTOT(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRIMAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_PRIMASGARANTTOT
	// --START-PAC_IAX_PRODUCCION.F_GET_PRIMASPOLIZA()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PRIMASPOLIZA(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRIMAS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_PRIMASPOLIZA
	// --START-PAC_IAX_PRODUCCION.F_GET_PRODUCTO()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_PRODUCTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PRODUCTO(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PRODUCTO() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PRODUCTO();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_PRODUCTO
	// --START-PAC_IAX_PRODUCCION.F_GET_RECIBOS()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_RECIBOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_RECIBOS(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETRECIBO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_RECIBOS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_RECIBOS();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_RECIBOS
	// --START-PAC_IAX_PRODUCCION.F_GET_REVALVALOR(NRIESGO, CGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_REVALVALOR(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_REVALVALOR(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT" }, new Object[] { pNRIESGO, pCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "CREVALI"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PREVALI"
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
			retVal.put("CREVALI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("CREVALI", null);
		}
		try {
			retVal.put("PREVALI", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PREVALI", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_REVALVALOR(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_REVALVALOR(pNRIESGO, pCGARANT);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_REVALVALOR
	// --START-PAC_IAX_PRODUCCION.F_GET_RIESGO(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_RIESGO(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_RIESGO(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_RIESGOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_RIESGO(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_RIESGO
	// --START-PAC_IAX_PRODUCCION.F_GET_RIESGOCONSULTA(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_RIESGOCONSULTA(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_RIESGOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_RIESGOCONSULTA
	// --START-PAC_IAX_PRODUCCION.F_GET_TOMADOR(SPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_TOMADOR(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_TOMADOR(?,?)}";
		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_TOMADORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADOR(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_TOMADOR(pSPERSON);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_TOMADOR

	// --START-PAC_IAX_PRODUCCION.F_GET_TOMADORCCC()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_TOMADORCCC() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_TOMADORCCC(?,?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PSPERSON"
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
			retVal.put("PSPERSON", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PSPERSON", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_TOMADORCCC

	// --START-PAC_IAX_PRODUCCION.F_GET_TOMADORCCC()

	private HashMap callPAC_IAX_PRODUCCION__TRASPASO_CCC(java.math.BigDecimal pSSEGURO, java.math.BigDecimal pSPERSON,
			java.math.BigDecimal pSPERSON_fic) throws Exception {
		String callQuery = "{?=call PAC_IAX_PERSONA.TRASPASO_CCC(?,?,?,?)}";
		logCall(callQuery, new String[] { "pSSEGURO", "pSPERSON", "pSPERSON_fic" },
				new Object[] { pSSEGURO, pSPERSON, pSPERSON_fic });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		// cStmt.registerOutParameter(1,
		// oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.setObject(2, pSSEGURO);
		cStmt.setObject(3, pSPERSON);
		cStmt.setObject(4, pSPERSON_fic);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__TRASPASO_CCC(java.math.BigDecimal pSSEGURO, java.math.BigDecimal pSPERSON,
			java.math.BigDecimal pSPERSON_fic) throws Exception {
		return this.callPAC_IAX_PRODUCCION__TRASPASO_CCC(pSSEGURO, pSPERSON, pSPERSON_fic);
	}
	// --END-PAC_IAX_PRODUCCION.TRASPASOCCC

	// --START-PAC_IAX_PRODUCCION.F_GET_TOMADORCCC()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CCC_HOST(java.math.BigDecimal pSPERSON, String pSNIP, String SEG)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PERSONA.F_Get_CCC_HOST(?,?,?,?)}";
		logCall(callQuery, new String[] { "pSPERSON", "pSNIP" }, new Object[] { pSPERSON, pSNIP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.setObject(2, pSPERSON);
		cStmt.setObject(3, pSNIP);
		cStmt.setObject(4, SEG);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(java.math.BigDecimal pSPERSON, String pSNIP, String SEG)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CCC_HOST(pSPERSON, pSNIP, SEG);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_TOMADORCCC

	// --START-PAC_IAX_PRODUCCION.F_GRABAASEGURADOS(SPERSON, CVINCLE, PFECRETROACT,
	// PCDOMICI, PCPAREN)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABAASEGURADOS(java.math.BigDecimal pSPERSON,
			java.math.BigDecimal pCVINCLE, java.sql.Date pPFECRETROACT, java.math.BigDecimal pPCDOMICI,
			java.math.BigDecimal pPCPAREN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABAASEGURADOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON", "pCVINCLE", "pPFECRETROACT", "pPCDOMICI", "pPCPAREN" },
				new Object[] { pSPERSON, pCVINCLE, pPFECRETROACT, pPCDOMICI, pPCPAREN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.setObject(3, pCVINCLE);
		cStmt.setObject(4, pPFECRETROACT);
		cStmt.setObject(5, pPCDOMICI);
		cStmt.setObject(6, pPCPAREN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABAASEGURADOS(java.math.BigDecimal pSPERSON,
			java.math.BigDecimal pCVINCLE, java.sql.Date pPFECRETROACT, java.math.BigDecimal pPCDOMICI,
			java.math.BigDecimal pPCPAREN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABAASEGURADOS(pSPERSON, pCVINCLE, pPFECRETROACT, pPCDOMICI, pPCPAREN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABAASEGURADOS

	// --START-PAC_IAX_PRODUCCION.F_GRABABENEFICIARIOS(NRIESGO, TIPO, SCLABEN,
	// TCLAESP)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABABENEFICIARIOS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pTIPO, java.math.BigDecimal pSCLABEN, String pTCLAESP) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABABENEFICIARIOS(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pTIPO", "pSCLABEN", "pTCLAESP" },
				new Object[] { pNRIESGO, pTIPO, pSCLABEN, pTCLAESP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pTIPO);
		cStmt.setObject(4, pSCLABEN);
		cStmt.setObject(5, pTCLAESP);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABABENEFICIARIOS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pTIPO, java.math.BigDecimal pSCLABEN, String pTCLAESP) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABABENEFICIARIOS(pNRIESGO, pTIPO, pSCLABEN, pTCLAESP);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABABENEFICIARIOS
	// --START-PAC_IAX_PRODUCCION.F_GRABACLAUSULAS(SCLAGEN, SELCLAU)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABACLAUSULAS(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pSELCLAU) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABACLAUSULAS(?,?,?)}";
		logCall(callQuery, new String[] { "pSCLAGEN", "pSELCLAU" }, new Object[] { pSCLAGEN, pSELCLAU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLAGEN);
		cStmt.setObject(3, pSELCLAU);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULAS(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pSELCLAU) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABACLAUSULAS(pSCLAGEN, pSELCLAU);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABACLAUSULAS
	// --START-PAC_IAX_PRODUCCION.F_GRABACLAUSULASESP(PCIDENTITY, TCLAUESP)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABACLAUSULASESP(java.math.BigDecimal pPCIDENTITY, String pTCLAUESP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABACLAUSULASESP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCIDENTITY", "pTCLAUESP" }, new Object[] { pPCIDENTITY, pTCLAUESP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCIDENTITY);
		cStmt.setObject(3, pTCLAUESP);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULASESP(java.math.BigDecimal pPCIDENTITY, String pTCLAUESP)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABACLAUSULASESP(pPCIDENTITY, pTCLAUESP); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABACLAUSULASESP

	// --START-PAC_IAX_PRODUCCION.F_GRABADOCUMMOV(PCDOCUMENT, PNVERSION, PCMOTMOV,
	// PCSELEC)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABADOCUMMOV(java.math.BigDecimal pPCDOCUMENT,
			java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPCSELEC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABADOCUMMOV(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCDOCUMENT", "pPNVERSION", "pPCMOTMOV", "pPCSELEC" },
				new Object[] { pPCDOCUMENT, pPNVERSION, pPCMOTMOV, pPCSELEC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDOCUMENT);
		cStmt.setObject(3, pPNVERSION);
		cStmt.setObject(4, pPCMOTMOV);
		cStmt.setObject(5, pPCSELEC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABADOCUMMOV(java.math.BigDecimal pPCDOCUMENT,
			java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPCSELEC)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABADOCUMMOV(pPCDOCUMENT, pPNVERSION, pPCMOTMOV, pPCSELEC);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABADOCUMMOV

	// --START-PAC_IAX_PRODUCCION.F_GRABAPREGUNTASGARANTIA(NRIESGO, CGARANT,
	// CPREGUN, CRESPUE, TRESPUE)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABAPREGUNTASGARANTIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCPREGUN, java.math.BigDecimal pCRESPUE,
			String pTRESPUE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABAPREGUNTASGARANTIA(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT", "pCPREGUN", "pCRESPUE", "pTRESPUE" },
				new Object[] { pNRIESGO, pCGARANT, pCPREGUN, pCRESPUE, pTRESPUE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pCPREGUN);
		cStmt.setObject(5, pCRESPUE);
		cStmt.setObject(6, pTRESPUE);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABAPREGUNTASGARANTIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCPREGUN, java.math.BigDecimal pCRESPUE,
			String pTRESPUE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABAPREGUNTASGARANTIA(pNRIESGO, pCGARANT, pCPREGUN, pCRESPUE, pTRESPUE);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABAPREGUNTASGARANTIA
	// --START-PAC_IAX_PRODUCCION.F_GRABAPREGUNTASPOLIZA(CPREGUN, CRESPUE, TRESPUE)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA(java.math.BigDecimal pCPREGUN,
			java.math.BigDecimal pCRESPUE, String pTRESPUE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABAPREGUNTASPOLIZA(?,?,?,?)}";
		logCall(callQuery, new String[] { "pCPREGUN", "pCRESPUE", "pTRESPUE" },
				new Object[] { pCPREGUN, pCRESPUE, pTRESPUE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCPREGUN);
		cStmt.setObject(3, pCRESPUE);
		cStmt.setObject(4, pTRESPUE);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA(java.math.BigDecimal pCPREGUN,
			java.math.BigDecimal pCRESPUE, String pTRESPUE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA(pCPREGUN, pCRESPUE, pTRESPUE);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABAPREGUNTASPOLIZA

	// BUG 41143/229973 - 17/03/2016 - JAEG - (FEFEPLAZO - FVENCPLAZO)
	// --START-PAC_IAX_PRODUCCION.F_GRABARDATOSGESTION(PFEFECTO, PCDURACI, PNDURACI,
	// PFVENCIM, PCFORPAG, PCTIPCOB, PPOLISSA_INI, PCTIPCOM, PDTOCOM, PCIDIOMA,
	// PCPOLCIA, PCBANCAR, PNCUOTAR, PCSUBAGE, PNDURPER, PPCAPFALL, PPDOSCAB,
	// PCFORPAGREN, PNDURCOB, PCRECFRA, PCAGENTE, PINTTEC, PFPPREN, PCFPREST,
	// PNRENOVA, PCCOBBAN, PCCOMPANI, PCPROMOTOR, PCTIPREA, PCREAFAC, PCREATIP,
	// PCMONEDA, PCTIPRETR, PCINDREVFRAN, PPRECARG, PPDTOTEC, PPRECCOM, PCDOMPER,
	// PFRENOVA, PCTIPASIGNUM, PNPOLIZAMANUAL, PNPREIMPRESO, PNEDAMAR, PNUMFOLIO,
	// PFMANDATO, PSUCURSAL, PHAYMANDATPREV, PFFINVIG)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(java.sql.Date pPFEFECTO,
			java.math.BigDecimal pPCDURACI, java.math.BigDecimal pPNDURACI, java.sql.Date pPFVENCIM,
			java.math.BigDecimal pPCFORPAG, java.math.BigDecimal pPCTIPCOB, String pPPOLISSA_INI,
			java.math.BigDecimal pPCTIPCOM, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPCIDIOMA,
			String pPCPOLCIA, String pPCBANCAR, java.math.BigDecimal pPNCUOTAR, java.math.BigDecimal pPCSUBAGE,
			java.math.BigDecimal pPNDURPER, java.math.BigDecimal pPPCAPFALL, java.math.BigDecimal pPPDOSCAB,
			java.math.BigDecimal pPCFORPAGREN, java.math.BigDecimal pPNDURCOB, java.math.BigDecimal pPCRECFRA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPINTTEC, java.sql.Date pPFPPREN,
			java.math.BigDecimal pPCFPREST, java.math.BigDecimal pPNRENOVA, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCPROMOTOR, java.math.BigDecimal pPCTIPREA,
			java.math.BigDecimal pPCREAFAC, java.math.BigDecimal pPCREATIP, java.math.BigDecimal pPCMONEDA,
			java.math.BigDecimal pPCTIPRETR, java.math.BigDecimal pPCINDREVFRAN, java.math.BigDecimal pPPRECARG,
			java.math.BigDecimal pPPDTOTEC, java.math.BigDecimal pPPRECCOM, java.math.BigDecimal pPCDOMPER,
			java.sql.Date pPFRENOVA, java.math.BigDecimal pPCTIPASIGNUM, java.math.BigDecimal pPNPOLIZAMANUAL,
			java.math.BigDecimal pPNPREIMPRESO, java.math.BigDecimal pPNEDAMAR, java.math.BigDecimal pPNUMFOLIO,
			java.sql.Date pPFMANDATO, String pPSUCURSAL, java.math.BigDecimal pPHAYMANDATPREV, java.sql.Date pPFFINVIG,
			java.sql.Date PFEFEPLAZO, java.sql.Date PFVENCPLAZO, java.math.BigDecimal pFACULT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARDATOSGESTION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFEFECTO", "pPCDURACI", "pPNDURACI", "pPFVENCIM", "pPCFORPAG", "pPCTIPCOB",
				"pPPOLISSA_INI", "pPCTIPCOM", "pPDTOCOM", "pPCIDIOMA", "pPCPOLCIA", "pPCBANCAR", "pPNCUOTAR",
				"pPCSUBAGE", "pPNDURPER", "pPPCAPFALL", "pPPDOSCAB", "pPCFORPAGREN", "pPNDURCOB", "pPCRECFRA",
				"pPCAGENTE", "pPINTTEC", "pPFPPREN", "pPCFPREST", "pPNRENOVA", "pPCCOBBAN", "pPCCOMPANI", "pPCPROMOTOR",
				"pPCTIPREA", "pPCREAFAC", "pPCREATIP", "pPCMONEDA", "pPCTIPRETR", "pPCINDREVFRAN", "pPPRECARG",
				"pPPDTOTEC", "pPPRECCOM", "pPCDOMPER", "pPFRENOVA", "pPCTIPASIGNUM", "pPNPOLIZAMANUAL", "pPNPREIMPRESO",
				"pPNEDAMAR", "pPNUMFOLIO", "pPFMANDATO", "pPSUCURSAL", "pPHAYMANDATPREV", "pPFFINVIG", "pFACULT" },
				new Object[] { pPFEFECTO, pPCDURACI, pPNDURACI, pPFVENCIM, pPCFORPAG, pPCTIPCOB, pPPOLISSA_INI,
						pPCTIPCOM, pPDTOCOM, pPCIDIOMA, pPCPOLCIA, pPCBANCAR, pPNCUOTAR, pPCSUBAGE, pPNDURPER,
						pPPCAPFALL, pPPDOSCAB, pPCFORPAGREN, pPNDURCOB, pPCRECFRA, pPCAGENTE, pPINTTEC, pPFPPREN,
						pPCFPREST, pPNRENOVA, pPCCOBBAN, pPCCOMPANI, pPCPROMOTOR, pPCTIPREA, pPCREAFAC, pPCREATIP,
						pPCMONEDA, pPCTIPRETR, pPCINDREVFRAN, pPPRECARG, pPPDTOTEC, pPPRECCOM, pPCDOMPER, pPFRENOVA,
						pPCTIPASIGNUM, pPNPOLIZAMANUAL, pPNPREIMPRESO, pPNEDAMAR, pPNUMFOLIO, pPFMANDATO, pPSUCURSAL,
						pPHAYMANDATPREV, pPFFINVIG, pFACULT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFEFECTO);
		cStmt.setObject(3, pPCDURACI);
		cStmt.setObject(4, pPNDURACI);
		cStmt.setObject(5, pPFVENCIM);
		cStmt.setObject(6, pPCFORPAG);
		cStmt.setObject(7, pPCTIPCOB);
		cStmt.setObject(8, pPPOLISSA_INI);
		cStmt.setObject(9, pPCTIPCOM);
		cStmt.setObject(10, pPDTOCOM);
		cStmt.setObject(11, pPCIDIOMA);
		cStmt.setObject(12, pPCPOLCIA);
		cStmt.setObject(14, pPCBANCAR);
		cStmt.setObject(15, pPNCUOTAR);
		cStmt.setObject(16, pPCSUBAGE);
		cStmt.setObject(17, pPNDURPER);
		cStmt.setObject(18, pPPCAPFALL);
		cStmt.setObject(19, pPPDOSCAB);
		cStmt.setObject(20, pPCFORPAGREN);
		cStmt.setObject(21, pPNDURCOB);
		cStmt.setObject(22, pPCRECFRA);
		cStmt.setObject(23, pPCAGENTE);
		cStmt.setObject(24, pPINTTEC);
		cStmt.setObject(25, pPFPPREN);
		cStmt.setObject(26, pPCFPREST);
		cStmt.setObject(27, pPNRENOVA);
		cStmt.setObject(28, pPCCOBBAN);
		cStmt.setObject(29, pPCCOMPANI);
		cStmt.setObject(30, pPCPROMOTOR);
		cStmt.setObject(31, pPCTIPREA);
		cStmt.setObject(32, pPCREAFAC);
		cStmt.setObject(33, pPCREATIP);
		cStmt.setObject(34, pPCMONEDA);
		cStmt.setObject(35, pPCTIPRETR);
		cStmt.setObject(36, pPCINDREVFRAN);
		cStmt.setObject(37, pPPRECARG);
		cStmt.setObject(38, pPPDTOTEC);
		cStmt.setObject(39, pPPRECCOM);
		cStmt.setObject(40, pPCDOMPER);
		cStmt.setObject(41, pPFRENOVA);
		cStmt.setObject(42, pPCTIPASIGNUM);
		cStmt.setObject(43, pPNPOLIZAMANUAL);
		cStmt.setObject(44, pPNPREIMPRESO);
		cStmt.setObject(45, pPNEDAMAR);
		cStmt.setObject(46, pPNUMFOLIO);
		cStmt.setObject(47, pPFMANDATO);
		cStmt.setObject(48, pPSUCURSAL);
		cStmt.setObject(49, pPHAYMANDATPREV);
		cStmt.setObject(50, pPFFINVIG);
		cStmt.setObject(51, PFEFEPLAZO); // BUG 41143/229973 - 17/03/2016 - JAEG
		cStmt.setObject(52, PFVENCPLAZO); // BUG 41143/229973 - 17/03/2016 - JAEG
		cStmt.setObject(53, pFACULT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	// BUG 41143/229973 - 17/03/2016 - JAEG - (FEFEPLAZO - FVENCPLAZO)
	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(java.sql.Date pPFEFECTO,
			java.math.BigDecimal pPCDURACI, java.math.BigDecimal pPNDURACI, java.sql.Date pPFVENCIM,
			java.math.BigDecimal pPCFORPAG, java.math.BigDecimal pPCTIPCOB, String pPPOLISSA_INI,
			java.math.BigDecimal pPCTIPCOM, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPCIDIOMA,
			String pPCPOLCIA, String pPCBANCAR, java.math.BigDecimal pPNCUOTAR, java.math.BigDecimal pPCSUBAGE,
			java.math.BigDecimal pPNDURPER, java.math.BigDecimal pPPCAPFALL, java.math.BigDecimal pPPDOSCAB,
			java.math.BigDecimal pPCFORPAGREN, java.math.BigDecimal pPNDURCOB, java.math.BigDecimal pPCRECFRA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPINTTEC, java.sql.Date pPFPPREN,
			java.math.BigDecimal pPCFPREST, java.math.BigDecimal pPNRENOVA, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCPROMOTOR, java.math.BigDecimal pPCTIPREA,
			java.math.BigDecimal pPCREAFAC, java.math.BigDecimal pPCREATIP, java.math.BigDecimal pPCMONEDA,
			java.math.BigDecimal pPCTIPRETR, java.math.BigDecimal pPCINDREVFRAN, java.math.BigDecimal pPPRECARG,
			java.math.BigDecimal pPPDTOTEC, java.math.BigDecimal pPPRECCOM, java.math.BigDecimal pPCDOMPER,
			java.sql.Date pPFRENOVA, java.math.BigDecimal pPCTIPASIGNUM, java.math.BigDecimal pPNPOLIZAMANUAL,
			java.math.BigDecimal pPNPREIMPRESO, java.math.BigDecimal pPNEDAMAR, java.math.BigDecimal pPNUMFOLIO,
			java.sql.Date pPFMANDATO, String pPSUCURSAL, java.math.BigDecimal pPHAYMANDATPREV, java.sql.Date pPFFINVIG,
			java.sql.Date PFEFEPLAZO, java.sql.Date PFVENCPLAZO, java.math.BigDecimal PFACULT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(pPFEFECTO, pPCDURACI, pPNDURACI, pPFVENCIM, pPCFORPAG,
				pPCTIPCOB, pPPOLISSA_INI, pPCTIPCOM, pPDTOCOM, pPCIDIOMA, pPCPOLCIA, pPCBANCAR, pPNCUOTAR, pPCSUBAGE,
				pPNDURPER, pPPCAPFALL, pPPDOSCAB, pPCFORPAGREN, pPNDURCOB, pPCRECFRA, pPCAGENTE, pPINTTEC, pPFPPREN,
				pPCFPREST, pPNRENOVA, pPCCOBBAN, pPCCOMPANI, pPCPROMOTOR, pPCTIPREA, pPCREAFAC, pPCREATIP, pPCMONEDA,
				pPCTIPRETR, pPCINDREVFRAN, pPPRECARG, pPPDTOTEC, pPPRECCOM, pPCDOMPER, pPFRENOVA, pPCTIPASIGNUM,
				pPNPOLIZAMANUAL, pPNPREIMPRESO, pPNEDAMAR, pPNUMFOLIO, pPFMANDATO, pPSUCURSAL, pPHAYMANDATPREV,
				pPFFINVIG, PFEFEPLAZO, PFVENCPLAZO, PFACULT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARDATOSGESTION

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pSELGAR, java.math.BigDecimal pICAPITAL,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARGARANTIAS(?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pNRIESGO", "pCGARANT", "pSELGAR", "pICAPITAL", "pCREVALI", "pPREVALI", "pIREVALI" },
				new Object[] { pNRIESGO, pCGARANT, pSELGAR, pICAPITAL, pCREVALI, pPREVALI, pIREVALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pSELGAR);
		cStmt.setObject(5, pICAPITAL);
		cStmt.setObject(6, pCREVALI);
		cStmt.setObject(7, pPREVALI);
		cStmt.setObject(8, pIREVALI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pSELGAR, java.math.BigDecimal pICAPITAL,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(pNRIESGO, pCGARANT, pSELGAR, pICAPITAL, pCREVALI,
				pPREVALI, pIREVALI);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARGARANTIAS
	// --START-PAC_IAX_PRODUCCION.F_GRABAROBJETODB()

	private HashMap callPAC_IAX_PRODUCCION__F_GRABAROBJETODB() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABAROBJETODB(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABAROBJETODB
	// --START-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASRIESGO(NRIESGO, CPREGUN, CRESPUE,
	// TRESPUE)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCPREGUN, java.math.BigDecimal pCRESPUE, String pTRESPUE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARPREGUNTASRIESGO(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pCPREGUN", "pCRESPUE", "pTRESPUE" },
				new Object[] { pNRIESGO, pCPREGUN, pCRESPUE, pTRESPUE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCPREGUN);
		cStmt.setObject(4, pCRESPUE);
		cStmt.setObject(5, pTRESPUE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCPREGUN, java.math.BigDecimal pCRESPUE, String pTRESPUE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO(pNRIESGO, pCPREGUN, pCRESPUE, pTRESPUE);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASRIESGO
	// --START-PAC_IAX_PRODUCCION.F_GRABARPROPUESTA()

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARPROPUESTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARPROPUESTA(?,?,?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "ONPOLIZA"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OSSEGURO"
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
			retVal.put("ONPOLIZA", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("ONPOLIZA", null);
		}
		try {
			retVal.put("OSSEGURO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OSSEGURO", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARPROPUESTA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARPROPUESTA();
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARPROPUESTA
	// --START-PAC_IAX_PRODUCCION.F_GRABARRENTAIRREGULAR(NRIESGO, ANYO, PMES1,
	// PMES2, PMES3, PMES4, PMES5, PMES6, PMES7, PMES8, PMES9, PMES10, PMES11,
	// PMES12)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARRENTAIRREGULAR(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pANYO, java.math.BigDecimal pPMES1, java.math.BigDecimal pPMES2,
			java.math.BigDecimal pPMES3, java.math.BigDecimal pPMES4, java.math.BigDecimal pPMES5,
			java.math.BigDecimal pPMES6, java.math.BigDecimal pPMES7, java.math.BigDecimal pPMES8,
			java.math.BigDecimal pPMES9, java.math.BigDecimal pPMES10, java.math.BigDecimal pPMES11,
			java.math.BigDecimal pPMES12) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARRENTAIRREGULAR(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pNRIESGO", "pANYO", "pPMES1", "pPMES2", "pPMES3", "pPMES4", "pPMES5", "pPMES6",
						"pPMES7", "pPMES8", "pPMES9", "pPMES10", "pPMES11", "pPMES12" },
				new Object[] { pNRIESGO, pANYO, pPMES1, pPMES2, pPMES3, pPMES4, pPMES5, pPMES6, pPMES7, pPMES8, pPMES9,
						pPMES10, pPMES11, pPMES12 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pANYO);
		cStmt.setObject(4, pPMES1);
		cStmt.setObject(5, pPMES2);
		cStmt.setObject(6, pPMES3);
		cStmt.setObject(7, pPMES4);
		cStmt.setObject(8, pPMES5);
		cStmt.setObject(9, pPMES6);
		cStmt.setObject(10, pPMES7);
		cStmt.setObject(11, pPMES8);
		cStmt.setObject(12, pPMES9);
		cStmt.setObject(13, pPMES10);
		cStmt.setObject(14, pPMES11);
		cStmt.setObject(15, pPMES12);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARRENTAIRREGULAR(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pANYO, java.math.BigDecimal pPMES1, java.math.BigDecimal pPMES2,
			java.math.BigDecimal pPMES3, java.math.BigDecimal pPMES4, java.math.BigDecimal pPMES5,
			java.math.BigDecimal pPMES6, java.math.BigDecimal pPMES7, java.math.BigDecimal pPMES8,
			java.math.BigDecimal pPMES9, java.math.BigDecimal pPMES10, java.math.BigDecimal pPMES11,
			java.math.BigDecimal pPMES12) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARRENTAIRREGULAR(pNRIESGO, pANYO, pPMES1, pPMES2, pPMES3, pPMES4,
				pPMES5, pPMES6, pPMES7, pPMES8, pPMES9, pPMES10, pPMES11, pPMES12);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARRENTAIRREGULAR
	// --START-PAC_IAX_PRODUCCION.F_GRABARTOMADORES(SPERSON, CDOMICI, ISASEG)

	/*
	 * private HashMap
	 * callPAC_IAX_PRODUCCION__F_GRABARTOMADORES(java.math.BigDecimal pSPERSON,
	 * java.math.BigDecimal pCDOMICI, java.math.BigDecimal pISASEG) throws Exception
	 * { String callQuery="{?=call PAC_IAX_PRODUCCION.F_GRABARTOMADORES(?,?,?,?)}";
	 * logCall(callQuery, new String[] { "pSPERSON", "pCDOMICI", "pISASEG" }, new
	 * Object[] { pSPERSON, pCDOMICI, pISASEG }); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pSPERSON); cStmt.setObject(3, pCDOMICI); cStmt.setObject(4, pISASEG);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(5)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } retVal=new ConversionUtil().convertOracleObjects(retVal);
	 * //AXIS-WLS1SERVER-Ready cStmt.close(); //AXIS-WLS1SERVER-Ready return retVal;
	 * }
	 * 
	 * public HashMap
	 * ejecutaPAC_IAX_PRODUCCION__F_GRABARTOMADORES(java.math.BigDecimal pSPERSON,
	 * java.math.BigDecimal pCDOMICI, java.math.BigDecimal pISASEG) throws Exception
	 * { return this.callPAC_IAX_PRODUCCION__F_GRABARTOMADORES(pSPERSON, pCDOMICI,
	 * pISASEG); }
	 */
	// --END-PAC_IAX_PRODUCCION.F_GRABARTOMADORES
	// --START-PAC_IAX_PRODUCCION.F_GRABATIPREVALVAL(NRIESGO, CGARANT, CREVALI,
	// PREVALI, PRECARG, PDTOCOM, IEXTRAP, PDTOTEC, PRECCOM)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABATIPREVALVAL(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI,
			java.math.BigDecimal pPRECARG, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pIEXTRAP,
			java.math.BigDecimal pPDTOTEC, java.math.BigDecimal pPRECCOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABATIPREVALVAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pNRIESGO", "pCGARANT", "pCREVALI", "pPREVALI", "pPRECARG", "pPDTOCOM", "pIEXTRAP",
						"pPDTOTEC", "pPRECCOM" },
				new Object[] { pNRIESGO, pCGARANT, pCREVALI, pPREVALI, pPRECARG, pPDTOCOM, pIEXTRAP, pPDTOTEC,
						pPRECCOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pCREVALI);
		cStmt.setObject(5, pPREVALI);
		cStmt.setObject(6, pPRECARG);
		cStmt.setObject(7, pPDTOCOM);
		cStmt.setObject(8, pIEXTRAP);
		cStmt.setObject(9, pPDTOTEC);
		cStmt.setObject(10, pPRECCOM);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABATIPREVALVAL(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI,
			java.math.BigDecimal pPRECARG, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pIEXTRAP,
			java.math.BigDecimal pPDTOTEC, java.math.BigDecimal pPRECCOM) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABATIPREVALVAL(pNRIESGO, pCGARANT, pCREVALI, pPREVALI, pPRECARG,
				pPDTOCOM, pIEXTRAP, pPDTOTEC, pPRECCOM); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABATIPREVALVAL

	// --START-PAC_IAX_PRODUCCION.F_INICIALIZA(PMODE, PPRODUCTO)
	/*
	 * private HashMap callPAC_IAX_PRODUCCION__F_INICIALIZA (String pPMODE,
	 * java.math.BigDecimal pPPRODUCTO) throws Exception { String callQuery =
	 * "{?=call PAC_IAX_PRODUCCION.F_INICIALIZA(?,?,?,?)}"; logCall (callQuery, new
	 * String[] {"pPMODE", "pPPRODUCTO"}, new Object[] {pPMODE, pPPRODUCTO});
	 * CallableStatement cStmt = conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject (2, pPMODE);
	 * cStmt.setObject (3, pPPRODUCTO); cStmt.registerOutParameter (1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter (4,
	 * java.sql.Types.NUMERIC); // Valor de "PSSOLICIT" cStmt.registerOutParameter
	 * (5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute ();
	 * HashMap retVal = new HashMap (); try{ retVal.put ("RETURN", cStmt.getObject
	 * (1)); }catch (SQLException e){ retVal.put ("RETURN", null); } try{ retVal.put
	 * ("PSSOLICIT", cStmt.getObject (4)); }catch (SQLException e){ retVal.put
	 * ("PSSOLICIT", null); } try{ retVal.put ("MENSAJES", cStmt.getObject (5));
	 * }catch (SQLException e){ retVal.put ("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_PRODUCCION__F_INICIALIZA (String pPMODE,
	 * java.math.BigDecimal pPPRODUCTO) throws Exception { return
	 * this.callPAC_IAX_PRODUCCION__F_INICIALIZA(pPMODE, pPPRODUCTO); }
	 * //--END-PAC_IAX_PRODUCCION.F_INICIALIZA
	 */

	// --START-PAC_IAX_PRODUCCION.F_INICIALIZA(PMODE, PPRODUCTO, PCAGENTE)

	// --START-PAC_IAX_PRODUCCION.F_INICIALIZA(PMODE, PPRODUCTO, PCAGENTE,
	// PMODOPANT)

	private HashMap callPAC_IAX_PRODUCCION__F_INICIALIZA(String pPMODE, java.math.BigDecimal pPPRODUCTO,
			java.math.BigDecimal pPCAGENTE, String pPMODOPANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INICIALIZA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMODE", "pPPRODUCTO", "pPCAGENTE", "pPMODOPANT" },
				new Object[] { pPMODE, pPPRODUCTO, pPCAGENTE, pPMODOPANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMODE);
		cStmt.setObject(3, pPPRODUCTO);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPMODOPANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PSSOLICIT"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PURL"
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
			retVal.put("PSSOLICIT", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PSSOLICIT", null);
		}
		try {
			retVal.put("PURL", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PURL", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INICIALIZA(String pPMODE, java.math.BigDecimal pPPRODUCTO,
			java.math.BigDecimal pPCAGENTE, String pPMODOPANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INICIALIZA(pPMODE, pPPRODUCTO, pPCAGENTE, pPMODOPANT);
	}
	// --END-PAC_IAX_PRODUCCION.F_INICIALIZA

	// --START-PAC_IAX_PRODUCCION.F_INICRENTASIRREGULARES(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_INICRENTASIRREGULARES(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INICRENTASIRREGULARES(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INICRENTASIRREGULARES(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INICRENTASIRREGULARES(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_INICRENTASIRREGULARES
	// --START-PAC_IAX_PRODUCCION.F_INSERTASEGURADO(SPERSON, PFECRETROACT)

	private HashMap callPAC_IAX_PRODUCCION__F_INSERTASEGURADO(java.math.BigDecimal pSPERSON,
			java.sql.Date pPFECRETROACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERTASEGURADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON", "pPFECRETROACT" }, new Object[] { pSPERSON, pPFECRETROACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.setObject(3, pPFECRETROACT);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERTASEGURADO(java.math.BigDecimal pSPERSON,
			java.sql.Date pPFECRETROACT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERTASEGURADO(pSPERSON, pPFECRETROACT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INSERTASEGURADO

	// --START-PAC_IAX_PRODUCCION.F_INSERTTOMADORES(PSPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_INSERTTOMADORES(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERTTOMADORES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PPREGUN"
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
		try {
			retVal.put("PPREGUN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PPREGUN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERTTOMADORES(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERTTOMADORES(pPSPERSON);
	}
	// --END-PAC_IAX_PRODUCCION.F_INSERTTOMADORES

	// --START-PAC_IAX_PRODUCCION.F_LEEASEGURADOS(PNRIESGO, PSPRODUC)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEASEGURADOS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEASEGURADOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPSPRODUC" }, new Object[] { pPNRIESGO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEASEGURADOS(pPNRIESGO, pPSPRODUC);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEASEGURADOS

	// --START-PAC_IAX_PRODUCCION.F_LEECLAUSULASESP(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(java.math.BigDecimal pPNRIESGO, String pPMODO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEECLAUSULASESP(?, ?, ?)}";
		logCall(callQuery, new String[] { "pPNRIESGO", "pPMODO" }, new Object[] { pPNRIESGO, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(java.math.BigDecimal pPNRIESGO, String pPMODO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(pPNRIESGO, pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEECLAUSULASESP
	// --START-PAC_IAX_PRODUCCION.F_LEECLAUSULASPROD()

	private HashMap callPAC_IAX_PRODUCCION__F_LEECLAUSULASPROD() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEECLAUSULASPROD(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPROD() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEECLAUSULASPROD();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEECLAUSULASPROD
	// --START-PAC_IAX_PRODUCCION.F_LEEDATOSGESTION()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEDATOSGESTION() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDATOSGESTION(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GESTION".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDATOSGESTION
	// --START-PAC_IAX_PRODUCCION.F_LEEDOCUMALTA()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEDOCUMALTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDOCUMALTA(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DOCUMNEC".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDOCUMALTA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDOCUMALTA();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDOCUMALTA
	// --START-PAC_IAX_PRODUCCION.F_LEEGARANTIAS(PNRIESGO, PCPARTIDA)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEGARANTIAS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEGARANTIAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCPARTIDA" }, new Object[] { pPNRIESGO, pPCPARTIDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCPARTIDA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEGARANTIAS(pPNRIESGO, pPCPARTIDA);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEGARANTIAS

	// --START-PAC_IAX_PRODUCCION.F_LEEGESTIONCOMISION()

	// BUG 25214 - FAL - 09/01/2013
	private HashMap callPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(java.math.BigDecimal pCTIPCOM) throws Exception {
		// private HashMap callPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION() throws
		// Exception {
		// String callQuery="{?=call PAC_IAX_PRODUCCION.F_LEEGESTIONCOMISION(?)}";
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEGESTIONCOMISION(?, ?)}";
		// logCall(callQuery, new String[] { }, new Object[] { });
		logCall(callQuery, new String[] { "pCTIPCOM" }, new Object[] { pCTIPCOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCTIPCOM);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GSTCOMISION".toUpperCase())); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	// BUG 25214 - FAL - 09/01/2013
	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(java.math.BigDecimal pCTIPCOM) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(pCTIPCOM);
	}

	// --END-PAC_IAX_PRODUCCION.F_LEEGESTIONCOMISION
	// --START-PAC_IAX_PRODUCCION.F_LEEPREGUNTASPOLIZA()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEPREGUNTASPOLIZA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEPREGUNTASPOLIZA(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTAS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASPOLIZA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEPREGUNTASPOLIZA();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEPREGUNTASPOLIZA
	// --START-PAC_IAX_PRODUCCION.F_LEEPREGUNTASRIESGO(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEPREGUNTASRIESGO(?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEPREGUNTASRIESGO
	// --START-PAC_IAX_PRODUCCION.F_LEERENTASIRREGULARES(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_LEERENTASIRREGULARES(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEERENTASIRREGULARES(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RENTAIRR".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEERENTASIRREGULARES(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEERENTASIRREGULARES(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEERENTASIRREGULARES
	// --START-PAC_IAX_PRODUCCION.F_LEETOMADORES()

	private HashMap callPAC_IAX_PRODUCCION__F_LEETOMADORES() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEETOMADORES(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TOMADORES".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEETOMADORES();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEETOMADORES

	// --START-PAC_IAX_PRODUCCION.F_LEEULTTOMADORES()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEULTTOMADORES() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEULTTOMADORES(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_TOMADORES".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEULTTOMADORES() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEULTTOMADORES();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEULTTOMADORES
	// --START-PAC_IAX_PRODUCCION.F_PERMITE_ANULARPROPUESTA(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_PERMITE_ANULARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_PERMITE_ANULARPROPUESTA(?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_PERMITE_ANULARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_PERMITE_ANULARPROPUESTA(pPSSEGURO, pPNMOVIMI);
	}
	// --END-PAC_IAX_PRODUCCION.F_PERMITE_ANULARPROPUESTA
	// --START-PAC_IAX_PRODUCCION.F_RETENERPROPUESTA()

	private HashMap callPAC_IAX_PRODUCCION__F_RETENERPROPUESTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_RETENERPROPUESTA(?,?,?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "ONPOLIZA"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OSSEGURO"
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
			retVal.put("ONPOLIZA", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("ONPOLIZA", null);
		}
		try {
			retVal.put("OSSEGURO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OSSEGURO", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_RETENERPROPUESTA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_RETENERPROPUESTA();
	}
	// --END-PAC_IAX_PRODUCCION.F_RETENERPROPUESTA
	// --START-PAC_IAX_PRODUCCION.F_SET_ACTIVIDAD(PCACTIVI)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_ACTIVIDAD(java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_ACTIVIDAD(?,?)}";
		logCall(callQuery, new String[] { "pPCACTIVI" }, new Object[] { pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_ACTIVIDAD(java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_ACTIVIDAD(pPCACTIVI);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_ACTIVIDAD
	// --START-PAC_IAX_PRODUCCION.F_SET_COBROREC(PCTIPCOB, PNRECIBO, PCBANCAR,
	// PCTIPBAN)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_COBROREC(java.math.BigDecimal pPCTIPCOB,
			java.math.BigDecimal pPNRECIBO, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_COBROREC(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCTIPCOB", "pPNRECIBO", "pPCBANCAR", "pPCTIPBAN" },
				new Object[] { pPCTIPCOB, pPNRECIBO, pPCBANCAR, pPCTIPBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPCOB);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPCBANCAR);
		cStmt.setObject(5, pPCTIPBAN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_COBROREC(java.math.BigDecimal pPCTIPCOB,
			java.math.BigDecimal pPNRECIBO, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_COBROREC(pPCTIPCOB, pPNRECIBO, pPCBANCAR, pPCTIPBAN);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_COBROREC

	// --START-PAC_IAX_PRODUCCION.F_SET_COBROREC(PSSEGURO, PNMOVIMI, PCTIPCOB,
	// PCTIPBAN, PCBANCAR)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_COBROREC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCTIPCOB, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_COBROREC(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPCTIPCOB", "pPCTIPBAN", "pPCBANCAR" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPCTIPCOB, pPCTIPBAN, pPCBANCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCTIPCOB);
		cStmt.setObject(5, pPCTIPBAN);
		cStmt.setObject(6, pPCBANCAR);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_COBROREC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCTIPCOB, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_COBROREC(pPSSEGURO, pPNMOVIMI, pPCTIPCOB, pPCTIPBAN, pPCBANCAR);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_COBROREC

	// --START-PAC_IAX_PRODUCCION.F_SET_CONSULTAPOLIZA(SSEGURO, PMODE)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(java.math.BigDecimal pSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_CONSULTAPOLIZA(?,?)}";
		logCall(callQuery, new String[] { "pSSEGURO" }, new Object[] { pSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSSEGURO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(java.math.BigDecimal pSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(pSSEGURO);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_CONSULTAPOLIZA
	// --START-PAC_IAX_PRODUCCION.F_SET_FECHAEFECTO(PFEFECTO)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_FECHAEFECTO(java.sql.Date pPFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_FECHAEFECTO(?,?)}";
		logCall(callQuery, new String[] { "pPFEFECTO" }, new Object[] { pPFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFEFECTO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_FECHAEFECTO(java.sql.Date pPFEFECTO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_FECHAEFECTO(pPFEFECTO);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_FECHAEFECTO
	// --START-PAC_IAX_PRODUCCION.F_SET_GARFORPAG(CFORPAG)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_GARFORPAG(java.math.BigDecimal pCFORPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_GARFORPAG(?,?)}";
		logCall(callQuery, new String[] { "pCFORPAG" }, new Object[] { pCFORPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCFORPAG);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_GARFORPAG(java.math.BigDecimal pCFORPAG) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_GARFORPAG(pCFORPAG);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_GARFORPAG
	// --START-PAC_IAX_PRODUCCION.F_SET_REVALRIESGO(NRIESGO, CREVALI, PREVALI,
	// IREVALI)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_REVALRIESGO(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_REVALRIESGO(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO", "pCREVALI", "pPREVALI", "pIREVALI" },
				new Object[] { pNRIESGO, pCREVALI, pPREVALI, pIREVALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCREVALI);
		cStmt.setObject(4, pPREVALI);
		cStmt.setObject(5, pIREVALI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_REVALRIESGO(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_REVALRIESGO(pNRIESGO, pCREVALI, pPREVALI, pIREVALI);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_REVALRIESGO
	// --START-PAC_IAX_PRODUCCION.F_TARIFICAR(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_TARIFICAR(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_TARIFICAR(?,?)}";
		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_TARIFICAR(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_TARIFICAR(pNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_TARIFICAR

	// --START-PAC_IAX_PRODUCCION.LIMPIARTEMPORALES()

	private HashMap callPAC_IAX_PRODUCCION__LIMPIARTEMPORALES() throws Exception {
		String callQuery = "{call PAC_IAX_PRODUCCION.LIMPIARTEMPORALES()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__LIMPIARTEMPORALES() throws Exception {
		return this.callPAC_IAX_PRODUCCION__LIMPIARTEMPORALES();
	}
	// --END-PAC_IAX_PRODUCCION.LIMPIARTEMPORALES

	// --START-PAC_IAX_PRODUCCION.F_GAR_REVAL_DIF(PSSEGURO, PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GAR_REVAL_DIF(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GAR_REVAL_DIF(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GAR_REVAL_DIF(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GAR_REVAL_DIF(pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GAR_REVAL_DIF

	// --START-PAC_IAX_PRODUCCION.F_SET_NDURACI(PFEFECTO, PNDURACI)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_NDURACI(java.sql.Date pPFEFECTO, java.math.BigDecimal pPNDURACI,
			java.math.BigDecimal pCDURACI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_NDURACI(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFEFECTO", "pPNDURACI", "pCDURACI" },
				new Object[] { pPFEFECTO, pPNDURACI, pCDURACI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFEFECTO);
		cStmt.setObject(3, pPNDURACI);
		cStmt.setObject(4, pCDURACI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "VFVENCIM"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNDURCOB"
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
			retVal.put("FVENCIM_nou", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("FVENCIM_nou", null);
		}
		try {
			retVal.put("PNDURCOB", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNDURCOB", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_NDURACI(java.sql.Date pPFEFECTO, java.math.BigDecimal pPNDURACI,
			java.math.BigDecimal pCDURACI) throws Exception {
		return new ConversionUtil()
				.convertOracleObjects(this.callPAC_IAX_PRODUCCION__F_SET_NDURACI(pPFEFECTO, pPNDURACI, pCDURACI));
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_NDURACI

	/*********
	 * ROGER *
	 *********/

	// --START-PAC_IAX_PRODUCCION.F_EXISTRIESGO()
	private HashMap callPAC_IAX_PRODUCCION__F_EXISTRIESGO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_EXISTRIESGO(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_EXISTRIESGO() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_EXISTRIESGO();
	}
	// --END-PAC_IAX_PRODUCCION.F_EXISTRIESGO

	// --START-PAC_IAX_PRODUCCION.F_LEERIESGOS()

	private HashMap callPAC_IAX_PRODUCCION__F_LEERIESGOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEERIESGOS(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RIESGOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEERIESGOS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEERIESGOS();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEERIESGOS

	// --START-PAC_IAX_PRODUCCION.F_GRABARIEDOMICILIO(PNRIESGO, PTDOMICI, PCPOSTAL,
	// PCPOBLAC, PCPROVIN, PCPAIS, PCSIGLAS, PTNOMVIA, PNNUMVIA, PTCOMPLE, PCCIUDAD,
	// PFGISX, PFGISY, PFGISZ, PCVALIDA, PIDDIRRIE, PIDDOMICIS, PCVIAVP, PCLITVP,
	// PCBISVP, PCORVP, PNVIAADCO, PCLITCO, PCORCO, PNPLACACO, PCOR2CO, PCDET1IA,
	// PTNUM1IA, PCDET2IA, PTNUM2IA, PCDET3IA, PTNUM3IA, PIDDOMICI, PLOCALIDAD,
	// PFDEFECTO, PDESCRIPCION)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARIEDOMICILIO(java.math.BigDecimal pPNRIESGO, String pPTDOMICI,
			String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, java.math.BigDecimal pPCCIUDAD,
			java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY, java.math.BigDecimal pPFGISZ,
			java.math.BigDecimal pPCVALIDA, java.math.BigDecimal pPIDDIRRIE, String pPIDDOMICIS,
			java.math.BigDecimal pPCVIAVP, java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP,
			java.math.BigDecimal pPCORVP, java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO,
			java.math.BigDecimal pPCORCO, java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO,
			java.math.BigDecimal pPCDET1IA, String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA,
			java.math.BigDecimal pPCDET3IA, String pPTNUM3IA, java.math.BigDecimal pPIDDOMICI, String pPLOCALIDAD,
			java.math.BigDecimal pPFDEFECTO, String pPDESCRIPCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARIEDOMICILIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPTDOMICI", "pPCPOSTAL", "pPCPOBLAC", "pPCPROVIN", "pPCPAIS",
				"pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPCCIUDAD", "pPFGISX", "pPFGISY", "pPFGISZ",
				"pPCVALIDA", "pPIDDIRRIE", "pPIDDOMICIS", "pPCVIAVP", "pPCLITVP", "pPCBISVP", "pPCORVP", "pPNVIAADCO",
				"pPCLITCO", "pPCORCO", "pPNPLACACO", "pPCOR2CO", "pPCDET1IA", "pPTNUM1IA", "pPCDET2IA", "pPTNUM2IA",
				"pPCDET3IA", "pPTNUM3IA", "pPIDDOMICI", "pPLOCALIDAD", "pPFDEFECTO", "pPDESCRIPCION" },
				new Object[] { pPNRIESGO, pPTDOMICI, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPCSIGLAS, pPTNOMVIA,
						pPNNUMVIA, pPTCOMPLE, pPCCIUDAD, pPFGISX, pPFGISY, pPFGISZ, pPCVALIDA, pPIDDIRRIE, pPIDDOMICIS,
						pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO,
						pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPIDDOMICI, pPLOCALIDAD,
						pPFDEFECTO, pPDESCRIPCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPTDOMICI);
		cStmt.setObject(4, pPCPOSTAL);
		cStmt.setObject(5, pPCPOBLAC);
		cStmt.setObject(6, pPCPROVIN);
		cStmt.setObject(7, pPCPAIS);
		cStmt.setObject(8, pPCSIGLAS);
		cStmt.setObject(9, pPTNOMVIA);
		cStmt.setObject(10, pPNNUMVIA);
		cStmt.setObject(11, pPTCOMPLE);
		cStmt.setObject(12, pPCCIUDAD);
		cStmt.setObject(13, (pPFGISX != null) ? new Double(pPFGISX.doubleValue()) : null);
		cStmt.setObject(14, (pPFGISY != null) ? new Double(pPFGISY.doubleValue()) : null);
		cStmt.setObject(15, (pPFGISZ != null) ? new Double(pPFGISZ.doubleValue()) : null);
		cStmt.setObject(16, pPCVALIDA);
		cStmt.setObject(17, pPIDDIRRIE);
		cStmt.setObject(18, pPIDDOMICIS);
		cStmt.setObject(19, pPCVIAVP);
		cStmt.setObject(20, pPCLITVP);
		cStmt.setObject(21, pPCBISVP);
		cStmt.setObject(22, pPCORVP);
		cStmt.setObject(23, pPNVIAADCO);
		cStmt.setObject(24, pPCLITCO);
		cStmt.setObject(25, pPCORCO);
		cStmt.setObject(26, pPNPLACACO);
		cStmt.setObject(27, pPCOR2CO);
		cStmt.setObject(28, pPCDET1IA);
		cStmt.setObject(29, pPTNUM1IA);
		cStmt.setObject(30, pPCDET2IA);
		cStmt.setObject(31, pPTNUM2IA);
		cStmt.setObject(32, pPCDET3IA);
		cStmt.setObject(33, pPTNUM3IA);
		cStmt.setObject(34, pPIDDOMICI);
		cStmt.setObject(35, pPLOCALIDAD);
		cStmt.setObject(36, pPFDEFECTO);
		cStmt.setObject(37, pPDESCRIPCION);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(38, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(38));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDOMICILIO(java.math.BigDecimal pPNRIESGO, String pPTDOMICI,
			String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, java.math.BigDecimal pPCCIUDAD,
			java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY, java.math.BigDecimal pPFGISZ,
			java.math.BigDecimal pPCVALIDA, java.math.BigDecimal pPIDDIRRIE, String pPIDDOMICIS,
			java.math.BigDecimal pPCVIAVP, java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP,
			java.math.BigDecimal pPCORVP, java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO,
			java.math.BigDecimal pPCORCO, java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO,
			java.math.BigDecimal pPCDET1IA, String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA,
			java.math.BigDecimal pPCDET3IA, String pPTNUM3IA, java.math.BigDecimal pPIDDOMICI, String pPLOCALIDAD,
			java.math.BigDecimal pPFDEFECTO, String pPDESCRIPCION) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARIEDOMICILIO(pPNRIESGO, pPTDOMICI, pPCPOSTAL, pPCPOBLAC, pPCPROVIN,
				pPCPAIS, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCCIUDAD, pPFGISX, pPFGISY, pPFGISZ, pPCVALIDA,
				pPIDDIRRIE, pPIDDOMICIS, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO,
				pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPIDDOMICI,
				pPLOCALIDAD, pPFDEFECTO, pPDESCRIPCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARIEDOMICILIO

	// --START-PAC_IAX_PRODUCCION.F_GRABARIEDESCRIPCION(PNRIESGO, PTDESCRIPCION,
	// PNASEGUR, PNEDADCOL, PSEXCOL)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARIEDESCRIPCION(java.math.BigDecimal pPNRIESGO, String pPTDESCRIPCION,
			String pPNASEGUR, java.math.BigDecimal pPNEDADCOL, java.math.BigDecimal pPSEXCOL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARIEDESCRIPCION(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO", "pPTDESCRIPCION", "pPNASEGUR", "pPNEDADCOL", "pPSEXCOL" },
				new Object[] { pPNRIESGO, pPTDESCRIPCION, pPNASEGUR, pPNEDADCOL, pPSEXCOL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPTDESCRIPCION);
		cStmt.setObject(4, pPNASEGUR);
		cStmt.setObject(5, pPNEDADCOL);
		cStmt.setObject(6, pPSEXCOL);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDESCRIPCION(java.math.BigDecimal pPNRIESGO,
			String pPTDESCRIPCION, String pPNASEGUR, java.math.BigDecimal pPNEDADCOL, java.math.BigDecimal pPSEXCOL)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARIEDESCRIPCION(pPNRIESGO, pPTDESCRIPCION, pPNASEGUR, pPNEDADCOL,
				pPSEXCOL);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARIEDESCRIPCION

	// --START-PAC_IAX_PRODUCCION.ejecutaPAC_IAX_PRODUCCION__F_GRABARIEAUT(PNRIESGO,
	// PTDESCRIPCION, PNASEGUR, PNEDADCOL, PSEXCOL)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARIEAUT() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARIEAUT(?,?,?,?,?,?)}";
		/*
		 * logCall(callQuery, new String[] { "pPNRIESGO", "pPTDESCRIPCION", "pPNASEGUR",
		 * "pPNEDADCOL", "pPSEXCOL" }, new Object[] { pPNRIESGO, pPTDESCRIPCION,
		 * pPNASEGUR, pPNEDADCOL, pPSEXCOL });
		 */
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		/*
		 * cStmt.setObject(2, pPNRIESGO); cStmt.setObject(3, pPTDESCRIPCION);
		 * cStmt.setObject(4, pPNASEGUR); cStmt.setObject(5, pPNEDADCOL);
		 * cStmt.setObject(6, pPSEXCOL);
		 */
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARIEAUT() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARIEAUT();
	}
	// --END-PAC_IAX_PRODUCCION.GrabaRieAut

	// --START-PAC_IAX_PRODUCCION.F_COBRO_RETENIDO(PSOLICIT, PNMOVIMI, MENSAJES)

	private HashMap callPAC_IAX_PRODUCCION__F_COBRO_RETENIDO(java.math.BigDecimal pPSOLICIT,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_COBRO_RETENIDO(?,?,?)}";
		logCall(callQuery, new String[] { "pPSOLICIT", "pPNMOVIMI" }, new Object[] { pPSOLICIT, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSOLICIT);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_COBRO_RETENIDO(java.math.BigDecimal pPSOLICIT,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_COBRO_RETENIDO(pPSOLICIT, pPNMOVIMI);
	}
	// --END-PAC_IAX_PRODUCCION.F_COBRO_RETENIDO

	// --START-PAC_IAX_PRODUCCION.F_COBRO_RECIBOS(PSOLICIT, PNMOVIMI)

	private HashMap callPAC_IAX_PRODUCCION__F_COBRO_RECIBOS(java.math.BigDecimal pPSOLICIT,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_COBRO_RECIBOS(?,?,?)}";
		logCall(callQuery, new String[] { "pPSOLICIT", "pPNMOVIMI" }, new Object[] { pPSOLICIT, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSOLICIT);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_COBRO_RECIBOS(java.math.BigDecimal pPSOLICIT,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_COBRO_RECIBOS(pPSOLICIT, pPNMOVIMI);
	}
	// --END-PAC_IAX_PRODUCCION.F_COBRO_RECIBOS

	// --START-PAC_IAX_PRODUCCION.F_GET_CCC_SEGURO(PSSEGURO, PNORDTOM)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CCC_SEGURO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNORDTOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CCC_SEGURO(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNORDTOM" }, new Object[] { pPSSEGURO, pPNORDTOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNORDTOM);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPERSON"
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
			retVal.put("PSPERSON", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPERSON", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_SEGURO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNORDTOM) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CCC_SEGURO(pPSSEGURO, pPNORDTOM);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CCC_SEGURO
	// --START-PAC_IAX_PRODUCCION.F_GET_REVAL_POLIZA(PTABLAS, PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA(String pPTABLAS, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_REVAL_POLIZA(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPTABLAS", "pPSSEGURO" }, new Object[] { pPTABLAS, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PREVALI"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCREVALI"
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
			retVal.put("PREVALI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PREVALI", null);
		}
		try {
			retVal.put("PCREVALI", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCREVALI", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA(String pPTABLAS, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA(pPTABLAS, pPSSEGURO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_REVAL_POLIZA

	// --START-PAC_IAX_PRODUCCION.F_GET_CERTIFICADOSCERO(PSPRODUC, PNPOLIZA,
	// PNSOLICI, PBUSCAR, PCINTERMED, PCSUCURSAL, PCADM, PMODO)
	private HashMap callPAC_IAX_PRODUCCION__F_GET_CERTIFICADOSCERO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNSOLICI, String pPBUSCAR,
			java.math.BigDecimal pPCINTERMED, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM,
			String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CERTIFICADOSCERO(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPNPOLIZA", "pPNSOLICI", "pPBUSCAR", "pPCINTERMED", "pPCSUCURSAL",
						"pPCADM", "pPMODO" },
				new Object[] { pPSPRODUC, pPNPOLIZA, pPNSOLICI, pPBUSCAR, pPCINTERMED, pPCSUCURSAL, pPCADM, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNSOLICI);
		cStmt.setObject(5, pPBUSCAR);
		cStmt.setObject(6, pPCINTERMED);
		cStmt.setObject(7, pPCSUCURSAL);
		cStmt.setObject(8, pPCADM);
		cStmt.setObject(9, pPMODO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CERTIFICADOSCERO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNSOLICI, String pPBUSCAR,
			java.math.BigDecimal pPCINTERMED, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM,
			String pPMODO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CERTIFICADOSCERO(pPSPRODUC, pPNPOLIZA, pPNSOLICI, pPBUSCAR,
				pPCINTERMED, pPCSUCURSAL, pPCADM, pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CERTIFICADOSCERO

	// --START-PAC_IAX_PRODUCCION.F_GET_MESESEXTRA(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_MESESEXTRA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_MESESEXTRA(?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_NMESEXTRA".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCMODEXTRA"
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
			retVal.put("PCMODEXTRA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCMODEXTRA", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_MESESEXTRA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_MESESEXTRA(pPSSEGURO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_MESESEXTRA

	// --START-PAC_IAX_PRODUCCION.F_SET_NMESEXTRA(PNMES1, PNMES2, PNMES3, PNMES4,
	// PNMES5, PNMES6, PNMES7, PNMES8, PNMES9, PNMES10, PNMES11, PNMES12)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_NMESEXTRA(java.math.BigDecimal pPNMES1, java.math.BigDecimal pPNMES2,
			java.math.BigDecimal pPNMES3, java.math.BigDecimal pPNMES4, java.math.BigDecimal pPNMES5,
			java.math.BigDecimal pPNMES6, java.math.BigDecimal pPNMES7, java.math.BigDecimal pPNMES8,
			java.math.BigDecimal pPNMES9, java.math.BigDecimal pPNMES10, java.math.BigDecimal pPNMES11,
			java.math.BigDecimal pPNMES12) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_NMESEXTRA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNMES1", "pPNMES2", "pPNMES3", "pPNMES4", "pPNMES5", "pPNMES6", "pPNMES7", "pPNMES8",
						"pPNMES9", "pPNMES10", "pPNMES11", "pPNMES12" },
				new Object[] { pPNMES1, pPNMES2, pPNMES3, pPNMES4, pPNMES5, pPNMES6, pPNMES7, pPNMES8, pPNMES9,
						pPNMES10, pPNMES11, pPNMES12 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNMES1);
		cStmt.setObject(3, pPNMES2);
		cStmt.setObject(4, pPNMES3);
		cStmt.setObject(5, pPNMES4);
		cStmt.setObject(6, pPNMES5);
		cStmt.setObject(7, pPNMES6);
		cStmt.setObject(8, pPNMES7);
		cStmt.setObject(9, pPNMES8);
		cStmt.setObject(10, pPNMES9);
		cStmt.setObject(11, pPNMES10);
		cStmt.setObject(12, pPNMES11);
		cStmt.setObject(13, pPNMES12);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_NMESEXTRA(java.math.BigDecimal pPNMES1,
			java.math.BigDecimal pPNMES2, java.math.BigDecimal pPNMES3, java.math.BigDecimal pPNMES4,
			java.math.BigDecimal pPNMES5, java.math.BigDecimal pPNMES6, java.math.BigDecimal pPNMES7,
			java.math.BigDecimal pPNMES8, java.math.BigDecimal pPNMES9, java.math.BigDecimal pPNMES10,
			java.math.BigDecimal pPNMES11, java.math.BigDecimal pPNMES12) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_NMESEXTRA(pPNMES1, pPNMES2, pPNMES3, pPNMES4, pPNMES5, pPNMES6,
				pPNMES7, pPNMES8, pPNMES9, pPNMES10, pPNMES11, pPNMES12);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_NMESEXTRA
	// --START-PAC_IAX_PRODUCCION.F_SET_NPOLIZA(PNPOLIZA)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_NPOLIZA(java.math.BigDecimal pPNPOLIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_NPOLIZA(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_NPOLIZA(java.math.BigDecimal pPNPOLIZA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_NPOLIZA(pPNPOLIZA);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_NPOLIZA

	// --START-PAC_IAX_PRODUCCION.F_ADMITECERTIFICADOS()

	private HashMap callPAC_IAX_PRODUCCION__F_ADMITECERTIFICADOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ADMITECERTIFICADOS(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ADMITECERTIFICADOS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ADMITECERTIFICADOS();
	}
	// --END-PAC_IAX_PRODUCCION.F_ADMITECERTIFICADOS

	// --START-PAC_IAX_PRODUCCION.F_GET_DATOS_COBRO(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DATOS_COBRO(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DATOS_COBRO(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GESTION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DATOS_COBRO(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DATOS_COBRO(pPSSEGURO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DATOS_COBRO

	/**
	 * RKV Bug 9416 - Patch AXIS632
	 * 
	 * @param pPNMODELO
	 * @return
	 * @throws Exception
	 */
	// --START-PAC_IAX_PRODUCCION.F_LEEMODELOINVERSIONFINV(PNMODELO)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEMODELOINVERSIONFINV(java.math.BigDecimal pPNMODELO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEMODELOINVERSIONFINV(?, ?)}";

		logCall(callQuery, new String[] { "pPNMODELO" }, new Object[] { pPNMODELO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNMODELO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODULKMODELOSINV".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEMODELOINVERSIONFINV(java.math.BigDecimal pPNMODELO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEMODELOINVERSIONFINV(pPNMODELO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEMODELOINVERSIONFINV

	// --START-PAC_IAX_PRODUCCION.F_LEEASEGURADOSMULTI(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEASEGURADOSMULTI(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEASEGURADOSMULTI(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOSMULTI(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEASEGURADOSMULTI(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEASEGURADOSMULTI

	// --START-PAC_IAX_PRODUCCION.F_LEEULTASEGURADO(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEULTASEGURADO(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEULTASEGURADO

	private HashMap callPAC_IAX_PRODUCCION__F_GET_MASDATOSDETGARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNDETGAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DETALLEGARANTIA(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO", "pPCGARANT", "pPNDETGAR" },
				new Object[] { pPNRIESGO, pPCGARANT, pPNDETGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPNDETGAR);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_MASDATOSDETGARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNDETGAR) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_MASDATOSDETGARANTIA(pPNRIESGO, pPCGARANT, pPNDETGAR);
	}
	// --START-PAC_IAX_PRODUCCION.F_LEEDATOSSALDODEUTORS(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEDATOSSALDODEUTORS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDATOSSALDODEUTORS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SALDODEUTORSEG".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSSALDODEUTORS(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDATOSSALDODEUTORS(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDATOSSALDODEUTORS
	// --START-PAC_IAX_PRODUCCION.F_SET_SALDODEUTOR(PNRIESGO, SELSALDO, PIDCUENTA,
	// PCTIPCUENTA, PCTIPBAN, PCTIPIMP, PISALDO, PPORCEN, PILIMITE, PICAPMAX,
	// PCMONEDA, PICAPMAXPOL)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_SALDODEUTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pSELSALDO, String pPIDCUENTA, java.math.BigDecimal pPCTIPCUENTA,
			java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCTIPIMP, java.math.BigDecimal pPISALDO,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPILIMITE, java.math.BigDecimal pPICAPMAX,
			String pPCMONEDA, java.math.BigDecimal pPICAPMAXPOL, java.math.BigDecimal pPICAPASE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_SALDODEUTOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pSELSALDO", "pPIDCUENTA", "pPCTIPCUENTA", "pPCTIPBAN", "pPCTIPIMP",
						"pPISALDO", "pPPORCEN", "pPILIMITE", "pPICAPMAX", "pPCMONEDA", "pPICAPMAXPOL", "pPICAPASE" },
				new Object[] { pPNRIESGO, pSELSALDO, pPIDCUENTA, pPCTIPCUENTA, pPCTIPBAN, pPCTIPIMP, pPISALDO, pPPORCEN,
						pPILIMITE, pPICAPMAX, pPCMONEDA, pPICAPMAXPOL, pPICAPASE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pSELSALDO);
		cStmt.setObject(4, pPIDCUENTA);
		cStmt.setObject(5, pPCTIPCUENTA);
		cStmt.setObject(6, pPCTIPBAN);
		cStmt.setObject(7, pPCTIPIMP);
		cStmt.setObject(8, pPISALDO);
		cStmt.setObject(9, pPPORCEN);
		cStmt.setObject(10, pPILIMITE);
		cStmt.setObject(11, pPICAPMAX);
		cStmt.setObject(12, pPCMONEDA);
		cStmt.setObject(13, pPICAPMAXPOL);
		cStmt.setObject(14, pPICAPASE);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_SALDODEUTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pSELSALDO, String pPIDCUENTA, java.math.BigDecimal pPCTIPCUENTA,
			java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCTIPIMP, java.math.BigDecimal pPISALDO,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPILIMITE, java.math.BigDecimal pPICAPMAX,
			String pPCMONEDA, java.math.BigDecimal pPICAPMAXPOL, java.math.BigDecimal pPICAPASE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_SALDODEUTOR(pPNRIESGO, pSELSALDO, pPIDCUENTA, pPCTIPCUENTA, pPCTIPBAN,
				pPCTIPIMP, pPISALDO, pPPORCEN, pPILIMITE, pPICAPMAX, pPCMONEDA, pPICAPMAXPOL, pPICAPASE);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_SALDODEUTOR

	// --START-PAC_IAX_PRODUCCION.F_CALCULA_CAPASE(PCTIPIMP, PISALDO, PPORCEN,
	// PILIMITE, PICAPMAX)

	private HashMap callPAC_IAX_PRODUCCION__F_CALCULA_CAPASE(java.math.BigDecimal pPCTIPIMP,
			java.math.BigDecimal pPISALDO, java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPILIMITE,
			java.math.BigDecimal pPICAPMAX) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CALCULA_CAPASE(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPIMP", "pPISALDO", "pPPORCEN", "pPILIMITE", "pPICAPMAX" },
				new Object[] { pPCTIPIMP, pPISALDO, pPPORCEN, pPILIMITE, pPICAPMAX });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPIMP);
		cStmt.setObject(3, pPISALDO);
		cStmt.setObject(4, pPPORCEN);
		cStmt.setObject(5, pPILIMITE);
		cStmt.setObject(6, pPICAPMAX);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PICAPASE"
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
			retVal.put("PICAPASE", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PICAPASE", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CALCULA_CAPASE(java.math.BigDecimal pPCTIPIMP,
			java.math.BigDecimal pPISALDO, java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPILIMITE,
			java.math.BigDecimal pPICAPMAX) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CALCULA_CAPASE(pPCTIPIMP, pPISALDO, pPPORCEN, pPILIMITE, pPICAPMAX);
	}
	// --END-PAC_IAX_PRODUCCION.F_CALCULA_CAPASE

	// --START-PAC_IAX_PRODUCCION.F_GET_DETPOLIZA()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DETPOLIZA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DETPOLIZA(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DETPOLIZA".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DETPOLIZA
	// --START-PAC_IAX_PRODUCCION.F_SET_PRESTAMOSEG(PNRIESGO, SELSALDO, PIDCUENTA,
	// PCTIPCUENTA, PCTIPBAN, PCTIPIMP, PISALDO, PPORCEN, PILIMITE, PICAPMAX,
	// PCMONEDA, PICAPMAXPOL, PICAPASE, PDESCRIPCION, PFINIPREST, PFFINPREST)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pSELSALDO, String pPIDCUENTA, java.math.BigDecimal pPCTIPCUENTA,
			java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCTIPIMP, java.math.BigDecimal pPISALDO,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPILIMITE, java.math.BigDecimal pPICAPMAX,
			String pPCMONEDA, java.math.BigDecimal pPICAPMAXPOL, java.math.BigDecimal pPICAPASE, String pPDESCRIPCION,
			java.sql.Date pPFINIPREST, java.sql.Date pPFFINPREST) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_PRESTAMOSEG(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pSELSALDO", "pPIDCUENTA", "pPCTIPCUENTA", "pPCTIPBAN", "pPCTIPIMP",
						"pPISALDO", "pPPORCEN", "pPILIMITE", "pPICAPMAX", "pPCMONEDA", "pPICAPMAXPOL", "pPICAPASE",
						"pPDESCRIPCION", "pPFINIPREST", "pPFFINPREST" },
				new Object[] { pPNRIESGO, pSELSALDO, pPIDCUENTA, pPCTIPCUENTA, pPCTIPBAN, pPCTIPIMP, pPISALDO, pPPORCEN,
						pPILIMITE, pPICAPMAX, pPCMONEDA, pPICAPMAXPOL, pPICAPASE, pPDESCRIPCION, pPFINIPREST,
						pPFFINPREST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pSELSALDO);
		cStmt.setObject(4, pPIDCUENTA);
		cStmt.setObject(5, pPCTIPCUENTA);
		cStmt.setObject(6, pPCTIPBAN);
		cStmt.setObject(7, pPCTIPIMP);
		cStmt.setObject(8, pPISALDO);
		cStmt.setObject(9, pPPORCEN);
		cStmt.setObject(10, pPILIMITE);
		cStmt.setObject(11, pPICAPMAX);
		cStmt.setObject(12, pPCMONEDA);
		cStmt.setObject(13, pPICAPMAXPOL);
		cStmt.setObject(14, pPICAPASE);
		cStmt.setObject(15, pPDESCRIPCION);
		cStmt.setObject(16, pPFINIPREST);
		cStmt.setObject(17, pPFFINPREST);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(18, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pSELSALDO, String pPIDCUENTA, java.math.BigDecimal pPCTIPCUENTA,
			java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCTIPIMP, java.math.BigDecimal pPISALDO,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPILIMITE, java.math.BigDecimal pPICAPMAX,
			String pPCMONEDA, java.math.BigDecimal pPICAPMAXPOL, java.math.BigDecimal pPICAPASE, String pPDESCRIPCION,
			java.sql.Date pPFINIPREST, java.sql.Date pPFFINPREST) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(pPNRIESGO, pSELSALDO, pPIDCUENTA, pPCTIPCUENTA, pPCTIPBAN,
				pPCTIPIMP, pPISALDO, pPPORCEN, pPILIMITE, pPICAPMAX, pPCMONEDA, pPICAPMAXPOL, pPICAPASE, pPDESCRIPCION,
				pPFINIPREST, pPFFINPREST);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_PRESTAMOSEG

	private HashMap callPAC_IAX_PRODUCCION__F_LEEGARANTIAS_ALT(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pMODALIDAD, String pCMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEGARANTIAS_ALT(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		logCall(callQuery, new String[] { "pMODALIDAD" }, new Object[] { pMODALIDAD });
		logCall(callQuery, new String[] { "pCMODO" }, new Object[] { pCMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pMODALIDAD);
		cStmt.setObject(4, pCMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS_ALT(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pMODALIDAD, String pCMODO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEGARANTIAS_ALT(pPNRIESGO, pMODALIDAD, pCMODO);
	}

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pSELGAR, java.math.BigDecimal pICAPITAL,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI,
			java.math.BigDecimal pIPRITAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARGARANTIAS(?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pNRIESGO", "pCGARANT", "pSELGAR", "pICAPITAL", "pCREVALI", "pPREVALI", "pIREVALI",
						"pIPRITAR" },
				new Object[] { pNRIESGO, pCGARANT, pSELGAR, pICAPITAL, pCREVALI, pPREVALI, pIREVALI, pIPRITAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pSELGAR);
		cStmt.setObject(5, pICAPITAL);
		cStmt.setObject(6, pCREVALI);
		cStmt.setObject(7, pPREVALI);
		cStmt.setObject(8, pIREVALI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.setObject(10, pIPRITAR);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pSELGAR, java.math.BigDecimal pICAPITAL,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI,
			java.math.BigDecimal pIPRITAR) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(pNRIESGO, pCGARANT, pSELGAR, pICAPITAL, pCREVALI,
				pPREVALI, pIREVALI, pIPRITAR);
	}

	// --START-PAC_IAX_PRODUCCION.F_GET_DOMICILI_PRENEDOR()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DOMICILI_PRENEDOR() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DOMICILI_PRENEDOR(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SITRIESGOS".toUpperCase())); // Valor de "PSITRIESGO"
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
			retVal.put("PSITRIESGO", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PSITRIESGO", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DOMICILI_PRENEDOR() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DOMICILI_PRENEDOR();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DOMICILI_PRENEDOR

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARDETGARANTIAS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pSELGAR, java.math.BigDecimal pICAPITAL,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI,
			java.math.BigDecimal pIPRITAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARDETGARANTIAS(?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pNRIESGO", "pCGARANT", "pSELGAR", "pICAPITAL", "pCREVALI", "pPREVALI", "pIREVALI",
						"pIPRITAR" },
				new Object[] { pNRIESGO, pCGARANT, pSELGAR, pICAPITAL, pCREVALI, pPREVALI, pIREVALI, pIPRITAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pSELGAR);
		cStmt.setObject(5, pICAPITAL);
		cStmt.setObject(6, pCREVALI);
		cStmt.setObject(7, pPREVALI);
		cStmt.setObject(8, pIREVALI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.setObject(10, pIPRITAR);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARDETGARANTIAS(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pSELGAR, java.math.BigDecimal pICAPITAL,
			java.math.BigDecimal pCREVALI, java.math.BigDecimal pPREVALI, java.math.BigDecimal pIREVALI,
			java.math.BigDecimal pIPRITAR) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARDETGARANTIAS(pNRIESGO, pCGARANT, pSELGAR, pICAPITAL, pCREVALI,
				pPREVALI, pIREVALI, pIPRITAR);
	}

	// --START-PAC_IAX_PRODUCCION.F_ACTUALITZARCAPITALES(NRIESGO, CGARANT, IPRITAR,
	// IPRITOT)

	private HashMap callPAC_IAX_PRODUCCION__F_ACTUALITZARCAPITALES(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pIPRITAR, java.math.BigDecimal pIPRITOT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ACTUALITZARCAPITALES(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT", "pIPRITAR", "pIPRITOT" },
				new Object[] { pNRIESGO, pCGARANT, pIPRITAR, pIPRITOT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pIPRITAR);
		cStmt.setObject(5, pIPRITOT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCAPITALES(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pIPRITAR, java.math.BigDecimal pIPRITOT)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ACTUALITZARCAPITALES(pNRIESGO, pCGARANT, pIPRITAR, pIPRITOT);
	}
	// --END-PAC_IAX_PRODUCCION.F_ACTUALITZARCAPITALES
	// --START-PAC_IAX_PRODUCCION.F_ACTUALITZARCTARMAN(NRIESGO, CGARANT, CTARMAN)

	private HashMap callPAC_IAX_PRODUCCION__F_ACTUALITZARCTARMAN(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCTARMAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ACTUALITZARCTARMAN(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT", "pCTARMAN" },
				new Object[] { pNRIESGO, pCGARANT, pCTARMAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pCTARMAN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCTARMAN(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCTARMAN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ACTUALITZARCTARMAN(pNRIESGO, pCGARANT, pCTARMAN);
	}
	// --END-PAC_IAX_PRODUCCION.F_ACTUALITZARCTARMAN

	// --START-PAC_IAX_PRODUCCION.F_SET_DESGLOSEGAR(PSSEGURO, PCGARANT, PNRIESGO,
	// PNMOVIMI, PNORDEN, PCCONCEPTO, PTDESCRIPCION, PICAPITAL)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_DESGLOSEGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCCONCEPTO, String pPTDESCRIPCION,
			java.math.BigDecimal pPICAPITAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_DESGLOSEGAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPCGARANT", "pPNRIESGO", "pPNMOVIMI", "pPNORDEN", "pPCCONCEPTO",
						"pPTDESCRIPCION", "pPICAPITAL" },
				new Object[] { pPSSEGURO, pPCGARANT, pPNRIESGO, pPNMOVIMI, pPNORDEN, pPCCONCEPTO, pPTDESCRIPCION,
						pPICAPITAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPNMOVIMI);
		cStmt.setObject(6, pPNORDEN);
		cStmt.setObject(7, pPCCONCEPTO);
		cStmt.setObject(8, pPTDESCRIPCION);
		cStmt.setObject(9, pPICAPITAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PNSEQ_OUT"
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
			retVal.put("PNSEQ_OUT", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PNSEQ_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_DESGLOSEGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCCONCEPTO, String pPTDESCRIPCION,
			java.math.BigDecimal pPICAPITAL) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_DESGLOSEGAR(pPSSEGURO, pPCGARANT, pPNRIESGO, pPNMOVIMI, pPNORDEN,
				pPCCONCEPTO, pPTDESCRIPCION, pPICAPITAL);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_DESGLOSEGAR

	// --START-PAC_IAX_PRODUCCION.F_DEL_DESGLOSEGAR(PSSEGURO, PCGARANT, PNRIESGO,
	// PNMOVIMI, PNORDEN)

	private HashMap callPAC_IAX_PRODUCCION__F_DEL_DESGLOSEGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_DEL_DESGLOSEGAR(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCGARANT", "pPNRIESGO", "pPNMOVIMI", "pPNORDEN" },
				new Object[] { pPSSEGURO, pPCGARANT, pPNRIESGO, pPNMOVIMI, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPNMOVIMI);
		cStmt.setObject(6, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_DEL_DESGLOSEGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_DEL_DESGLOSEGAR(pPSSEGURO, pPCGARANT, pPNRIESGO, pPNMOVIMI, pPNORDEN);
	}
	// --END-PAC_IAX_PRODUCCION.F_DEL_DESGLOSEGAR
	// --START-PAC_IAX_PRODUCCION.F_GET_GARANTIAS_BD(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BD(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_GARANTIAS_BD(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BD(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BD(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_GARANTIAS_BD
	//////////
	// --START-PAC_IAX_PRODUCCION.F_ALTAREGLASSEG(PNRIESGO, PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_ALTAREGLASSEG(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ALTAREGLASSEG(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCGARANT" }, new Object[] { pPNRIESGO, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ALTAREGLASSEG(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ALTAREGLASSEG(pPNRIESGO, pPCGARANT);
	}
	// --END-PAC_IAX_PRODUCCION.F_ALTAREGLASSEG
	// --START-PAC_IAX_PRODUCCION.F_ALTAREGLASSEGTRAMOS(PNUMBLOQ)

	private HashMap callPAC_IAX_PRODUCCION__F_ALTAREGLASSEGTRAMOS(java.math.BigDecimal pPNUMBLOQ) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ALTAREGLASSEGTRAMOS(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMBLOQ" }, new Object[] { pPNUMBLOQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMBLOQ);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ALTAREGLASSEGTRAMOS(java.math.BigDecimal pPNUMBLOQ) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ALTAREGLASSEGTRAMOS(pPNUMBLOQ);
	}
	// --END-PAC_IAX_PRODUCCION.F_ALTAREGLASSEGTRAMOS
	// --START-PAC_IAX_PRODUCCION.F_GRABARDATOSREGLASSEG(PCAPMAXEMP, PCAPMINEMP,
	// PCAPMAXTRA, PCAPMINTRA)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEG(java.math.BigDecimal pPCAPMAXEMP,
			java.math.BigDecimal pPCAPMINEMP, java.math.BigDecimal pPCAPMAXTRA, java.math.BigDecimal pPCAPMINTRA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARDATOSREGLASSEG(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAPMAXEMP", "pPCAPMINEMP", "pPCAPMAXTRA", "pPCAPMINTRA" },
				new Object[] { pPCAPMAXEMP, pPCAPMINEMP, pPCAPMAXTRA, pPCAPMINTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAPMAXEMP);
		cStmt.setObject(3, pPCAPMINEMP);
		cStmt.setObject(4, pPCAPMAXTRA);
		cStmt.setObject(5, pPCAPMINTRA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEG(java.math.BigDecimal pPCAPMAXEMP,
			java.math.BigDecimal pPCAPMINEMP, java.math.BigDecimal pPCAPMAXTRA, java.math.BigDecimal pPCAPMINTRA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEG(pPCAPMAXEMP, pPCAPMINEMP, pPCAPMAXTRA, pPCAPMINTRA);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARDATOSREGLASSEG
	// --START-PAC_IAX_PRODUCCION.F_GRABARDATOSREGLASSEGTRAMOS(PNUMBLOQ, PEDADINI,
	// PEDADFIN, PT1EMP, PT1TRAB, PT2EMP, PT2TRAB, PT3EMP, PT3TRAB, PT4EMP, PT4TRAB)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEGTRAMOS(java.math.BigDecimal pPNUMBLOQ,
			java.math.BigDecimal pPEDADINI, java.math.BigDecimal pPEDADFIN, java.math.BigDecimal pPT1EMP,
			java.math.BigDecimal pPT1TRAB, java.math.BigDecimal pPT2EMP, java.math.BigDecimal pPT2TRAB,
			java.math.BigDecimal pPT3EMP, java.math.BigDecimal pPT3TRAB, java.math.BigDecimal pPT4EMP,
			java.math.BigDecimal pPT4TRAB) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARDATOSREGLASSEGTRAMOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNUMBLOQ", "pPEDADINI", "pPEDADFIN", "pPT1EMP", "pPT1TRAB", "pPT2EMP", "pPT2TRAB",
						"pPT3EMP", "pPT3TRAB", "pPT4EMP", "pPT4TRAB" },
				new Object[] { pPNUMBLOQ, pPEDADINI, pPEDADFIN, pPT1EMP, pPT1TRAB, pPT2EMP, pPT2TRAB, pPT3EMP, pPT3TRAB,
						pPT4EMP, pPT4TRAB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMBLOQ);
		cStmt.setObject(3, pPEDADINI);
		cStmt.setObject(4, pPEDADFIN);
		cStmt.setObject(5, pPT1EMP);
		cStmt.setObject(6, pPT1TRAB);
		cStmt.setObject(7, pPT2EMP);
		cStmt.setObject(8, pPT2TRAB);
		cStmt.setObject(9, pPT3EMP);
		cStmt.setObject(10, pPT3TRAB);
		cStmt.setObject(11, pPT4EMP);
		cStmt.setObject(12, pPT4TRAB);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEGTRAMOS(java.math.BigDecimal pPNUMBLOQ,
			java.math.BigDecimal pPEDADINI, java.math.BigDecimal pPEDADFIN, java.math.BigDecimal pPT1EMP,
			java.math.BigDecimal pPT1TRAB, java.math.BigDecimal pPT2EMP, java.math.BigDecimal pPT2TRAB,
			java.math.BigDecimal pPT3EMP, java.math.BigDecimal pPT3TRAB, java.math.BigDecimal pPT4EMP,
			java.math.BigDecimal pPT4TRAB) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEGTRAMOS(pPNUMBLOQ, pPEDADINI, pPEDADFIN, pPT1EMP,
				pPT1TRAB, pPT2EMP, pPT2TRAB, pPT3EMP, pPT3TRAB, pPT4EMP, pPT4TRAB);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARDATOSREGLASSEGTRAMOS
	// --START-PAC_IAX_PRODUCCION.F_LEEDATOSREGLASSEG()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEDATOSREGLASSEG() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDATOSREGLASSEG(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_REGLASSEG".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSREGLASSEG() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDATOSREGLASSEG();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDATOSREGLASSEG
	// --START-PAC_IAX_PRODUCCION.F_LEEDATOSREGLASSEGTRAMOS()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEDATOSREGLASSEGTRAMOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDATOSREGLASSEGTRAMOS(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_REGLASSEGTRAMOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSREGLASSEGTRAMOS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDATOSREGLASSEGTRAMOS();
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDATOSREGLASSEGTRAMOS

	// --START-PAC_IAX_PRODUCCION.F_GETCLAUSULAPARAM(SCLAGEN)

	private HashMap callPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAM(java.math.BigDecimal pSCLAGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GETCLAUSULAPARAM(?, ?)}";

		logCall(callQuery, new String[] { "pSCLAGEN" }, new Object[] { pSCLAGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLAGEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAXPAR_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAM(java.math.BigDecimal pSCLAGEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAM(pSCLAGEN);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEECLAUSULA
	// --START-PAC_IAX_PRODUCCION.F_GRABACLAUSULA(SCLAGEN, NPARAME, TCLAGEN)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABACLAUSULA(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pNPARAME, String pTCLAGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABACLAUSULA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSCLAGEN", "pNPARAME", "pTCLAGEN" },
				new Object[] { pSCLAGEN, pNPARAME, pTCLAGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLAGEN);
		cStmt.setObject(3, pNPARAME);
		cStmt.setObject(4, pTCLAGEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULA(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pNPARAME, String pTCLAGEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABACLAUSULA(pSCLAGEN, pNPARAME, pTCLAGEN);
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABACLAUSULA
	// --START-PAC_IAX_PRODUCCION.F_LEECLAUSULAPROD(PSCLAGEN)

	private HashMap callPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(java.math.BigDecimal pPSCLAGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEECLAUSULAPROD(?, ?)}";

		logCall(callQuery, new String[] { "pPSCLAGEN" }, new Object[] { pPSCLAGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAGEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(java.math.BigDecimal pPSCLAGEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(pPSCLAGEN);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEECLAUSULAPROD

	// --START-PAC_IAX_PRODUCCION.F_DELCLAUSULAPROD(PSCLAGEN)

	private HashMap callPAC_IAX_PRODUCCION__F_DELCLAUSULAPROD(java.math.BigDecimal pPSCLAGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_DELCLAUSULAPROD(?, ?)}";

		logCall(callQuery, new String[] { "pPSCLAGEN" }, new Object[] { pPSCLAGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAGEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_DELCLAUSULAPROD(java.math.BigDecimal pPSCLAGEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_DELCLAUSULAPROD(pPSCLAGEN);
	}
	// --END-PAC_IAX_PRODUCCION.F_DELCLAUSULAPROD

	// --START-PAC_IAX_PRODUCCION.F_CREARPROPUESTA(PSSEGURO, PSPRODUCESP)

	private HashMap callPAC_IAX_PRODUCCION__F_CREARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUCESP) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CREARPROPUESTA(?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPSPRODUCESP" }, new Object[] { pPSSEGURO, pPSPRODUCESP });

		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();

		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPRODUCESP);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "OSSEGURO"
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
			retVal.put("OSSEGURO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("OSSEGURO", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUCESP) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CREARPROPUESTA(pPSSEGURO, pPSPRODUCESP);
	}
	// --END-PAC_IAX_PRODUCCION.F_CREARPROPUESTA
	// --START-PAC_IAX_PRODUCCION.F_GRABARCOMISIONES(PCTIPCOM)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARCOMISIONES(java.math.BigDecimal pPCTIPCOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARCOMISIONES(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPCOM" }, new Object[] { pPCTIPCOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPCOM);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARCOMISIONES(java.math.BigDecimal pPCTIPCOM) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARCOMISIONES(pPCTIPCOM);
	}

	// --START-PAC_IAX_PRODUCCION.F_URL_PRODEXTERNO(PPRODUCTO, PTIPO, PIDPOLIZA)

	private HashMap callPAC_IAX_PRODUCCION__F_URL_PRODEXTERNO(java.math.BigDecimal pPPRODUCTO, String pPTIPO,
			String pPIDPOLIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_URL_PRODEXTERNO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPRODUCTO", "pPTIPO", "pPIDPOLIZA" },
				new Object[] { pPPRODUCTO, pPTIPO, pPIDPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPRODUCTO);
		cStmt.setObject(3, pPTIPO);
		cStmt.setObject(4, pPIDPOLIZA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PURL"
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
			retVal.put("PURL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PURL", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_URL_PRODEXTERNO(java.math.BigDecimal pPPRODUCTO, String pPTIPO,
			String pPIDPOLIZA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_URL_PRODEXTERNO(pPPRODUCTO, pPTIPO, pPIDPOLIZA);
	}
	// --END-PAC_IAX_PRODUCCION.F_URL_PRODEXTERNO

	// --START-PAC_IAX_PRODUCCION.F_SET_NRENOVA(PFEFECTO)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_NRENOVA(java.sql.Date pPFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_NRENOVA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFEFECTO" }, new Object[] { pPFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFEFECTO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNRENOVA"
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
			retVal.put("PNRENOVA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNRENOVA", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_NRENOVA(java.sql.Date pPFEFECTO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_NRENOVA(pPFEFECTO);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_NRENOVA

	// --START-PAC_IAX_PRODUCCION.F_GRABARDATOSGESTION(PFEFECTO, PCDURACI, PNDURACI,
	// PFVENCIM, PCFORPAG, PCTIPCOB, PPOLISSA_INI, PCTIPCOM, PDTOCOM, PCIDIOMA,
	// PCPOLCIA, PCBANCAR, PCSUBAGE, PNDURPER, PPCAPFALL, PPDOSCAB, PCFORPAGREN,
	// PNDURCOB, PCRECFRA, PCAGENTE, PINTTEC, PFPPREN, PCFPREST, PNRENOVA, PCCOBBAN,
	// PCPROMOTOR)

	/*
	 * private HashMap callPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(java.sql.Date
	 * pPFEFECTO, java.math.BigDecimal pPCDURACI, java.math.BigDecimal pPNDURACI,
	 * java.sql.Date pPFVENCIM, java.math.BigDecimal pPCFORPAG, java.math.BigDecimal
	 * pPCTIPCOB, String pPPOLISSA_INI, java.math.BigDecimal pPCTIPCOM,
	 * java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPCIDIOMA, String
	 * pPCPOLCIA, String pPCBANCAR, java.math.BigDecimal pPCSUBAGE,
	 * java.math.BigDecimal pPNDURPER, java.math.BigDecimal pPPCAPFALL,
	 * java.math.BigDecimal pPPDOSCAB, java.math.BigDecimal pPCFORPAGREN,
	 * java.math.BigDecimal pPNDURCOB, java.math.BigDecimal pPCRECFRA,
	 * java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPINTTEC, java.sql.Date
	 * pPFPPREN, java.math.BigDecimal pPCFPREST, java.math.BigDecimal pPNRENOVA,
	 * java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCPROMOTOR) throws
	 * Exception { String
	 * callQuery="{?=call PAC_IAX_PRODUCCION.F_GRABARDATOSGESTION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] { "pPFEFECTO", "pPCDURACI", "pPNDURACI",
	 * "pPFVENCIM", "pPCFORPAG", "pPCTIPCOB", "pPPOLISSA_INI", "pPCTIPCOM",
	 * "pPDTOCOM", "pPCIDIOMA", "pPCPOLCIA", "pPCBANCAR", "pPCSUBAGE", "pPNDURPER",
	 * "pPPCAPFALL", "pPPDOSCAB", "pPCFORPAGREN", "pPNDURCOB", "pPCRECFRA",
	 * "pPCAGENTE", "pPINTTEC", "pPFPPREN", "pPCFPREST", "pPNRENOVA", "pPCCOBBAN",
	 * "pPCPROMOTOR" }, new Object[] { pPFEFECTO, pPCDURACI, pPNDURACI, pPFVENCIM,
	 * pPCFORPAG, pPCTIPCOB, pPPOLISSA_INI, pPCTIPCOM, pPDTOCOM, pPCIDIOMA,
	 * pPCPOLCIA, pPCBANCAR, pPCSUBAGE, pPNDURPER, pPPCAPFALL, pPPDOSCAB,
	 * pPCFORPAGREN, pPNDURCOB, pPCRECFRA, pPCAGENTE, pPINTTEC, pPFPPREN, pPCFPREST,
	 * pPNRENOVA, pPCCOBBAN, pPCPROMOTOR }); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPFEFECTO); cStmt.setObject(3, pPCDURACI); cStmt.setObject(4, pPNDURACI);
	 * cStmt.setObject(5, pPFVENCIM); cStmt.setObject(6, pPCFORPAG);
	 * cStmt.setObject(7, pPCTIPCOB); cStmt.setObject(8, pPPOLISSA_INI);
	 * cStmt.setObject(9, pPCTIPCOM); cStmt.setObject(10, pPDTOCOM);
	 * cStmt.setObject(11, pPCIDIOMA); cStmt.setObject(12, pPCPOLCIA);
	 * cStmt.setObject(14, pPCBANCAR); cStmt.setObject(15, pPCSUBAGE);
	 * cStmt.setObject(16, pPNDURPER); cStmt.setObject(17, pPPCAPFALL);
	 * cStmt.setObject(18, pPPDOSCAB); cStmt.setObject(19, pPCFORPAGREN);
	 * cStmt.setObject(20, pPNDURCOB); cStmt.setObject(21, pPCRECFRA);
	 * cStmt.setObject(22, pPCAGENTE); cStmt.setObject(23, pPINTTEC);
	 * cStmt.setObject(24, pPFPPREN); cStmt.setObject(25, pPCFPREST);
	 * cStmt.setObject(26, pPNRENOVA); cStmt.setObject(27, pPCCOBBAN);
	 * cStmt.setObject(28, pPCPROMOTOR); cStmt.registerOutParameter(1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(13,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal=new HashMap(); try { retVal.put("RETURN", cStmt.getObject(1));
	 * } catch (SQLException e) { retVal.put("RETURN", null); } try {
	 * retVal.put("MENSAJES", cStmt.getObject(13)); } catch (SQLException e) {
	 * retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
	 * cStmt.close(); //AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(java.sql.Date
	 * pPFEFECTO, java.math.BigDecimal pPCDURACI, java.math.BigDecimal pPNDURACI,
	 * java.sql.Date pPFVENCIM, java.math.BigDecimal pPCFORPAG, java.math.BigDecimal
	 * pPCTIPCOB, String pPPOLISSA_INI, java.math.BigDecimal pPCTIPCOM,
	 * java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPCIDIOMA, String
	 * pPCPOLCIA, String pPCBANCAR, java.math.BigDecimal pPCSUBAGE,
	 * java.math.BigDecimal pPNDURPER, java.math.BigDecimal pPPCAPFALL,
	 * java.math.BigDecimal pPPDOSCAB, java.math.BigDecimal pPCFORPAGREN,
	 * java.math.BigDecimal pPNDURCOB, java.math.BigDecimal pPCRECFRA,
	 * java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPINTTEC, java.sql.Date
	 * pPFPPREN, java.math.BigDecimal pPCFPREST, java.math.BigDecimal pPNRENOVA,
	 * java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCPROMOTOR) throws
	 * Exception { return
	 * this.callPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(pPFEFECTO, pPCDURACI,
	 * pPNDURACI, pPFVENCIM, pPCFORPAG, pPCTIPCOB, pPPOLISSA_INI, pPCTIPCOM,
	 * pPDTOCOM, pPCIDIOMA, pPCPOLCIA, pPCBANCAR, pPCSUBAGE, pPNDURPER, pPPCAPFALL,
	 * pPPDOSCAB, pPCFORPAGREN, pPNDURCOB, pPCRECFRA, pPCAGENTE, pPINTTEC, pPFPPREN,
	 * pPCFPREST, pPNRENOVA, pPCCOBBAN, pPCPROMOTOR); }
	 * //--END-PAC_IAX_PRODUCCION.F_GRABARDATOSGESTION
	 * 
	 */
	// --START-PAC_IAX_PRODUCCION.F_GET_DATOSGESTION()

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DATOSGESTION() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DATOSGESTION(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DETPOLIZA".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DATOSGESTION() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DATOSGESTION();
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DATOSGESTION
	// INI Bug: 18351 LCOL003 - Documentaci�n requerida en contrataci�n y
	// suplementos
	// --START-PAC_IAX_PRODUCCION.F_LEEDOCREQUERIDA(PSPRODUC, PSSEGURO, PCACTIVI,
	// PNMOVIMI)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDOCREQUERIDA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPSSEGURO", "pPCACTIVI", "pPNMOVIMI" },
				new Object[] { pPSPRODUC, pPSSEGURO, pPCACTIVI, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DOCREQUERIDA".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(pPSPRODUC, pPSSEGURO, pPCACTIVI, pPNMOVIMI);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDOCREQUERIDA

	// FI Bug: 18351 LCOL003 - Documentaci�n requerida en contrataci�n y suplementos

	// --START-PAC_IAX_PRODUCCION.F_GRABARDOCREQUERIDA(PSEQDOCU, PSPRODUC, PSSEGURO,
	// PCACTIVI, PNMOVIMI, PNRIESGO, PNINQAVAL, PCDOCUME, PCTIPDOC, PCCLASE,
	// PNORDEN, PTDESCRIP, PTFILENAME, PADJUNTADO, PSPERSON, PCTIPBEN)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(java.math.BigDecimal pPSEQDOCU,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNINQAVAL,
			java.math.BigDecimal pPCDOCUME, java.math.BigDecimal pPCTIPDOC, java.math.BigDecimal pPCCLASE,
			java.math.BigDecimal pPNORDEN, String pPTDESCRIP, String pPTFILENAME, java.math.BigDecimal pPADJUNTADO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPBEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARDOCREQUERIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSEQDOCU", "pPSPRODUC", "pPSSEGURO", "pPCACTIVI", "pPNMOVIMI", "pPNRIESGO",
						"pPNINQAVAL", "pPCDOCUME", "pPCTIPDOC", "pPCCLASE", "pPNORDEN", "pPTDESCRIP", "pPTFILENAME",
						"pPADJUNTADO", "pPSPERSON", "pPCTIPBEN" },
				new Object[] { pPSEQDOCU, pPSPRODUC, pPSSEGURO, pPCACTIVI, pPNMOVIMI, pPNRIESGO, pPNINQAVAL, pPCDOCUME,
						pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO, pPSPERSON, pPCTIPBEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSEQDOCU);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPNMOVIMI);
		cStmt.setObject(7, pPNRIESGO);
		cStmt.setObject(8, pPNINQAVAL);
		cStmt.setObject(9, pPCDOCUME);
		cStmt.setObject(10, pPCTIPDOC);
		cStmt.setObject(11, pPCCLASE);
		cStmt.setObject(12, pPNORDEN);
		cStmt.setObject(13, pPTDESCRIP);
		cStmt.setObject(14, pPTFILENAME);
		cStmt.setObject(15, pPADJUNTADO);
		cStmt.setObject(16, pPSPERSON);
		cStmt.setObject(17, pPCTIPBEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(18, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(java.math.BigDecimal pPSEQDOCU,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNINQAVAL,
			java.math.BigDecimal pPCDOCUME, java.math.BigDecimal pPCTIPDOC, java.math.BigDecimal pPCCLASE,
			java.math.BigDecimal pPNORDEN, String pPTDESCRIP, String pPTFILENAME, java.math.BigDecimal pPADJUNTADO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPBEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU, pPSPRODUC, pPSSEGURO, pPCACTIVI, pPNMOVIMI,
				pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO,
				pPSPERSON, pPCTIPBEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARDOCREQUERIDA

	// --START-PAC_IAX_PRODUCCION.F_GET_DATOS_HOST(PORIGEN)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DATOS_HOST(String pPORIGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DATOS_HOST(?, ?)}";

		logCall(callQuery, new String[] { "pPORIGEN" }, new Object[] { pPORIGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPORIGEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DATOS_HOST(String pPORIGEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DATOS_HOST(pPORIGEN);
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DATOS_HOST

	// --START-PAC_IAX_PRODUCCION.F_CREARPROPUESTA_REEMP(PSSEGUROS, PMODE,
	// PPRODUCTO, PCAGENTE, PMODOPANT)

	private HashMap callPAC_IAX_PRODUCCION__F_CREARPROPUESTA_REEMP(String pPSSEGUROS, String pPMODE,
			java.math.BigDecimal pPPRODUCTO, java.math.BigDecimal pPCAGENTE, String pPMODOPANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CREARPROPUESTA_REEMP(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGUROS", "pPMODE", "pPPRODUCTO", "pPCAGENTE", "pPMODOPANT" },
				new Object[] { pPSSEGUROS, pPMODE, pPPRODUCTO, pPCAGENTE, pPMODOPANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGUROS);
		cStmt.setObject(3, pPMODE);
		cStmt.setObject(4, pPPRODUCTO);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPMODOPANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PSSOLICIT"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "PURL"
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
			retVal.put("PSSOLICIT", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PSSOLICIT", null);
		}
		try {
			retVal.put("PURL", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PURL", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA_REEMP(String pPSSEGUROS, String pPMODE,
			java.math.BigDecimal pPPRODUCTO, java.math.BigDecimal pPCAGENTE, String pPMODOPANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CREARPROPUESTA_REEMP(pPSSEGUROS, pPMODE, pPPRODUCTO, pPCAGENTE,
				pPMODOPANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_CREARPROPUESTA_REEMP

	// --START-PAC_IAX_PRODUCCION.F_GET_DETALLERIESGOPERSONAL(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DETALLERIESGOPERSONAL(java.math.BigDecimal pPNRIESGO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DETALLERIESGOPERSONAL(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PERSONAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLERIESGOPERSONAL(java.math.BigDecimal pPNRIESGO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DETALLERIESGOPERSONAL(pPNRIESGO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DETALLERIESGOPERSONAL

	// --START-PAC_IAX_PRODUCCION.F_GET_BENEIDENT_TIT(PNRIESGO, PSPERSON, PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_BENEIDENT_TIT(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_BENEIDENT_TIT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPSPERSON", "pPCGARANT" },
				new Object[] { pPNRIESGO, pPSPERSON, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_BENEIDENTIFICADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_TIT(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_BENEIDENT_TIT(pPNRIESGO, pPSPERSON, pPCGARANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_BENEIDENT_TIT

	// --START-PAC_IAX_PRODUCCION.F_GET_BENEIDENT_G(PNRIESGO, PNORDEN, PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_BENEIDENT_G(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN", "pPCGARANT" },
				new Object[] { pPNRIESGO, pPNORDEN, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BENEIDENTIFICADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_BENEIDENT_G(pPNRIESGO, pPNORDEN, pPCGARANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_BENEIDENT_G
	// --START-PAC_IAX_PRODUCCION.F_GET_BENEIDENT_R(PNRIESGO, PNORDEN)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_BENEIDENT_R(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN" }, new Object[] { pPNRIESGO, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BENEIDENTIFICADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_BENEIDENT_R(pPNRIESGO, pPNORDEN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_BENEIDENT_R

	// --START-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_G(PNRIESGO, PNORDEN, PSPERSON_TIT,
	// PCTIPBEN, PCPAREN, PPPARTICIP, PCGARANT, PCESTADO, PCTIPCON)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPCON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_BENEIDENT_G(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPNORDEN", "pPSPERSON_TIT", "pPCTIPBEN", "pPCPAREN", "pPPPARTICIP",
						"pPCGARANT", "pPCESTADO", "pPCTIPCON" },
				new Object[] { pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN, pPPPARTICIP, pPCGARANT,
						pPCESTADO, pPCTIPCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPSPERSON_TIT);
		cStmt.setObject(5, pPCTIPBEN);
		cStmt.setObject(6, pPCPAREN);
		cStmt.setObject(7, pPPPARTICIP);
		cStmt.setObject(8, pPCGARANT);
		cStmt.setObject(9, pPCESTADO);
		cStmt.setObject(10, pPCTIPCON);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPCON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_G(pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN,
				pPPPARTICIP, pPCGARANT, pPCESTADO, pPCTIPCON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_G

	// --START-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_R(PNRIESGO, PNORDEN, PSPERSON_TIT,
	// PCTIPBEN, PCPAREN, PPPARTICIP, PCESTADO, PCTIPCON)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCTIPCON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_BENEIDENT_R(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPNORDEN", "pPSPERSON_TIT", "pPCTIPBEN", "pPCPAREN", "pPPPARTICIP",
						"pPCESTADO", "pPCTIPCON" },
				new Object[] { pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN, pPPPARTICIP, pPCESTADO,
						pPCTIPCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPSPERSON_TIT);
		cStmt.setObject(5, pPCTIPBEN);
		cStmt.setObject(6, pPCPAREN);
		cStmt.setObject(7, pPPPARTICIP);
		cStmt.setObject(8, pPCESTADO);
		cStmt.setObject(9, pPCTIPCON);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCTIPCON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_R(pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN,
				pPPPARTICIP, pPCESTADO, pPCTIPCON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_R

	// --START-PAC_IAX_PRODUCCION.F_ELIMINAR_BENEIDENT_G(PNRIESGO, PNORDEN,
	// PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINAR_BENEIDENT_G(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN", "pPCGARANT" },
				new Object[] { pPNRIESGO, pPNORDEN, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_G(pPNRIESGO, pPNORDEN, pPCGARANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINAR_BENEIDENT_G
	// --START-PAC_IAX_PRODUCCION.F_ELIMINAR_BENEIDENT_R(PNRIESGO, PNORDEN)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINAR_BENEIDENT_R(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN" }, new Object[] { pPNRIESGO, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_R(pPNRIESGO, pPNORDEN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINAR_BENEIDENT_R
	// --START-PAC_IAX_PRODUCCION.F_ELIMINAR_GAR_BENEIDENT(PNRIESGO, PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINAR_GAR_BENEIDENT(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINAR_GAR_BENEIDENT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCGARANT" }, new Object[] { pPNRIESGO, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_GAR_BENEIDENT(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINAR_GAR_BENEIDENT(pPNRIESGO, pPCGARANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINAR_GAR_BENEIDENT

	// --START-PAC_IAX_PRODUCCION.F_INSERT_BENEIDENT_G(PNRIESGO, PCGARANT, PSPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERT_BENEIDENT_G(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCGARANT", "pPSPERSON" },
				new Object[] { pPNRIESGO, pPCGARANT, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PNORDEN"
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
			retVal.put("PNORDEN", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PNORDEN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_G(pPNRIESGO, pPCGARANT, pPSPERSON); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INSERT_BENEIDENT_G
	// --START-PAC_IAX_PRODUCCION.F_INSERT_BENEIDENT_R(PNRIESGO, PSPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERT_BENEIDENT_R(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPSPERSON" }, new Object[] { pPNRIESGO, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNORDEN"
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
			retVal.put("PNORDEN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNORDEN", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_R(pPNRIESGO, pPSPERSON); // AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_INSERT_BENEIDENT_R
	// --START-PAC_IAX_PRODUCCION.F_INSERT_BENESP_GAR(PNRIESGO, PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_INSERT_BENESP_GAR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERT_BENESP_GAR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCGARANT" }, new Object[] { pPNRIESGO, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENESP_GAR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERT_BENESP_GAR(pPNRIESGO, pPCGARANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INSERT_BENESP_GAR
	// --START-PAC_IAX_PRODUCCION.F_GET_GARANTIAS_BENIDGAR(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BENIDGAR(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_GARANTIAS_BENIDGAR(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BENIDGAR(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BENIDGAR(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_GARANTIAS_BENIDGAR
	// --START-PAC_IAX_PRODUCCION.F_CREAR_FACUL(PSSEGURO, PNMOVIMI)

	private HashMap callPAC_IAX_PRODUCCION__F_CREAR_FACUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CREAR_FACUL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CREAR_FACUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CREAR_FACUL(pPSSEGURO, pPNMOVIMI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_CREAR_FACUL

	// --START-PAC_IAX_PRODUCCION.F_COMPROBAR_BENIDGAR(PSSEGURO, PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_COMPROBAR_BENIDGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_COMPROBAR_BENIDGAR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_COMPROBAR_BENIDGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_COMPROBAR_BENIDGAR(pPSSEGURO, pPNRIESGO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_COMPROBAR_BENIDGAR

	// --START-PAC_IAX_PRODUCCION.F_LEECORRETAJE() // INI -IAXIS-10627 -21/01/2020.
	// Se adiciona el paar�metro pPNOMIVI

	private HashMap callPAC_IAX_PRODUCCION__F_LEECORRETAJE(java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEECORRETAJE(?,?)}";

		logCall(callQuery, new String[] { "pPNMOVIMI" }, new Object[] { pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CORRETAJE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEECORRETAJE(java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEECORRETAJE(pPNMOVIMI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEECORRETAJE // FIN -IAXIS-10627 -21/01/2020. Se
	// adiciona el paar�metro pPNOMIVI

	// --START-PAC_IAX_PRODUCCION.F_MODIFCORRETAJE(PCAGENTE, PCOMISI, PPARTICI,
	// ISLIDER, PNORDAGE)

	private HashMap callPAC_IAX_PRODUCCION__F_MODIFCORRETAJE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPPARTICI, java.math.BigDecimal pISLIDER,
			java.math.BigDecimal pPNORDAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_MODIFCORRETAJE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCOMISI", "pPPARTICI", "pISLIDER", "pPNORDAGE" },
				new Object[] { pPCAGENTE, pPCOMISI, pPPARTICI, pISLIDER, pPNORDAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCOMISI);
		cStmt.setObject(4, pPPARTICI);
		cStmt.setObject(5, pISLIDER);
		cStmt.setObject(6, pPNORDAGE);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_MODIFCORRETAJE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPPARTICI, java.math.BigDecimal pISLIDER,
			java.math.BigDecimal pPNORDAGE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_MODIFCORRETAJE(pPCAGENTE, pPCOMISI, pPPARTICI, pISLIDER, pPNORDAGE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_MODIFCORRETAJE

	// --START-PAC_IAX_PRODUCCION.F_GRABACORRETAJE(PCAGENTE, PCOMISI, PPARTICI,
	// ISLIDER)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABACORRETAJE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPPARTICI, java.math.BigDecimal pISLIDER)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABACORRETAJE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCOMISI", "pPPARTICI", "pISLIDER" },
				new Object[] { pPCAGENTE, pPCOMISI, pPPARTICI, pISLIDER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCOMISI);
		cStmt.setObject(4, pPPARTICI);
		cStmt.setObject(5, pISLIDER);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABACORRETAJE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPPARTICI, java.math.BigDecimal pISLIDER)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABACORRETAJE(pPCAGENTE, pPCOMISI, pPPARTICI, pISLIDER); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABACORRETAJE

	// --START-PAC_IAX_PRODUCCION.F_ELIMINACORRETAJE(PNORDAGE)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINACORRETAJE(java.math.BigDecimal pPNORDAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINACORRETAJE(?, ?)}";

		logCall(callQuery, new String[] { "pPNORDAGE" }, new Object[] { pPNORDAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNORDAGE);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINACORRETAJE(java.math.BigDecimal pPNORDAGE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINACORRETAJE(pPNORDAGE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINACORRETAJE

	// --START-PAC_IAX_PRODUCCION.F_GET_CORRETAJE(PCAGENTE)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CORRETAJE(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CORRETAJE(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CORRETAJE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CORRETAJE(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CORRETAJE(pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CORRETAJE
	// --START-PAC_IAX_PRODUCCION.F_GRABAGESTIONCOMISION(CMODCOM, PCOMISI, PNINIALT,
	// PNFINALT)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION(java.math.BigDecimal pCMODCOM,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABAGESTIONCOMISION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCMODCOM", "pPCOMISI", "pPNINIALT", "pPNFINALT" },
				new Object[] { pCMODCOM, pPCOMISI, pPNINIALT, pPNFINALT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCMODCOM);
		cStmt.setObject(3, pPCOMISI);
		cStmt.setObject(4, pPNINIALT);
		cStmt.setObject(5, pPNFINALT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION(java.math.BigDecimal pCMODCOM,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION(pCMODCOM, pPCOMISI, pPNINIALT, pPNFINALT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABAGESTIONCOMISION
	// --START-PAC_IAX_PRODUCCION.F_CREARPROPUESTA_SP(PSSEGURO, PIPRIMA_NP,
	// PICAPFALL_NP, PFVENCIM_NP, PMODE, PFECHA)

	private HashMap callPAC_IAX_PRODUCCION__F_CREARPROPUESTA_SP(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPIPRIMA_NP, java.math.BigDecimal pPICAPFALL_NP, java.sql.Date pPFVENCIM_NP,
			String pPMODE, java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CREARPROPUESTA_SP(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPIPRIMA_NP", "pPICAPFALL_NP", "pPFVENCIM_NP", "pPMODE", "pPFECHA" },
				new Object[] { pPSSEGURO, pPIPRIMA_NP, pPICAPFALL_NP, pPFVENCIM_NP, pPMODE, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPIPRIMA_NP);
		cStmt.setObject(4, pPICAPFALL_NP);
		cStmt.setObject(5, pPFVENCIM_NP);
		cStmt.setObject(6, pPMODE);
		cStmt.setObject(7, pPFECHA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PSSOLICIT"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "PURL"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSA"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSSOLICIT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PSSOLICIT", null);
		}
		try {
			retVal.put("PURL", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PURL", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA_SP(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPIPRIMA_NP, java.math.BigDecimal pPICAPFALL_NP, java.sql.Date pPFVENCIM_NP,
			String pPMODE, java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CREARPROPUESTA_SP(pPSSEGURO, pPIPRIMA_NP, pPICAPFALL_NP, pPFVENCIM_NP,
				pPMODE, pPFECHA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_CREARPROPUESTA_SP

	// --START-PAC_IAX_PRODUCCION.F_GET_TARJETA(PCTIPBAN)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_TARJETA(java.math.BigDecimal pPCTIPBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_TARJETA(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPBAN" }, new Object[] { pPCTIPBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPBAN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_TARJETA(java.math.BigDecimal pPCTIPBAN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_TARJETA(pPCTIPBAN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_TARJETA

	// --START-PAC_IAX_PRODUCCION.F_GRABAPREGUNTASCLAUSULA()

	private HashMap callPAC_IAX_PRODUCCION__F_GRABAPREGUNTASCLAUSULA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABAPREGUNTASCLAUSULA(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABAPREGUNTASCLAUSULA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABAPREGUNTASCLAUSULA(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABAPREGUNTASCLAUSULA

	// --START-PAC_IAX_PRODUCCION.F_ELIMINAGESCOBRO(P_SPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINAGESCOBRO(java.math.BigDecimal pP_SPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINAGESCOBRO(?, ?)}";

		logCall(callQuery, new String[] { "pP_SPERSON" }, new Object[] { pP_SPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPERSON);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINAGESCOBRO(java.math.BigDecimal pP_SPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINAGESCOBRO(pP_SPERSON); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINAGESCOBRO

	// --START-PAC_IAX_PRODUCCION.F_GRABARGESCOBRO(P_SPERSON, P_CDOMICI)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARGESCOBRO(java.math.BigDecimal pP_SPERSON,
			java.math.BigDecimal pP_CDOMICI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARGESCOBRO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPERSON", "pP_CDOMICI" }, new Object[] { pP_SPERSON, pP_CDOMICI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPERSON);
		cStmt.setObject(3, pP_CDOMICI);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARGESCOBRO(java.math.BigDecimal pP_SPERSON,
			java.math.BigDecimal pP_CDOMICI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARGESCOBRO(pP_SPERSON, pP_CDOMICI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARGESCOBRO
	// --START-PAC_IAX_PRODUCCION.F_LEEGESCOBRO()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEGESCOBRO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEGESCOBRO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GESCOBROS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEGESCOBRO() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEGESCOBRO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEGESCOBRO

	// --START-PAC_IAX_PRODUCCION.F_GET_GESTORCOBRO(SPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_GESTORCOBRO(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_GESTORCOBRO(?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GESCOBROS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_GESTORCOBRO(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_GESTORCOBRO(pSPERSON); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_GESTORCOBRO
	// ETM 21657 *************** --INI
	// --START-PAC_IAX_PRODUCCION.F_SET_PDTOCOM_RIESGOGARAN(PSSEGURO, PNRIESGO,
	// PDTOCOM, PDIFERENCIA)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_PDTOCOM_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_PDTOCOM_RIESGOGARAN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPDTOCOM", "pPDIFERENCIA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPDTOCOM, pPDIFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPDTOCOM);
		cStmt.setObject(5, pPDIFERENCIA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_PDTOCOM_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_PDTOCOM_RIESGOGARAN(pPSSEGURO, pPNRIESGO, pPDTOCOM, pPDIFERENCIA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_PDTOCOM_RIESGOGARAN
	// --START-PAC_IAX_PRODUCCION.F_SET_PDTOTEC_RIESGOGARAN(PSSEGURO, PNRIESGO,
	// PDTOTEC, PDIFERENCIA)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_PDTOTEC_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPDTOTEC, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_PDTOTEC_RIESGOGARAN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPDTOTEC", "pPDIFERENCIA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPDTOTEC, pPDIFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPDTOTEC);
		cStmt.setObject(5, pPDIFERENCIA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_PDTOTEC_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPDTOTEC, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_PDTOTEC_RIESGOGARAN(pPSSEGURO, pPNRIESGO, pPDTOTEC, pPDIFERENCIA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_PDTOTEC_RIESGOGARAN
	// --START-PAC_IAX_PRODUCCION.F_SET_PRECARG_RIESGOGARAN(PSSEGURO, PNRIESGO,
	// PRECARG, PDIFERENCIA)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_PRECARG_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPRECARG, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_PRECARG_RIESGOGARAN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPRECARG", "pPDIFERENCIA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPRECARG, pPDIFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPRECARG);
		cStmt.setObject(5, pPDIFERENCIA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_PRECARG_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPRECARG, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_PRECARG_RIESGOGARAN(pPSSEGURO, pPNRIESGO, pPRECARG, pPDIFERENCIA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_PRECARG_RIESGOGARAN
	// --START-PAC_IAX_PRODUCCION.F_SET_PRECCOM_RIESGOGARAN(PSSEGURO, PNRIESGO,
	// PRECCOM, PDIFERENCIA)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_PRECCOM_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPRECCOM, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_PRECCOM_RIESGOGARAN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPRECCOM", "pPDIFERENCIA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPRECCOM, pPDIFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPRECCOM);
		cStmt.setObject(5, pPDIFERENCIA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_PRECCOM_RIESGOGARAN(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPRECCOM, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_PRECCOM_RIESGOGARAN(pPSSEGURO, pPNRIESGO, pPRECCOM, pPDIFERENCIA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_PRECCOM_RIESGOGARAN
	// --START-PAC_IAX_PRODUCCION.F_GET_DTOREC_RIESGO(PTABLAS, PSSEGURO, PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_DTOREC_RIESGO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTABLAS", "pPSSEGURO", "pPNRIESGO" },
				new Object[] { pPTABLAS, pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PDTOCOM"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PRECARG"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PDTOTEC"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PRECCOM"
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
			retVal.put("PDTOCOM", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PDTOCOM", null);
		}
		try {
			retVal.put("PRECARG", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PRECARG", null);
		}
		try {
			retVal.put("PDTOTEC", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PDTOTEC", null);
		}
		try {
			retVal.put("PRECCOM", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PRECCOM", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO(pPTABLAS, pPSSEGURO, pPNRIESGO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_DTOREC_RIESGO

	// ETM 21657 ********************* --FIN

	// --START-PAC_IAX_PRODUCCION.F_GET_CABECERA_PREGUNTAB(PCPREGUN)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_CABECERA_PREGUNTAB(java.math.BigDecimal pPCPREGUN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CABECERA_PREGUNTAB(?, ?)}";

		logCall(callQuery, new String[] { "pPCPREGUN" }, new Object[] { pPCPREGUN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CABECERA_PREGUNTAB(java.math.BigDecimal pPCPREGUN)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CABECERA_PREGUNTAB(pPCPREGUN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CABECERA_PREGUNTAB

	// --START-PAC_IAX_PRODUCCION.F_GET_PREGUNTAB(PTIPO, PNRIESGO, PCGARANT,
	// PCPREGUN)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCPREGUN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PREGUNTAB(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPNRIESGO", "pPCGARANT", "pPCPREGUN" },
				new Object[] { pPTIPO, pPNRIESGO, pPCGARANT, pPCPREGUN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCPREGUN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTASTAB".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCPREGUN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(pPTIPO, pPNRIESGO, pPCGARANT, pPCPREGUN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_PREGUNTAB

	// --START-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB(PTIPO, PNRIESGO, PCPREGUN,
	// PCGARANT, PTCOLUMNAS)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, Object pPTCOLUMNAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPNRIESGO", "pPCPREGUN", "pPCGARANT", "pPTCOLUMNAS" },
				new Object[] { pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPTCOLUMNAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCPREGUN);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPTCOLUMNAS);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, Object pPTCOLUMNAS) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB(pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPTCOLUMNAS); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB

	// --START-PAC_IAX_PRODUCCION.F_DEL_PREGUNTASTAB(PTIPO, PNRIESGO, PCPREGUN,
	// PCGARANT, PNLINEA)

	private HashMap callPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNLINEA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_DEL_PREGUNTASTAB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPNRIESGO", "pPCPREGUN", "pPCGARANT", "pPNLINEA" },
				new Object[] { pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCPREGUN);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNLINEA);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNLINEA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPNLINEA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_DEL_PREGUNTASTAB
	// --START-PAC_IAX_PRODUCCION.F_ACT_CAP_RECOMEND(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ACT_CAP_RECOMEND(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(pPNRIESGO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ACT_CAP_RECOMEND
	// bfp bug 21947 ini: cal actualitzar-lo del repositori per tornar a ficar la
	// funci�. Si no, desfar� canvis d'altres
	// --START-PAC_IAX_PRODUCCION.F_LEEGARANSEGCOM(NRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEGARANSEGCOM(java.math.BigDecimal pNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEGARANSEGCOM(?, ?)}";

		logCall(callQuery, new String[] { "pNRIESGO" }, new Object[] { pNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GARANSEGCOM".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEGARANSEGCOM(java.math.BigDecimal pNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEGARANSEGCOM(pNRIESGO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEGARANSEGCOM

	// bfp bug 21947 fi
	// --START-PAC_IAX_PRODUCCION.F_LEECLAUSULASPRODMULT(PSCLAGEN, PNORDCLA)

	private HashMap callPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT(java.math.BigDecimal pPSCLAGEN,
			java.math.BigDecimal pPNORDCLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEECLAUSULASPRODMULT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCLAGEN", "pPNORDCLA" }, new Object[] { pPSCLAGEN, pPNORDCLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAGEN);
		cStmt.setObject(3, pPNORDCLA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT(java.math.BigDecimal pPSCLAGEN,
			java.math.BigDecimal pPNORDCLA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT(pPSCLAGEN, pPNORDCLA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEECLAUSULASPRODMULT

	// --START-PAC_IAX_PRODUCCION.F_GRABACLAUSULASMULT(SCLAGEN, SELCLAU, PNORDCLA)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABACLAUSULASMULT(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pSELCLAU, java.math.BigDecimal pPNORDCLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABACLAUSULASMULT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSCLAGEN", "pSELCLAU", "pPNORDCLA" },
				new Object[] { pSCLAGEN, pSELCLAU, pPNORDCLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLAGEN);
		cStmt.setObject(3, pSELCLAU);
		cStmt.setObject(4, pPNORDCLA);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULASMULT(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pSELCLAU, java.math.BigDecimal pPNORDCLA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABACLAUSULASMULT(pSCLAGEN, pSELCLAU, pPNORDCLA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABACLAUSULASMULT

	// --START-PAC_IAX_PRODUCCION.F_GETCLAUSULAPARAMMULT(SCLAGEN, PNORDCLA)

	private HashMap callPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAMMULT(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pPNORDCLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GETCLAUSULAPARAMMULT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSCLAGEN", "pPNORDCLA" }, new Object[] { pSCLAGEN, pPNORDCLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLAGEN);
		cStmt.setObject(3, pPNORDCLA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAXPAR_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAMMULT(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pPNORDCLA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAMMULT(pSCLAGEN, pPNORDCLA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GETCLAUSULAPARAMMULT

	// --START-PAC_IAX_PRODUCCION.F_GRABACLAUSULAMULT(SCLAGEN, NORDCLA, NPARAME,
	// TCLAGEN)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABACLAUSULAMULT(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pNORDCLA, java.math.BigDecimal pNPARAME, String pTCLAGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABACLAUSULAMULT(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSCLAGEN", "pNORDCLA", "pNPARAME", "pTCLAGEN" },
				new Object[] { pSCLAGEN, pNORDCLA, pNPARAME, pTCLAGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLAGEN);
		cStmt.setObject(3, pNORDCLA);
		cStmt.setObject(4, pNPARAME);
		cStmt.setObject(5, pTCLAGEN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULAMULT(java.math.BigDecimal pSCLAGEN,
			java.math.BigDecimal pNORDCLA, java.math.BigDecimal pNPARAME, String pTCLAGEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABACLAUSULAMULT(pSCLAGEN, pNORDCLA, pNPARAME, pTCLAGEN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABACLAUSULAMULT
	// --START-PAC_IAX_PRODUCCION.F_DELCLAUSULAPRODMULT(PSCLAGEN, PNORDCLA)

	private HashMap callPAC_IAX_PRODUCCION__F_DELCLAUSULAPRODMULT(java.math.BigDecimal pPSCLAGEN,
			java.math.BigDecimal pPNORDCLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_DELCLAUSULAPRODMULT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCLAGEN", "pPNORDCLA" }, new Object[] { pPSCLAGEN, pPNORDCLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAGEN);
		cStmt.setObject(3, pPNORDCLA);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_DELCLAUSULAPRODMULT(java.math.BigDecimal pPSCLAGEN,
			java.math.BigDecimal pPNORDCLA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_DELCLAUSULAPRODMULT(pPSCLAGEN, pPNORDCLA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_DELCLAUSULAPRODMULT
	// --START-PAC_IAX_PRODUCCION.F_ELIMINAINQUIAVAL(PSPERSON, PCTIPFIG)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINAINQUIAVAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPFIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINAINQUIAVAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCTIPFIG" }, new Object[] { pPSPERSON, pPCTIPFIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPFIG);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINAINQUIAVAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPFIG) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINAINQUIAVAL(pPSPERSON, pPCTIPFIG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINAINQUIAVAL
	// --START-PAC_IAX_PRODUCCION.F_GRABARINQUIAVAL(PSSEGURO, PSPERSON, PNMOVIMI,
	// PNRIESGO, PCTIPFIG, PCDOMICI, PIINGRMEN, PIINGRANUAL, PFFECINI, PFFECFIN,
	// PCTIPCONTRATO, PCSITLABORAL, PCSUPFILTRO)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARINQUIAVAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCTIPFIG, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPIINGRMEN,
			java.math.BigDecimal pPIINGRANUAL, java.sql.Date pPFFECINI, java.sql.Date pPFFECFIN,
			java.math.BigDecimal pPCTIPCONTRATO, java.math.BigDecimal pPCSITLABORAL, java.math.BigDecimal pPCSUPFILTRO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARINQUIAVAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPSPERSON", "pPNMOVIMI", "pPNRIESGO", "pPCTIPFIG", "pPCDOMICI",
						"pPIINGRMEN", "pPIINGRANUAL", "pPFFECINI", "pPFFECFIN", "pPCTIPCONTRATO", "pPCSITLABORAL",
						"pPCSUPFILTRO" },
				new Object[] { pPSSEGURO, pPSPERSON, pPNMOVIMI, pPNRIESGO, pPCTIPFIG, pPCDOMICI, pPIINGRMEN,
						pPIINGRANUAL, pPFFECINI, pPFFECFIN, pPCTIPCONTRATO, pPCSITLABORAL, pPCSUPFILTRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNRIESGO);
		cStmt.setObject(6, pPCTIPFIG);
		cStmt.setObject(7, pPCDOMICI);
		cStmt.setObject(8, pPIINGRMEN);
		cStmt.setObject(9, pPIINGRANUAL);
		cStmt.setObject(10, pPFFECINI);
		cStmt.setObject(11, pPFFECFIN);
		cStmt.setObject(12, pPCTIPCONTRATO);
		cStmt.setObject(13, pPCSITLABORAL);
		cStmt.setObject(14, pPCSUPFILTRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARINQUIAVAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCTIPFIG, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPIINGRMEN,
			java.math.BigDecimal pPIINGRANUAL, java.sql.Date pPFFECINI, java.sql.Date pPFFECFIN,
			java.math.BigDecimal pPCTIPCONTRATO, java.math.BigDecimal pPCSITLABORAL, java.math.BigDecimal pPCSUPFILTRO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARINQUIAVAL(pPSSEGURO, pPSPERSON, pPNMOVIMI, pPNRIESGO, pPCTIPFIG,
				pPCDOMICI, pPIINGRMEN, pPIINGRANUAL, pPFFECINI, pPFFECFIN, pPCTIPCONTRATO, pPCSITLABORAL, pPCSUPFILTRO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARINQUIAVAL
	// --START-PAC_IAX_PRODUCCION.F_INSERTINQUIAVAL(PSSEGURO, PSPERSON, PNMOVIMI,
	// PNRIESGO, PCTIPFIG, PCDOMICI, PIINGRMEN, PIINGRANUAL, PFFECINI, PFFECFIN,
	// PCTIPCONTRATO, PCSITLABORAL, PCSUPFILTRO)

	private HashMap callPAC_IAX_PRODUCCION__F_INSERTINQUIAVAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCTIPFIG, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPIINGRMEN,
			java.math.BigDecimal pPIINGRANUAL, java.sql.Date pPFFECINI, java.sql.Date pPFFECFIN,
			java.math.BigDecimal pPCTIPCONTRATO, java.math.BigDecimal pPCSITLABORAL, java.math.BigDecimal pPCSUPFILTRO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERTINQUIAVAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPSPERSON", "pPNMOVIMI", "pPNRIESGO", "pPCTIPFIG", "pPCDOMICI",
						"pPIINGRMEN", "pPIINGRANUAL", "pPFFECINI", "pPFFECFIN", "pPCTIPCONTRATO", "pPCSITLABORAL",
						"pPCSUPFILTRO" },
				new Object[] { pPSSEGURO, pPSPERSON, pPNMOVIMI, pPNRIESGO, pPCTIPFIG, pPCDOMICI, pPIINGRMEN,
						pPIINGRANUAL, pPFFECINI, pPFFECFIN, pPCTIPCONTRATO, pPCSITLABORAL, pPCSUPFILTRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNRIESGO);
		cStmt.setObject(6, pPCTIPFIG);
		cStmt.setObject(7, pPCDOMICI);
		cStmt.setObject(8, pPIINGRMEN);
		cStmt.setObject(9, pPIINGRANUAL);
		cStmt.setObject(10, pPFFECINI);
		cStmt.setObject(11, pPFFECFIN);
		cStmt.setObject(12, pPCTIPCONTRATO);
		cStmt.setObject(13, pPCSITLABORAL);
		cStmt.setObject(14, pPCSUPFILTRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERTINQUIAVAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCTIPFIG, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPIINGRMEN,
			java.math.BigDecimal pPIINGRANUAL, java.sql.Date pPFFECINI, java.sql.Date pPFFECFIN,
			java.math.BigDecimal pPCTIPCONTRATO, java.math.BigDecimal pPCSITLABORAL, java.math.BigDecimal pPCSUPFILTRO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERTINQUIAVAL(pPSSEGURO, pPSPERSON, pPNMOVIMI, pPNRIESGO, pPCTIPFIG,
				pPCDOMICI, pPIINGRMEN, pPIINGRANUAL, pPFFECINI, pPFFECFIN, pPCTIPCONTRATO, pPCSITLABORAL, pPCSUPFILTRO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INSERTINQUIAVAL

	// --START-PAC_IAX_PRODUCCION.F_LEEINQUIAVAL(PCTIPFIG)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEINQUIAVAL(java.math.BigDecimal pPCTIPFIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEINQUIAVAL(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPFIG" }, new Object[] { pPCTIPFIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPFIG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INQUIAVAL".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEINQUIAVAL(java.math.BigDecimal pPCTIPFIG) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEINQUIAVAL(pPCTIPFIG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEINQUIAVAL

	// --START-PAC_IAX_PRODUCCION.F_GET_INQUIAVAL(PSPERSON, PCTIPFIG)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_INQUIAVAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPFIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_INQUIAVAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCTIPFIG" }, new Object[] { pPSPERSON, pPCTIPFIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPFIG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_INQUIAVAL".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_INQUIAVAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPFIG) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_INQUIAVAL(pPSPERSON, pPCTIPFIG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_INQUIAVAL

	// --START-PAC_IAX_PRODUCCION.F_GRABAGESTIONCOMISIONGAR(NRIESGO, PCGARANT,
	// PFINIEFE, PCMODCOM, PCOMISI, PNINIALT, PNFINALT)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISIONGAR(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIEFE, java.math.BigDecimal pPCMODCOM,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABAGESTIONCOMISIONGAR(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pNRIESGO", "pPCGARANT", "pPFINIEFE", "pPCMODCOM", "pPCOMISI", "pPNINIALT",
						"pPNFINALT" },
				new Object[] { pNRIESGO, pPCGARANT, pPFINIEFE, pPCMODCOM, pPCOMISI, pPNINIALT, pPNFINALT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPFINIEFE);
		cStmt.setObject(5, pPCMODCOM);
		cStmt.setObject(6, pPCOMISI);
		cStmt.setObject(7, pPNINIALT);
		cStmt.setObject(8, pPNFINALT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISIONGAR(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIEFE, java.math.BigDecimal pPCMODCOM,
			java.math.BigDecimal pPCOMISI, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISIONGAR(pNRIESGO, pPCGARANT, pPFINIEFE, pPCMODCOM,
				pPCOMISI, pPNINIALT, pPNFINALT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABAGESTIONCOMISIONGAR

	// bfp bug 21947 fi

	// --START-PAC_IAX_PRODUCCION.F_DUP_SEGURO(PSSEGUROORIG, PFEFECTO,
	// POBSERVACIONES, PTIPOTABLAS, PCAGENTE)
	private HashMap callPAC_IAX_PRODUCCION__F_DUP_SEGURO(java.math.BigDecimal pPSSEGUROORIG, java.sql.Date pPFEFECTO,
			String pPOBSERVACIONES, java.math.BigDecimal pPTIPOTABLAS, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_DUP_SEGURO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGUROORIG", "pPFEFECTO", "pPOBSERVACIONES", "pPTIPOTABLAS", "pPCAGENTE" },
				new Object[] { pPSSEGUROORIG, pPFEFECTO, pPOBSERVACIONES, pPTIPOTABLAS, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGUROORIG);
		cStmt.setObject(3, pPFEFECTO);
		cStmt.setObject(4, pPOBSERVACIONES);
		cStmt.setObject(9, pPTIPOTABLAS);
		cStmt.setObject(10, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PSSEGURODEST"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNSOLICIDEST"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PNPOLIZADEST"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PNCERTIFDEST"
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
			retVal.put("PSSEGURODEST", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PSSEGURODEST", null);
		}
		try {
			retVal.put("PNSOLICIDEST", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNSOLICIDEST", null);
		}
		try {
			retVal.put("PNPOLIZADEST", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PNPOLIZADEST", null);
		}
		try {
			retVal.put("PNCERTIFDEST", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PNCERTIFDEST", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_DUP_SEGURO(java.math.BigDecimal pPSSEGUROORIG, java.sql.Date pPFEFECTO,
			String pPOBSERVACIONES, java.math.BigDecimal pPTIPOTABLAS, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_DUP_SEGURO(pPSSEGUROORIG, pPFEFECTO, pPOBSERVACIONES, pPTIPOTABLAS,
				pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_DUP_SEGURO

	// --START-PAC_IAX_PRODUCCION.F_GRABARTOMADORES(SPERSON, CDOMICI, ISASEG,
	// CEXISTEPAGADOR)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARTOMADORES(java.math.BigDecimal pSPERSON,
			java.math.BigDecimal pCDOMICI, java.math.BigDecimal pISASEG, java.math.BigDecimal pCEXISTEPAGADOR,
			java.math.BigDecimal pCAGRUPA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARTOMADORES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON", "pCDOMICI", "pISASEG", "pCEXISTEPAGADOR", "pCAGRUPA" },
				new Object[] { pSPERSON, pCDOMICI, pISASEG, pCEXISTEPAGADOR, pCAGRUPA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.setObject(3, pCDOMICI);
		cStmt.setObject(4, pISASEG);
		cStmt.setObject(6, pCEXISTEPAGADOR);
		cStmt.setObject(7, pCAGRUPA);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARTOMADORES(java.math.BigDecimal pSPERSON,
			java.math.BigDecimal pCDOMICI, java.math.BigDecimal pISASEG, java.math.BigDecimal pCEXISTEPAGADOR,
			java.math.BigDecimal pCAGRUPA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARTOMADORES(pSPERSON, pCDOMICI, pISASEG, pCEXISTEPAGADOR, pCAGRUPA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARTOMADORES

	private HashMap callPAC_IAX_PRODUCCION__F_SET_FRENOVA(java.sql.Date pPFEFECTO, java.math.BigDecimal pCDURACI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_FRENOVA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFEFECTO", "pCDURACI" }, new Object[] { pPFEFECTO, pCDURACI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFEFECTO);
		cStmt.setObject(3, pCDURACI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PFRENOVA"
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
			retVal.put("PFRENOVA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFRENOVA", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_FRENOVA(java.sql.Date pPFEFECTO, java.math.BigDecimal pCDURACI)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_FRENOVA(pPFEFECTO, pCDURACI);
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_NRENOVA

	// --START-PAC_IAX_PRODUCCION.F_GRABACUADROCOASEGURO(PTIPOCOA, PCTLOCAL,
	// PCCOMPAN, POLIZAORI, PENDOSO)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABACUADROCOASEGURO(java.math.BigDecimal pPTIPOCOA,
			java.math.BigDecimal pPCTLOCAL, java.math.BigDecimal pPCCOMPAN, String pPOLIZAORI,
			java.math.BigDecimal pPENDOSO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABACUADROCOASEGURO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPOCOA", "pPCTLOCAL", "pPCCOMPAN", "pPOLIZAORI", "pPENDOSO" },
				new Object[] { pPTIPOCOA, pPCTLOCAL, pPCCOMPAN, pPOLIZAORI, pPENDOSO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPOCOA);
		cStmt.setObject(3, pPCTLOCAL);
		cStmt.setObject(4, pPCCOMPAN);
		cStmt.setObject(5, pPOLIZAORI);
		cStmt.setObject(6, pPENDOSO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABACUADROCOASEGURO(java.math.BigDecimal pPTIPOCOA,
			java.math.BigDecimal pPCTLOCAL, java.math.BigDecimal pPCCOMPAN, String pPOLIZAORI,
			java.math.BigDecimal pPENDOSO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABACUADROCOASEGURO(pPTIPOCOA, pPCTLOCAL, pPCCOMPAN, pPOLIZAORI,
				pPENDOSO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABACUADROCOASEGURO

	// --START-PAC_IAX_PRODUCCION.F_GRABADETCUADROCOASEGURO(PCCOMPAN, PCESCOA,
	// PCOMCOA, PCOMCON, PCOMGAS)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABADETCUADROCOASEGURO(java.math.BigDecimal pPCCOMPAN,
			java.math.BigDecimal pPCESCOA, java.math.BigDecimal pPCOMCOA, java.math.BigDecimal pPCOMCON,
			java.math.BigDecimal pPCOMGAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABADETCUADROCOASEGURO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPAN", "pPCESCOA", "pPCOMCOA", "pPCOMCON", "pPCOMGAS" },
				new Object[] { pPCCOMPAN, pPCESCOA, pPCOMCOA, pPCOMCON, pPCOMGAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPAN);
		cStmt.setObject(3, pPCESCOA);
		cStmt.setObject(4, pPCOMCOA);
		cStmt.setObject(5, pPCOMCON);
		cStmt.setObject(6, pPCOMGAS);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABADETCUADROCOASEGURO(java.math.BigDecimal pPCCOMPAN,
			java.math.BigDecimal pPCESCOA, java.math.BigDecimal pPCOMCOA, java.math.BigDecimal pPCOMCON,
			java.math.BigDecimal pPCOMGAS) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABADETCUADROCOASEGURO(pPCCOMPAN, pPCESCOA, pPCOMCOA, pPCOMCON,
				pPCOMGAS); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABADETCUADROCOASEGURO
	// --START-PAC_IAX_PRODUCCION.F_LEEDETCOASEGURO()

	private HashMap callPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDETCOASEGURO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_COACUADRO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDETCOASEGURO

	// --START-PAC_IAX_PRODUCCION.F_SET_FRANQUICIA(NRIESGO, PCGRUP, PCSUBGRUP,
	// PCVERSION, PCNIVEL, PCVALOR1, PIMPVALOR1, PCVALOR2, PIMPVALOR2, PCIMPMIN,
	// PIMPMIN, PCIMPMAX, PIMPMAX)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_FRANQUICIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pPCGRUP, java.math.BigDecimal pPCSUBGRUP, java.math.BigDecimal pPCVERSION,
			java.math.BigDecimal pPCNIVEL, java.math.BigDecimal pPCVALOR1, java.math.BigDecimal pPIMPVALOR1,
			java.math.BigDecimal pPCVALOR2, java.math.BigDecimal pPIMPVALOR2, java.math.BigDecimal pPCIMPMIN,
			java.math.BigDecimal pPIMPMIN, java.math.BigDecimal pPCIMPMAX, java.math.BigDecimal pPIMPMAX)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_FRANQUICIA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pNRIESGO", "pPCGRUP", "pPCSUBGRUP", "pPCVERSION", "pPCNIVEL", "pPCVALOR1",
						"pPIMPVALOR1", "pPCVALOR2", "pPIMPVALOR2", "pPCIMPMIN", "pPIMPMIN", "pPCIMPMAX", "pPIMPMAX" },
				new Object[] { pNRIESGO, pPCGRUP, pPCSUBGRUP, pPCVERSION, pPCNIVEL, pPCVALOR1, pPIMPVALOR1, pPCVALOR2,
						pPIMPVALOR2, pPCIMPMIN, pPIMPMIN, pPCIMPMAX, pPIMPMAX });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pPCGRUP);
		cStmt.setObject(4, pPCSUBGRUP);
		cStmt.setObject(5, pPCVERSION);
		cStmt.setObject(6, pPCNIVEL);
		cStmt.setObject(7, pPCVALOR1);
		cStmt.setObject(8, pPIMPVALOR1);
		cStmt.setObject(9, pPCVALOR2);
		cStmt.setObject(10, pPIMPVALOR2);
		cStmt.setObject(11, pPCIMPMIN);
		cStmt.setObject(12, pPIMPMIN);
		cStmt.setObject(13, pPCIMPMAX);
		cStmt.setObject(14, pPIMPMAX);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_FRANQUICIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pPCGRUP, java.math.BigDecimal pPCSUBGRUP, java.math.BigDecimal pPCVERSION,
			java.math.BigDecimal pPCNIVEL, java.math.BigDecimal pPCVALOR1, java.math.BigDecimal pPIMPVALOR1,
			java.math.BigDecimal pPCVALOR2, java.math.BigDecimal pPIMPVALOR2, java.math.BigDecimal pPCIMPMIN,
			java.math.BigDecimal pPIMPMIN, java.math.BigDecimal pPCIMPMAX, java.math.BigDecimal pPIMPMAX)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_FRANQUICIA(pNRIESGO, pPCGRUP, pPCSUBGRUP, pPCVERSION, pPCNIVEL,
				pPCVALOR1, pPIMPVALOR1, pPCVALOR2, pPIMPVALOR2, pPCIMPMIN, pPIMPMIN, pPCIMPMAX, pPIMPMAX); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_FRANQUICIA

	// --START-PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS_GARANTIA(PNRIESGO, PCPARTIDA,
	// PCGARANT)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_GARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS_GARANTIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCPARTIDA", "pPCGARANT" },
				new Object[] { pPNRIESGO, pPCPARTIDA, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCPARTIDA);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_BF_PROACTGRUP".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_GARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_GARANTIA(pPNRIESGO, pPCPARTIDA, pPCGARANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS_GARANTIA

	// --START-PAC_IAX_PRODUCCION.F_SET_FRANQGAR_MANUAL(NRIESGO, CGARANT, PCTIPFRA,
	// PIFRANQ)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_FRANQGAR_MANUAL(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pPCTIPFRA, java.math.BigDecimal pPIFRANQ)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_FRANQGAR_MANUAL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT", "pPCTIPFRA", "pPIFRANQ" },
				new Object[] { pNRIESGO, pCGARANT, pPCTIPFRA, pPIFRANQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pPCTIPFRA);
		cStmt.setObject(5, pPIFRANQ);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_FRANQGAR_MANUAL(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pPCTIPFRA, java.math.BigDecimal pPIFRANQ)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_FRANQGAR_MANUAL(pNRIESGO, pCGARANT, pPCTIPFRA, pPIFRANQ); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_FRANQGAR_MANUAL

	// --START-PAC_IAX_PRODUCCION.F_INICIALIZA_RETORNO()

	private HashMap callPAC_IAX_PRODUCCION__F_INICIALIZA_RETORNO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INICIALIZA_RETORNO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RETORNO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INICIALIZA_RETORNO() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INICIALIZA_RETORNO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INICIALIZA_RETORNO
	// --START-PAC_IAX_PRODUCCION.F_ELIMINARETORNO(PSPERSON)

	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINARETORNO(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINARETORNO(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINARETORNO(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINARETORNO(pPSPERSON); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ELIMINARETORNO

	// --START-PAC_IAX_PRODUCCION.F_GRABARETORNO(PSPERSON, PRETORNO, PIDCONVENIO)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARETORNO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPRETORNO, java.math.BigDecimal pPIDCONVENIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARETORNO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPRETORNO", "pPIDCONVENIO" },
				new Object[] { pPSPERSON, pPRETORNO, pPIDCONVENIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPRETORNO);
		cStmt.setObject(4, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARETORNO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPRETORNO, java.math.BigDecimal pPIDCONVENIO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARETORNO(pPSPERSON, pPRETORNO, pPIDCONVENIO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARETORNO
	// --START-PAC_IAX_PRODUCCION.F_INSERTRETORNO(PSPERSON, PRETORNO, PIDCONVENIO)

	private HashMap callPAC_IAX_PRODUCCION__F_INSERTRETORNO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPRETORNO, java.math.BigDecimal pPIDCONVENIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERTRETORNO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPRETORNO", "pPIDCONVENIO" },
				new Object[] { pPSPERSON, pPRETORNO, pPIDCONVENIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPRETORNO);
		cStmt.setObject(4, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERTRETORNO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPRETORNO, java.math.BigDecimal pPIDCONVENIO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERTRETORNO(pPSPERSON, pPRETORNO, pPIDCONVENIO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INSERTRETORNO

	// --START-PAC_IAX_PRODUCCION.F_LEERETORNO()

	private HashMap callPAC_IAX_PRODUCCION__F_LEERETORNO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEERETORNO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RETORNO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEERETORNO() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEERETORNO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEERETORNO

	// --START-PAC_IAX_PRODUCCION.F_ES_COL_ADMIN(PSSEGURO, PTABLAS)

	private HashMap callPAC_IAX_PRODUCCION__F_ES_COL_ADMIN(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ES_COL_ADMIN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ES_COL_ADMIN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "ES_CERTIF_CERO"
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
			retVal.put("ES_COL_ADMIN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("ES_COL_ADMIN", null);
		}
		try {
			retVal.put("ES_CERTIF_CERO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("ES_CERTIF_CERO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ES_COL_ADMIN(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ES_COL_ADMIN(pPSSEGURO, pPTABLAS); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ES_COL_ADMIN
	// --START-PAC_IAX_PRODUCCION.F_EMITIR_COL_ADMIN(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_EMITIR_COL_ADMIN(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_EMITIR_COL_ADMIN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCONTINUAEMITIR"
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
			retVal.put("PCONTINUAEMITIR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCONTINUAEMITIR", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_EMITIR_COL_ADMIN(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_EMITIR_COL_ADMIN(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_EMITIR_COL_ADMIN

	// --START-PAC_IAX_PRODUCCION.F_ABRIR_SUPLEMENTO(PSSEGURO)

	private HashMap callPAC_IAX_PRODUCCION__F_ABRIR_SUPLEMENTO(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ABRIR_SUPLEMENTO(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ABRIR_SUPLEMENTO(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ABRIR_SUPLEMENTO(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ABRIR_SUPLEMENTO

	// --START-PAC_IAX_PRODUCCION.F_BORRARDETCUADROCOASEGURO(PCCOMPAN)

	private HashMap callPAC_IAX_PRODUCCION__F_BORRARDETCUADROCOASEGURO(java.math.BigDecimal pPCCOMPAN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_BORRARDETCUADROCOASEGURO(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPAN" }, new Object[] { pPCCOMPAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPAN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_BORRARDETCUADROCOASEGURO(java.math.BigDecimal pPCCOMPAN)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_BORRARDETCUADROCOASEGURO(pPCCOMPAN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_BORRARDETCUADROCOASEGURO

	// --START-PAC_IAX_PRODUCCION.F_VALIDAR_FRANQUICIAS(PNRIESGO)

	private HashMap callPAC_IAX_PRODUCCION__F_VALIDAR_FRANQUICIAS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_VALIDAR_FRANQUICIAS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_VALIDAR_FRANQUICIAS(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_VALIDAR_FRANQUICIAS(pPNRIESGO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_VALIDAR_FRANQUICIAS

	// --START-PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS_CONSULTA(PNRIESGO, PCPARTIDA)

	private HashMap callPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_CONSULTA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS_CONSULTA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCPARTIDA" }, new Object[] { pPNRIESGO, pPCPARTIDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCPARTIDA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_BF_PROACTGRUP".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_CONSULTA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPARTIDA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_CONSULTA(pPNRIESGO, pPCPARTIDA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_FRANQUICIAS_CONSULTA

	// --START-PAC_IAX_PRODUCCION.F_LEEINQUIAVAL_RIE(PNRIESGO, PCTIPFIG)

	private HashMap callPAC_IAX_PRODUCCION__F_LEEINQUIAVAL_RIE(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCTIPFIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEINQUIAVAL_RIE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCTIPFIG" }, new Object[] { pPNRIESGO, pPCTIPFIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCTIPFIG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INQUIAVAL".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEINQUIAVAL_RIE(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCTIPFIG) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEINQUIAVAL_RIE(pPNRIESGO, pPCTIPFIG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEINQUIAVAL_RIE
	// --START-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_G(PNRIESGO, PNORDEN, PSPERSON_TIT,
	// PCTIPBEN, PCPAREN, PPPARTICIP, PCGARANT, PCESTADO)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_BENEIDENT_G(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPNORDEN", "pPSPERSON_TIT", "pPCTIPBEN", "pPCPAREN", "pPPPARTICIP",
						"pPCGARANT", "pPCESTADO" },
				new Object[] { pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN, pPPPARTICIP, pPCGARANT,
						pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPSPERSON_TIT);
		cStmt.setObject(5, pPCTIPBEN);
		cStmt.setObject(6, pPCPAREN);
		cStmt.setObject(7, pPPPARTICIP);
		cStmt.setObject(8, pPCGARANT);
		cStmt.setObject(9, pPCESTADO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_BENEIDENT_G(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_G(pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN,
				pPPPARTICIP, pPCGARANT, pPCESTADO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_G
	// --START-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_R(PNRIESGO, PNORDEN, PSPERSON_TIT,
	// PCTIPBEN, PCPAREN, PPPARTICIP, PCESTADO)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCESTADO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_BENEIDENT_R(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPNORDEN", "pPSPERSON_TIT", "pPCTIPBEN", "pPCPAREN", "pPPPARTICIP",
						"pPCESTADO" },
				new Object[] { pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN, pPPPARTICIP, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPSPERSON_TIT);
		cStmt.setObject(5, pPCTIPBEN);
		cStmt.setObject(6, pPCPAREN);
		cStmt.setObject(7, pPPPARTICIP);
		cStmt.setObject(8, pPCESTADO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_BENEIDENT_R(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON_TIT, java.math.BigDecimal pPCTIPBEN,
			java.math.BigDecimal pPCPAREN, java.math.BigDecimal pPPPARTICIP, java.math.BigDecimal pPCESTADO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_BENEIDENT_R(pPNRIESGO, pPNORDEN, pPSPERSON_TIT, pPCTIPBEN, pPCPAREN,
				pPPPARTICIP, pPCESTADO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_BENEIDENT_R

	// --START-PAC_IAX_PRODUCCION.F_ISALTACERTIFICERO(pSSEGURO)
	private HashMap callPAC_IAX_PRODUCCION__F_ISALTACERTIFICERO(java.math.BigDecimal pSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ISALTACERTIFICERO(?, ?)}";

		logCall(callQuery, new String[] { "pSSEGURO" }, new Object[] { pSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSSEGURO);
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
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ISALTACERTIFICERO(java.math.BigDecimal pSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ISALTACERTIFICERO(pSSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_ISALTACERTIFICERO
	// --START-PAC_IAX_PRODUCCION.F_LEEAGENSEGU()
	private HashMap callPAC_IAX_PRODUCCION__F_LEEAGENSEGU() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEAGENSEGU(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AGENSEGU".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEAGENSEGU() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEAGENSEGU();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_LEEAGENSEGU
	private HashMap callPAC_IAX_PRODUCCION__F_ES_AGE_LIDER(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ES_AGE_LIDER(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ES_AGE_LIDER"
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
			retVal.put("ES_AGE_LIDER", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("ES_AGE_LIDER", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ES_AGE_LIDER(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ES_AGE_LIDER(pPSSEGURO, pPNMOVIMI); // AXIS-WLS1SERVER-Ready
	}

	// NMM.02/2013.24735: (POSDE600)-Desarrollo-GAPS Tecnico-Id 33 - Mesadas Extras
	// diferentes a la propia (preguntas)
	// --START-PAC_IAX_PRODUCCION.F_SET_IMESEXTRA(PIMES1, PIMES2, PIMES3, PIMES4,
	// PIMES5, PIMES6, PIMES7, PIMES8, PIMES9, PIMES10, PIMES11, PIMES12)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_IMESEXTRA(java.math.BigDecimal pPIMES1, java.math.BigDecimal pPIMES2,
			java.math.BigDecimal pPIMES3, java.math.BigDecimal pPIMES4, java.math.BigDecimal pPIMES5,
			java.math.BigDecimal pPIMES6, java.math.BigDecimal pPIMES7, java.math.BigDecimal pPIMES8,
			java.math.BigDecimal pPIMES9, java.math.BigDecimal pPIMES10, java.math.BigDecimal pPIMES11,
			java.math.BigDecimal pPIMES12) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_IMESEXTRA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIMES1", "pPIMES2", "pPIMES3", "pPIMES4", "pPIMES5", "pPIMES6", "pPIMES7", "pPIMES8",
						"pPIMES9", "pPIMES10", "pPIMES11", "pPIMES12" },
				new Object[] { pPIMES1, pPIMES2, pPIMES3, pPIMES4, pPIMES5, pPIMES6, pPIMES7, pPIMES8, pPIMES9,
						pPIMES10, pPIMES11, pPIMES12 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIMES1);
		cStmt.setObject(3, pPIMES2);
		cStmt.setObject(4, pPIMES3);
		cStmt.setObject(5, pPIMES4);
		cStmt.setObject(6, pPIMES5);
		cStmt.setObject(7, pPIMES6);
		cStmt.setObject(8, pPIMES7);
		cStmt.setObject(9, pPIMES8);
		cStmt.setObject(10, pPIMES9);
		cStmt.setObject(11, pPIMES10);
		cStmt.setObject(12, pPIMES11);
		cStmt.setObject(13, pPIMES12);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_IMESEXTRA(java.math.BigDecimal pPIMES1,
			java.math.BigDecimal pPIMES2, java.math.BigDecimal pPIMES3, java.math.BigDecimal pPIMES4,
			java.math.BigDecimal pPIMES5, java.math.BigDecimal pPIMES6, java.math.BigDecimal pPIMES7,
			java.math.BigDecimal pPIMES8, java.math.BigDecimal pPIMES9, java.math.BigDecimal pPIMES10,
			java.math.BigDecimal pPIMES11, java.math.BigDecimal pPIMES12) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_IMESEXTRA(pPIMES1, pPIMES2, pPIMES3, pPIMES4, pPIMES5, pPIMES6,
				pPIMES7, pPIMES8, pPIMES9, pPIMES10, pPIMES11, pPIMES12);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_SET_IMESEXTRA
	// --START-PAC_IAX_PRODUCCION.F_HAY_FRANQ_BONUSMALUS()
	private HashMap callPAC_IAX_PRODUCCION__F_HAY_FRANQ_BONUSMALUS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_HAY_FRANQ_BONUSMALUS(?, ?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PFRANQUICIAS"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PBONUSMALUS"
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
			retVal.put("PFRANQUICIAS", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PFRANQUICIAS", null);
		}
		try {
			retVal.put("PBONUSMALUS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PBONUSMALUS", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_HAY_FRANQ_BONUSMALUS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_HAY_FRANQ_BONUSMALUS();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_HAY_FRANQ_BONUSMALUS
	private HashMap callPAC_IAX_PRODUCCION__F_LEEPRIMASEGURADO(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEPRIMSEGURADO(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEPRIMASEGURADO(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEPRIMASEGURADO(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEPRIMASEGURADO

	// --START-PAC_IAX_PRODUCCION.F_HAYCAMBIOPLAN()
	private HashMap callPAC_IAX_PRODUCCION__F_HAYCAMBIOPLAN() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_HAYCAMBIOPLAN(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_HAYCAMBIOPLAN() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_HAYCAMBIOPLAN();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_HAYCAMBIOPLAN

	// --START-PAC_IAX_PRODUCCION.F_SET_CASOBPM(PNNUMCASO, PNCASO_BPM, PNSOLICI_BPM)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_CASOBPM(java.math.BigDecimal pPNNUMCASO,
			java.math.BigDecimal pPNCASO_BPM, java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_CASOBPM(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNNUMCASO", "pPNCASO_BPM", "pPNSOLICI_BPM" },
				new Object[] { pPNNUMCASO, pPNCASO_BPM, pPNSOLICI_BPM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMCASO);
		cStmt.setObject(3, pPNCASO_BPM);
		cStmt.setObject(4, pPNSOLICI_BPM);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_CASOBPM(java.math.BigDecimal pPNNUMCASO,
			java.math.BigDecimal pPNCASO_BPM, java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_CASOBPM(pPNNUMCASO, pPNCASO_BPM, pPNSOLICI_BPM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_CASOBPM

	// --START-PAC_IAX_PRODUCCION.F_GET_CASOSBMP()
	private HashMap callPAC_IAX_PRODUCCION__F_GET_CASOSBMP() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CASOSBMP(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BPM".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CASOSBMP() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CASOSBMP();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_GET_CASOSBMP
//--START-PAC_IAX_PRODUCCION.F_GET_HISTRIESGOS(PSSEGURO,  PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION__F_GET_HISTRIESGOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_HISTRIESGOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_HISTRIESGOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_HISTRIESGOS(pPSSEGURO, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_HISTRIESGOS

	// --START-PAC_IAX_PRODUCCION.F_SET_PORCRECARG_RIESGOGAR(PSSEGURO, PNRIESGO,
	// PDTOCOM, PRECARG, PDTOTEC, PRECCOM, PDIFERENCIA)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_PORCRECARG_RIESGOGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPRECARG,
			java.math.BigDecimal pPDTOTEC, java.math.BigDecimal pPRECCOM, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_PORCRECARG_RIESGOGAR(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPDTOCOM", "pPRECARG", "pPDTOTEC", "pPRECCOM",
						"pPDIFERENCIA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPDTOCOM, pPRECARG, pPDTOTEC, pPRECCOM, pPDIFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPDTOCOM);
		cStmt.setObject(5, pPRECARG);
		cStmt.setObject(6, pPDTOTEC);
		cStmt.setObject(7, pPRECCOM);
		cStmt.setObject(8, pPDIFERENCIA);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_PORCRECARG_RIESGOGAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPDTOCOM, java.math.BigDecimal pPRECARG,
			java.math.BigDecimal pPDTOTEC, java.math.BigDecimal pPRECCOM, java.math.BigDecimal pPDIFERENCIA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_PORCRECARG_RIESGOGAR(pPSSEGURO, pPNRIESGO, pPDTOCOM, pPRECARG,
				pPDTOTEC, pPRECCOM, pPDIFERENCIA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_PORCRECARG_RIESGOGAR

	// --START-PAC_IAX_PRODUCCION.F_GET_FOLIO(PCBANCAR)
	private HashMap callPAC_IAX_PRODUCCION__F_GET_FOLIO(String pPCBANCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_FOLIO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCBANCAR" }, new Object[] { pPCBANCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCBANCAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNUMFOLIO"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PFECHAMANDATO"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PSUCURSAL"
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
			retVal.put("PNUMFOLIO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNUMFOLIO", null);
		}
		try {
			retVal.put("PFECHAMANDATO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFECHAMANDATO", null);
		}
		try {
			retVal.put("PSUCURSAL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PSUCURSAL", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_FOLIO(String pPCBANCAR) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_FOLIO(pPCBANCAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_FOLIO

	// --START-PAC_IAX_PRODUCCION.F_GET_POLIZASRETEN(PCAGENTE, PCRAMO, PSPRODUC,
	// PNPOLIZA, PNSOLICI, PNCERTIF, PNNUMIDE, PSNIP, PNOMBRE, PCSITUAC, PCMATRIC,
	// PCPOSTAL, PTDOMICI, PTNATRIE, P_FILTROPROD, PCSUCURSAL, PCADM, PCMOTOR,
	// PCCHASIS, PNBASTID, PCPOLCIA, PFRETEND, PFRETENH, PCACTIVI, PNUMIDEASE,
	// PNOMBREASE)
	private HashMap callPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNSOLICI, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPSNIP,
			String pPNOMBRE, java.math.BigDecimal pPCSITUAC, String pPCMATRIC, String pPCPOSTAL, String pPTDOMICI,
			String pPTNATRIE, String pP_FILTROPROD, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM,
			String pPCMOTOR, String pPCCHASIS, String pPNBASTID, String pPCPOLCIA, java.sql.Date pPFRETEND,
			java.sql.Date pPFRETENH, java.math.BigDecimal pPCACTIVI, String pPNUMIDEASE, String pPNOMBREASE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_POLIZASRETEN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNSOLICI", "pPNCERTIF", "pPNNUMIDE",
						"pPSNIP", "pPNOMBRE", "pPCSITUAC", "pPCMATRIC", "pPCPOSTAL", "pPTDOMICI", "pPTNATRIE",
						"pP_FILTROPROD", "pPCSUCURSAL", "pPCADM", "pPCMOTOR", "pPCCHASIS", "pPNBASTID", "pPCPOLCIA",
						"pPFRETEND", "pPFRETENH", "pPCACTIVI", "pPNUMIDEASE", "pPNOMBREASE" },
				new Object[] { pPCAGENTE, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNSOLICI, pPNCERTIF, pPNNUMIDE, pPSNIP,
						pPNOMBRE, pPCSITUAC, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pP_FILTROPROD, pPCSUCURSAL,
						pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPCPOLCIA, pPFRETEND, pPFRETENH, pPCACTIVI, pPNUMIDEASE,
						pPNOMBREASE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNSOLICI);
		cStmt.setObject(7, pPNCERTIF);
		cStmt.setObject(8, pPNNUMIDE);
		cStmt.setObject(9, pPSNIP);
		cStmt.setObject(10, pPNOMBRE);
		cStmt.setObject(11, pPCSITUAC);
		cStmt.setObject(12, pPCMATRIC);
		cStmt.setObject(13, pPCPOSTAL);
		cStmt.setObject(14, pPTDOMICI);
		cStmt.setObject(15, pPTNATRIE);
		cStmt.setObject(16, pP_FILTROPROD);
		cStmt.setObject(18, pPCSUCURSAL);
		cStmt.setObject(19, pPCADM);
		cStmt.setObject(20, pPCMOTOR);
		cStmt.setObject(21, pPCCHASIS);
		cStmt.setObject(22, pPNBASTID);
		cStmt.setObject(23, pPCPOLCIA);
		cStmt.setObject(24, pPFRETEND);
		cStmt.setObject(25, pPFRETENH);
		cStmt.setObject(26, pPCACTIVI);
		cStmt.setObject(27, pPNUMIDEASE);
		cStmt.setObject(28, pPNOMBREASE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLIZASRETEN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNSOLICI, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPSNIP,
			String pPNOMBRE, java.math.BigDecimal pPCSITUAC, String pPCMATRIC, String pPCPOSTAL, String pPTDOMICI,
			String pPTNATRIE, String pP_FILTROPROD, java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM,
			String pPCMOTOR, String pPCCHASIS, String pPNBASTID, String pPCPOLCIA, java.sql.Date pPFRETEND,
			java.sql.Date pPFRETENH, java.math.BigDecimal pCACTIVI, String pNUMIDEASE, String pNOMBREASE)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(pPCAGENTE, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNSOLICI,
				pPNCERTIF, pPNNUMIDE, pPSNIP, pPNOMBRE, pPCSITUAC, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE,
				pP_FILTROPROD, pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPCPOLCIA, pPFRETEND, pPFRETENH,
				pCACTIVI, pNUMIDEASE, pNOMBREASE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_POLIZASRETEN

	// --START-PAC_IAX_PRODUCCION.F_INIBENEFICIARIOS(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION__F_INIBENEFICIARIOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INIBENEFICIARIOS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INIBENEFICIARIOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INIBENEFICIARIOS(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INIBENEFICIARIOS

	// --START-PAC_IAX_PRODUCCION.F_SET_MODELOINV_FONDO(PNMODELO, PCCODFON,
	// PCMODABO, PPINVERS)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_MODELOINV_FONDO(java.math.BigDecimal pPNMODELO,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCMODABO, java.math.BigDecimal pPPINVERS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_MODELOINV_FONDO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNMODELO", "pPCCODFON", "pPCMODABO", "pPPINVERS" },
				new Object[] { pPNMODELO, pPCCODFON, pPCMODABO, pPPINVERS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNMODELO);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPCMODABO);
		cStmt.setObject(5, pPPINVERS);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_MODELOINV_FONDO(java.math.BigDecimal pPNMODELO,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCMODABO, java.math.BigDecimal pPPINVERS)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_MODELOINV_FONDO(pPNMODELO, pPCCODFON, pPCMODABO, pPPINVERS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_MODELOINV_FONDO

	// --START-PAC_IAX_PRODUCCION.F_SET_MODELOINV_FONDO(PNMODELO, PCCODFON,
	// PCMODABO, PPINVERS)
	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINA_MODELOINV_FONDO(java.math.BigDecimal pPNMODELO,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCMODABO, java.math.BigDecimal pPPINVERS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINA_MODELOINV_FONDO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNMODELO", "pPCCODFON", "pPCMODABO", "pPPINVERS" },
				new Object[] { pPNMODELO, pPCCODFON, pPCMODABO, pPPINVERS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNMODELO);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPCMODABO);
		cStmt.setObject(5, pPPINVERS);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINA_MODELOINV_FONDO(java.math.BigDecimal pPNMODELO,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCMODABO, java.math.BigDecimal pPPINVERS)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINA_MODELOINV_FONDO(pPNMODELO, pPCCODFON, pPCMODABO, pPPINVERS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_MODELOINV_FONDO

	// --START-PAC_IAX_PRODUCCION.F_TARIFICAR_TODOS_RIESGOS()
	private HashMap callPAC_IAX_PRODUCCION__F_TARIFICAR_TODOS_RIESGOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_TARIFICAR_TODOS_RIESGOS(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_TARIFICAR_TODOS_RIESGOS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_TARIFICAR_TODOS_RIESGOS();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_TARIFICAR_TODOS_RIESGOS
	// --START-PAC_IAX_PRODUCCION.F_SET_GRABARCONVEMPVERS(PIDVERSION, PIDCONV,
	// PTCODCONV, PCESTADO, PCPERFIL, PTDESCRI, PCORGANISMO, PCVIDA, PNVERSION,
	// PCESTADOVERS, PNVERSION_ANT, PTESTADO, PTPERFIL, PTORGANISMO, PTESTADOVERS,
	// PTVIDA, PTOBSERV)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_GRABARCONVEMPVERS(java.math.BigDecimal pPIDVERSION,
			java.math.BigDecimal pPIDCONV, String pPTCODCONV, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPERFIL, String pPTDESCRI, java.math.BigDecimal pPCORGANISMO,
			java.math.BigDecimal pPCVIDA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCESTADOVERS,
			java.math.BigDecimal pPNVERSION_ANT, String pPTESTADO, String pPTPERFIL, String pPTORGANISMO,
			String pPTESTADOVERS, String pPTVIDA, String pPTOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_GRABARCONVEMPVERS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDVERSION", "pPIDCONV", "pPTCODCONV", "pPCESTADO", "pPCPERFIL", "pPTDESCRI",
						"pPCORGANISMO", "pPCVIDA", "pPNVERSION", "pPCESTADOVERS", "pPNVERSION_ANT", "pPTESTADO",
						"pPTPERFIL", "pPTORGANISMO", "pPTESTADOVERS", "pPTVIDA", "pPTOBSERV" },
				new Object[] { pPIDVERSION, pPIDCONV, pPTCODCONV, pPCESTADO, pPCPERFIL, pPTDESCRI, pPCORGANISMO,
						pPCVIDA, pPNVERSION, pPCESTADOVERS, pPNVERSION_ANT, pPTESTADO, pPTPERFIL, pPTORGANISMO,
						pPTESTADOVERS, pPTVIDA, pPTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDVERSION);
		cStmt.setObject(3, pPIDCONV);
		cStmt.setObject(4, pPTCODCONV);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPCPERFIL);
		cStmt.setObject(7, pPTDESCRI);
		cStmt.setObject(8, pPCORGANISMO);
		cStmt.setObject(9, pPCVIDA);
		cStmt.setObject(10, pPNVERSION);
		cStmt.setObject(11, pPCESTADOVERS);
		cStmt.setObject(12, pPNVERSION_ANT);
		cStmt.setObject(13, pPTESTADO);
		cStmt.setObject(14, pPTPERFIL);
		cStmt.setObject(15, pPTORGANISMO);
		cStmt.setObject(16, pPTESTADOVERS);
		cStmt.setObject(17, pPTVIDA);
		cStmt.setObject(18, pPTOBSERV);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_GRABARCONVEMPVERS(java.math.BigDecimal pPIDVERSION,
			java.math.BigDecimal pPIDCONV, String pPTCODCONV, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPERFIL, String pPTDESCRI, java.math.BigDecimal pPCORGANISMO,
			java.math.BigDecimal pPCVIDA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCESTADOVERS,
			java.math.BigDecimal pPNVERSION_ANT, String pPTESTADO, String pPTPERFIL, String pPTORGANISMO,
			String pPTESTADOVERS, String pPTVIDA, String pPTOBSERV) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_GRABARCONVEMPVERS(pPIDVERSION, pPIDCONV, pPTCODCONV, pPCESTADO,
				pPCPERFIL, pPTDESCRI, pPCORGANISMO, pPCVIDA, pPNVERSION, pPCESTADOVERS, pPNVERSION_ANT, pPTESTADO,
				pPTPERFIL, pPTORGANISMO, pPTESTADOVERS, pPTVIDA, pPTOBSERV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_GRABARCONVEMPVERS

	// --START-PAC_IAX_PRODUCCION.F_GRABARASEGURADOSMES(PNRIESGO, PMES1, PMES2,
	// PMES3, PMES4, PMES5, PMES6, PMES7, PMES8, PMES9, PMES10, PMES11, PMES12)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARASEGURADOSMES(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPMES1, java.math.BigDecimal pPMES2, java.math.BigDecimal pPMES3,
			java.math.BigDecimal pPMES4, java.math.BigDecimal pPMES5, java.math.BigDecimal pPMES6,
			java.math.BigDecimal pPMES7, java.math.BigDecimal pPMES8, java.math.BigDecimal pPMES9,
			java.math.BigDecimal pPMES10, java.math.BigDecimal pPMES11, java.math.BigDecimal pPMES12) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARASEGURADOSMES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPMES1", "pPMES2", "pPMES3", "pPMES4", "pPMES5", "pPMES6", "pPMES7",
						"pPMES8", "pPMES9", "pPMES10", "pPMES11", "pPMES12" },
				new Object[] { pPNRIESGO, pPMES1, pPMES2, pPMES3, pPMES4, pPMES5, pPMES6, pPMES7, pPMES8, pPMES9,
						pPMES10, pPMES11, pPMES12 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPMES1);
		cStmt.setObject(4, pPMES2);
		cStmt.setObject(5, pPMES3);
		cStmt.setObject(6, pPMES4);
		cStmt.setObject(7, pPMES5);
		cStmt.setObject(8, pPMES6);
		cStmt.setObject(9, pPMES7);
		cStmt.setObject(10, pPMES8);
		cStmt.setObject(11, pPMES9);
		cStmt.setObject(12, pPMES10);
		cStmt.setObject(13, pPMES11);
		cStmt.setObject(14, pPMES12);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARASEGURADOSMES(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPMES1, java.math.BigDecimal pPMES2, java.math.BigDecimal pPMES3,
			java.math.BigDecimal pPMES4, java.math.BigDecimal pPMES5, java.math.BigDecimal pPMES6,
			java.math.BigDecimal pPMES7, java.math.BigDecimal pPMES8, java.math.BigDecimal pPMES9,
			java.math.BigDecimal pPMES10, java.math.BigDecimal pPMES11, java.math.BigDecimal pPMES12) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARASEGURADOSMES(pPNRIESGO, pPMES1, pPMES2, pPMES3, pPMES4, pPMES5,
				pPMES6, pPMES7, pPMES8, pPMES9, pPMES10, pPMES11, pPMES12);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARASEGURADOSMES

	// --START-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB_CARGA(PTIPO, PNRIESGO,
	// PCPREGUN, PCGARANT, PNMOVIMI)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB_CARGA(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB_CARGA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPNRIESGO", "pPCPREGUN", "pPCGARANT", "pPNMOVIMI" },
				new Object[] { pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCPREGUN);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB_CARGA(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB_CARGA(pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT,
				pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB_CARGA
	// --START-PAC_IAX_PRODUCCION.F_CONNECT_UNDW_IF01(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF01(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CONNECT_UNDW_IF01(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_UNDERWRT_IF01".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF01(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF01(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_CONNECT_UNDW_IF01
	// --START-PAC_IAX_PRODUCCION.F_CONNECT_UNDW_IF02(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF02(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CONNECT_UNDW_IF02(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF02(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF02(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_CONNECT_UNDW_IF02
	// --START-PAC_IAX_PRODUCCION.F_INSERT_CITASMEDICAS(PSSEGURO, PNRIESGO,
	// PNMOVIMI, PNOMASEG, PSPERASEG, PSPERMED, PNOMMEDI, PCEVIDEN, PTEVIDEN,
	// PCODEVID, PFEVIDEN, PCESTADO, PTESTADO, PIEVIDEN, PCPAGO, PCTIPEVI, PCAIS)
	private HashMap callPAC_IAX_PRODUCCION__F_INSERT_CITASMEDICAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPNOMASEG,
			java.math.BigDecimal pPSPERASEG, java.math.BigDecimal pPSPERMED, String pPNOMMEDI,
			java.math.BigDecimal pPCEVIDEN, String pPTEVIDEN, String pPCODEVID, String pPFEVIDEN,
			java.math.BigDecimal pPCESTADO, String pPTESTADO, java.math.BigDecimal pPIEVIDEN,
			java.math.BigDecimal pPCPAGO, java.math.BigDecimal pPCTIPEVI, java.math.BigDecimal pPCAIS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_INSERT_CITASMEDICAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPNMOVIMI", "pPNOMASEG", "pPSPERASEG", "pPSPERMED",
						"pPNOMMEDI", "pPCEVIDEN", "pPTEVIDEN", "pPCODEVID", "pPFEVIDEN", "pPCESTADO", "pPTESTADO",
						"pPIEVIDEN", "pPCPAGO", "pPCTIPEVI", "pPCAIS" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPNOMASEG, pPSPERASEG, pPSPERMED, pPNOMMEDI, pPCEVIDEN,
						pPTEVIDEN, pPCODEVID, pPFEVIDEN, pPCESTADO, pPTESTADO, pPIEVIDEN, pPCPAGO, pPCTIPEVI, pPCAIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNOMASEG);
		cStmt.setObject(6, pPSPERASEG);
		cStmt.setObject(7, pPSPERMED);
		cStmt.setObject(8, pPNOMMEDI);
		cStmt.setObject(9, pPCEVIDEN);
		cStmt.setObject(10, pPTEVIDEN);
		cStmt.setObject(11, pPCODEVID);
		cStmt.setObject(12, pPFEVIDEN);
		cStmt.setObject(13, pPCESTADO);
		cStmt.setObject(14, pPTESTADO);
		cStmt.setObject(15, pPIEVIDEN);
		cStmt.setObject(16, pPCPAGO);
		cStmt.setObject(17, pPCTIPEVI);
		cStmt.setObject(18, pPCAIS);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_INSERT_CITASMEDICAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPNOMASEG,
			java.math.BigDecimal pPSPERASEG, java.math.BigDecimal pPSPERMED, String pPNOMMEDI,
			java.math.BigDecimal pPCEVIDEN, String pPTEVIDEN, String pPCODEVID, String pPFEVIDEN,
			java.math.BigDecimal pPCESTADO, String pPTESTADO, java.math.BigDecimal pPIEVIDEN,
			java.math.BigDecimal pPCPAGO, java.math.BigDecimal pPCTIPEVI, java.math.BigDecimal pPCAIS)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_INSERT_CITASMEDICAS(pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPNOMASEG,
				pPSPERASEG, pPSPERMED, pPNOMMEDI, pPCEVIDEN, pPTEVIDEN, pPCODEVID, pPFEVIDEN, pPCESTADO, pPTESTADO,
				pPIEVIDEN, pPCPAGO, pPCTIPEVI, pPCAIS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_INSERT_CITASMEDICAS

	// --START-PAC_IAX_PRODUCCION.F_GET_CITASMEDICAS()
	private HashMap callPAC_IAX_PRODUCCION__F_GET_CITASMEDICAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CITASMEDICAS(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CITAMEDICA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CITASMEDICAS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CITASMEDICAS();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_GET_CITASMEDICAS
	// --START-PAC_IAX_PRODUCCION.F_ELIMINAR_CITASMEDICAS(PNORDEN)
	private HashMap callPAC_IAX_PRODUCCION__F_ELIMINAR_CITASMEDICAS(java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ELIMINAR_CITASMEDICAS(?, ?)}";

		logCall(callQuery, new String[] { "pPNORDEN" }, new Object[] { pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_CITASMEDICAS(java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ELIMINAR_CITASMEDICAS(pPNORDEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_ELIMINAR_CITASMEDICAS
	// --START-PAC_IAX_PRODUCCION.F_EDITAR_CITASMEDICAS(PSSEGURO, PNRIESGO,
	// PNMOVIMI, PNOMASEG, PSPERASEG, PSPERMED, PNOMMEDI, PCEVIDEN, PTEVIDEN,
	// PCODEVID, PFEVIDEN, PCESTADO, PTESTADO, PNORDEN, PIEVIDEN, PCPAGO, PNORDEN_R,
	// PCTIPEVI)
	private HashMap callPAC_IAX_PRODUCCION__F_EDITAR_CITASMEDICAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPNOMASEG,
			java.math.BigDecimal pPSPERASEG, java.math.BigDecimal pPSPERMED, String pPNOMMEDI,
			java.math.BigDecimal pPCEVIDEN, String pPTEVIDEN, String pPCODEVID, String pPFEVIDEN,
			java.math.BigDecimal pPCESTADO, String pPTESTADO, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPIEVIDEN, java.math.BigDecimal pPCPAGO, java.math.BigDecimal pPNORDEN_R,
			java.math.BigDecimal pPCTIPEVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_EDITAR_CITASMEDICAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPNMOVIMI", "pPNOMASEG", "pPSPERASEG", "pPSPERMED",
						"pPNOMMEDI", "pPCEVIDEN", "pPTEVIDEN", "pPCODEVID", "pPFEVIDEN", "pPCESTADO", "pPTESTADO",
						"pPNORDEN", "pPIEVIDEN", "pPCPAGO", "pPNORDEN_R", "pPCTIPEVI" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPNOMASEG, pPSPERASEG, pPSPERMED, pPNOMMEDI, pPCEVIDEN,
						pPTEVIDEN, pPCODEVID, pPFEVIDEN, pPCESTADO, pPTESTADO, pPNORDEN, pPIEVIDEN, pPCPAGO, pPNORDEN_R,
						pPCTIPEVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNOMASEG);
		cStmt.setObject(6, pPSPERASEG);
		cStmt.setObject(7, pPSPERMED);
		cStmt.setObject(8, pPNOMMEDI);
		cStmt.setObject(9, pPCEVIDEN);
		cStmt.setObject(10, pPTEVIDEN);
		cStmt.setObject(11, pPCODEVID);
		cStmt.setObject(12, pPFEVIDEN);
		cStmt.setObject(13, pPCESTADO);
		cStmt.setObject(14, pPTESTADO);
		cStmt.setObject(15, pPNORDEN);
		cStmt.setObject(16, pPIEVIDEN);
		cStmt.setObject(17, pPCPAGO);
		cStmt.setObject(18, pPNORDEN_R);
		cStmt.setObject(19, pPCTIPEVI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(20, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_EDITAR_CITASMEDICAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPNOMASEG,
			java.math.BigDecimal pPSPERASEG, java.math.BigDecimal pPSPERMED, String pPNOMMEDI,
			java.math.BigDecimal pPCEVIDEN, String pPTEVIDEN, String pPCODEVID, String pPFEVIDEN,
			java.math.BigDecimal pPCESTADO, String pPTESTADO, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPIEVIDEN, java.math.BigDecimal pPCPAGO, java.math.BigDecimal pPNORDEN_R,
			java.math.BigDecimal pPCTIPEVI) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_EDITAR_CITASMEDICAS(pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPNOMASEG,
				pPSPERASEG, pPSPERMED, pPNOMMEDI, pPCEVIDEN, pPTEVIDEN, pPCODEVID, pPFEVIDEN, pPCESTADO, pPTESTADO,
				pPNORDEN, pPIEVIDEN, pPCPAGO, pPNORDEN_R, pPCTIPEVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_EDITAR_CITASMEDICAS

	// --START-PAC_IAX_PRODUCCION.F_GET_LISTASEGURA()
	private HashMap callPAC_IAX_PRODUCCION__F_GET_LISTASEGURA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_LISTASEGURA(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_LISTASEGURA() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_LISTASEGURA();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_LISTASEGURA

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PSU_RETENIDAS() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PSU_RETENIDAS();
	}

	private HashMap callPAC_IAX_PRODUCCION__F_GET_PSU_RETENIDAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PSU_RETENIDAS(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PSU_RETENIDAS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	// --START-PAC_IAX_PRODUCCION.F_VAL_TOMADOR_CBANCAR(PSSEGURO, PSPERSON)
	private HashMap callPAC_IAX_PRODUCCION__F_VAL_TOMADOR_CBANCAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_VAL_TOMADOR_CBANCAR(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_VAL_TOMADOR_CBANCAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_VAL_TOMADOR_CBANCAR(pPSSEGURO, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_VAL_TOMADOR_CBANCAR

	/* Bug JMT - 04/04/2016 - JMT */
	/* DATOS CONTACTO */
	// --START-PAC_IAX_PRODUCCION.F_LEEDATOSCONTACTO(NPOLIZA, NCERTIF)
	private HashMap callPAC_IAX_PRODUCCION__F_LEEDATOSCONTACTO(java.math.BigDecimal pNPOLIZA,
			java.math.BigDecimal pNCERTIF) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEDATOSCONTACTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pNPOLIZA", "pNCERTIF" }, new Object[] { pNPOLIZA, pNCERTIF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNPOLIZA);
		cStmt.setObject(3, pNCERTIF);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DATOS_CONTACTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSCONTACTO(java.math.BigDecimal NPOLIZA,
			java.math.BigDecimal NCERTIF) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEDATOSCONTACTO(NPOLIZA, NCERTIF);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEDATOSCONTACTO

	// --START-PAC_IAX_PRODUCCION.F_GUARDADATOSCONTACTO(NPOLIZA, NCERTIF, SPERSONA,
	// TIPOPERS, LMAIL, LTEL)
	private HashMap callPAC_IAX_PRODUCCION__F_GUARDADATOSCONTACTO(java.math.BigDecimal pNPOLIZA,
			java.math.BigDecimal pNCERTIF, java.math.BigDecimal pSPERSONA, java.math.BigDecimal pTIPOPERS,
			java.math.BigDecimal pLMAIL, java.math.BigDecimal pLTEL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GUARDADATOSCONTACTO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNPOLIZA", "pNCERTIF", "pSPERSONA", "pTIPOPERS", "pLMAIL", "pLTEL" },
				new Object[] { pNPOLIZA, pNCERTIF, pSPERSONA, pTIPOPERS, pLMAIL, pLTEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNPOLIZA);
		cStmt.setObject(3, pNCERTIF);
		cStmt.setObject(4, pSPERSONA);
		cStmt.setObject(5, pTIPOPERS);
		cStmt.setObject(6, pLMAIL);
		cStmt.setObject(7, pLTEL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GUARDADATOSCONTACTO(java.math.BigDecimal pNPOLIZA,
			java.math.BigDecimal pNCERTIF, java.math.BigDecimal pSPERSONA, java.math.BigDecimal pTIPOPERS,
			java.math.BigDecimal pLMAIL, java.math.BigDecimal pLTEL) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GUARDADATOSCONTACTO(pNPOLIZA, pNCERTIF, pSPERSONA, pTIPOPERS, pLMAIL,
				pLTEL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GUARDADATOSCONTACTO

	// INI BUG 41143/229973 - 17/03/2016 - JAEG
	// --START-PAC_IAX_PRODUCCION.F_GRABARGARANTIASVIGENCIA(NRIESGO, CGARANT,
	// PFINIVIG, PFFINVIG)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARGARANTIASVIGENCIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARGARANTIASVIGENCIA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT", "pPFINIVIG", "pPFFINVIG" },
				new Object[] { pNRIESGO, pCGARANT, pPFINIVIG, pPFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPFFINVIG);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIASVIGENCIA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARGARANTIASVIGENCIA(pNRIESGO, pCGARANT, pPFINIVIG, pPFFINVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_GRABARGARANTIASVIGENCIA
	// --START-PAC_IAX_PRODUCCION.F_GRABARGARANTIASCOBPRIMA(NRIESGO, CGARANT,
	// CCOBPRIMA)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARGARANTIASCOBPRIMA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCCOBPRIMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARGARANTIASCOBPRIMA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNRIESGO", "pCGARANT", "pCCOBPRIMA" },
				new Object[] { pNRIESGO, pCGARANT, pCCOBPRIMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNRIESGO);
		cStmt.setObject(3, pCGARANT);
		cStmt.setObject(4, pCCOBPRIMA);
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
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIASCOBPRIMA(java.math.BigDecimal pNRIESGO,
			java.math.BigDecimal pCGARANT, java.math.BigDecimal pCCOBPRIMA) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARGARANTIASCOBPRIMA(pNRIESGO, pCGARANT, pCCOBPRIMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARGARANTIASCOBPRIMA
	// FIN BUG 41143/229973 - 17/03/2016 - JAEG

	// --START-PAC_IAX_PRODUCCION.F_BORRAR_SIMULACIONES(PSSEGURO)
	private HashMap callPAC_IAX_PRODUCCION__F_BORRAR_SIMULACIONES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_BORRAR_SIMULACIONES(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_BORRAR_SIMULACIONES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_BORRAR_SIMULACIONES(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_BORRAR_SIMULACIONES
	// --START-PAC_IAX_PRODUCCION.F_GET_CONTRAGARAN()
	private HashMap callPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CONTRAGARAN(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTRAGARAN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CONTRAGARAN

	// --START-PAC_IAX_PRODUCCION.F_REFRESH_CONTRAGARAN()
	private HashMap callPAC_IAX_PRODUCCION__F_REFRESH_CONTRAGARAN() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_REFRESH_CONTRAGARAN(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_REFRESH_CONTRAGARAN() throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_REFRESH_CONTRAGARAN();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION.F_REFRESH_CONTRAGARAN
	// --START-PAC_IAX_PRODUCCION.F_SET_CONTRAGARAN(PSCONTGAR, PCACTIVO)
	private HashMap callPAC_IAX_PRODUCCION__F_SET_CONTRAGARAN(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPCACTIVO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_CONTRAGARAN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR", "pPCACTIVO" }, new Object[] { pPSCONTGAR, pPCACTIVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPCACTIVO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_CONTRAGARAN(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPCACTIVO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_CONTRAGARAN(pPSCONTGAR, pPCACTIVO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_SET_CONTRAGARAN

	// --START-PAC_IAX_PRODUCCION.F_GRABARIEDETALLE(PNRIESGO, PTDESCRIPCION)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARIEDETALLE(java.math.BigDecimal pPNRIESGO, String pPTDESCRIPCION)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARIEDETALLE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPTDESCRIPCION" }, new Object[] { pPNRIESGO, pPTDESCRIPCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPTDESCRIPCION);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDETALLE(java.math.BigDecimal pPNRIESGO, String pPTDESCRIPCION)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARIEDETALLE(pPNRIESGO, pPTDESCRIPCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARIEDETALLE

	// --START-PAC_IAX_PRODUCCION.F_IMPORTE_CAMBIO(P_MONEDA_INICIAL, P_MONEDA_FINAL,
	// P_FECHA, P_IMPORTE, P_REDONDEAR)
	private HashMap callPAC_IAX_PRODUCCION__F_IMPORTE_CAMBIO(String pP_MONEDA_INICIAL, String pP_MONEDA_FINAL,
			java.sql.Date pP_FECHA, java.math.BigDecimal pP_IMPORTE, java.math.BigDecimal pP_REDONDEAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_IMPORTE_CAMBIO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_MONEDA_INICIAL", "pP_MONEDA_FINAL", "pP_FECHA", "pP_IMPORTE", "pP_REDONDEAR" },
				new Object[] { pP_MONEDA_INICIAL, pP_MONEDA_FINAL, pP_FECHA, pP_IMPORTE, pP_REDONDEAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_MONEDA_INICIAL);
		cStmt.setObject(3, pP_MONEDA_FINAL);
		cStmt.setObject(4, pP_FECHA);
		cStmt.setObject(5, pP_IMPORTE);
		cStmt.setObject(6, pP_REDONDEAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "P_MONEDA_FINAL"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "P_CAMBIO"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_MONEDA_FINAL", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_MONEDA_FINAL", null);
		}
		try {
			retVal.put("P_CAMBIO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_CAMBIO", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_IMPORTE_CAMBIO(String pP_MONEDA_INICIAL, String pP_MONEDA_FINAL,
			java.sql.Date pP_FECHA, java.math.BigDecimal pP_IMPORTE, java.math.BigDecimal pP_REDONDEAR)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_IMPORTE_CAMBIO(pP_MONEDA_INICIAL, pP_MONEDA_FINAL, pP_FECHA, pP_IMPORTE,
				pP_REDONDEAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_IMPORTE_CAMBIO

	// --START-PAC_IAX_PRODUCCION.F_ACTUALIZA_FECHAS(PSSEGURO, PFEFECTO, PFINIEFE,
	// PFVENCIM, PFEFEPLAZO, PFVENCPLAZO)
	private HashMap callPAC_IAX_PRODUCCION__F_ACTUALIZA_FECHAS(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFEFECTO,
			java.sql.Date pPFINIEFE, java.sql.Date pPFVENCIM, java.sql.Date pPFEFEPLAZO, java.sql.Date pPFVENCPLAZO,
			java.math.BigDecimal pPCMOTMOV, BigDecimal pPNDIAS, BigDecimal pPNMESES, BigDecimal pPNANOS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ACTUALIZA_FECHAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPFEFECTO", "pPFINIEFE", "pPFVENCIM", "pPFEFEPLAZO", "pPFVENCPLAZO",
						"pPCMOTMOV", "pPNDIAS", "pPNMESES", "pPNANOS" },
				new Object[] { pPSSEGURO, pPFEFECTO, pPFINIEFE, pPFVENCIM, pPFEFEPLAZO, pPFVENCPLAZO, pPCMOTMOV,
						pPNDIAS, pPNMESES, pPNANOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFEFECTO);
		cStmt.setObject(4, pPFINIEFE);
		cStmt.setObject(5, pPFVENCIM);
		cStmt.setObject(6, pPFEFEPLAZO);
		cStmt.setObject(7, pPFVENCPLAZO);
		cStmt.setObject(8, pPCMOTMOV);
		cStmt.setObject(9, pPNDIAS);
		cStmt.setObject(10, pPNMESES);
		cStmt.setObject(11, pPNANOS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ACTUALIZA_FECHAS(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFEFECTO, java.sql.Date pPFINIEFE, java.sql.Date pPFVENCIM, java.sql.Date pPFEFEPLAZO,
			java.sql.Date pPFVENCPLAZO, java.math.BigDecimal pCMOTMOV, BigDecimal pNDIAS, BigDecimal pNMESES,
			BigDecimal pNANOS) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ACTUALIZA_FECHAS(pPSSEGURO, pPFEFECTO, pPFINIEFE, pPFVENCIM, pPFEFEPLAZO,
				pPFVENCPLAZO, pCMOTMOV, pNDIAS, pNMESES, pNANOS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ACTUALIZA_FECHAS

	// --START-PAC_IAX_PRODUCCION.F_GRABARPROPUESTA(P_GRABAR)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARPROPUESTA(java.math.BigDecimal pP_GRABAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARPROPUESTA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_GRABAR" }, new Object[] { pP_GRABAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(5, pP_GRABAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "ONPOLIZA"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OSSEGURO"
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
			retVal.put("ONPOLIZA", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("ONPOLIZA", null);
		}
		try {
			retVal.put("OSSEGURO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OSSEGURO", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARPROPUESTA(java.math.BigDecimal pP_GRABAR) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARPROPUESTA(pP_GRABAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARPROPUESTA(P_GRABAR)

	private HashMap callPAC_IAX_PRODUCCION__F_SET_REINICIO(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFINICIO,
			java.sql.Date pPFFINAL, String pPTTEXTO, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_SET_REINICIO(?, ?, ?, ?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPFINICIO", "pPFFINAL", "pPTTEXTO", "pPCMOTMOV", "pPNMOVIMI" },
				new Object[] { pPSSEGURO, pPFINICIO, pPFFINAL, pPTTEXTO, pPCMOTMOV, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFINICIO);
		cStmt.setObject(4, pPFFINAL);
		cStmt.setObject(5, pPTTEXTO);
		cStmt.setObject(6, pPCMOTMOV);
		cStmt.setObject(7, pPNMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_SET_REINICIO(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFINICIO,
			java.sql.Date pPFFINAL, String pPTTEXTO, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_SET_REINICIO(pPSSEGURO, pPFINICIO, pPFFINAL, pPTTEXTO, pPCMOTMOV,
				pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// TCS_827 - ACL - 27/02/2019 Se agrega la tabla F_CONSULTAPOLIZA_CONTRAG
	// --START-PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA_CONTRAG(PRAMO, PSPRODUC,
	// PNPOLIZA, PNCERT, PNNUMIDE, PSNIP, PBUSCAR, PNSOLICI, PTIPOPERSONA, PCAGENTE,
	// PCMATRIC, PCPOSTAL, PTDOMICI, PTNATRIE, PCSITUAC, P_FILTROPROD, PCPOLCIA,
	// PCCOMPANI, PCACTIVI, PCESTSUPL, PNPOLRELACIONADA, PNPOLINI, PFILAGE,
	// PCSUCURSAL, PCADM, PCMOTOR, PCCHASIS, PNBASTID, PCMODO, PNCONTRATO)
	private HashMap callPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA_CONTRAG(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			java.math.BigDecimal pPNPOLRELACIONADA, String pPNPOLINI, java.math.BigDecimal pPFILAGE,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, java.math.BigDecimal pPCMODO, String pPNCONTRATO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA_CONTRAG(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERT", "pPNNUMIDE", "pPSNIP", "pPBUSCAR",
						"pPNSOLICI", "pPTIPOPERSONA", "pPCAGENTE", "pPCMATRIC", "pPCPOSTAL", "pPTDOMICI", "pPTNATRIE",
						"pPCSITUAC", "pP_FILTROPROD", "pPCPOLCIA", "pPCCOMPANI", "pPCACTIVI", "pPCESTSUPL",
						"pPNPOLRELACIONADA", "pPNPOLINI", "pPFILAGE", "pPCSUCURSAL", "pPCADM", "pPCMOTOR", "pPCCHASIS",
						"pPNBASTID", "pPCMODO", "pPNCONTRATO" },
				new Object[] { pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP, pPBUSCAR, pPNSOLICI,
						pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE, pPCSITUAC, pP_FILTROPROD,
						pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLRELACIONADA, pPNPOLINI, pPFILAGE,
						pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPCMODO, pPNCONTRATO });
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
		cStmt.setObject(22, pPNPOLRELACIONADA);
		cStmt.setObject(23, pPNPOLINI);
		cStmt.setObject(25, pPFILAGE);
		cStmt.setObject(26, pPCSUCURSAL);
		cStmt.setObject(27, pPCADM);
		cStmt.setObject(28, pPCMOTOR);
		cStmt.setObject(29, pPCCHASIS);
		cStmt.setObject(30, pPNBASTID);
		cStmt.setObject(31, pPCMODO);
		cStmt.setObject(32, pPNCONTRATO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA_CONTRAG(java.math.BigDecimal pPRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPNSOLICI,
			java.math.BigDecimal pPTIPOPERSONA, java.math.BigDecimal pPCAGENTE, String pPCMATRIC, String pPCPOSTAL,
			String pPTDOMICI, String pPTNATRIE, java.math.BigDecimal pPCSITUAC, String pP_FILTROPROD, String pPCPOLCIA,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCESTSUPL,
			java.math.BigDecimal pPNPOLRELACIONADA, String pPNPOLINI, java.math.BigDecimal pPFILAGE,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, java.math.BigDecimal pPCMODO, String pPNCONTRATO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA_CONTRAG(pPRAMO, pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE,
				pPSNIP, pPBUSCAR, pPNSOLICI, pPTIPOPERSONA, pPCAGENTE, pPCMATRIC, pPCPOSTAL, pPTDOMICI, pPTNATRIE,
				pPCSITUAC, pP_FILTROPROD, pPCPOLCIA, pPCCOMPANI, pPCACTIVI, pPCESTSUPL, pPNPOLRELACIONADA, pPNPOLINI,
				pPFILAGE, pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPCMODO, pPNCONTRATO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_CONSULTAPOLIZA_CONTRAG

	// --START-PAC_IAX_PRODUCCION.F_GRABARIEDESCRIPCIONIN(PNRIESGO, PTDESCRIPCION,
	// PNASEGUR, PNEDADCOL, PSEXCOL)

	private HashMap callPAC_IAX_PRODUCCION__F_GRABARIEDESCRIPCIONIN(java.math.BigDecimal pPNRIESGO,
			String pPTDESCRIPCION, String pPNASEGUR, java.math.BigDecimal pPNEDADCOL, java.math.BigDecimal pPSEXCOL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARIEDESCRIPCIONIN(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO", "pPTDESCRIPCION", "pPNASEGUR", "pPNEDADCOL", "pPSEXCOL" },
				new Object[] { pPNRIESGO, pPTDESCRIPCION, pPNASEGUR, pPNEDADCOL, pPSEXCOL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPTDESCRIPCION);
		cStmt.setObject(4, pPNASEGUR);
		cStmt.setObject(5, pPNEDADCOL);
		cStmt.setObject(6, pPSEXCOL);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDESCRIPCIONIN(java.math.BigDecimal pPNRIESGO,
			String pPTDESCRIPCION, String pPNASEGUR, java.math.BigDecimal pPNEDADCOL, java.math.BigDecimal pPSEXCOL)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARIEDESCRIPCIONIN(pPNRIESGO, pPTDESCRIPCION, pPNASEGUR, pPNEDADCOL,
				pPSEXCOL);
	}

}
