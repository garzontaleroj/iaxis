package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_VALIDACIONES_SIN extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_VALIDACIONES.class);
	private Connection conn = null;

	public PAC_IAX_VALIDACIONES_SIN(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_VALIDACIONES_SIN.F_AGENDA(PCTIPREG, PCMANUAL, PCESTAGE,
	// PFFINAGE, PTTITAGE, PTLINAGE, PSIDEPAG)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_AGENDA(java.math.BigDecimal pPCTIPREG,
			java.math.BigDecimal pPCMANUAL, java.math.BigDecimal pPCESTAGE, java.sql.Date pPFFINAGE, String pPTTITAGE,
			String pPTLINAGE, java.math.BigDecimal pPSIDEPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_AGENDA(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPREG", "pPCMANUAL", "pPCESTAGE", "pPFFINAGE", "pPTTITAGE", "pPTLINAGE",
						"pPSIDEPAG" },
				new Object[] { pPCTIPREG, pPCMANUAL, pPCESTAGE, pPFFINAGE, pPTTITAGE, pPTLINAGE, pPSIDEPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPREG);
		cStmt.setObject(3, pPCMANUAL);
		cStmt.setObject(4, pPCESTAGE);
		cStmt.setObject(5, pPFFINAGE);
		cStmt.setObject(6, pPTTITAGE);
		cStmt.setObject(7, pPTLINAGE);
		cStmt.setObject(8, pPSIDEPAG);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_AGENDA(java.math.BigDecimal pPCTIPREG,
			java.math.BigDecimal pPCMANUAL, java.math.BigDecimal pPCESTAGE, java.sql.Date pPFFINAGE, String pPTTITAGE,
			String pPTLINAGE, java.math.BigDecimal pPSIDEPAG) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_AGENDA(pPCTIPREG, pPCMANUAL, pPCESTAGE, pPFFINAGE, pPTTITAGE,
				pPTLINAGE, pPSIDEPAG);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_AGENDA
	// --START-PAC_IAX_VALIDACIONES_SIN.F_CABECERAPAGO(PNSINIES, PNTRAMIT, PCTIPPAG,
	// PCTIPDES, PCCONPAG, PCCAUIND, PCFORPAG, PCBANCAR, PFORDEN)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_CABECERAPAGO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCCONPAG,
			java.math.BigDecimal pPCCAUIND, java.math.BigDecimal pPCFORPAG, String pPCBANCAR, java.sql.Date pPFORDEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_CABECERAPAGO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPPAG", "pPCTIPDES", "pPCCONPAG", "pPCCAUIND",
						"pPCFORPAG", "pPCBANCAR", "pPFORDEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPPAG, pPCTIPDES, pPCCONPAG, pPCCAUIND, pPCFORPAG, pPCBANCAR,
						pPFORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPPAG);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPCCONPAG);
		cStmt.setObject(7, pPCCAUIND);
		cStmt.setObject(8, pPCFORPAG);
		cStmt.setObject(9, pPCBANCAR);
		cStmt.setObject(10, pPFORDEN);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_CABECERAPAGO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCCONPAG,
			java.math.BigDecimal pPCCAUIND, java.math.BigDecimal pPCFORPAG, String pPCBANCAR, java.sql.Date pPFORDEN)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_CABECERAPAGO(pPNSINIES, pPNTRAMIT, pPCTIPPAG, pPCTIPDES, pPCCONPAG,
				pPCCAUIND, pPCFORPAG, pPCBANCAR, pPFORDEN);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_CABECERAPAGO
	// --START-PAC_IAX_VALIDACIONES_SIN.F_CABECERASINI(PFSINIES, PFNOTIFI, PCCAUSIN,
	// PCMOTSIN, PSSEGURO)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_CABECERASINI(java.sql.Date pPFSINIES, java.sql.Date pPFNOTIFI,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_CABECERASINI(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFSINIES", "pPFNOTIFI", "pPCCAUSIN", "pPCMOTSIN", "pPSSEGURO" },
				new Object[] { pPFSINIES, pPFNOTIFI, pPCCAUSIN, pPCMOTSIN, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFSINIES);
		cStmt.setObject(3, pPFNOTIFI);
		cStmt.setObject(4, pPCCAUSIN);
		cStmt.setObject(5, pPCMOTSIN);
		cStmt.setObject(6, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_CABECERASINI(java.sql.Date pPFSINIES, java.sql.Date pPFNOTIFI,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_CABECERASINI(pPFSINIES, pPFNOTIFI, pPCCAUSIN, pPCMOTSIN, pPSSEGURO);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_CABECERASINI
	// --START-PAC_IAX_VALIDACIONES_SIN.F_CALCIMPORTERES(PCTIPRES, PCGARANT,
	// PFRESINI, PFRESFIN, PSPRODUC)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_CALCIMPORTERES(java.math.BigDecimal pPCTIPRES,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFRESINI, java.sql.Date pPFRESFIN,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_CALCIMPORTERES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPRES", "pPCGARANT", "pPFRESINI", "pPFRESFIN", "pPSPRODUC" },
				new Object[] { pPCTIPRES, pPCGARANT, pPFRESINI, pPFRESFIN, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPRES);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPFRESINI);
		cStmt.setObject(5, pPFRESFIN);
		cStmt.setObject(6, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_CALCIMPORTERES(java.math.BigDecimal pPCTIPRES,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFRESINI, java.sql.Date pPFRESFIN,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_CALCIMPORTERES(pPCTIPRES, pPCGARANT, pPFRESINI, pPFRESFIN,
				pPSPRODUC);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_CALCIMPORTERES
	// --START-PAC_IAX_VALIDACIONES_SIN.F_DANDETTRAMI(PNSINIES, PNTRAMIT, PNDANO,
	// PNDETDANO)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_DANDETTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDANO, java.math.BigDecimal pPNDETDANO) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_DANDETTRAMI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDANO", "pPNDETDANO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDANO, pPNDETDANO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDANO);
		cStmt.setObject(5, pPNDETDANO);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_DANDETTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNDANO, java.math.BigDecimal pPNDETDANO) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_DANDETTRAMI(pPNSINIES, pPNTRAMIT, pPNDANO, pPNDETDANO);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_DANDETTRAMI
	// --START-PAC_IAX_VALIDACIONES_SIN.F_DANTRAMI(PNSINIES, PNTRAMIT, PTDANO)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_DANTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			String pPTDANO) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_DANTRAMI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPTDANO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPTDANO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPTDANO);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_DANTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			String pPTDANO) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_DANTRAMI(pPNSINIES, pPNTRAMIT, pPTDANO);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_DANTRAMI
	// --START-PAC_IAX_VALIDACIONES_SIN.F_DEST(PNSINIES, PNTRAMIT, PCCAUSA,
	// PCTIPDES, PCACTPRO, PSPERSON, PPASIGNA, PCPAISRE, PCBANCAR)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_DEST(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCCAUSA, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCACTPRO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPPASIGNA, java.math.BigDecimal pPCPAISRE,
			String pPCBANCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_DEST(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPCCAUSA", "pPCTIPDES", "pPCACTPRO", "pPSPERSON", "pPPASIGNA",
						"pPCPAISRE", "pPCBANCAR" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCCAUSA, pPCTIPDES, pPCACTPRO, pPSPERSON, pPPASIGNA, pPCPAISRE,
						pPCBANCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCCAUSA);
		cStmt.setObject(5, pPCTIPDES);
		cStmt.setObject(6, pPCACTPRO);
		cStmt.setObject(7, pPSPERSON);
		cStmt.setObject(8, pPPASIGNA);
		cStmt.setObject(9, pPCPAISRE);
		cStmt.setObject(10, pPCBANCAR);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_DEST(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCCAUSA, java.math.BigDecimal pPCTIPDES, java.math.BigDecimal pPCACTPRO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPPASIGNA, java.math.BigDecimal pPCPAISRE,
			String pPCBANCAR) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_DEST(pPNSINIES, pPNTRAMIT, pPCCAUSA, pPCTIPDES, pPCACTPRO,
				pPSPERSON, pPPASIGNA, pPCPAISRE, pPCBANCAR);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_DEST
	// --START-PAC_IAX_VALIDACIONES_SIN.F_DETPAGO(PNSINIES, PIRESERVA, PIRETENC,
	// PFPERFIN, PCCAUSA, PIRESRCM, PIRESRED)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_DETPAGO(String pPNSINIES, java.math.BigDecimal pPIRESERVA,
			java.math.BigDecimal pPIRETENC, java.sql.Date pPFPERFIN, java.math.BigDecimal pPCCAUSA,
			java.math.BigDecimal pPIRESRCM, java.math.BigDecimal pPIRESRED) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_DETPAGO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPIRESERVA", "pPIRETENC", "pPFPERFIN", "pPCCAUSA", "pPIRESRCM",
						"pPIRESRED" },
				new Object[] { pPNSINIES, pPIRESERVA, pPIRETENC, pPFPERFIN, pPCCAUSA, pPIRESRCM, pPIRESRED });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPIRESERVA);
		cStmt.setObject(4, pPIRETENC);
		cStmt.setObject(5, pPFPERFIN);
		cStmt.setObject(6, pPCCAUSA);
		cStmt.setObject(7, pPIRESRCM);
		cStmt.setObject(8, pPIRESRED);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_DETPAGO(String pPNSINIES, java.math.BigDecimal pPIRESERVA,
			java.math.BigDecimal pPIRETENC, java.sql.Date pPFPERFIN, java.math.BigDecimal pPCCAUSA,
			java.math.BigDecimal pPIRESRCM, java.math.BigDecimal pPIRESRED) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_DETPAGO(pPNSINIES, pPIRESERVA, pPIRETENC, pPFPERFIN, pPCCAUSA,
				pPIRESRCM, pPIRESRED);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_DETPAGO
	// --START-PAC_IAX_VALIDACIONES_SIN.F_LOCTRAMI(PTNOMVIA, PCSIGLAS, PCPOBLAC,
	// PCPROVIN, PCPAIS, PTDIREC)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_LOCTRAMI(String pPTNOMVIA, java.math.BigDecimal pPCSIGLAS,
			java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS,
			String pPTDIREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_LOCTRAMI(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTNOMVIA", "pPCSIGLAS", "pPCPOBLAC", "pPCPROVIN", "pPCPAIS", "pPTDIREC" },
				new Object[] { pPTNOMVIA, pPCSIGLAS, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPTDIREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTNOMVIA);
		cStmt.setObject(3, pPCSIGLAS);
		cStmt.setObject(4, pPCPOBLAC);
		cStmt.setObject(5, pPCPROVIN);
		cStmt.setObject(6, pPCPAIS);
		cStmt.setObject(7, pPTDIREC);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_LOCTRAMI(String pPTNOMVIA, java.math.BigDecimal pPCSIGLAS,
			java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS,
			String pPTDIREC) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_LOCTRAMI(pPTNOMVIA, pPCSIGLAS, pPCPOBLAC, pPCPROVIN, pPCPAIS,
				pPTDIREC);
	}

	// --END-PAC_IAX_VALIDACIONES_SIN.F_LOCTRAMI
	// --START-PAC_IAX_VALIDACIONES_SIN.F_MOVPAGO(PSIDEPAG, PCESTPAG, PCESTVAL,
	// PCSUBPAG)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_MOVPAGO(java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCESTPAG, java.math.BigDecimal pPCESTVAL, java.math.BigDecimal pPCSUBPAG)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_MOVPAGO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSIDEPAG", "pPCESTPAG", "pPCESTVAL", "pPCSUBPAG" },
				new Object[] { pPSIDEPAG, pPCESTPAG, pPCESTVAL, pPCSUBPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDEPAG);
		cStmt.setObject(3, pPCESTPAG);
		cStmt.setObject(4, pPCESTVAL);
		cStmt.setObject(5, pPCSUBPAG);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_MOVPAGO(java.math.BigDecimal pPSIDEPAG,
			java.math.BigDecimal pPCESTPAG, java.math.BigDecimal pPCESTVAL, java.math.BigDecimal pPCSUBPAG)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_MOVPAGO(pPSIDEPAG, pPCESTPAG, pPCESTVAL, pPCSUBPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_MOVPAGO

	// --START-PAC_IAX_VALIDACIONES_SIN.F_MOVSINI(PCESTSIN, PFESTSIN, PCUNITRA,
	// PCTRAMITAD)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_MOVSINI(java.math.BigDecimal pPCESTSIN, java.sql.Date pPFESTSIN,
			String pPCUNITRA, String pPCTRAMITAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_MOVSINI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCESTSIN", "pPFESTSIN", "pPCUNITRA", "pPCTRAMITAD" },
				new Object[] { pPCESTSIN, pPFESTSIN, pPCUNITRA, pPCTRAMITAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESTSIN);
		cStmt.setObject(3, pPFESTSIN);
		cStmt.setObject(4, pPCUNITRA);
		cStmt.setObject(5, pPCTRAMITAD);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_MOVSINI(java.math.BigDecimal pPCESTSIN, java.sql.Date pPFESTSIN,
			String pPCUNITRA, String pPCTRAMITAD) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_MOVSINI(pPCESTSIN, pPFESTSIN, pPCUNITRA, pPCTRAMITAD);
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_MOVSINI

	// --START-PAC_IAX_VALIDACIONES_SIN.F_MOVTRAMI(PNSINIES, PNTRAMIT, PCESTTRA,
	// PPAGOS, PCSUBTRA)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_MOVTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCESTTRA, java.math.BigDecimal pPPAGOS, java.math.BigDecimal pPCSUBTRA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_MOVTRAMI(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCESTTRA", "pPPAGOS", "pPCSUBTRA" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCESTTRA, pPPAGOS, pPCSUBTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCESTTRA);
		cStmt.setObject(5, pPPAGOS);
		cStmt.setObject(6, pPCSUBTRA);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_MOVTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCESTTRA, java.math.BigDecimal pPPAGOS, java.math.BigDecimal pPCSUBTRA)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_MOVTRAMI(pPNSINIES, pPNTRAMIT, pPCESTTRA, pPPAGOS, pPCSUBTRA);
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_MOVTRAMI

	// --START-PAC_IAX_VALIDACIONES_SIN.F_RESTRAMI(PNSINIES, PNTRAMIT, PCCAUSA,
	// PCTIPRES, PCGARANT, PCCALRES, PIRESERVA, PICAPRIE, PIPENALI, PDINICI, PDFI,
	// PCMONRES, PTORIGEN, PNDIAS)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_RESTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCCAUSA, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCCALRES, java.math.BigDecimal pPIRESERVA, java.math.BigDecimal pPICAPRIE,
			java.math.BigDecimal pPIPENALI, java.sql.Date pPDINICI, java.sql.Date pPDFI, String pPCMONRES,
			String pPTORIGEN, java.math.BigDecimal pPNDIAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_RESTRAMI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCCAUSA", "pPCTIPRES", "pPCGARANT", "pPCCALRES",
				"pPIRESERVA", "pPICAPRIE", "pPIPENALI", "pPDINICI", "pPDFI", "pPCMONRES", "pPTORIGEN", "pPNDIAS" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCCAUSA, pPCTIPRES, pPCGARANT, pPCCALRES, pPIRESERVA, pPICAPRIE,
						pPIPENALI, pPDINICI, pPDFI, pPCMONRES, pPTORIGEN, pPNDIAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCCAUSA);
		cStmt.setObject(5, pPCTIPRES);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPCCALRES);
		cStmt.setObject(8, pPIRESERVA);
		cStmt.setObject(9, pPICAPRIE);
		cStmt.setObject(10, pPIPENALI);
		cStmt.setObject(11, pPDINICI);
		cStmt.setObject(12, pPDFI);
		cStmt.setObject(13, pPCMONRES);
		cStmt.setObject(14, pPTORIGEN);
		cStmt.setObject(15, pPNDIAS);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_RESTRAMI(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCCAUSA, java.math.BigDecimal pPCTIPRES, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCCALRES, java.math.BigDecimal pPIRESERVA, java.math.BigDecimal pPICAPRIE,
			java.math.BigDecimal pPIPENALI, java.sql.Date pPDINICI, java.sql.Date pPDFI, String pPCMONRES,
			String pPTORIGEN, java.math.BigDecimal pPNDIAS) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_RESTRAMI(pPNSINIES, pPNTRAMIT, pPCCAUSA, pPCTIPRES, pPCGARANT,
				pPCCALRES, pPIRESERVA, pPICAPRIE, pPIPENALI, pPDINICI, pPDFI, pPCMONRES, pPTORIGEN, pPNDIAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_RESTRAMI

	// --START-PAC_IAX_VALIDACIONES_SIN.F_TRASINI(PCTIPTRA, PCTCAUSIN, PCINFORM,
	// PTTRAMITA, PSPERSON, PMARCA, PMODEL, PTNOMVIA, PCSIGLAS, PCPOBLAC, PCPROVIN,
	// PCPAIS, PTDIREC)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_TRASINI(java.math.BigDecimal pPCTIPTRA,
			java.math.BigDecimal pPCTCAUSIN, java.math.BigDecimal pPCINFORM, String pPTTRAMITA,
			java.math.BigDecimal pPSPERSON, String pPMARCA, String pPMODEL, String pPTNOMVIA,
			java.math.BigDecimal pPCSIGLAS, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPAIS, String pPTDIREC, java.math.BigDecimal pPCCOMPANI, String pPCPOLCIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_TRASINI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPTRA", "pPCTCAUSIN", "pPCINFORM", "pPTTRAMITA", "pPSPERSON", "pPMARCA", "pPMODEL",
						"pPTNOMVIA", "pPCSIGLAS", "pPCPOBLAC", "pPCPROVIN", "pPCPAIS", "pPTDIREC", "pPCCOMPANI",
						"pPCPOLCIA" },
				new Object[] { pPCTIPTRA, pPCTCAUSIN, pPCINFORM, pPTTRAMITA, pPSPERSON, pPMARCA, pPMODEL, pPTNOMVIA,
						pPCSIGLAS, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPTDIREC, pPCCOMPANI, pPCPOLCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPTRA);
		cStmt.setObject(3, pPCTCAUSIN);
		cStmt.setObject(4, pPCINFORM);
		cStmt.setObject(5, pPTTRAMITA);
		cStmt.setObject(6, pPSPERSON);
		cStmt.setObject(7, pPMARCA);
		cStmt.setObject(8, pPMODEL);
		cStmt.setObject(9, pPTNOMVIA);
		cStmt.setObject(10, pPCSIGLAS);
		cStmt.setObject(11, pPCPOBLAC);
		cStmt.setObject(12, pPCPROVIN);
		cStmt.setObject(13, pPCPAIS);
		cStmt.setObject(14, pPTDIREC);
		cStmt.setObject(15, pPCCOMPANI);
		cStmt.setObject(16, pPCPOLCIA);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_TRASINI(java.math.BigDecimal pPCTIPTRA,
			java.math.BigDecimal pPCTCAUSIN, java.math.BigDecimal pPCINFORM, String pPTTRAMITA,
			java.math.BigDecimal pPSPERSON, String pPMARCA, String pPMODEL, String pPTNOMVIA,
			java.math.BigDecimal pPCSIGLAS, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPAIS, String pPTDIREC, java.math.BigDecimal pPCCOMPANI, String pPCPOLCIA)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_TRASINI(pPCTIPTRA, pPCTCAUSIN, pPCINFORM, pPTTRAMITA, pPSPERSON,
				pPMARCA, pPMODEL, pPTNOMVIA, pPCSIGLAS, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPTDIREC, pPCCOMPANI, pPCPOLCIA);
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_TRASINI

	// --START-PAC_IAX_VALIDACIONES_SIN.F_VALIDA_DECLARANTE(PSSEGURO, PCTIPDEC,
	// PCGARANT)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_VALIDA_DECLARANTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPDEC, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_VALIDA_DECLARANTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCTIPDEC", "pPCGARANT" },
				new Object[] { pPSSEGURO, pPCTIPDEC, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCTIPDEC);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_VALIDA_DECLARANTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPDEC, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_VALIDA_DECLARANTE(pPSSEGURO, pPCTIPDEC, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_VALIDA_DECLARANTE

	// --START-PAC_IAX_VALIDACIONES_SIN.F_VALIDA_GARANTIA(PSSEGURO, PNRIESGO,
	// PCGARANT, PNDIAS, PFSINIES, PFRESINI, PFRESFIN, PORIGEN)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_VALIDA_GARANTIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNDIAS,
			java.sql.Date pPFSINIES, java.sql.Date pPFRESINI, java.sql.Date pPFRESFIN, String pPORIGEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_VALIDA_GARANTIA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPCGARANT", "pPNDIAS", "pPFSINIES", "pPFRESINI", "pPFRESFIN",
						"pPORIGEN" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCGARANT, pPNDIAS, pPFSINIES, pPFRESINI, pPFRESFIN, pPORIGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPNDIAS);
		cStmt.setObject(6, pPFSINIES);
		cStmt.setObject(7, pPFRESINI);
		cStmt.setObject(8, pPFRESFIN);
		cStmt.setObject(9, pPORIGEN);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_VALIDA_GARANTIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNDIAS,
			java.sql.Date pPFSINIES, java.sql.Date pPFRESINI, java.sql.Date pPFRESFIN, String pPORIGEN)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_VALIDA_GARANTIA(pPSSEGURO, pPNRIESGO, pPCGARANT, pPNDIAS, pPFSINIES,
				pPFRESINI, pPFRESFIN, pPORIGEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_VALIDA_GARANTIA

	// --START-PAC_IAX_VALIDACIONES_SIN.F_VAL_ASEG_INNOMINADO(PSPERSON)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_VAL_ASEG_INNOMINADO(java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_VAL_ASEG_INNOMINADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PMENSAJE"
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
			retVal.put("PMENSAJE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PMENSAJE", null);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_VAL_ASEG_INNOMINADO(java.math.BigDecimal pPSPERSON)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_VAL_ASEG_INNOMINADO(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_VAL_ASEG_INNOMINADO

	// --START-PAC_IAX_VALIDACIONES_SIN.F_VALIDA_ULT_TRA(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_VALIDACIONES_SIN__F_VALIDA_ULT_TRA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES_SIN.F_VALIDA_ULT_TRA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTLITERA"
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
			retVal.put("PTLITERA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTLITERA", null);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES_SIN__F_VALIDA_ULT_TRA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES_SIN__F_VALIDA_ULT_TRA(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES_SIN.F_VALIDA_ULT_TRA

}
