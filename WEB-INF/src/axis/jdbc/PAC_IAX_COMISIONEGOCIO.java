
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

public class PAC_IAX_COMISIONEGOCIO extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COMISIONEGOCIO.class);
	private Connection conn = null;

	public PAC_IAX_COMISIONEGOCIO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COMISIONEGOCIO.F_DEL_AGECONVCOMESP(PCCODCONV, PCAGENTE)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_DEL_AGECONVCOMESP(java.math.BigDecimal pPCCODCONV,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_DEL_AGECONVCOMESP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODCONV", "pPCAGENTE" }, new Object[] { pPCCODCONV, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
		cStmt.setObject(3, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_DEL_AGECONVCOMESP(java.math.BigDecimal pPCCODCONV,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_DEL_AGECONVCOMESP(pPCCODCONV, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONEGOCIO.F_DEL_AGECONVCOMESP
	// --START-PAC_IAX_COMISIONEGOCIO.F_DEL_TOMCONVCOMESP(PCCODCONV, PSPERSON)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_DEL_TOMCONVCOMESP(java.math.BigDecimal pPCCODCONV,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_DEL_TOMCONVCOMESP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODCONV", "pPSPERSON" }, new Object[] { pPCCODCONV, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_DEL_TOMCONVCOMESP(java.math.BigDecimal pPCCODCONV,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_DEL_TOMCONVCOMESP(pPCCODCONV, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONEGOCIO.F_DEL_TOMCONVCOMESP
	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_AGECONVCOMESP(PCCODCONV)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_AGECONVCOMESP(java.math.BigDecimal pPCCODCONV) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_AGECONVCOMESP(?, ?)}";

		logCall(callQuery, new String[] { "pPCCODCONV" }, new Object[] { pPCCODCONV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_AGECONVCOMESP(java.math.BigDecimal pPCCODCONV)
			throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_AGECONVCOMESP(pPCCODCONV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_AGECONVCOMESP

	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_DATCONVCOMESP(PCCODCONV)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_DATCONVCOMESP(java.math.BigDecimal pPCCODCONV) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_DATCONVCOMESP(?, ?)}";

		logCall(callQuery, new String[] { "pPCCODCONV" }, new Object[] { pPCCODCONV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CONVCOMESP".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_DATCONVCOMESP(java.math.BigDecimal pPCCODCONV)
			throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_DATCONVCOMESP(pPCCODCONV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_DATCONVCOMESP

	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_LSTCONVCOMESP(PCCODCONV, PTDESCONV,
	// PFINIVIG, PFFINVIG, PSPRODUC, PCAGENTE, PTNOMTOM)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_LSTCONVCOMESP(java.math.BigDecimal pPCCODCONV, String pPTDESCONV,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, String pPTNOMTOM, java.math.BigDecimal pPCRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_LSTCONVCOMESP(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODCONV", "pPTDESCONV", "pPFINIVIG", "pPFFINVIG", "pPSPRODUC", "pPCAGENTE",
						"pPTNOMTOM", "pPCRAMO" },
				new Object[] { pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG, pPSPRODUC, pPCAGENTE, pPTNOMTOM,
						pPCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
		cStmt.setObject(3, pPTDESCONV);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPFFINVIG);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCAGENTE);
		cStmt.setObject(8, pPTNOMTOM);
		cStmt.setObject(9, pPCRAMO);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_LSTCONVCOMESP(java.math.BigDecimal pPCCODCONV,
			String pPTDESCONV, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, String pPTNOMTOM, BigDecimal pPCRAMO) throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_LSTCONVCOMESP(pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG,
				pPSPRODUC, pPCAGENTE, pPTNOMTOM, pPCRAMO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_LSTCONVCOMESP
	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_PORCENCONVCOMESP(PSPRODUC, PCAGENTE,
	// PSPERSON, PFEMISIO)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_PORCENCONVCOMESP(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON, java.sql.Date pPFEMISIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_PORCENCONVCOMESP(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCAGENTE", "pPSPERSON", "pPFEMISIO" },
				new Object[] { pPSPRODUC, pPCAGENTE, pPSPERSON, pPFEMISIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPFEMISIO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GSTCOMISION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_PORCENCONVCOMESP(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON, java.sql.Date pPFEMISIO) throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_PORCENCONVCOMESP(pPSPRODUC, pPCAGENTE, pPSPERSON, pPFEMISIO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_PORCENCONVCOMESP
	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_PRODCONVCOMESP(PCCODCONV)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_PRODCONVCOMESP(java.math.BigDecimal pPCCODCONV) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_PRODCONVCOMESP(?, ?)}";

		logCall(callQuery, new String[] { "pPCCODCONV" }, new Object[] { pPCCODCONV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_PRODCONVCOMESP(java.math.BigDecimal pPCCODCONV)
			throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_PRODCONVCOMESP(pPCCODCONV);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_PRODCONVCOMESP
	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_TOMCONVCOMESP(PCCODCONV)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_TOMCONVCOMESP(java.math.BigDecimal pPCCODCONV) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_TOMCONVCOMESP(?, ?)}";

		logCall(callQuery, new String[] { "pPCCODCONV" }, new Object[] { pPCCODCONV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TOMCONVCOMESP(java.math.BigDecimal pPCCODCONV)
			throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_TOMCONVCOMESP(pPCCODCONV);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_TOMCONVCOMESP
	// --START-PAC_IAX_COMISIONEGOCIO.F_SET_DATCONVCOMESP(PCCODCONV, PTDESCONV,
	// PFINIVIG, PFFINVIG, PLISTAPRODS, PLISTACOMIS, PCAGENTE, PSPERSON)
	// INI IAXIS 4081 AABG: Se agrega nuevos parametros
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_SET_DATCONVCOMESP(java.math.BigDecimal pPCCODCONV, String pPTDESCONV,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, Object pPLISTAPRODS, Object pPLISTACOMIS,
			java.math.BigDecimal pPCAGENTE, String pPSPERSON, String pNNUMIDE, String pTASA, String pPRIMA,
			String pPRIMAUSD, String pPRIMAEUR, String pGASTEXP, java.math.BigDecimal pCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_SET_DATCONVCOMESP(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODCONV", "pPTDESCONV", "pPFINIVIG", "pPFFINVIG", "pPLISTAPRODS", "pPLISTACOMIS",
						"pPCAGENTE", "pPSPERSON", "pNNUMIDE", "pTASA", "pPRIMA", "pPRIMAUSD", "pPRIMAEUR", "pGASTEXP",
						"pCACTIVI" },
				new Object[] { pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG, pPLISTAPRODS, pPLISTACOMIS, pPCAGENTE,
						pPSPERSON, pNNUMIDE, pTASA, pPRIMA, pPRIMAUSD, pPRIMAEUR, pGASTEXP, pCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
		cStmt.setObject(3, pPTDESCONV);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPFFINVIG);
		cStmt.setObject(6, pPLISTAPRODS);
		cStmt.setObject(7, pPLISTACOMIS);
		cStmt.setObject(8, pPCAGENTE);
		cStmt.setObject(9, pPSPERSON);
		cStmt.setObject(10, pNNUMIDE);
		cStmt.setObject(11, pTASA);
		cStmt.setObject(12, pPRIMA);
		cStmt.setObject(13, pPRIMAUSD);
		cStmt.setObject(14, pPRIMAEUR);
		cStmt.setObject(15, pGASTEXP);
		cStmt.setObject(16, pCACTIVI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(17, java.sql.Types.NUMERIC); // Valor de "PCCODCONV_OUT"
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
			retVal.put("PCCODCONV_OUT", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("PCCODCONV_OUT", null);
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
	// FIN IAXIS 4081 AABG: Se agrega nuevos parametros

	// INI IAXIS 4081 AABG: Se agrega nuevos parametros
	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_SET_DATCONVCOMESP(java.math.BigDecimal pPCCODCONV,
			String pPTDESCONV, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, Object pPLISTAPRODS,
			Object pPLISTACOMIS, java.math.BigDecimal pPCAGENTE, String pPSPERSON, String pNNUMIDE, String pTASA,
			String pPRIMA, String pPRIMAUSD, String pPRIMAEUR, String pGASTEXP, java.math.BigDecimal pCACTIVI)
			throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_SET_DATCONVCOMESP(pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG,
				pPLISTAPRODS, pPLISTACOMIS, pPCAGENTE, pPSPERSON, pNNUMIDE, pTASA, pPRIMA, pPRIMAUSD, pPRIMAEUR,
				pGASTEXP, pCACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// FIN IAXIS 4081 AABG: Se agrega nuevos parametros
	// --END-PAC_IAX_COMISIONEGOCIO.F_SET_DATCONVCOMESP

	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_NEXT_CONV()
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_NEXT_CONV() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_NEXT_CONV(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PCCODCONV_OUT"
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
			retVal.put("PCCODCONV_OUT", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCCODCONV_OUT", null);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_NEXT_CONV() throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_NEXT_CONV();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_NEXT_CONV

	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_TIENECONVCOMESP(PSPERSONTON, PCAGENTE,
	// PSPRODUC, FEFECTO)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_TIENECONVCOMESP(java.math.BigDecimal pPSPERSONTON,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPRODUC, java.sql.Date pFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_TIENECONVCOMESP(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSONTON", "pPCAGENTE", "pPSPRODUC", "pFEFECTO" },
				new Object[] { pPSPERSONTON, pPCAGENTE, pPSPRODUC, pFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSONTON);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pFEFECTO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCONVENIO"
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
			retVal.put("PCONVENIO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCONVENIO", null);
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

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TIENECONVCOMESP(java.math.BigDecimal pPSPERSONTON,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPRODUC, java.sql.Date pFEFECTO) throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_TIENECONVCOMESP(pPSPERSONTON, pPCAGENTE, pPSPRODUC, pFEFECTO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONEGOCIO.F_GET_TIENECONVCOMESP

	// --START-PAC_IAX_COMISIONEGOCIO.F_GET_TASA_PRIMA(PCCODCONV, PCNNUMIDE,
	// PCCODPRODUCTO, PCOPCION)
	private HashMap callPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(java.math.BigDecimal pPCCODCONV,
			java.math.BigDecimal pPCNNUMIDE, java.math.BigDecimal pPCCODPRODUCTO, java.math.BigDecimal pPCOPCION,
			java.math.BigDecimal pPCCODGARANTIA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONEGOCIO.F_GET_TASA_PRIMA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODCONV", "pPCNNUMIDE", "pPCCODPRODUCTO", "pPCOPCION", "pPCCODGARANTIA" },
				new Object[] { pPCCODCONV, pPCNNUMIDE, pPCCODPRODUCTO, pPCOPCION, pPCCODGARANTIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
		cStmt.setObject(3, pPCNNUMIDE);
		cStmt.setObject(4, pPCCODPRODUCTO);
		cStmt.setObject(5, pPCOPCION);
		cStmt.setObject(6, pPCCODGARANTIA);
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
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(java.math.BigDecimal pPCCODCONV,
			java.math.BigDecimal pPCNNUMIDE, java.math.BigDecimal pPCCODPRODUCTO, java.math.BigDecimal pPCOPCION,
			java.math.BigDecimal pPCCODGARANTIA) throws Exception {
		return this.callPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(pPCCODCONV, pPCNNUMIDE, pPCCODPRODUCTO, pPCOPCION,
				pPCCODGARANTIA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONEGOCIO.F_DEL_AGECONVCOMESP

}
