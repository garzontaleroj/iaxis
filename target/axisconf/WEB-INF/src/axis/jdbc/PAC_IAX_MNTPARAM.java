package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MNTPARAM extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MNTPARAM.class);
	private Connection conn = null;

	public PAC_IAX_MNTPARAM(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MNTPARAM.F_GET_ACTPARAM(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_MNTPARAM__F_GET_ACTPARAM(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_ACTPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_ACTPARAM(pPSPRODUC, pPCACTIVI);
	}

	// --END-PAC_IAX_MNTPARAM.F_GET_ACTPARAM
	// --START-PAC_IAX_MNTPARAM.F_GET_CONPARAM()
	private HashMap callPAC_IAX_MNTPARAM__F_GET_CONPARAM() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_CONPARAM(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_CONPARAM() throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_CONPARAM();
	}

	// --END-PAC_IAX_MNTPARAM.F_GET_CONPARAM
	// --START-PAC_IAX_MNTPARAM.F_GET_DESCPARAM(PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_GET_DESCPARAM(String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_DESCPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM" }, new Object[] { pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_DESCPARAM(String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_DESCPARAM(pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM.F_GET_DESCPARAM
	// --START-PAC_IAX_MNTPARAM.F_GET_EMPPARAM(PCEMPRES)
	private HashMap callPAC_IAX_MNTPARAM__F_GET_EMPPARAM(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_EMPPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_EMPPARAM(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_EMPPARAM(pPCEMPRES);
	}

	// --END-PAC_IAX_MNTPARAM.F_GET_EMPPARAM
	// --START-PAC_IAX_MNTPARAM.F_GET_GARPARAM(PSPRODUC, PCACTIVI, PCGARANT)
	private HashMap callPAC_IAX_MNTPARAM__F_GET_GARPARAM(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_GARPARAM(?,?,?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_GARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_GARPARAM(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}

	// --END-PAC_IAX_MNTPARAM.F_GET_GARPARAM
	// --START-PAC_IAX_MNTPARAM.F_GET_INSPARAM()
	private HashMap callPAC_IAX_MNTPARAM__F_GET_INSPARAM() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_INSPARAM(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_INSPARAM() throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_INSPARAM();
	}

	// --END-PAC_IAX_MNTPARAM.F_GET_INSPARAM
	// --START-PAC_IAX_MNTPARAM.F_GET_PRODPARAM(PSPRODUC)
	private HashMap callPAC_IAX_MNTPARAM__F_GET_PRODPARAM(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_PRODPARAM(?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_PRODPARAM(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_PRODPARAM(pPSPRODUC);
	}

	// --END-PAC_IAX_MNTPARAM.F_GET_PRODPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_ACTPARAM(PSPRODUC, PCACTIVI, PCPARAM,
	// PCVALPAR, PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_ACTPARAM(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			String pPCPARAM, java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_ACTPARAM(?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCPARAM);
		cStmt.setObject(5, pPCVALPAR);
		cStmt.setObject(6, pPTVALPAR);
		cStmt.setObject(7, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM, java.math.BigDecimal pPCVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_ACTPARAM(pPSPRODUC, pPCACTIVI, pPCPARAM, pPCVALPAR, pPTVALPAR,
				pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_ACTPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_CONPARAM(PCPARAM, PCVALPAR, PTVALPAR,
	// PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_CONPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_CONPARAM(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
		cStmt.setObject(3, pPCVALPAR);
		cStmt.setObject(4, pPTVALPAR);
		cStmt.setObject(5, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_CONPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_CONPARAM(pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_CONPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_ELIMACTPARAM(PSPRODUC, PCACTIVI, PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_ELIMACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_ELIMACTPARAM(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCPARAM" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_ELIMACTPARAM(pPSPRODUC, pPCACTIVI, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_ELIMACTPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_ELIMCONPARAM(PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_ELIMCONPARAM(String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_ELIMCONPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM" }, new Object[] { pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMCONPARAM(String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_ELIMCONPARAM(pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_ELIMCONPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_ELIMEMPPARAM(PCEMPRES, PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_ELIMEMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_ELIMEMPPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCPARAM" }, new Object[] { pPCEMPRES, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMEMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM)
			throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_ELIMEMPPARAM(pPCEMPRES, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_ELIMEMPPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_ELIMGARPARAM(PSPRODUC, PCACTIVI, PCGARANT,
	// PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_ELIMGARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_ELIMGARPARAM(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCPARAM" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMGARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_ELIMGARPARAM(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_ELIMGARPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_ELIMINSPARAM(PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_ELIMINSPARAM(String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_ELIMINSPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM" }, new Object[] { pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMINSPARAM(String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_ELIMINSPARAM(pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_ELIMINSPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_ELIMPRODPARAM(PSPRODUC, PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_ELIMPRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_ELIMPRODPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARAM" }, new Object[] { pPSPRODUC, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMPRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM)
			throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_ELIMPRODPARAM(pPSPRODUC, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_ELIMPRODPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_EMPPARAM(PCEMPRES, PCPARAM, PCVALPAR,
	// PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_EMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_EMPPARAM(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCEMPRES, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPCVALPAR);
		cStmt.setObject(5, pPTVALPAR);
		cStmt.setObject(6, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_EMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_EMPPARAM(pPCEMPRES, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_EMPPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_GARPARAM(PSPRODUC, PCACTIVI, PCGARANT,
	// PCPARAM, PCVALPAR, PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_GARPARAM(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, String pPCPARAM, java.math.BigDecimal pPCVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_GARPARAM(?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCPARAM", "pPCVALPAR", "pPTVALPAR",
						"pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCPARAM);
		cStmt.setObject(6, pPCVALPAR);
		cStmt.setObject(7, pPTVALPAR);
		cStmt.setObject(8, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_GARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_GARPARAM(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM, pPCVALPAR,
				pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_GARPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_INSPARAM(PCPARAM, PCVALPAR, PTVALPAR,
	// PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_INSPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_INSPARAM(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
		cStmt.setObject(3, pPCVALPAR);
		cStmt.setObject(4, pPTVALPAR);
		cStmt.setObject(5, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_INSPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_INSPARAM(pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_INSPARAM
	// --START-PAC_IAX_MNTPARAM.F_SET_PRODPARAM(PSPRODUC, PCPARAM, PCVALPAR,
	// PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM__F_SET_PRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_SET_PRODPARAM(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPCVALPAR);
		cStmt.setObject(5, pPTVALPAR);
		cStmt.setObject(6, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_SET_PRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_SET_PRODPARAM(pPSPRODUC, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM.F_SET_PRODPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_GET_ACTPARAM(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_GET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_GET_ACTPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_GET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_GET_ACTPARAM(pPSPRODUC, pPCACTIVI);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_GET_ACTPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_GET_CONPARAM()
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_GET_CONPARAM() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_GET_CONPARAM(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_GET_CONPARAM() throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_GET_CONPARAM();
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_GET_CONPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_GET_EMPPARAM(PCEMPRES)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_GET_EMPPARAM(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_GET_EMPPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_GET_EMPPARAM(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_GET_EMPPARAM(pPCEMPRES);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_GET_EMPPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_GET_GARPARAM(PSPRODUC, PCACTIVI, PCGARANT)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_GET_GARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_GET_GARPARAM(?,?,?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_GET_GARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_GET_GARPARAM(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_GET_GARPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_GET_INSPARAM()
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_GET_INSPARAM() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_GET_INSPARAM(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_GET_INSPARAM() throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_GET_INSPARAM();
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_GET_INSPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_GET_PRODPARAM(PSPRODUC)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_GET_PRODPARAM(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_GET_PRODPARAM(?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_GET_PRODPARAM(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_GET_PRODPARAM(pPSPRODUC);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_GET_PRODPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_ACTPARAM(PSPRODUC, PCACTIVI, PCPARAM,
	// PCVALPAR, PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM, java.math.BigDecimal pPCVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_ACTPARAM(?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCPARAM);
		cStmt.setObject(5, pPCVALPAR);
		cStmt.setObject(6, pPTVALPAR);
		cStmt.setObject(7, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM, java.math.BigDecimal pPCVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_ACTPARAM(pPSPRODUC, pPCACTIVI, pPCPARAM, pPCVALPAR, pPTVALPAR,
				pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_ACTPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_CONPARAM(PCPARAM, PCVALPAR, PTVALPAR,
	// PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_CONPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_CONPARAM(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
		cStmt.setObject(3, pPCVALPAR);
		cStmt.setObject(4, pPTVALPAR);
		cStmt.setObject(5, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_CONPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_CONPARAM(pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_CONPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMACTPARAM(PSPRODUC, PCACTIVI, PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_ELIMACTPARAM(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCPARAM" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_ELIMACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMACTPARAM(pPSPRODUC, pPCACTIVI, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMACTPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMCONPARAM(PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMCONPARAM(String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_ELIMCONPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM" }, new Object[] { pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_ELIMCONPARAM(String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMCONPARAM(pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMCONPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMEMPPARAM(PCEMPRES, PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMEMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_ELIMEMPPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCPARAM" }, new Object[] { pPCEMPRES, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_ELIMEMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM)
			throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMEMPPARAM(pPCEMPRES, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMEMPPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMGARPARAM(PSPRODUC, PCACTIVI, PCGARANT,
	// PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMGARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_ELIMGARPARAM(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCPARAM" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_ELIMGARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMGARPARAM(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMGARPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMINSPARAM(PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMINSPARAM(String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_ELIMINSPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM" }, new Object[] { pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_ELIMINSPARAM(String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMINSPARAM(pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMINSPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMPRODPARAM(PSPRODUC, PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMPRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_ELIMPRODPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARAM" }, new Object[] { pPSPRODUC, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_ELIMPRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM)
			throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_ELIMPRODPARAM(pPSPRODUC, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_ELIMPRODPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_EMPPARAM(PCEMPRES, PCPARAM, PCVALPAR,
	// PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_EMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_EMPPARAM(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCEMPRES, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPCVALPAR);
		cStmt.setObject(5, pPTVALPAR);
		cStmt.setObject(6, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_EMPPARAM(java.math.BigDecimal pPCEMPRES, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_EMPPARAM(pPCEMPRES, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_EMPPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_GARPARAM(PSPRODUC, PCACTIVI, PCGARANT,
	// PCPARAM, PCVALPAR, PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_GARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_GARPARAM(?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCPARAM", "pPCVALPAR", "pPTVALPAR",
						"pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCPARAM);
		cStmt.setObject(6, pPCVALPAR);
		cStmt.setObject(7, pPTVALPAR);
		cStmt.setObject(8, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_GARPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_GARPARAM(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM, pPCVALPAR,
				pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_GARPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_INSPARAM(PCPARAM, PCVALPAR, PTVALPAR,
	// PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_INSPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_INSPARAM(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
		cStmt.setObject(3, pPCVALPAR);
		cStmt.setObject(4, pPTVALPAR);
		cStmt.setObject(5, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_INSPARAM(String pPCPARAM, java.math.BigDecimal pPCVALPAR,
			String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_INSPARAM(pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_INSPARAM
	// --START-PAC_IAX_MNTPARAM_JMR.F_SET_PRODPARAM(PSPRODUC, PCPARAM, PCVALPAR,
	// PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_JMR__F_SET_PRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_JMR.F_SET_PRODPARAM(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPCVALPAR);
		cStmt.setObject(5, pPTVALPAR);
		cStmt.setObject(6, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_JMR__F_SET_PRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_JMR__F_SET_PRODPARAM(pPSPRODUC, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM_JMR.F_SET_PRODPARAM
	// --START-PAC_IAX_MNTPARAM_PROVES.F_GET_ACTPARAM(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_MNTPARAM_PROVES__F_GET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_PROVES.F_GET_ACTPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_PROVES__F_GET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_MNTPARAM_PROVES__F_GET_ACTPARAM(pPSPRODUC, pPCACTIVI);
	}

	// --END-PAC_IAX_MNTPARAM_PROVES.F_GET_ACTPARAM
	// --START-PAC_IAX_MNTPARAM_PROVES.F_GET_DESCPARAM(PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_PROVES__F_GET_DESCPARAM(String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_PROVES.F_GET_DESCPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM" }, new Object[] { pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PCDESC"
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
			retVal.put("PCDESC", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCDESC", null);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_PROVES__F_GET_DESCPARAM(String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM_PROVES__F_GET_DESCPARAM(pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_PROVES.F_GET_DESCPARAM
	// --START-PAC_IAX_MNTPARAM_PROVES.F_GET_PRODPARAM(PSPRODUC)
	private HashMap callPAC_IAX_MNTPARAM_PROVES__F_GET_PRODPARAM(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_PROVES.F_GET_PRODPARAM(?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPARAM_PROVES__F_GET_PRODPARAM(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPARAM_PROVES__F_GET_PRODPARAM(pPSPRODUC);
	}

	// --END-PAC_IAX_MNTPARAM_PROVES.F_GET_PRODPARAM
	// --START-PAC_IAX_MNTPARAM_PROVES.F_SET_ACTPARAM(PSPRODUC, PCACTIVI, PCPARAM,
	// PCVALPAR, PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_PROVES__F_SET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM, java.math.BigDecimal pPCVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_PROVES.F_SET_ACTPARAM(?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCPARAM);
		cStmt.setObject(5, pPCVALPAR);
		cStmt.setObject(6, pPTVALPAR);
		cStmt.setObject(7, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_PROVES__F_SET_ACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM, java.math.BigDecimal pPCVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_PROVES__F_SET_ACTPARAM(pPSPRODUC, pPCACTIVI, pPCPARAM, pPCVALPAR, pPTVALPAR,
				pPFVALPAR);
	}

	// --END-PAC_IAX_MNTPARAM_PROVES.F_SET_ACTPARAM
	// --START-PAC_IAX_MNTPARAM_PROVES.F_SET_ELIMACTPARAM(PSPRODUC, PCACTIVI,
	// PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_PROVES__F_SET_ELIMACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_PROVES.F_SET_ELIMACTPARAM(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCPARAM" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_PROVES__F_SET_ELIMACTPARAM(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM_PROVES__F_SET_ELIMACTPARAM(pPSPRODUC, pPCACTIVI, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_PROVES.F_SET_ELIMACTPARAM
	// --START-PAC_IAX_MNTPARAM_PROVES.F_SET_ELIMPRODPARAM(PSPRODUC, PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM_PROVES__F_SET_ELIMPRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_PROVES.F_SET_ELIMPRODPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARAM" }, new Object[] { pPSPRODUC, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_PROVES__F_SET_ELIMPRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM)
			throws Exception {
		return this.callPAC_IAX_MNTPARAM_PROVES__F_SET_ELIMPRODPARAM(pPSPRODUC, pPCPARAM);
	}

	// --END-PAC_IAX_MNTPARAM_PROVES.F_SET_ELIMPRODPARAM
	// --START-PAC_IAX_MNTPARAM_PROVES.F_SET_PRODPARAM(PSPRODUC, PCPARAM, PCVALPAR,
	// PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_MNTPARAM_PROVES__F_SET_PRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM_PROVES.F_SET_PRODPARAM(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARAM", "pPCVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPSPRODUC, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPCVALPAR);
		cStmt.setObject(5, pPTVALPAR);
		cStmt.setObject(6, pPFVALPAR);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM_PROVES__F_SET_PRODPARAM(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_MNTPARAM_PROVES__F_SET_PRODPARAM(pPSPRODUC, pPCPARAM, pPCVALPAR, pPTVALPAR, pPFVALPAR);
	}
	// --END-PAC_IAX_MNTPARAM_PROVES.F_SET_PRODPARAM

	// --START-PAC_IAX_MNTPARAM.F_GET_ACTPROD(PSPRODUC)
	private HashMap callPAC_IAX_MNTPARAM__F_GET_ACTPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_ACTPROD(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_ACTIVIDADES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_ACTPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_ACTPROD(pPSPRODUC);
	}
	// --END-PAC_IAX_MNTPARAM.F_GET_ACTPROD

	// --START-PAC_IAX_MNTPARAM.F_GET_DETPARAM(PCPARAM)
	private HashMap callPAC_IAX_MNTPARAM__F_GET_DETPARAM(String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPARAM.F_GET_DETPARAM(?,?)}";
		logCall(callQuery, new String[] { "pPCPARAM" }, new Object[] { pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_MNTPARAM__F_GET_DETPARAM(String pPCPARAM) throws Exception {
		return this.callPAC_IAX_MNTPARAM__F_GET_DETPARAM(pPCPARAM);
	}
	// --END-PAC_IAX_MNTPARAM.F_GET_DETPARAM

}
