package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FONDOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_FONDOS.class);

	private Connection conn = null;

	public PAC_IAX_FONDOS(Connection conn) {
		this.conn = conn;
	}

	public HashMap ejecutaPAC_IAX_FONDOS__F_BUSCAR_FONDOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON, String pPTFONCMP, java.math.BigDecimal pPCMONEDA,
			java.math.BigDecimal pPCMANAGER, java.math.BigDecimal pPCDIVIDEND) throws Exception {
		return this.callPAC_IAX_FONDOS__F_BUSCAR_FONDOS(pPCEMPRES, pPCCODFON, pPTFONCMP, pPCMONEDA, pPCMANAGER,
				pPCDIVIDEND);// AXIS-WLS1SERVER-Ready
	}

	// --START-PAC_IAX_FONDOS.F_BUSCAR_FONDOS(PCEMPRES, PCCODFON, PTFONCMP,
	// PCMONEDA, PCMANAGER, PCDIVIDEND)
	private HashMap callPAC_IAX_FONDOS__F_BUSCAR_FONDOS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCODFON,
			String pPTFONCMP, java.math.BigDecimal pPCMONEDA, java.math.BigDecimal pPCMANAGER,
			java.math.BigDecimal pPCDIVIDEND) throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_BUSCAR_FONDOS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCODFON", "pPTFONCMP", "pPCMONEDA", "pPCMANAGER", "pPCDIVIDEND" },
				new Object[] { pPCEMPRES, pPCCODFON, pPTFONCMP, pPCMONEDA, pPCMANAGER, pPCDIVIDEND });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPTFONCMP);
		cStmt.setObject(5, pPCMONEDA);
		cStmt.setObject(6, pPCMANAGER);
		cStmt.setObject(7, pPCDIVIDEND);
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

	// --END-PAC_IAX_FONDOS.F_BUSCAR_FONDOS

	// --START-PAC_IAX_FONDOS.F_SET_FONDO(PCEMPRES, PCCODFON, PTFONABV, PTFONCMP,
	// PCMONEDA, PCMANAGER, PNMAXUNI, PIGASTTRAN, PFINICIO, PCCLSFON, PCTIPFON,
	// PCMODABO, PNDAYAFT, PNPERIODBON, PCDIVIDEND)
	private HashMap callPAC_IAX_FONDOS__F_SET_FONDO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCODFON,
			String pPTFONABV, String pPTFONCMP, java.math.BigDecimal pPCMONEDA, java.math.BigDecimal pPCMANAGER,
			java.math.BigDecimal pPNMAXUNI, java.math.BigDecimal pPIGASTTRAN, java.sql.Date pPFINICIO,
			java.math.BigDecimal pPCCLSFON, java.math.BigDecimal pPCTIPFON, java.math.BigDecimal pPCMODABO,
			java.math.BigDecimal pPNDAYAFT, java.math.BigDecimal pPNPERIODBON, java.math.BigDecimal pPCDIVIDEND)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_SET_FONDO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCODFON", "pPTFONABV", "pPTFONCMP", "pPCMONEDA", "pPCMANAGER",
						"pPNMAXUNI", "pPIGASTTRAN", "pPFINICIO", "pPCCLSFON", "pPCTIPFON", "pPCMODABO", "pPNDAYAFT",
						"pPNPERIODBON", "pPCDIVIDEND" },
				new Object[] { pPCEMPRES, pPCCODFON, pPTFONABV, pPTFONCMP, pPCMONEDA, pPCMANAGER, pPNMAXUNI,
						pPIGASTTRAN, pPFINICIO, pPCCLSFON, pPCTIPFON, pPCMODABO, pPNDAYAFT, pPNPERIODBON,
						pPCDIVIDEND });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPTFONABV);
		cStmt.setObject(5, pPTFONCMP);
		cStmt.setObject(6, pPCMONEDA);
		cStmt.setObject(7, pPCMANAGER);
		cStmt.setObject(8, pPNMAXUNI);
		cStmt.setObject(9, pPIGASTTRAN);
		cStmt.setObject(10, pPFINICIO);
		cStmt.setObject(11, pPCCLSFON);
		cStmt.setObject(12, pPCTIPFON);
		cStmt.setObject(13, pPCMODABO);
		cStmt.setObject(14, pPNDAYAFT);
		cStmt.setObject(15, pPNPERIODBON);
		cStmt.setObject(16, pPCDIVIDEND);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCCODFON"
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
			retVal.put("PCCODFON", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCCODFON", null);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_SET_FONDO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCODFON,
			String pPTFONABV, String pPTFONCMP, java.math.BigDecimal pPCMONEDA, java.math.BigDecimal pPCMANAGER,
			java.math.BigDecimal pPNMAXUNI, java.math.BigDecimal pPIGASTTRAN, java.sql.Date pPFINICIO,
			java.math.BigDecimal pPCCLSFON, java.math.BigDecimal pPCTIPFON, java.math.BigDecimal pPCMODABO,
			java.math.BigDecimal pPNDAYAFT, java.math.BigDecimal pPNPERIODBON, java.math.BigDecimal pPCDIVIDEND)
			throws Exception {
		return this.callPAC_IAX_FONDOS__F_SET_FONDO(pPCEMPRES, pPCCODFON, pPTFONABV, pPTFONCMP, pPCMONEDA, pPCMANAGER,
				pPNMAXUNI, pPIGASTTRAN, pPFINICIO, pPCCLSFON, pPCTIPFON, pPCMODABO, pPNDAYAFT, pPNPERIODBON,
				pPCDIVIDEND);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FONDOS.F_SET_FONDO

	// --START-PAC_IAX_FONDOS.F_GET_FONDO(PCEMPRES, PCCODFON)
	private HashMap callPAC_IAX_FONDOS__F_GET_FONDO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCODFON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_GET_FONDO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCODFON" }, new Object[] { pPCEMPRES, pPCCODFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTFONABV"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PTFONCMP"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCMONEDA"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PCMANAGER"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PNMAXUNI"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PIGASTTRAN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.DATE); // Valor de "PFINICIO"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "PCCLSFON"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de "PCTIPFON"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de "PCMODABO"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PNDAYAFT"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de "PNPERIODBON"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de "PCDIVIDEND"
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
			retVal.put("PTFONABV", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTFONABV", null);
		}
		try {
			retVal.put("PTFONCMP", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PTFONCMP", null);
		}
		try {
			retVal.put("PCMONEDA", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCMONEDA", null);
		}
		try {
			retVal.put("PCMANAGER", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCMANAGER", null);
		}
		try {
			retVal.put("PNMAXUNI", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PNMAXUNI", null);
		}
		try {
			retVal.put("PIGASTTRAN", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PIGASTTRAN", null);
		}
		try {
			retVal.put("PFINICIO", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PFINICIO", null);
		}
		try {
			retVal.put("PCCLSFON", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PCCLSFON", null);
		}
		try {
			retVal.put("PCTIPFON", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PCTIPFON", null);
		}
		try {
			retVal.put("PCMODABO", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PCMODABO", null);
		}
		try {
			retVal.put("PNDAYAFT", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PNDAYAFT", null);
		}
		try {
			retVal.put("PNPERIODBON", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PNPERIODBON", null);
		}
		try {
			retVal.put("PCDIVIDEND", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("PCDIVIDEND", null);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_GET_FONDO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCODFON)
			throws Exception {
		return this.callPAC_IAX_FONDOS__F_GET_FONDO(pPCEMPRES, pPCCODFON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FONDOS.F_GET_FONDO

	// --START-PAC_IAX_FONDOS.F_SET_MODELINV(PSPRODUC, PCMODINV, PIDIOMAS)
	private HashMap callPAC_IAX_FONDOS__F_SET_MODELINV(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCMODINV,
			Object pPIDIOMAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_SET_MODELINV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCMODINV", "pPIDIOMAS" },
				new Object[] { pPSPRODUC, pPCMODINV, pPIDIOMAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCMODINV);
		cStmt.setObject(4, pPIDIOMAS);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_SET_MODELINV(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCMODINV,
			Object pPIDIOMAS) throws Exception {
		return this.callPAC_IAX_FONDOS__F_SET_MODELINV(pPSPRODUC, pPCMODINV, pPIDIOMAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FONDOS.F_SET_MODELINV

	// --START-PAC_IAX_FONDOS.F_GET_MODINVFONDOS(PSPRODUC, PCMODINV, MENSAJES)
	private HashMap callPAC_IAX_FONDOS__F_GET_MODINVFONDOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV) throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_GET_MODINVFONDOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCMODINV" }, new Object[] { pPSPRODUC, pPCMODINV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCMODINV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODULKMODINVFONDO".toUpperCase())); // Valor de "PMODINVFONDO"
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
			retVal.put("PMODINVFONDO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMODINVFONDO", null);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_GET_MODINVFONDOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV) throws Exception {
		return this.callPAC_IAX_FONDOS__F_GET_MODINVFONDOS(pPSPRODUC, pPCMODINV);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FONDOS.F_GET_MODINVFONDOS
	// --START-PAC_IAX_FONDOS.F_SET_MODINVFONDOS(PSPRODUC, PCMODINV, PMODINVFONDO)
	private HashMap callPAC_IAX_FONDOS__F_SET_MODINVFONDOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV, Object pPMODINVFONDO) throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_SET_MODINVFONDOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCMODINV", "pPMODINVFONDO" },
				new Object[] { pPSPRODUC, pPCMODINV, pPMODINVFONDO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCMODINV);
		cStmt.setObject(4, pPMODINVFONDO);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_SET_MODINVFONDOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV, Object pPMODINVFONDO) throws Exception {
		return this.callPAC_IAX_FONDOS__F_SET_MODINVFONDOS(pPSPRODUC, pPCMODINV, pPMODINVFONDO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FONDOS.F_SET_MODINVFONDOS
	// --START-PAC_IAX_FONDOS.F_GET_MODINVFONDOS(PSPRODUC, PCMODINV, MENSAJES)
	private HashMap callPAC_IAX_FONDOS__F_GET_MODINVFONDOSSEG(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV) throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_GET_MODINVFONDOSSEG(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCMODINV" }, new Object[] { pPSPRODUC, pPCMODINV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCMODINV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODULKMODINVFONDO".toUpperCase())); // Valor de "PMODINVFONDO"
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
			retVal.put("PMODINVFONDO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMODINVFONDO", null);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_GET_MODINVFONDOSSEG(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV) throws Exception {
		return this.callPAC_IAX_FONDOS__F_GET_MODINVFONDOSSEG(pPSPRODUC, pPCMODINV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FONDOS.F_GET_MODINVFONDOS

	// --START-PAC_IAX_FONDOS.F_GET_MODINVFONDOS(PSPRODUC, PCMODINV, MENSAJES)
	private HashMap callPAC_IAX_FONDOS__F_GET_MODINVFONDOS2(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV) throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_GET_MODINVFONDOS2(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCMODINV" }, new Object[] { pPSPRODUC, pPCMODINV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCMODINV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODULKMODINVFONDO".toUpperCase())); // Valor de "PMODINVFONDO"
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
			retVal.put("PMODINVFONDO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMODINVFONDO", null);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_GET_MODINVFONDOS2(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMODINV) throws Exception {
		return this.callPAC_IAX_FONDOS__F_GET_MODINVFONDOS2(pPSPRODUC, pPCMODINV);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_FONDOS__F_ASIGN_DIVIDENDS(String pPMODO, Object pPLSTFONDOS, java.sql.Date pPFVIGENCIA,
			java.sql.Date pPFVALMOV, java.math.BigDecimal pPIIMPDIV) throws Exception {
		String callQuery = "{?=call PAC_IAX_FONDOS.F_ASIGN_DIVIDENDS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMODO", "pPLSTFONDOS", "pPFVIGENCIA", "pPFVALMOV", "pPIIMPDIV" },
				new Object[] { pPMODO, pPLSTFONDOS, pPFVIGENCIA, pPFVALMOV, pPIIMPDIV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMODO);
		cStmt.setObject(3, pPLSTFONDOS);
		cStmt.setObject(4, pPFVIGENCIA);
		cStmt.setObject(5, pPFVALMOV);
		cStmt.setObject(6, pPIIMPDIV);
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

	public HashMap ejecutaPAC_IAX_FONDOS__F_ASIGN_DIVIDENDS(String pPMODO, Object pPLSTFONDOS,
			java.sql.Date pPFVIGENCIA, java.sql.Date pPFVALMOV, java.math.BigDecimal pPIIMPDIV) throws Exception {
		return this.callPAC_IAX_FONDOS__F_ASIGN_DIVIDENDS(pPMODO, pPLSTFONDOS, pPFVIGENCIA, pPFVALMOV, pPIIMPDIV);// AXIS-WLS1SERVER-Ready
	}
}
