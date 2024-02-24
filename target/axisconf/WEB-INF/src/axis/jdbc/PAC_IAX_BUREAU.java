package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_BUREAU extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_BUREAU.class);
	private Connection conn = null;

	public PAC_IAX_BUREAU(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_BUREAU.F_ANULA_FICHA(PFBUREAU, PNSUPLEM, PNMOVIMI)
	private HashMap callPAC_IAX_BUREAU__F_ANULA_FICHA(java.math.BigDecimal pPFBUREAU, java.math.BigDecimal pPNSUPLEM,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_BUREAU.F_ANULA_FICHA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFBUREAU", "pPNSUPLEM", "pPNMOVIMI" },
				new Object[] { pPFBUREAU, pPNSUPLEM, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFBUREAU);
		cStmt.setObject(3, pPNSUPLEM);
		cStmt.setObject(4, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_BUREAU__F_ANULA_FICHA(java.math.BigDecimal pPFBUREAU, java.math.BigDecimal pPNSUPLEM,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_BUREAU__F_ANULA_FICHA(pPFBUREAU, pPNSUPLEM, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_BUREAU.F_ANULA_FICHA

	// --START-PAC_IAX_BUREAU.F_ASOCIA_DOC(PSSEGURO, PNSUPLEM, PNMOVIMI, PIDDOC)
	private HashMap callPAC_IAX_BUREAU__F_ASOCIA_DOC(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNSUPLEM,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOC) throws Exception {
		String callQuery = "{?=call PAC_IAX_BUREAU.F_ASOCIA_DOC(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNSUPLEM", "pPNMOVIMI", "pPIDDOC" },
				new Object[] { pPSSEGURO, pPNSUPLEM, pPNMOVIMI, pPIDDOC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSUPLEM);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPIDDOC);
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

	public HashMap ejecutaPAC_IAX_BUREAU__F_ASOCIA_DOC(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNSUPLEM,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOC) throws Exception {
		return this.callPAC_IAX_BUREAU__F_ASOCIA_DOC(pPSSEGURO, pPNSUPLEM, pPNMOVIMI, pPIDDOC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_BUREAU.F_ASOCIA_DOC
	// --START-PAC_IAX_BUREAU.F_GENERA_FICHA(PSSEGURO)
	private HashMap callPAC_IAX_BUREAU__F_GENERA_FICHA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_BUREAU.F_GENERA_FICHA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_BUREAU__F_GENERA_FICHA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_BUREAU__F_GENERA_FICHA(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_BUREAU.F_GENERA_FICHA
	// --START-PAC_IAX_BUREAU.F_GET_BUREAU(PSSEGURO)
	private HashMap callPAC_IAX_BUREAU__F_GET_BUREAU(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_BUREAU.F_GET_BUREAU(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_BUREAU__F_GET_BUREAU(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_BUREAU__F_GET_BUREAU(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_BUREAU.F_GET_BUREAU
	// --START-PAC_IAX_BUREAU.F_VALIDA_POL(PSSEGURO)
	private HashMap callPAC_IAX_BUREAU__F_VALIDA_POL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_BUREAU.F_VALIDA_POL(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_BUREAU__F_VALIDA_POL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_BUREAU__F_VALIDA_POL(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_BUREAU.F_VALIDA_POL

}
