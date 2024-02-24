package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CBANCAR_SEG extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_CBANCAR_SEG.class);
	private Connection conn = null;

	public PAC_IAX_CBANCAR_SEG(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CBANCAR_SEG.F_GET_CBANCAR_SEG(PSSEGURO, PFECHA)
	private HashMap callPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEG(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFECHA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CBANCAR_SEG.F_GET_CBANCAR_SEG(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFECHA" }, new Object[] { pPSSEGURO, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFECHA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PCBANCAR"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PCBANCOB"
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
			retVal.put("PCBANCAR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCBANCAR", null);
		}
		try {
			retVal.put("PCBANCOB", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCBANCOB", null);
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

	public HashMap ejecutaPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEG(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFECHA)
			throws Exception {
		return this.callPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEG(pPSSEGURO, pPFECHA);
	}

	// --END-PAC_IAX_CBANCAR_SEG.F_GET_CBANCAR_SEG
	// --START-PAC_IAX_CBANCAR_SEG.F_GET_CBANCAR_SEGHIS(PSSEGURO)
	private HashMap callPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEGHIS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CBANCAR_SEG.F_GET_CBANCAR_SEGHIS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PRESULT"
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
			retVal.put("PRESULT", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PRESULT", null);
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

	public HashMap ejecutaPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEGHIS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEGHIS(pPSSEGURO);
	}

	// --END-PAC_IAX_CBANCAR_SEG.F_GET_CBANCAR_SEGHIS
	// --START-PAC_IAX_CBANCAR_SEG.F_SET_CBANCAR_SEG(PSSEGURO, PCBANCOB)
	private HashMap callPAC_IAX_CBANCAR_SEG__F_SET_CBANCAR_SEG(java.math.BigDecimal pPSSEGURO, String pPCBANCOB)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CBANCAR_SEG.F_SET_CBANCAR_SEG(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCBANCOB" }, new Object[] { pPSSEGURO, pPCBANCOB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCBANCOB);
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

	public HashMap ejecutaPAC_IAX_CBANCAR_SEG__F_SET_CBANCAR_SEG(java.math.BigDecimal pPSSEGURO, String pPCBANCOB)
			throws Exception {
		return this.callPAC_IAX_CBANCAR_SEG__F_SET_CBANCAR_SEG(pPSSEGURO, pPCBANCOB);
	}
	// --END-PAC_IAX_CBANCAR_SEG.F_SET_CBANCAR_SEG

}
