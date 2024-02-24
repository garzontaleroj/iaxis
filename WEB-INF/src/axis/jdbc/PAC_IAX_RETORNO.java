package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_RETORNO extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_RETORNO.class);
	private Connection conn = null;

	public PAC_IAX_RETORNO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_RETORNO.F_DEL_AGECONVENIO(PIDCONVENIO, PCAGENTE)
	private HashMap callPAC_IAX_RETORNO__F_DEL_AGECONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_DEL_AGECONVENIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO", "pPCAGENTE" }, new Object[] { pPIDCONVENIO, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_DEL_AGECONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_RETORNO__F_DEL_AGECONVENIO(pPIDCONVENIO, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RETORNO.F_DEL_AGECONVENIO
	// --START-PAC_IAX_RETORNO.F_DEL_BENEFCONVENIO(PIDCONVENIO, PSPERSON)
	private HashMap callPAC_IAX_RETORNO__F_DEL_BENEFCONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_DEL_BENEFCONVENIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO", "pPSPERSON" }, new Object[] { pPIDCONVENIO, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_DEL_BENEFCONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_RETORNO__F_DEL_BENEFCONVENIO(pPIDCONVENIO, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RETORNO.F_DEL_BENEFCONVENIO
	// --START-PAC_IAX_RETORNO.F_GET_AGECONVENIO(PIDCONVENIO)
	private HashMap callPAC_IAX_RETORNO__F_GET_AGECONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_GET_AGECONVENIO(?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO" }, new Object[] { pPIDCONVENIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_GET_AGECONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		return this.callPAC_IAX_RETORNO__F_GET_AGECONVENIO(pPIDCONVENIO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RETORNO.F_GET_AGECONVENIO
	// --START-PAC_IAX_RETORNO.F_GET_BENEFCONVENIO(PIDCONVENIO)
	private HashMap callPAC_IAX_RETORNO__F_GET_BENEFCONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_GET_BENEFCONVENIO(?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO" }, new Object[] { pPIDCONVENIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_GET_BENEFCONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		return this.callPAC_IAX_RETORNO__F_GET_BENEFCONVENIO(pPIDCONVENIO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RETORNO.F_GET_BENEFCONVENIO
	// --START-PAC_IAX_RETORNO.F_GET_DATCONVENIO(PIDCONVENIO)
	private HashMap callPAC_IAX_RETORNO__F_GET_DATCONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_GET_DATCONVENIO(?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO" }, new Object[] { pPIDCONVENIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_GET_DATCONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		return this.callPAC_IAX_RETORNO__F_GET_DATCONVENIO(pPIDCONVENIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_GET_DATCONVENIO

	// bug 0025691
	// --START-PAC_IAX_RETORNO.F_GET_LSTCONVENIOS(PCCODCONV, PTDESCONV, PFINIVIG,
	// PFFINVIG, PCRAMO, PSPRODUC, PCAGENTE, PTNOMBNF, PSUCURSAL, PADNSUC)
	private HashMap callPAC_IAX_RETORNO__F_GET_LSTCONVENIOS(String pPCCODCONV, String pPTDESCONV,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGENTE, String pPTNOMBNF,
			java.math.BigDecimal pPSUCURSAL, java.math.BigDecimal pPADNSUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_GET_LSTCONVENIOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODCONV", "pPTDESCONV", "pPFINIVIG", "pPFFINVIG", "pPCRAMO", "pPSPRODUC",
						"pPCAGENTE", "pPTNOMBNF", "pPSUCURSAL", "pPADNSUC" },
				new Object[] { pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG, pPCRAMO, pPSPRODUC, pPCAGENTE, pPTNOMBNF,
						pPSUCURSAL, pPADNSUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODCONV);
		cStmt.setObject(3, pPTDESCONV);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPFFINVIG);
		cStmt.setObject(6, pPCRAMO);
		cStmt.setObject(7, pPSPRODUC);
		cStmt.setObject(8, pPCAGENTE);
		cStmt.setObject(9, pPTNOMBNF);
		cStmt.setObject(10, pPSUCURSAL);
		cStmt.setObject(11, pPADNSUC);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_GET_LSTCONVENIOS(String pPCCODCONV, String pPTDESCONV,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGENTE, String pPTNOMBNF,
			java.math.BigDecimal pPSUCURSAL, java.math.BigDecimal pPADNSUC) throws Exception {
		return this.callPAC_IAX_RETORNO__F_GET_LSTCONVENIOS(pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG, pPCRAMO,
				pPSPRODUC, pPCAGENTE, pPTNOMBNF, pPSUCURSAL, pPADNSUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_GET_LSTCONVENIOS

	// --START-PAC_IAX_RETORNO.F_GET_PRODCONVENIO(PIDCONVENIO)
	private HashMap callPAC_IAX_RETORNO__F_GET_PRODCONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_GET_PRODCONVENIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO" }, new Object[] { pPIDCONVENIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCRAMO"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTRAMO"
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
			retVal.put("PCRAMO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCRAMO", null);
		}
		try {
			retVal.put("PTRAMO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTRAMO", null);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_GET_PRODCONVENIO(java.math.BigDecimal pPIDCONVENIO) throws Exception {
		return this.callPAC_IAX_RETORNO__F_GET_PRODCONVENIO(pPIDCONVENIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_GET_PRODCONVENIO

	// --START-PAC_IAX_RETORNO.F_GET_RTNCONVENIOS(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_RETORNO__F_GET_RTNCONVENIOS(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_GET_RTNCONVENIOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_GET_RTNCONVENIOS(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_RETORNO__F_GET_RTNCONVENIOS(pPSSEGURO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RETORNO.F_GET_RTNCONVENIOS
	// --START-PAC_IAX_RETORNO.F_SET_AGECONVENIO(PIDCONVENIO, PCAGENTE)
	private HashMap callPAC_IAX_RETORNO__F_SET_AGECONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_SET_AGECONVENIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO", "pPCAGENTE" }, new Object[] { pPIDCONVENIO, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_SET_AGECONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_RETORNO__F_SET_AGECONVENIO(pPIDCONVENIO, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_SET_AGECONVENIO

	// bug 0025580

	// bug 0025815
	// --START-PAC_IAX_RETORNO.F_SET_BENEFCONVENIO(PIDCONVENIO, PSPERSON, PPRETORNO)
	private HashMap callPAC_IAX_RETORNO__F_SET_BENEFCONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPPRETORNO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_SET_BENEFCONVENIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO", "pPSPERSON", "pPPRETORNO" },
				new Object[] { pPIDCONVENIO, pPSPERSON, pPPRETORNO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPPRETORNO);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_SET_BENEFCONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPPRETORNO) throws Exception {
		return this.callPAC_IAX_RETORNO__F_SET_BENEFCONVENIO(pPIDCONVENIO, pPSPERSON, pPPRETORNO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_SET_BENEFCONVENIO

	// bug 0025815
	// --START-PAC_IAX_RETORNO.F_SET_DATCONVENIO(PIDCONVENIO, PCCODCONV, PTDESCONV,
	// PFINIVIG, PFFINVIG, PSPERSON)
	private HashMap callPAC_IAX_RETORNO__F_SET_DATCONVENIO(java.math.BigDecimal pPIDCONVENIO, String pPCCODCONV,
			String pPTDESCONV, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_SET_DATCONVENIO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDCONVENIO", "pPCCODCONV", "pPTDESCONV", "pPFINIVIG", "pPFFINVIG", "pPSPERSON" },
				new Object[] { pPIDCONVENIO, pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
		cStmt.setObject(3, pPCCODCONV);
		cStmt.setObject(4, pPTDESCONV);
		cStmt.setObject(5, pPFINIVIG);
		cStmt.setObject(6, pPFFINVIG);
		cStmt.setObject(7, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PIDCONVENIO_OUT"
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
			retVal.put("PIDCONVENIO_OUT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PIDCONVENIO_OUT", null);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_SET_DATCONVENIO(java.math.BigDecimal pPIDCONVENIO, String pPCCODCONV,
			String pPTDESCONV, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPSPERSON)
			throws Exception {
		return this.callPAC_IAX_RETORNO__F_SET_DATCONVENIO(pPIDCONVENIO, pPCCODCONV, pPTDESCONV, pPFINIVIG, pPFFINVIG,
				pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_SET_DATCONVENIO

	// --START-PAC_IAX_RETORNO.F_SET_PRODCONVENIO(PIDCONVENIO, PLISTACONVE)
	private HashMap callPAC_IAX_RETORNO__F_SET_PRODCONVENIO(java.math.BigDecimal pPIDCONVENIO, Object pPLISTACONVE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_SET_PRODCONVENIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO", "pPLISTACONVE" },
				new Object[] { pPIDCONVENIO, pPLISTACONVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
		cStmt.setObject(3, pPLISTACONVE);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_SET_PRODCONVENIO(java.math.BigDecimal pPIDCONVENIO, Object pPLISTACONVE)
			throws Exception {
		return this.callPAC_IAX_RETORNO__F_SET_PRODCONVENIO(pPIDCONVENIO, pPLISTACONVE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_SET_PRODCONVENIO

	// bug 0024892
	// --START-PAC_IAX_RETORNO.F_OBLIG_CONVENIO(PIDCONVENIO, PACCION)
	private HashMap callPAC_IAX_RETORNO__F_OBLIG_CONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPACCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_OBLIG_CONVENIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCONVENIO", "pPACCION" }, new Object[] { pPIDCONVENIO, pPACCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCONVENIO);
		cStmt.setObject(3, pPACCION);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PRESULT"
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
			retVal.put("PRESULT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PRESULT", null);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_OBLIG_CONVENIO(java.math.BigDecimal pPIDCONVENIO,
			java.math.BigDecimal pPACCION) throws Exception {
		return this.callPAC_IAX_RETORNO__F_OBLIG_CONVENIO(pPIDCONVENIO, pPACCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_OBLIG_CONVENIO

	// --START-PAC_IAX_RETORNO.F_BUSCA_CONVENIORETORNO()
	private HashMap callPAC_IAX_RETORNO__F_BUSCA_CONVENIORETORNO() throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_BUSCA_CONVENIORETORNO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PIDCONVENIO"
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
			retVal.put("PIDCONVENIO", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PIDCONVENIO", null);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_BUSCA_CONVENIORETORNO() throws Exception {
		return this.callPAC_IAX_RETORNO__F_BUSCA_CONVENIORETORNO();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_BUSCA_CONVENIORETORNO

	// --START-PAC_IAX_RETORNO.F_BUSCA_CONVENIORETORNO_POL()
	private HashMap callPAC_IAX_RETORNO__F_BUSCA_CONVENIORETORNO_POL() throws Exception {
		String callQuery = "{?=call PAC_IAX_RETORNO.F_BUSCA_CONVENIORETORNO_POL(?, ?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PIDCONVENIO"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PDONDE"
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
			retVal.put("PIDCONVENIO", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PIDCONVENIO", null);
		}
		try {
			retVal.put("PDONDE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDONDE", null);
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

	public HashMap ejecutaPAC_IAX_RETORNO__F_BUSCA_CONVENIORETORNO_POL() throws Exception {
		return this.callPAC_IAX_RETORNO__F_BUSCA_CONVENIORETORNO_POL();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RETORNO.F_BUSCA_CONVENIORETORNO_POL

}
