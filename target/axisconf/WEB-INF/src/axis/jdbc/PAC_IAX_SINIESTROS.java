//Revision:# wngbOKT1FpJkBd4TCt2O9Q== #
package axis.jdbc; //WLS-Ready

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SINIESTROS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_SINIESTROS.class);
	private Connection conn = null;

	public PAC_IAX_SINIESTROS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_PERSONAREL(PNSINIES, PNTRAMIT,
	// PNPERSREL)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_PERSONAREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNPERSREL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_PERSONAREL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNPERSREL" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNPERSREL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNPERSREL);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_PERSONAREL".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_PERSONAREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNPERSREL) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_PERSONAREL(pPNSINIES, pPNTRAMIT, pPNPERSREL);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_PERSONAREL

	// bug 0024690
	// --START-PAC_IAX_SINIESTROS.F_SET_SINTRAMIPERSONAREL(PNSINIES, PNTRAMIT,
	// PNPERSREL, PCTIPIDE, PNNUMIDE, PTNOMBRE, PTAPELLI1, PTAPELLI2, PTTELEFON,
	// PSPERSON, PTDESC, PTNOMBRE2, PTMOVIL, PTEMAIL, PCTIPREL)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_SINTRAMIPERSONAREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNPERSREL, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, String pPTNOMBRE,
			String pPTAPELLI1, String pPTAPELLI2, String pPTTELEFON, java.math.BigDecimal pPSPERSON, String pPTDESC,
			String pPTNOMBRE2, String pPTMOVIL, String pPTEMAIL, java.math.BigDecimal pPCTIPREL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_SINTRAMIPERSONAREL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNPERSREL", "pPCTIPIDE", "pPNNUMIDE", "pPTNOMBRE",
						"pPTAPELLI1", "pPTAPELLI2", "pPTTELEFON", "pPSPERSON", "pPTDESC", "pPTNOMBRE2", "pPTMOVIL",
						"pPTEMAIL", "pPCTIPREL" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNPERSREL, pPCTIPIDE, pPNNUMIDE, pPTNOMBRE, pPTAPELLI1,
						pPTAPELLI2, pPTTELEFON, pPSPERSON, pPTDESC, pPTNOMBRE2, pPTMOVIL, pPTEMAIL, pPCTIPREL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNPERSREL);
		cStmt.setObject(5, pPCTIPIDE);
		cStmt.setObject(6, pPNNUMIDE);
		cStmt.setObject(7, pPTNOMBRE);
		cStmt.setObject(8, pPTAPELLI1);
		cStmt.setObject(9, pPTAPELLI2);
		cStmt.setObject(10, pPTTELEFON);
		cStmt.setObject(11, pPSPERSON);
		cStmt.setObject(12, pPTDESC);
		cStmt.setObject(13, pPTNOMBRE2);
		cStmt.setObject(14, pPTMOVIL);
		cStmt.setObject(15, pPTEMAIL);
		cStmt.setObject(16, pPCTIPREL);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAMIPERSONAREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNPERSREL, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, String pPTNOMBRE,
			String pPTAPELLI1, String pPTAPELLI2, String pPTTELEFON, java.math.BigDecimal pPSPERSON, String pPTDESC,
			String pPTNOMBRE2, String pPTMOVIL, String pPTEMAIL, java.math.BigDecimal pPCTIPREL) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_SINTRAMIPERSONAREL(pPNSINIES, pPNTRAMIT, pPNPERSREL, pPCTIPIDE,
				pPNNUMIDE, pPTNOMBRE, pPTAPELLI1, pPTAPELLI2, pPTTELEFON, pPSPERSON, pPTDESC, pPTNOMBRE2, pPTMOVIL,
				pPTEMAIL, pPCTIPREL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_SINTRAMIPERSONAREL

	// --START-PAC_IAX_SINIESTROS.F_DEL_SINTRAMIPERSONAREL(PNSINIES, PNTRAMIT,
	// PNPERSREL)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_SINTRAMIPERSONAREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNPERSREL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_SINTRAMIPERSONAREL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNPERSREL" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNPERSREL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNPERSREL);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_SINTRAMIPERSONAREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNPERSREL) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_SINTRAMIPERSONAREL(pPNSINIES, pPNTRAMIT, pPNPERSREL);
	}

	// --END-PAC_IAX_SINIESTROS.F_DEL_SINTRAMIPERSONAREL
	// --START-PAC_IAX_SINIESTROS.F_DEL_OBJ_SINTRAM_PAGRECOB_GAR(PNSINIES, PNTRAMIT,
	// PCTIPPAG, PSIDEPAG, PCTIPRES, PCGARANT, PNMOVRES, PNORDEN)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_OBJ_SINTRAM_PAGRECOB_GAR(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_OBJ_SINTRAM_PAGRECOB_GAR(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPPAG", "pPSIDEPAG", "pPCTIPRES", "pPCGARANT",
						"pPNMOVRES", "pPNORDEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG, pPCTIPRES, pPCGARANT, pPNMOVRES, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPPAG);
		cStmt.setObject(5, pPSIDEPAG);
		cStmt.setObject(6, pPCTIPRES);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPNMOVRES);
		cStmt.setObject(9, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJ_SINTRAM_PAGRECOB_GAR(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_OBJ_SINTRAM_PAGRECOB_GAR(pPNSINIES, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG,
				pPCTIPRES, pPCGARANT, pPNMOVRES, pPNORDEN);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_OBJ_SINTRAM_PAGRECOB_GAR
	// --START-PAC_IAX_SINIESTROS.F_SET_SINTRAM_PAGRECOB_GAR2(PSSEGURO, PNTRAMIT,
	// PCTIPPAG, PSIDEPAG, PCTIPRES, PNMOVRES, PCGARANT, PFPERINI, PFPERFIN,
	// PCMONRES, PISINRET, PIIVA, PISUPLID, PIRETENC, PIFRANQ, PCMONPAG,
	// PISINRETPAG, PIIVAPAG, PISUPLIDPAG, PIRETENCPAG, PIFRANQPAG, PFCAMBIO,
	// PIRESRED, PIRESRCM, PPIVA, PPRETENC, PCCONPAG, PNORDEN)
	/*
	 * private HashMap callPAC_IAX_SINIESTROS__F_SET_SINTRAM_PAGRECOB_GAR2
	 * (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNTRAMIT,
	 * java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
	 * java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES,
	 * java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date
	 * pPFPERFIN, String pPCMONRES, java.math.BigDecimal pPISINRET,
	 * java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
	 * java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String
	 * pPCMONPAG, java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG,
	 * java.math.BigDecimal pPISUPLIDPAG, java.math.BigDecimal pPIRETENCPAG,
	 * java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
	 * java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM,
	 * java.math.BigDecimal pPPIVA, java.math.BigDecimal pPPRETENC,
	 * java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN) throws
	 * Exception { String
	 * callQuery="{?=call PAC_IAX_SINIESTROS.F_SET_SINTRAM_PAGRECOB_GAR2(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPSSEGURO", "pPNTRAMIT", "pPCTIPPAG",
	 * "pPSIDEPAG", "pPCTIPRES", "pPNMOVRES", "pPCGARANT", "pPFPERINI", "pPFPERFIN",
	 * "pPCMONRES", "pPISINRET", "pPIIVA", "pPISUPLID", "pPIRETENC", "pPIFRANQ",
	 * "pPCMONPAG", "pPISINRETPAG", "pPIIVAPAG", "pPISUPLIDPAG", "pPIRETENCPAG",
	 * "pPIFRANQPAG", "pPFCAMBIO", "pPIRESRED", "pPIRESRCM", "pPPIVA", "pPPRETENC",
	 * "pPCCONPAG", "pPNORDEN"}, new Object[] {pPSSEGURO, pPNTRAMIT, pPCTIPPAG,
	 * pPSIDEPAG, pPCTIPRES, pPNMOVRES, pPCGARANT, pPFPERINI, pPFPERFIN, pPCMONRES,
	 * pPISINRET, pPIIVA, pPISUPLID, pPIRETENC, pPIFRANQ, pPCMONPAG, pPISINRETPAG,
	 * pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG, pPIFRANQPAG, pPFCAMBIO, pPIRESRED,
	 * pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSSEGURO); cStmt.setObject(3, pPNTRAMIT); cStmt.setObject(4, pPCTIPPAG);
	 * cStmt.setObject(5, pPSIDEPAG); cStmt.setObject(6, pPCTIPRES);
	 * cStmt.setObject(7, pPNMOVRES); cStmt.setObject(8, pPCGARANT);
	 * cStmt.setObject(9, pPFPERINI); cStmt.setObject(10, pPFPERFIN);
	 * cStmt.setObject(11, pPCMONRES); cStmt.setObject(12, pPISINRET);
	 * cStmt.setObject(13, pPIIVA); cStmt.setObject(14, pPISUPLID);
	 * cStmt.setObject(15, pPIRETENC); cStmt.setObject(16, pPIFRANQ);
	 * cStmt.setObject(17, pPCMONPAG); cStmt.setObject(18, pPISINRETPAG);
	 * cStmt.setObject(19, pPIIVAPAG); cStmt.setObject(20, pPISUPLIDPAG);
	 * cStmt.setObject(21, pPIRETENCPAG); cStmt.setObject(22, pPIFRANQPAG);
	 * cStmt.setObject(23, pPFCAMBIO); cStmt.setObject(24, pPIRESRED);
	 * cStmt.setObject(25, pPIRESRCM); cStmt.setObject(26, pPPIVA);
	 * cStmt.setObject(27, pPPRETENC); cStmt.setObject(28, pPCCONPAG);
	 * cStmt.setObject(29, pPNORDEN); cStmt.registerOutParameter(1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(30,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal=new HashMap(); try { retVal.put("RETURN", cStmt.getObject(1));
	 * } catch (SQLException e) { retVal.put("RETURN", null); } try {
	 * retVal.put("MENSAJES", cStmt.getObject(30)); } catch (SQLException e) {
	 * retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAM_PAGRECOB_GAR2
	 * (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNTRAMIT,
	 * java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
	 * java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES,
	 * java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date
	 * pPFPERFIN, String pPCMONRES, java.math.BigDecimal pPISINRET,
	 * java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
	 * java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String
	 * pPCMONPAG, java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG,
	 * java.math.BigDecimal pPISUPLIDPAG, java.math.BigDecimal pPIRETENCPAG,
	 * java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
	 * java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM,
	 * java.math.BigDecimal pPPIVA, java.math.BigDecimal pPPRETENC,
	 * java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN) throws
	 * Exception { return
	 * this.callPAC_IAX_SINIESTROS__F_SET_SINTRAM_PAGRECOB_GAR2(pPSSEGURO,
	 * pPNTRAMIT, pPCTIPPAG, pPSIDEPAG, pPCTIPRES, pPNMOVRES, pPCGARANT, pPFPERINI,
	 * pPFPERFIN, pPCMONRES, pPISINRET, pPIIVA, pPISUPLID, pPIRETENC, pPIFRANQ,
	 * pPCMONPAG, pPISINRETPAG, pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG, pPIFRANQPAG,
	 * pPFCAMBIO, pPIRESRED, pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN); }
	 */
	// --END-PAC_IAX_SINIESTROS.F_SET_SINTRAM_PAGRECOB_GAR2

	// --START-PAC_IAX_SINIESTROS.F_ALTASINIESTRO_OLD()
	private HashMap callPAC_IAX_SINIESTROS__F_ALTASINIESTRO_OLD() throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_ALTASINIESTRO_OLD(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "ONSINIES"
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
			retVal.put("ONSINIES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("ONSINIES", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_ALTASINIESTRO_OLD() throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_ALTASINIESTRO_OLD();
	}
	// --END-PAC_IAX_SINIESTROS.F_ALTASINIESTRO_OLD

	// Inicio IAXIS-2169 AABC Adicion campo Fecha de apertura
	// --START-PAC_IAX_SINIESTROS.F_CONSULTASINI(PCRAMO, PSPRODUC, PNPOLIZA,
	// PNCERTIF, PNSINIES, PCESTSIN, PNNUMIDE, PSNIP, PBUSCAR, PTIPOPERS, PNSUBEST,
	// PNSINCIA, PFALTA, PCCOMPANI, PNPRESIN, PCSIGLAS, PTNOMVIA, PNNUMVIA,
	// PTCOMPLE, PCPOSTAL, PCPOBLAC, PCPROVIN, PFGISX, PFGISY, PFGISZ, PTDESCRI,
	// PCTIPMAT, PCMATRIC, PTIPORISC, PCPOLCIA, PCACTIVI, PFILTRO, PCAGENTE,
	// PCMOTOR, PCCHASIS, PNBASTID, PTREFEXT, PCTIPREF, PTDESCRIE, PNCONTRATO)
	private HashMap callPAC_IAX_SINIESTROS__F_CONSULTASINI(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, String pPNSINIES,
			java.math.BigDecimal pPCESTSIN, String pPNNUMIDE, String pPSNIP, String pPBUSCAR,
			java.math.BigDecimal pPTIPOPERS, java.math.BigDecimal pPNSUBEST, String pPNSINCIA, java.sql.Date pPFALTA,
			java.math.BigDecimal pPCCOMPANI, String pPNPRESIN, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY,
			java.math.BigDecimal pPFGISZ, String pPTDESCRI, java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPTIPORISC, String pPCPOLCIA, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCAGENTE, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, String pPTREFEXT, java.math.BigDecimal pPCTIPREF, String pPTDESCRIE, String pPNCONTRATO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_CONSULTASINI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPCESTSIN", "pPNNUMIDE",
						"pPSNIP", "pPBUSCAR", "pPTIPOPERS", "pPNSUBEST", "pPNSINCIA", "pPFALTA", "pPCCOMPANI",
						"pPNPRESIN", "pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPCPOSTAL", "pPCPOBLAC",
						"pPCPROVIN", "pPFGISX", "pPFGISY", "pPFGISZ", "pPTDESCRI", "pPCTIPMAT", "pPCMATRIC",
						"pPTIPORISC", "pPCPOLCIA", "pPCACTIVI", "pPFILTRO", "pPCAGENTE", "pPCMOTOR", "pPCCHASIS",
						"pPNBASTID", "pPTREFEXT", "pPCTIPREF", "pPTDESCRIE", "pPNCONTRATO" },
				new Object[] { pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPNNUMIDE, pPSNIP,
						pPBUSCAR, pPTIPOPERS, pPNSUBEST, pPNSINCIA, pPFALTA, pPCCOMPANI, pPNPRESIN, pPCSIGLAS,
						pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPFGISX, pPFGISY, pPFGISZ,
						pPTDESCRI, pPCTIPMAT, pPCMATRIC, pPTIPORISC, pPCPOLCIA, pPCACTIVI, pPFILTRO, pPCAGENTE,
						pPCMOTOR, pPCCHASIS, pPNBASTID, pPTREFEXT, pPCTIPREF, pPTDESCRIE, pPNCONTRATO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPNCERTIF);
		cStmt.setObject(6, pPNSINIES);
		cStmt.setObject(7, pPCESTSIN);
		cStmt.setObject(8, pPNNUMIDE);
		cStmt.setObject(9, pPSNIP);
		cStmt.setObject(10, pPBUSCAR);
		cStmt.setObject(11, pPTIPOPERS);
		cStmt.setObject(12, pPNSUBEST);
		cStmt.setObject(13, pPNSINCIA);
		cStmt.setObject(14, pPFALTA);
		cStmt.setObject(15, pPCCOMPANI);
		cStmt.setObject(16, pPNPRESIN);
		cStmt.setObject(17, pPCSIGLAS);
		cStmt.setObject(18, pPTNOMVIA);
		cStmt.setObject(19, pPNNUMVIA);
		cStmt.setObject(20, pPTCOMPLE);
		cStmt.setObject(21, pPCPOSTAL);
		cStmt.setObject(22, pPCPOBLAC);
		cStmt.setObject(23, pPCPROVIN);
		cStmt.setObject(24, pPFGISX);
		cStmt.setObject(25, pPFGISY);
		cStmt.setObject(26, pPFGISZ);
		cStmt.setObject(27, pPTDESCRI);
		cStmt.setObject(28, pPCTIPMAT);
		cStmt.setObject(29, pPCMATRIC);
		cStmt.setObject(30, pPTIPORISC);
		cStmt.setObject(31, pPCPOLCIA);
		cStmt.setObject(32, pPCACTIVI);
		cStmt.setObject(33, pPFILTRO);
		cStmt.setObject(34, pPCAGENTE);
		cStmt.setObject(35, pPCMOTOR);
		cStmt.setObject(36, pPCCHASIS);
		cStmt.setObject(37, pPNBASTID);
		cStmt.setObject(38, pPTREFEXT);
		cStmt.setObject(39, pPCTIPREF);
		cStmt.setObject(40, pPTDESCRIE);
		cStmt.setObject(41, pPNCONTRATO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(42, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(42));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_CONSULTASINI(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPNSINIES, java.math.BigDecimal pPCESTSIN, String pPNNUMIDE, String pPSNIP, String pPBUSCAR,
			java.math.BigDecimal pPTIPOPERS, java.math.BigDecimal pPNSUBEST, String pPNSINCIA, java.sql.Date pPFALTA,
			java.math.BigDecimal pPCCOMPANI, String pPNPRESIN, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY,
			java.math.BigDecimal pPFGISZ, String pPTDESCRI, java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPTIPORISC, String pPCPOLCIA, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCAGENTE, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, String pPTREFEXT, java.math.BigDecimal pPCTIPREF, String pPTDESCRIE, String pPNCONTRATO)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_CONSULTASINI(pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNSINIES,
				pPCESTSIN, pPNNUMIDE, pPSNIP, pPBUSCAR, pPTIPOPERS, pPNSUBEST, pPNSINCIA, pPFALTA, pPCCOMPANI,
				pPNPRESIN, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPFGISX,
				pPFGISY, pPFGISZ, pPTDESCRI, pPCTIPMAT, pPCMATRIC, pPTIPORISC, pPCPOLCIA, pPCACTIVI, pPFILTRO,
				pPCAGENTE, pPCMOTOR, pPCCHASIS, pPNBASTID, pPTREFEXT, pPCTIPREF, pPTDESCRIE, pPNCONTRATO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_CONSULTASINI
	// Fin IAXIS-2169 AABC Adicion campo Fecha de apertura
	// --START-PAC_IAX_SINIESTROS.F_CONSULTASINI_OLD(PNPOLIZA, PNCERTIF, PNSINIES,
	// PCESTSIN, PNNUMIDE, PSNIP, PBUSCAR, PTIPOPERS, PNSUBEST)
	private HashMap callPAC_IAX_SINIESTROS__F_CONSULTASINI_OLD(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCESTSIN,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPTIPOPERS,
			java.math.BigDecimal pPNSUBEST) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_CONSULTASINI_OLD(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPCESTSIN", "pPNNUMIDE", "pPSNIP", "pPBUSCAR",
						"pPTIPOPERS", "pPNSUBEST" },
				new Object[] { pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPNNUMIDE, pPSNIP, pPBUSCAR, pPTIPOPERS,
						pPNSUBEST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPCESTSIN);
		cStmt.setObject(6, pPNNUMIDE);
		cStmt.setObject(7, pPSNIP);
		cStmt.setObject(8, pPBUSCAR);
		cStmt.setObject(9, pPTIPOPERS);
		cStmt.setObject(10, pPNSUBEST);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_CONSULTASINI_OLD(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCESTSIN,
			String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPTIPOPERS,
			java.math.BigDecimal pPNSUBEST) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_CONSULTASINI_OLD(pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPNNUMIDE,
				pPSNIP, pPBUSCAR, pPTIPOPERS, pPNSUBEST);
	}

	// --START-PAC_IAX_SINIESTROS.F_SIN_CALCULA_IMPORTE(PCMONRES, PCMONRESORI,
	// PVALOR, PVALORCONVERTIDO) AABC IAXIS-5454
	// IAXIS_14872 AABC cambios paa reservas de gastos y Ulae
	private HashMap callPAC_IAX_SINIESTROS__F_SIN_CALCULA_IMPORTE(String pPCMONRES, String pPCMONRESORI,
			java.math.BigDecimal pPVALOR, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCTIPRES,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SIN_CALCULA_IMPORTE(?, ?, ?, ?, ? , ? , ? , ?)}";

		logCall(callQuery, new String[] { "pPCMONRES", "pPCMONRESORI", "pPVALOR" },
				new Object[] { pPCMONRES, pPCMONRESORI, pPVALOR, pPNSINIES, pPCTIPRES, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMONRES);
		cStmt.setObject(3, pPCMONRESORI);
		cStmt.setObject(4, pPVALOR);
		cStmt.setObject(5, pPNSINIES);
		cStmt.setObject(6, pPCTIPRES);
		cStmt.setObject(7, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PNDANOUT"
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
			retVal.put("PVALORCONVERTIDO", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PVALORCONVERTIDO", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SIN_CALCULA_IMPORTE(String pPCMONRES, String pPCMONRESORI,
			java.math.BigDecimal pPVALOR, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCTIPRES,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SIN_CALCULA_IMPORTE(pPCMONRES, pPCMONRESORI, pPVALOR, pPNSINIES,
				pPCTIPRES, pPCGARANT);
	}

	// --END-PAC_IAX_SINIESTROS.F_CONSULTASINI_OLD
	// --START-PAC_IAX_SINIESTROS.F_CONSULTA_LSTSINI(PNPOLIZA, PNCERTIF, PNSINIES,
	// PCESTSIN, PFILTRO, PNRIESGO)
	private HashMap callPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_CONSULTA_LSTSINI(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPCESTSIN", "pPFILTRO", "pPNRIESGO" },
				new Object[] { pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPFILTRO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPCESTSIN);
		cStmt.setObject(6, pPFILTRO);
		cStmt.setObject(7, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI(pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPFILTRO,
				pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_CONSULTA_LSTSINI

	// --START-PAC_IAX_SINIESTROS.F_DEL_DANYO(PNSINIES, PNTRAMIT, PNDANO)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_DANYO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDANO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_DANYO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDANO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDANO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDANO);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_DANYO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDANO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_DANYO(pPNSINIES, pPNTRAMIT, pPNDANO);
	}

	// --END-PAC_IAX_SINIESTROS.F_DEL_DANYO
	// --START-PAC_IAX_SINIESTROS.F_DEL_DESTINATARIO(PNSINIES, PNTRAMIT, PCTIPDES,
	// PSPERSON)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_DESTINATARIO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_DESTINATARIO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPDES", "pPSPERSON" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPDES, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPDES);
		cStmt.setObject(5, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_DESTINATARIO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_DESTINATARIO(pPNSINIES, pPNTRAMIT, pPCTIPDES, pPSPERSON);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_DESTINATARIO

	// --START-PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMIAGENDA(PNSINIES, PNTRAMIT,
	// PNLINAGE, PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMIAGENDA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINAGE, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMIAGENDA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINAGE", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINAGE, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINAGE);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMIAGENDA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINAGE, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMIAGENDA(pPNSINIES, pPNTRAMIT, pPNLINAGE, pPSPRODUC,
				pPCACTIVI);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMIAGENDA

	// --START-PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMILOCALI(PNSINIES, PNTRAMIT,
	// PNLOCALI)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMILOCALI(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMILOCALI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLOCALI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLOCALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLOCALI);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMILOCALI(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMILOCALI(pPNSINIES, pPNTRAMIT, pPNLOCALI);
	}

	// --END-PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMILOCALI
	// --START-PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMITACION(PNSINIES, PNTRAMIT,
	// PCTIPTRA)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMITACION(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMITACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPTRA" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPTRA);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMITACION(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPTRA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMITACION(pPNSINIES, pPNTRAMIT, pPCTIPTRA);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_OBJETO_SINTRAMITACION
	// --END-PAC_IAX_SINIESTROS.F_DEL_OBJ_SINTRAM_PAGRECOB_GAR
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_PAGRECOB_GAR(PSSEGURO, PNTRAMIT,
	// PCTIPPAG, PSIDEPAG, PCTIPRES, PNMOVRES, PCGARANT, PFPERINI, PFPERFIN,
	// PCMONRES, PISINRET, PIIVA, PISUPLID, PIRETENC, PIFRANQ, PCMONPAG,
	// PISINRETPAG, PIIVAPAG, PISUPLIDPAG, PIRETENCPAG, PIFRANQPAG, PFCAMBIO,
	// PIRESRED, PIRESRCM, PPIVA, PPRETENC, PCCONPAG, PNORDEN)
	/*
	 * private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_PAGRECOB_GAR
	 * (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNTRAMIT,
	 * java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
	 * java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES,
	 * java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date
	 * pPFPERFIN, String pPCMONRES, java.math.BigDecimal pPISINRET,
	 * java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
	 * java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String
	 * pPCMONPAG, java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG,
	 * java.math.BigDecimal pPISUPLIDPAG, java.math.BigDecimal pPIRETENCPAG,
	 * java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
	 * java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM,
	 * java.math.BigDecimal pPPIVA, java.math.BigDecimal pPPRETENC,
	 * java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN) throws
	 * Exception { String
	 * callQuery="{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_PAGRECOB_GAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPSSEGURO", "pPNTRAMIT", "pPCTIPPAG",
	 * "pPSIDEPAG", "pPCTIPRES", "pPNMOVRES", "pPCGARANT", "pPFPERINI", "pPFPERFIN",
	 * "pPCMONRES", "pPISINRET", "pPIIVA", "pPISUPLID", "pPIRETENC", "pPIFRANQ",
	 * "pPCMONPAG", "pPISINRETPAG", "pPIIVAPAG", "pPISUPLIDPAG", "pPIRETENCPAG",
	 * "pPIFRANQPAG", "pPFCAMBIO", "pPIRESRED", "pPIRESRCM", "pPPIVA", "pPPRETENC",
	 * "pPCCONPAG", "pPNORDEN"}, new Object[] {pPSSEGURO, pPNTRAMIT, pPCTIPPAG,
	 * pPSIDEPAG, pPCTIPRES, pPNMOVRES, pPCGARANT, pPFPERINI, pPFPERFIN, pPCMONRES,
	 * pPISINRET, pPIIVA, pPISUPLID, pPIRETENC, pPIFRANQ, pPCMONPAG, pPISINRETPAG,
	 * pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG, pPIFRANQPAG, pPFCAMBIO, pPIRESRED,
	 * pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSSEGURO); cStmt.setObject(3, pPNTRAMIT); cStmt.setObject(4, pPCTIPPAG);
	 * cStmt.setObject(5, pPSIDEPAG); cStmt.setObject(6, pPCTIPRES);
	 * cStmt.setObject(7, pPNMOVRES); cStmt.setObject(8, pPCGARANT);
	 * cStmt.setObject(9, pPFPERINI); cStmt.setObject(10, pPFPERFIN);
	 * cStmt.setObject(11, pPCMONRES); cStmt.setObject(12, pPISINRET);
	 * cStmt.setObject(13, pPIIVA); cStmt.setObject(14, pPISUPLID);
	 * cStmt.setObject(15, pPIRETENC); cStmt.setObject(16, pPIFRANQ);
	 * cStmt.setObject(17, pPCMONPAG); cStmt.setObject(18, pPISINRETPAG);
	 * cStmt.setObject(19, pPIIVAPAG); cStmt.setObject(20, pPISUPLIDPAG);
	 * cStmt.setObject(21, pPIRETENCPAG); cStmt.setObject(22, pPIFRANQPAG);
	 * cStmt.setObject(23, pPFCAMBIO); cStmt.setObject(24, pPIRESRED);
	 * cStmt.setObject(25, pPIRESRCM); cStmt.setObject(26, pPPIVA);
	 * cStmt.setObject(27, pPPRETENC); cStmt.setObject(28, pPCCONPAG);
	 * cStmt.setObject(29, pPNORDEN); cStmt.registerOutParameter(1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(30,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal=new HashMap(); try { retVal.put("RETURN", cStmt.getObject(1));
	 * } catch (SQLException e) { retVal.put("RETURN", null); } try {
	 * retVal.put("MENSAJES", cStmt.getObject(30)); } catch (SQLException e) {
	 * retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_PAGRECOB_GAR
	 * (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNTRAMIT,
	 * java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
	 * java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES,
	 * java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date
	 * pPFPERFIN, String pPCMONRES, java.math.BigDecimal pPISINRET,
	 * java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
	 * java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String
	 * pPCMONPAG, java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG,
	 * java.math.BigDecimal pPISUPLIDPAG, java.math.BigDecimal pPIRETENCPAG,
	 * java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
	 * java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM,
	 * java.math.BigDecimal pPPIVA, java.math.BigDecimal pPPRETENC,
	 * java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN) throws
	 * Exception { return
	 * this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_PAGRECOB_GAR(pPSSEGURO,
	 * pPNTRAMIT, pPCTIPPAG, pPSIDEPAG, pPCTIPRES, pPNMOVRES, pPCGARANT, pPFPERINI,
	 * pPFPERFIN, pPCMONRES, pPISINRET, pPIIVA, pPISUPLID, pPIRETENC, pPIFRANQ,
	 * pPCMONPAG, pPISINRETPAG, pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG, pPIFRANQPAG,
	 * pPFCAMBIO, pPIRESRED, pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN); }
	 */
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_PAGRECOB_GAR

	// --START-PAC_IAX_SINIESTROS.F_GET_ASEGURADOS(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_ASEGURADOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_ASEGURADOS(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_ASEGURADOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_ASEGURADOS(pPSSEGURO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_ASEGURADOS
	// --START-PAC_IAX_SINIESTROS.F_GET_DETALLESPAGOS(PNSINIES, PNTRAMIT, PCTIPRES,
	// PCTIPPAG, PCGARANT, PSIDEPAG, PNMOVRES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_DETALLESPAGOS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPNMOVRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_DETALLESPAGOS(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPCTIPPAG", "pPCGARANT", "pPSIDEPAG",
						"pPNMOVRES" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPPAG, pPCGARANT, pPSIDEPAG, pPNMOVRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPCTIPPAG);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPSIDEPAG);
		cStmt.setObject(8, pPNMOVRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.CURSOR); // Valor de "DETALLESPAGOS"
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
			retVal.put("DETALLESPAGOS", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("DETALLESPAGOS", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_DETALLESPAGOS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPNMOVRES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_DETALLESPAGOS(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPPAG, pPCGARANT,
				pPSIDEPAG, pPNMOVRES);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_DETALLESPAGOS
	// --START-PAC_IAX_SINIESTROS.F_GET_DOCUMENTACION_OLD(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_DOCUMENTACION_OLD(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_OLD(pPSSEGURO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_DOCUMENTACION_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_FRANQUICIA_GARANTIA(PSSEGURO, PNRIESGO,
	// PCGARANT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_FRANQUICIA_GARANTIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_FRANQUICIA_GARANTIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCGARANT" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_FRANQUICIA_GARANTIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_FRANQUICIA_GARANTIA(pPSSEGURO, pPNRIESGO, pPCGARANT);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_FRANQUICIA_GARANTIA

	// --START-PAC_IAX_SINIESTROS.F_GET_GARANTIAS(PSSEGURO, PNRIESGO, PCCAUSIN,
	// PCMOTSIN, PFSINIES, PORIGEN, PCTRAMIT, PNSINIES, PNTRAMIT, PCTIPRES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_GARANTIAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN,
			java.sql.Date pPFSINIES, java.math.BigDecimal pPORIGEN, java.math.BigDecimal pPCTRAMIT,
			java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_GARANTIAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPCCAUSIN", "pPCMOTSIN", "pPFSINIES", "pPORIGEN", "pPCTRAMIT",
						"pPNSINIES", "pPNTRAMIT", "pPCTIPRES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCCAUSIN, pPCMOTSIN, pPFSINIES, pPORIGEN, pPCTRAMIT, pPNSINIES,
						pPNTRAMIT, pPCTIPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCCAUSIN);
		cStmt.setObject(5, pPCMOTSIN);
		cStmt.setObject(6, pPFSINIES);
		cStmt.setObject(7, pPORIGEN);
		cStmt.setObject(8, pPCTRAMIT);
		cStmt.setObject(9, pPNSINIES);
		cStmt.setObject(10, pPNTRAMIT);
		cStmt.setObject(11, pPCTIPRES);
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
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_GARANTIAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN,
			java.sql.Date pPFSINIES, java.math.BigDecimal pPORIGEN, java.math.BigDecimal pPCTRAMIT,
			java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPRES)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_GARANTIAS(pPSSEGURO, pPNRIESGO, pPCCAUSIN, pPCMOTSIN, pPFSINIES,
				pPORIGEN, pPCTRAMIT, pPNSINIES, pPNTRAMIT, pPCTIPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_GARANTIAS

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIAGENDA(PNSINIES, PNTRAMIT,
	// PNLINAGE)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIAGENDA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIAGENDA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINAGE" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINAGE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_AGENDA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIAGENDA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINAGE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIAGENDA(pPNSINIES, pPNTRAMIT, pPNLINAGE);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIAGENDA
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDANYO(PNSINIES, PNTRAMIT,
	// PNDANO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDANYO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDANO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDANYO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDANO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDANO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDANO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_DANO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDANYO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDANO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDANYO(pPNSINIES, pPNTRAMIT, pPNDANO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDANYO
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMILOCALI(PNSINIES, PNTRAMIT,
	// PNLOCALI)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMILOCALI(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMILOCALI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLOCALI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLOCALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLOCALI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_LOCALIZA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMILOCALI(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMILOCALI(pPNSINIES, pPNTRAMIT, pPNLOCALI);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMILOCALI
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMITACION(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMITACION(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMITACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMITACION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMITACION(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMITACION(pPNSINIES, pPNTRAMIT);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMITACION
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_ULT_SINMOVTRAMIT(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_ULT_SINMOVTRAMIT(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_ULT_SINMOVTRAMIT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_MOVIMIENTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_ULT_SINMOVTRAMIT(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_ULT_SINMOVTRAMIT(pPNSINIES, pPNTRAMIT);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_ULT_SINMOVTRAMIT
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJRESERVAS_CALC(PSSEGURO, PNSINIES,
	// PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJRESERVAS_CALC(java.math.BigDecimal pPSSEGURO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJRESERVAS_CALC(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMI_RESERVA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJRESERVAS_CALC(java.math.BigDecimal pPSSEGURO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJRESERVAS_CALC(pPSSEGURO, pPNSINIES, pPNTRAMIT);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJRESERVAS_CALC
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIDESTINATARI(PSSEGURO, PNSINIES,
	// PNTRAMIT, PCTIPDES, PSPERSON)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARI(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIDESTINATARI(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCTIPDES", "pPSPERSON" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPDES, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_DESTINATARIO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARI(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARI(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPDES,
				pPSPERSON);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIDESTINATARI
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIDESTINATARIS(PSSEGURO, PNSINIES,
	// PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARIS(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIDESTINATARIS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMI_DESTINATARIO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARIS(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARIS(pPSSEGURO, pPNSINIES, pPNTRAMIT);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIDESTINATARIS
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIPAGORECOB(PSSEGURO, PNSINIES,
	// PNTRAMIT, PCTIPPAG, PSIDEPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIPAGORECOB(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIPAGORECOB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCTIPPAG", "pPSIDEPAG" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTIPPAG);
		cStmt.setObject(6, pPSIDEPAG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_PAGO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIPAGORECOB(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIPAGORECOB(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPPAG,
				pPSIDEPAG);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAMIPAGORECOB
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAM_PAGRECOB_GAR(PSSEGURO, PNSINIES,
	// PNTRAMIT, PCTIPPAG, PSIDEPAG, PCTIPRES, PNMOVRES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAM_PAGRECOB_GAR(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAM_PAGRECOB_GAR(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCTIPPAG", "pPSIDEPAG", "pPCTIPRES",
						"pPNMOVRES", "pPNORDEN" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG, pPCTIPRES, pPNMOVRES, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTIPPAG);
		cStmt.setObject(6, pPSIDEPAG);
		cStmt.setObject(7, pPCTIPRES);
		cStmt.setObject(8, pPNMOVRES);
		cStmt.setObject(9, pPNORDEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_PAGO_GAR".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAM_PAGRECOB_GAR(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAM_PAGRECOB_GAR(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPPAG,
				pPSIDEPAG, pPCTIPRES, pPNMOVRES, pPNORDEN);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJ_SINTRAM_PAGRECOB_GAR
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJ_ULTIM_MOVPAGORECOB(PSSEGURO, PNSINIES,
	// PNTRAMIT, PCTIPPAG, PSIDEPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJ_ULTIM_MOVPAGORECOB(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJ_ULTIM_MOVPAGORECOB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCTIPPAG", "pPSIDEPAG" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTIPPAG);
		cStmt.setObject(6, pPSIDEPAG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_MOVPAGO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_ULTIM_MOVPAGORECOB(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJ_ULTIM_MOVPAGORECOB(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPPAG,
				pPSIDEPAG);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_OBJ_ULTIM_MOVPAGORECOB
	// --START-PAC_IAX_SINIESTROS.F_GET_PAGOSPORSINIESTRO(PNSINIES, PCTIPPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_PAGOSPORSINIESTRO(String pPNSINIES, java.math.BigDecimal pPCTIPPAG)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_PAGOSPORSINIESTRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPCTIPPAG" }, new Object[] { pPNSINIES, pPCTIPPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPCTIPPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PAGOSPORSINISTRO"
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
			retVal.put("PAGOSPORSINISTRO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PAGOSPORSINISTRO", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_PAGOSPORSINIESTRO(String pPNSINIES, java.math.BigDecimal pPCTIPPAG)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_PAGOSPORSINIESTRO(pPNSINIES, pPCTIPPAG);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_PAGOSPORSINIESTRO
	// --START-PAC_IAX_SINIESTROS.F_GET_POLGARANTIAS_OLD(PSSEGURO, PNRIESGO,
	// PFSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLGARANTIAS_OLD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLGARANTIAS_OLD(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFSINIES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFSINIES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLGARANTIAS_OLD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLGARANTIAS_OLD(pPSSEGURO, pPNRIESGO, pPFSINIES);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_POLGARANTIAS_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_POLLASTRECIBO(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLLASTRECIBO(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO(pPSSEGURO);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_POLLASTRECIBO

	// --START-PAC_IAX_SINIESTROS.F_GET_POLLASTRECIBO_OLD(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLLASTRECIBO_OLD(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO_OLD(pPSSEGURO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_POLLASTRECIBO_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_POLRECIBOS_OLD(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLRECIBOS_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLRECIBOS_OLD(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLRECIBOS_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLRECIBOS_OLD(pPSSEGURO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_POLRECIBOS_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_POLRIESGOS_OLD(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLRIESGOS_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLRIESGOS_OLD(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RIESGOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLRIESGOS_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLRIESGOS_OLD(pPSSEGURO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_POLRIESGOS_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_POLTOMADORES(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLTOMADORES(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TOMADORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(pPSSEGURO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_POLTOMADORES
	// --START-PAC_IAX_SINIESTROS.F_GET_POLTOMADORES_OLD(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLTOMADORES_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLTOMADORES_OLD(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TOMADORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES_OLD(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLTOMADORES_OLD(pPSSEGURO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_POLTOMADORES_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_SINIESTRO()
	private HashMap callPAC_IAX_SINIESTROS__F_GET_SINIESTRO() throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_SINIESTRO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SINIESTROS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO() throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_SINIESTRO
	// --START-PAC_IAX_SINIESTROS.F_GET_SINIESTRO_OLD(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_SINIESTRO_OLD(java.math.BigDecimal pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_SINIESTRO_OLD(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SINIESTROS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO_OLD(java.math.BigDecimal pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_SINIESTRO_OLD(pPNSINIES);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_SINIESTRO_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_TRAMITADOR_OLD()
	private HashMap callPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_OLD() throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_TRAMITADOR_OLD(?, ?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PCTRAMI"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTTRAMI"
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
			retVal.put("PCTRAMI", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCTRAMI", null);
		}
		try {
			retVal.put("PTTRAMI", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTTRAMI", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_OLD() throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_OLD();
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_TRAMITADOR_OLD
	// --START-PAC_IAX_SINIESTROS.F_GET_ULTIMARESERVA(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_ULTIMARESERVA(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_ULTIMARESERVA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "ULT_RESERVA"
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
			retVal.put("ULT_RESERVA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("ULT_RESERVA", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_ULTIMARESERVA(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_ULTIMARESERVA(pPNSINIES);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_ULTIMARESERVA

	// joan Bug 0024964
	// --START-PAC_IAX_SINIESTROS.F_GRABAR_SINIESTRO(PCTRAMITAD)
	private HashMap callPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(String pPCTRAMITAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GRABAR_SINIESTRO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTRAMITAD" }, new Object[] { pPCTRAMITAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(4, pPCTRAMITAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.VARCHAR); // Valor de "PNSINIES"
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
			retVal.put("PNSINIES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PNSINIES", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(String pPCTRAMITAD) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(pPCTRAMITAD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GRABAR_SINIESTRO

	// --START-PAC_IAX_SINIESTROS.F_INICIALIZASINIESTRO(PSPRODUC, PCACTIVI,
	// PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_INICIALIZASINIESTRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPNSINIES" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(pPSPRODUC, pPCACTIVI, pPNSINIES);
	}
	// --END-PAC_IAX_SINIESTROS.F_INICIALIZASINIESTRO
	// --START-PAC_IAX_SINIESTROS.F_OBJCALCULA_IMPORTS_DETPAGOS(IRCMBRUT,
	// IREDUCCION, ISINRET, ISUPLID, PRETENC, PIVA, PICA, PRETEIVA, PRETEICA,
	// PCCALIMP, PSIDEPAG, PSPERSON, PFORDPAG, PCTIPGAS, PCCONCEP, PCAGENTE,
	// PIOTROSGAS, PIBASEIPOC, PIPOCONSUMO, PCMONRES, PCMONPAG, PCTIPRES, PCGARANT)
	// INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
	// private HashMap callPAC_IAX_SINIESTROS__F_OBJCALCULA_IMPORTS_DETPAGOS
	// (java.math.BigDecimal pIRCMBRUT, java.math.BigDecimal pIREDUCCION,
	// java.math.BigDecimal pISINRET, java.math.BigDecimal pISUPLID,
	// java.math.BigDecimal pPRETENC, java.math.BigDecimal pPIVA,
	// java.math.BigDecimal pPICA, java.math.BigDecimal pPRETEIVA,
	// java.math.BigDecimal pPRETEICA, java.math.BigDecimal pPCCALIMP,
	// java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPSPERSON, java.sql.Date
	// pPFORDPAG, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCCONCEP,
	// java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPIOTROSGAS,
	// java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPIPOCONSUMO, String
	// pPCMONRES, String pPCMONPAG, java.math.BigDecimal pPCTIPRES,
	// java.math.BigDecimal pPCGARANT, java.math.BigDecimal pVALORPESOS) throws
	// Exception {
	// String callQuery="{?=call PAC_IAX_SINIESTROS.F_OBJCALCULA_IMPORTS_DETPAGOS(?,
	// ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
	// ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

	// logCall(callQuery, new String[] {"pIRCMBRUT", "pIREDUCCION", "pISINRET",
	// "pISUPLID", "pPRETENC", "pPIVA", "pPICA", "pPRETEIVA", "pPRETEICA",
	// "pPCCALIMP", "pPSIDEPAG", "pPSPERSON", "pPFORDPAG", "pPCTIPGAS", "pPCCONCEP",
	// "pPCAGENTE", "pPIOTROSGAS", "pPIBASEIPOC", "pPIPOCONSUMO", "pPCMONRES",
	// "pPCMONPAG", "pPCTIPRES", "pPCGARANT"}, new Object[] {pIRCMBRUT, pIREDUCCION,
	// pISINRET, pISUPLID, pPRETENC, pPIVA, pPICA, pPRETEIVA, pPRETEICA, pPCCALIMP,
	// pPSIDEPAG, pPSPERSON, pPFORDPAG, pPCTIPGAS, pPCCONCEP, pPCAGENTE,
	// pPIOTROSGAS, pPIBASEIPOC, pPIPOCONSUMO, pPCMONRES, pPCMONPAG, pPCTIPRES,
	// pPCGARANT, pVALORPESOS});
	private HashMap callPAC_IAX_SINIESTROS__F_OBJCALCULA_IMPORTS_DETPAGOS(java.math.BigDecimal pIRCMBRUT,
			java.math.BigDecimal pIREDUCCION, java.math.BigDecimal pISINRET, java.math.BigDecimal pISUPLID,
			java.math.BigDecimal pPRETENC, java.math.BigDecimal pPIVA, java.math.BigDecimal pPICA,
			java.math.BigDecimal pPRETEIVA, java.math.BigDecimal pPRETEICA, java.math.BigDecimal pPCCALIMP,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPSPERSON, java.sql.Date pPFORDPAG,
			java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPIOTROSGAS, java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPIPOCONSUMO,
			String pPCMONRES, String pPCMONPAG, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pVALORPESOS, java.math.BigDecimal pPIFRANQ_IN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_OBJCALCULA_IMPORTS_DETPAGOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pIRCMBRUT", "pIREDUCCION", "pISINRET", "pISUPLID", "pPRETENC", "pPIVA", "pPICA",
						"pPRETEIVA", "pPRETEICA", "pPCCALIMP", "pPSIDEPAG", "pPSPERSON", "pPFORDPAG", "pPCTIPGAS",
						"pPCCONCEP", "pPCAGENTE", "pPIOTROSGAS", "pPIBASEIPOC", "pPIPOCONSUMO", "pPCMONRES",
						"pPCMONPAG", "pPCTIPRES", "pPCGARANT", "pVALORPESOS", "pPIFRANQ_IN" },
				new Object[] { pIRCMBRUT, pIREDUCCION, pISINRET, pISUPLID, pPRETENC, pPIVA, pPICA, pPRETEIVA, pPRETEICA,
						pPCCALIMP, pPSIDEPAG, pPSPERSON, pPFORDPAG, pPCTIPGAS, pPCCONCEP, pPCAGENTE, pPIOTROSGAS,
						pPIBASEIPOC, pPIPOCONSUMO, pPCMONRES, pPCMONPAG, pPCTIPRES, pPCGARANT, pVALORPESOS,
						pPIFRANQ_IN });
		// FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pIRCMBRUT);
		cStmt.setObject(3, pIREDUCCION);
		cStmt.setObject(4, pISINRET);
		cStmt.setObject(5, pISUPLID);
		cStmt.setObject(7, pPRETENC);
		cStmt.setObject(9, pPIVA);
		cStmt.setObject(13, pPICA);
		cStmt.setObject(15, pPRETEIVA);
		cStmt.setObject(17, pPRETEICA);
		cStmt.setObject(19, pPCCALIMP);
		cStmt.setObject(20, pPSIDEPAG);
		cStmt.setObject(21, pPSPERSON);
		cStmt.setObject(22, pPFORDPAG);
		cStmt.setObject(23, pPCTIPGAS);
		cStmt.setObject(24, pPCCONCEP);
		cStmt.setObject(25, pPCAGENTE);
		cStmt.setObject(31, pPIOTROSGAS);
		cStmt.setObject(32, pPIBASEIPOC);
		cStmt.setObject(33, pPIPOCONSUMO);
		cStmt.setObject(34, pPCMONRES);
		cStmt.setObject(35, pPCMONPAG);
		cStmt.setObject(36, pPCTIPRES);
		cStmt.setObject(37, pPCGARANT);
		cStmt.setObject(43, pVALORPESOS);
		// INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
		cStmt.setObject(45, pPIFRANQ_IN);
		// FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "IMPORTE"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "IRETENC"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "IIVA"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "INETA"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "IICA"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de "IRETEIVA"
		cStmt.registerOutParameter(18, java.sql.Types.NUMERIC); // Valor de "IRETEICA"
		cStmt.registerOutParameter(26, java.sql.Types.NUMERIC); // Valor de "PORETENC"
		cStmt.registerOutParameter(27, java.sql.Types.NUMERIC); // Valor de "POIVA"
		cStmt.registerOutParameter(28, java.sql.Types.NUMERIC); // Valor de "POICA"
		cStmt.registerOutParameter(29, java.sql.Types.NUMERIC); // Valor de "PORETEIVA"
		cStmt.registerOutParameter(30, java.sql.Types.NUMERIC); // Valor de "PORETEICA"
		cStmt.registerOutParameter(38, java.sql.Types.NUMERIC); // Valor de "PIIPOCONSUMO"
		cStmt.registerOutParameter(39, java.sql.Types.NUMERIC); // Valor de "PPOIPOCONSUMO"
		cStmt.registerOutParameter(40, java.sql.Types.NUMERIC); // Valor de "PISINRETPAG"
		cStmt.registerOutParameter(41, java.sql.Types.NUMERIC); // Valor de "PINETAPAG"
		cStmt.registerOutParameter(42, java.sql.Types.NUMERIC); // Valor de "PIFRANQ"
		cStmt.registerOutParameter(44, java.sql.Types.NUMERIC); // Valor de "PVALORCONVERTIDO"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("IMPORTE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("IMPORTE", null);
		}
		try {
			retVal.put("IRETENC", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("IRETENC", null);
		}
		try {
			retVal.put("IIVA", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("IIVA", null);
		}
		try {
			retVal.put("INETA", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("INETA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		try {
			retVal.put("IICA", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("IICA", null);
		}
		try {
			retVal.put("IRETEIVA", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("IRETEIVA", null);
		}
		try {
			retVal.put("IRETEICA", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("IRETEICA", null);
		}
		try {
			retVal.put("PORETENC", cStmt.getObject(26));
		} catch (SQLException e) {
			retVal.put("PORETENC", null);
		}
		try {
			retVal.put("POIVA", cStmt.getObject(27));
		} catch (SQLException e) {
			retVal.put("POIVA", null);
		}
		try {
			retVal.put("POICA", cStmt.getObject(28));
		} catch (SQLException e) {
			retVal.put("POICA", null);
		}
		try {
			retVal.put("PORETEIVA", cStmt.getObject(29));
		} catch (SQLException e) {
			retVal.put("PORETEIVA", null);
		}
		try {
			retVal.put("PORETEICA", cStmt.getObject(30));
		} catch (SQLException e) {
			retVal.put("PORETEICA", null);
		}
		try {
			retVal.put("PIIPOCONSUMO", cStmt.getObject(38));
		} catch (SQLException e) {
			retVal.put("PIIPOCONSUMO", null);
		}
		try {
			retVal.put("PPOIPOCONSUMO", cStmt.getObject(39));
		} catch (SQLException e) {
			retVal.put("PPOIPOCONSUMO", null);
		}
		try {
			retVal.put("PISINRETPAG", cStmt.getObject(40));
		} catch (SQLException e) {
			retVal.put("PISINRETPAG", null);
		}
		try {
			retVal.put("PINETAPAG", cStmt.getObject(41));
		} catch (SQLException e) {
			retVal.put("PINETAPAG", null);
		}
		try {
			retVal.put("PIFRANQ", cStmt.getObject(42));
		} catch (SQLException e) {
			retVal.put("PIFRANQ", null);
		}

		try {
			retVal.put("PVALORCONVERTIDO", cStmt.getObject(44));
		} catch (SQLException e) {
			retVal.put("PVALORCONVERTIDO", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	// INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
	// public HashMap ejecutaPAC_IAX_SINIESTROS__F_OBJCALCULA_IMPORTS_DETPAGOS
	// (java.math.BigDecimal pIRCMBRUT, java.math.BigDecimal pIREDUCCION,
	// java.math.BigDecimal pISINRET, java.math.BigDecimal pISUPLID,
	// java.math.BigDecimal pPRETENC, java.math.BigDecimal pPIVA,
	// java.math.BigDecimal pPICA, java.math.BigDecimal pPRETEIVA,
	// java.math.BigDecimal pPRETEICA, java.math.BigDecimal pPCCALIMP,
	// java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPSPERSON, java.sql.Date
	// pPFORDPAG, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCCONCEP,
	// java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPIOTROSGAS,
	// java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPIPOCONSUMO, String
	// pPCMONRES, String pPCMONPAG, java.math.BigDecimal pPCTIPRES,
	// java.math.BigDecimal pPCGARANT, java.math.BigDecimal pVALORPESOS) throws
	// Exception {
	// return this.callPAC_IAX_SINIESTROS__F_OBJCALCULA_IMPORTS_DETPAGOS(pIRCMBRUT,
	// pIREDUCCION, pISINRET, pISUPLID, pPRETENC, pPIVA, pPICA, pPRETEIVA,
	// pPRETEICA, pPCCALIMP, pPSIDEPAG, pPSPERSON, pPFORDPAG, pPCTIPGAS, pPCCONCEP,
	// pPCAGENTE, pPIOTROSGAS, pPIBASEIPOC, pPIPOCONSUMO, pPCMONRES, pPCMONPAG,
	// pPCTIPRES, pPCGARANT, pVALORPESOS);//AXIS-WLS1SERVER-Ready
	public HashMap ejecutaPAC_IAX_SINIESTROS__F_OBJCALCULA_IMPORTS_DETPAGOS(java.math.BigDecimal pIRCMBRUT,
			java.math.BigDecimal pIREDUCCION, java.math.BigDecimal pISINRET, java.math.BigDecimal pISUPLID,
			java.math.BigDecimal pPRETENC, java.math.BigDecimal pPIVA, java.math.BigDecimal pPICA,
			java.math.BigDecimal pPRETEIVA, java.math.BigDecimal pPRETEICA, java.math.BigDecimal pPCCALIMP,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPSPERSON, java.sql.Date pPFORDPAG,
			java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPIOTROSGAS, java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPIPOCONSUMO,
			String pPCMONRES, String pPCMONPAG, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pVALORPESOS, java.math.BigDecimal pPIFRANQ_IN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_OBJCALCULA_IMPORTS_DETPAGOS(pIRCMBRUT, pIREDUCCION, pISINRET, pISUPLID,
				pPRETENC, pPIVA, pPICA, pPRETEIVA, pPRETEICA, pPCCALIMP, pPSIDEPAG, pPSPERSON, pPFORDPAG, pPCTIPGAS,
				pPCCONCEP, pPCAGENTE, pPIOTROSGAS, pPIBASEIPOC, pPIPOCONSUMO, pPCMONRES, pPCMONPAG, pPCTIPRES,
				pPCGARANT, pVALORPESOS, pPIFRANQ_IN);// AXIS-WLS1SERVER-Ready
		// FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
	}
	// --END-PAC_IAX_SINIESTROS.F_OBJCALCULA_IMPORTS_DETPAGOS

	// --START-PAC_IAX_SINIESTROS.F_SET_DATSINIESTRO_OLD(PSSEGURO, PNRIESGO,
	// PFSINIES, PHSINIES, PFNOTIFI, PCTRAMI, PTSINIES, PCMOTSIN, PCCAUSIN,
	// PCCULPAB, PTZONAOCU)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_DATSINIESTRO_OLD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFSINIES, String pPHSINIES, java.sql.Date pPFNOTIFI,
			String pPCTRAMI, String pPTSINIES, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCCULPAB, String pPTZONAOCU) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_DATSINIESTRO_OLD(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPFSINIES", "pPHSINIES", "pPFNOTIFI", "pPCTRAMI", "pPTSINIES",
						"pPCMOTSIN", "pPCCAUSIN", "pPCCULPAB", "pPTZONAOCU" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFSINIES, pPHSINIES, pPFNOTIFI, pPCTRAMI, pPTSINIES, pPCMOTSIN,
						pPCCAUSIN, pPCCULPAB, pPTZONAOCU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFSINIES);
		cStmt.setObject(5, pPHSINIES);
		cStmt.setObject(6, pPFNOTIFI);
		cStmt.setObject(7, pPCTRAMI);
		cStmt.setObject(8, pPTSINIES);
		cStmt.setObject(9, pPCMOTSIN);
		cStmt.setObject(10, pPCCAUSIN);
		cStmt.setObject(11, pPCCULPAB);
		cStmt.setObject(12, pPTZONAOCU);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_DATSINIESTRO_OLD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFSINIES, String pPHSINIES, java.sql.Date pPFNOTIFI,
			String pPCTRAMI, String pPTSINIES, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCCULPAB, String pPTZONAOCU) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_DATSINIESTRO_OLD(pPSSEGURO, pPNRIESGO, pPFSINIES, pPHSINIES,
				pPFNOTIFI, pPCTRAMI, pPTSINIES, pPCMOTSIN, pPCCAUSIN, pPCCULPAB, pPTZONAOCU);
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_DATSINIESTRO_OLD
	// --START-PAC_IAX_SINIESTROS.F_SET_DOCUMENTACION_OLD(PCDOCUME)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_DOCUMENTACION_OLD(java.math.BigDecimal pPCDOCUME) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_DOCUMENTACION_OLD(?, ?)}";

		logCall(callQuery, new String[] { "pPCDOCUME" }, new Object[] { pPCDOCUME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDOCUME);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_DOCUMENTACION_OLD(java.math.BigDecimal pPCDOCUME) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_DOCUMENTACION_OLD(pPCDOCUME);
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_DOCUMENTACION_OLD
	// --START-PAC_IAX_SINIESTROS.F_SET_GARANTIAS_OLD(PCGARANT)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_GARANTIAS_OLD(java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_GARANTIAS_OLD(?, ?)}";

		logCall(callQuery, new String[] { "pPCGARANT" }, new Object[] { pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_GARANTIAS_OLD(java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_GARANTIAS_OLD(pPCGARANT);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_GARANTIAS_OLD

	// bug 0021196

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINMOVTRAMIT(PNSINIES, PNTRAMIT,
	// PNMOVTRA, PCUNITRA, PCTRAMITAD, PCESTTRA, PCSUBTRA, PFESTTRA, PCCAUEST,
	// PCVALIDA_ULT)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMIT(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNMOVTRA, String pPCUNITRA, String pPCTRAMITAD, java.math.BigDecimal pPCESTTRA,
			java.math.BigDecimal pPCSUBTRA, java.sql.Date pPFESTTRA, java.math.BigDecimal pPCCAUEST,
			java.math.BigDecimal pPCVALIDA_ULT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINMOVTRAMIT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNMOVTRA", "pPCUNITRA", "pPCTRAMITAD", "pPCESTTRA",
						"pPCSUBTRA", "pPFESTTRA", "pPCCAUEST", "pPCVALIDA_ULT" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNMOVTRA, pPCUNITRA, pPCTRAMITAD, pPCESTTRA, pPCSUBTRA, pPFESTTRA,
						pPCCAUEST, pPCVALIDA_ULT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNMOVTRA);
		cStmt.setObject(5, pPCUNITRA);
		cStmt.setObject(6, pPCTRAMITAD);
		cStmt.setObject(7, pPCESTTRA);
		cStmt.setObject(8, pPCSUBTRA);
		cStmt.setObject(9, pPFESTTRA);
		cStmt.setObject(10, pPCCAUEST);
		cStmt.setObject(12, pPCVALIDA_ULT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMIT(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNMOVTRA, String pPCUNITRA, String pPCTRAMITAD,
			java.math.BigDecimal pPCESTTRA, java.math.BigDecimal pPCSUBTRA, java.sql.Date pPFESTTRA,
			java.math.BigDecimal pPCCAUEST, java.math.BigDecimal pPCVALIDA_ULT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMIT(pPNSINIES, pPNTRAMIT, pPNMOVTRA, pPCUNITRA,
				pPCTRAMITAD, pPCESTTRA, pPCSUBTRA, pPFESTTRA, pPCCAUEST, pPCVALIDA_ULT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINMOVTRAMIT

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIAGENDA(PNSINIES, PNTRAMIT,
	// PNLINAGE, PCTIPREG, PCMANUAL, PCESTAGE, PFFINAGE, PTTITAGE, PTLINAGE)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAGENDA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINAGE, java.math.BigDecimal pPCTIPREG,
			java.math.BigDecimal pPCMANUAL, java.math.BigDecimal pPCESTAGE, java.sql.Date pPFFINAGE, String pPTTITAGE,
			String pPTLINAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIAGENDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINAGE", "pPCTIPREG", "pPCMANUAL", "pPCESTAGE",
						"pPFFINAGE", "pPTTITAGE", "pPTLINAGE" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINAGE, pPCTIPREG, pPCMANUAL, pPCESTAGE, pPFFINAGE, pPTTITAGE,
						pPTLINAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINAGE);
		cStmt.setObject(5, pPCTIPREG);
		cStmt.setObject(6, pPCMANUAL);
		cStmt.setObject(7, pPCESTAGE);
		cStmt.setObject(8, pPFFINAGE);
		cStmt.setObject(9, pPTTITAGE);
		cStmt.setObject(10, pPTLINAGE);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAGENDA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINAGE, java.math.BigDecimal pPCTIPREG,
			java.math.BigDecimal pPCMANUAL, java.math.BigDecimal pPCESTAGE, java.sql.Date pPFFINAGE, String pPTTITAGE,
			String pPTLINAGE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAGENDA(pPNSINIES, pPNTRAMIT, pPNLINAGE, pPCTIPREG,
				pPCMANUAL, pPCESTAGE, pPFFINAGE, pPTTITAGE, pPTLINAGE);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIAGENDA

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMILOCALI(PNSINIES, PNTRAMIT,
	// PNLOCALI, PSPERSON, PCSIGLAS, PTNOMVIA, PNNUMVIA, PTCOMPLE, PTLOCALI, PCPAIS,
	// PCPROVIN, PCPOBLAC, PCPOSTAL, PCVIAVP, PCLITVP, PCBISVP, PCORVP, PNVIAADCO,
	// PCLITCO, PCORCO, PNPLACACO, PCOR2CO, PCDET1IA, PTNUM1IA, PCDET2IA, PTNUM2IA,
	// PCDET3IA, PTNUM3IA, PLOCALIDAD)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMILOCALI(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE,
			String pPTLOCALI, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, java.math.BigDecimal pPCVIAVP,
			java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP,
			java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO,
			java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA,
			String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA,
			String pPTNUM3IA, String pPLOCALIDAD, java.math.BigDecimal pCCONTABLE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMILOCALI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLOCALI", "pPSPERSON", "pPCSIGLAS", "pPTNOMVIA",
						"pPNNUMVIA", "pPTCOMPLE", "pPTLOCALI", "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPCPOSTAL",
						"pPCVIAVP", "pPCLITVP", "pPCBISVP", "pPCORVP", "pPNVIAADCO", "pPCLITCO", "pPCORCO",
						"pPNPLACACO", "pPCOR2CO", "pPCDET1IA", "pPTNUM1IA", "pPCDET2IA", "pPTNUM2IA", "pPCDET3IA",
						"pPTNUM3IA", "pPLOCALIDAD", "pCCONTABLE" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLOCALI, pPSPERSON, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE,
						pPTLOCALI, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP,
						pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA,
						pPCDET3IA, pPTNUM3IA, pPLOCALIDAD, pCCONTABLE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLOCALI);
		cStmt.setObject(5, pPSPERSON);
		cStmt.setObject(6, pPCSIGLAS);
		cStmt.setObject(7, pPTNOMVIA);
		cStmt.setObject(8, pPNNUMVIA);
		cStmt.setObject(9, pPTCOMPLE);
		cStmt.setObject(10, pPTLOCALI);
		cStmt.setObject(11, pPCPAIS);
		cStmt.setObject(12, pPCPROVIN);
		cStmt.setObject(13, pPCPOBLAC);
		cStmt.setObject(14, pPCPOSTAL);
		cStmt.setObject(15, pPCVIAVP);
		cStmt.setObject(16, pPCLITVP);
		cStmt.setObject(17, pPCBISVP);
		cStmt.setObject(18, pPCORVP);
		cStmt.setObject(19, pPNVIAADCO);
		cStmt.setObject(20, pPCLITCO);
		cStmt.setObject(21, pPCORCO);
		cStmt.setObject(22, pPNPLACACO);
		cStmt.setObject(23, pPCOR2CO);
		cStmt.setObject(24, pPCDET1IA);
		cStmt.setObject(25, pPTNUM1IA);
		cStmt.setObject(26, pPCDET2IA);
		cStmt.setObject(27, pPTNUM2IA);
		cStmt.setObject(28, pPCDET3IA);
		cStmt.setObject(29, pPTNUM3IA);
		cStmt.setObject(30, pPLOCALIDAD);
		cStmt.setObject(31, pCCONTABLE);/* IAXIS-4961 EAD:13/08/2020 */
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(32, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(32));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMILOCALI(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE,
			String pPTLOCALI, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, java.math.BigDecimal pPCVIAVP,
			java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP,
			java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO,
			java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA,
			String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA,
			String pPTNUM3IA, String pPLOCALIDAD, java.math.BigDecimal pCCONTABLE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMILOCALI(pPNSINIES, pPNTRAMIT, pPNLOCALI, pPSPERSON,
				pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPTLOCALI, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL,
				pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA,
				pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPLOCALIDAD, pCCONTABLE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMILOCALI

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIRESERVA(PNSINIES, PNTRAMIT,
	// PCTIPRES, PTTIPRES, PNMOVRES, PCGARANT, PCCALRES, PFMOVRES, PCMONRES,
	// PIRESERVA, PIPAGO, PIINGRESO, PIRECOBRO, PICAPRIE, PIPENALI, PFRESINI,
	// PFRESFIN, PFULTPAG, PSIDEPAG, PSPROCES, PFCONTAB, PIPREREC, PCTIPGAS, PMODO,
	// PTORIGEN, PIFRANQ, PNDIAS, PCMOVRES, PITOTIMP, PPIVA, PPRETENC, PPRETEIVA,
	// PPRETEICA, PIVA_CTIPIND, PRETENC_CTIPIND, PRETEIVA_CTIPIND, PRETEICA_CTIPIND,
	// PITOTRET, PCSOLIDARIDAD)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIRESERVA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPRES, String pPTTIPRES,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCALRES,
			java.sql.Date pPFMOVRES, String pPCMONRES, java.math.BigDecimal pPIRESERVA, java.math.BigDecimal pPIPAGO,
			java.math.BigDecimal pPIINGRESO, java.math.BigDecimal pPIRECOBRO, java.math.BigDecimal pPICAPRIE,
			java.math.BigDecimal pPIPENALI, java.sql.Date pPFRESINI, java.sql.Date pPFRESFIN, java.sql.Date pPFULTPAG,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPSPROCES, java.sql.Date pPFCONTAB,
			java.math.BigDecimal pPIPREREC, java.math.BigDecimal pPCTIPGAS, String pPMODO, String pPTORIGEN,
			java.math.BigDecimal pPIFRANQ, java.math.BigDecimal pPNDIAS, java.math.BigDecimal pPCMOVRES,
			java.math.BigDecimal pPITOTIMP, java.math.BigDecimal pPPIVA, java.math.BigDecimal pPPRETENC,
			java.math.BigDecimal pPPRETEIVA, java.math.BigDecimal pPPRETEICA, java.math.BigDecimal pPIVA_CTIPIND,
			java.math.BigDecimal pPRETENC_CTIPIND, java.math.BigDecimal pPRETEIVA_CTIPIND,
			java.math.BigDecimal pPRETEICA_CTIPIND, java.math.BigDecimal pPITOTRET, java.math.BigDecimal pPCSOLIDARIDAD)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIRESERVA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPTTIPRES", "pPNMOVRES", "pPCGARANT",
						"pPCCALRES", "pPFMOVRES", "pPCMONRES", "pPIRESERVA", "pPIPAGO", "pPIINGRESO", "pPIRECOBRO",
						"pPICAPRIE", "pPIPENALI", "pPFRESINI", "pPFRESFIN", "pPFULTPAG", "pPSIDEPAG", "pPSPROCES",
						"pPFCONTAB", "pPIPREREC", "pPCTIPGAS", "pPMODO", "pPTORIGEN", "pPIFRANQ", "pPNDIAS",
						"pPCMOVRES", "pPITOTIMP", "pPPIVA", "pPPRETENC", "pPPRETEIVA", "pPPRETEICA", "pPIVA_CTIPIND",
						"pPRETENC_CTIPIND", "pPRETEIVA_CTIPIND", "pPRETEICA_CTIPIND", "pPITOTRET", "pPCSOLIDARIDAD" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPTTIPRES, pPNMOVRES, pPCGARANT, pPCCALRES, pPFMOVRES,
						pPCMONRES, pPIRESERVA, pPIPAGO, pPIINGRESO, pPIRECOBRO, pPICAPRIE, pPIPENALI, pPFRESINI,
						pPFRESFIN, pPFULTPAG, pPSIDEPAG, pPSPROCES, pPFCONTAB, pPIPREREC, pPCTIPGAS, pPMODO, pPTORIGEN,
						pPIFRANQ, pPNDIAS, pPCMOVRES, pPITOTIMP, pPPIVA, pPPRETENC, pPPRETEIVA, pPPRETEICA,
						pPIVA_CTIPIND, pPRETENC_CTIPIND, pPRETEIVA_CTIPIND, pPRETEICA_CTIPIND, pPITOTRET,
						pPCSOLIDARIDAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPTTIPRES);
		cStmt.setObject(6, pPNMOVRES);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPCCALRES);
		cStmt.setObject(9, pPFMOVRES);
		cStmt.setObject(10, pPCMONRES);
		cStmt.setObject(11, pPIRESERVA);
		cStmt.setObject(12, pPIPAGO);
		cStmt.setObject(13, pPIINGRESO);
		cStmt.setObject(14, pPIRECOBRO);
		cStmt.setObject(15, pPICAPRIE);
		cStmt.setObject(16, pPIPENALI);
		cStmt.setObject(17, pPFRESINI);
		cStmt.setObject(18, pPFRESFIN);
		cStmt.setObject(19, pPFULTPAG);
		cStmt.setObject(20, pPSIDEPAG);
		cStmt.setObject(21, pPSPROCES);
		cStmt.setObject(22, pPFCONTAB);
		cStmt.setObject(23, pPIPREREC);
		cStmt.setObject(24, pPCTIPGAS);
		cStmt.setObject(25, pPMODO);
		cStmt.setObject(26, pPTORIGEN);
		cStmt.setObject(27, pPIFRANQ);
		cStmt.setObject(28, pPNDIAS);
		cStmt.setObject(29, pPCMOVRES);
		cStmt.setObject(30, pPITOTIMP);
		cStmt.setObject(32, pPPIVA);
		cStmt.setObject(33, pPPRETENC);
		cStmt.setObject(34, pPPRETEIVA);
		cStmt.setObject(35, pPPRETEICA);
		cStmt.setObject(36, pPIVA_CTIPIND);
		cStmt.setObject(37, pPRETENC_CTIPIND);
		cStmt.setObject(38, pPRETEIVA_CTIPIND);
		cStmt.setObject(39, pPRETEICA_CTIPIND);
		cStmt.setObject(40, pPITOTRET);
		cStmt.setObject(41, pPCSOLIDARIDAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(31));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAMPARO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPPRETENC,
			java.math.BigDecimal pPICAPRIE, String pPCMONRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIAMPARO(?, ?, ?, ?, ?, ?,?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCGARANT", "pPPRETENC", "pPICAPRIE", "pPCMONRES" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCGARANT, pPPRETENC, pPICAPRIE, pPCMONRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPPRETENC);
		cStmt.setObject(6, pPICAPRIE);
		cStmt.setObject(7, pPCMONRES);

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
			retVal.put("MENSAJES", cStmt.getObject(31));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIRESERVA(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPRES, String pPTTIPRES,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCALRES,
			java.sql.Date pPFMOVRES, String pPCMONRES, java.math.BigDecimal pPIRESERVA, java.math.BigDecimal pPIPAGO,
			java.math.BigDecimal pPIINGRESO, java.math.BigDecimal pPIRECOBRO, java.math.BigDecimal pPICAPRIE,
			java.math.BigDecimal pPIPENALI, java.sql.Date pPFRESINI, java.sql.Date pPFRESFIN, java.sql.Date pPFULTPAG,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPSPROCES, java.sql.Date pPFCONTAB,
			java.math.BigDecimal pPIPREREC, java.math.BigDecimal pPCTIPGAS, String pPMODO, String pPTORIGEN,
			java.math.BigDecimal pPIFRANQ, java.math.BigDecimal pPNDIAS, java.math.BigDecimal pPCMOVRES,
			java.math.BigDecimal pPITOTIMP, java.math.BigDecimal pPPIVA, java.math.BigDecimal pPPRETENC,
			java.math.BigDecimal pPPRETEIVA, java.math.BigDecimal pPPRETEICA, java.math.BigDecimal pPIVA_CTIPIND,
			java.math.BigDecimal pPRETENC_CTIPIND, java.math.BigDecimal pPRETEIVA_CTIPIND,
			java.math.BigDecimal pPRETEICA_CTIPIND, java.math.BigDecimal pPITOTRET, java.math.BigDecimal pPCSOLIDARIDAD)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIRESERVA(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPTTIPRES,
				pPNMOVRES, pPCGARANT, pPCCALRES, pPFMOVRES, pPCMONRES, pPIRESERVA, pPIPAGO, pPIINGRESO, pPIRECOBRO,
				pPICAPRIE, pPIPENALI, pPFRESINI, pPFRESFIN, pPFULTPAG, pPSIDEPAG, pPSPROCES, pPFCONTAB, pPIPREREC,
				pPCTIPGAS, pPMODO, pPTORIGEN, pPIFRANQ, pPNDIAS, pPCMOVRES, pPITOTIMP, pPPIVA, pPPRETENC, pPPRETEIVA,
				pPPRETEICA, pPIVA_CTIPIND, pPRETENC_CTIPIND, pPRETEIVA_CTIPIND, pPRETEICA_CTIPIND, pPITOTRET,
				pPCSOLIDARIDAD);// AXIS-WLS1SERVER-Ready
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAMPARO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPPRETENC,
			java.math.BigDecimal pPICAPRIE, String pPCMONRES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAMPARO(pPNSINIES, pPNTRAMIT, pPCGARANT, pPPRETENC,
				pPICAPRIE, pPCMONRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIRESERVA

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMIDESTINATARI(PSSEGURO, PNSINIES,
	// PNTRAMIT, PCTIPDES, PCPAGDES, PCACTPRO, PPASIGNA, PCPAISRE, PSPERSON,
	// PCTIPBAN, PCBANCAR, PCTIPCAP, PCRELASE, PSPROFES, PCPROVIN)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPCPAGDES, java.math.BigDecimal pPCACTPRO, java.math.BigDecimal pPPASIGNA,
			java.math.BigDecimal pPCPAISRE, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.math.BigDecimal pPCTIPCAP, java.math.BigDecimal pPCRELASE,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCPROVIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMIDESTINATARI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCTIPDES", "pPCPAGDES", "pPCACTPRO",
						"pPPASIGNA", "pPCPAISRE", "pPSPERSON", "pPCTIPBAN", "pPCBANCAR", "pPCTIPCAP", "pPCRELASE",
						"pPSPROFES", "pPCPROVIN" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPDES, pPCPAGDES, pPCACTPRO, pPPASIGNA, pPCPAISRE,
						pPSPERSON, pPCTIPBAN, pPCBANCAR, pPCTIPCAP, pPCRELASE, pPSPROFES, pPCPROVIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPCPAGDES);
		cStmt.setObject(7, pPCACTPRO);
		cStmt.setObject(8, pPPASIGNA);
		cStmt.setObject(9, pPCPAISRE);
		cStmt.setObject(10, pPSPERSON);
		cStmt.setObject(11, pPCTIPBAN);
		cStmt.setObject(12, pPCBANCAR);
		cStmt.setObject(13, pPCTIPCAP);
		cStmt.setObject(14, pPCRELASE);
		cStmt.setObject(15, pPSPROFES);
		cStmt.setObject(16, pPCPROVIN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPCPAGDES, java.math.BigDecimal pPCACTPRO, java.math.BigDecimal pPPASIGNA,
			java.math.BigDecimal pPCPAISRE, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.math.BigDecimal pPCTIPCAP, java.math.BigDecimal pPCRELASE,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCPROVIN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPDES,
				pPCPAGDES, pPCACTPRO, pPPASIGNA, pPCPAISRE, pPSPERSON, pPCTIPBAN, pPCBANCAR, pPCTIPCAP, pPCRELASE,
				pPSPROFES, pPCPROVIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMIDESTINATARI

	// JMF de bug ASN 24546
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMI_PAGO_RECOB(PSSEGURO, PSIDEPAG,
	// PNSINIES, PNTRAMIT, PCTIPDES, PCTIPPAG, PCCONPAG, PCCAUIND, PCFORPAG,
	// PFORDPAG, PCTIPBAN, PCBANCAR, PCMONRES, PISINRET, PICONRET, PPRETENC,
	// PIRETENC, PIIVA, PISUPLID, PIFRANQ, PIRESRED, PIRESRCM, PCMONPAG,
	// PISINRETPAG, PICONRETPAG, PIRETENCPAG, PIIVAPAG, PISUPLIDPAG, PIFRANQPAG,
	// PFCAMBIO, PNFACREF, PFFACREF, PSPERSON, PSIDEPAGTEMP, PCULTPAG, PNCHEQUE,
	// PIRETEIVA, PIRETEICA, PIRETEIVAPAG, PIRETEICAPAG, PIICA, PIICAPAG, PCAGENTE,
	// PNPERSREL, PCDOMICI, PCTRIBUTACION, PCBANCO, PCOFICI, PCCIUDAD, PSPERSONPRES,
	// PTOBSERVA, PIOTROSGAS, PIBASEIPOC, PIIPOCONSUMO, PIOTROSGASPAG,
	// PIBASEIPOCPAG, PIIPOCONSUMOPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMI_PAGO_RECOB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSIDEPAG, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCCONPAG,
			java.math.BigDecimal pPCCAUIND, java.math.BigDecimal pPCFORPAG, java.sql.Date pPFORDPAG,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, String pPCMONRES, java.math.BigDecimal pPISINRET,
			java.math.BigDecimal pPICONRET, java.math.BigDecimal pPPRETENC, java.math.BigDecimal pPIRETENC,
			java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID, java.math.BigDecimal pPIFRANQ,
			java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM, String pPCMONPAG,
			java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPICONRETPAG, java.math.BigDecimal pPIRETENCPAG,
			java.math.BigDecimal pPIIVAPAG, java.math.BigDecimal pPISUPLIDPAG, java.math.BigDecimal pPIFRANQPAG,
			java.sql.Date pPFCAMBIO, String pPNFACREF, java.sql.Date pPFFACREF, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSIDEPAGTEMP, java.math.BigDecimal pPCULTPAG, String pPNCHEQUE,
			java.math.BigDecimal pPIRETEIVA, java.math.BigDecimal pPIRETEICA, java.math.BigDecimal pPIRETEIVAPAG,
			java.math.BigDecimal pPIRETEICAPAG, java.math.BigDecimal pPIICA, java.math.BigDecimal pPIICAPAG,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPERSREL, java.math.BigDecimal pPCDOMICI,
			java.math.BigDecimal pPCTRIBUTACION, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCOFICI,
			java.math.BigDecimal pPCCIUDAD, java.math.BigDecimal pPSPERSONPRES, String pPTOBSERVA,
			java.math.BigDecimal pPIOTROSGAS, java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPIIPOCONSUMO,
			java.math.BigDecimal pPIOTROSGASPAG, java.math.BigDecimal pPIBASEIPOCPAG,
			java.math.BigDecimal pPIIPOCONSUMOPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMI_PAGO_RECOB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSIDEPAG", "pPNSINIES", "pPNTRAMIT", "pPCTIPDES", "pPCTIPPAG",
				"pPCCONPAG", "pPCCAUIND", "pPCFORPAG", "pPFORDPAG", "pPCTIPBAN", "pPCBANCAR", "pPCMONRES", "pPISINRET",
				"pPICONRET", "pPPRETENC", "pPIRETENC", "pPIIVA", "pPISUPLID", "pPIFRANQ", "pPIRESRED", "pPIRESRCM",
				"pPCMONPAG", "pPISINRETPAG", "pPICONRETPAG", "pPIRETENCPAG", "pPIIVAPAG", "pPISUPLIDPAG", "pPIFRANQPAG",
				"pPFCAMBIO", "pPNFACREF", "pPFFACREF", "pPSPERSON", "pPSIDEPAGTEMP", "pPCULTPAG", "pPNCHEQUE",
				"pPIRETEIVA", "pPIRETEICA", "pPIRETEIVAPAG", "pPIRETEICAPAG", "pPIICA", "pPIICAPAG", "pPCAGENTE",
				"pPNPERSREL", "pPCDOMICI", "pPCTRIBUTACION", "pPCBANCO", "pPCOFICI", "pPCCIUDAD", "pPSPERSONPRES",
				"pPTOBSERVA", "pPIOTROSGAS", "pPIBASEIPOC", "pPIIPOCONSUMO", "pPIOTROSGASPAG", "pPIBASEIPOCPAG",
				"pPIIPOCONSUMOPAG" },
				new Object[] { pPSSEGURO, pPSIDEPAG, pPNSINIES, pPNTRAMIT, pPCTIPDES, pPCTIPPAG, pPCCONPAG, pPCCAUIND,
						pPCFORPAG, pPFORDPAG, pPCTIPBAN, pPCBANCAR, pPCMONRES, pPISINRET, pPICONRET, pPPRETENC,
						pPIRETENC, pPIIVA, pPISUPLID, pPIFRANQ, pPIRESRED, pPIRESRCM, pPCMONPAG, pPISINRETPAG,
						pPICONRETPAG, pPIRETENCPAG, pPIIVAPAG, pPISUPLIDPAG, pPIFRANQPAG, pPFCAMBIO, pPNFACREF,
						pPFFACREF, pPSPERSON, pPSIDEPAGTEMP, pPCULTPAG, pPNCHEQUE, pPIRETEIVA, pPIRETEICA,
						pPIRETEIVAPAG, pPIRETEICAPAG, pPIICA, pPIICAPAG, pPCAGENTE, pPNPERSREL, pPCDOMICI,
						pPCTRIBUTACION, pPCBANCO, pPCOFICI, pPCCIUDAD, pPSPERSONPRES, pPTOBSERVA, pPIOTROSGAS,
						pPIBASEIPOC, pPIIPOCONSUMO, pPIOTROSGASPAG, pPIBASEIPOCPAG, pPIIPOCONSUMOPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSIDEPAG);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPNTRAMIT);
		cStmt.setObject(6, pPCTIPDES);
		cStmt.setObject(7, pPCTIPPAG);
		cStmt.setObject(8, pPCCONPAG);
		cStmt.setObject(9, pPCCAUIND);
		cStmt.setObject(10, pPCFORPAG);
		cStmt.setObject(11, pPFORDPAG);
		cStmt.setObject(12, pPCTIPBAN);
		cStmt.setObject(13, pPCBANCAR);
		cStmt.setObject(14, pPCMONRES);
		cStmt.setObject(15, pPISINRET);
		cStmt.setObject(16, pPICONRET);
		cStmt.setObject(17, pPPRETENC);
		cStmt.setObject(18, pPIRETENC);
		cStmt.setObject(19, pPIIVA);
		cStmt.setObject(20, pPISUPLID);
		cStmt.setObject(21, pPIFRANQ);
		cStmt.setObject(22, pPIRESRED);
		cStmt.setObject(23, pPIRESRCM);
		cStmt.setObject(24, pPCMONPAG);
		cStmt.setObject(25, pPISINRETPAG);
		cStmt.setObject(26, pPICONRETPAG);
		cStmt.setObject(27, pPIRETENCPAG);
		cStmt.setObject(28, pPIIVAPAG);
		cStmt.setObject(29, pPISUPLIDPAG);
		cStmt.setObject(30, pPIFRANQPAG);
		cStmt.setObject(31, pPFCAMBIO);
		cStmt.setObject(32, pPNFACREF);
		cStmt.setObject(33, pPFFACREF);
		cStmt.setObject(34, pPSPERSON);
		cStmt.setObject(35, pPSIDEPAGTEMP);
		cStmt.setObject(36, pPCULTPAG);
		cStmt.setObject(37, pPNCHEQUE);
		cStmt.setObject(40, pPIRETEIVA);
		cStmt.setObject(41, pPIRETEICA);
		cStmt.setObject(42, pPIRETEIVAPAG);
		cStmt.setObject(43, pPIRETEICAPAG);
		cStmt.setObject(44, pPIICA);
		cStmt.setObject(45, pPIICAPAG);
		cStmt.setObject(46, pPCAGENTE);
		cStmt.setObject(47, pPNPERSREL);
		cStmt.setObject(48, pPCDOMICI);
		cStmt.setObject(49, pPCTRIBUTACION);
		cStmt.setObject(50, pPCBANCO);
		cStmt.setObject(51, pPCOFICI);
		cStmt.setObject(52, pPCCIUDAD);
		cStmt.setObject(53, pPSPERSONPRES);
		cStmt.setObject(54, pPTOBSERVA);
		cStmt.setObject(55, pPIOTROSGAS);
		cStmt.setObject(56, pPIBASEIPOC);
		cStmt.setObject(57, pPIIPOCONSUMO);
		cStmt.setObject(58, pPIOTROSGASPAG);
		cStmt.setObject(59, pPIBASEIPOCPAG);
		cStmt.setObject(60, pPIIPOCONSUMOPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(38, java.sql.Types.NUMERIC); // Valor de "PSIDEPAGOUT"
		cStmt.registerOutParameter(39, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSIDEPAGOUT", cStmt.getObject(38));
		} catch (SQLException e) {
			retVal.put("PSIDEPAGOUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(39));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMI_PAGO_RECOB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSIDEPAG, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCCONPAG,
			java.math.BigDecimal pPCCAUIND, java.math.BigDecimal pPCFORPAG, java.sql.Date pPFORDPAG,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, String pPCMONRES, java.math.BigDecimal pPISINRET,
			java.math.BigDecimal pPICONRET, java.math.BigDecimal pPPRETENC, java.math.BigDecimal pPIRETENC,
			java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID, java.math.BigDecimal pPIFRANQ,
			java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM, String pPCMONPAG,
			java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPICONRETPAG, java.math.BigDecimal pPIRETENCPAG,
			java.math.BigDecimal pPIIVAPAG, java.math.BigDecimal pPISUPLIDPAG, java.math.BigDecimal pPIFRANQPAG,
			java.sql.Date pPFCAMBIO, String pPNFACREF, java.sql.Date pPFFACREF, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSIDEPAGTEMP, java.math.BigDecimal pPCULTPAG, String pPNCHEQUE,
			java.math.BigDecimal pPIRETEIVA, java.math.BigDecimal pPIRETEICA, java.math.BigDecimal pPIRETEIVAPAG,
			java.math.BigDecimal pPIRETEICAPAG, java.math.BigDecimal pPIICA, java.math.BigDecimal pPIICAPAG,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPERSREL, java.math.BigDecimal pPCDOMICI,
			java.math.BigDecimal pPCTRIBUTACION, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCOFICI,
			java.math.BigDecimal pPCCIUDAD, java.math.BigDecimal pPSPERSONPRES, String pPTOBSERVA,
			java.math.BigDecimal pPIOTROSGAS, java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPIIPOCONSUMO,
			java.math.BigDecimal pPIOTROSGASPAG, java.math.BigDecimal pPIBASEIPOCPAG,
			java.math.BigDecimal pPIIPOCONSUMOPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMI_PAGO_RECOB(pPSSEGURO, pPSIDEPAG, pPNSINIES, pPNTRAMIT,
				pPCTIPDES, pPCTIPPAG, pPCCONPAG, pPCCAUIND, pPCFORPAG, pPFORDPAG, pPCTIPBAN, pPCBANCAR, pPCMONRES,
				pPISINRET, pPICONRET, pPPRETENC, pPIRETENC, pPIIVA, pPISUPLID, pPIFRANQ, pPIRESRED, pPIRESRCM,
				pPCMONPAG, pPISINRETPAG, pPICONRETPAG, pPIRETENCPAG, pPIIVAPAG, pPISUPLIDPAG, pPIFRANQPAG, pPFCAMBIO,
				pPNFACREF, pPFFACREF, pPSPERSON, pPSIDEPAGTEMP, pPCULTPAG, pPNCHEQUE, pPIRETEIVA, pPIRETEICA,
				pPIRETEIVAPAG, pPIRETEICAPAG, pPIICA, pPIICAPAG, pPCAGENTE, pPNPERSREL, pPCDOMICI, pPCTRIBUTACION,
				pPCBANCO, pPCOFICI, pPCCIUDAD, pPSPERSONPRES, pPTOBSERVA, pPIOTROSGAS, pPIBASEIPOC, pPIIPOCONSUMO,
				pPIOTROSGASPAG, pPIBASEIPOCPAG, pPIIPOCONSUMOPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMI_PAGO_RECOB

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_MOVPAGRECOB(PNTRAMIT, PSIDEPAG,
	// PNMOVPAG, PCESTPAG, PFEFEPAG, PCESTVAL, PFCONTAB, PCTIPPAG, PCESTPAGANT,
	// PCSUBPAG, PCSUBPAGANT)
	/*
	 * private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_MOVPAGRECOB
	 * (java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPSIDEPAG,
	 * java.math.BigDecimal pPNMOVPAG, java.math.BigDecimal pPCESTPAG, java.sql.Date
	 * pPFEFEPAG, java.math.BigDecimal pPCESTVAL, java.sql.Date pPFCONTAB,
	 * java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCESTPAGANT,
	 * java.math.BigDecimal pPCSUBPAG, java.math.BigDecimal pPCSUBPAGANT) throws
	 * Exception { String
	 * callQuery="{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_MOVPAGRECOB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPNTRAMIT", "pPSIDEPAG", "pPNMOVPAG",
	 * "pPCESTPAG", "pPFEFEPAG", "pPCESTVAL", "pPFCONTAB", "pPCTIPPAG",
	 * "pPCESTPAGANT", "pPCSUBPAG", "pPCSUBPAGANT"}, new Object[] {pPNTRAMIT,
	 * pPSIDEPAG, pPNMOVPAG, pPCESTPAG, pPFEFEPAG, pPCESTVAL, pPFCONTAB, pPCTIPPAG,
	 * pPCESTPAGANT, pPCSUBPAG, pPCSUBPAGANT}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPNTRAMIT); cStmt.setObject(3, pPSIDEPAG); cStmt.setObject(4, pPNMOVPAG);
	 * cStmt.setObject(5, pPCESTPAG); cStmt.setObject(6, pPFEFEPAG);
	 * cStmt.setObject(7, pPCESTVAL); cStmt.setObject(8, pPFCONTAB);
	 * cStmt.setObject(9, pPCTIPPAG); cStmt.setObject(10, pPCESTPAGANT);
	 * cStmt.setObject(11, pPCSUBPAG); cStmt.setObject(12, pPCSUBPAGANT);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(13)); } catch (SQLException e) { retVal.put("MENSAJES",
	 * null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_MOVPAGRECOB
	 * (java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPSIDEPAG,
	 * java.math.BigDecimal pPNMOVPAG, java.math.BigDecimal pPCESTPAG, java.sql.Date
	 * pPFEFEPAG, java.math.BigDecimal pPCESTVAL, java.sql.Date pPFCONTAB,
	 * java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCESTPAGANT,
	 * java.math.BigDecimal pPCSUBPAG, java.math.BigDecimal pPCSUBPAGANT) throws
	 * Exception { return
	 * this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_MOVPAGRECOB(pPNTRAMIT,
	 * pPSIDEPAG, pPNMOVPAG, pPCESTPAG, pPFEFEPAG, pPCESTVAL, pPFCONTAB, pPCTIPPAG,
	 * pPCESTPAGANT, pPCSUBPAG, pPCSUBPAGANT);//AXIS-WLS1SERVER-Ready }
	 */
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_MOVPAGRECOB

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_PAGRECOB_GAR(PSSEGURO, PNTRAMIT,
	// PCTIPPAG, PSIDEPAG, PCTIPRES, PCTIPGAS, PNMOVRES, PCGARANT, PFPERINI,
	// PFPERFIN, PCMONRES, PISINRET, PIIVA, PISUPLID, PIRETENC, PIFRANQ, PCMONPAG,
	// PISINRETPAG, PIIVAPAG, PISUPLIDPAG, PIRETENCPAG, PIFRANQPAG, PFCAMBIO,
	// PIRESRED, PIRESRCM, PPIVA, PPRETENC, PCCONPAG, PNORDEN, PPRETEIVA, PPRETEICA,
	// PIRETEIVA, PIRETEICA, PIRETEIVAPAG, PIRETEICAPAG, PPICA, PIICA, PIICAPAG,
	// PCIVA_TIPIND, PCRETENC_TIPIND, PCRETEIVA_TIPIND, PCRETEICA_TIPIND, PITOTIMP,
	// PITOTRET, PIOTROSGAS, PIBASEIPOC, PPIPOCONSUMO, PCTIPIND, PIIPOCONSUMO,
	// PIOTROSGASPAG, PIBASEIPOCPAG, PIIPOCONSUMOPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_PAGRECOB_GAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN, String pPCMONRES,
			java.math.BigDecimal pPISINRET, java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
			java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String pPCMONPAG,
			java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG, java.math.BigDecimal pPISUPLIDPAG,
			java.math.BigDecimal pPIRETENCPAG, java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
			java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM, java.math.BigDecimal pPPIVA,
			java.math.BigDecimal pPPRETENC, java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPPRETEIVA, java.math.BigDecimal pPPRETEICA, java.math.BigDecimal pPIRETEIVA,
			java.math.BigDecimal pPIRETEICA, java.math.BigDecimal pPIRETEIVAPAG, java.math.BigDecimal pPIRETEICAPAG,
			java.math.BigDecimal pPPICA, java.math.BigDecimal pPIICA, java.math.BigDecimal pPIICAPAG,
			java.math.BigDecimal pPCIVA_TIPIND, java.math.BigDecimal pPCRETENC_TIPIND,
			java.math.BigDecimal pPCRETEIVA_TIPIND, java.math.BigDecimal pPCRETEICA_TIPIND,
			java.math.BigDecimal pPITOTIMP, java.math.BigDecimal pPITOTRET, java.math.BigDecimal pPIOTROSGAS,
			java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPPIPOCONSUMO, java.math.BigDecimal pPCTIPIND,
			java.math.BigDecimal pPIIPOCONSUMO, java.math.BigDecimal pPIOTROSGASPAG,
			java.math.BigDecimal pPIBASEIPOCPAG, java.math.BigDecimal pPIIPOCONSUMOPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_PAGRECOB_GAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNTRAMIT", "pPCTIPPAG", "pPSIDEPAG", "pPCTIPRES", "pPCTIPGAS",
				"pPNMOVRES", "pPCGARANT", "pPFPERINI", "pPFPERFIN", "pPCMONRES", "pPISINRET", "pPIIVA", "pPISUPLID",
				"pPIRETENC", "pPIFRANQ", "pPCMONPAG", "pPISINRETPAG", "pPIIVAPAG", "pPISUPLIDPAG", "pPIRETENCPAG",
				"pPIFRANQPAG", "pPFCAMBIO", "pPIRESRED", "pPIRESRCM", "pPPIVA", "pPPRETENC", "pPCCONPAG", "pPNORDEN",
				"pPPRETEIVA", "pPPRETEICA", "pPIRETEIVA", "pPIRETEICA", "pPIRETEIVAPAG", "pPIRETEICAPAG", "pPPICA",
				"pPIICA", "pPIICAPAG", "pPCIVA_TIPIND", "pPCRETENC_TIPIND", "pPCRETEIVA_TIPIND", "pPCRETEICA_TIPIND",
				"pPITOTIMP", "pPITOTRET", "pPIOTROSGAS", "pPIBASEIPOC", "pPPIPOCONSUMO", "pPCTIPIND", "pPIIPOCONSUMO",
				"pPIOTROSGASPAG", "pPIBASEIPOCPAG", "pPIIPOCONSUMOPAG" },
				new Object[] { pPSSEGURO, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG, pPCTIPRES, pPCTIPGAS, pPNMOVRES, pPCGARANT,
						pPFPERINI, pPFPERFIN, pPCMONRES, pPISINRET, pPIIVA, pPISUPLID, pPIRETENC, pPIFRANQ, pPCMONPAG,
						pPISINRETPAG, pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG, pPIFRANQPAG, pPFCAMBIO, pPIRESRED,
						pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN, pPPRETEIVA, pPPRETEICA, pPIRETEIVA,
						pPIRETEICA, pPIRETEIVAPAG, pPIRETEICAPAG, pPPICA, pPIICA, pPIICAPAG, pPCIVA_TIPIND,
						pPCRETENC_TIPIND, pPCRETEIVA_TIPIND, pPCRETEICA_TIPIND, pPITOTIMP, pPITOTRET, pPIOTROSGAS,
						pPIBASEIPOC, pPPIPOCONSUMO, pPCTIPIND, pPIIPOCONSUMO, pPIOTROSGASPAG, pPIBASEIPOCPAG,
						pPIIPOCONSUMOPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPPAG);
		cStmt.setObject(5, pPSIDEPAG);
		cStmt.setObject(6, pPCTIPRES);
		cStmt.setObject(7, pPCTIPGAS);
		cStmt.setObject(8, pPNMOVRES);
		cStmt.setObject(9, pPCGARANT);
		cStmt.setObject(10, pPFPERINI);
		cStmt.setObject(11, pPFPERFIN);
		cStmt.setObject(12, pPCMONRES);
		cStmt.setObject(13, pPISINRET);
		cStmt.setObject(14, pPIIVA);
		cStmt.setObject(15, pPISUPLID);
		cStmt.setObject(16, pPIRETENC);
		cStmt.setObject(17, pPIFRANQ);
		cStmt.setObject(18, pPCMONPAG);
		cStmt.setObject(19, pPISINRETPAG);
		cStmt.setObject(20, pPIIVAPAG);
		cStmt.setObject(21, pPISUPLIDPAG);
		cStmt.setObject(22, pPIRETENCPAG);
		cStmt.setObject(23, pPIFRANQPAG);
		cStmt.setObject(24, pPFCAMBIO);
		cStmt.setObject(25, pPIRESRED);
		cStmt.setObject(26, pPIRESRCM);
		cStmt.setObject(27, pPPIVA);
		cStmt.setObject(28, pPPRETENC);
		cStmt.setObject(29, pPCCONPAG);
		cStmt.setObject(30, pPNORDEN);
		cStmt.setObject(32, pPPRETEIVA);
		cStmt.setObject(33, pPPRETEICA);
		cStmt.setObject(34, pPIRETEIVA);
		cStmt.setObject(35, pPIRETEICA);
		cStmt.setObject(36, pPIRETEIVAPAG);
		cStmt.setObject(37, pPIRETEICAPAG);
		cStmt.setObject(38, pPPICA);
		cStmt.setObject(39, pPIICA);
		cStmt.setObject(40, pPIICAPAG);
		cStmt.setObject(41, pPCIVA_TIPIND);
		cStmt.setObject(42, pPCRETENC_TIPIND);
		cStmt.setObject(43, pPCRETEIVA_TIPIND);
		cStmt.setObject(44, pPCRETEICA_TIPIND);
		cStmt.setObject(45, pPITOTIMP);
		cStmt.setObject(46, pPITOTRET);
		cStmt.setObject(47, pPIOTROSGAS);
		cStmt.setObject(48, pPIBASEIPOC);
		cStmt.setObject(49, pPPIPOCONSUMO);
		cStmt.setObject(50, pPCTIPIND);
		cStmt.setObject(51, pPIIPOCONSUMO);
		cStmt.setObject(52, pPIOTROSGASPAG);
		cStmt.setObject(53, pPIBASEIPOCPAG);
		cStmt.setObject(54, pPIIPOCONSUMOPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(31));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_PAGRECOB_GAR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN, String pPCMONRES,
			java.math.BigDecimal pPISINRET, java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
			java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String pPCMONPAG,
			java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG, java.math.BigDecimal pPISUPLIDPAG,
			java.math.BigDecimal pPIRETENCPAG, java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
			java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM, java.math.BigDecimal pPPIVA,
			java.math.BigDecimal pPPRETENC, java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPPRETEIVA, java.math.BigDecimal pPPRETEICA, java.math.BigDecimal pPIRETEIVA,
			java.math.BigDecimal pPIRETEICA, java.math.BigDecimal pPIRETEIVAPAG, java.math.BigDecimal pPIRETEICAPAG,
			java.math.BigDecimal pPPICA, java.math.BigDecimal pPIICA, java.math.BigDecimal pPIICAPAG,
			java.math.BigDecimal pPCIVA_TIPIND, java.math.BigDecimal pPCRETENC_TIPIND,
			java.math.BigDecimal pPCRETEIVA_TIPIND, java.math.BigDecimal pPCRETEICA_TIPIND,
			java.math.BigDecimal pPITOTIMP, java.math.BigDecimal pPITOTRET, java.math.BigDecimal pPIOTROSGAS,
			java.math.BigDecimal pPIBASEIPOC, java.math.BigDecimal pPPIPOCONSUMO, java.math.BigDecimal pPCTIPIND,
			java.math.BigDecimal pPIIPOCONSUMO, java.math.BigDecimal pPIOTROSGASPAG,
			java.math.BigDecimal pPIBASEIPOCPAG, java.math.BigDecimal pPIIPOCONSUMOPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_PAGRECOB_GAR(pPSSEGURO, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG,
				pPCTIPRES, pPCTIPGAS, pPNMOVRES, pPCGARANT, pPFPERINI, pPFPERFIN, pPCMONRES, pPISINRET, pPIIVA,
				pPISUPLID, pPIRETENC, pPIFRANQ, pPCMONPAG, pPISINRETPAG, pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG,
				pPIFRANQPAG, pPFCAMBIO, pPIRESRED, pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN, pPPRETEIVA,
				pPPRETEICA, pPIRETEIVA, pPIRETEICA, pPIRETEIVAPAG, pPIRETEICAPAG, pPPICA, pPIICA, pPIICAPAG,
				pPCIVA_TIPIND, pPCRETENC_TIPIND, pPCRETEIVA_TIPIND, pPCRETEICA_TIPIND, pPITOTIMP, pPITOTRET,
				pPIOTROSGAS, pPIBASEIPOC, pPPIPOCONSUMO, pPCTIPIND, pPIIPOCONSUMO, pPIOTROSGASPAG, pPIBASEIPOCPAG,
				pPIIPOCONSUMOPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_PAGRECOB_GAR

	// --START-PAC_IAX_SINIESTROS.F_GET_UNITRADEFECTE(PCEMPRES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_UNITRADEFECTE(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_UNITRADEFECTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PCUNITRA"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PCTRAMIT"
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
			retVal.put("PCUNITRA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCUNITRA", null);
		}
		try {
			retVal.put("PCTRAMIT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCTRAMIT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_UNITRADEFECTE(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_UNITRADEFECTE(pPCEMPRES);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_UNITRADEFECTE

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDANYO(PNSINIES, PNTRAMIT,
	// PNDANO, PCTIPINF, PTDANO)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDANYO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDANO, java.math.BigDecimal pPCTIPINF, String pPTDANO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDANYO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDANO", "pPCTIPINF", "pPTDANO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDANO, pPCTIPINF, pPTDANO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDANO);
		cStmt.setObject(5, pPCTIPINF);
		cStmt.setObject(6, pPTDANO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PNDANOUT"
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
			retVal.put("PNDANOUT", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PNDANOUT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDANYO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDANO, java.math.BigDecimal pPCTIPINF,
			String pPTDANO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDANYO(pPNSINIES, pPNTRAMIT, pPNDANO, pPCTIPINF,
				pPTDANO);
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDANYO
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDETDANYO(PNSINIES, PNTRAMIT,
	// PNDANO, PCTIPINF, PTDANO, DANO0, DANO1, DANO2, DANO3, DANO4, DANO5, DANO6,
	// DANO7, DANO8, DANO9, DANO10)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETDANYO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDANO, java.math.BigDecimal pPCTIPINF,
			String pPTDANO, java.math.BigDecimal pDANO0, java.math.BigDecimal pDANO1, java.math.BigDecimal pDANO2,
			java.math.BigDecimal pDANO3, java.math.BigDecimal pDANO4, java.math.BigDecimal pDANO5,
			java.math.BigDecimal pDANO6, java.math.BigDecimal pDANO7, java.math.BigDecimal pDANO8,
			java.math.BigDecimal pDANO9, java.math.BigDecimal pDANO10) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDETDANYO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDANO", "pPCTIPINF", "pPTDANO", "pDANO0", "pDANO1",
						"pDANO2", "pDANO3", "pDANO4", "pDANO5", "pDANO6", "pDANO7", "pDANO8", "pDANO9", "pDANO10" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDANO, pPCTIPINF, pPTDANO, pDANO0, pDANO1, pDANO2, pDANO3,
						pDANO4, pDANO5, pDANO6, pDANO7, pDANO8, pDANO9, pDANO10 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDANO);
		cStmt.setObject(5, pPCTIPINF);
		cStmt.setObject(6, pPTDANO);
		cStmt.setObject(7, pDANO0);
		cStmt.setObject(8, pDANO1);
		cStmt.setObject(9, pDANO2);
		cStmt.setObject(10, pDANO3);
		cStmt.setObject(11, pDANO4);
		cStmt.setObject(12, pDANO5);
		cStmt.setObject(13, pDANO6);
		cStmt.setObject(14, pDANO7);
		cStmt.setObject(15, pDANO8);
		cStmt.setObject(16, pDANO9);
		cStmt.setObject(17, pDANO10);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETDANYO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDANO, java.math.BigDecimal pPCTIPINF,
			String pPTDANO, java.math.BigDecimal pDANO0, java.math.BigDecimal pDANO1, java.math.BigDecimal pDANO2,
			java.math.BigDecimal pDANO3, java.math.BigDecimal pDANO4, java.math.BigDecimal pDANO5,
			java.math.BigDecimal pDANO6, java.math.BigDecimal pDANO7, java.math.BigDecimal pDANO8,
			java.math.BigDecimal pDANO9, java.math.BigDecimal pDANO10) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETDANYO(pPNSINIES, pPNTRAMIT, pPNDANO, pPCTIPINF,
				pPTDANO, pDANO0, pDANO1, pDANO2, pDANO3, pDANO4, pDANO5, pDANO6, pDANO7, pDANO8, pDANO9, pDANO10);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDETDANYO

	// --START-PAC_IAX_SINIESTROS.F_GET_CAUMOT_DESTFORMULA(PSCAUMOT, PCTIPDES,
	// PCCAMPO, PCCLAVE)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTFORMULA(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, String pPCCAMPO, java.math.BigDecimal pPCCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAUMOT_DESTFORMULA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPCTIPDES", "pPCCAMPO", "pPCCLAVE" },
				new Object[] { pPSCAUMOT, pPCTIPDES, pPCCAMPO, pPCCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPCTIPDES);
		cStmt.setObject(4, pPCCAMPO);
		cStmt.setObject(5, pPCCLAVE);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTFORMULA(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, String pPCCAMPO, java.math.BigDecimal pPCCLAVE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTFORMULA(pPSCAUMOT, pPCTIPDES, pPCCAMPO, pPCCLAVE);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_CAUMOT_DESTFORMULA
	// --START-PAC_IAX_SINIESTROS.F_GET_CAUMOT_DESTINATARIO(PSCAUMOT, PCTIPDES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTINATARIO(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAUMOT_DESTINATARIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPCTIPDES" }, new Object[] { pPSCAUMOT, pPCTIPDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPCTIPDES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTINATARIO(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTINATARIO(pPSCAUMOT, pPCTIPDES);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_CAUMOT_DESTINATARIO
	// --START-PAC_IAX_SINIESTROS.F_GET_CAUMOT_PRODUCTE(PSCAUMOT, PSPRODUC,
	// PCACTIVI, PCGARANT, PCTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAUMOT_PRODUCTE(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAUMOT_PRODUCTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCTRAMIT" },
				new Object[] { pPSCAUMOT, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPCTRAMIT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_PRODUCTE(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAUMOT_PRODUCTE(pPSCAUMOT, pPSPRODUC, pPCACTIVI, pPCGARANT,
				pPCTRAMIT);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_CAUMOT_PRODUCTE
	// --START-PAC_IAX_SINIESTROS.F_GET_CAUSAS_MOTIVOS(PCEMPRES, PCRAMO, PSPRODUC,
	// PCCAUSIN, PCMOTSIN, PCTIPDES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAUSAS_MOTIVOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCTIPDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAUSAS_MOTIVOS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPCCAUSIN", "pPCMOTSIN", "pPCTIPDES" },
				new Object[] { pPCEMPRES, pPCRAMO, pPSPRODUC, pPCCAUSIN, pPCMOTSIN, pPCTIPDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCCAUSIN);
		cStmt.setObject(6, pPCMOTSIN);
		cStmt.setObject(7, pPCTIPDES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAUSAS_MOTIVOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCTIPDES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAUSAS_MOTIVOS(pPCEMPRES, pPCRAMO, pPSPRODUC, pPCCAUSIN, pPCMOTSIN,
				pPCTIPDES);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_CAUSAS_MOTIVOS

	// bug 0022490
	// --START-PAC_IAX_SINIESTROS.F_SET_SIN_CAUSA_MOTIVO(PSCAUMOT, PCCAUSIN,
	// PCMOTSIN, PCPAGAUT, PCMOTMOV, PCMOTFIN, PCMOVIMI, PCDESAUT, PCULTPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_SIN_CAUSA_MOTIVO(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCPAGAUT,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPCMOTFIN, java.math.BigDecimal pPCMOVIMI,
			java.math.BigDecimal pPCDESAUT, java.math.BigDecimal pPCULTPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_SIN_CAUSA_MOTIVO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSCAUMOT", "pPCCAUSIN", "pPCMOTSIN", "pPCPAGAUT", "pPCMOTMOV", "pPCMOTFIN",
						"pPCMOVIMI", "pPCDESAUT", "pPCULTPAG" },
				new Object[] { pPSCAUMOT, pPCCAUSIN, pPCMOTSIN, pPCPAGAUT, pPCMOTMOV, pPCMOTFIN, pPCMOVIMI, pPCDESAUT,
						pPCULTPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPCCAUSIN);
		cStmt.setObject(4, pPCMOTSIN);
		cStmt.setObject(5, pPCPAGAUT);
		cStmt.setObject(6, pPCMOTMOV);
		cStmt.setObject(7, pPCMOTFIN);
		cStmt.setObject(8, pPCMOVIMI);
		cStmt.setObject(9, pPCDESAUT);
		cStmt.setObject(10, pPCULTPAG);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_SIN_CAUSA_MOTIVO(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCPAGAUT,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPCMOTFIN, java.math.BigDecimal pPCMOVIMI,
			java.math.BigDecimal pPCDESAUT, java.math.BigDecimal pPCULTPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_SIN_CAUSA_MOTIVO(pPSCAUMOT, pPCCAUSIN, pPCMOTSIN, pPCPAGAUT,
				pPCMOTMOV, pPCMOTFIN, pPCMOVIMI, pPCDESAUT, pPCULTPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_SIN_CAUSA_MOTIVO

	// bug 0022490
	// --START-PAC_IAX_SINIESTROS.F_GET_CAUMOT(PSCAUMOT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAUMOT(java.math.BigDecimal pPSCAUMOT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAUMOT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT" }, new Object[] { pPSCAUMOT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCCAUSIN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCMOTSIN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCPAGAUT"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCMOTMOV"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PCMOTFIN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PCMOVIMI"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PCDESAUT"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PCULTPAG"
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
			retVal.put("PCCAUSIN", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCCAUSIN", null);
		}
		try {
			retVal.put("PCMOTSIN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCMOTSIN", null);
		}
		try {
			retVal.put("PCPAGAUT", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCPAGAUT", null);
		}
		try {
			retVal.put("PCMOTMOV", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCMOTMOV", null);
		}
		try {
			retVal.put("PCMOTFIN", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCMOTFIN", null);
		}
		try {
			retVal.put("PCMOVIMI", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCMOVIMI", null);
		}
		try {
			retVal.put("PCDESAUT", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCDESAUT", null);
		}
		try {
			retVal.put("PCULTPAG", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCULTPAG", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT(java.math.BigDecimal pPSCAUMOT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAUMOT(pPSCAUMOT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_CAUMOT

	// --START-PAC_IAX_SINIESTROS.F_SET_CAUMOT_PRODUCTE(PSCAUMOT, PSPRODUC,
	// PCACTIVI, PCGARANT, PCTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_CAUMOT_PRODUCTE(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_CAUMOT_PRODUCTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCTRAMIT" },
				new Object[] { pPSCAUMOT, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPCTRAMIT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_CAUMOT_PRODUCTE(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_CAUMOT_PRODUCTE(pPSCAUMOT, pPSPRODUC, pPCACTIVI, pPCGARANT,
				pPCTRAMIT);
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_CAUMOT_PRODUCTE
	// --START-PAC_IAX_SINIESTROS.F_DEL_CAUMOT_PRODUCTE(PSCAUMOT, PSPRODUC,
	// PCACTIVI, PCGARANT, PCTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_CAUMOT_PRODUCTE(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_CAUMOT_PRODUCTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCTRAMIT" },
				new Object[] { pPSCAUMOT, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPCTRAMIT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT_PRODUCTE(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_CAUMOT_PRODUCTE(pPSCAUMOT, pPSPRODUC, pPCACTIVI, pPCGARANT,
				pPCTRAMIT);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_CAUMOT_PRODUCTE

	// --START-PAC_IAX_SINIESTROS.F_SET_CAUMOT_DESTFORMULA(PSCAUMOT, PCTIPDES,
	// PCCAMPO, PCCLAVE)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_CAUMOT_DESTFORMULA(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, String pPCCAMPO, java.math.BigDecimal pPCCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_CAUMOT_DESTFORMULA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPCTIPDES", "pPCCAMPO", "pPCCLAVE" },
				new Object[] { pPSCAUMOT, pPCTIPDES, pPCCAMPO, pPCCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPCTIPDES);
		cStmt.setObject(4, pPCCAMPO);
		cStmt.setObject(5, pPCCLAVE);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_CAUMOT_DESTFORMULA(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, String pPCCAMPO, java.math.BigDecimal pPCCLAVE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_CAUMOT_DESTFORMULA(pPSCAUMOT, pPCTIPDES, pPCCAMPO, pPCCLAVE);
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_CAUMOT_DESTFORMULA
	// --START-PAC_IAX_SINIESTROS.F_DEL_CAUMOT_DESTFORMULA(PSCAUMOT, PCTIPDES,
	// PCCAMPO, PCCLAVE)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTFORMULA(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, String pPCCAMPO, java.math.BigDecimal pPCCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_CAUMOT_DESTFORMULA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPCTIPDES", "pPCCAMPO", "pPCCLAVE" },
				new Object[] { pPSCAUMOT, pPCTIPDES, pPCCAMPO, pPCCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPCTIPDES);
		cStmt.setObject(4, pPCCAMPO);
		cStmt.setObject(5, pPCCLAVE);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTFORMULA(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, String pPCCAMPO, java.math.BigDecimal pPCCLAVE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTFORMULA(pPSCAUMOT, pPCTIPDES, pPCCAMPO, pPCCLAVE);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_CAUMOT_DESTFORMULA

	// --START-PAC_IAX_SINIESTROS.F_SET_SINDETCAUSAMOT(PSCAUMOT, PCTIPDES, PCMODFIS)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_SINDETCAUSAMOT(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCMODFIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_SINDETCAUSAMOT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPCTIPDES", "pPCMODFIS" },
				new Object[] { pPSCAUMOT, pPCTIPDES, pPCMODFIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPCTIPDES);
		cStmt.setObject(4, pPCMODFIS);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_SINDETCAUSAMOT(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCMODFIS) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_SINDETCAUSAMOT(pPSCAUMOT, pPCTIPDES, pPCMODFIS);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_SINDETCAUSAMOT

	// --START-PAC_IAX_SINIESTROS.F_GET_NEXTSCAUMOT()
	private HashMap callPAC_IAX_SINIESTROS__F_GET_NEXTSCAUMOT() throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_NEXTSCAUMOT(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PSCAUMOT"
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
			retVal.put("PSCAUMOT", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PSCAUMOT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_NEXTSCAUMOT() throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_NEXTSCAUMOT();
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_NEXTSCAUMOT

	// --START-PAC_IAX_SINIESTROS.F_DEL_CAUMOT_DESTINATARIO(PSCAUMOT, PCTIPDES)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTINATARIO(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_CAUMOT_DESTINATARIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT", "pPCTIPDES" }, new Object[] { pPSCAUMOT, pPCTIPDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
		cStmt.setObject(3, pPCTIPDES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTINATARIO(java.math.BigDecimal pPSCAUMOT,
			java.math.BigDecimal pPCTIPDES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTINATARIO(pPSCAUMOT, pPCTIPDES);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_CAUMOT_DESTINATARIO

	// --START-PAC_IAX_SINIESTROS.F_DEL_CAUMOT(PSCAUMOT)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_CAUMOT(java.math.BigDecimal pPSCAUMOT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_CAUMOT(?, ?)}";

		logCall(callQuery, new String[] { "pPSCAUMOT" }, new Object[] { pPSCAUMOT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAUMOT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT(java.math.BigDecimal pPSCAUMOT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_CAUMOT(pPSCAUMOT);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_CAUMOT

	/* Nuevas funciones */

	// --START-PAC_IAX_SINIESTROS.F_DEL_CAUSA(PCCAUEST, PCESTSIN)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_CAUSA(java.math.BigDecimal pPCCAUEST, java.math.BigDecimal pPCESTSIN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_CAUSA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAUEST", "pPCESTSIN" }, new Object[] { pPCCAUEST, pPCESTSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAUEST);
		cStmt.setObject(3, pPCESTSIN);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUSA(java.math.BigDecimal pPCCAUEST,
			java.math.BigDecimal pPCESTSIN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_CAUSA(pPCCAUEST, pPCESTSIN);
	}

	// --END-PAC_IAX_SINIESTROS.F_DEL_CAUSA
	// --START-PAC_IAX_SINIESTROS.F_DEL_DETCAUSA(PCCAUEST, PCESTSIN, PCIDIOMA)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_DETCAUSA(java.math.BigDecimal pPCCAUEST,
			java.math.BigDecimal pPCESTSIN, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_DETCAUSA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAUEST", "pPCESTSIN", "pPCIDIOMA" },
				new Object[] { pPCCAUEST, pPCESTSIN, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAUEST);
		cStmt.setObject(3, pPCESTSIN);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_DETCAUSA(java.math.BigDecimal pPCCAUEST,
			java.math.BigDecimal pPCESTSIN, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_DETCAUSA(pPCCAUEST, pPCESTSIN, pPCIDIOMA);
	}

	// --END-PAC_IAX_SINIESTROS.F_DEL_DETCAUSA
	// --START-PAC_IAX_SINIESTROS.F_GET_CAUSA(PCCAUEST, PCESTSIN)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAUSA(java.math.BigDecimal pPCCAUEST, java.math.BigDecimal pPCESTSIN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAUSA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAUEST", "pPCESTSIN" }, new Object[] { pPCCAUEST, pPCESTSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAUEST);
		cStmt.setObject(3, pPCESTSIN);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAUSA(java.math.BigDecimal pPCCAUEST,
			java.math.BigDecimal pPCESTSIN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAUSA(pPCCAUEST, pPCESTSIN);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_CAUSA
	// --START-PAC_IAX_SINIESTROS.F_GET_CAUSAS(PCCAUEST, PCESTSIN, PTCAUEST)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAUSAS(java.math.BigDecimal pPCCAUEST, java.math.BigDecimal pPCESTSIN,
			String pPTCAUEST) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAUSAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAUEST", "pPCESTSIN", "pPTCAUEST" },
				new Object[] { pPCCAUEST, pPCESTSIN, pPTCAUEST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAUEST);
		cStmt.setObject(3, pPCESTSIN);
		cStmt.setObject(4, pPTCAUEST);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAUSAS(java.math.BigDecimal pPCCAUEST,
			java.math.BigDecimal pPCESTSIN, String pPTCAUEST) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAUSAS(pPCCAUEST, pPCESTSIN, pPTCAUEST);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_CAUSAS

	// --START-PAC_IAX_SINIESTROS.F_SET_CAUSA(PCCAUEST, PCESTSIN, PCIDIOMA,
	// PTCAUEST)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_CAUSA(java.math.BigDecimal pPCCAUEST, java.math.BigDecimal pPCESTSIN,
			java.math.BigDecimal pPCIDIOMA, String pPTCAUEST) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_CAUSA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAUEST", "pPCESTSIN", "pPCIDIOMA", "pPTCAUEST" },
				new Object[] { pPCCAUEST, pPCESTSIN, pPCIDIOMA, pPTCAUEST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAUEST);
		cStmt.setObject(3, pPCESTSIN);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.setObject(5, pPTCAUEST);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_CAUSA(java.math.BigDecimal pPCCAUEST,
			java.math.BigDecimal pPCESTSIN, java.math.BigDecimal pPCIDIOMA, String pPTCAUEST) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_CAUSA(pPCCAUEST, pPCESTSIN, pPCIDIOMA, pPTCAUEST);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_CAUSA

	// --START-PAC_IAX_SINIESTROS.F_SET_MOVSINIESTRO(PNSINIES, PCESTSIN, PFESTSIN,
	// PCCAUEST, PCUNITRA, PCTRAMITAD)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_MOVSINIESTRO(String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.sql.Date pPFESTSIN, java.math.BigDecimal pPCCAUEST, String pPCUNITRA, String pPCTRAMITAD)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_MOVSINIESTRO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPCESTSIN", "pPFESTSIN", "pPCCAUEST", "pPCUNITRA", "pPCTRAMITAD" },
				new Object[] { pPNSINIES, pPCESTSIN, pPFESTSIN, pPCCAUEST, pPCUNITRA, pPCTRAMITAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPCESTSIN);
		cStmt.setObject(4, pPFESTSIN);
		cStmt.setObject(5, pPCCAUEST);
		cStmt.setObject(6, pPCUNITRA);
		cStmt.setObject(7, pPCTRAMITAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PNMOVSIN"
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
			retVal.put("PNMOVSIN", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PNMOVSIN", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_MOVSINIESTRO(String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.sql.Date pPFESTSIN, java.math.BigDecimal pPCCAUEST, String pPCUNITRA, String pPCTRAMITAD)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_MOVSINIESTRO(pPNSINIES, pPCESTSIN, pPFESTSIN, pPCCAUEST, pPCUNITRA,
				pPCTRAMITAD);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_MOVSINIESTRO

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDOCUMENTO(PNSINIES, PNTRAMIT,
	// PNDOCUME, PCDOCUME, PIDDOC, PFRECLAMA, PFRECIBE, PFCADUCA, PCOBLIGA,
	// PDESCRIPCION)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDOCUMENTO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDOCUME, java.math.BigDecimal pPCDOCUME,
			java.math.BigDecimal pPIDDOC, java.sql.Date pPFRECLAMA, java.sql.Date pPFRECIBE, java.sql.Date pPFCADUCA,
			java.math.BigDecimal pPCOBLIGA, String pPDESCRIPCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDOCUMENTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDOCUME", "pPCDOCUME", "pPIDDOC", "pPFRECLAMA", "pPFRECIBE",
						"pPFCADUCA", "pPCOBLIGA", "pPDESCRIPCION" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDOCUME, pPCDOCUME, pPIDDOC, pPFRECLAMA, pPFRECIBE, pPFCADUCA,
						pPCOBLIGA, pPDESCRIPCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDOCUME);
		cStmt.setObject(5, pPCDOCUME);
		cStmt.setObject(6, pPIDDOC);
		cStmt.setObject(7, pPFRECLAMA);
		cStmt.setObject(8, pPFRECIBE);
		cStmt.setObject(9, pPFCADUCA);
		cStmt.setObject(10, pPCOBLIGA);
		cStmt.setObject(11, pPDESCRIPCION);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de "PNDOCUME_OUT"
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
			retVal.put("PNDOCUME_OUT", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PNDOCUME_OUT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDOCUMENTO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDOCUME, java.math.BigDecimal pPCDOCUME,
			java.math.BigDecimal pPIDDOC, java.sql.Date pPFRECLAMA, java.sql.Date pPFRECIBE, java.sql.Date pPFCADUCA,
			java.math.BigDecimal pPCOBLIGA, String pPDESCRIPCION) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDOCUMENTO(pPNSINIES, pPNTRAMIT, pPNDOCUME, pPCDOCUME,
				pPIDDOC, pPFRECLAMA, pPFRECIBE, pPFCADUCA, pPCOBLIGA, pPDESCRIPCION);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDOCUMENTO

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDOCUMENTO(PNSINIES, PNTRAMIT,
	// PNDOCUME)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDOCUMENTO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDOCUME) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDOCUMENTO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDOCUME" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDOCUME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDOCUME);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_DOCUMENTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDOCUMENTO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDOCUME) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDOCUMENTO(pPNSINIES, pPNTRAMIT, pPNDOCUME);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDOCUMENTO

	// --START-PAC_IAX_SINIESTROS.F_GET_DOCUMENTOS(PCDOCUME, PCIDIOMA)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_DOCUMENTOS(java.math.BigDecimal pPCDOCUME,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_DOCUMENTOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDOCUME", "pPCIDIOMA" }, new Object[] { pPCDOCUME, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDOCUME);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTTITDOC"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PTDOCUME"
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
			retVal.put("PTTITDOC", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTTITDOC", null);
		}
		try {
			retVal.put("PTDOCUME", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PTDOCUME", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_DOCUMENTOS(java.math.BigDecimal pPCDOCUME,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_DOCUMENTOS(pPCDOCUME, pPCIDIOMA);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_DOCUMENTOS

	// --START-PAC_IAX_SINIESTROS.F_GET_POLRIESGOS(PSSEGURO, PNRIESGO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_POLRIESGOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_POLRIESGOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RIESGOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_POLRIESGOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_POLRIESGOS(pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_POLRIESGOS

	// --START-PAC_IAX_SINIESTROS.F_COMPROBAR_IMPRESION(PSPRODUC, PTTIPO)
	private HashMap callPAC_IAX_SINIESTROS__F_COMPROBAR_IMPRESION(java.math.BigDecimal pPSPRODUC, String pPTTIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_COMPROBAR_IMPRESION(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPTTIPO" }, new Object[] { pPSPRODUC, pPTTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPTTIPO);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_COMPROBAR_IMPRESION(java.math.BigDecimal pPSPRODUC, String pPTTIPO)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_COMPROBAR_IMPRESION(pPSPRODUC, pPTTIPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_COMPROBAR_IMPRESION

	// Inicio IAXIS 3663 AABC 12/04/2019 Adicion campo observacion
	// --START-PAC_IAX_SINIESTROS.F_ESTADO_SINIESTRO(PNSINIES, PCESTSIN, PCCAUEST,
	// PCUNITRA, PCTRAMITAD, PCSUBTRA, PFSINFIN, POBSERV)
	private HashMap callPAC_IAX_SINIESTROS__F_ESTADO_SINIESTRO(String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.math.BigDecimal pPCCAUEST, String pPCUNITRA, String pPCTRAMITAD, java.math.BigDecimal pPCSUBTRA,
			java.sql.Date pPFSINFIN, String pPOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_ESTADO_SINIESTRO(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPCESTSIN", "pPCCAUEST", "pPCUNITRA", "pPCTRAMITAD", "pPCSUBTRA",
						"pPFSINFIN", "pPOBSERV" },
				new Object[] { pPNSINIES, pPCESTSIN, pPCCAUEST, pPCUNITRA, pPCTRAMITAD, pPCSUBTRA, pPFSINFIN,
						pPOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPCESTSIN);
		cStmt.setObject(4, pPCCAUEST);
		cStmt.setObject(5, pPCUNITRA);
		cStmt.setObject(6, pPCTRAMITAD);
		cStmt.setObject(7, pPCSUBTRA);
		cStmt.setObject(8, pPFSINFIN);
		cStmt.setObject(9, pPOBSERV);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_ESTADO_SINIESTRO(String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.math.BigDecimal pPCCAUEST, String pPCUNITRA, String pPCTRAMITAD, java.math.BigDecimal pPCSUBTRA,
			java.sql.Date pPFSINFIN, String pPOBSERV) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_ESTADO_SINIESTRO(pPNSINIES, pPCESTSIN, pPCCAUEST, pPCUNITRA, pPCTRAMITAD,
				pPCSUBTRA, pPFSINFIN, pPOBSERV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_ESTADO_SINIESTRO
	// Fin IAXIS 3663 AABC 12/04/2019 Adicion campo observacion

	// --START-PAC_IAX_SINIESTROS.F_SET_CAMPO_PLANTILLA(PNSINIES, PTTIPO, PSPRODUC,
	// PNDOCUME, PCCAMPO, PTCAMPO)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_CAMPO_PLANTILLA(String pPNSINIES, String pPTTIPO,
			java.math.BigDecimal pPSPRODUC, String pPNDOCUME, String pPCCAMPO, String pPTCAMPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_CAMPO_PLANTILLA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPTTIPO", "pPSPRODUC", "pPNDOCUME", "pPCCAMPO", "pPTCAMPO" },
				new Object[] { pPNSINIES, pPTTIPO, pPSPRODUC, pPNDOCUME, pPCCAMPO, pPTCAMPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPTTIPO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNDOCUME);
		cStmt.setObject(6, pPCCAMPO);
		cStmt.setObject(7, pPTCAMPO);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_CAMPO_PLANTILLA(String pPNSINIES, String pPTTIPO,
			java.math.BigDecimal pPSPRODUC, String pPNDOCUME, String pPCCAMPO, String pPTCAMPO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_CAMPO_PLANTILLA(pPNSINIES, pPTTIPO, pPSPRODUC, pPNDOCUME, pPCCAMPO,
				pPTCAMPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_CAMPO_PLANTILLA

	// --START-PAC_IAX_SINIESTROS.F_GET_DOCUMENTACION_PENDIENTE(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_PENDIENTE(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_DOCUMENTACION_PENDIENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTLISDOC"
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
			retVal.put("PTLISDOC", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTLISDOC", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_PENDIENTE(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_PENDIENTE(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_DOCUMENTACION_PENDIENTE

	// --START-PAC_IAX_SINIESTROS.F_GET_PAGRECOB(PNSINIES, PNTRAMIT, PSIDEPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_PAGRECOB(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_PAGRECOB(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPSIDEPAG" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPSIDEPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPSIDEPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_PAGO".toUpperCase())); // Valor de "OB_PAGRECOB"
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
			retVal.put("OB_PAGRECOB", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OB_PAGRECOB", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_PAGRECOB(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_PAGRECOB(pPNSINIES, pPNTRAMIT, pPSIDEPAG);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_PAGRECOB

	// --START-PAC_IAX_SINIESTROS.F_GET_DESUNITRADEFECTE(P_CUSER, P_SSEGURO,
	// P_CCAUSIN, P_CMOTSIN, P_NSINIES, P_NTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_DESUNITRADEFECTE(String pP_CUSER, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_CCAUSIN, java.math.BigDecimal pP_CMOTSIN, java.math.BigDecimal pP_NSINIES,
			java.math.BigDecimal pP_NTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_DESUNITRADEFECTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CUSER", "pP_SSEGURO", "pP_CCAUSIN", "pP_CMOTSIN", "pP_NSINIES", "pP_NTRAMIT" },
				new Object[] { pP_CUSER, pP_SSEGURO, pP_CCAUSIN, pP_CMOTSIN, pP_NSINIES, pP_NTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CUSER);
		cStmt.setObject(3, pP_SSEGURO);
		cStmt.setObject(4, pP_CCAUSIN);
		cStmt.setObject(5, pP_CMOTSIN);
		cStmt.setObject(6, pP_NSINIES);
		cStmt.setObject(7, pP_NTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "PTUNITRA"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "PTTRAMIT"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "PCUNITRA"
		cStmt.registerOutParameter(11, java.sql.Types.VARCHAR); // Valor de "PCTRAMIT"
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
			retVal.put("PTUNITRA", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PTUNITRA", null);
		}
		try {
			retVal.put("PTTRAMIT", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PTTRAMIT", null);
		}
		try {
			retVal.put("PCUNITRA", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCUNITRA", null);
		}
		try {
			retVal.put("PCTRAMIT", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PCTRAMIT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_DESUNITRADEFECTE(String pP_CUSER, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_CCAUSIN, java.math.BigDecimal pP_CMOTSIN, java.math.BigDecimal pP_NSINIES,
			java.math.BigDecimal pP_NTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_DESUNITRADEFECTE(pP_CUSER, pP_SSEGURO, pP_CCAUSIN, pP_CMOTSIN,
				pP_NSINIES, pP_NTRAMIT);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_DESUNITRADEFECTE

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_CABECERA_VIDA(PNSINIES, PSPRODUC,
	// PCACTIVI, PSSEGURO, PNRIESGO, PFSINIES, PFNOTIFI, PCCAUSIN, PCMOTSIN,
	// PHSINIES, PCCULPAB, PTSINIES, PTZONAOCU, PCMEDDEC, PCTIPDEC, PTNOMDEC,
	// PTNOM1DEC, PTNOM2DEC, PTAPE1DEC, PTAPE2DEC, PTTELDEC, PTMOVILDEC, PTEMAILDEC,
	// PCTIPIDE, PNNUMIDE, PNSINCIA, PCCOMPANI, PNPRESIN)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_CABECERA_VIDA(String pPNSINIES, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO,
			java.sql.Date pPFSINIES, java.sql.Date pPFNOTIFI, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, String pPHSINIES, java.math.BigDecimal pPCCULPAB, String pPTSINIES,
			String pPTZONAOCU, java.math.BigDecimal pPCMEDDEC, java.math.BigDecimal pPCTIPDEC, String pPTNOMDEC,
			String pPTNOM1DEC, String pPTNOM2DEC, String pPTAPE1DEC, String pPTAPE2DEC, String pPTTELDEC,
			String pPTMOVILDEC, String pPTEMAILDEC, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, String pPNSINCIA,
			java.math.BigDecimal pPCCOMPANI, String pPNPRESIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_CABECERA_VIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPSPRODUC", "pPCACTIVI", "pPSSEGURO", "pPNRIESGO", "pPFSINIES",
				"pPFNOTIFI", "pPCCAUSIN", "pPCMOTSIN", "pPHSINIES", "pPCCULPAB", "pPTSINIES", "pPTZONAOCU", "pPCMEDDEC",
				"pPCTIPDEC", "pPTNOMDEC", "pPTNOM1DEC", "pPTNOM2DEC", "pPTAPE1DEC", "pPTAPE2DEC", "pPTTELDEC",
				"pPTMOVILDEC", "pPTEMAILDEC", "pPCTIPIDE", "pPNNUMIDE", "pPNSINCIA", "pPCCOMPANI", "pPNPRESIN" },
				new Object[] { pPNSINIES, pPSPRODUC, pPCACTIVI, pPSSEGURO, pPNRIESGO, pPFSINIES, pPFNOTIFI, pPCCAUSIN,
						pPCMOTSIN, pPHSINIES, pPCCULPAB, pPTSINIES, pPTZONAOCU, pPCMEDDEC, pPCTIPDEC, pPTNOMDEC,
						pPTNOM1DEC, pPTNOM2DEC, pPTAPE1DEC, pPTAPE2DEC, pPTTELDEC, pPTMOVILDEC, pPTEMAILDEC, pPCTIPIDE,
						pPNNUMIDE, pPNSINCIA, pPCCOMPANI, pPNPRESIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPSSEGURO);
		cStmt.setObject(6, pPNRIESGO);
		cStmt.setObject(7, pPFSINIES);
		cStmt.setObject(8, pPFNOTIFI);
		cStmt.setObject(9, pPCCAUSIN);
		cStmt.setObject(10, pPCMOTSIN);
		cStmt.setObject(11, pPHSINIES);
		cStmt.setObject(12, pPCCULPAB);
		cStmt.setObject(13, pPTSINIES);
		cStmt.setObject(14, pPTZONAOCU);
		cStmt.setObject(15, pPCMEDDEC);
		cStmt.setObject(16, pPCTIPDEC);
		cStmt.setObject(17, pPTNOMDEC);
		cStmt.setObject(18, pPTNOM1DEC);
		cStmt.setObject(19, pPTNOM2DEC);
		cStmt.setObject(20, pPTAPE1DEC);
		cStmt.setObject(21, pPTAPE2DEC);
		cStmt.setObject(22, pPTTELDEC);
		cStmt.setObject(23, pPTMOVILDEC);
		cStmt.setObject(24, pPTEMAILDEC);
		cStmt.setObject(25, pPCTIPIDE);
		cStmt.setObject(26, pPNNUMIDE);
		cStmt.setObject(27, pPNSINCIA);
		cStmt.setObject(28, pPCCOMPANI);
		cStmt.setObject(29, pPNPRESIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(30, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(30));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_CABECERA_VIDA(String pPNSINIES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFSINIES, java.sql.Date pPFNOTIFI,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, String pPHSINIES,
			java.math.BigDecimal pPCCULPAB, String pPTSINIES, String pPTZONAOCU, java.math.BigDecimal pPCMEDDEC,
			java.math.BigDecimal pPCTIPDEC, String pPTNOMDEC, String pPTNOM1DEC, String pPTNOM2DEC, String pPTAPE1DEC,
			String pPTAPE2DEC, String pPTTELDEC, String pPTMOVILDEC, String pPTEMAILDEC, java.math.BigDecimal pPCTIPIDE,
			String pPNNUMIDE, String pPNSINCIA, java.math.BigDecimal pPCCOMPANI, String pPNPRESIN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_CABECERA_VIDA(pPNSINIES, pPSPRODUC, pPCACTIVI, pPSSEGURO,
				pPNRIESGO, pPFSINIES, pPFNOTIFI, pPCCAUSIN, pPCMOTSIN, pPHSINIES, pPCCULPAB, pPTSINIES, pPTZONAOCU,
				pPCMEDDEC, pPCTIPDEC, pPTNOMDEC, pPTNOM1DEC, pPTNOM2DEC, pPTAPE1DEC, pPTAPE2DEC, pPTTELDEC, pPTMOVILDEC,
				pPTEMAILDEC, pPCTIPIDE, pPNNUMIDE, pPNSINCIA, pPCCOMPANI, pPNPRESIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_CABECERA_VIDA

	// --START-PAC_IAX_SINIESTROS.F_GET_HISTRESERVAS(PNSINIES, PNTRAMIT, PCTIPRES,
	// PCTIPGAS, PCGARANT, PNMOVRES, PSPRODUC, PCACTIVI, PCMONRES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_HISTRESERVAS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			String pPCMONRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_HISTRESERVAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPCTIPGAS", "pPCGARANT", "pPNMOVRES",
						"pPSPRODUC", "pPCACTIVI", "pPCMONRES" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPCGARANT, pPNMOVRES, pPSPRODUC, pPCACTIVI,
						pPCMONRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPCTIPGAS);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPNMOVRES);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPCACTIVI);
		cStmt.setObject(10, pPCMONRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMI_RESERVA".toUpperCase())); // Valor de "T_RESERVAS"
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
			retVal.put("T_RESERVAS", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("T_RESERVAS", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_HISTRESERVAS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			String pPCMONRES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_HISTRESERVAS(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPCGARANT,
				pPNMOVRES, pPSPRODUC, pPCACTIVI, pPCMONRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_HISTRESERVAS

	// -- -- Bug 0017970 - 16/03/2011 - JMF
	// --START-PAC_IAX_SINIESTROS.F_DESTINA_AUT(PSSEGURO, PFSINIES, PCCAUSIN,
	// PCMOTSIN, PCGARANT)
	private HashMap callPAC_IAX_SINIESTROS__F_DESTINA_AUT(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFSINIES,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DESTINA_AUT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFSINIES", "pPCCAUSIN", "pPCMOTSIN", "pPCGARANT" },
				new Object[] { pPSSEGURO, pPFSINIES, pPCCAUSIN, pPCMOTSIN, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFSINIES);
		cStmt.setObject(4, pPCCAUSIN);
		cStmt.setObject(5, pPCMOTSIN);
		cStmt.setObject(6, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PSPERSON"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PCTIPDES"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PCTIPBAN"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "PCBANCAR"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "PCPAISRE"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de "PCTIPCAP"
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
			retVal.put("PSPERSON", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PSPERSON", null);
		}
		try {
			retVal.put("PCTIPDES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCTIPDES", null);
		}
		try {
			retVal.put("PCTIPBAN", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCTIPBAN", null);
		}
		try {
			retVal.put("PCBANCAR", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCBANCAR", null);
		}
		try {
			retVal.put("PCPAISRE", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PCPAISRE", null);
		}
		try {
			retVal.put("PCTIPCAP", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PCTIPCAP", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DESTINA_AUT(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFSINIES,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DESTINA_AUT(pPSSEGURO, pPFSINIES, pPCCAUSIN, pPCMOTSIN, pPCGARANT);
	}
	// --END-PAC_IAX_SINIESTROS.F_DESTINA_AUT

	// --START-PAC_IAX_SINIESTROS.F_INSERTA_PAGO(PNSINIES, PNRIESGO, PNTRAMIT,
	// PCTIPRES, PCTIPGAS, PCGARANT, PFSINIES, PFPERINI, PFPERFIN, PSPRODUC,
	// PCACTIVI)
	private HashMap callPAC_IAX_SINIESTROS__F_INSERTA_PAGO(String pPNSINIES, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFSINIES, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_INSERTA_PAGO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNRIESGO", "pPNTRAMIT", "pPCTIPRES", "pPCTIPGAS", "pPCGARANT",
						"pPFSINIES", "pPFPERINI", "pPFPERFIN", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPNSINIES, pPNRIESGO, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPCGARANT, pPFSINIES, pPFPERINI,
						pPFPERFIN, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTIPRES);
		cStmt.setObject(6, pPCTIPGAS);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPFSINIES);
		cStmt.setObject(9, pPFPERINI);
		cStmt.setObject(10, pPFPERFIN);
		cStmt.setObject(11, pPSPRODUC);
		cStmt.setObject(12, pPCACTIVI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de "PSIDEPAG"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PIPAGO"
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
			retVal.put("PSIDEPAG", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PSIDEPAG", null);
		}
		try {
			retVal.put("PIPAGO", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PIPAGO", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_INSERTA_PAGO(String pPNSINIES, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFSINIES, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_INSERTA_PAGO(pPNSINIES, pPNRIESGO, pPNTRAMIT, pPCTIPRES, pPCTIPGAS,
				pPCGARANT, pPFSINIES, pPFPERINI, pPFPERFIN, pPSPRODUC, pPCACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_INSERTA_PAGO

	// --START-PAC_IAX_SINIESTROS.F_GET_FECHARESERVA(PNSINIES, PNTRAMIT, PCTIPRES,
	// PCTIPGAS, PSPRODUC, PCACTIVI, PCGARANT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_FECHARESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_FECHARESERVA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPCTIPGAS", "pPSPRODUC", "pPCACTIVI",
						"pPCGARANT" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPCTIPGAS);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCACTIVI);
		cStmt.setObject(8, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.DATE); // Valor de "PFPERINI"
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
			retVal.put("PFPERINI", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PFPERINI", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_FECHARESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_FECHARESERVA(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPSPRODUC,
				pPCACTIVI, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_FECHARESERVA

	// --START-PAC_IAX_SINIESTROS.F_DEL_ULTRESERVA(PNSINIES, PNTRAMIT, PCTIPRES,
	// PCTIPGAS, PNMOVRES, PCGARANT, PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_ULTRESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_ULTRESERVA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPCTIPGAS", "pPNMOVRES", "pPCGARANT",
						"pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPNMOVRES, pPCGARANT, pPSPRODUC,
						pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPCTIPGAS);
		cStmt.setObject(6, pPNMOVRES);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPCACTIVI);
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

	private HashMap callPAC_IAX_SINIESTROS__F_DEL_AMPARO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_AMPARO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCGARANT", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCGARANT, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCACTIVI);
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
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_ULTRESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_ULTRESERVA(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPNMOVRES,
				pPCGARANT, pPSPRODUC, pPCACTIVI);// AXIS-WLS1SERVER-Ready
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_AMPARO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_AMPARO(pPNSINIES, pPNTRAMIT, pPCGARANT, pPSPRODUC, pPCACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_ULTRESERVA

	// --START-PAC_IAX_SINIESTROS.F_GET_RESERVA(PNSINIES, PNTRAMIT, PCTIPRES,
	// PNMOVRES, PCGARANT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_RESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_RESERVA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPNMOVRES", "pPCGARANT" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPNMOVRES, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPNMOVRES);
		cStmt.setObject(6, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_RESERVA".toUpperCase())); // Valor de "OB_RESERVA"
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
			retVal.put("OB_RESERVA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("OB_RESERVA", null);
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

	private HashMap callPAC_IAX_SINIESTROS__F_GET_AMPARO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_AMPARO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCGARANT" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_AMPARO".toUpperCase())); // Valor de "OB_RESERVA"
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
			retVal.put("OB_AMPARO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OB_AMPARO", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_RESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_RESERVA(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPNMOVRES, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_AMPARO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_AMPARO(pPNSINIES, pPNTRAMIT, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_RESERVA

	// --START-PAC_IAX_SINIESTROS.F_ACTFRESFIN(PNSINIES, PNTRAMIT, PCTIPRES,
	// PCGARANT, PFRESFIN)
	private HashMap callPAC_IAX_SINIESTROS__F_ACTFRESFIN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT, java.sql.Date pPFRESFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_ACTFRESFIN(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPCGARANT", "pPFRESFIN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCGARANT, pPFRESFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPFRESFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.DATE); // Valor de "PFRESFIN_OUT"
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
			retVal.put("PFRESFIN_OUT", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PFRESFIN_OUT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_ACTFRESFIN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT, java.sql.Date pPFRESFIN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_ACTFRESFIN(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCGARANT, pPFRESFIN);
	}
	// --END-PAC_IAX_SINIESTROS.F_ACTFRESFIN

	// --START-PAC_IAX_SINIESTROS.F_PAGO_AUT(P_DATA)
	private HashMap callPAC_IAX_SINIESTROS__F_PAGO_AUT(java.sql.Date pP_DATA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_PAGO_AUT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_DATA" }, new Object[] { pP_DATA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_DATA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNCOBROS"
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
			retVal.put("PNCOBROS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNCOBROS", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_PAGO_AUT(java.sql.Date pP_DATA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_PAGO_AUT(pP_DATA);
	}
	// --END-PAC_IAX_SINIESTROS.F_PAGO_AUT

	private HashMap callPAC_IAX_SINIESTROS__F_GET_DATSITRIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_DATSITRIESGO(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_DATSITRIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_DATSITRIESGO(pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_DATSITRIESGO

	// --START-PAC_IAX_SINIESTROS.F_MOV_RESERVA(PNSINIES, PNTRAMIT, PCTIPRES,
	// PCTIPGAS, PCGARANT, PNMOVRES, PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_SINIESTROS__F_MOV_RESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_MOV_RESERVA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPCTIPGAS", "pPCGARANT", "pPNMOVRES",
						"pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPCGARANT, pPNMOVRES, pPSPRODUC,
						pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPCTIPGAS);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPNMOVRES);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPCACTIVI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PMODIFICABLE"
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
			retVal.put("PMODIFICABLE", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PMODIFICABLE", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_MOV_RESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_MOV_RESERVA(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPCGARANT,
				pPNMOVRES, pPSPRODUC, pPCACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_MOV_RESERVA

	// --START-PAC_IAX_SINIESTROS.F_PERDELRESERVA(PNSINIES, PNTRAMIT, PCTIPRES,
	// PCTIPGAS, PCGARANT, PFRESINI, PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_SINIESTROS__F_PERDELRESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCGARANT,
			java.sql.Date pPFRESINI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_PERDELRESERVA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPRES", "pPCTIPGAS", "pPCGARANT", "pPFRESINI",
						"pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPCGARANT, pPFRESINI, pPSPRODUC,
						pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPRES);
		cStmt.setObject(5, pPCTIPGAS);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPFRESINI);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPCACTIVI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PMODIFICABLE"
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
			retVal.put("PMODIFICABLE", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PMODIFICABLE", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_PERDELRESERVA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPCGARANT,
			java.sql.Date pPFRESINI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_PERDELRESERVA(pPNSINIES, pPNTRAMIT, pPCTIPRES, pPCTIPGAS, pPCGARANT,
				pPFRESINI, pPSPRODUC, pPCACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_PERDELRESERVA

	// --START-PAC_IAX_SINIESTROS.F_GEN_RESDESTINATARI(PCCAUSIN, PCMOTSIN, PCGARANT,
	// PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_SINIESTROS__F_GEN_RESDESTINATARI(java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GEN_RESDESTINATARI(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAUSIN", "pPCMOTSIN", "pPCGARANT", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCCAUSIN, pPCMOTSIN, pPCGARANT, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAUSIN);
		cStmt.setObject(3, pPCMOTSIN);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PGENERAR"
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
			retVal.put("PGENERAR", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PGENERAR", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GEN_RESDESTINATARI(java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GEN_RESDESTINATARI(pPCCAUSIN, pPCMOTSIN, pPCGARANT, pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_SINIESTROS.F_GEN_RESDESTINATARI

	// --START-PAC_IAX_SINIESTROS.F_GET_CAPITALGAR(PCGARANT, PSSEGURO, PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_CAPITALGAR(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSSEGURO, String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CAPITALGAR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCGARANT", "pPSSEGURO", "pPNSINIES" },
				new Object[] { pPCGARANT, pPSSEGURO, pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCAPITAL"
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
			retVal.put("PCAPITAL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCAPITAL", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CAPITALGAR(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSSEGURO, String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CAPITALGAR(pPCGARANT, pPSSEGURO, pPNSINIES);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_CAPITALGAR

	// --START-PAC_IAX_SINIESTROS.F_CONSULTA_LSTSINI_RIESGO(PSSEGURO, PNRIESGO)
	private HashMap callPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI_RIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_CONSULTA_LSTSINI_RIESGO(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI_RIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI_RIESGO(pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_SINIESTROS.F_CONSULTA_LSTSINI_RIESGO

	/*
	 * ******************************************** PRESTACIONES
	 * **********************************************
	 */
	// --START-PAC_IAX_SINIESTROS.F_DEL_PRESTAREN(PNSINIES, PNTRAMIT, PSPERSON,
	// PCTIPDES, PNPRESTA)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_PRESTAREN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPNPRESTA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_PRESTAREN(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPSPERSON", "pPCTIPDES", "pPNPRESTA" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPSPERSON, pPCTIPDES, pPNPRESTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPNPRESTA);
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
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_PRESTAREN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPNPRESTA)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_PRESTAREN(pPNSINIES, pPNTRAMIT, pPSPERSON, pPCTIPDES, pPNPRESTA);
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_PRESTAREN

	/*
	 * //--START-PAC_IAX_SINIESTROS.F_SET_CABECERA_SINIESTRO(PNSINIES, PSSEGURO,
	 * PNRIESGO, PNMOVIMI, PFSINIES, PHSINIES, PFNOTIFI, PCCAUSIN, PCMOTSIN,
	 * PCEVENTO, PCCULPAB, PCRECLAMA, PNASEGUR, PCMEDDEC, PCTIPDEC, PTNOMDEC,
	 * PTAPE1DEC, PTAPE2DEC, PTTELDEC, PTSINIES, PCTIPIDE, PNNUMIDE, PSPERSON_DEC,
	 * PCNIVEL, PSPERSON2, PFECHAPP) private HashMap
	 * callPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO (String pPNSINIES,
	 * java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO,
	 * java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFSINIES, String pPHSINIES,
	 * java.sql.Date pPFNOTIFI, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal
	 * pPCMOTSIN, String pPCEVENTO, java.math.BigDecimal pPCCULPAB,
	 * java.math.BigDecimal pPCRECLAMA, java.math.BigDecimal pPNASEGUR,
	 * java.math.BigDecimal pPCMEDDEC, java.math.BigDecimal pPCTIPDEC, String
	 * pPTNOMDEC, String pPTAPE1DEC, String pPTAPE2DEC, String pPTTELDEC, String
	 * pPTSINIES, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE,
	 * java.math.BigDecimal pPSPERSON_DEC, java.math.BigDecimal pPCNIVEL,
	 * java.math.BigDecimal pPSPERSON2, java.sql.Date pPFECHAPP) throws Exception {
	 * String
	 * callQuery="{?=call PAC_IAX_SINIESTROS.F_SET_CABECERA_SINIESTRO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPNSINIES", "pPSSEGURO", "pPNRIESGO",
	 * "pPNMOVIMI", "pPFSINIES", "pPHSINIES", "pPFNOTIFI", "pPCCAUSIN", "pPCMOTSIN",
	 * "pPCEVENTO", "pPCCULPAB", "pPCRECLAMA", "pPNASEGUR", "pPCMEDDEC",
	 * "pPCTIPDEC", "pPTNOMDEC", "pPTAPE1DEC", "pPTAPE2DEC", "pPTTELDEC",
	 * "pPTSINIES", "pPCTIPIDE", "pPNNUMIDE", "pPSPERSON_DEC", "pPCNIVEL",
	 * "pPSPERSON2", "pPFECHAPP"}, new Object[] {pPNSINIES, pPSSEGURO, pPNRIESGO,
	 * pPNMOVIMI, pPFSINIES, pPHSINIES, pPFNOTIFI, pPCCAUSIN, pPCMOTSIN, pPCEVENTO,
	 * pPCCULPAB, pPCRECLAMA, pPNASEGUR, pPCMEDDEC, pPCTIPDEC, pPTNOMDEC,
	 * pPTAPE1DEC, pPTAPE2DEC, pPTTELDEC, pPTSINIES, pPCTIPIDE, pPNNUMIDE,
	 * pPSPERSON_DEC, pPCNIVEL, pPSPERSON2, pPFECHAPP}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPNSINIES); cStmt.setObject(3, pPSSEGURO); cStmt.setObject(4, pPNRIESGO);
	 * cStmt.setObject(5, pPNMOVIMI); cStmt.setObject(6, pPFSINIES);
	 * cStmt.setObject(7, pPHSINIES); cStmt.setObject(8, pPFNOTIFI);
	 * cStmt.setObject(9, pPCCAUSIN); cStmt.setObject(10, pPCMOTSIN);
	 * cStmt.setObject(11, pPCEVENTO); cStmt.setObject(12, pPCCULPAB);
	 * cStmt.setObject(13, pPCRECLAMA); cStmt.setObject(14, pPNASEGUR);
	 * cStmt.setObject(15, pPCMEDDEC); cStmt.setObject(16, pPCTIPDEC);
	 * cStmt.setObject(17, pPTNOMDEC); cStmt.setObject(18, pPTAPE1DEC);
	 * cStmt.setObject(19, pPTAPE2DEC); cStmt.setObject(20, pPTTELDEC);
	 * cStmt.setObject(21, pPTSINIES); cStmt.setObject(22, pPCTIPIDE);
	 * cStmt.setObject(23, pPNNUMIDE); cStmt.setObject(24, pPSPERSON_DEC);
	 * cStmt.setObject(25, pPCNIVEL); cStmt.setObject(26, pPSPERSON2);
	 * cStmt.setObject(27, pPFECHAPP); cStmt.registerOutParameter(1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(28,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal=new HashMap(); try { retVal.put("RETURN", cStmt.getObject(1));
	 * } catch (SQLException e) { retVal.put("RETURN", null); } try {
	 * retVal.put("MENSAJES", cStmt.getObject(28)); } catch (SQLException e) {
	 * retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO (String
	 * pPNSINIES, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO,
	 * java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFSINIES, String pPHSINIES,
	 * java.sql.Date pPFNOTIFI, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal
	 * pPCMOTSIN, String pPCEVENTO, java.math.BigDecimal pPCCULPAB,
	 * java.math.BigDecimal pPCRECLAMA, java.math.BigDecimal pPNASEGUR,
	 * java.math.BigDecimal pPCMEDDEC, java.math.BigDecimal pPCTIPDEC, String
	 * pPTNOMDEC, String pPTAPE1DEC, String pPTAPE2DEC, String pPTTELDEC, String
	 * pPTSINIES, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE,
	 * java.math.BigDecimal pPSPERSON_DEC, java.math.BigDecimal pPCNIVEL,
	 * java.math.BigDecimal pPSPERSON2, java.sql.Date pPFECHAPP) throws Exception {
	 * return this.callPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO(pPNSINIES,
	 * pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPFSINIES, pPHSINIES, pPFNOTIFI, pPCCAUSIN,
	 * pPCMOTSIN, pPCEVENTO, pPCCULPAB, pPCRECLAMA, pPNASEGUR, pPCMEDDEC, pPCTIPDEC,
	 * pPTNOMDEC, pPTAPE1DEC, pPTAPE2DEC, pPTTELDEC, pPTSINIES, pPCTIPIDE,
	 * pPNNUMIDE, pPSPERSON_DEC, pPCNIVEL, pPSPERSON2, pPFECHAPP); }
	 * //--END-PAC_IAX_SINIESTROS.F_SET_CABECERA_SINIESTRO
	 */

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINPRESTAREN(PNSINIES, PNTRAMIT,
	// PSPERSON, PCTIPDES, PSSEGURO, PF1PAREN, PFUPAREN, PCFORPAG, PIBRUREN,
	// PCREVALI, PPREVALI, PIREVALI, PCTIPDUR, PNPARTOT, PCTIPBAN, PCBANCAR,
	// PCESTADO, PCMOTIVO, PCBLOPAG, PNMES1, PNMES2, PNMES3, PNMES4, PNMES5, PNMES6,
	// PNMES7, PNMES8, PNMES9, PNMES10, PNMES11, PNMES12, PNPRESTA)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINPRESTAREN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPF1PAREN, java.sql.Date pPFUPAREN, java.math.BigDecimal pPCFORPAG,
			java.math.BigDecimal pPIBRUREN, java.math.BigDecimal pPCREVALI, java.math.BigDecimal pPPREVALI,
			java.math.BigDecimal pPIREVALI, java.math.BigDecimal pPCTIPDUR, java.math.BigDecimal pPNPARTOT,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCBLOPAG, java.math.BigDecimal pPNMES1,
			java.math.BigDecimal pPNMES2, java.math.BigDecimal pPNMES3, java.math.BigDecimal pPNMES4,
			java.math.BigDecimal pPNMES5, java.math.BigDecimal pPNMES6, java.math.BigDecimal pPNMES7,
			java.math.BigDecimal pPNMES8, java.math.BigDecimal pPNMES9, java.math.BigDecimal pPNMES10,
			java.math.BigDecimal pPNMES11, java.math.BigDecimal pPNMES12, java.math.BigDecimal pPNPRESTA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINPRESTAREN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPSPERSON", "pPCTIPDES", "pPSSEGURO", "pPF1PAREN",
						"pPFUPAREN", "pPCFORPAG", "pPIBRUREN", "pPCREVALI", "pPPREVALI", "pPIREVALI", "pPCTIPDUR",
						"pPNPARTOT", "pPCTIPBAN", "pPCBANCAR", "pPCESTADO", "pPCMOTIVO", "pPCBLOPAG", "pPNMES1",
						"pPNMES2", "pPNMES3", "pPNMES4", "pPNMES5", "pPNMES6", "pPNMES7", "pPNMES8", "pPNMES9",
						"pPNMES10", "pPNMES11", "pPNMES12", "pPNPRESTA" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPSPERSON, pPCTIPDES, pPSSEGURO, pPF1PAREN, pPFUPAREN, pPCFORPAG,
						pPIBRUREN, pPCREVALI, pPPREVALI, pPIREVALI, pPCTIPDUR, pPNPARTOT, pPCTIPBAN, pPCBANCAR,
						pPCESTADO, pPCMOTIVO, pPCBLOPAG, pPNMES1, pPNMES2, pPNMES3, pPNMES4, pPNMES5, pPNMES6, pPNMES7,
						pPNMES8, pPNMES9, pPNMES10, pPNMES11, pPNMES12, pPNPRESTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPSSEGURO);
		cStmt.setObject(7, pPF1PAREN);
		cStmt.setObject(8, pPFUPAREN);
		cStmt.setObject(9, pPCFORPAG);
		cStmt.setObject(10, pPIBRUREN);
		cStmt.setObject(11, pPCREVALI);
		cStmt.setObject(12, pPPREVALI);
		cStmt.setObject(13, pPIREVALI);
		cStmt.setObject(14, pPCTIPDUR);
		cStmt.setObject(15, pPNPARTOT);
		cStmt.setObject(16, pPCTIPBAN);
		cStmt.setObject(17, pPCBANCAR);
		cStmt.setObject(18, pPCESTADO);
		cStmt.setObject(19, pPCMOTIVO);
		cStmt.setObject(20, pPCBLOPAG);
		cStmt.setObject(21, pPNMES1);
		cStmt.setObject(22, pPNMES2);
		cStmt.setObject(23, pPNMES3);
		cStmt.setObject(24, pPNMES4);
		cStmt.setObject(25, pPNMES5);
		cStmt.setObject(26, pPNMES6);
		cStmt.setObject(27, pPNMES7);
		cStmt.setObject(28, pPNMES8);
		cStmt.setObject(29, pPNMES9);
		cStmt.setObject(30, pPNMES10);
		cStmt.setObject(31, pPNMES11);
		cStmt.setObject(32, pPNMES12);
		cStmt.setObject(33, pPNPRESTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(34, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(34));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINPRESTAREN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPF1PAREN, java.sql.Date pPFUPAREN, java.math.BigDecimal pPCFORPAG,
			java.math.BigDecimal pPIBRUREN, java.math.BigDecimal pPCREVALI, java.math.BigDecimal pPPREVALI,
			java.math.BigDecimal pPIREVALI, java.math.BigDecimal pPCTIPDUR, java.math.BigDecimal pPNPARTOT,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCBLOPAG, java.math.BigDecimal pPNMES1,
			java.math.BigDecimal pPNMES2, java.math.BigDecimal pPNMES3, java.math.BigDecimal pPNMES4,
			java.math.BigDecimal pPNMES5, java.math.BigDecimal pPNMES6, java.math.BigDecimal pPNMES7,
			java.math.BigDecimal pPNMES8, java.math.BigDecimal pPNMES9, java.math.BigDecimal pPNMES10,
			java.math.BigDecimal pPNMES11, java.math.BigDecimal pPNMES12, java.math.BigDecimal pPNPRESTA)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINPRESTAREN(pPNSINIES, pPNTRAMIT, pPSPERSON, pPCTIPDES,
				pPSSEGURO, pPF1PAREN, pPFUPAREN, pPCFORPAG, pPIBRUREN, pPCREVALI, pPPREVALI, pPIREVALI, pPCTIPDUR,
				pPNPARTOT, pPCTIPBAN, pPCBANCAR, pPCESTADO, pPCMOTIVO, pPCBLOPAG, pPNMES1, pPNMES2, pPNMES3, pPNMES4,
				pPNMES5, pPNMES6, pPNMES7, pPNMES8, pPNMES9, pPNMES10, pPNMES11, pPNMES12, pPNPRESTA);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINPRESTAREN

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMIDESTINATARI(PSSEGURO, PNSINIES,
	// PNTRAMIT, PCTIPDES, PCPAGDES, PCACTPRO, PPASIGNA, PCPAISRE, PSPERSON,
	// PCTIPBAN, PCBANCAR, PCTIPCAP, PCRELASE)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPCPAGDES, java.math.BigDecimal pPCACTPRO, java.math.BigDecimal pPPASIGNA,
			java.math.BigDecimal pPCPAISRE, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.math.BigDecimal pPCTIPCAP, java.math.BigDecimal pPCRELASE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMIDESTINATARI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCTIPDES", "pPCPAGDES", "pPCACTPRO",
						"pPPASIGNA", "pPCPAISRE", "pPSPERSON", "pPCTIPBAN", "pPCBANCAR", "pPCTIPCAP", "pPCRELASE" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPDES, pPCPAGDES, pPCACTPRO, pPPASIGNA, pPCPAISRE,
						pPSPERSON, pPCTIPBAN, pPCBANCAR, pPCTIPCAP, pPCRELASE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPCPAGDES);
		cStmt.setObject(7, pPCACTPRO);
		cStmt.setObject(8, pPPASIGNA);
		cStmt.setObject(9, pPCPAISRE);
		cStmt.setObject(10, pPSPERSON);
		cStmt.setObject(11, pPCTIPBAN);
		cStmt.setObject(12, pPCBANCAR);
		cStmt.setObject(13, pPCTIPCAP);
		cStmt.setObject(14, pPCRELASE);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPCPAGDES, java.math.BigDecimal pPCACTPRO, java.math.BigDecimal pPPASIGNA,
			java.math.BigDecimal pPCPAISRE, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.math.BigDecimal pPCTIPCAP, java.math.BigDecimal pPCRELASE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTIPDES,
				pPCPAGDES, pPCACTPRO, pPPASIGNA, pPCPAISRE, pPSPERSON, pPCTIPBAN, pPCBANCAR, pPCTIPCAP, pPCRELASE);
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAMIDESTINATARI

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJ_SINPRESTAREN(PNSINIES, PNTRAMIT,
	// PSPERSON, PCTIPDES, PSSEGURO, PNPRESTA)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJ_SINPRESTAREN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNPRESTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJ_SINPRESTAREN(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPSPERSON", "pPCTIPDES", "pPSSEGURO", "pPNPRESTA" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPSPERSON, pPCTIPDES, pPSSEGURO, pPNPRESTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPSSEGURO);
		cStmt.setObject(7, pPNPRESTA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_PRESTAREN".toUpperCase())); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINPRESTAREN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNPRESTA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJ_SINPRESTAREN(pPNSINIES, pPNTRAMIT, pPSPERSON, pPCTIPDES,
				pPSSEGURO, pPNPRESTA);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJ_SINPRESTAREN

	// --START-PAC_IAX_SINIESTROS.F_GET_PRODUCTOS_PAGOS(PCEMPRES, PFILTRO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPFILTRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_PRODUCTOS_PAGOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFILTRO" }, new Object[] { pPCEMPRES, pPFILTRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFILTRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO".toUpperCase())); // Valor de "PPRODUCTOS"
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
			retVal.put("PPRODUCTOS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PPRODUCTOS", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPFILTRO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS(pPCEMPRES, pPFILTRO);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_PRODUCTOS_PAGOS
	// --START-PAC_IAX_SINIESTROS.F_GET_PRODUCTOS_PAGOS_OB()
	private HashMap callPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS_OB() throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_PRODUCTOS_PAGOS_OB(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO".toUpperCase())); // Valor de "PPRODUCTOS"
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
			retVal.put("PPRODUCTOS", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PPRODUCTOS", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS_OB() throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS_OB();
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_PRODUCTOS_PAGOS_OB
	// --START-PAC_IAX_SINIESTROS.F_MARCAR_PRODUCTO(PSPRODUC, PMARCADO)
	private HashMap callPAC_IAX_SINIESTROS__F_MARCAR_PRODUCTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPMARCADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_MARCAR_PRODUCTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPMARCADO" }, new Object[] { pPSPRODUC, pPMARCADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPMARCADO);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_MARCAR_PRODUCTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPMARCADO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_MARCAR_PRODUCTO(pPSPRODUC, pPMARCADO);
	}
	// --END-PAC_IAX_SINIESTROS.F_MARCAR_PRODUCTO

	// --START-PAC_IAX_SINIESTROS.F_PAGO_RENTA_AUT(P_DATA)
	private HashMap callPAC_IAX_SINIESTROS__F_PAGO_RENTA_AUT(java.sql.Date pP_DATA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_PAGO_RENTA_AUT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_DATA" }, new Object[] { pP_DATA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_DATA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNCOBROS"
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
			retVal.put("PNCOBROS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNCOBROS", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_PAGO_RENTA_AUT(java.sql.Date pP_DATA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_PAGO_RENTA_AUT(pP_DATA);
	}
	// --END-PAC_IAX_SINIESTROS.F_PAGO_RENTA_AUT

	// --START-PAC_IAX_SINIESTROS.F_GET_TRAMITADOR_DEFECTO(P_CUSER, P_SSEGURO,
	// P_CCAUSIN, P_CMOTSIN, P_NSINIES, P_NTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_DEFECTO(String pP_CUSER, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_CCAUSIN, java.math.BigDecimal pP_CMOTSIN, java.math.BigDecimal pP_NSINIES,
			java.math.BigDecimal pP_NTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_TRAMITADOR_DEFECTO(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CUSER", "pP_SSEGURO", "pP_CCAUSIN", "pP_CMOTSIN", "pP_NSINIES", "pP_NTRAMIT" },
				new Object[] { pP_CUSER, pP_SSEGURO, pP_CCAUSIN, pP_CMOTSIN, pP_NSINIES, pP_NTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CUSER);
		cStmt.setObject(3, pP_SSEGURO);
		cStmt.setObject(4, pP_CCAUSIN);
		cStmt.setObject(5, pP_CMOTSIN);
		cStmt.setObject(6, pP_NSINIES);
		cStmt.setObject(7, pP_NTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "P_CUNITRA"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "P_CTRAMITAD"
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
			retVal.put("P_CUNITRA", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_CUNITRA", null);
		}
		try {
			retVal.put("P_CTRAMITAD", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("P_CTRAMITAD", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_DEFECTO(String pP_CUSER, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_CCAUSIN, java.math.BigDecimal pP_CMOTSIN, java.math.BigDecimal pP_NSINIES,
			java.math.BigDecimal pP_NTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_DEFECTO(pP_CUSER, pP_SSEGURO, pP_CCAUSIN, pP_CMOTSIN,
				pP_NSINIES, pP_NTRAMIT);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_TRAMITADOR_DEFECTO

	// --START-PAC_IAX_SINIESTROS.F_IMPRIMIR_PAGO(PSIDEPAG, PCMAPEAD)
	private HashMap callPAC_IAX_SINIESTROS__F_IMPRIMIR_PAGO(java.math.BigDecimal pPSIDEPAG, String pPCMAPEAD)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_IMPRIMIR_PAGO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSIDEPAG", "pPCMAPEAD" }, new Object[] { pPSIDEPAG, pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDEPAG);
		cStmt.setObject(3, pPCMAPEAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PNOMFICHERO"
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
			retVal.put("PNOMFICHERO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNOMFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_IMPRIMIR_PAGO(java.math.BigDecimal pPSIDEPAG, String pPCMAPEAD)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_IMPRIMIR_PAGO(pPSIDEPAG, pPCMAPEAD);
	}
	// --END-PAC_IAX_SINIESTROS.F_IMPRIMIR_PAGO

	// --START-PAC_IAX_SINIESTROS.F_SET_CABECERA_SINIESTRO(PNSINIES, PSSEGURO,
	// PNRIESGO, PNMOVIMI, PFSINIES, PHSINIES, PFNOTIFI, PCCAUSIN, PCMOTSIN,
	// PCEVENTO, PCCULPAB, PCRECLAMA, PNASEGUR, PCMEDDEC, PCTIPDEC, PTNOMDEC,
	// PTNOM1DEC, PTNOM2DEC, PTAPE1DEC, PTAPE2DEC, PTTELDEC, PTMOVILDEC, PTEMAILDEC,
	// PTSINIES, PCTIPIDE, PNNUMIDE, PSPERSON_DEC, PNSINCIA, PCCOMPANI, PNPRESIN,
	// PCNIVEL, PSPERSON2, PFECHAPP, PCPOLCIA, PIPERIT, PCFRAUDE, PCCARPETA,
	// PASISTENCIA, PCAGENTE, PMODO, PCSALVAM, PICAPITAL, PFDETECCION)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO(String pPNSINIES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFSINIES, String pPHSINIES,
			java.sql.Date pPFNOTIFI, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, String pPCEVENTO,
			java.math.BigDecimal pPCCULPAB, java.math.BigDecimal pPCRECLAMA, java.math.BigDecimal pPNASEGUR,
			java.math.BigDecimal pPCMEDDEC, java.math.BigDecimal pPCTIPDEC, String pPTNOMDEC, String pPTNOM1DEC,
			String pPTNOM2DEC, String pPTAPE1DEC, String pPTAPE2DEC, String pPTTELDEC, String pPTMOVILDEC,
			String pPTEMAILDEC, String pPTSINIES, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE,
			java.math.BigDecimal pPSPERSON_DEC, String pPNSINCIA, java.math.BigDecimal pPCCOMPANI, String pPNPRESIN,
			java.math.BigDecimal pPCNIVEL, java.math.BigDecimal pPSPERSON2, java.sql.Date pPFECHAPP, String pPCPOLCIA,
			java.math.BigDecimal pPIPERIT, java.math.BigDecimal pPCFRAUDE, java.math.BigDecimal pPCCARPETA,
			java.math.BigDecimal pPASISTENCIA, java.math.BigDecimal pPCAGENTE, String pPMODO,
			java.math.BigDecimal pPCSALVAM, java.math.BigDecimal pPICAPITAL, java.sql.Date pPFDETECCION,
			java.math.BigDecimal pPSOLIDARIDAD, String pPTDETPRETEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_CABECERA_SINIESTRO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPSSEGURO", "pPNRIESGO", "pPNMOVIMI", "pPFSINIES", "pPHSINIES",
						"pPFNOTIFI", "pPCCAUSIN", "pPCMOTSIN", "pPCEVENTO", "pPCCULPAB", "pPCRECLAMA", "pPNASEGUR",
						"pPCMEDDEC", "pPCTIPDEC", "pPTNOMDEC", "pPTNOM1DEC", "pPTNOM2DEC", "pPTAPE1DEC", "pPTAPE2DEC",
						"pPTTELDEC", "pPTMOVILDEC", "pPTEMAILDEC", "pPTSINIES", "pPCTIPIDE", "pPNNUMIDE",
						"pPSPERSON_DEC", "pPNSINCIA", "pPCCOMPANI", "pPNPRESIN", "pPCNIVEL", "pPSPERSON2", "pPFECHAPP",
						"pPCPOLCIA", "pPIPERIT", "pPCFRAUDE", "pPCCARPETA", "pPASISTENCIA", "pPCAGENTE", "pPMODO",
						"pPCSALVAM", "pPICAPITAL", "pPFDETECCION", "pPSOLIDARIDAD", "pPTDETPRETEN" },
				new Object[] { pPNSINIES, pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPFSINIES, pPHSINIES, pPFNOTIFI, pPCCAUSIN,
						pPCMOTSIN, pPCEVENTO, pPCCULPAB, pPCRECLAMA, pPNASEGUR, pPCMEDDEC, pPCTIPDEC, pPTNOMDEC,
						pPTNOM1DEC, pPTNOM2DEC, pPTAPE1DEC, pPTAPE2DEC, pPTTELDEC, pPTMOVILDEC, pPTEMAILDEC, pPTSINIES,
						pPCTIPIDE, pPNNUMIDE, pPSPERSON_DEC, pPNSINCIA, pPCCOMPANI, pPNPRESIN, pPCNIVEL, pPSPERSON2,
						pPFECHAPP, pPCPOLCIA, pPIPERIT, pPCFRAUDE, pPCCARPETA, pPASISTENCIA, pPCAGENTE, pPMODO,
						pPCSALVAM, pPICAPITAL, pPFDETECCION, pPSOLIDARIDAD, pPTDETPRETEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPNMOVIMI);
		cStmt.setObject(6, pPFSINIES);
		cStmt.setObject(7, pPHSINIES);
		cStmt.setObject(8, pPFNOTIFI);
		cStmt.setObject(9, pPCCAUSIN);
		cStmt.setObject(10, pPCMOTSIN);
		cStmt.setObject(11, pPCEVENTO);
		cStmt.setObject(12, pPCCULPAB);
		cStmt.setObject(13, pPCRECLAMA);
		cStmt.setObject(14, pPNASEGUR);
		cStmt.setObject(15, pPCMEDDEC);
		cStmt.setObject(16, pPCTIPDEC);
		cStmt.setObject(17, pPTNOMDEC);
		cStmt.setObject(18, pPTNOM1DEC);
		cStmt.setObject(19, pPTNOM2DEC);
		cStmt.setObject(20, pPTAPE1DEC);
		cStmt.setObject(21, pPTAPE2DEC);
		cStmt.setObject(22, pPTTELDEC);
		cStmt.setObject(23, pPTMOVILDEC);
		cStmt.setObject(24, pPTEMAILDEC);
		cStmt.setObject(25, pPTSINIES);
		cStmt.setObject(26, pPCTIPIDE);
		cStmt.setObject(27, pPNNUMIDE);
		cStmt.setObject(28, pPSPERSON_DEC);
		cStmt.setObject(29, pPNSINCIA);
		cStmt.setObject(30, pPCCOMPANI);
		cStmt.setObject(31, pPNPRESIN);
		cStmt.setObject(32, pPCNIVEL);
		cStmt.setObject(33, pPSPERSON2);
		cStmt.setObject(34, pPFECHAPP);
		cStmt.setObject(35, pPCPOLCIA);
		cStmt.setObject(36, pPIPERIT);
		cStmt.setObject(37, pPCFRAUDE);
		cStmt.setObject(38, pPCCARPETA);
		cStmt.setObject(39, pPASISTENCIA);
		cStmt.setObject(40, pPCAGENTE);
		cStmt.setObject(42, pPMODO);
		cStmt.setObject(43, pPCSALVAM);
		cStmt.setObject(44, pPICAPITAL);
		cStmt.setObject(45, pPFDETECCION);
		cStmt.setObject(46, pPSOLIDARIDAD);
		cStmt.setObject(47, pPTDETPRETEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(41, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(41));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO(String pPNSINIES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFSINIES, String pPHSINIES,
			java.sql.Date pPFNOTIFI, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, String pPCEVENTO,
			java.math.BigDecimal pPCCULPAB, java.math.BigDecimal pPCRECLAMA, java.math.BigDecimal pPNASEGUR,
			java.math.BigDecimal pPCMEDDEC, java.math.BigDecimal pPCTIPDEC, String pPTNOMDEC, String pPTNOM1DEC,
			String pPTNOM2DEC, String pPTAPE1DEC, String pPTAPE2DEC, String pPTTELDEC, String pPTMOVILDEC,
			String pPTEMAILDEC, String pPTSINIES, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE,
			java.math.BigDecimal pPSPERSON_DEC, String pPNSINCIA, java.math.BigDecimal pPCCOMPANI, String pPNPRESIN,
			java.math.BigDecimal pPCNIVEL, java.math.BigDecimal pPSPERSON2, java.sql.Date pPFECHAPP, String pPCPOLCIA,
			java.math.BigDecimal pPIPERIT, java.math.BigDecimal pPCFRAUDE, java.math.BigDecimal pPCCARPETA,
			java.math.BigDecimal pPASISTENCIA, java.math.BigDecimal pPCAGENTE, String pPMODO,
			java.math.BigDecimal pPCSALVAM, java.math.BigDecimal pPICAPITAL, java.sql.Date pPFDETECCION,
			java.math.BigDecimal pPSOLIDARIDAD, String pPTDETPRETEN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO(pPNSINIES, pPSSEGURO, pPNRIESGO, pPNMOVIMI,
				pPFSINIES, pPHSINIES, pPFNOTIFI, pPCCAUSIN, pPCMOTSIN, pPCEVENTO, pPCCULPAB, pPCRECLAMA, pPNASEGUR,
				pPCMEDDEC, pPCTIPDEC, pPTNOMDEC, pPTNOM1DEC, pPTNOM2DEC, pPTAPE1DEC, pPTAPE2DEC, pPTTELDEC, pPTMOVILDEC,
				pPTEMAILDEC, pPTSINIES, pPCTIPIDE, pPNNUMIDE, pPSPERSON_DEC, pPNSINCIA, pPCCOMPANI, pPNPRESIN, pPCNIVEL,
				pPSPERSON2, pPFECHAPP, pPCPOLCIA, pPIPERIT, pPCFRAUDE, pPCCARPETA, pPASISTENCIA, pPCAGENTE, pPMODO,
				pPCSALVAM, pPICAPITAL, pPFDETECCION, pPSOLIDARIDAD, pPTDETPRETEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_CABECERA_SINIESTRO

	// bug 0023536
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDETALLE(PSSEGURO, PNSINIES,
	// PNTRAMIT, PCTRAMIT, PCTIPTRA, PDESCTRAMIT, PSPERSON, PCESTPER,
	// PTDESCDIRECCION, PCDOMICI, PCPOSTAL, PCPROVIN, PCPOBLAC, PCPAIS, PCTIPDIR,
	// PCSIGLAS, PTNOMVIA, PNNUMVIA, PTCOMPLE, PCCIUDAD, PFGISX, PFGISY, PFGISZ,
	// PCVALIDA, PCTIPCON, PCTIPCAR, PFCARNET, PCALCOHOL, PCTIPMAT, PCMATRIC,
	// PCMARCA, PCMODELO, PCVERSION, PNANYO, PCCHASIS, PCODMOTOR, PNBASTID,
	// PCCILINDRAJE, PIRECLAM, PIINDEMN)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETALLE(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTRAMIT,
			java.math.BigDecimal pPCTIPTRA, String pPDESCTRAMIT, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCESTPER, String pPTDESCDIRECCION, java.math.BigDecimal pPCDOMICI, String pPCPOSTAL,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, java.math.BigDecimal pPCCIUDAD,
			java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY, java.math.BigDecimal pPFGISZ,
			java.math.BigDecimal pPCVALIDA, java.math.BigDecimal pPCTIPCON, java.math.BigDecimal pPCTIPCAR,
			java.sql.Date pPFCARNET, java.math.BigDecimal pPCALCOHOL, java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPCMARCA, java.math.BigDecimal pPCMODELO, String pPCVERSION,
			java.math.BigDecimal pPNANYO, String pPCCHASIS, String pPCODMOTOR, String pPNBASTID,
			java.math.BigDecimal pPCCILINDRAJE, java.math.BigDecimal pPIRECLAM, java.math.BigDecimal pPIINDEMN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDETALLE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCTRAMIT", "pPCTIPTRA", "pPDESCTRAMIT",
						"pPSPERSON", "pPCESTPER", "pPTDESCDIRECCION", "pPCDOMICI", "pPCPOSTAL", "pPCPROVIN",
						"pPCPOBLAC", "pPCPAIS", "pPCTIPDIR", "pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE",
						"pPCCIUDAD", "pPFGISX", "pPFGISY", "pPFGISZ", "pPCVALIDA", "pPCTIPCON", "pPCTIPCAR",
						"pPFCARNET", "pPCALCOHOL", "pPCTIPMAT", "pPCMATRIC", "pPCMARCA", "pPCMODELO", "pPCVERSION",
						"pPNANYO", "pPCCHASIS", "pPCODMOTOR", "pPNBASTID", "pPCCILINDRAJE", "pPIRECLAM", "pPIINDEMN" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTRAMIT, pPCTIPTRA, pPDESCTRAMIT, pPSPERSON,
						pPCESTPER, pPTDESCDIRECCION, pPCDOMICI, pPCPOSTAL, pPCPROVIN, pPCPOBLAC, pPCPAIS, pPCTIPDIR,
						pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCCIUDAD, pPFGISX, pPFGISY, pPFGISZ, pPCVALIDA,
						pPCTIPCON, pPCTIPCAR, pPFCARNET, pPCALCOHOL, pPCTIPMAT, pPCMATRIC, pPCMARCA, pPCMODELO,
						pPCVERSION, pPNANYO, pPCCHASIS, pPCODMOTOR, pPNBASTID, pPCCILINDRAJE, pPIRECLAM, pPIINDEMN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPCTRAMIT);
		cStmt.setObject(6, pPCTIPTRA);
		cStmt.setObject(7, pPDESCTRAMIT);
		cStmt.setObject(8, pPSPERSON);
		cStmt.setObject(9, pPCESTPER);
		cStmt.setObject(10, pPTDESCDIRECCION);
		cStmt.setObject(11, pPCDOMICI);
		cStmt.setObject(12, pPCPOSTAL);
		cStmt.setObject(13, pPCPROVIN);
		cStmt.setObject(14, pPCPOBLAC);
		cStmt.setObject(15, pPCPAIS);
		cStmt.setObject(16, pPCTIPDIR);
		cStmt.setObject(17, pPCSIGLAS);
		cStmt.setObject(18, pPTNOMVIA);
		cStmt.setObject(19, pPNNUMVIA);
		cStmt.setObject(20, pPTCOMPLE);
		cStmt.setObject(21, pPCCIUDAD);
		cStmt.setObject(22, pPFGISX);
		cStmt.setObject(23, pPFGISY);
		cStmt.setObject(24, pPFGISZ);
		cStmt.setObject(25, pPCVALIDA);
		cStmt.setObject(26, pPCTIPCON);
		cStmt.setObject(27, pPCTIPCAR);
		cStmt.setObject(28, pPFCARNET);
		cStmt.setObject(29, pPCALCOHOL);
		cStmt.setObject(30, pPCTIPMAT);
		cStmt.setObject(31, pPCMATRIC);
		cStmt.setObject(32, pPCMARCA);
		cStmt.setObject(33, pPCMODELO);
		cStmt.setObject(34, pPCVERSION);
		cStmt.setObject(35, pPNANYO);
		cStmt.setObject(36, pPCCHASIS);
		cStmt.setObject(37, pPCODMOTOR);
		cStmt.setObject(38, pPNBASTID);
		cStmt.setObject(39, pPCCILINDRAJE);
		cStmt.setObject(41, pPIRECLAM);
		cStmt.setObject(42, pPIINDEMN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(40, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(40));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETALLE(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTRAMIT,
			java.math.BigDecimal pPCTIPTRA, String pPDESCTRAMIT, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCESTPER, String pPTDESCDIRECCION, java.math.BigDecimal pPCDOMICI, String pPCPOSTAL,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, java.math.BigDecimal pPCCIUDAD,
			java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY, java.math.BigDecimal pPFGISZ,
			java.math.BigDecimal pPCVALIDA, java.math.BigDecimal pPCTIPCON, java.math.BigDecimal pPCTIPCAR,
			java.sql.Date pPFCARNET, java.math.BigDecimal pPCALCOHOL, java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPCMARCA, java.math.BigDecimal pPCMODELO, String pPCVERSION,
			java.math.BigDecimal pPNANYO, String pPCCHASIS, String pPCODMOTOR, String pPNBASTID,
			java.math.BigDecimal pPCCILINDRAJE, java.math.BigDecimal pPIRECLAM, java.math.BigDecimal pPIINDEMN)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETALLE(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCTRAMIT,
				pPCTIPTRA, pPDESCTRAMIT, pPSPERSON, pPCESTPER, pPTDESCDIRECCION, pPCDOMICI, pPCPOSTAL, pPCPROVIN,
				pPCPOBLAC, pPCPAIS, pPCTIPDIR, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCCIUDAD, pPFGISX, pPFGISY,
				pPFGISZ, pPCVALIDA, pPCTIPCON, pPCTIPCAR, pPFCARNET, pPCALCOHOL, pPCTIPMAT, pPCMATRIC, pPCMARCA,
				pPCMODELO, pPCVERSION, pPNANYO, pPCCHASIS, pPCODMOTOR, pPNBASTID, pPCCILINDRAJE, pPIRECLAM, pPIINDEMN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDETALLE

	// bug 0023536
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMITACION(PNSINIES, PNTRAMIT,
	// PCTRAMIT, PCTCAUSIN, PCINFORM, PCTIPTRA, PCCULPAB, PCCOMPANI, PCPOLCIA,
	// PIPERIT, PNSINCIA, PNTRAMTE, PCSUBTIPTRA, PNRADICA)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMITACION(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPCTCAUSIN,
			java.math.BigDecimal pPCINFORM, java.math.BigDecimal pPCTIPTRA, java.math.BigDecimal pPCCULPAB,
			java.math.BigDecimal pPCCOMPANI, String pPCPOLCIA, java.math.BigDecimal pPIPERIT, String pPNSINCIA,
			java.math.BigDecimal pPNTRAMTE, java.math.BigDecimal pPCSUBTIPTRA, String pPNRADICA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMITACION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTRAMIT", "pPCTCAUSIN", "pPCINFORM", "pPCTIPTRA",
						"pPCCULPAB", "pPCCOMPANI", "pPCPOLCIA", "pPIPERIT", "pPNSINCIA", "pPNTRAMTE", "pPCSUBTIPTRA",
						"pPNRADICA" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTRAMIT, pPCTCAUSIN, pPCINFORM, pPCTIPTRA, pPCCULPAB, pPCCOMPANI,
						pPCPOLCIA, pPIPERIT, pPNSINCIA, pPNTRAMTE, pPCSUBTIPTRA, pPNRADICA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTRAMIT);
		cStmt.setObject(5, pPCTCAUSIN);
		cStmt.setObject(6, pPCINFORM);
		cStmt.setObject(7, pPCTIPTRA);
		cStmt.setObject(8, pPCCULPAB);
		cStmt.setObject(9, pPCCOMPANI);
		cStmt.setObject(10, pPCPOLCIA);
		cStmt.setObject(11, pPIPERIT);
		cStmt.setObject(12, pPNSINCIA);
		cStmt.setObject(13, pPNTRAMTE);
		cStmt.setObject(14, pPCSUBTIPTRA);
		cStmt.setObject(15, pPNRADICA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de "PNTRAMITOUT"
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
			retVal.put("PNTRAMITOUT", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("PNTRAMITOUT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMITACION(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPCTCAUSIN,
			java.math.BigDecimal pPCINFORM, java.math.BigDecimal pPCTIPTRA, java.math.BigDecimal pPCCULPAB,
			java.math.BigDecimal pPCCOMPANI, String pPCPOLCIA, java.math.BigDecimal pPIPERIT, String pPNSINCIA,
			java.math.BigDecimal pPNTRAMTE, java.math.BigDecimal pPCSUBTIPTRA, String pPNRADICA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMITACION(pPNSINIES, pPNTRAMIT, pPCTRAMIT, pPCTCAUSIN,
				pPCINFORM, pPCTIPTRA, pPCCULPAB, pPCCOMPANI, pPCPOLCIA, pPIPERIT, pPNSINCIA, pPNTRAMTE, pPCSUBTIPTRA,
				pPNRADICA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMITACION

	// --START-PAC_IAX_SINIESTROS.F_GET_HISSIN_SINIESTROS(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_HISSIN_SINIESTROS(java.math.BigDecimal pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_HISSIN_SINIESTROS(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_HISSIN_SINIESTROS(java.math.BigDecimal pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_HISSIN_SINIESTROS(pPNSINIES);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_HISSIN_SINIESTROS

	private HashMap callPAC_IAX_SINIESTROS__F_CREAR_PRESINIESTRO() throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_CREAR_PRESINIESTRO(?)}";

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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_CREAR_PRESINIESTRO() throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_CREAR_PRESINIESTRO();
	}

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINREFERENCIAS(PNSINIES, PSREFEXT,
	// PCTIPREF, PTREFEXT, PFREFINI, PFREFFIN)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINREFERENCIAS(String pPNSINIES,
			java.math.BigDecimal pPSREFEXT, java.math.BigDecimal pPCTIPREF, String pPTREFEXT, java.sql.Date pPFREFINI,
			java.sql.Date pPFREFFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINREFERENCIAS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPSREFEXT", "pPCTIPREF", "pPTREFEXT", "pPFREFINI", "pPFREFFIN" },
				new Object[] { pPNSINIES, pPSREFEXT, pPCTIPREF, pPTREFEXT, pPFREFINI, pPFREFFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPSREFEXT);
		cStmt.setObject(4, pPCTIPREF);
		cStmt.setObject(5, pPTREFEXT);
		cStmt.setObject(6, pPFREFINI);
		cStmt.setObject(7, pPFREFFIN);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINREFERENCIAS(String pPNSINIES,
			java.math.BigDecimal pPSREFEXT, java.math.BigDecimal pPCTIPREF, String pPTREFEXT, java.sql.Date pPFREFINI,
			java.sql.Date pPFREFFIN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINREFERENCIAS(pPNSINIES, pPSREFEXT, pPCTIPREF, pPTREFEXT,
				pPFREFINI, pPFREFFIN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINREFERENCIAS
	// --START-PAC_IAX_SINIESTROS.F_DELETE_SINREFERENCIAS(PSREFEXT)
	private HashMap callPAC_IAX_SINIESTROS__F_DELETE_SINREFERENCIAS(java.math.BigDecimal pPSREFEXT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DELETE_SINREFERENCIAS(?, ?)}";

		logCall(callQuery, new String[] { "pPSREFEXT" }, new Object[] { pPSREFEXT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSREFEXT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DELETE_SINREFERENCIAS(java.math.BigDecimal pPSREFEXT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DELETE_SINREFERENCIAS(pPSREFEXT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_DELETE_SINREFERENCIAS

	/*
	 * *****************************************************************************
	 * *************************
	 */

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_MOVPAGRECOB(PNTRAMIT, PSIDEPAG,
	// PNMOVPAG, PCESTPAG, PFEFEPAG, PCESTVAL, PFCONTAB, PCTIPPAG, PCESTPAGANT,
	// PCSUBPAG, PCSUBPAGANT)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_MOVPAGRECOB(java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPNMOVPAG, java.math.BigDecimal pPCESTPAG,
			java.sql.Date pPFEFEPAG, java.math.BigDecimal pPCESTVAL, java.sql.Date pPFCONTAB,
			java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCESTPAGANT, java.math.BigDecimal pPCSUBPAG,
			java.math.BigDecimal pPCSUBPAGANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_MOVPAGRECOB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNTRAMIT", "pPSIDEPAG", "pPNMOVPAG", "pPCESTPAG", "pPFEFEPAG", "pPCESTVAL",
						"pPFCONTAB", "pPCTIPPAG", "pPCESTPAGANT", "pPCSUBPAG", "pPCSUBPAGANT" },
				new Object[] { pPNTRAMIT, pPSIDEPAG, pPNMOVPAG, pPCESTPAG, pPFEFEPAG, pPCESTVAL, pPFCONTAB, pPCTIPPAG,
						pPCESTPAGANT, pPCSUBPAG, pPCSUBPAGANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNTRAMIT);
		cStmt.setObject(3, pPSIDEPAG);
		cStmt.setObject(4, pPNMOVPAG);
		cStmt.setObject(5, pPCESTPAG);
		cStmt.setObject(6, pPFEFEPAG);
		cStmt.setObject(7, pPCESTVAL);
		cStmt.setObject(8, pPFCONTAB);
		cStmt.setObject(9, pPCTIPPAG);
		cStmt.setObject(10, pPCESTPAGANT);
		cStmt.setObject(11, pPCSUBPAG);
		cStmt.setObject(12, pPCSUBPAGANT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_MOVPAGRECOB(java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPNMOVPAG, java.math.BigDecimal pPCESTPAG,
			java.sql.Date pPFEFEPAG, java.math.BigDecimal pPCESTVAL, java.sql.Date pPFCONTAB,
			java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCESTPAGANT, java.math.BigDecimal pPCSUBPAG,
			java.math.BigDecimal pPCSUBPAGANT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_MOVPAGRECOB(pPNTRAMIT, pPSIDEPAG, pPNMOVPAG, pPCESTPAG,
				pPFEFEPAG, pPCESTVAL, pPFCONTAB, pPCTIPPAG, pPCESTPAGANT, pPCSUBPAG, pPCSUBPAGANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_SINTRAM_MOVPAGRECOB

	// --START-PAC_IAX_SINIESTROS.F_SET_SINTRAM_PAGRECOB_GAR2(PSSEGURO, PNTRAMIT,
	// PCTIPPAG, PSIDEPAG, PCTIPRES, PCTIPGAS, PNMOVRES, PCGARANT, PFPERINI,
	// PFPERFIN, PCMONRES, PISINRET, PIIVA, PISUPLID, PIRETENC, PIFRANQ, PCMONPAG,
	// PISINRETPAG, PIIVAPAG, PISUPLIDPAG, PIRETENCPAG, PIFRANQPAG, PFCAMBIO,
	// PIRESRED, PIRESRCM, PPIVA, PPRETENC, PCCONPAG, PNORDEN, PPRETEIVA, PPRETEICA,
	// PIRETEIVA, PIRETEICA, PIRETEIVAPAG, PIRETEICAPAG, PPICA, PIICA, PIICAPAG,
	// PCIVA_TIPIND, PCRETENC_TIPIND, PCRETEIVA_TIPIND, PCRETEICA_TIPIND, PITOTIMP,
	// PITOTRET)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_SINTRAM_PAGRECOB_GAR2(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN, String pPCMONRES,
			java.math.BigDecimal pPISINRET, java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
			java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String pPCMONPAG,
			java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG, java.math.BigDecimal pPISUPLIDPAG,
			java.math.BigDecimal pPIRETENCPAG, java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
			java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM, java.math.BigDecimal pPPIVA,
			java.math.BigDecimal pPPRETENC, java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPPRETEIVA, java.math.BigDecimal pPPRETEICA, java.math.BigDecimal pPIRETEIVA,
			java.math.BigDecimal pPIRETEICA, java.math.BigDecimal pPIRETEIVAPAG, java.math.BigDecimal pPIRETEICAPAG,
			java.math.BigDecimal pPPICA, java.math.BigDecimal pPIICA, java.math.BigDecimal pPIICAPAG,
			java.math.BigDecimal pPCIVA_TIPIND, java.math.BigDecimal pPCRETENC_TIPIND,
			java.math.BigDecimal pPCRETEIVA_TIPIND, java.math.BigDecimal pPCRETEICA_TIPIND,
			java.math.BigDecimal pPITOTIMP, java.math.BigDecimal pPITOTRET) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_SINTRAM_PAGRECOB_GAR2(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNTRAMIT", "pPCTIPPAG", "pPSIDEPAG", "pPCTIPRES", "pPCTIPGAS",
						"pPNMOVRES", "pPCGARANT", "pPFPERINI", "pPFPERFIN", "pPCMONRES", "pPISINRET", "pPIIVA",
						"pPISUPLID", "pPIRETENC", "pPIFRANQ", "pPCMONPAG", "pPISINRETPAG", "pPIIVAPAG", "pPISUPLIDPAG",
						"pPIRETENCPAG", "pPIFRANQPAG", "pPFCAMBIO", "pPIRESRED", "pPIRESRCM", "pPPIVA", "pPPRETENC",
						"pPCCONPAG", "pPNORDEN", "pPPRETEIVA", "pPPRETEICA", "pPIRETEIVA", "pPIRETEICA",
						"pPIRETEIVAPAG", "pPIRETEICAPAG", "pPPICA", "pPIICA", "pPIICAPAG", "pPCIVA_TIPIND",
						"pPCRETENC_TIPIND", "pPCRETEIVA_TIPIND", "pPCRETEICA_TIPIND", "pPITOTIMP", "pPITOTRET" },
				new Object[] { pPSSEGURO, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG, pPCTIPRES, pPCTIPGAS, pPNMOVRES, pPCGARANT,
						pPFPERINI, pPFPERFIN, pPCMONRES, pPISINRET, pPIIVA, pPISUPLID, pPIRETENC, pPIFRANQ, pPCMONPAG,
						pPISINRETPAG, pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG, pPIFRANQPAG, pPFCAMBIO, pPIRESRED,
						pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN, pPPRETEIVA, pPPRETEICA, pPIRETEIVA,
						pPIRETEICA, pPIRETEIVAPAG, pPIRETEICAPAG, pPPICA, pPIICA, pPIICAPAG, pPCIVA_TIPIND,
						pPCRETENC_TIPIND, pPCRETEIVA_TIPIND, pPCRETEICA_TIPIND, pPITOTIMP, pPITOTRET });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPPAG);
		cStmt.setObject(5, pPSIDEPAG);
		cStmt.setObject(6, pPCTIPRES);
		cStmt.setObject(7, pPCTIPGAS);
		cStmt.setObject(8, pPNMOVRES);
		cStmt.setObject(9, pPCGARANT);
		cStmt.setObject(10, pPFPERINI);
		cStmt.setObject(11, pPFPERFIN);
		cStmt.setObject(12, pPCMONRES);
		cStmt.setObject(13, pPISINRET);
		cStmt.setObject(14, pPIIVA);
		cStmt.setObject(15, pPISUPLID);
		cStmt.setObject(16, pPIRETENC);
		cStmt.setObject(17, pPIFRANQ);
		cStmt.setObject(18, pPCMONPAG);
		cStmt.setObject(19, pPISINRETPAG);
		cStmt.setObject(20, pPIIVAPAG);
		cStmt.setObject(21, pPISUPLIDPAG);
		cStmt.setObject(22, pPIRETENCPAG);
		cStmt.setObject(23, pPIFRANQPAG);
		cStmt.setObject(24, pPFCAMBIO);
		cStmt.setObject(25, pPIRESRED);
		cStmt.setObject(26, pPIRESRCM);
		cStmt.setObject(27, pPPIVA);
		cStmt.setObject(28, pPPRETENC);
		cStmt.setObject(29, pPCCONPAG);
		cStmt.setObject(30, pPNORDEN);
		cStmt.setObject(32, pPPRETEIVA);
		cStmt.setObject(33, pPPRETEICA);
		cStmt.setObject(34, pPIRETEIVA);
		cStmt.setObject(35, pPIRETEICA);
		cStmt.setObject(36, pPIRETEIVAPAG);
		cStmt.setObject(37, pPIRETEICAPAG);
		cStmt.setObject(38, pPPICA);
		cStmt.setObject(39, pPIICA);
		cStmt.setObject(40, pPIICAPAG);
		cStmt.setObject(41, pPCIVA_TIPIND);
		cStmt.setObject(42, pPCRETENC_TIPIND);
		cStmt.setObject(43, pPCRETEIVA_TIPIND);
		cStmt.setObject(44, pPCRETEICA_TIPIND);
		cStmt.setObject(45, pPITOTIMP);
		cStmt.setObject(46, pPITOTRET);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(31));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAM_PAGRECOB_GAR2(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS, java.math.BigDecimal pPNMOVRES,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN, String pPCMONRES,
			java.math.BigDecimal pPISINRET, java.math.BigDecimal pPIIVA, java.math.BigDecimal pPISUPLID,
			java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIFRANQ, String pPCMONPAG,
			java.math.BigDecimal pPISINRETPAG, java.math.BigDecimal pPIIVAPAG, java.math.BigDecimal pPISUPLIDPAG,
			java.math.BigDecimal pPIRETENCPAG, java.math.BigDecimal pPIFRANQPAG, java.sql.Date pPFCAMBIO,
			java.math.BigDecimal pPIRESRED, java.math.BigDecimal pPIRESRCM, java.math.BigDecimal pPPIVA,
			java.math.BigDecimal pPPRETENC, java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPPRETEIVA, java.math.BigDecimal pPPRETEICA, java.math.BigDecimal pPIRETEIVA,
			java.math.BigDecimal pPIRETEICA, java.math.BigDecimal pPIRETEIVAPAG, java.math.BigDecimal pPIRETEICAPAG,
			java.math.BigDecimal pPPICA, java.math.BigDecimal pPIICA, java.math.BigDecimal pPIICAPAG,
			java.math.BigDecimal pPCIVA_TIPIND, java.math.BigDecimal pPCRETENC_TIPIND,
			java.math.BigDecimal pPCRETEIVA_TIPIND, java.math.BigDecimal pPCRETEICA_TIPIND,
			java.math.BigDecimal pPITOTIMP, java.math.BigDecimal pPITOTRET) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_SINTRAM_PAGRECOB_GAR2(pPSSEGURO, pPNTRAMIT, pPCTIPPAG, pPSIDEPAG,
				pPCTIPRES, pPCTIPGAS, pPNMOVRES, pPCGARANT, pPFPERINI, pPFPERFIN, pPCMONRES, pPISINRET, pPIIVA,
				pPISUPLID, pPIRETENC, pPIFRANQ, pPCMONPAG, pPISINRETPAG, pPIIVAPAG, pPISUPLIDPAG, pPIRETENCPAG,
				pPIFRANQPAG, pPFCAMBIO, pPIRESRED, pPIRESRCM, pPPIVA, pPPRETENC, pPCCONPAG, pPNORDEN, pPPRETEIVA,
				pPPRETEICA, pPIRETEIVA, pPIRETEICA, pPIRETEIVAPAG, pPIRETEICAPAG, pPPICA, pPIICA, pPIICAPAG,
				pPCIVA_TIPIND, pPCRETENC_TIPIND, pPCRETEIVA_TIPIND, pPCRETEICA_TIPIND, pPITOTIMP, pPITOTRET);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_SINTRAM_PAGRECOB_GAR2

	/*
	 * *****************************************************************************
	 * *************************
	 */
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIJUZGADO(PNSINIES, PNTRAMIT,
	// PNLINJUZ, PCORGJUD, PNORGJUD, PTREFJUD, PCSIGLAS, PTNOMVIA, PNNUMVIA,
	// PTCOMPLE, PTDIREC, PCPAIS, PCPROVIN, PCPOBLAC, PCPOSTAL, PTASUNTO, PNCLASEDE,
	// PNTIPOPRO, PNPROCEDI, PFNOTIASE, PFRECPDEM, PFNOTICIA, PFCONTASE, PFCONTCIA,
	// PFAUDPREV, PFJUICIO, PCMONJUZ, PCPLEITO, PIPLEITO, PIALLANA, PISENTENC,
	// PISENTCAP, PISENTIND, PISENTCOS, PISENTINT, PISENTOTR, PCARGUDEF, PCRESPLEI,
	// PCAPELANT, PTHIPOASE, PTHIPOTER, PTTIPRESP, PCOPERCOB, PTREASMED, PCESTPROC,
	// PCETAPROC, PTCONCJUR, PTESTRDEF, PTRECOMEN, PTOBSERV, PFCANCEL)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIJUZGADO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINJUZ, java.math.BigDecimal pPCORGJUD,
			String pPNORGJUD, String pPTREFJUD, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPTDIREC, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, String pPTASUNTO,
			java.math.BigDecimal pPNCLASEDE, java.math.BigDecimal pPNTIPOPRO, String pPNPROCEDI,
			java.sql.Date pPFNOTIASE, java.sql.Date pPFRECPDEM, java.sql.Date pPFNOTICIA, java.sql.Date pPFCONTASE,
			java.sql.Date pPFCONTCIA, java.sql.Date pPFAUDPREV, java.sql.Date pPFJUICIO, String pPCMONJUZ,
			java.math.BigDecimal pPCPLEITO, java.math.BigDecimal pPIPLEITO, java.math.BigDecimal pPIALLANA,
			java.math.BigDecimal pPISENTENC, java.math.BigDecimal pPISENTCAP, java.math.BigDecimal pPISENTIND,
			java.math.BigDecimal pPISENTCOS, java.math.BigDecimal pPISENTINT, java.math.BigDecimal pPISENTOTR,
			java.math.BigDecimal pPCARGUDEF, java.math.BigDecimal pPCRESPLEI, java.math.BigDecimal pPCAPELANT,
			String pPTHIPOASE, String pPTHIPOTER, String pPTTIPRESP, java.math.BigDecimal pPCOPERCOB, String pPTREASMED,
			java.math.BigDecimal pPCESTPROC, java.math.BigDecimal pPCETAPROC, String pPTCONCJUR, String pPTESTRDEF,
			String pPTRECOMEN, String pPTOBSERV, java.sql.Date pPFCANCEL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIJUZGADO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINJUZ", "pPCORGJUD", "pPNORGJUD", "pPTREFJUD",
						"pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPTDIREC", "pPCPAIS", "pPCPROVIN",
						"pPCPOBLAC", "pPCPOSTAL", "pPTASUNTO", "pPNCLASEDE", "pPNTIPOPRO", "pPNPROCEDI", "pPFNOTIASE",
						"pPFRECPDEM", "pPFNOTICIA", "pPFCONTASE", "pPFCONTCIA", "pPFAUDPREV", "pPFJUICIO", "pPCMONJUZ",
						"pPCPLEITO", "pPIPLEITO", "pPIALLANA", "pPISENTENC", "pPISENTCAP", "pPISENTIND", "pPISENTCOS",
						"pPISENTINT", "pPISENTOTR", "pPCARGUDEF", "pPCRESPLEI", "pPCAPELANT", "pPTHIPOASE",
						"pPTHIPOTER", "pPTTIPRESP", "pPCOPERCOB", "pPTREASMED", "pPCESTPROC", "pPCETAPROC",
						"pPTCONCJUR", "pPTESTRDEF", "pPTRECOMEN", "pPTOBSERV", "pPFCANCEL" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINJUZ, pPCORGJUD, pPNORGJUD, pPTREFJUD, pPCSIGLAS, pPTNOMVIA,
						pPNNUMVIA, pPTCOMPLE, pPTDIREC, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL, pPTASUNTO, pPNCLASEDE,
						pPNTIPOPRO, pPNPROCEDI, pPFNOTIASE, pPFRECPDEM, pPFNOTICIA, pPFCONTASE, pPFCONTCIA, pPFAUDPREV,
						pPFJUICIO, pPCMONJUZ, pPCPLEITO, pPIPLEITO, pPIALLANA, pPISENTENC, pPISENTCAP, pPISENTIND,
						pPISENTCOS, pPISENTINT, pPISENTOTR, pPCARGUDEF, pPCRESPLEI, pPCAPELANT, pPTHIPOASE, pPTHIPOTER,
						pPTTIPRESP, pPCOPERCOB, pPTREASMED, pPCESTPROC, pPCETAPROC, pPTCONCJUR, pPTESTRDEF, pPTRECOMEN,
						pPTOBSERV, pPFCANCEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINJUZ);
		cStmt.setObject(5, pPCORGJUD);
		cStmt.setObject(6, pPNORGJUD);
		cStmt.setObject(7, pPTREFJUD);
		cStmt.setObject(8, pPCSIGLAS);
		cStmt.setObject(9, pPTNOMVIA);
		cStmt.setObject(10, pPNNUMVIA);
		cStmt.setObject(11, pPTCOMPLE);
		cStmt.setObject(12, pPTDIREC);
		cStmt.setObject(13, pPCPAIS);
		cStmt.setObject(14, pPCPROVIN);
		cStmt.setObject(15, pPCPOBLAC);
		cStmt.setObject(16, pPCPOSTAL);
		cStmt.setObject(17, pPTASUNTO);
		cStmt.setObject(18, pPNCLASEDE);
		cStmt.setObject(19, pPNTIPOPRO);
		cStmt.setObject(20, pPNPROCEDI);
		cStmt.setObject(21, pPFNOTIASE);
		cStmt.setObject(22, pPFRECPDEM);
		cStmt.setObject(23, pPFNOTICIA);
		cStmt.setObject(24, pPFCONTASE);
		cStmt.setObject(25, pPFCONTCIA);
		cStmt.setObject(26, pPFAUDPREV);
		cStmt.setObject(27, pPFJUICIO);
		cStmt.setObject(28, pPCMONJUZ);
		cStmt.setObject(29, pPCPLEITO);
		cStmt.setObject(30, pPIPLEITO);
		cStmt.setObject(31, pPIALLANA);
		cStmt.setObject(32, pPISENTENC);
		cStmt.setObject(33, pPISENTCAP);
		cStmt.setObject(34, pPISENTIND);
		cStmt.setObject(35, pPISENTCOS);
		cStmt.setObject(36, pPISENTINT);
		cStmt.setObject(37, pPISENTOTR);
		cStmt.setObject(38, pPCARGUDEF);
		cStmt.setObject(39, pPCRESPLEI);
		cStmt.setObject(40, pPCAPELANT);
		cStmt.setObject(41, pPTHIPOASE);
		cStmt.setObject(42, pPTHIPOTER);
		cStmt.setObject(43, pPTTIPRESP);
		cStmt.setObject(44, pPCOPERCOB);
		cStmt.setObject(45, pPTREASMED);
		cStmt.setObject(46, pPCESTPROC);
		cStmt.setObject(47, pPCETAPROC);
		cStmt.setObject(48, pPTCONCJUR);
		cStmt.setObject(49, pPTESTRDEF);
		cStmt.setObject(50, pPTRECOMEN);
		cStmt.setObject(51, pPTOBSERV);
		cStmt.setObject(52, pPFCANCEL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(53, java.sql.Types.NUMERIC); // Valor de "PNLINJUZ_OUT"
		cStmt.registerOutParameter(54, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PNLINJUZ_OUT", cStmt.getObject(53));
		} catch (SQLException e) {
			retVal.put("PNLINJUZ_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(54));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIJUZGADO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINJUZ, java.math.BigDecimal pPCORGJUD,
			String pPNORGJUD, String pPTREFJUD, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPTDIREC, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, String pPTASUNTO,
			java.math.BigDecimal pPNCLASEDE, java.math.BigDecimal pPNTIPOPRO, String pPNPROCEDI,
			java.sql.Date pPFNOTIASE, java.sql.Date pPFRECPDEM, java.sql.Date pPFNOTICIA, java.sql.Date pPFCONTASE,
			java.sql.Date pPFCONTCIA, java.sql.Date pPFAUDPREV, java.sql.Date pPFJUICIO, String pPCMONJUZ,
			java.math.BigDecimal pPCPLEITO, java.math.BigDecimal pPIPLEITO, java.math.BigDecimal pPIALLANA,
			java.math.BigDecimal pPISENTENC, java.math.BigDecimal pPISENTCAP, java.math.BigDecimal pPISENTIND,
			java.math.BigDecimal pPISENTCOS, java.math.BigDecimal pPISENTINT, java.math.BigDecimal pPISENTOTR,
			java.math.BigDecimal pPCARGUDEF, java.math.BigDecimal pPCRESPLEI, java.math.BigDecimal pPCAPELANT,
			String pPTHIPOASE, String pPTHIPOTER, String pPTTIPRESP, java.math.BigDecimal pPCOPERCOB, String pPTREASMED,
			java.math.BigDecimal pPCESTPROC, java.math.BigDecimal pPCETAPROC, String pPTCONCJUR, String pPTESTRDEF,
			String pPTRECOMEN, String pPTOBSERV, java.sql.Date pPFCANCEL) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIJUZGADO(pPNSINIES, pPNTRAMIT, pPNLINJUZ, pPCORGJUD,
				pPNORGJUD, pPTREFJUD, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPTDIREC, pPCPAIS, pPCPROVIN,
				pPCPOBLAC, pPCPOSTAL, pPTASUNTO, pPNCLASEDE, pPNTIPOPRO, pPNPROCEDI, pPFNOTIASE, pPFRECPDEM, pPFNOTICIA,
				pPFCONTASE, pPFCONTCIA, pPFAUDPREV, pPFJUICIO, pPCMONJUZ, pPCPLEITO, pPIPLEITO, pPIALLANA, pPISENTENC,
				pPISENTCAP, pPISENTIND, pPISENTCOS, pPISENTINT, pPISENTOTR, pPCARGUDEF, pPCRESPLEI, pPCAPELANT,
				pPTHIPOASE, pPTHIPOTER, pPTTIPRESP, pPCOPERCOB, pPTREASMED, pPCESTPROC, pPCETAPROC, pPTCONCJUR,
				pPTESTRDEF, pPTRECOMEN, pPTOBSERV, pPFCANCEL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIJUZGADO
	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIJUZGADO(PNSINIES, PNTRAMIT,
	// PNLINJUZ)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIJUZGADO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINJUZ) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIJUZGADO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINJUZ" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINJUZ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINJUZ);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMITA_JUZGADO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIJUZGADO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINJUZ) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIJUZGADO(pPNSINIES, pPNTRAMIT, pPNLINJUZ);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIJUZGADO

	// --START-PAC_IAX_SINIESTROS.F_GET_RESERVA_MULTIPLE(PNSINIES, PNTRAMIT,
	// PCTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_RESERVA_MULTIPLE(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_RESERVA_MULTIPLE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTRAMIT" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTRAMIT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMI_RESERVA_MULT".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_RESERVA_MULTIPLE(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_RESERVA_MULTIPLE(pPNSINIES, pPNTRAMIT, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_RESERVA_MULTIPLE

	// --START-PAC_IAX_SINIESTROS.F_UPDATE_PRESINIESTROS(PCMODO)
	private HashMap callPAC_IAX_SINIESTROS__F_UPDATE_PRESINIESTROS(String pPCMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_UPDATE_PRESINIESTROS(?, ?)}";

		logCall(callQuery, new String[] { "pPCMODO" }, new Object[] { pPCMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_UPDATE_PRESINIESTROS(String pPCMODO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_UPDATE_PRESINIESTROS(pPCMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_UPDATE_PRESINIESTROS

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDEMAND(PNSINIES, PNTRAMIT,
	// PNLINDEM, PNTIPODEM)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDEMAND(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINDEM, java.math.BigDecimal pPNTIPODEM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDEMAND(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINDEM", "pPNTIPODEM" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINDEM, pPNTIPODEM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINDEM);
		cStmt.setObject(5, pPNTIPODEM);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMITA_DEMAND".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDEMAND(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINDEM, java.math.BigDecimal pPNTIPODEM)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDEMAND(pPNSINIES, pPNTRAMIT, pPNLINDEM, pPNTIPODEM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_SINTRAMIDEMAND

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDEMAND(PNSINIES, PNTRAMIT,
	// PNLINDEM, PSPERSON, PNTIPODEM, PTTRAMITA, PSPERSON2, PNPROCEDI, PTCOMPANI)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDEMAND(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINDEM, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPNTIPODEM, String pPTTRAMITA, java.math.BigDecimal pPSPERSON2, String pPNPROCEDI,
			String pPTCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDEMAND(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINDEM", "pPSPERSON", "pPNTIPODEM", "pPTTRAMITA",
						"pPSPERSON2", "pPNPROCEDI", "pPTCOMPANI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINDEM, pPSPERSON, pPNTIPODEM, pPTTRAMITA, pPSPERSON2,
						pPNPROCEDI, pPTCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINDEM);
		cStmt.setObject(5, pPSPERSON);
		cStmt.setObject(6, pPNTIPODEM);
		cStmt.setObject(7, pPTTRAMITA);
		cStmt.setObject(8, pPSPERSON2);
		cStmt.setObject(9, pPNPROCEDI);
		cStmt.setObject(10, pPTCOMPANI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "PNLINDEM_OUT"
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
			retVal.put("PNLINDEM_OUT", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PNLINDEM_OUT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDEMAND(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLINDEM, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPNTIPODEM, String pPTTRAMITA, java.math.BigDecimal pPSPERSON2, String pPNPROCEDI,
			String pPTCOMPANI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDEMAND(pPNSINIES, pPNTRAMIT, pPNLINDEM, pPSPERSON,
				pPNTIPODEM, pPTTRAMITA, pPSPERSON2, pPNPROCEDI, pPTCOMPANI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMIDEMAND

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_DEFRAUDADOR(PNSINIES, PNDEFRAU)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_DEFRAUDADOR(String pPNSINIES, java.math.BigDecimal pPNDEFRAU)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_DEFRAUDADOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNDEFRAU" }, new Object[] { pPNSINIES, pPNDEFRAU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNDEFRAU);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DEFRAUDADORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_DEFRAUDADOR(String pPNSINIES, java.math.BigDecimal pPNDEFRAU)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_DEFRAUDADOR(pPNSINIES, pPNDEFRAU);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_DEFRAUDADOR

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_DEFRAUDADORES(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_DEFRAUDADORES(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_DEFRAUDADORES(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DEFRAUDADORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_DEFRAUDADORES(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_DEFRAUDADORES(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_DEFRAUDADORES

	// --START-PAC_IAX_SINIESTROS.F_DEL_OBJETO_DEFRAUDADOR(PNSINIES, PNDEFRAU)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_OBJETO_DEFRAUDADOR(String pPNSINIES, java.math.BigDecimal pPNDEFRAU)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_OBJETO_DEFRAUDADOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNDEFRAU" }, new Object[] { pPNSINIES, pPNDEFRAU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNDEFRAU);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_DEFRAUDADOR(String pPNSINIES, java.math.BigDecimal pPNDEFRAU)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_OBJETO_DEFRAUDADOR(pPNSINIES, pPNDEFRAU);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_DEL_OBJETO_DEFRAUDADOR
	// --START-PAC_IAX_SINIESTROS.F_GET_PERSONAS_DEFRAUDADORES(PSSEGURO, PNSINIES,
	// PNTIPODEFRAUDADOR)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_PERSONAS_DEFRAUDADORES(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTIPODEFRAUDADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_PERSONAS_DEFRAUDADORES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSINIES", "pPNTIPODEFRAUDADOR" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTIPODEFRAUDADOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTIPODEFRAUDADOR);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_PERSONAS_DEFRAUDADORES(java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTIPODEFRAUDADOR) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_PERSONAS_DEFRAUDADORES(pPSSEGURO, pPNSINIES, pPNTIPODEFRAUDADOR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_PERSONAS_DEFRAUDADORES
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_DEFRAUDADOR(PNSINIES, PNDEFRAU,
	// PSPERSON, PCTIPROL, PFINIEFE, PFFINEFE)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_DEFRAUDADOR(String pPNSINIES, java.math.BigDecimal pPNDEFRAU,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPROL, java.sql.Date pPFINIEFE,
			java.sql.Date pPFFINEFE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_DEFRAUDADOR(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNDEFRAU", "pPSPERSON", "pPCTIPROL", "pPFINIEFE", "pPFFINEFE" },
				new Object[] { pPNSINIES, pPNDEFRAU, pPSPERSON, pPCTIPROL, pPFINIEFE, pPFFINEFE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNDEFRAU);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPCTIPROL);
		cStmt.setObject(6, pPFINIEFE);
		cStmt.setObject(7, pPFFINEFE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PNDEFRAU_OUT"
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
			retVal.put("PNDEFRAU_OUT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PNDEFRAU_OUT", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_DEFRAUDADOR(String pPNSINIES, java.math.BigDecimal pPNDEFRAU,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPROL, java.sql.Date pPFINIEFE,
			java.sql.Date pPFFINEFE) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_DEFRAUDADOR(pPNSINIES, pPNDEFRAU, pPSPERSON, pPCTIPROL,
				pPFINIEFE, pPFFINEFE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_DEFRAUDADOR

	// bug 0022099 (2)
	// --START-PAC_IAX_SINIESTROS.F_GET_TRAMITADOR(PNSINIES, PNTRAMTE, PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_TRAMITADOR(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_TRAMITADOR(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMTE", "pPNTRAMIT" },
				new Object[] { pPNSINIES, pPNTRAMTE, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMTE);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PCUNITRA"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PCTRAMITAD"
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
			retVal.put("PCUNITRA", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCUNITRA", null);
		}
		try {
			retVal.put("PCTRAMITAD", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCTRAMITAD", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITADOR(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_TRAMITADOR(pPNSINIES, pPNTRAMTE, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_TRAMITADOR

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINMOVTRAMTE(PNSINIES, PNTRAMTE,
	// PNMOVTTE, PCUNITRA, PCTRAMITAD, PCESTTTE, PFESTTRA, PCCAUEST)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMTE(String pPNSINIES, java.math.BigDecimal pPNTRAMTE,
			java.math.BigDecimal pPNMOVTTE, String pPCUNITRA, String pPCTRAMITAD, java.math.BigDecimal pPCESTTTE,
			java.sql.Date pPFESTTRA, java.math.BigDecimal pPCCAUEST) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINMOVTRAMTE(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMTE", "pPNMOVTTE", "pPCUNITRA", "pPCTRAMITAD", "pPCESTTTE",
						"pPFESTTRA", "pPCCAUEST" },
				new Object[] { pPNSINIES, pPNTRAMTE, pPNMOVTTE, pPCUNITRA, pPCTRAMITAD, pPCESTTTE, pPFESTTRA,
						pPCCAUEST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMTE);
		cStmt.setObject(4, pPNMOVTTE);
		cStmt.setObject(5, pPCUNITRA);
		cStmt.setObject(6, pPCTRAMITAD);
		cStmt.setObject(7, pPCESTTTE);
		cStmt.setObject(8, pPFESTTRA);
		cStmt.setObject(9, pPCCAUEST);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMTE(String pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, java.math.BigDecimal pPNMOVTTE, String pPCUNITRA, String pPCTRAMITAD,
			java.math.BigDecimal pPCESTTTE, java.sql.Date pPFESTTRA, java.math.BigDecimal pPCCAUEST) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMTE(pPNSINIES, pPNTRAMTE, pPNMOVTTE, pPCUNITRA,
				pPCTRAMITAD, pPCESTTTE, pPFESTTRA, pPCCAUEST);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINMOVTRAMTE

	// bug 0022674
	// --START-PAC_IAX_SINIESTROS.F_POST_SINIESTRO(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_POST_SINIESTRO(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_POST_SINIESTRO(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_POST_SINIESTRO(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_POST_SINIESTRO(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_POST_SINIESTRO

	// ini bug 0022153
	// --START-PAC_IAX_SINIESTROS.F_GET_SINTRADOC(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_SINTRADOC(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_SINTRADOC(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMI_DOCUMENTO".toUpperCase())); // Valor de "T_DOCUME"
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
			retVal.put("T_DOCUME", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("T_DOCUME", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_SINTRADOC(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_SINTRADOC(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_SINTRADOC
	// fin bug 0022153
	// --START-PAC_IAX_SINIESTROS.F_HAY_ASISTENCIA(PSSEGURO, PNRIESGO, PCCAUSIN,
	// PCMOTSIN, PFSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_HAY_ASISTENCIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN,
			java.sql.Date pPFSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_HAY_ASISTENCIA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCCAUSIN", "pPCMOTSIN", "pPFSINIES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCCAUSIN, pPCMOTSIN, pPFSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCCAUSIN);
		cStmt.setObject(5, pPCMOTSIN);
		cStmt.setObject(6, pPFSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PHAY_ASISTENCIA"
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
			retVal.put("PHAY_ASISTENCIA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PHAY_ASISTENCIA", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_HAY_ASISTENCIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN,
			java.sql.Date pPFSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_HAY_ASISTENCIA(pPSSEGURO, pPNRIESGO, pPCCAUSIN, pPCMOTSIN, pPFSINIES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_HAY_ASISTENCIA
	// Inicio IAXIS-2169 AABC Adicion campo Fecha de apertura
	// --START-PAC_IAX_SINIESTROS.F_CONSULTASINI2(PCRAMO, PSPRODUC, PNPOLIZA,
	// PNCERTIF, PNSINIES, PCESTSIN, PNNUMIDE, PSNIP, PBUSCAR, PTIPOPERS, PNSUBEST,
	// PNSINCIA, PFALTA,PCCOMPANI, PNPRESIN, PCSIGLAS, PTNOMVIA, PNNUMVIA, PTCOMPLE,
	// PCPOSTAL, PCPOBLAC, PCPROVIN, PFGISX, PFGISY, PFGISZ, PTDESCRI, PCTIPMAT,
	// PCMATRIC, PTIPORISC, PCPOLCIA, PCACTIVI, PFILTRO, PCAGENTE, PTREFEXT,
	// PCTIPREF, PTDESCRIE, PNCONTRATO)
	private HashMap callPAC_IAX_SINIESTROS__F_CONSULTASINI2(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPNSINIES, java.math.BigDecimal pPCESTSIN, String pPNNUMIDE, String pPSNIP, String pPBUSCAR,
			java.math.BigDecimal pPTIPOPERS, java.math.BigDecimal pPNSUBEST, String pPNSINCIA, java.sql.Date pPFALTA,
			java.math.BigDecimal pPCCOMPANI, String pPNPRESIN, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY,
			java.math.BigDecimal pPFGISZ, String pPTDESCRI, java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPTIPORISC, String pPCPOLCIA, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCAGENTE, String pPTREFEXT,
			java.math.BigDecimal pPCTIPREF, String pPTDESCRIE, String pPNCONTRATO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_CONSULTASINI2(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPCESTSIN",
				"pPNNUMIDE", "pPSNIP", "pPBUSCAR", "pPTIPOPERS", "pPNSUBEST", "pPNSINCIA", "pPFALTA", "pPCCOMPANI",
				"pPNPRESIN", "pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPCPOSTAL", "pPCPOBLAC", "pPCPROVIN",
				"pPFGISX", "pPFGISY", "pPFGISZ", "pPTDESCRI", "pPCTIPMAT", "pPCMATRIC", "pPTIPORISC", "pPCPOLCIA",
				"pPCACTIVI", "pPFILTRO", "pPCAGENTE", "pPTREFEXT", "pPCTIPREF", "pPTDESCRIE", "pPNCONTRATO" },
				new Object[] { pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPNNUMIDE, pPSNIP,
						pPBUSCAR, pPTIPOPERS, pPNSUBEST, pPNSINCIA, pPFALTA, pPCCOMPANI, pPNPRESIN, pPCSIGLAS,
						pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPFGISX, pPFGISY, pPFGISZ,
						pPTDESCRI, pPCTIPMAT, pPCMATRIC, pPTIPORISC, pPCPOLCIA, pPCACTIVI, pPFILTRO, pPCAGENTE,
						pPTREFEXT, pPCTIPREF, pPTDESCRIE, pPNCONTRATO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPNCERTIF);
		cStmt.setObject(6, pPNSINIES);
		cStmt.setObject(7, pPCESTSIN);
		cStmt.setObject(8, pPNNUMIDE);
		cStmt.setObject(9, pPSNIP);
		cStmt.setObject(10, pPBUSCAR);
		cStmt.setObject(11, pPTIPOPERS);
		cStmt.setObject(12, pPNSUBEST);
		cStmt.setObject(13, pPNSINCIA);
		cStmt.setObject(14, pPFALTA);
		cStmt.setObject(15, pPCCOMPANI);
		cStmt.setObject(16, pPNPRESIN);
		cStmt.setObject(17, pPCSIGLAS);
		cStmt.setObject(18, pPTNOMVIA);
		cStmt.setObject(19, pPNNUMVIA);
		cStmt.setObject(20, pPTCOMPLE);
		cStmt.setObject(21, pPCPOSTAL);
		cStmt.setObject(22, pPCPOBLAC);
		cStmt.setObject(23, pPCPROVIN);
		cStmt.setObject(24, pPFGISX);
		cStmt.setObject(25, pPFGISY);
		cStmt.setObject(26, pPFGISZ);
		cStmt.setObject(27, pPTDESCRI);
		cStmt.setObject(28, pPCTIPMAT);
		cStmt.setObject(29, pPCMATRIC);
		cStmt.setObject(30, pPTIPORISC);
		cStmt.setObject(31, pPCPOLCIA);
		cStmt.setObject(32, pPCACTIVI);
		cStmt.setObject(33, pPFILTRO);
		cStmt.setObject(34, pPCAGENTE);
		cStmt.setObject(35, pPTREFEXT);
		cStmt.setObject(36, pPCTIPREF);
		cStmt.setObject(37, pPTDESCRIE);
		cStmt.setObject(38, pPNCONTRATO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(39, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(39));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_CONSULTASINI2(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPNSINIES, java.math.BigDecimal pPCESTSIN, String pPNNUMIDE, String pPSNIP, String pPBUSCAR,
			java.math.BigDecimal pPTIPOPERS, java.math.BigDecimal pPNSUBEST, String pPNSINCIA, java.sql.Date pPFALTA,
			java.math.BigDecimal pPCCOMPANI, String pPNPRESIN, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA,
			java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPFGISX, java.math.BigDecimal pPFGISY,
			java.math.BigDecimal pPFGISZ, String pPTDESCRI, java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPTIPORISC, String pPCPOLCIA, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCAGENTE, String pPTREFEXT,
			java.math.BigDecimal pPCTIPREF, String pPTDESCRIE, String pPNCONTRATO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_CONSULTASINI2(pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNSINIES,
				pPCESTSIN, pPNNUMIDE, pPSNIP, pPBUSCAR, pPTIPOPERS, pPNSUBEST, pPNSINCIA, pPFALTA, pPCCOMPANI,
				pPNPRESIN, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPFGISX,
				pPFGISY, pPFGISZ, pPTDESCRI, pPCTIPMAT, pPCMATRIC, pPTIPORISC, pPCPOLCIA, pPCACTIVI, pPFILTRO,
				pPCAGENTE, pPTREFEXT, pPCTIPREF, pPTDESCRIE, pPNCONTRATO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_CONSULTASINI2
	// Fin IAXIS-2169 AABC Adicion campo Fecha de apertura
	// --START-PAC_IAX_SINIESTROS.F_MENSAJES_AXISSIN049(PNSINIES, PNTRAMIT,
	// PNLINJUZ, PCORGJUD, PNORGJUD, PTREFJUD, PCSIGLAS, PTNOMVIA, PNNUMVIA,
	// PTCOMPLE, PTDIREC, PCPAIS, PCPROVIN, PCPOBLAC, PCPOSTAL, PTASUNTO, PNCLASEDE,
	// PNTIPOPRO, PNPROCEDI, PFNOTIASE, PFRECPDEM, PFNOTICIA, PFCONTASE, PFCONTCIA,
	// PFAUDPREV, PFJUICIO, PCMONJUZ, PCPLEITO, PIPLEITO, PIALLANA, PISENTENC,
	// PISENTCAP, PISENTIND, PISENTCOS, PISENTINT, PISENTOTR, PCARGUDEF, PCRESPLEI,
	// PCAPELANT, PTHIPOASE, PTHIPOTER, PTTIPRESP, PCOPERCOB, PTREASMED, PCESTPROC,
	// PCETAPROC, PTCONCJUR, PTESTRDEF, PTRECOMEN, PTOBSERV, PFCANCEL)
	private HashMap callPAC_IAX_SINIESTROS__F_MENSAJES_AXISSIN049(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLINJUZ, java.math.BigDecimal pPCORGJUD, String pPNORGJUD, String pPTREFJUD,
			java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE,
			String pPTDIREC, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, String pPTASUNTO, java.math.BigDecimal pPNCLASEDE,
			java.math.BigDecimal pPNTIPOPRO, String pPNPROCEDI, java.sql.Date pPFNOTIASE, java.sql.Date pPFRECPDEM,
			java.sql.Date pPFNOTICIA, java.sql.Date pPFCONTASE, java.sql.Date pPFCONTCIA, java.sql.Date pPFAUDPREV,
			java.sql.Date pPFJUICIO, String pPCMONJUZ, java.math.BigDecimal pPCPLEITO, java.math.BigDecimal pPIPLEITO,
			java.math.BigDecimal pPIALLANA, java.math.BigDecimal pPISENTENC, java.math.BigDecimal pPISENTCAP,
			java.math.BigDecimal pPISENTIND, java.math.BigDecimal pPISENTCOS, java.math.BigDecimal pPISENTINT,
			java.math.BigDecimal pPISENTOTR, java.math.BigDecimal pPCARGUDEF, java.math.BigDecimal pPCRESPLEI,
			java.math.BigDecimal pPCAPELANT, String pPTHIPOASE, String pPTHIPOTER, String pPTTIPRESP,
			java.math.BigDecimal pPCOPERCOB, String pPTREASMED, java.math.BigDecimal pPCESTPROC,
			java.math.BigDecimal pPCETAPROC, String pPTCONCJUR, String pPTESTRDEF, String pPTRECOMEN, String pPTOBSERV,
			java.sql.Date pPFCANCEL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_MENSAJES_AXISSIN049(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLINJUZ", "pPCORGJUD", "pPNORGJUD", "pPTREFJUD",
						"pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPTDIREC", "pPCPAIS", "pPCPROVIN",
						"pPCPOBLAC", "pPCPOSTAL", "pPTASUNTO", "pPNCLASEDE", "pPNTIPOPRO", "pPNPROCEDI", "pPFNOTIASE",
						"pPFRECPDEM", "pPFNOTICIA", "pPFCONTASE", "pPFCONTCIA", "pPFAUDPREV", "pPFJUICIO", "pPCMONJUZ",
						"pPCPLEITO", "pPIPLEITO", "pPIALLANA", "pPISENTENC", "pPISENTCAP", "pPISENTIND", "pPISENTCOS",
						"pPISENTINT", "pPISENTOTR", "pPCARGUDEF", "pPCRESPLEI", "pPCAPELANT", "pPTHIPOASE",
						"pPTHIPOTER", "pPTTIPRESP", "pPCOPERCOB", "pPTREASMED", "pPCESTPROC", "pPCETAPROC",
						"pPTCONCJUR", "pPTESTRDEF", "pPTRECOMEN", "pPTOBSERV", "pPFCANCEL" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLINJUZ, pPCORGJUD, pPNORGJUD, pPTREFJUD, pPCSIGLAS, pPTNOMVIA,
						pPNNUMVIA, pPTCOMPLE, pPTDIREC, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL, pPTASUNTO, pPNCLASEDE,
						pPNTIPOPRO, pPNPROCEDI, pPFNOTIASE, pPFRECPDEM, pPFNOTICIA, pPFCONTASE, pPFCONTCIA, pPFAUDPREV,
						pPFJUICIO, pPCMONJUZ, pPCPLEITO, pPIPLEITO, pPIALLANA, pPISENTENC, pPISENTCAP, pPISENTIND,
						pPISENTCOS, pPISENTINT, pPISENTOTR, pPCARGUDEF, pPCRESPLEI, pPCAPELANT, pPTHIPOASE, pPTHIPOTER,
						pPTTIPRESP, pPCOPERCOB, pPTREASMED, pPCESTPROC, pPCETAPROC, pPTCONCJUR, pPTESTRDEF, pPTRECOMEN,
						pPTOBSERV, pPFCANCEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLINJUZ);
		cStmt.setObject(5, pPCORGJUD);
		cStmt.setObject(6, pPNORGJUD);
		cStmt.setObject(7, pPTREFJUD);
		cStmt.setObject(8, pPCSIGLAS);
		cStmt.setObject(9, pPTNOMVIA);
		cStmt.setObject(10, pPNNUMVIA);
		cStmt.setObject(11, pPTCOMPLE);
		cStmt.setObject(12, pPTDIREC);
		cStmt.setObject(13, pPCPAIS);
		cStmt.setObject(14, pPCPROVIN);
		cStmt.setObject(15, pPCPOBLAC);
		cStmt.setObject(16, pPCPOSTAL);
		cStmt.setObject(17, pPTASUNTO);
		cStmt.setObject(18, pPNCLASEDE);
		cStmt.setObject(19, pPNTIPOPRO);
		cStmt.setObject(20, pPNPROCEDI);
		cStmt.setObject(21, pPFNOTIASE);
		cStmt.setObject(22, pPFRECPDEM);
		cStmt.setObject(23, pPFNOTICIA);
		cStmt.setObject(24, pPFCONTASE);
		cStmt.setObject(25, pPFCONTCIA);
		cStmt.setObject(26, pPFAUDPREV);
		cStmt.setObject(27, pPFJUICIO);
		cStmt.setObject(28, pPCMONJUZ);
		cStmt.setObject(29, pPCPLEITO);
		cStmt.setObject(30, pPIPLEITO);
		cStmt.setObject(31, pPIALLANA);
		cStmt.setObject(32, pPISENTENC);
		cStmt.setObject(33, pPISENTCAP);
		cStmt.setObject(34, pPISENTIND);
		cStmt.setObject(35, pPISENTCOS);
		cStmt.setObject(36, pPISENTINT);
		cStmt.setObject(37, pPISENTOTR);
		cStmt.setObject(38, pPCARGUDEF);
		cStmt.setObject(39, pPCRESPLEI);
		cStmt.setObject(40, pPCAPELANT);
		cStmt.setObject(41, pPTHIPOASE);
		cStmt.setObject(42, pPTHIPOTER);
		cStmt.setObject(43, pPTTIPRESP);
		cStmt.setObject(44, pPCOPERCOB);
		cStmt.setObject(45, pPTREASMED);
		cStmt.setObject(46, pPCESTPROC);
		cStmt.setObject(47, pPCETAPROC);
		cStmt.setObject(48, pPTCONCJUR);
		cStmt.setObject(49, pPTESTRDEF);
		cStmt.setObject(50, pPTRECOMEN);
		cStmt.setObject(51, pPTOBSERV);
		cStmt.setObject(52, pPFCANCEL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(53, java.sql.Types.VARCHAR); // Valor de "OTEXTO"
		cStmt.registerOutParameter(54, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("OTEXTO", cStmt.getObject(53));
		} catch (SQLException e) {
			retVal.put("OTEXTO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(54));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_MENSAJES_AXISSIN049(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLINJUZ, java.math.BigDecimal pPCORGJUD, String pPNORGJUD, String pPTREFJUD,
			java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE,
			String pPTDIREC, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, String pPTASUNTO, java.math.BigDecimal pPNCLASEDE,
			java.math.BigDecimal pPNTIPOPRO, String pPNPROCEDI, java.sql.Date pPFNOTIASE, java.sql.Date pPFRECPDEM,
			java.sql.Date pPFNOTICIA, java.sql.Date pPFCONTASE, java.sql.Date pPFCONTCIA, java.sql.Date pPFAUDPREV,
			java.sql.Date pPFJUICIO, String pPCMONJUZ, java.math.BigDecimal pPCPLEITO, java.math.BigDecimal pPIPLEITO,
			java.math.BigDecimal pPIALLANA, java.math.BigDecimal pPISENTENC, java.math.BigDecimal pPISENTCAP,
			java.math.BigDecimal pPISENTIND, java.math.BigDecimal pPISENTCOS, java.math.BigDecimal pPISENTINT,
			java.math.BigDecimal pPISENTOTR, java.math.BigDecimal pPCARGUDEF, java.math.BigDecimal pPCRESPLEI,
			java.math.BigDecimal pPCAPELANT, String pPTHIPOASE, String pPTHIPOTER, String pPTTIPRESP,
			java.math.BigDecimal pPCOPERCOB, String pPTREASMED, java.math.BigDecimal pPCESTPROC,
			java.math.BigDecimal pPCETAPROC, String pPTCONCJUR, String pPTESTRDEF, String pPTRECOMEN, String pPTOBSERV,
			java.sql.Date pPFCANCEL) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_MENSAJES_AXISSIN049(pPNSINIES, pPNTRAMIT, pPNLINJUZ, pPCORGJUD, pPNORGJUD,
				pPTREFJUD, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPTDIREC, pPCPAIS, pPCPROVIN, pPCPOBLAC,
				pPCPOSTAL, pPTASUNTO, pPNCLASEDE, pPNTIPOPRO, pPNPROCEDI, pPFNOTIASE, pPFRECPDEM, pPFNOTICIA,
				pPFCONTASE, pPFCONTCIA, pPFAUDPREV, pPFJUICIO, pPCMONJUZ, pPCPLEITO, pPIPLEITO, pPIALLANA, pPISENTENC,
				pPISENTCAP, pPISENTIND, pPISENTCOS, pPISENTINT, pPISENTOTR, pPCARGUDEF, pPCRESPLEI, pPCAPELANT,
				pPTHIPOASE, pPTHIPOTER, pPTTIPRESP, pPCOPERCOB, pPTREASMED, pPCESTPROC, pPCETAPROC, pPTCONCJUR,
				pPTESTRDEF, pPTRECOMEN, pPTOBSERV, pPFCANCEL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_MENSAJES_AXISSIN049

	// --START-PAC_IAX_SINIESTROS.F_GET_AGENTE_NPOL(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_AGENTE_NPOL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_AGENTE_NPOL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCAGENTE"
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
			retVal.put("PCAGENTE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCAGENTE", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_AGENTE_NPOL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_AGENTE_NPOL(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_AGENTE_NPOL
	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_PREGUNTAS(PNSINIES, PSPRODUC, PCACTIVI,
	// PPREGUNTAS)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_PREGUNTAS(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, String pPPREGUNTAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_PREGUNTAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPSPRODUC", "pPCACTIVI", "pPPREGUNTAS" },
				new Object[] { pPNSINIES, pPSPRODUC, pPCACTIVI, pPPREGUNTAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPPREGUNTAS);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_PREGUNTAS(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, String pPPREGUNTAS) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_PREGUNTAS(pPNSINIES, pPSPRODUC, pPCACTIVI, pPPREGUNTAS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_PREGUNTAS
	// --START-PAC_IAX_SINIESTROS.F_GET_PREG_SINIESTRO(PSPRODUC, PCACTIVI, PCGARANT,
	// PCCAUSIN, PCMOTSIN)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_PREG_SINIESTRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCGARANT, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_PREG_SINIESTRO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAUSIN", "pPCMOTSIN" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAUSIN, pPCMOTSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCCAUSIN);
		cStmt.setObject(6, pPCMOTSIN);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_PREG_SINIESTRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCGARANT, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_PREG_SINIESTRO(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAUSIN, pPCMOTSIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_PREG_SINIESTRO

	// --START-PAC_IAX_SINIESTROS.F_GET_RESP_SINIESTRO(PCPREGUN)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_RESP_SINIESTRO(String pPCPREGUN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_RESP_SINIESTRO(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_RESP_SINIESTRO(String pPCPREGUN) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_RESP_SINIESTRO(pPCPREGUN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_RESP_SINIESTRO

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJ_GARANTIAS(PNSINIES, PCGARANT, PICAPITAL,
	// PTGARANT)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJ_GARANTIAS(String pPNSINIES, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPICAPITAL, String pPTGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJ_GARANTIAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPCGARANT", "pPICAPITAL", "pPTGARANT" },
				new Object[] { pPNSINIES, pPCGARANT, pPICAPITAL, pPTGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPICAPITAL);
		cStmt.setObject(5, pPTGARANT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_GARANTIAS(String pPNSINIES, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPICAPITAL, String pPTGARANT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJ_GARANTIAS(pPNSINIES, pPCGARANT, pPICAPITAL, pPTGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJ_GARANTIAS

	// --START-PAC_IAX_SINIESTROS.F_GET_LSTLOCALIZA(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_LSTLOCALIZA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_LSTLOCALIZA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_LSTLOCALIZA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_LSTLOCALIZA(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_LSTLOCALIZA

	// --START-PAC_IAX_SINIESTROS.F_GET_LOCALIZA(PNSINIES, PNTRAMIT, PNLOCALI)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_LOCALIZA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLOCALI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_LOCALIZA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLOCALI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLOCALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLOCALI);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_LOCALIZA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLOCALI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_LOCALIZA(pPNSINIES, pPNTRAMIT, pPNLOCALI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_LOCALIZA

	// --START-PAC_IAX_SINIESTROS.F_GET_VEHICULO_ASEGURADO(PSSEGURO, PNRIESGO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_VEHICULO_ASEGURADO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_VEHICULO_ASEGURADO(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_VEHICULO_ASEGURADO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_VEHICULO_ASEGURADO(pPSSEGURO, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_VEHICULO_ASEGURADO

	// --START-PAC_IAX_SINIESTROS.F_GET_LSTOFICINAS(PCBANCO, PCOFICI, PTOFICI)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_LSTOFICINAS(java.math.BigDecimal pPCBANCO,
			java.math.BigDecimal pPCOFICI, String pPTOFICI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_LSTOFICINAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCBANCO", "pPCOFICI", "pPTOFICI" },
				new Object[] { pPCBANCO, pPCOFICI, pPTOFICI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCBANCO);
		cStmt.setObject(3, pPCOFICI);
		cStmt.setObject(4, pPTOFICI);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_LSTOFICINAS(java.math.BigDecimal pPCBANCO,
			java.math.BigDecimal pPCOFICI, String pPTOFICI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_LSTOFICINAS(pPCBANCO, pPCOFICI, pPTOFICI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_LSTOFICINAS

	// --START-PAC_IAX_SINIESTROS.F_GET_BENEFICIARIO_DESIGNADO(PNSINIES, PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_BENEFICIARIO_DESIGNADO(String pPNSINIES,
			java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_BENEFICIARIO_DESIGNADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPSSEGURO" }, new Object[] { pPNSINIES, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_BENEFICIARIO_DESIGNADO(String pPNSINIES,
			java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_BENEFICIARIO_DESIGNADO(pPNSINIES, pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_BENEFICIARIO_DESIGNADO

	// --START-PAC_IAX_SINIESTROS.F_GET_GARANTIAS_DEPENDIENTES(PGARANTIAS)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_GARANTIAS_DEPENDIENTES(String pPGARANTIAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_GARANTIAS_DEPENDIENTES(?, ?)}";

		logCall(callQuery, new String[] { "pPGARANTIAS" }, new Object[] { pPGARANTIAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPGARANTIAS);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_GARANTIAS_DEPENDIENTES(String pPGARANTIAS) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_GARANTIAS_DEPENDIENTES(pPGARANTIAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_GARANTIAS_DEPENDIENTES

//--START-PAC_IAX_SINIESTROS.F_GET_INF_REASEGURO(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_INF_REASEGURO(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_INF_REASEGURO(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_INF_REASEGURO(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_INF_REASEGURO(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_INF_REASEGURO

	// --START-PAC_IAX_SINIESTROS.F_INS_PAGO_CONTRATO(PSIDEPAG, PCDP, PPOSPRES,
	// PCRP, PPOSCRP, PCONTRATO, PCGESTOR)
	private HashMap callPAC_IAX_SINIESTROS__F_INS_PAGO_CONTRATO(java.math.BigDecimal pPSIDEPAG, String pPCDP,
			String pPPOSPRES, String pPCRP, String pPPOSCRP, String pPCONTRATO, String pPCGESTOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_INS_PAGO_CONTRATO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSIDEPAG", "pPCDP", "pPPOSPRES", "pPCRP", "pPPOSCRP", "pPCONTRATO", "pPCGESTOR" },
				new Object[] { pPSIDEPAG, pPCDP, pPPOSPRES, pPCRP, pPPOSCRP, pPCONTRATO, pPCGESTOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDEPAG);
		cStmt.setObject(3, pPCDP);
		cStmt.setObject(4, pPPOSPRES);
		cStmt.setObject(5, pPCRP);
		cStmt.setObject(6, pPPOSCRP);
		cStmt.setObject(7, pPCONTRATO);
		cStmt.setObject(8, pPCGESTOR);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_INS_PAGO_CONTRATO(java.math.BigDecimal pPSIDEPAG, String pPCDP,
			String pPPOSPRES, String pPCRP, String pPPOSCRP, String pPCONTRATO, String pPCGESTOR) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_INS_PAGO_CONTRATO(pPSIDEPAG, pPCDP, pPPOSPRES, pPCRP, pPPOSCRP,
				pPCONTRATO, pPCGESTOR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_INS_PAGO_CONTRATO
//--START-PAC_IAX_SINIESTROS.F_VALIDA_COMPENSACION(PSSEGURO,  PNRIESGO,  PNSINIES,  PSIDEPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_VALIDA_COMPENSACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPSIDEPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_VALIDA_COMPENSACION(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPNSINIES", "pPSIDEPAG" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNSINIES, pPSIDEPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPSIDEPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PTLITERA"
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
			retVal.put("PTLITERA", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PTLITERA", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_VALIDA_COMPENSACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPSIDEPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_VALIDA_COMPENSACION(pPSSEGURO, pPNRIESGO, pPNSINIES, pPSIDEPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_VALIDA_COMPENSACION

	// --START-PAC_IAX_SINIESTROS.F_COMPENSA_CARTERA(PSSEGURO, PNRIESGO, PNSINIES,
	// PSIDEPAG)
	private HashMap callPAC_IAX_SINIESTROS__F_COMPENSA_CARTERA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPSIDEPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_COMPENSA_CARTERA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPNSINIES", "pPSIDEPAG" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNSINIES, pPSIDEPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPSIDEPAG);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_COMPENSA_CARTERA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPSIDEPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_COMPENSA_CARTERA(pPSSEGURO, pPNRIESGO, pPNSINIES, pPSIDEPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_COMPENSA_CARTERA

	private HashMap callPAC_IAX_SINIESTROS__F_GET_LST_PAGOS(java.math.BigDecimal pCRAMO, java.math.BigDecimal pSPRODUC,
			String pNSINIES, java.math.BigDecimal pSIDEPAG, java.math.BigDecimal pCCONCEP, java.math.BigDecimal pIMPMIN,
			java.math.BigDecimal pCESTVAL, java.math.BigDecimal pCESPAG, java.math.BigDecimal pSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_LST_PAGOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pCRAMO", "pSPRODUC", "pNSINIES", "pSIDEPAG", "pCCONCEP", "pIMPMIN", "pCESTVAL",
						"pCESPAG", "pSPERSON" },
				new Object[] { pCRAMO, pSPRODUC, pNSINIES, pSIDEPAG, pCCONCEP, pIMPMIN, pCESTVAL, pCESPAG, pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCRAMO);
		cStmt.setObject(3, pSPRODUC);
		cStmt.setObject(4, pNSINIES);
		cStmt.setObject(5, pSIDEPAG);
		cStmt.setObject(6, pCCONCEP);
		cStmt.setObject(7, pIMPMIN);
		cStmt.setObject(8, pCESTVAL);
		cStmt.setObject(9, pCESPAG);
		cStmt.setObject(10, pSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_LST_PAGOS(java.math.BigDecimal pCRAMO,
			java.math.BigDecimal pSPRODUC, String pNSINIES, java.math.BigDecimal pSIDEPAG,
			java.math.BigDecimal pCCONCEP, java.math.BigDecimal pIMPMIN, java.math.BigDecimal pCESTVAL,
			java.math.BigDecimal pCESPAG, java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_LST_PAGOS(pCRAMO, pSPRODUC, pNSINIES, pSIDEPAG, pCCONCEP, pIMPMIN,
				pCESTVAL, pCESPAG, pSPERSON);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_SINIESTROS__F_TRATAR_PAGOS(String pTBLPAG, java.math.BigDecimal pCESTVAL2,
			java.math.BigDecimal pCESTPAG2, java.math.BigDecimal pCESTPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_TRATAR_PAGOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pTBLPAG", "pCESTVAL2", "pCESTPAG2", "pCESTPAG" },
				new Object[] { pTBLPAG, pCESTVAL2, pCESTPAG2, pCESTPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pTBLPAG);
		cStmt.setObject(3, pCESTVAL2);
		cStmt.setObject(4, pCESTPAG2);
		cStmt.setObject(5, pCESTPAG);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_TRATAR_PAGOS(String pTBLPAG, java.math.BigDecimal pCESTVAL2,
			java.math.BigDecimal pCESTPAG2, java.math.BigDecimal pCESTPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_TRATAR_PAGOS(pTBLPAG, pCESTVAL2, pCESTPAG2, pCESTPAG);// AXIS-WLS1SERVER-Ready
	}

	// --START-PAC_IAX_SINIESTROS.F_INICIALIZA_GARANTIAS()
	private HashMap callPAC_IAX_SINIESTROS__F_INICIALIZA_GARANTIAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_INICIALIZA_GARANTIAS(?)}";

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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_INICIALIZA_GARANTIAS() throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_INICIALIZA_GARANTIAS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_INICIALIZA_GARANTIAS

	// --START-PAC_IAX_SINIESTROS.F_GET_TOMADORES(PSSEGURO)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_TOMADORES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_TOMADORES(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TOMADORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_TOMADORES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_TOMADORES(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_TOMADORES
	// --START-PAC_IAX_SINIESTROS.FF_HAY_LISTA_INNOMINADOS(PSPRODUC, PSSEGURO,
	// PNRIESGO)
	private HashMap callPAC_IAX_SINIESTROS__FF_HAY_LISTA_INNOMINADOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.FF_HAY_LISTA_INNOMINADOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPSSEGURO", "pPNRIESGO" },
				new Object[] { pPSPRODUC, pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PNASEGUR"
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
			retVal.put("PNASEGUR", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PNASEGUR", null);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__FF_HAY_LISTA_INNOMINADOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__FF_HAY_LISTA_INNOMINADOS(pPSPRODUC, pPSSEGURO, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.FF_HAY_LISTA_INNOMINADOS

	// --START-PAC_IAX_SINIESTROS.F_DEL_SIN_TRAMI_DOC(PNSINIES, PNTRAMIT, PNDOCUME)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMI_DOC(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDOCUME) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_SIN_TRAMI_DOC(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDOCUME" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDOCUME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDOCUME);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMI_DOC(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDOCUME) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMI_DOC(pPNSINIES, pPNTRAMIT, pPNDOCUME);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_SIN_TRAMI_DOC

	// --START-PAC_IAX_SINIESTROS.F_DEL_CITACION(PNSINIES, PNTRAMIT, PNCITACION)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_CITACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNCITACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_CITACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNCITACION" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNCITACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNCITACION);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_CITACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNCITACION) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_CITACION(pPNSINIES, pPNTRAMIT, pPNCITACION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_CITACION

	// --START-PAC_IAX_SINIESTROS.F_GET_OBJETO_CITACION(PNSINIES, PNTRAMIT,
	// PNCITACION)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_OBJETO_CITACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNCITACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_OBJETO_CITACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNCITACION" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNCITACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNCITACION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMI_CITACION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_CITACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNCITACION) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_OBJETO_CITACION(pPNSINIES, pPNTRAMIT, pPNCITACION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_OBJETO_CITACION

	// --START-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMICIT(PNSINIES, PNTRAMIT,
	// PNCITACION, PSPERSON, PFCITACION, PHCITACION, PCPAIS, PCPROVIN, PCPOBLAC,
	// PTLUGAR, PTAUDIEN, PCORAL, PCESTADO, PCRESOLU, PFNUEVA, PTRESULT, PCMEDIO)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMICIT(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNCITACION, java.math.BigDecimal pPSPERSON, java.sql.Date pPFCITACION,
			String pPHCITACION, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPTLUGAR, String pPTAUDIEN, java.math.BigDecimal pPCORAL,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCRESOLU, java.sql.Date pPFNUEVA, String pPTRESULT,
			java.math.BigDecimal pPCMEDIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMICIT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNCITACION", "pPSPERSON", "pPFCITACION", "pPHCITACION",
						"pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPTLUGAR", "pPTAUDIEN", "pPCORAL", "pPCESTADO",
						"pPCRESOLU", "pPFNUEVA", "pPTRESULT", "pPCMEDIO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNCITACION, pPSPERSON, pPFCITACION, pPHCITACION, pPCPAIS,
						pPCPROVIN, pPCPOBLAC, pPTLUGAR, pPTAUDIEN, pPCORAL, pPCESTADO, pPCRESOLU, pPFNUEVA, pPTRESULT,
						pPCMEDIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNCITACION);
		cStmt.setObject(5, pPSPERSON);
		cStmt.setObject(6, pPFCITACION);
		cStmt.setObject(7, pPHCITACION);
		cStmt.setObject(8, pPCPAIS);
		cStmt.setObject(9, pPCPROVIN);
		cStmt.setObject(10, pPCPOBLAC);
		cStmt.setObject(11, pPTLUGAR);
		cStmt.setObject(12, pPTAUDIEN);
		cStmt.setObject(13, pPCORAL);
		cStmt.setObject(14, pPCESTADO);
		cStmt.setObject(15, pPCRESOLU);
		cStmt.setObject(16, pPFNUEVA);
		cStmt.setObject(17, pPTRESULT);
		cStmt.setObject(18, pPCMEDIO);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMICIT(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNCITACION, java.math.BigDecimal pPSPERSON, java.sql.Date pPFCITACION,
			String pPHCITACION, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPTLUGAR, String pPTAUDIEN, java.math.BigDecimal pPCORAL,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCRESOLU, java.sql.Date pPFNUEVA, String pPTRESULT,
			java.math.BigDecimal pPCMEDIO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMICIT(pPNSINIES, pPNTRAMIT, pPNCITACION, pPSPERSON,
				pPFCITACION, pPHCITACION, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPTLUGAR, pPTAUDIEN, pPCORAL, pPCESTADO,
				pPCRESOLU, pPFNUEVA, pPTRESULT, pPCMEDIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_OBJETO_SINTRAMICIT

	// --START-PAC_IAX_SINIESTROS.F_GET_ASISTE_CITACION_DEF(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_ASISTE_CITACION_DEF(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_ASISTE_CITACION_DEF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_ASISTE_CITACION_DEF(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_ASISTE_CITACION_DEF(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_ASISTE_CITACION_DEF

	// --START-PAC_IAX_SINIESTROS.F_GET_TRAMITACIONES(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_TRAMITACIONES(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_TRAMITACIONES(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITACIONES(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_TRAMITACIONES(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_TRAMITACIONES

	// --START-PAC_IAX_SINIESTROS.F_GET_RESERVAS(PNSINIES)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_RESERVAS(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_RESERVAS(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_RESERVAS(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_RESERVAS(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_RESERVAS

	// --START-PAC_IAX_SINIESTROS.F_PAGOS_AVION(PNSINIES, PNTRAMIT, PNMOVRES,
	// PCTIPRES, PCTIPGAS, PCGARANT, PCMONRES, PNNUMIDE_AGENCIA,
	// PSPERSON_AGENCIA, PNNUMIDE_AERO, PSPERSON_AERO, PNFACREF, PFFACREF,
	// PTOBSERVA, PISINRET_AERO, PPIVA_AERO, PIIVA_AERO, PIOTROSGAS_AERO,
	// PINETO_AERO, PISINRET_AGENCIA, PPIVA_AGENCIA, PIIVA_AGENCIA,
	// PINETO_AGENCIA)
	private HashMap callPAC_IAX_SINIESTROS__F_PAGOS_AVION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS,
			java.math.BigDecimal pPCGARANT, String pPCMONRES, String pPNNUMIDE_AGENCIA,
			java.math.BigDecimal pPSPERSON_AGENCIA, String pPNNUMIDE_AERO, java.math.BigDecimal pPSPERSON_AERO,
			String pPNFACREF, java.sql.Date pPFFACREF, String pPTOBSERVA, java.math.BigDecimal pPISINRET_AERO,
			java.math.BigDecimal pPPIVA_AERO, java.math.BigDecimal pPIIVA_AERO, java.math.BigDecimal pPIOTROSGAS_AERO,
			java.math.BigDecimal pPINETO_AERO, java.math.BigDecimal pPISINRET_AGENCIA,
			java.math.BigDecimal pPPIVA_AGENCIA, java.math.BigDecimal pPIIVA_AGENCIA,
			java.math.BigDecimal pPINETO_AGENCIA, java.math.BigDecimal pPCCONPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_PAGOS_AVION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNMOVRES", "pPCTIPRES", "pPCTIPGAS", "pPCGARANT",
						"pPCMONRES", "pPNNUMIDE_AGENCIA", "pPSPERSON_AGENCIA", "pPNNUMIDE_AERO", "pPSPERSON_AERO",
						"pPNFACREF", "pPFFACREF", "pPTOBSERVA", "pPISINRET_AERO", "pPPIVA_AERO", "pPIIVA_AERO",
						"pPIOTROSGAS_AERO", "pPINETO_AERO", "pPISINRET_AGENCIA", "pPPIVA_AGENCIA", "pPIIVA_AGENCIA",
						"pPINETO_AGENCIA", "pPCCONPAG" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNMOVRES, pPCTIPRES, pPCTIPGAS, pPCGARANT, pPCMONRES,
						pPNNUMIDE_AGENCIA, pPSPERSON_AGENCIA, pPNNUMIDE_AERO, pPSPERSON_AERO, pPNFACREF, pPFFACREF,
						pPTOBSERVA, pPISINRET_AERO, pPPIVA_AERO, pPIIVA_AERO, pPIOTROSGAS_AERO, pPINETO_AERO,
						pPISINRET_AGENCIA, pPPIVA_AGENCIA, pPIIVA_AGENCIA, pPINETO_AGENCIA, pPCCONPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNMOVRES);
		cStmt.setObject(5, pPCTIPRES);
		cStmt.setObject(6, pPCTIPGAS);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPCMONRES);
		cStmt.setObject(9, pPNNUMIDE_AGENCIA);
		cStmt.setObject(10, pPSPERSON_AGENCIA);
		cStmt.setObject(11, pPNNUMIDE_AERO);
		cStmt.setObject(12, pPSPERSON_AERO);
		cStmt.setObject(13, pPNFACREF);
		cStmt.setObject(14, pPFFACREF);
		cStmt.setObject(15, pPTOBSERVA);
		cStmt.setObject(16, pPISINRET_AERO);
		cStmt.setObject(17, pPPIVA_AERO);
		cStmt.setObject(18, pPIIVA_AERO);
		cStmt.setObject(19, pPIOTROSGAS_AERO);
		cStmt.setObject(20, pPINETO_AERO);
		cStmt.setObject(21, pPISINRET_AGENCIA);
		cStmt.setObject(22, pPPIVA_AGENCIA);
		cStmt.setObject(23, pPIIVA_AGENCIA);
		cStmt.setObject(24, pPINETO_AGENCIA);
		cStmt.setObject(25, pPCCONPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(26, oracle.jdbc.OracleTypes.ARRAY,
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_PAGOS_AVION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNMOVRES, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCTIPGAS,
			java.math.BigDecimal pPCGARANT, String pPCMONRES, String pPNNUMIDE_AGENCIA,
			java.math.BigDecimal pPSPERSON_AGENCIA, String pPNNUMIDE_AERO, java.math.BigDecimal pPSPERSON_AERO,
			String pPNFACREF, java.sql.Date pPFFACREF, String pPTOBSERVA, java.math.BigDecimal pPISINRET_AERO,
			java.math.BigDecimal pPPIVA_AERO, java.math.BigDecimal pPIIVA_AERO, java.math.BigDecimal pPIOTROSGAS_AERO,
			java.math.BigDecimal pPINETO_AERO, java.math.BigDecimal pPISINRET_AGENCIA,
			java.math.BigDecimal pPPIVA_AGENCIA, java.math.BigDecimal pPIIVA_AGENCIA,
			java.math.BigDecimal pPINETO_AGENCIA, java.math.BigDecimal pPCCONPAG) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_PAGOS_AVION(pPNSINIES, pPNTRAMIT, pPNMOVRES, pPCTIPRES, pPCTIPGAS,
				pPCGARANT, pPCMONRES, pPNNUMIDE_AGENCIA, pPSPERSON_AGENCIA, pPNNUMIDE_AERO, pPSPERSON_AERO, pPNFACREF,
				pPFFACREF, pPTOBSERVA, pPISINRET_AERO, pPPIVA_AERO, pPIIVA_AERO, pPIOTROSGAS_AERO, pPINETO_AERO,
				pPISINRET_AGENCIA, pPPIVA_AGENCIA, pPIIVA_AGENCIA, pPINETO_AGENCIA, pPCCONPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_PAGOS_AVION

	// --START-PAC_IAX_SINIESTROS.F_GET_SIN_TRAMITA_APOYO(PSINTAPOY, PNSINIES,
	// PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_GET_SIN_TRAMITA_APOYO(java.math.BigDecimal pPSINTAPOY, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_SIN_TRAMITA_APOYO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTAPOY", "pPNSINIES", "pPNTRAMIT" },
				new Object[] { pPSINTAPOY, pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINTAPOY);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_SIN_TRAMITA_APOYO(java.math.BigDecimal pPSINTAPOY, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_SIN_TRAMITA_APOYO(pPSINTAPOY, pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_SIN_TRAMITA_APOYO

	// --START-PAC_IAX_SINIESTROS.F_SET_SIN_TRAMITA_APOYO(PSINTAPOY, PNSINIES,
	// PNTRAMIT, PNAPOYO, PCUNITRA, PCTRAMITAD, PFINGRESO, PFTERMINO, PFSALIDA,
	// PTOBSERVA, PTLOCALI, PCSIGLAS, PTNOMVIA, PNNUMVIA, PTCOMPLE, PCPAIS,
	// PCPROVIN, PCPOBLAC, PCPOSTAL, PCVIAVP, PCLITVP, PCBISVP, PCORVP, PNVIAADCO,
	// PCLITCO, PCORCO, PNPLACACO, PCOR2CO, PCDET1IA, PTNUM1IA, PCDET2IA, PTNUM2IA,
	// PCDET3IA, PTNUM3IA, PLOCALIDAD, PFALTA, PCUSUALT, PFMODIFI, PCUSUMOD,
	// PTOBSERVA2, PCAGENTE, PSPERSON)
	private HashMap callPAC_IAX_SINIESTROS__F_SET_SIN_TRAMITA_APOYO(java.math.BigDecimal pPSINTAPOY, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNAPOYO, String pPCUNITRA, String pPCTRAMITAD,
			java.sql.Date pPFINGRESO, java.sql.Date pPFTERMINO, java.sql.Date pPFSALIDA, String pPTOBSERVA,
			String pPTLOCALI, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA,
			String pPTCOMPLE, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, java.math.BigDecimal pPCVIAVP,
			java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP,
			java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO,
			java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA,
			String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA,
			String pPTNUM3IA, String pPLOCALIDAD, java.sql.Date pPFALTA, String pPCUSUALT, java.sql.Date pPFMODIFI,
			String pPCUSUMOD, String pPTOBSERVA2, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_SET_SIN_TRAMITA_APOYO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTAPOY", "pPNSINIES", "pPNTRAMIT", "pPNAPOYO", "pPCUNITRA",
				"pPCTRAMITAD", "pPFINGRESO", "pPFTERMINO", "pPFSALIDA", "pPTOBSERVA", "pPTLOCALI", "pPCSIGLAS",
				"pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPCPOSTAL", "pPCVIAVP",
				"pPCLITVP", "pPCBISVP", "pPCORVP", "pPNVIAADCO", "pPCLITCO", "pPCORCO", "pPNPLACACO", "pPCOR2CO",
				"pPCDET1IA", "pPTNUM1IA", "pPCDET2IA", "pPTNUM2IA", "pPCDET3IA", "pPTNUM3IA", "pPLOCALIDAD", "pPFALTA",
				"pPCUSUALT", "pPFMODIFI", "pPCUSUMOD", "pPTOBSERVA2", "pPCAGENTE", "pPSPERSON" },
				new Object[] { pPSINTAPOY, pPNSINIES, pPNTRAMIT, pPNAPOYO, pPCUNITRA, pPCTRAMITAD, pPFINGRESO,
						pPFTERMINO, pPFSALIDA, pPTOBSERVA, pPTLOCALI, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE,
						pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO,
						pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA,
						pPTNUM3IA, pPLOCALIDAD, pPFALTA, pPCUSUALT, pPFMODIFI, pPCUSUMOD, pPTOBSERVA2, pPCAGENTE,
						pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINTAPOY);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPNAPOYO);
		cStmt.setObject(6, pPCUNITRA);
		cStmt.setObject(7, pPCTRAMITAD);
		cStmt.setObject(8, pPFINGRESO);
		cStmt.setObject(9, pPFTERMINO);
		cStmt.setObject(10, pPFSALIDA);
		cStmt.setObject(11, pPTOBSERVA);
		cStmt.setObject(12, pPTLOCALI);
		cStmt.setObject(13, pPCSIGLAS);
		cStmt.setObject(14, pPTNOMVIA);
		cStmt.setObject(15, pPNNUMVIA);
		cStmt.setObject(16, pPTCOMPLE);
		cStmt.setObject(17, pPCPAIS);
		cStmt.setObject(18, pPCPROVIN);
		cStmt.setObject(19, pPCPOBLAC);
		cStmt.setObject(20, pPCPOSTAL);
		cStmt.setObject(21, pPCVIAVP);
		cStmt.setObject(22, pPCLITVP);
		cStmt.setObject(23, pPCBISVP);
		cStmt.setObject(24, pPCORVP);
		cStmt.setObject(25, pPNVIAADCO);
		cStmt.setObject(26, pPCLITCO);
		cStmt.setObject(27, pPCORCO);
		cStmt.setObject(28, pPNPLACACO);
		cStmt.setObject(29, pPCOR2CO);
		cStmt.setObject(30, pPCDET1IA);
		cStmt.setObject(31, pPTNUM1IA);
		cStmt.setObject(32, pPCDET2IA);
		cStmt.setObject(33, pPTNUM2IA);
		cStmt.setObject(34, pPCDET3IA);
		cStmt.setObject(35, pPTNUM3IA);
		cStmt.setObject(36, pPLOCALIDAD);
		cStmt.setObject(37, pPFALTA);
		cStmt.setObject(38, pPCUSUALT);
		cStmt.setObject(39, pPFMODIFI);
		cStmt.setObject(40, pPCUSUMOD);
		cStmt.setObject(41, pPTOBSERVA2);
		cStmt.setObject(42, pPCAGENTE);
		cStmt.setObject(43, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(44, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(44));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_SET_SIN_TRAMITA_APOYO(java.math.BigDecimal pPSINTAPOY, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNAPOYO, String pPCUNITRA, String pPCTRAMITAD,
			java.sql.Date pPFINGRESO, java.sql.Date pPFTERMINO, java.sql.Date pPFSALIDA, String pPTOBSERVA,
			String pPTLOCALI, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA,
			String pPTCOMPLE, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPCPOSTAL, java.math.BigDecimal pPCVIAVP,
			java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP,
			java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO,
			java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA,
			String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA,
			String pPTNUM3IA, String pPLOCALIDAD, java.sql.Date pPFALTA, String pPCUSUALT, java.sql.Date pPFMODIFI,
			String pPCUSUMOD, String pPTOBSERVA2, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_SET_SIN_TRAMITA_APOYO(pPSINTAPOY, pPNSINIES, pPNTRAMIT, pPNAPOYO,
				pPCUNITRA, pPCTRAMITAD, pPFINGRESO, pPFTERMINO, pPFSALIDA, pPTOBSERVA, pPTLOCALI, pPCSIGLAS, pPTNOMVIA,
				pPNNUMVIA, pPTCOMPLE, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP,
				pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA,
				pPCDET3IA, pPTNUM3IA, pPLOCALIDAD, pPFALTA, pPCUSUALT, pPFMODIFI, pPCUSUMOD, pPTOBSERVA2, pPCAGENTE,
				pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_SET_SIN_TRAMITA_APOYO

	// --START-PAC_IAX_SINIESTROS.F_DEL_SIN_TRAMITA_APOYO(PSINTAPOY, PNSINIES,
	// PNTRAMIT)
	private HashMap callPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMITA_APOYO(java.math.BigDecimal pPSINTAPOY, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_SIN_TRAMITA_APOYO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTAPOY", "pPNSINIES", "pPNTRAMIT" },
				new Object[] { pPSINTAPOY, pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINTAPOY);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMITA_APOYO(java.math.BigDecimal pPSINTAPOY, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMITA_APOYO(pPSINTAPOY, pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SINIESTROS.F_DEL_SIN_TRAMITA_APOYO

	private HashMap callPAC_IAX_SINIESTROS__F_GET_CLASIFICASINIESTRO(String pPNSINIES, BigDecimal pPNPAGOS,
			BigDecimal pPNTRAMITA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_CLASIFICASINIESTRO(?, ?,?,?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNPAGOS);
		cStmt.setObject(4, pPNTRAMITA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "ULT_RESERVA"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("CLAS_SINIESTRO", cStmt.getObject(1));
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
		// f_get_inf_reaseguro
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_CLASIFICASINIESTRO(String pPNSINIES, BigDecimal pPNPAGOS,
			BigDecimal pPNTRAMITA) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_CLASIFICASINIESTRO(pPNSINIES, pPNPAGOS, pPNTRAMITA);
	}

	private HashMap callPAC_IAX_SINIESTROS__F_INS_ESTIMASINI(BigDecimal pPNSINIES, BigDecimal pPNTRAMIT,
			BigDecimal pPNMOVIMI, BigDecimal pPNMAXPP, BigDecimal pPNCONTIN, BigDecimal pPNRIESGO, String pPCOBSERV,
			BigDecimal pNCLASEPRO, BigDecimal pNINSTPROC, BigDecimal pNFALLOCP, BigDecimal pNCALMOT,
			java.sql.Date pFCONTINGEN, String pTOBSFALLO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_INS_ESTIMASINI(?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNMOVIMI", "pPNMAXPP", "pPNCONTIN", "pPNRIESGO", "pPCOBSERV",
						"pNCLASEPRO", "pNINSTPROC", "pNFALLOCP", "pNCALMOT", "pFCONTINGEN", "pTOBSFALLO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNMOVIMI, pPNMAXPP, pPNCONTIN, pPNRIESGO, pPCOBSERV, pNCLASEPRO,
						pNINSTPROC, pNFALLOCP, pNCALMOT, pFCONTINGEN, pTOBSFALLO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNMAXPP);
		cStmt.setObject(6, pPNCONTIN);
		cStmt.setObject(7, pPNRIESGO);
		cStmt.setObject(8, pPCOBSERV);
		cStmt.setObject(9, pNCLASEPRO);
		cStmt.setObject(10, pNINSTPROC);
		cStmt.setObject(11, pNFALLOCP);
		cStmt.setObject(12, pNCALMOT);
		cStmt.setObject(13, pFCONTINGEN);
		cStmt.setObject(14, pTOBSFALLO);

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
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_INS_ESTIMASINI(BigDecimal pPNSINIES, BigDecimal pPNTRAMIT,
			BigDecimal pPNMOVIMI, BigDecimal pPNMAXPP, BigDecimal pPNCONTIN, BigDecimal pPNRIESGO, String pPCOBSERV,
			BigDecimal pNCLASEPRO, BigDecimal pNINSTPROC, BigDecimal pNFALLOCP, BigDecimal pNCALMOT,
			java.sql.Date pFCONTINGEN, String pTOBSFALLO) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_INS_ESTIMASINI(pPNSINIES, pPNTRAMIT, pPNMOVIMI, pPNMAXPP, pPNCONTIN,
				pPNRIESGO, pPCOBSERV, pNCLASEPRO, pNINSTPROC, pNFALLOCP, pNCALMOT, pFCONTINGEN, pTOBSFALLO);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_SINIESTROS__F_GET_TRAMITA_ESTSINI(String pPNSINIES, BigDecimal pPNTRAMITA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_TRAMITA_ESTSINI(?,?,?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMITA" }, new Object[] { pPNSINIES, pPNTRAMITA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMITA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "ULT_RESERVA"
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
		// f_get_inf_reaseguro
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITA_ESTSINI(String pPNSINIES, BigDecimal pPNTRAMITA)
			throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_TRAMITA_ESTSINI(pPNSINIES, pPNTRAMITA);
	}

	private HashMap callPAC_IAX_SINIESTROS__F_GET_MAX_TRAMITA_ESTSINI(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_GET_MAX_TRAMITA_ESTSINI(?,?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "ULT_RESERVA"
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
		// f_get_inf_reaseguro
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_GET_MAX_TRAMITA_ESTSINI(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_GET_MAX_TRAMITA_ESTSINI(pPNSINIES);
	}

	private HashMap callPAC_IAX_SINIESTROS__F_DEL_LOCALIZACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLOCALI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SINIESTROS.F_DEL_LOCALIZACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLOCALI" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLOCALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLOCALI);
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

	public HashMap ejecutaPAC_IAX_SINIESTROS__F_DEL_LOCALIZACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLOCALI) throws Exception {
		return this.callPAC_IAX_SINIESTROS__F_DEL_LOCALIZACION(pPNSINIES, pPNTRAMIT, pPNLOCALI);// AXIS-WLS1SERVER-Ready
	}

}
