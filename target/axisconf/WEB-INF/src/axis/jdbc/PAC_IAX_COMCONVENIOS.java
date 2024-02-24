package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_COMCONVENIOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COMCONVENIOS.class);
	private Connection conn = null;

	public PAC_IAX_COMCONVENIOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COMCONVENIOS.F_ALTA_CONVENIO(PTCONVENIO, PCAGENTE, PFINIVIG,
	// PFFINVIG, PIIMPORTE)
	private HashMap callPAC_IAX_COMCONVENIOS__F_ALTA_CONVENIO(String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPIIMPORTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_ALTA_CONVENIO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTCONVENIO", "pPCAGENTE", "pPFINIVIG", "pPFFINVIG", "pPIIMPORTE" },
				new Object[] { pPTCONVENIO, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPIIMPORTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTCONVENIO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPFFINVIG);
		cStmt.setObject(6, pPIIMPORTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PSCOMCONV_OUT"
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
			retVal.put("PSCOMCONV_OUT", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PSCOMCONV_OUT", null);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_ALTA_CONVENIO(String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPIIMPORTE) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_ALTA_CONVENIO(pPTCONVENIO, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPIIMPORTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_ALTA_CONVENIO
	// --START-PAC_IAX_COMCONVENIOS.F_ALTA_CONVENIO_WEB(PCMODO, PSCOMCONV,
	// PTCONVENIO, PCAGENTE, PFINIVIG, PFFINVIG, PFANUL, PIIMPORTE, PLISTAPRODS,
	// PLISTACOMIS)
	private HashMap callPAC_IAX_COMCONVENIOS__F_ALTA_CONVENIO_WEB(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPSCOMCONV, String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.sql.Date pPFANUL, java.math.BigDecimal pPIIMPORTE,
			Object pPLISTAPRODS, Object pPLISTACOMIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_ALTA_CONVENIO_WEB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMODO", "pPSCOMCONV", "pPTCONVENIO", "pPCAGENTE", "pPFINIVIG", "pPFFINVIG", "pPFANUL",
						"pPIIMPORTE", "pPLISTAPRODS", "pPLISTACOMIS" },
				new Object[] { pPCMODO, pPSCOMCONV, pPTCONVENIO, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPFANUL, pPIIMPORTE,
						pPLISTAPRODS, pPLISTACOMIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPSCOMCONV);
		cStmt.setObject(4, pPTCONVENIO);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPFINIVIG);
		cStmt.setObject(7, pPFFINVIG);
		cStmt.setObject(8, pPFANUL);
		cStmt.setObject(9, pPIIMPORTE);
		cStmt.setObject(10, pPLISTAPRODS);
		cStmt.setObject(11, pPLISTACOMIS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.DATE); // Valor de "PFINIVIG_OUT"
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
			retVal.put("PFINIVIG_OUT", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PFINIVIG_OUT", null);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_ALTA_CONVENIO_WEB(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPSCOMCONV, String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.sql.Date pPFANUL, java.math.BigDecimal pPIIMPORTE,
			Object pPLISTAPRODS, Object pPLISTACOMIS) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_ALTA_CONVENIO_WEB(pPCMODO, pPSCOMCONV, pPTCONVENIO, pPCAGENTE,
				pPFINIVIG, pPFFINVIG, pPFANUL, pPIIMPORTE, pPLISTAPRODS, pPLISTACOMIS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMCONVENIOS.F_ALTA_CONVENIO_WEB

	// --START-PAC_IAX_COMCONVENIOS.F_ALTA_MODCOM_CONVENIO(PSCOMCONV, PCMODCOM,
	// PFINIVIG, PPCOMISI)
	private HashMap callPAC_IAX_COMCONVENIOS__F_ALTA_MODCOM_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG, java.math.BigDecimal pPPCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_ALTA_MODCOM_CONVENIO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCOMCONV", "pPCMODCOM", "pPFINIVIG", "pPPCOMISI" },
				new Object[] { pPSCOMCONV, pPCMODCOM, pPFINIVIG, pPPCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCOMCONV);
		cStmt.setObject(3, pPCMODCOM);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPPCOMISI);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_ALTA_MODCOM_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG, java.math.BigDecimal pPPCOMISI) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_ALTA_MODCOM_CONVENIO(pPSCOMCONV, pPCMODCOM, pPFINIVIG, pPPCOMISI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_ALTA_MODCOM_CONVENIO
	// --START-PAC_IAX_COMCONVENIOS.F_ALTA_PROD_CONVENIO(PSCOMCONV, PSPRODUC)
	private HashMap callPAC_IAX_COMCONVENIOS__F_ALTA_PROD_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_ALTA_PROD_CONVENIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCOMCONV", "pPSPRODUC" }, new Object[] { pPSCOMCONV, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCOMCONV);
		cStmt.setObject(3, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_ALTA_PROD_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_ALTA_PROD_CONVENIO(pPSCOMCONV, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_ALTA_PROD_CONVENIO
	// --START-PAC_IAX_COMCONVENIOS.F_GET_CONVENIO_VIG(PSCOMCONV_IN, PFINIVIG_IN)
	private HashMap callPAC_IAX_COMCONVENIOS__F_GET_CONVENIO_VIG(java.math.BigDecimal pPSCOMCONV_IN,
			java.sql.Date pPFINIVIG_IN) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_GET_CONVENIO_VIG(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCOMCONV_IN", "pPFINIVIG_IN" },
				new Object[] { pPSCOMCONV_IN, pPFINIVIG_IN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCOMCONV_IN);
		cStmt.setObject(3, pPFINIVIG_IN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTCONVENIO"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCAGENTE"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PTNOMAGE"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.DATE); // Valor de "PFFINVIG"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PIIMPORTE"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.DATE); // Valor de "PFANUL"
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
			retVal.put("PTCONVENIO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTCONVENIO", null);
		}
		try {
			retVal.put("PCAGENTE", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCAGENTE", null);
		}
		try {
			retVal.put("PTNOMAGE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PTNOMAGE", null);
		}
		try {
			retVal.put("PFFINVIG", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PFFINVIG", null);
		}
		try {
			retVal.put("PIIMPORTE", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PIIMPORTE", null);
		}
		try {
			retVal.put("PFANUL", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PFANUL", null);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_GET_CONVENIO_VIG(java.math.BigDecimal pPSCOMCONV_IN,
			java.sql.Date pPFINIVIG_IN) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_GET_CONVENIO_VIG(pPSCOMCONV_IN, pPFINIVIG_IN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_GET_CONVENIO_VIG
	// --START-PAC_IAX_COMCONVENIOS.F_GET_LSTCONVENIOS(PSPRODUC, PCAGENTE, PFINIVIG,
	// PFFINVIG, pPCRAMO)
	private HashMap callPAC_IAX_COMCONVENIOS__F_GET_LSTCONVENIOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG,
			java.math.BigDecimal pPCRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_GET_LSTCONVENIOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCAGENTE", "pPFINIVIG", "pPFFINVIG", "pPCRAMO" },
				new Object[] { pPSPRODUC, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPFFINVIG);
		cStmt.setObject(6, pPCRAMO);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_GET_LSTCONVENIOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG,
			java.math.BigDecimal pPCRAMO) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_GET_LSTCONVENIOS(pPSPRODUC, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPCRAMO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_GET_LSTCONVENIOS
	// --START-PAC_IAX_COMCONVENIOS.F_GET_MODCOM_CONV(PSCOMCONV, PFINIVIG)
	private HashMap callPAC_IAX_COMCONVENIOS__F_GET_MODCOM_CONV(java.math.BigDecimal pPSCOMCONV,
			java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_GET_MODCOM_CONV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCOMCONV", "pPFINIVIG" }, new Object[] { pPSCOMCONV, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCOMCONV);
		cStmt.setObject(3, pPFINIVIG);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_GET_MODCOM_CONV(java.math.BigDecimal pPSCOMCONV,
			java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_GET_MODCOM_CONV(pPSCOMCONV, pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_GET_MODCOM_CONV
	// --START-PAC_IAX_COMCONVENIOS.F_GET_PRODCONVENIO(PSCOMCONV)
	private HashMap callPAC_IAX_COMCONVENIOS__F_GET_PRODCONVENIO(java.math.BigDecimal pPSCOMCONV) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_GET_PRODCONVENIO(?, ?)}";

		logCall(callQuery, new String[] { "pPSCOMCONV" }, new Object[] { pPSCOMCONV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCOMCONV);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_GET_PRODCONVENIO(java.math.BigDecimal pPSCOMCONV) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_GET_PRODCONVENIO(pPSCOMCONV);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_GET_PRODCONVENIO
	// --START-PAC_IAX_COMCONVENIOS.F_SET_CONVENIO_FEC(PCMODO, PSCOMCONV,
	// PTCONVENIO, PCAGENTE, PFINIVIG, PFFINVIG, PIIMPORTE, PFANUL)
	private HashMap callPAC_IAX_COMCONVENIOS__F_SET_CONVENIO_FEC(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPSCOMCONV, String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPIIMPORTE, java.sql.Date pPFANUL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_SET_CONVENIO_FEC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMODO", "pPSCOMCONV", "pPTCONVENIO", "pPCAGENTE", "pPFINIVIG", "pPFFINVIG",
						"pPIIMPORTE", "pPFANUL" },
				new Object[] { pPCMODO, pPSCOMCONV, pPTCONVENIO, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPIIMPORTE,
						pPFANUL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPSCOMCONV);
		cStmt.setObject(4, pPTCONVENIO);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPFINIVIG);
		cStmt.setObject(7, pPFFINVIG);
		cStmt.setObject(8, pPIIMPORTE);
		cStmt.setObject(9, pPFANUL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.DATE); // Valor de "PFINIVIG_OUT"
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
			retVal.put("PFINIVIG_OUT", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PFINIVIG_OUT", null);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_SET_CONVENIO_FEC(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPSCOMCONV, String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPIIMPORTE, java.sql.Date pPFANUL)
			throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_SET_CONVENIO_FEC(pPCMODO, pPSCOMCONV, pPTCONVENIO, pPCAGENTE, pPFINIVIG,
				pPFFINVIG, pPIIMPORTE, pPFANUL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_SET_CONVENIO_FEC
	// --START-PAC_IAX_COMCONVENIOS.F_VAL_CONVENIO(PCMODO, PSCOMCONV, PTCONVENIO,
	// PCAGENTE, PFINIVIG, PFFINVIG, PIIMPORTE, PFANUL)
	private HashMap callPAC_IAX_COMCONVENIOS__F_VAL_CONVENIO(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPSCOMCONV, String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPIIMPORTE, java.sql.Date pPFANUL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_VAL_CONVENIO(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMODO", "pPSCOMCONV", "pPTCONVENIO", "pPCAGENTE", "pPFINIVIG", "pPFFINVIG",
						"pPIIMPORTE", "pPFANUL" },
				new Object[] { pPCMODO, pPSCOMCONV, pPTCONVENIO, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPIIMPORTE,
						pPFANUL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPSCOMCONV);
		cStmt.setObject(4, pPTCONVENIO);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPFINIVIG);
		cStmt.setObject(7, pPFFINVIG);
		cStmt.setObject(8, pPIIMPORTE);
		cStmt.setObject(9, pPFANUL);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_VAL_CONVENIO(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPSCOMCONV, String pPTCONVENIO, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, java.math.BigDecimal pPIIMPORTE, java.sql.Date pPFANUL)
			throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_VAL_CONVENIO(pPCMODO, pPSCOMCONV, pPTCONVENIO, pPCAGENTE, pPFINIVIG,
				pPFFINVIG, pPIIMPORTE, pPFANUL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_VAL_CONVENIO
	// --START-PAC_IAX_COMCONVENIOS.F_VAL_MODCOM_CONVENIO(PSCOMCONV, PCMODCOM,
	// PPCOMISI)
	private HashMap callPAC_IAX_COMCONVENIOS__F_VAL_MODCOM_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPCMODCOM, java.math.BigDecimal pPPCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_VAL_MODCOM_CONVENIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCOMCONV", "pPCMODCOM", "pPPCOMISI" },
				new Object[] { pPSCOMCONV, pPCMODCOM, pPPCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCOMCONV);
		cStmt.setObject(3, pPCMODCOM);
		cStmt.setObject(4, pPPCOMISI);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_VAL_MODCOM_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPCMODCOM, java.math.BigDecimal pPPCOMISI) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_VAL_MODCOM_CONVENIO(pPSCOMCONV, pPCMODCOM, pPPCOMISI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMCONVENIOS.F_VAL_MODCOM_CONVENIO
	// --START-PAC_IAX_COMCONVENIOS.F_VAL_PROD_CONVENIO(PSCOMCONV, PCAGENTE,
	// PFINIVIG, PFFINVIG, PSPRODUC)
	private HashMap callPAC_IAX_COMCONVENIOS__F_VAL_PROD_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_VAL_PROD_CONVENIO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCOMCONV", "pPCAGENTE", "pPFINIVIG", "pPFFINVIG", "pPSPRODUC" },
				new Object[] { pPSCOMCONV, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCOMCONV);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPFINIVIG);
		cStmt.setObject(5, pPFFINVIG);
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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_VAL_PROD_CONVENIO(java.math.BigDecimal pPSCOMCONV,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_VAL_PROD_CONVENIO(pPSCOMCONV, pPCAGENTE, pPFINIVIG, pPFFINVIG,
				pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMCONVENIOS.F_VAL_PROD_CONVENIO

	// --START-PAC_IAX_COMCONVENIOS.F_GET_NEXT_CONV()
	private HashMap callPAC_IAX_COMCONVENIOS__F_GET_NEXT_CONV() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMCONVENIOS.F_GET_NEXT_CONV(?)}";

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

	public HashMap ejecutaPAC_IAX_COMCONVENIOS__F_GET_NEXT_CONV() throws Exception {
		return this.callPAC_IAX_COMCONVENIOS__F_GET_NEXT_CONV();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMCONVENIOS.F_GET_NEXT_CONV

}
