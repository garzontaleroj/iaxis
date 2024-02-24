package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_FORMULA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_SIN_FORMULA.class);
	private Connection conn = null;

	public PAC_IAX_SIN_FORMULA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_FORMULA.F_CAL_VALORA(PFSINIES, PSSEGURO, PNRIESGO,
	// PNSINIES, PNTRAMIT, PCTRAMIT, PSPRODUC, PCACTIVI, PCGARANT, PCCAUSIN,
	// PCMOTSIN, PFNOTIFI, PFECVAL, PFPERINI, PFPERFIN, PNDIAS, PIPERIT)
	private HashMap callPAC_IAX_SIN_FORMULA__F_CAL_VALORA(java.sql.Date pPFSINIES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN,
			java.sql.Date pPFNOTIFI, java.sql.Date pPFECVAL, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN,
			java.math.BigDecimal pPNDIAS, java.math.BigDecimal pPIPERIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_FORMULA.F_CAL_VALORA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPFSINIES", "pPSSEGURO", "pPNRIESGO", "pPNSINIES", "pPNTRAMIT", "pPCTRAMIT",
						"pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAUSIN", "pPCMOTSIN", "pPFNOTIFI", "pPFECVAL",
						"pPFPERINI", "pPFPERFIN", "pPNDIAS", "pPIPERIT" },
				new Object[] { pPFSINIES, pPSSEGURO, pPNRIESGO, pPNSINIES, pPNTRAMIT, pPCTRAMIT, pPSPRODUC, pPCACTIVI,
						pPCGARANT, pPCCAUSIN, pPCMOTSIN, pPFNOTIFI, pPFECVAL, pPFPERINI, pPFPERFIN, pPNDIAS,
						pPIPERIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFSINIES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPNSINIES);
		cStmt.setObject(6, pPNTRAMIT);
		cStmt.setObject(7, pPCTRAMIT);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPCACTIVI);
		cStmt.setObject(10, pPCGARANT);
		cStmt.setObject(11, pPCCAUSIN);
		cStmt.setObject(12, pPCMOTSIN);
		cStmt.setObject(13, pPFNOTIFI);
		cStmt.setObject(14, pPFECVAL);
		cStmt.setObject(15, pPFPERINI);
		cStmt.setObject(16, pPFPERFIN);
		cStmt.setObject(21, pPNDIAS);
		cStmt.setObject(22, pPIPERIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(17, java.sql.Types.NUMERIC); // Valor de "PIVALORA"
		cStmt.registerOutParameter(18, java.sql.Types.NUMERIC); // Valor de "PIPENALI"
		cStmt.registerOutParameter(19, java.sql.Types.NUMERIC); // Valor de "PICAPRIS"
		cStmt.registerOutParameter(20, java.sql.Types.NUMERIC); // Valor de "PIFRANQ"
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
			retVal.put("PIVALORA", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("PIVALORA", null);
		}
		try {
			retVal.put("PIPENALI", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PIPENALI", null);
		}
		try {
			retVal.put("PICAPRIS", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("PICAPRIS", null);
		}
		try {
			retVal.put("PIFRANQ", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("PIFRANQ", null);
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

	public HashMap ejecutaPAC_IAX_SIN_FORMULA__F_CAL_VALORA(java.sql.Date pPFSINIES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN,
			java.sql.Date pPFNOTIFI, java.sql.Date pPFECVAL, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN,
			java.math.BigDecimal pPNDIAS, java.math.BigDecimal pPIPERIT) throws Exception {
		return this.callPAC_IAX_SIN_FORMULA__F_CAL_VALORA(pPFSINIES, pPSSEGURO, pPNRIESGO, pPNSINIES, pPNTRAMIT,
				pPCTRAMIT, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAUSIN, pPCMOTSIN, pPFNOTIFI, pPFECVAL, pPFPERINI,
				pPFPERFIN, pPNDIAS, pPIPERIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_FORMULA.F_CAL_VALORA

	// --START-PAC_IAX_SIN_FORMULA.F_CAL_FECHAS_SINI(PFSINIES, PSSEGURO, PNRIESGO,
	// PNSINIES, PNTRAMIT, PCTRAMIT, PSPRODUC, PCACTIVI, PCGARANT, PCCAUSIN,
	// PCMOTSIN, PFNOTIFI, PFECVAL)
	private HashMap callPAC_IAX_SIN_FORMULA__F_CAL_FECHAS_SINI(java.sql.Date pPFSINIES, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN,
			java.sql.Date pPFNOTIFI, java.sql.Date pPFECVAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_FORMULA.F_CAL_FECHAS_SINI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPFSINIES", "pPSSEGURO", "pPNRIESGO", "pPNSINIES", "pPNTRAMIT", "pPCTRAMIT",
						"pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAUSIN", "pPCMOTSIN", "pPFNOTIFI", "pPFECVAL" },
				new Object[] { pPFSINIES, pPSSEGURO, pPNRIESGO, pPNSINIES, pPNTRAMIT, pPCTRAMIT, pPSPRODUC, pPCACTIVI,
						pPCGARANT, pPCCAUSIN, pPCMOTSIN, pPFNOTIFI, pPFECVAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFSINIES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPNSINIES);
		cStmt.setObject(6, pPNTRAMIT);
		cStmt.setObject(7, pPCTRAMIT);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPCACTIVI);
		cStmt.setObject(10, pPCGARANT);
		cStmt.setObject(11, pPCCAUSIN);
		cStmt.setObject(12, pPCMOTSIN);
		cStmt.setObject(13, pPFNOTIFI);
		cStmt.setObject(14, pPFECVAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.DATE); // Valor de "PFPERINI"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.DATE); // Valor de "PFPERFIN"
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
			retVal.put("PFPERINI", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PFPERINI", null);
		}
		try {
			retVal.put("PFPERFIN", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("PFPERFIN", null);
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

	public HashMap ejecutaPAC_IAX_SIN_FORMULA__F_CAL_FECHAS_SINI(java.sql.Date pPFSINIES,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.sql.Date pPFNOTIFI, java.sql.Date pPFECVAL) throws Exception {
		return this.callPAC_IAX_SIN_FORMULA__F_CAL_FECHAS_SINI(pPFSINIES, pPSSEGURO, pPNRIESGO, pPNSINIES, pPNTRAMIT,
				pPCTRAMIT, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAUSIN, pPCMOTSIN, pPFNOTIFI, pPFECVAL);
	}
	// --END-PAC_IAX_SIN_FORMULA.F_CAL_FECHAS_SINI

	// --START-PAC_IAX_SIN_FORMULA.F_CAL_PENALI(PCGARANT, PCTRAMIT, PNSINIES,
	// PIRESERVA, PFINI, PFFIN)
	private HashMap callPAC_IAX_SIN_FORMULA__F_CAL_PENALI(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT, String pPNSINIES, java.math.BigDecimal pPIRESERVA, java.sql.Date pPFINI,
			java.sql.Date pPFFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_FORMULA.F_CAL_PENALI(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCGARANT", "pPCTRAMIT", "pPNSINIES", "pPIRESERVA", "pPFINI", "pPFFIN" },
				new Object[] { pPCGARANT, pPCTRAMIT, pPNSINIES, pPIRESERVA, pPFINI, pPFFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
		cStmt.setObject(3, pPCTRAMIT);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPIRESERVA);
		cStmt.setObject(6, pPFINI);
		cStmt.setObject(7, pPFFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PIPENALI"
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
			retVal.put("PIPENALI", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PIPENALI", null);
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

	public HashMap ejecutaPAC_IAX_SIN_FORMULA__F_CAL_PENALI(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTRAMIT, String pPNSINIES, java.math.BigDecimal pPIRESERVA, java.sql.Date pPFINI,
			java.sql.Date pPFFIN) throws Exception {
		return this.callPAC_IAX_SIN_FORMULA__F_CAL_PENALI(pPCGARANT, pPCTRAMIT, pPNSINIES, pPIRESERVA, pPFINI, pPFFIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_FORMULA.F_CAL_PENALI

	// bug 0022674
	// --START-PAC_IAX_SIN_FORMULA.F_CAL_COSTE(PFSINIES, PCCAUSIN, PCMOTSIN,
	// PSPRODUC)
	private HashMap callPAC_IAX_SIN_FORMULA__F_CAL_COSTE(java.sql.Date pPFSINIES, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_FORMULA.F_CAL_COSTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFSINIES", "pPCCAUSIN", "pPCMOTSIN", "pPSPRODUC" },
				new Object[] { pPFSINIES, pPCCAUSIN, pPCMOTSIN, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFSINIES);
		cStmt.setObject(3, pPCCAUSIN);
		cStmt.setObject(4, pPCMOTSIN);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PICOSTE"
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
			retVal.put("PICOSTE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PICOSTE", null);
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

	public HashMap ejecutaPAC_IAX_SIN_FORMULA__F_CAL_COSTE(java.sql.Date pPFSINIES, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_SIN_FORMULA__F_CAL_COSTE(pPFSINIES, pPCCAUSIN, pPCMOTSIN, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_FORMULA.F_CAL_COSTE

}
