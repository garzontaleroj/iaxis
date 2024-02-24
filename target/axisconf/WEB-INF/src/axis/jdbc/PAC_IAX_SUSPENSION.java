package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SUSPENSION extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_SUSPENSION.class);
	private Connection conn = null;

	public PAC_IAX_SUSPENSION(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SUSPENSION.F_GET_CMOTMOV(TMOTMOV)
	private HashMap callPAC_IAX_SUSPENSION__F_GET_CMOTMOV(String pTMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUSPENSION.F_GET_CMOTMOV(?, ?)}";

		logCall(callQuery, new String[] { "pTMOTMOV" }, new Object[] { pTMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pTMOTMOV);
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

	public HashMap ejecutaPAC_IAX_SUSPENSION__F_GET_CMOTMOV(String pTMOTMOV) throws Exception {
		return this.callPAC_IAX_SUSPENSION__F_GET_CMOTMOV(pTMOTMOV);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SUSPENSION.F_GET_CMOTMOV
	// --START-PAC_IAX_SUSPENSION.F_GET_MOV(PSSEGURO, PTMOTMOV)
	private HashMap callPAC_IAX_SUSPENSION__F_GET_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SUSPENSION.F_GET_MOV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTMOTMOV" }, new Object[] { pPSSEGURO, pPTMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
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

	public HashMap ejecutaPAC_IAX_SUSPENSION__F_GET_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV)
			throws Exception {
		return this.callPAC_IAX_SUSPENSION__F_GET_MOV(pPSSEGURO, pPTMOTMOV);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SUSPENSION.F_GET_MOV
	// --START-PAC_IAX_SUSPENSION.F_SET_MOV(PSSEGURO, PTMOTMOV, PFMOVINI, PFRENOVA,
	// PTTEXTO, PTTEXTO2)
	private HashMap callPAC_IAX_SUSPENSION__F_SET_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.sql.Date pPFMOVINI, java.sql.Date pPFRENOVA, String pPTTEXTO, String pPTTEXTO2) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUSPENSION.F_SET_MOV(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTMOTMOV", "pPFMOVINI", "pPFRENOVA", "pPTTEXTO", "pPTTEXTO2" },
				new Object[] { pPSSEGURO, pPTMOTMOV, pPFMOVINI, pPFRENOVA, pPTTEXTO, pPTTEXTO2 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
		cStmt.setObject(4, pPFMOVINI);
		cStmt.setObject(5, pPFRENOVA);
		cStmt.setObject(6, pPTTEXTO);
		cStmt.setObject(7, pPTTEXTO2);
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

	public HashMap ejecutaPAC_IAX_SUSPENSION__F_SET_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.sql.Date pPFMOVINI, java.sql.Date pPFRENOVA, String pPTTEXTO, String pPTTEXTO2) throws Exception {
		return this.callPAC_IAX_SUSPENSION__F_SET_MOV(pPSSEGURO, pPTMOTMOV, pPFMOVINI, pPFRENOVA, pPTTEXTO, pPTTEXTO2);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SUSPENSION.F_SET_MOV
	// --START-PAC_IAX_SUSPENSION.F_VALIDA_CREA_MOV(PSSEGURO, PTMOTMOV)
	private HashMap callPAC_IAX_SUSPENSION__F_VALIDA_CREA_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SUSPENSION.F_VALIDA_CREA_MOV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTMOTMOV" }, new Object[] { pPSSEGURO, pPTMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
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

	public HashMap ejecutaPAC_IAX_SUSPENSION__F_VALIDA_CREA_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV)
			throws Exception {
		return this.callPAC_IAX_SUSPENSION__F_VALIDA_CREA_MOV(pPSSEGURO, pPTMOTMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUSPENSION.F_VALIDA_CREA_MOV

	// --START-PAC_IAX_SUSPENSION.F_GET_PROX_MOV(PSSEGURO)
	private HashMap callPAC_IAX_SUSPENSION__F_GET_PROX_MOV(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUSPENSION.F_GET_PROX_MOV(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_SUSPENSION__F_GET_PROX_MOV(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SUSPENSION__F_GET_PROX_MOV(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUSPENSION.F_GET_PROX_MOV

}
