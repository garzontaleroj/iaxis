package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CIERRES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CIERRES.class);
	private Connection conn = null;

	public PAC_IAX_CIERRES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CIERRES.F_EJECUTAR()

	private HashMap callPAC_IAX_CIERRES__F_EJECUTAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_EJECUTAR(?)}";
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_EJECUTAR() throws Exception {
		return this.callPAC_IAX_CIERRES__F_EJECUTAR();
	}
	// --END-PAC_IAX_CIERRES.F_EJECUTAR

	// --START-PAC_IAX_CIERRES.F_GET_CIERRE(PCEMPRES, PCTIPO, PFPERINI)

	private HashMap callPAC_IAX_CIERRES__F_GET_CIERRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.sql.Date pPFPERINI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_GET_CIERRE(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTIPO", "pPFPERINI" },
				new Object[] { pPCEMPRES, pPCTIPO, pPFPERINI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFPERINI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CIERRES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_GET_CIERRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.sql.Date pPFPERINI) throws Exception {
		return this.callPAC_IAX_CIERRES__F_GET_CIERRE(pPCEMPRES, pPCTIPO, pPFPERINI);
	}
	// --END-PAC_IAX_CIERRES.F_GET_CIERRE

	// --START-PAC_IAX_CIERRES.F_GET_CIERRES(PCEMPRES, PCTIPO, PCESTADO, PFCIERRE)

	private HashMap callPAC_IAX_CIERRES__F_GET_CIERRES(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCESTADO, java.sql.Date pPFCIERRE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_GET_CIERRES(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTIPO", "pPCESTADO", "pPFCIERRE" },
				new Object[] { pPCEMPRES, pPCTIPO, pPCESTADO, pPFCIERRE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCESTADO);
		cStmt.setObject(5, pPFCIERRE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CIERRES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_GET_CIERRES(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCESTADO, java.sql.Date pPFCIERRE) throws Exception {
		return this.callPAC_IAX_CIERRES__F_GET_CIERRES(pPCEMPRES, pPCTIPO, pPCESTADO, pPFCIERRE);
	}
	// --END-PAC_IAX_CIERRES.F_GET_CIERRES

	// --START-PAC_IAX_CIERRES.F_GET_MODIFICABLE(PCESTADO)

	private HashMap callPAC_IAX_CIERRES__F_GET_MODIFICABLE(java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_GET_MODIFICABLE(?,?)}";
		logCall(callQuery, new String[] { "pPCESTADO" }, new Object[] { pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESTADO);
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_GET_MODIFICABLE(java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_CIERRES__F_GET_MODIFICABLE(pPCESTADO);
	}
	// --END-PAC_IAX_CIERRES.F_GET_MODIFICABLE

	// --START-PAC_IAX_CIERRES.F_GET_VALIDACION(PCEMPRES, PCTIPO)

	private HashMap callPAC_IAX_CIERRES__F_GET_VALIDACION(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_GET_VALIDACION(?,?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTIPO" }, new Object[] { pPCEMPRES, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTIPO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PFPERINI"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "PFPERFIN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.DATE); // Valor de "PFCIERRE"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PMODIF"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PPREVIO"
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
			retVal.put("PFPERINI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFPERINI", null);
		}
		try {
			retVal.put("PFPERFIN", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFPERFIN", null);
		}
		try {
			retVal.put("PFCIERRE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PFCIERRE", null);
		}
		try {
			retVal.put("PMODIF", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PMODIF", null);
		}
		try {
			retVal.put("PPREVIO", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PPREVIO", null);
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_GET_VALIDACION(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_CIERRES__F_GET_VALIDACION(pPCEMPRES, pPCTIPO);
	}
	// --END-PAC_IAX_CIERRES.F_GET_VALIDACION

	// --START-PAC_IAX_CIERRES.F_SET_CIERRES(PCEMPRES, PCTIPO, PCESTADO, PFPERINI,
	// PFPERFIN, PFCIERRE)

	private HashMap callPAC_IAX_CIERRES__F_SET_CIERRES(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCESTADO, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN, java.sql.Date pPFCIERRE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_SET_CIERRES(?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTIPO", "pPCESTADO", "pPFPERINI", "pPFPERFIN", "pPFCIERRE" },
				new Object[] { pPCEMPRES, pPCTIPO, pPCESTADO, pPFPERINI, pPFPERFIN, pPFCIERRE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCESTADO);
		cStmt.setObject(5, pPFPERINI);
		cStmt.setObject(6, pPFPERFIN);
		cStmt.setObject(7, pPFCIERRE);
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_SET_CIERRES(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCESTADO, java.sql.Date pPFPERINI, java.sql.Date pPFPERFIN, java.sql.Date pPFCIERRE)
			throws Exception {
		return this.callPAC_IAX_CIERRES__F_SET_CIERRES(pPCEMPRES, pPCTIPO, pPCESTADO, pPFPERINI, pPFPERFIN, pPFCIERRE);
	}
	// --END-PAC_IAX_CIERRES.F_SET_CIERRES

	// --START-PAC_IAX_CIERRES.F_CONFIG_CIERRE(PCEMPRES, PCTIPO)

	private HashMap callPAC_IAX_CIERRES__F_CONFIG_CIERRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_CONFIG_CIERRE(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTIPO" }, new Object[] { pPCEMPRES, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTIPO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PFECMODIF"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PPREVIO"
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
			retVal.put("PFECMODIF", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFECMODIF", null);
		}
		try {
			retVal.put("PPREVIO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PPREVIO", null);
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_CONFIG_CIERRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO)
			throws Exception {
		return this.callPAC_IAX_CIERRES__F_CONFIG_CIERRE(pPCEMPRES, pPCTIPO);
	}
	// --END-PAC_IAX_CIERRES.F_CONFIG_CIERRE

	// --START-PAC_IAX_CIERRES.F_BORRAR_CIERRE(PCEMPRES, PCTIPO, PFPERINI, PCESTADO)

	private HashMap callPAC_IAX_CIERRES__F_BORRAR_CIERRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.sql.Date pPFPERINI, java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CIERRES.F_BORRAR_CIERRE(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTIPO", "pPFPERINI", "pPCESTADO" },
				new Object[] { pPCEMPRES, pPCTIPO, pPFPERINI, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPFPERINI);
		cStmt.setObject(5, pPCESTADO);
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

	public HashMap ejecutaPAC_IAX_CIERRES__F_BORRAR_CIERRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPO,
			java.sql.Date pPFPERINI, java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_CIERRES__F_BORRAR_CIERRE(pPCEMPRES, pPCTIPO, pPFPERINI, pPCESTADO);
	}
	// --END-PAC_IAX_CIERRES.F_BORRAR_CIERRE

}
