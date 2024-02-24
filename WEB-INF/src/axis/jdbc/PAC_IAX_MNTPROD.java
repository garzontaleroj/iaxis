package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MNTPROD extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MNTPROD.class);
	private Connection conn = null;

	public PAC_IAX_MNTPROD(Connection conn) {
		this.conn = conn;
	}
	// --START-PAC_IAX_MNTPROD.F_GET_DOCUMENTOS(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_DOCUMENTOS(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DOCUMENTOS(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DOCUMENTOS(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DOCUMENTOS(pPSPRODUC); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DOCUMENTOS

	// --START-PAC_IAX_MNTPROD.F_DELETE_COMPANIPRO(PSPRODUC, PCCOMPANI, PSPRODUCESP)

	private HashMap callPAC_IAX_MNTPROD__F_DELETE_COMPANIPRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSPRODUCESP) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DELETE_COMPANIPRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCCOMPANI", "pPSPRODUCESP" },
				new Object[] { pPSPRODUC, pPCCOMPANI, pPSPRODUCESP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPSPRODUCESP);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DELETE_COMPANIPRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSPRODUCESP) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DELETE_COMPANIPRO(pPSPRODUC, pPCCOMPANI, pPSPRODUCESP);
	}
	// --END-PAC_IAX_MNTPROD.F_DELETE_COMPANIPRO

	// --START-PAC_IAX_MNTPROD.F_INSERT_COMPANIPRO(PSPRODUC, PCCOMPANI, PCAGENCORR,
	// PSPRODUCESP)

	private HashMap callPAC_IAX_MNTPROD__F_INSERT_COMPANIPRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCOMPANI, String pPCAGENCORR, java.math.BigDecimal pPSPRODUCESP) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_INSERT_COMPANIPRO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCCOMPANI", "pPCAGENCORR", "pPSPRODUCESP" },
				new Object[] { pPSPRODUC, pPCCOMPANI, pPCAGENCORR, pPSPRODUCESP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPCAGENCORR);
		cStmt.setObject(5, pPSPRODUCESP);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_INSERT_COMPANIPRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCOMPANI, String pPCAGENCORR, java.math.BigDecimal pPSPRODUCESP) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_INSERT_COMPANIPRO(pPSPRODUC, pPCCOMPANI, pPCAGENCORR, pPSPRODUCESP);
	}
	// --END-PAC_IAX_MNTPROD.F_INSERT_COMPANIPRO

	// --START-PAC_IAX_MNTPROD.F_GET_CONSULTA(PCEMPRESA, PCRAMO, PCAGRPRO, PCACTIVO,
	// CCOMPANI)

	private HashMap callPAC_IAX_MNTPROD__F_GET_CONSULTA(java.math.BigDecimal pPCEMPRESA, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCAGRPRO, java.math.BigDecimal pPCACTIVO, java.math.BigDecimal pCCOMPANI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_CONSULTA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRESA", "pPCRAMO", "pPCAGRPRO", "pPCACTIVO", "pCCOMPANI" },
				new Object[] { pPCEMPRESA, pPCRAMO, pPCAGRPRO, pPCACTIVO, pCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRESA);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPCAGRPRO);
		cStmt.setObject(5, pPCACTIVO);
		cStmt.setObject(6, pCCOMPANI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA(java.math.BigDecimal pPCEMPRESA, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCAGRPRO, java.math.BigDecimal pPCACTIVO, java.math.BigDecimal pCCOMPANI)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_CONSULTA(pPCEMPRESA, pPCRAMO, pPCAGRPRO, pPCACTIVO, pCCOMPANI);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_CONSULTA

	// --START-PAC_IAX_MNTPROD.F_GET_DETAILACTIVID(PSPRODUC, PCACTIVI)

	// --START-PAC_IAX_MNTPROD.F_GET_CONSULTA_FILTRADO(PCEMPRESA, PCRAMO, PCAGRPRO,
	// PCACTIVO, CCOMPANI)
	private HashMap callPAC_IAX_MNTPROD__F_GET_CONSULTA_FILTRADO(java.math.BigDecimal pPCEMPRESA,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCAGRPRO, java.math.BigDecimal pPCACTIVO,
			java.math.BigDecimal pCCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_CONSULTA_FILTRADO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRESA", "pPCRAMO", "pPCAGRPRO", "pPCACTIVO", "pCCOMPANI" },
				new Object[] { pPCEMPRESA, pPCRAMO, pPCAGRPRO, pPCACTIVO, pCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRESA);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPCAGRPRO);
		cStmt.setObject(5, pPCACTIVO);
		cStmt.setObject(6, pCCOMPANI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA_FILTRADO(java.math.BigDecimal pPCEMPRESA,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCAGRPRO, java.math.BigDecimal pPCACTIVO,
			java.math.BigDecimal pCCOMPANI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_CONSULTA_FILTRADO(pPCEMPRESA, pPCRAMO, pPCAGRPRO, pPCACTIVO, pCCOMPANI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_GET_CONSULTA_FILTRADO

	private HashMap callPAC_IAX_MNTPROD__F_GET_DETAILACTIVID(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DETAILACTIVID(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODACTIVIDADES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DETAILACTIVID(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DETAILACTIVID(pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DETAILACTIVID
	// --START-PAC_IAX_MNTPROD.F_GET_PRODUCTO(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_PRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_PRODUCTO(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODUCTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_PRODUCTO(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_PRODUCTO

	// --START-PAC_IAX_MNTPROD.F_GET_GARANTIAS(PSPRODUC, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_GET_GARANTIAS(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_GARANTIAS(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODGARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_GARANTIAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_GARANTIAS(pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_GARANTIAS

	// --START-PAC_IAX_MNTPROD.F_GET_DETAILGARAN(PSPRODUC, PCACTIVI, PCGARANT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_DETAILGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DETAILGARAN(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODGARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DETAILGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DETAILGARAN(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DETAILGARAN
	// --START-PAC_IAX_MNTPROD.F_SET_DATOSGENERALES(PSPRODUC, PCRAMO, PCMODALI,
	// PCTIPSEG, PCCOLECT, PCACTIVO, PCTERMFIN, PCTIPRIE, PCOBJASE, PCSUBPRO,
	// PNMAXRIE, PC2CABEZAS, PCAGRPRO, PCDIVISA, PCPRPROD, PCOMPANI)

	private HashMap callPAC_IAX_MNTPROD__F_SET_DATOSGENERALES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG,
			java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVO, java.math.BigDecimal pPCTERMFIN,
			java.math.BigDecimal pPCTIPRIE, java.math.BigDecimal pPCOBJASE, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPNMAXRIE, java.math.BigDecimal pPC2CABEZAS, java.math.BigDecimal pPCAGRPRO,
			java.math.BigDecimal pPCDIVISA, java.math.BigDecimal pPCPRPROD, java.math.BigDecimal pPCOMPANI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_DATOSGENERALES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPCACTIVO", "pPCTERMFIN",
						"pPCTIPRIE", "pPCOBJASE", "pPCSUBPRO", "pPNMAXRIE", "pPC2CABEZAS", "pPCAGRPRO", "pPCDIVISA",
						"pPCPRPROD", "pPCOMPANI" },
				new Object[] { pPSPRODUC, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVO, pPCTERMFIN, pPCTIPRIE,
						pPCOBJASE, pPCSUBPRO, pPNMAXRIE, pPC2CABEZAS, pPCAGRPRO, pPCDIVISA, pPCPRPROD, pPCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPCMODALI);
		cStmt.setObject(5, pPCTIPSEG);
		cStmt.setObject(6, pPCCOLECT);
		cStmt.setObject(7, pPCACTIVO);
		cStmt.setObject(8, pPCTERMFIN);
		cStmt.setObject(9, pPCTIPRIE);
		cStmt.setObject(10, pPCOBJASE);
		cStmt.setObject(11, pPCSUBPRO);
		cStmt.setObject(12, pPNMAXRIE);
		cStmt.setObject(13, pPC2CABEZAS);
		cStmt.setObject(14, pPCAGRPRO);
		cStmt.setObject(15, pPCDIVISA);
		cStmt.setObject(16, pPCPRPROD);
		cStmt.setObject(17, pPCOMPANI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(18, java.sql.Types.NUMERIC); // Valor de "PSPRODUC_NOU"
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
			retVal.put("PSPRODUC_NOU", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PSPRODUC_NOU", null);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_DATOSGENERALES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG,
			java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVO, java.math.BigDecimal pPCTERMFIN,
			java.math.BigDecimal pPCTIPRIE, java.math.BigDecimal pPCOBJASE, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPNMAXRIE, java.math.BigDecimal pPC2CABEZAS, java.math.BigDecimal pPCAGRPRO,
			java.math.BigDecimal pPCDIVISA, java.math.BigDecimal pPCPRPROD, java.math.BigDecimal pPCOMPANI)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_DATOSGENERALES(pPSPRODUC, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT,
				pPCACTIVO, pPCTERMFIN, pPCTIPRIE, pPCOBJASE, pPCSUBPRO, pPNMAXRIE, pPC2CABEZAS, pPCAGRPRO, pPCDIVISA,
				pPCPRPROD, pPCOMPANI);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_DATOSGENERALES

	// --START-PAC_IAX_MNTPROD.F_GET_FORMULASGARAN(PSPRODUC, PCACTIVI, PCGARANT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_FORMULASGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_FORMULASGARAN(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODGARFORMULAS".toUpperCase())); // Valor de "RETURN"

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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_FORMULASGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_FORMULASGARAN(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_FORMULASGARAN
	// --START-PAC_IAX_MNTPROD.F_SET_PRODGARFORMULAS(PSPRODUC, PCACTIVI, PCGARANT,
	// PCCAMPO, PCLAVE)

	private HashMap callPAC_IAX_MNTPROD__F_SET_PRODGARFORMULAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO,
			java.math.BigDecimal pPCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_PRODGARFORMULAS(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAMPO", "pPCLAVE" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCCAMPO);
		cStmt.setObject(6, pPCLAVE);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_PRODGARFORMULAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO,
			java.math.BigDecimal pPCLAVE) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_PRODGARFORMULAS(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_PRODGARFORMULAS

	// --START-PAC_IAX_MNTPROD.F_DUPLICARPROD(PRAMORIG, PMODALIORIG, PTIPSEGORIG,
	// PCOLECTORIG, PRAMDEST, PMODALIDEST, PTIPSEGDEST, PCOLECTDEST, PSALIDA)

	private HashMap callPAC_IAX_MNTPROD__F_DUPLICARPROD(java.math.BigDecimal pPRAMORIG,
			java.math.BigDecimal pPMODALIORIG, java.math.BigDecimal pPTIPSEGORIG, java.math.BigDecimal pPCOLECTORIG,
			java.math.BigDecimal pPRAMDEST, java.math.BigDecimal pPMODALIDEST, java.math.BigDecimal pPTIPSEGDEST,
			java.math.BigDecimal pPCOLECTDEST, java.math.BigDecimal pPSALIDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DUPLICARPROD(?,?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPRAMORIG", "pPMODALIORIG", "pPTIPSEGORIG", "pPCOLECTORIG", "pPRAMDEST", "pPMODALIDEST",
						"pPTIPSEGDEST", "pPCOLECTDEST", "pPSALIDA" },
				new Object[] { pPRAMORIG, pPMODALIORIG, pPTIPSEGORIG, pPCOLECTORIG, pPRAMDEST, pPMODALIDEST,
						pPTIPSEGDEST, pPCOLECTDEST, pPSALIDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPRAMORIG);
		cStmt.setObject(3, pPMODALIORIG);
		cStmt.setObject(4, pPTIPSEGORIG);
		cStmt.setObject(5, pPCOLECTORIG);
		cStmt.setObject(6, pPRAMDEST);
		cStmt.setObject(7, pPMODALIDEST);
		cStmt.setObject(8, pPTIPSEGDEST);
		cStmt.setObject(9, pPCOLECTDEST);
		cStmt.setObject(10, pPSALIDA);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DUPLICARPROD(java.math.BigDecimal pPRAMORIG,
			java.math.BigDecimal pPMODALIORIG, java.math.BigDecimal pPTIPSEGORIG, java.math.BigDecimal pPCOLECTORIG,
			java.math.BigDecimal pPRAMDEST, java.math.BigDecimal pPMODALIDEST, java.math.BigDecimal pPTIPSEGDEST,
			java.math.BigDecimal pPCOLECTDEST, java.math.BigDecimal pPSALIDA) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DUPLICARPROD(pPRAMORIG, pPMODALIORIG, pPTIPSEGORIG, pPCOLECTORIG, pPRAMDEST,
				pPMODALIDEST, pPTIPSEGDEST, pPCOLECTDEST, pPSALIDA);
	}
	// --END-PAC_IAX_MNTPROD.F_DUPLICARPROD

	// --START-PAC_IAX_MNTPROD.F_GET_FORPAGO(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_FORPAGO(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_FORPAGO(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODFORMAPAGO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_FORPAGO(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_FORPAGO(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_FORPAGO

	// --START-PAC_IAX_MNTPROD.F_SET_FORPAGO(PSPRODUC, PCFORPAG, PTFORPAG, PCOBLIGA,
	// PPRECARG, PCPAGDEF, PCREVFPG)
	private HashMap callPAC_IAX_MNTPROD__F_SET_FORPAGO(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCFORPAG,
			String pPTFORPAG, java.math.BigDecimal pPCOBLIGA, java.math.BigDecimal pPPRECARG,
			java.math.BigDecimal pPCPAGDEF, java.math.BigDecimal pPCREVFPG) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_FORPAGO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCFORPAG", "pPTFORPAG", "pPCOBLIGA", "pPPRECARG", "pPCPAGDEF",
						"pPCREVFPG" },
				new Object[] { pPSPRODUC, pPCFORPAG, pPTFORPAG, pPCOBLIGA, pPPRECARG, pPCPAGDEF, pPCREVFPG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCFORPAG);
		cStmt.setObject(4, pPTFORPAG);
		cStmt.setObject(5, pPCOBLIGA);
		cStmt.setObject(6, pPPRECARG);
		cStmt.setObject(7, pPCPAGDEF);
		cStmt.setObject(8, pPCREVFPG);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_FORPAGO(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCFORPAG,
			String pPTFORPAG, java.math.BigDecimal pPCOBLIGA, java.math.BigDecimal pPPRECARG,
			java.math.BigDecimal pPCPAGDEF, java.math.BigDecimal pPCREVFPG) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_FORPAGO(pPSPRODUC, pPCFORPAG, pPTFORPAG, pPCOBLIGA, pPPRECARG, pPCPAGDEF,
				pPCREVFPG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_SET_FORPAGO

	// --START-PAC_IAX_MNTPROD.F_GET_DATOSGENERALESGARAN(PSPRODUC, PCACTIVI,
	// PCGARANT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_DATOSGENERALESGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DATOSGENERALESGARAN(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODGARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DATOSGENERALESGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DATOSGENERALESGARAN(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DATOSGENERALESGARAN

	// --START-PAC_IAX_MNTPROD.F_SET_PRODTITULO(PCIDIOMA, PTTITULO, PTROTULO)
	// --START-PAC_IAX_MNTPROD.F_GET_GESTION(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_GESTION(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_GESTION(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODGESTION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_GESTION(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_GESTION(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_GESTION

	private HashMap callPAC_IAX_MNTPROD__F_SET_PRODTITULO(java.math.BigDecimal pPCIDIOMA, String pPTTITULO,
			String pPTROTULO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_PRODTITULO(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCIDIOMA", "pPTTITULO", "pPTROTULO" },
				new Object[] { pPCIDIOMA, pPTTITULO, pPTROTULO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		cStmt.setObject(2, pPCIDIOMA);
		cStmt.setObject(3, pPTTITULO);
		cStmt.setObject(4, pPTROTULO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, "T_IAX_MENSAJES"); // Valor de "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_PRODTITULO(java.math.BigDecimal pPCIDIOMA, String pPTTITULO,
			String pPTROTULO) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_PRODTITULO(pPCIDIOMA, pPTTITULO, pPTROTULO);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_PRODTITULO

	// --START-PAC_IAX_MNTPROD.F_GET_GESTIONGARAN(PSPRODUC, PCACTIVI, PCGARANT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_GESTIONGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_GESTIONGARAN(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODGARDATGESTION".toUpperCase())); // Valor de "RETURN"
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

	private HashMap callPAC_IAX_MNTPROD__F_SET_IMPUESTOSGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCIMPCON,
			java.math.BigDecimal pPCIMPDGS, java.math.BigDecimal pPCIMPIPS, java.math.BigDecimal pPCIMPARB,
			java.math.BigDecimal pPCIMPFNG) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_IMPUESTOSGARAN(?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPACTIVI", "pPCGARANT", "pPCIMPCON", "pPCIMPDGS", "pPCIMPIPS", "pPCIMPARB",
						"pPCIMPFNG" },
				new Object[] { pPSPRODUC, pPACTIVI, pPCGARANT, pPCIMPCON, pPCIMPDGS, pPCIMPIPS, pPCIMPARB, pPCIMPFNG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCIMPCON);
		cStmt.setObject(6, pPCIMPDGS);
		cStmt.setObject(7, pPCIMPIPS);
		cStmt.setObject(8, pPCIMPARB);
		cStmt.setObject(9, pPCIMPFNG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY, "T_IAX_MENSAJES"); // Valor de "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_IMPUESTOSGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCIMPCON,
			java.math.BigDecimal pPCIMPDGS, java.math.BigDecimal pPCIMPIPS, java.math.BigDecimal pPCIMPARB,
			java.math.BigDecimal pPCIMPFNG) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_IMPUESTOSGARAN(pPSPRODUC, pPACTIVI, pPCGARANT, pPCIMPCON, pPCIMPDGS,
				pPCIMPIPS, pPCIMPARB, pPCIMPFNG);
	}

	// --START-PAC_IAX_MNTPROD.F_SET_ADMPROD(PSPRODUC, PCTIPGES, PCRECCOB, PCTIPREB,
	// PCCALCOM, PCTIPPAG, PCMOVDOM, PCFECCOB, PCRECFRA, PIMINEXT, PNDIASPRO,
	// PCNV_SPR)
	private HashMap callPAC_IAX_MNTPROD__F_SET_ADMPROD(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCRECCOB, java.math.BigDecimal pPCTIPREB, java.math.BigDecimal pPCCALCOM,
			java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCMOVDOM, java.math.BigDecimal pPCFECCOB,
			java.math.BigDecimal pPCRECFRA, java.math.BigDecimal pPIMINEXT, java.math.BigDecimal pPNDIASPRO,
			String pPCNV_SPR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_ADMPROD(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCTIPGES", "pPCRECCOB", "pPCTIPREB", "pPCCALCOM", "pPCTIPPAG",
						"pPCMOVDOM", "pPCFECCOB", "pPCRECFRA", "pPIMINEXT", "pPNDIASPRO", "pPCNV_SPR" },
				new Object[] { pPSPRODUC, pPCTIPGES, pPCRECCOB, pPCTIPREB, pPCCALCOM, pPCTIPPAG, pPCMOVDOM, pPCFECCOB,
						pPCRECFRA, pPIMINEXT, pPNDIASPRO, pPCNV_SPR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCTIPGES);
		cStmt.setObject(4, pPCRECCOB);
		cStmt.setObject(5, pPCTIPREB);
		cStmt.setObject(6, pPCCALCOM);
		cStmt.setObject(7, pPCTIPPAG);
		cStmt.setObject(8, pPCMOVDOM);
		cStmt.setObject(9, pPCFECCOB);
		cStmt.setObject(10, pPCRECFRA);
		cStmt.setObject(11, pPIMINEXT);
		cStmt.setObject(12, pPNDIASPRO);
		cStmt.setObject(13, pPCNV_SPR);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_ADMPROD(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCRECCOB, java.math.BigDecimal pPCTIPREB, java.math.BigDecimal pPCCALCOM,
			java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCMOVDOM, java.math.BigDecimal pPCFECCOB,
			java.math.BigDecimal pPCRECFRA, java.math.BigDecimal pPIMINEXT, java.math.BigDecimal pPNDIASPRO,
			String pPCNV_SPR) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_ADMPROD(pPSPRODUC, pPCTIPGES, pPCRECCOB, pPCTIPREB, pPCCALCOM, pPCTIPPAG,
				pPCMOVDOM, pPCFECCOB, pPCRECFRA, pPIMINEXT, pPNDIASPRO, pPCNV_SPR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_SET_ADMPROD

	public HashMap ejecutaPAC_IAX_MNTPROD__F_Get_Admprod(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_Get_Admprod(pPSPRODUC);
	}

	private HashMap callPAC_IAX_MNTPROD__F_Get_Admprod(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_Get_Admprod(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODADMINISTRACION".toUpperCase())); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	private HashMap callPAC_IAX_MNTPROD__F_GET_IMPUESTOSGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_IMPUESTOSGARAN(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODGARIMPUESTOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_GESTIONGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_GESTIONGARAN(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_GESTIONGARAN

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_IMPUESTOSGARAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_IMPUESTOSGARAN(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}

	// --START-PAC_IAX_MNTPROD.F_SET_GESTION(PSPRODUC, PCDURACI, PCTEMPOR, PNDURCOB,
	// PCDURMIN, PNVTOMIN, PCDURMAX, PNVTOMAX, PCTIPEFE, PNRENOVA, PCMODNRE,
	// PCPRODCAR, PCREVALI, PPREVALI, PIREVALI, PCTARMAN, PCREASEG, PCRETENI,
	// PCPRORRA, PCPRIMIN, PIPRIMIN, PCCLAPRI, PIPMINFRA, PNEDAMIC, PCIEDMIC,
	// PNEDAMAC, PCIEDMAC, PNEDAMAR, PCIEDMAR, PNEDMI2C, PCIEMI2C, PNEDMA2C,
	// PCIEMA2C, PNEDMA2R, PCIEMA2R, PNSEDMAC, PCISEMAC, PCVINPOL, PCVINPRE,
	// PCCUESTI, PCCTACOR)

	private HashMap callPAC_IAX_MNTPROD__F_SET_GESTION(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCDURACI,
			java.math.BigDecimal pPCTEMPOR, java.math.BigDecimal pPNDURCOB, java.math.BigDecimal pPCDURMIN,
			java.math.BigDecimal pPNVTOMIN, java.math.BigDecimal pPCDURMAX, java.math.BigDecimal pPNVTOMAX,
			java.math.BigDecimal pPCTIPEFE, java.math.BigDecimal pPNRENOVA, java.math.BigDecimal pPCMODNRE,
			java.math.BigDecimal pPCPRODCAR, java.math.BigDecimal pPCREVALI, java.math.BigDecimal pPPREVALI,
			java.math.BigDecimal pPIREVALI, java.math.BigDecimal pPCTARMAN, java.math.BigDecimal pPCREASEG,
			java.math.BigDecimal pPCRETENI, java.math.BigDecimal pPCPRORRA, java.math.BigDecimal pPCPRIMIN,
			java.math.BigDecimal pPIPRIMIN, java.math.BigDecimal pPCCLAPRI, java.math.BigDecimal pPIPMINFRA,
			java.math.BigDecimal pPNEDAMIC, java.math.BigDecimal pPCIEDMIC, java.math.BigDecimal pPNEDAMAC,
			java.math.BigDecimal pPCIEDMAC, java.math.BigDecimal pPNEDAMAR, java.math.BigDecimal pPCIEDMAR,
			java.math.BigDecimal pPNEDMI2C, java.math.BigDecimal pPCIEMI2C, java.math.BigDecimal pPNEDMA2C,
			java.math.BigDecimal pPCIEMA2C, java.math.BigDecimal pPNEDMA2R, java.math.BigDecimal pPCIEMA2R,
			java.math.BigDecimal pPNSEDMAC, java.math.BigDecimal pPCISEMAC, java.math.BigDecimal pPCVINPOL,
			java.math.BigDecimal pPCVINPRE, java.math.BigDecimal pPCCUESTI, java.math.BigDecimal pPCCTACOR,
			java.math.BigDecimal pPCPREAVISO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_GESTION(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCDURACI", "pPCTEMPOR", "pPNDURCOB", "pPCDURMIN", "pPNVTOMIN",
				"pPCDURMAX", "pPNVTOMAX", "pPCTIPEFE", "pPNRENOVA", "pPCMODNRE", "pPCPRODCAR", "pPCREVALI", "pPPREVALI",
				"pPIREVALI", "pPCTARMAN", "pPCREASEG", "pPCRETENI", "pPCPRORRA", "pPCPRIMIN", "pPIPRIMIN", "pPCCLAPRI",
				"pPIPMINFRA", "pPNEDAMIC", "pPCIEDMIC", "pPNEDAMAC", "pPCIEDMAC", "pPNEDAMAR", "pPCIEDMAR", "pPNEDMI2C",
				"pPCIEMI2C", "pPNEDMA2C", "pPCIEMA2C", "pPNEDMA2R", "pPCIEMA2R", "pPNSEDMAC", "pPCISEMAC", "pPCVINPOL",
				"pPCVINPRE", "pPCCUESTI", "pPCCTACOR", "pPCPREAVISO" },
				new Object[] { pPSPRODUC, pPCDURACI, pPCTEMPOR, pPNDURCOB, pPCDURMIN, pPNVTOMIN, pPCDURMAX, pPNVTOMAX,
						pPCTIPEFE, pPNRENOVA, pPCMODNRE, pPCPRODCAR, pPCREVALI, pPPREVALI, pPIREVALI, pPCTARMAN,
						pPCREASEG, pPCRETENI, pPCPRORRA, pPCPRIMIN, pPIPRIMIN, pPCCLAPRI, pPIPMINFRA, pPNEDAMIC,
						pPCIEDMIC, pPNEDAMAC, pPCIEDMAC, pPNEDAMAR, pPCIEDMAR, pPNEDMI2C, pPCIEMI2C, pPNEDMA2C,
						pPCIEMA2C, pPNEDMA2R, pPCIEMA2R, pPNSEDMAC, pPCISEMAC, pPCVINPOL, pPCVINPRE, pPCCUESTI,
						pPCCTACOR, pPCPREAVISO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCDURACI);
		cStmt.setObject(4, pPCTEMPOR);
		cStmt.setObject(5, pPNDURCOB);
		cStmt.setObject(6, pPCDURMIN);
		cStmt.setObject(7, pPNVTOMIN);
		cStmt.setObject(8, pPCDURMAX);
		cStmt.setObject(9, pPNVTOMAX);
		cStmt.setObject(10, pPCTIPEFE);
		cStmt.setObject(11, pPNRENOVA);
		cStmt.setObject(12, pPCMODNRE);
		cStmt.setObject(13, pPCPRODCAR);
		cStmt.setObject(14, pPCREVALI);
		cStmt.setObject(15, pPPREVALI);
		cStmt.setObject(16, pPIREVALI);
		cStmt.setObject(17, pPCTARMAN);
		cStmt.setObject(18, pPCREASEG);
		cStmt.setObject(19, pPCRETENI);
		cStmt.setObject(20, pPCPRORRA);
		cStmt.setObject(21, pPCPRIMIN);
		cStmt.setObject(22, pPIPRIMIN);
		cStmt.setObject(23, pPCCLAPRI);
		cStmt.setObject(24, pPIPMINFRA);
		cStmt.setObject(25, pPNEDAMIC);
		cStmt.setObject(26, pPCIEDMIC);
		cStmt.setObject(27, pPNEDAMAC);
		cStmt.setObject(28, pPCIEDMAC);
		cStmt.setObject(29, pPNEDAMAR);
		cStmt.setObject(30, pPCIEDMAR);
		cStmt.setObject(31, pPNEDMI2C);
		cStmt.setObject(32, pPCIEMI2C);
		cStmt.setObject(33, pPNEDMA2C);
		cStmt.setObject(34, pPCIEMA2C);
		cStmt.setObject(35, pPNEDMA2R);
		cStmt.setObject(36, pPCIEMA2R);
		cStmt.setObject(37, pPNSEDMAC);
		cStmt.setObject(38, pPCISEMAC);
		cStmt.setObject(39, pPCVINPOL);
		cStmt.setObject(40, pPCVINPRE);
		cStmt.setObject(41, pPCCUESTI);
		cStmt.setObject(42, pPCCTACOR);
		cStmt.setObject(43, pPCPREAVISO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_GESTION(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCDURACI,
			java.math.BigDecimal pPCTEMPOR, java.math.BigDecimal pPNDURCOB, java.math.BigDecimal pPCDURMIN,
			java.math.BigDecimal pPNVTOMIN, java.math.BigDecimal pPCDURMAX, java.math.BigDecimal pPNVTOMAX,
			java.math.BigDecimal pPCTIPEFE, java.math.BigDecimal pPNRENOVA, java.math.BigDecimal pPCMODNRE,
			java.math.BigDecimal pPCPRODCAR, java.math.BigDecimal pPCREVALI, java.math.BigDecimal pPPREVALI,
			java.math.BigDecimal pPIREVALI, java.math.BigDecimal pPCTARMAN, java.math.BigDecimal pPCREASEG,
			java.math.BigDecimal pPCRETENI, java.math.BigDecimal pPCPRORRA, java.math.BigDecimal pPCPRIMIN,
			java.math.BigDecimal pPIPRIMIN, java.math.BigDecimal pPCCLAPRI, java.math.BigDecimal pPIPMINFRA,
			java.math.BigDecimal pPNEDAMIC, java.math.BigDecimal pPCIEDMIC, java.math.BigDecimal pPNEDAMAC,
			java.math.BigDecimal pPCIEDMAC, java.math.BigDecimal pPNEDAMAR, java.math.BigDecimal pPCIEDMAR,
			java.math.BigDecimal pPNEDMI2C, java.math.BigDecimal pPCIEMI2C, java.math.BigDecimal pPNEDMA2C,
			java.math.BigDecimal pPCIEMA2C, java.math.BigDecimal pPNEDMA2R, java.math.BigDecimal pPCIEMA2R,
			java.math.BigDecimal pPNSEDMAC, java.math.BigDecimal pPCISEMAC, java.math.BigDecimal pPCVINPOL,
			java.math.BigDecimal pPCVINPRE, java.math.BigDecimal pPCCUESTI, java.math.BigDecimal pPCCTACOR,
			java.math.BigDecimal pPCPREAVISO) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_GESTION(pPSPRODUC, pPCDURACI, pPCTEMPOR, pPNDURCOB, pPCDURMIN, pPNVTOMIN,
				pPCDURMAX, pPNVTOMAX, pPCTIPEFE, pPNRENOVA, pPCMODNRE, pPCPRODCAR, pPCREVALI, pPPREVALI, pPIREVALI,
				pPCTARMAN, pPCREASEG, pPCRETENI, pPCPRORRA, pPCPRIMIN, pPIPRIMIN, pPCCLAPRI, pPIPMINFRA, pPNEDAMIC,
				pPCIEDMIC, pPNEDAMAC, pPCIEDMAC, pPNEDAMAR, pPCIEDMAR, pPNEDMI2C, pPCIEMI2C, pPNEDMA2C, pPCIEMA2C,
				pPNEDMA2R, pPCIEMA2R, pPNSEDMAC, pPCISEMAC, pPCVINPOL, pPCVINPRE, pPCCUESTI, pPCCTACOR, pPCPREAVISO);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_GESTION
	// --START-PAC_IAX_MNTPROD.F_GET_DURPERIOD(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_DURPERIOD(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DURPERIOD(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODDURPERIODO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DURPERIOD(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DURPERIOD(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DURPERIOD
	// --START-PAC_IAX_MNTPROD.F_DEL_DURPERIOD(PSPRODUC, PFINICIO, PNDURPER)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_DURPERIOD(java.math.BigDecimal pPSPRODUC, java.sql.Date pPFINICIO,
			java.math.BigDecimal pPNDURPER) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_DURPERIOD(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPFINICIO", "pPNDURPER" },
				new Object[] { pPSPRODUC, pPFINICIO, pPNDURPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPFINICIO);
		cStmt.setObject(4, pPNDURPER);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_DURPERIOD(java.math.BigDecimal pPSPRODUC, java.sql.Date pPFINICIO,
			java.math.BigDecimal pPNDURPER) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_DURPERIOD(pPSPRODUC, pPFINICIO, pPNDURPER);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_DURPERIOD
	// --START-PAC_IAX_MNTPROD.F_SET_DURPERIOD(PSPRODUC, PFINICIO, PNDURPER,
	// PNDURPEROLD)

	private HashMap callPAC_IAX_MNTPROD__F_SET_DURPERIOD(java.math.BigDecimal pPSPRODUC, java.sql.Date pPFINICIO,
			java.math.BigDecimal pPNDURPER, java.math.BigDecimal pPNDURPEROLD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_DURPERIOD(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPFINICIO", "pPNDURPER", "pPNDURPEROLD" },
				new Object[] { pPSPRODUC, pPFINICIO, pPNDURPER, pPNDURPEROLD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPFINICIO);
		cStmt.setObject(4, pPNDURPER);
		cStmt.setObject(5, pPNDURPEROLD);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_DURPERIOD(java.math.BigDecimal pPSPRODUC, java.sql.Date pPFINICIO,
			java.math.BigDecimal pPNDURPER, java.math.BigDecimal pPNDURPEROLD) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_DURPERIOD(pPSPRODUC, pPFINICIO, pPNDURPER, pPNDURPEROLD);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_DURPERIOD

	// --START-PAC_IAX_MNTPROD.F_GET_DATTECN(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_DATTECN(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DATTECN(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODDATOSTECNICOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DATTECN(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DATTECN(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DATTECN

	// --START-PAC_IAX_MNTPROD.F_GET_INTERTECMOV(PNCODINT, CTIPO)

	private HashMap callPAC_IAX_MNTPROD__F_GET_INTERTECMOV(java.math.BigDecimal pPNCODINT, java.math.BigDecimal pCTIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_INTERTECMOV(?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pCTIPO" }, new Object[] { pPNCODINT, pCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pCTIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INTERTECPROD".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_INTERTECMOV(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pCTIPO) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_INTERTECMOV(pPNCODINT, pCTIPO);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_INTERTECMOV

	// --START-PAC_IAX_MNTPROD.F_GET_INTERTECMOVDET(PNCODINT, PCTIPO, PFINICIO)

	private HashMap callPAC_IAX_MNTPROD__F_GET_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_INTERTECMOVDET(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCTIPO", "pPFINICIO" },
				new Object[] { pPNCODINT, pPCTIPO, pPFINICIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFINICIO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INTERTECMOVDETPROD".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_INTERTECMOVDET(pPNCODINT, pPCTIPO, pPFINICIO);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_INTERTECMOVDET

	// --START-PAC_IAX_MNTPROD.F_SET_DATTECN(PSPRODUC, PNNIGGAR, PNNIIGAR, PCMODINT,
	// PCINTREV, PNCODINT)

	private HashMap callPAC_IAX_MNTPROD__F_SET_DATTECN(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNNIGGAR,
			java.math.BigDecimal pPNNIIGAR, java.math.BigDecimal pPCMODINT, java.math.BigDecimal pPCINTREV,
			java.math.BigDecimal pPNCODINT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_DATTECN(?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPNNIGGAR", "pPNNIIGAR", "pPCMODINT", "pPCINTREV", "pPNCODINT" },
				new Object[] { pPSPRODUC, pPNNIGGAR, pPNNIIGAR, pPCMODINT, pPCINTREV, pPNCODINT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPNNIGGAR);
		cStmt.setObject(4, pPNNIIGAR);
		cStmt.setObject(5, pPCMODINT);
		cStmt.setObject(6, pPCINTREV);
		cStmt.setObject(7, pPNCODINT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_DATTECN(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNNIGGAR,
			java.math.BigDecimal pPNNIIGAR, java.math.BigDecimal pPCMODINT, java.math.BigDecimal pPCINTREV,
			java.math.BigDecimal pPNCODINT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_DATTECN(pPSPRODUC, pPNNIGGAR, pPNNIIGAR, pPCMODINT, pPCINTREV,
				pPNCODINT);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_DATTECN

	// --START-PAC_IAX_MNTPROD.F_GET_NCODINT(PNCODINT, PCIDIOMA, PTNCODINT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_NCODINT(java.math.BigDecimal pPNCODINT, java.math.BigDecimal pPCIDIOMA,
			String pPTNCODINT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_NCODINT(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCIDIOMA", "pPTNCODINT" },
				new Object[] { pPNCODINT, pPCIDIOMA, pPTNCODINT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.setObject(4, pPTNCODINT);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_NCODINT(java.math.BigDecimal pPNCODINT, java.math.BigDecimal pPCIDIOMA,
			String pPTNCODINT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_NCODINT(pPNCODINT, pPCIDIOMA, pPTNCODINT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_NCODINT

	// --START-PAC_IAX_MNTPROD.F_GET_CUADROINTERESPROD(PNCODINT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_CUADROINTERESPROD(java.math.BigDecimal pPNCODINT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_CUADROINTERESPROD(?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT" }, new Object[] { pPNCODINT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INTERTECPROD".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_CUADROINTERESPROD(java.math.BigDecimal pPNCODINT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_CUADROINTERESPROD(pPNCODINT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_CUADROINTERESPROD

	// --START-PAC_IAX_MNTPROD.F_GETREG_INTERTECMOV(PNCODINT, PCTIPO, PFINICIO)

	private HashMap callPAC_IAX_MNTPROD__F_GETREG_INTERTECMOV(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GETREG_INTERTECMOV(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCTIPO", "pPFINICIO" },
				new Object[] { pPNCODINT, pPCTIPO, pPFINICIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFINICIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "PFFIN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCTRAMTIP"
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
			retVal.put("PFFIN", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFFIN", null);
		}
		try {
			retVal.put("PCTRAMTIP", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCTRAMTIP", null);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GETREG_INTERTECMOV(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GETREG_INTERTECMOV(pPNCODINT, pPCTIPO, pPFINICIO);
	}
	// --END-PAC_IAX_MNTPROD.F_GETREG_INTERTECMOV

	// --START-PAC_IAX_MNTPROD.F_GETREG_INTERTECMOVDET(PNCODINT, PCTIPO, PFINICIO,
	// PNDESDE)

	private HashMap callPAC_IAX_MNTPROD__F_GETREG_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO, java.math.BigDecimal pPNDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GETREG_INTERTECMOVDET(?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCTIPO", "pPFINICIO", "pPNDESDE" },
				new Object[] { pPNCODINT, pPCTIPO, pPFINICIO, pPNDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFINICIO);
		cStmt.setObject(5, pPNDESDE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNHASTA"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PNINTTEC"
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
			retVal.put("PNHASTA", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNHASTA", null);
		}
		try {
			retVal.put("PNINTTEC", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PNINTTEC", null);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GETREG_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO, java.math.BigDecimal pPNDESDE) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GETREG_INTERTECMOVDET(pPNCODINT, pPCTIPO, pPFINICIO, pPNDESDE);
	}
	// --END-PAC_IAX_MNTPROD.F_GETREG_INTERTECMOVDET

	// --START-PAC_IAX_MNTPROD.F_DEL_INTERTEC(PNCODINT)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_INTERTEC(java.math.BigDecimal pPNCODINT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_INTERTEC(?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT" }, new Object[] { pPNCODINT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_INTERTEC(java.math.BigDecimal pPNCODINT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_INTERTEC(pPNCODINT);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_INTERTEC

	// --START-PAC_IAX_MNTPROD.F_DEL_INTERTECMOV(PNCODINT, PCTIPO, PFINICIO)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_INTERTECMOV(java.math.BigDecimal pPNCODINT, java.math.BigDecimal pPCTIPO,
			java.sql.Date pPFINICIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_INTERTECMOV(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCTIPO", "pPFINICIO" },
				new Object[] { pPNCODINT, pPCTIPO, pPFINICIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFINICIO);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_INTERTECMOV(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_INTERTECMOV(pPNCODINT, pPCTIPO, pPFINICIO);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_INTERTECMOV

	// --START-PAC_IAX_MNTPROD.F_DEL_INTERTECMOVDET(PNCODINT, PCTIPO, PFINICIO,
	// PNDESDE)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO, java.math.BigDecimal pPNDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_INTERTECMOVDET(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCTIPO", "pPFINICIO", "pPNDESDE" },
				new Object[] { pPNCODINT, pPCTIPO, pPFINICIO, pPNDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFINICIO);
		cStmt.setObject(5, pPNDESDE);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO, java.math.BigDecimal pPNDESDE) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_INTERTECMOVDET(pPNCODINT, pPCTIPO, pPFINICIO, pPNDESDE);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_INTERTECMOVDET

	// --START-PAC_IAX_MNTPROD.F_GET_DESCRIPNCODINT(PNCODINT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_DESCRIPNCODINT(java.math.BigDecimal pPNCODINT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DESCRIPNCODINT(?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT" }, new Object[] { pPNCODINT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DESCRIPNCODINT(java.math.BigDecimal pPNCODINT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DESCRIPNCODINT(pPNCODINT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DESCRIPNCODINT

	// --START-PAC_IAX_MNTPROD.F_SET_INTERTECMOV(PNCODINT, PCTIPO, PFINICIO, PFFIN,
	// PCTRAMTIP)

	private HashMap callPAC_IAX_MNTPROD__F_SET_INTERTECMOV(java.math.BigDecimal pPNCODINT, java.math.BigDecimal pPCTIPO,
			java.sql.Date pPFINICIO, java.sql.Date pPFFIN, java.math.BigDecimal pPCTRAMTIP) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_INTERTECMOV(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCTIPO", "pPFINICIO", "pPFFIN", "pPCTRAMTIP" },
				new Object[] { pPNCODINT, pPCTIPO, pPFINICIO, pPFFIN, pPCTRAMTIP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFINICIO);
		cStmt.setObject(5, pPFFIN);
		cStmt.setObject(6, pPCTRAMTIP);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_INTERTECMOV(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO, java.sql.Date pPFFIN,
			java.math.BigDecimal pPCTRAMTIP) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_INTERTECMOV(pPNCODINT, pPCTIPO, pPFINICIO, pPFFIN, pPCTRAMTIP);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_INTERTECMOV

	// --START-PAC_IAX_MNTPROD.F_SET_INTERTECMOVDET(PNCODINT, PCTIPO, PFINICIO,
	// PNDESDE, PNHASTA, PNINTTEC)

	private HashMap callPAC_IAX_MNTPROD__F_SET_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO, java.math.BigDecimal pPNDESDE,
			java.math.BigDecimal pPNHASTA, java.math.BigDecimal pPNINTTEC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_INTERTECMOVDET(?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNCODINT", "pPCTIPO", "pPFINICIO", "pPNDESDE", "pPNHASTA", "pPNINTTEC" },
				new Object[] { pPNCODINT, pPCTIPO, pPFINICIO, pPNDESDE, pPNHASTA, pPNINTTEC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCODINT);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFINICIO);
		cStmt.setObject(5, pPNDESDE);
		cStmt.setObject(6, pPNHASTA);
		cStmt.setObject(7, pPNINTTEC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_INTERTECMOVDET(java.math.BigDecimal pPNCODINT,
			java.math.BigDecimal pPCTIPO, java.sql.Date pPFINICIO, java.math.BigDecimal pPNDESDE,
			java.math.BigDecimal pPNHASTA, java.math.BigDecimal pPNINTTEC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_INTERTECMOVDET(pPNCODINT, pPCTIPO, pPFINICIO, pPNDESDE, pPNHASTA,
				pPNINTTEC);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_INTERTECMOVDET

	// --START-PAC_IAX_MNTPROD.F_GET_ACTIVIDADES(PCRAMO, PCMODALI, PCTIPSEG,
	// PCCOLECT, PSPRODUC, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_GET_ACTIVIDADES(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_ACTIVIDADES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCACTIVI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODACTIVIDADES".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVIDADES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_ACTIVIDADES(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC,
				pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_ACTIVIDADES

	// --START-PAC_IAX_MNTPROD.F_SET_ACTIVIDADES(PCRAMO, PCMODALI, PCTIPSEG,
	// PCCOLECT, PSPRODUC, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_SET_ACTIVIDADES(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_ACTIVIDADES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCACTIVI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_ACTIVIDADES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_ACTIVIDADES(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC,
				pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_ACTIVIDADES

	// --START-PAC_IAX_MNTPROD.F_EXIST_ACTPOL(PSPRODUC, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_EXIST_ACTPOL(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_EXIST_ACTPOL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_EXIST_ACTPOL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_EXIST_ACTPOL(pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_EXIST_ACTPOL

	// --START-PAC_IAX_MNTPROD.F_BORRAR_ACTIVIDADES(PSPRODUC, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_BORRAR_ACTIVIDADES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_BORRAR_ACTIVIDADES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_BORRAR_ACTIVIDADES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_BORRAR_ACTIVIDADES(pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_BORRAR_ACTIVIDADES

	// --START-PAC_IAX_MNTPROD.F_GET_RECACTIVIDAD(PCRAMO, PCMODALI, PCTIPSEG,
	// PCCOLECT, PSPRODUC, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_GET_RECACTIVIDAD(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_RECACTIVIDAD(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCACTIVI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODRECFRACCACTI".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_RECACTIVIDAD(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_RECACTIVIDAD(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC,
				pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_RECACTIVIDAD

	// --START-PAC_IAX_MNTPROD.F_SET_RECACTIVIDAD(PCRAMO, PCMODALI, PCTIPSEG,
	// PCCOLECT, PSPRODUC, PCACTIVI, PCFORPAG, PPRECARG)

	private HashMap callPAC_IAX_MNTPROD__F_SET_RECACTIVIDAD(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCFORPAG,
			java.math.BigDecimal pPPRECARG) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_RECACTIVIDAD(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPSPRODUC", "pPCACTIVI", "pPCFORPAG",
						"pPPRECARG" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC, pPCACTIVI, pPCFORPAG, pPPRECARG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCACTIVI);
		cStmt.setObject(8, pPCFORPAG);
		cStmt.setObject(9, pPPRECARG);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_RECACTIVIDAD(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCFORPAG,
			java.math.BigDecimal pPPRECARG) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_RECACTIVIDAD(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC,
				pPCACTIVI, pPCFORPAG, pPPRECARG);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_RECACTIVIDAD
	// --START-PAC_IAX_MNTPROD.F_DUPLICAR_ACTIVIDADES(PCRAMO, PCMODALI, PCTIPSEG,
	// PCCOLECT, PSPRODUC, PCACTIVI, PCACTIVIC)

	private HashMap callPAC_IAX_MNTPROD__F_DUPLICAR_ACTIVIDADES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCACTIVIC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DUPLICAR_ACTIVIDADES(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPSPRODUC", "pPCACTIVI",
						"pPCACTIVIC" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC, pPCACTIVI, pPCACTIVIC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCACTIVI);
		cStmt.setObject(8, pPCACTIVIC);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DUPLICAR_ACTIVIDADES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCACTIVIC)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DUPLICAR_ACTIVIDADES(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPSPRODUC,
				pPCACTIVI, pPCACTIVIC);
	}
	// --END-PAC_IAX_MNTPROD.F_DUPLICAR_ACTIVIDADES

	// --START-PAC_IAX_MNTPROD.F_DEL_BENEFPRO(PSPRODUC, PSCLABEN)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_BENEFPRO(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSCLABEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_BENEFPRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPSCLABEN" }, new Object[] { pPSPRODUC, pPSCLABEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPSCLABEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNERROR"
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
			retVal.put("PNERROR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNERROR", null);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_BENEFPRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSCLABEN) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_BENEFPRO(pPSPRODUC, pPSCLABEN);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_BENEFPRO
	// --START-PAC_IAX_MNTPROD.F_GET_BENEFPRO(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_BENEFPRO(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_BENEFPRO(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODBENEFICIARIOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_BENEFPRO(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_BENEFPRO(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_BENEFPRO
	// --START-PAC_IAX_MNTPROD.F_GET_BENEF_NOASIG(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_BENEF_NOASIG(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_BENEF_NOASIG(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_BENEF_NOASIG(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_BENEF_NOASIG(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_BENEF_NOASIG
	// --START-PAC_IAX_MNTPROD.F_SET_BENEFDEFECTO(PSPRODUC, PSCLABEN)

	private HashMap callPAC_IAX_MNTPROD__F_SET_BENEFDEFECTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSCLABEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_BENEFDEFECTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPSCLABEN" }, new Object[] { pPSPRODUC, pPSCLABEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPSCLABEN);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_BENEFDEFECTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSCLABEN) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_BENEFDEFECTO(pPSPRODUC, pPSCLABEN);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_BENEFDEFECTO
	// --START-PAC_IAX_MNTPROD.F_SET_BENEFPRO(PSPRODUC, PSCLABEN)

	private HashMap callPAC_IAX_MNTPROD__F_SET_BENEFPRO(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSCLABEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_BENEFPRO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPSCLABEN" }, new Object[] { pPSPRODUC, pPSCLABEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPSCLABEN);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_BENEFPRO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSCLABEN) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_BENEFPRO(pPSPRODUC, pPSCLABEN);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_BENEFPRO

	// --START-PAC_IAX_MNTPROD.F_SET_GARANTIAPROD(PSPRODUC, PCGARANT, PCACTIVI,
	// PNORDEN, PCTIPGAR, PCTIPCAP)

	private HashMap callPAC_IAX_MNTPROD__F_SET_GARANTIAPROD(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPCTIPGAR, java.math.BigDecimal pPCTIPCAP) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_GARANTIAPROD(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCGARANT", "pPCACTIVI", "pPNORDEN", "pPCTIPGAR", "pPCTIPCAP" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCACTIVI, pPNORDEN, pPCTIPGAR, pPCTIPCAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPNORDEN);
		cStmt.setObject(6, pPCTIPGAR);
		cStmt.setObject(7, pPCTIPCAP);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_GARANTIAPROD(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPCTIPGAR, java.math.BigDecimal pPCTIPCAP) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_GARANTIAPROD(pPSPRODUC, pPCGARANT, pPCACTIVI, pPNORDEN, pPCTIPGAR,
				pPCTIPCAP);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_GARANTIAPROD

	// --START-PAC_IAX_MNTPROD.F_GET_PARGARANTIA(PCIDIOMA)

	private HashMap callPAC_IAX_MNTPROD__F_GET_PARGARANTIA(java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_PARGARANTIA(?, ?)}";

		logCall(callQuery, new String[] { "pPCIDIOMA" }, new Object[] { pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_PARGARANTIA(java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_PARGARANTIA(pPCIDIOMA);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_PARGARANTIA

	// --START-PAC_IAX_MNTPROD.F_GET_VALPARGARANTIA(PCPARGAR, PCIDIOMA)

	private HashMap callPAC_IAX_MNTPROD__F_GET_VALPARGARANTIA(String pPCPARGAR, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_VALPARGARANTIA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPARGAR", "pPCIDIOMA" }, new Object[] { pPCPARGAR, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARGAR);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCTIPO"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLISTRESP"
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
			retVal.put("PCTIPO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCTIPO", null);
		}
		try {
			retVal.put("PLISTRESP", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PLISTRESP", null);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_VALPARGARANTIA(String pPCPARGAR, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_VALPARGARANTIA(pPCPARGAR, pPCIDIOMA);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_VALPARGARANTIA

	// --START-PAC_IAX_MNTPROD.F_GET_OBJ_CAPITALES()

	private HashMap callPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_OBJ_CAPITALES(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODGARANPROCAP".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES() throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES();
	}
	// --END-PAC_IAX_MNTPROD.F_GET_OBJ_CAPITALES
	// --START-PAC_IAX_MNTPROD.F_INICIALIZA_CAPITAL(PSPRODUC, PCGARANT, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_INICIALIZA_CAPITAL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_INICIALIZA_CAPITAL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCGARANT", "pPCACTIVI" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_INICIALIZA_CAPITAL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_INICIALIZA_CAPITAL(pPSPRODUC, pPCGARANT, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_INICIALIZA_CAPITAL
	// --START-PAC_IAX_MNTPROD.F_INICIALIZA_CAPITALES()

	private HashMap callPAC_IAX_MNTPROD__F_INICIALIZA_CAPITALES() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_INICIALIZA_CAPITALES(?)}";

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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_INICIALIZA_CAPITALES() throws Exception {
		return this.callPAC_IAX_MNTPROD__F_INICIALIZA_CAPITALES();
	}
	// --END-PAC_IAX_MNTPROD.F_INICIALIZA_CAPITALES
	// --START-PAC_IAX_MNTPROD.F_SET_CAPITALES(PSPRODUC, PCGARANT, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_SET_CAPITALES(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_CAPITALES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCGARANT", "pPCACTIVI" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_CAPITALES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_CAPITALES(pPSPRODUC, pPCGARANT, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_CAPITALES
	// --START-PAC_IAX_MNTPROD.F_SET_OBJ_CAPITAL(PICAPITAL, PCDEFECTO)

	private HashMap callPAC_IAX_MNTPROD__F_SET_OBJ_CAPITAL(java.math.BigDecimal pPICAPITAL,
			java.math.BigDecimal pPCDEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_OBJ_CAPITAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPICAPITAL", "pPCDEFECTO" }, new Object[] { pPICAPITAL, pPCDEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPICAPITAL);
		cStmt.setObject(3, pPCDEFECTO);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_OBJ_CAPITAL(java.math.BigDecimal pPICAPITAL,
			java.math.BigDecimal pPCDEFECTO) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_OBJ_CAPITAL(pPICAPITAL, pPCDEFECTO);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_OBJ_CAPITAL

	// --START-PAC_IAX_MNTPROD.F_DEL_OBJ_CAPITAL(PNORDEN)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_OBJ_CAPITAL(java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_OBJ_CAPITAL(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_OBJ_CAPITAL(java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_OBJ_CAPITAL(pPNORDEN);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_OBJ_CAPITAL

	// --START-PAC_IAX_MNTPROD.F_ORDENAR_OBJ_CAPITAL(PNORDEN, PMODO)

	private HashMap callPAC_IAX_MNTPROD__F_ORDENAR_OBJ_CAPITAL(java.math.BigDecimal pPNORDEN, String pPMODO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_ORDENAR_OBJ_CAPITAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNORDEN", "pPMODO" }, new Object[] { pPNORDEN, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNORDEN);
		cStmt.setObject(3, pPMODO);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_ORDENAR_OBJ_CAPITAL(java.math.BigDecimal pPNORDEN, String pPMODO)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_ORDENAR_OBJ_CAPITAL(pPNORDEN, pPMODO);
	}
	// --END-PAC_IAX_MNTPROD.F_ORDENAR_OBJ_CAPITAL

	// --START-PAC_IAX_MNTPROD.F_SET_DATOSGEN(PSPRODUC, PCGARANT, PCACTIVI, PNORDEN,
	// PCTIPGAR, PCTIPCAP, PCGARDEP, PCPARDEP, PCVALPAR, PCTARJET, PCBASICA,
	// PICAPMAX, PCCAPMAX, PCFORMUL, PCCLACAP, PICAPREV, PPCAPDEP, PIPRIMIN,
	// PIPRIMAX, PICAPMIN)

	private HashMap callPAC_IAX_MNTPROD__F_SET_DATOSGEN(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCTIPGAR,
			java.math.BigDecimal pPCTIPCAP, java.math.BigDecimal pPCGARDEP, String pPCPARDEP,
			java.math.BigDecimal pPCVALPAR, java.math.BigDecimal pPCTARJET, java.math.BigDecimal pPCBASICA,
			java.math.BigDecimal pPICAPMAX, java.math.BigDecimal pPCCAPMAX, java.math.BigDecimal pPCFORMUL,
			java.math.BigDecimal pPCCLACAP, java.math.BigDecimal pPICAPREV, java.math.BigDecimal pPPCAPDEP,
			java.math.BigDecimal pPIPRIMIN, java.math.BigDecimal pPIPRIMAX, java.math.BigDecimal pPCCAPMIN,
			java.math.BigDecimal pPICAPMIN, java.math.BigDecimal pPCCLAMIN, java.math.BigDecimal pPCMONCAP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_DATOSGEN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCGARANT", "pPCACTIVI", "pPNORDEN", "pPCTIPGAR", "pPCTIPCAP", "pPCGARDEP",
						"pPCPARDEP", "pPCVALPAR", "pPCTARJET", "pPCBASICA", "pPICAPMAX", "pPCCAPMAX", "pPCFORMUL",
						"pPCCLACAP", "pPICAPREV", "pPPCAPDEP", "pPIPRIMIN", "pPIPRIMAX", "pPCCAPMIN", "pPICAPMIN",
						"pPCCLAMIN", "pPCMONCAP" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCACTIVI, pPNORDEN, pPCTIPGAR, pPCTIPCAP, pPCGARDEP, pPCPARDEP,
						pPCVALPAR, pPCTARJET, pPCBASICA, pPICAPMAX, pPCCAPMAX, pPCFORMUL, pPCCLACAP, pPICAPREV,
						pPPCAPDEP, pPIPRIMIN, pPIPRIMAX, pPCCAPMIN, pPICAPMIN, pPCCLAMIN, pPCMONCAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPNORDEN);
		cStmt.setObject(6, pPCTIPGAR);
		cStmt.setObject(7, pPCTIPCAP);
		cStmt.setObject(8, pPCGARDEP);
		cStmt.setObject(9, pPCPARDEP);
		cStmt.setObject(10, pPCVALPAR);
		cStmt.setObject(11, pPCTARJET);
		cStmt.setObject(12, pPCBASICA);
		cStmt.setObject(13, pPICAPMAX);
		cStmt.setObject(14, pPCCAPMAX);
		cStmt.setObject(15, pPCFORMUL);
		cStmt.setObject(16, pPCCLACAP);
		cStmt.setObject(17, pPICAPREV);
		cStmt.setObject(18, pPPCAPDEP);
		cStmt.setObject(19, pPIPRIMIN);
		cStmt.setObject(20, pPIPRIMAX);
		cStmt.setObject(21, pPCCAPMIN);
		cStmt.setObject(22, pPICAPMIN);
		cStmt.setObject(23, pPCCLAMIN);
		cStmt.setObject(24, pPCMONCAP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(25, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_DATOSGEN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPCTIPGAR, java.math.BigDecimal pPCTIPCAP, java.math.BigDecimal pPCGARDEP,
			String pPCPARDEP, java.math.BigDecimal pPCVALPAR, java.math.BigDecimal pPCTARJET,
			java.math.BigDecimal pPCBASICA, java.math.BigDecimal pPICAPMAX, java.math.BigDecimal pPCCAPMAX,
			java.math.BigDecimal pPCFORMUL, java.math.BigDecimal pPCCLACAP, java.math.BigDecimal pPICAPREV,
			java.math.BigDecimal pPPCAPDEP, java.math.BigDecimal pPIPRIMIN, java.math.BigDecimal pPIPRIMAX,
			java.math.BigDecimal pPCCAPMIN, java.math.BigDecimal pPICAPMIN, java.math.BigDecimal pPCCLAMIN,
			java.math.BigDecimal pPCMONCAP) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_DATOSGEN(pPSPRODUC, pPCGARANT, pPCACTIVI, pPNORDEN, pPCTIPGAR, pPCTIPCAP,
				pPCGARDEP, pPCPARDEP, pPCVALPAR, pPCTARJET, pPCBASICA, pPICAPMAX, pPCCAPMAX, pPCFORMUL, pPCCLACAP,
				pPICAPREV, pPPCAPDEP, pPIPRIMIN, pPIPRIMAX, pPCCAPMIN, pPICAPMIN, pPCCLAMIN, pPCMONCAP);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_DATOSGEN

	// --START-PAC_IAX_MNTPROD.F_DEL_GARANTIA(PSPRODUC, PCGARANT, PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_GARANTIA(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_GARANTIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCGARANT", "pPCACTIVI" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_GARANTIA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_GARANTIA(pPSPRODUC, pPCGARANT, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_GARANTIA

	// --START-PAC_IAX_MNTPROD.F_SET_DATOSGES(PSPRODUC, PCGARANT, PCACTIVI,
	// PCIEDMIC, PNEDAMIC, PCIEDMAC, PNEDAMAC, PCIEDMAR, PNEDAMAR, PCIEMI2C,
	// PNEDMI2C, PCIEMA2C, PNEDMA2C, PCIEMA2R, PNEDMA2R, PCREASEG, PCREVALI,
	// PCTIPTAR, PCMODREV, PCRECARG, PCDTOCOM, PCTECNIC, PCOFERSN, PCEXTRAP,
	// PCDERREG, PPREVALI, PIREVALI, PCRECFRA, PCTARMAN, PNEDAMRV, PCIEDMRV)

	private HashMap callPAC_IAX_MNTPROD__F_SET_DATOSGES(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCIEDMIC, java.math.BigDecimal pPNEDAMIC,
			java.math.BigDecimal pPCIEDMAC, java.math.BigDecimal pPNEDAMAC, java.math.BigDecimal pPCIEDMAR,
			java.math.BigDecimal pPNEDAMAR, java.math.BigDecimal pPCIEMI2C, java.math.BigDecimal pPNEDMI2C,
			java.math.BigDecimal pPCIEMA2C, java.math.BigDecimal pPNEDMA2C, java.math.BigDecimal pPCIEMA2R,
			java.math.BigDecimal pPNEDMA2R, java.math.BigDecimal pPCREASEG, java.math.BigDecimal pPCREVALI,
			java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPCMODREV, java.math.BigDecimal pPCRECARG,
			java.math.BigDecimal pPCDTOCOM, java.math.BigDecimal pPCTECNIC, java.math.BigDecimal pPCOFERSN,
			java.math.BigDecimal pPCEXTRAP, java.math.BigDecimal pPCDERREG, java.math.BigDecimal pPPREVALI,
			java.math.BigDecimal pPIREVALI, java.math.BigDecimal pPCRECFRA, java.math.BigDecimal pPCTARMAN,
			java.math.BigDecimal pPNEDAMRV, java.math.BigDecimal pPCIEDMRV) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_DATOSGES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCGARANT", "pPCACTIVI", "pPCIEDMIC", "pPNEDAMIC", "pPCIEDMAC",
						"pPNEDAMAC", "pPCIEDMAR", "pPNEDAMAR", "pPCIEMI2C", "pPNEDMI2C", "pPCIEMA2C", "pPNEDMA2C",
						"pPCIEMA2R", "pPNEDMA2R", "pPCREASEG", "pPCREVALI", "pPCTIPTAR", "pPCMODREV", "pPCRECARG",
						"pPCDTOCOM", "pPCTECNIC", "pPCOFERSN", "pPCEXTRAP", "pPCDERREG", "pPPREVALI", "pPIREVALI",
						"pPCRECFRA", "pPCTARMAN", "pPNEDAMRV", "pPCIEDMRV" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCACTIVI, pPCIEDMIC, pPNEDAMIC, pPCIEDMAC, pPNEDAMAC, pPCIEDMAR,
						pPNEDAMAR, pPCIEMI2C, pPNEDMI2C, pPCIEMA2C, pPNEDMA2C, pPCIEMA2R, pPNEDMA2R, pPCREASEG,
						pPCREVALI, pPCTIPTAR, pPCMODREV, pPCRECARG, pPCDTOCOM, pPCTECNIC, pPCOFERSN, pPCEXTRAP,
						pPCDERREG, pPPREVALI, pPIREVALI, pPCRECFRA, pPCTARMAN, pPNEDAMRV, pPCIEDMRV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCIEDMIC);
		cStmt.setObject(6, pPNEDAMIC);
		cStmt.setObject(7, pPCIEDMAC);
		cStmt.setObject(8, pPNEDAMAC);
		cStmt.setObject(9, pPCIEDMAR);
		cStmt.setObject(10, pPNEDAMAR);
		cStmt.setObject(11, pPCIEMI2C);
		cStmt.setObject(12, pPNEDMI2C);
		cStmt.setObject(13, pPCIEMA2C);
		cStmt.setObject(14, pPNEDMA2C);
		cStmt.setObject(15, pPCIEMA2R);
		cStmt.setObject(16, pPNEDMA2R);
		cStmt.setObject(17, pPCREASEG);
		cStmt.setObject(18, pPCREVALI);
		cStmt.setObject(19, pPCTIPTAR);
		cStmt.setObject(20, pPCMODREV);
		cStmt.setObject(21, pPCRECARG);
		cStmt.setObject(22, pPCDTOCOM);
		cStmt.setObject(23, pPCTECNIC);
		cStmt.setObject(24, pPCOFERSN);
		cStmt.setObject(25, pPCEXTRAP);
		cStmt.setObject(26, pPCDERREG);
		cStmt.setObject(27, pPPREVALI);
		cStmt.setObject(28, pPIREVALI);
		cStmt.setObject(29, pPCRECFRA);
		cStmt.setObject(30, pPCTARMAN);
		cStmt.setObject(31, pPNEDAMRV);
		cStmt.setObject(32, pPCIEDMRV);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(33, oracle.jdbc.OracleTypes.ARRAY,
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_DATOSGES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCIEDMIC,
			java.math.BigDecimal pPNEDAMIC, java.math.BigDecimal pPCIEDMAC, java.math.BigDecimal pPNEDAMAC,
			java.math.BigDecimal pPCIEDMAR, java.math.BigDecimal pPNEDAMAR, java.math.BigDecimal pPCIEMI2C,
			java.math.BigDecimal pPNEDMI2C, java.math.BigDecimal pPCIEMA2C, java.math.BigDecimal pPNEDMA2C,
			java.math.BigDecimal pPCIEMA2R, java.math.BigDecimal pPNEDMA2R, java.math.BigDecimal pPCREASEG,
			java.math.BigDecimal pPCREVALI, java.math.BigDecimal pPCTIPTAR, java.math.BigDecimal pPCMODREV,
			java.math.BigDecimal pPCRECARG, java.math.BigDecimal pPCDTOCOM, java.math.BigDecimal pPCTECNIC,
			java.math.BigDecimal pPCOFERSN, java.math.BigDecimal pPCEXTRAP, java.math.BigDecimal pPCDERREG,
			java.math.BigDecimal pPPREVALI, java.math.BigDecimal pPIREVALI, java.math.BigDecimal pPCRECFRA,
			java.math.BigDecimal pPCTARMAN, java.math.BigDecimal pPNEDAMRV, java.math.BigDecimal pPCIEDMRV)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_DATOSGES(pPSPRODUC, pPCGARANT, pPCACTIVI, pPCIEDMIC, pPNEDAMIC,
				pPCIEDMAC, pPNEDAMAC, pPCIEDMAR, pPNEDAMAR, pPCIEMI2C, pPNEDMI2C, pPCIEMA2C, pPNEDMA2C, pPCIEMA2R,
				pPNEDMA2R, pPCREASEG, pPCREVALI, pPCTIPTAR, pPCMODREV, pPCRECARG, pPCDTOCOM, pPCTECNIC, pPCOFERSN,
				pPCEXTRAP, pPCDERREG, pPPREVALI, pPIREVALI, pPCRECFRA, pPCTARMAN, pPNEDAMRV, pPCIEDMRV);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_DATOSGES

	// --START-PAC_IAX_MNTPROD.F_GET_LSTGARINCOMPATIBLES(PSPRODUC, PCACTIVI,
	// PCGARANT)

	private HashMap callPAC_IAX_MNTPROD__F_GET_LSTGARINCOMPATIBLES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_LSTGARINCOMPATIBLES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_LSTGARINCOMPATIBLES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_LSTGARINCOMPATIBLES(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_LSTGARINCOMPATIBLES

	// --START-PAC_IAX_MNTPROD.F_DEL_INCOMPAGAR(PSPRODUC, PCGARANT, PCGARINC,
	// PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_INCOMPAGAR(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCGARINC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_INCOMPAGAR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCGARANT", "pPCGARINC", "pPCACTIVI" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCGARINC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCGARINC);
		cStmt.setObject(5, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_INCOMPAGAR(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCGARINC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_INCOMPAGAR(pPSPRODUC, pPCGARANT, pPCGARINC, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_INCOMPAGAR
	// --START-PAC_IAX_MNTPROD.F_SET_INCOMPAGAR(PSPRODUC, PCGARANT, PCGARINC,
	// PCACTIVI)

	private HashMap callPAC_IAX_MNTPROD__F_SET_INCOMPAGAR(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCGARINC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_INCOMPAGAR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCGARANT", "pPCGARINC", "pPCACTIVI" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCGARINC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCGARINC);
		cStmt.setObject(5, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_INCOMPAGAR(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCGARINC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_INCOMPAGAR(pPSPRODUC, pPCGARANT, pPCGARINC, pPCACTIVI);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_INCOMPAGAR

	// --START-PAC_IAX_MNTPROD.F_SET_DATOSTEC(PSPRODUC, PCGARANT, PCACTIVI,
	// PCRAMDGS, PCTABLA, PPRECSEG, PNPARBEN, PCPROVIS)
	private HashMap callPAC_IAX_MNTPROD__F_SET_DATOSTEC(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCRAMDGS, java.math.BigDecimal pPCTABLA,
			java.math.BigDecimal pPPRECSEG, java.math.BigDecimal pPNPARBEN, java.math.BigDecimal pPCPROVIS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_DATOSTEC(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCGARANT", "pPCACTIVI", "pPCRAMDGS", "pPCTABLA", "pPPRECSEG", "pPNPARBEN",
						"pPCPROVIS" },
				new Object[] { pPSPRODUC, pPCGARANT, pPCACTIVI, pPCRAMDGS, pPCTABLA, pPPRECSEG, pPNPARBEN, pPCPROVIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCRAMDGS);
		cStmt.setObject(6, pPCTABLA);
		cStmt.setObject(7, pPPRECSEG);
		cStmt.setObject(8, pPNPARBEN);
		cStmt.setObject(9, pPCPROVIS);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_DATOSTEC(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCRAMDGS,
			java.math.BigDecimal pPCTABLA, java.math.BigDecimal pPPRECSEG, java.math.BigDecimal pPNPARBEN,
			java.math.BigDecimal pPCPROVIS) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_DATOSTEC(pPSPRODUC, pPCGARANT, pPCACTIVI, pPCRAMDGS, pPCTABLA, pPPRECSEG,
				pPNPARBEN, pPCPROVIS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_SET_DATOSTEC

	// --START-PAC_IAX_MNTPROD.F_DEL_PRODGARFORMULAS(PSPRODUC, PCACTIVI, PCGARANT,
	// PCCAMPO, PCLAVE)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_PRODGARFORMULAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO,
			java.math.BigDecimal pPCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_PRODGARFORMULAS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAMPO", "pPCLAVE" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCCAMPO);
		cStmt.setObject(6, pPCLAVE);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_PRODGARFORMULAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO,
			java.math.BigDecimal pPCLAVE) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_PRODGARFORMULAS(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_PRODGARFORMULAS

	// --START-PAC_IAX_MNTPROD.F_ALTA_PRODUCTO(PCRAMO, PCMODALI, PCTIPSEG, PCCOLECT,
	// PCAGRPRO, PTTITULO, PTROTULO, PCSUBPRO, PCTIPREB, PCTIPGES, PCTIPPAG,
	// PCDURACI, PCTARMAN, PCTIPEFE, PSPRODUC_COPY, PPARPRODUCTOS)

	private HashMap callPAC_IAX_MNTPROD__F_ALTA_PRODUCTO(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCAGRPRO,
			String pPTTITULO, String pPTROTULO, java.math.BigDecimal pPCSUBPRO, java.math.BigDecimal pPCTIPREB,
			java.math.BigDecimal pPCTIPGES, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCDURACI,
			java.math.BigDecimal pPCTARMAN, java.math.BigDecimal pPCTIPEFE, java.math.BigDecimal pPSPRODUC_COPY,
			java.math.BigDecimal pPPARPRODUCTOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_ALTA_PRODUCTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPCAGRPRO", "pPTTITULO", "pPTROTULO",
						"pPCSUBPRO", "pPCTIPREB", "pPCTIPGES", "pPCTIPPAG", "pPCDURACI", "pPCTARMAN", "pPCTIPEFE",
						"pPSPRODUC_COPY", "pPPARPRODUCTOS" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCAGRPRO, pPTTITULO, pPTROTULO, pPCSUBPRO,
						pPCTIPREB, pPCTIPGES, pPCTIPPAG, pPCDURACI, pPCTARMAN, pPCTIPEFE, pPSPRODUC_COPY,
						pPPARPRODUCTOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPCAGRPRO);
		cStmt.setObject(7, pPTTITULO);
		cStmt.setObject(8, pPTROTULO);
		cStmt.setObject(9, pPCSUBPRO);
		cStmt.setObject(10, pPCTIPREB);
		cStmt.setObject(11, pPCTIPGES);
		cStmt.setObject(12, pPCTIPPAG);
		cStmt.setObject(13, pPCDURACI);
		cStmt.setObject(14, pPCTARMAN);
		cStmt.setObject(15, pPCTIPEFE);
		cStmt.setObject(16, pPSPRODUC_COPY);
		cStmt.setObject(17, pPPARPRODUCTOS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(18, java.sql.Types.NUMERIC); // Valor de "PSPRODUC_OUT"
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
			retVal.put("PSPRODUC_OUT", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PSPRODUC_OUT", null);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_ALTA_PRODUCTO(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCAGRPRO,
			String pPTTITULO, String pPTROTULO, java.math.BigDecimal pPCSUBPRO, java.math.BigDecimal pPCTIPREB,
			java.math.BigDecimal pPCTIPGES, java.math.BigDecimal pPCTIPPAG, java.math.BigDecimal pPCDURACI,
			java.math.BigDecimal pPCTARMAN, java.math.BigDecimal pPCTIPEFE, java.math.BigDecimal pPSPRODUC_COPY,
			java.math.BigDecimal pPPARPRODUCTOS) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_ALTA_PRODUCTO(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCAGRPRO, pPTTITULO,
				pPTROTULO, pPCSUBPRO, pPCTIPREB, pPCTIPGES, pPCTIPPAG, pPCDURACI, pPCTARMAN, pPCTIPEFE, pPSPRODUC_COPY,
				pPPARPRODUCTOS); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_ALTA_PRODUCTO

	// --START-PAC_IAX_MNTPROD.F_GET_ACTIVID(PSPRODUC)

	private HashMap callPAC_IAX_MNTPROD__F_GET_ACTIVID(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_ACTIVID(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRODACTIVIDADES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVID(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_ACTIVID(pPSPRODUC);
	}

	// --END-PAC_IAX_MNTPROD.F_GET_ACTIVID
	// bfp bug 22253 ini
	// --START-PAC_IAX_MNTPROD.F_GET_DURCOBROPROD(PSPRODUC)
	private HashMap callPAC_IAX_MNTPROD__F_GET_DURCOBROPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_DURCOBROPROD(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DURCOBROPROD".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_DURCOBROPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_DURCOBROPROD(pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_GET_DURCOBROPROD

	// bfp bug 22253 fi

	// --START-PAC_IAX_MNTPROD.F_SET_PLANPENSION(PSPRODUC, PCCODPLA)
	private HashMap callPAC_IAX_MNTPROD__F_SET_PLANPENSION(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCODPLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_PLANPENSION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCCODPLA" }, new Object[] { pPSPRODUC, pPCCODPLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCCODPLA);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_PLANPENSION(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCODPLA) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_PLANPENSION(pPSPRODUC, pPCCODPLA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPROD.F_SET_PLANPENSION

	// --START-PAC_IAX_MNTPROD.F_GET_INTERFICIE(PCCODIGO, PCVALAXIS, PCVALEMP)

	private HashMap callPAC_IAX_MNTPROD__F_GET_INTERFICIE(String pPCCODIGO, String pPCVALAXIS, String pPCVALEMP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_GET_INTERFICIE(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCCODIGO", "pPCVALAXIS", "pPCVALEMP" },
				new Object[] { pPCCODIGO, pPCVALAXIS, pPCVALEMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.setObject(3, pPCVALAXIS);
		cStmt.setObject(4, pPCVALEMP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INTERFICIES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_GET_INTERFICIE(String pPCCODIGO, String pPCVALAXIS, String pPCVALEMP)
			throws Exception {
		return this.callPAC_IAX_MNTPROD__F_GET_INTERFICIE(pPCCODIGO, pPCVALAXIS, pPCVALEMP);
	}
	// --END-PAC_IAX_MNTPROD.F_GET_INTERFICIE

	// --START-PAC_IAX_MNTPROD.F_DEL_INTERFICIE(PCCODIGO, PCVALAXIS)

	private HashMap callPAC_IAX_MNTPROD__F_DEL_INTERFICIE(String pPCCODIGO, String pPCVALAXIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_DEL_INTERFICIE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO", "pPCVALAXIS" }, new Object[] { pPCCODIGO, pPCVALAXIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.setObject(3, pPCVALAXIS);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_DEL_INTERFICIE(String pPCCODIGO, String pPCVALAXIS) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_DEL_INTERFICIE(pPCCODIGO, pPCVALAXIS);
	}
	// --END-PAC_IAX_MNTPROD.F_DEL_INTERFICIE

	// --START-PAC_IAX_MNTPROD.F_SET_INTERFICIE(PCCODIGO, PCVALAXIS, PCVALEMP)

	private HashMap callPAC_IAX_MNTPROD__F_SET_INTERFICIE(String pPCCODIGO, String pPCVALAXIS, String pPCVALEMP,
			String pPCVALDEF, String pPCVALAXISDEF) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPROD.F_SET_INTERFICIE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO", "pPCVALAXIS", "pPCVALEMP", "pPCVALDEF", "pPCVALAXISDEF" },
				new Object[] { pPCCODIGO, pPCVALAXIS, pPCVALEMP, pPCVALDEF, pPCVALAXISDEF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.setObject(3, pPCVALAXIS);
		cStmt.setObject(4, pPCVALEMP);
		cStmt.setObject(5, pPCVALDEF);
		cStmt.setObject(6, pPCVALAXISDEF);
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

	public HashMap ejecutaPAC_IAX_MNTPROD__F_SET_INTERFICIE(String pPCCODIGO, String pPCVALAXIS, String pPCVALEMP,
			String pPCVALDEF, String pPCVALAXISDEF) throws Exception {
		return this.callPAC_IAX_MNTPROD__F_SET_INTERFICIE(pPCCODIGO, pPCVALAXIS, pPCVALEMP, pPCVALDEF, pPCVALAXISDEF);
	}
	// --END-PAC_IAX_MNTPROD.F_SET_INTERFICIE

}
