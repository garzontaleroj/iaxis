package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_TERMINALES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_TERMINALES.class);
	private Connection conn = null;

	public PAC_IAX_TERMINALES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_TERMINALES.F_CONSULTA_TERMINALES(PCEMPRES, PCMAQFISI,
	// PCTERMINAL)

	private HashMap callPAC_IAX_TERMINALES__F_CONSULTA_TERMINALES(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_TERMINALES.F_CONSULTA_TERMINALES(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCMAQFISI", "pPCTERMINAL" },
				new Object[] { pPCEMPRES, pPCMAQFISI, pPCTERMINAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAQFISI);
		cStmt.setObject(4, pPCTERMINAL);
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

	public HashMap ejecutaPAC_IAX_TERMINALES__F_CONSULTA_TERMINALES(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL) throws Exception {
		return this.callPAC_IAX_TERMINALES__F_CONSULTA_TERMINALES(pPCEMPRES, pPCMAQFISI, pPCTERMINAL);
	}
	// --END-PAC_IAX_TERMINALES.F_CONSULTA_TERMINALES

	// --START-PAC_IAX_TERMINALES.F_DEL_TERMINAL(PCEMPRES, PCMAQFISI, PCTERMINAL)

	private HashMap callPAC_IAX_TERMINALES__F_DEL_TERMINAL(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_TERMINALES.F_DEL_TERMINAL(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCMAQFISI", "pPCTERMINAL" },
				new Object[] { pPCEMPRES, pPCMAQFISI, pPCTERMINAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAQFISI);
		cStmt.setObject(4, pPCTERMINAL);
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

	public HashMap ejecutaPAC_IAX_TERMINALES__F_DEL_TERMINAL(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL) throws Exception {
		return this.callPAC_IAX_TERMINALES__F_DEL_TERMINAL(pPCEMPRES, pPCMAQFISI, pPCTERMINAL);
	}
	// --END-PAC_IAX_TERMINALES.F_DEL_TERMINAL

	// --START-PAC_IAX_TERMINALES.F_SET_TERMINAL(PCEMPRES, PCMAQFISI, PCTERMINAL)

	private HashMap callPAC_IAX_TERMINALES__F_SET_TERMINAL(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_TERMINALES.F_SET_TERMINAL(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCMAQFISI", "pPCTERMINAL" },
				new Object[] { pPCEMPRES, pPCMAQFISI, pPCTERMINAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAQFISI);
		cStmt.setObject(4, pPCTERMINAL);
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

	public HashMap ejecutaPAC_IAX_TERMINALES__F_SET_TERMINAL(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL) throws Exception {
		return this.callPAC_IAX_TERMINALES__F_SET_TERMINAL(pPCEMPRES, pPCMAQFISI, pPCTERMINAL);
	}
	// --END-PAC_IAX_TERMINALES.F_SET_TERMINAL

	// --START-PAC_IAX_TERMINALES.F_UPDATE_TERMINAL(PCEMPRES, PCMAQFISI, PCTERMINAL,
	// PNEWCMAQFISI, PNEWCTERMINAL)

	private HashMap callPAC_IAX_TERMINALES__F_UPDATE_TERMINAL(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL, String pPNEWCMAQFISI, String pPNEWCTERMINAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_TERMINALES.F_UPDATE_TERMINAL(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPCMAQFISI", "pPCTERMINAL", "pPNEWCMAQFISI", "pPNEWCTERMINAL" },
				new Object[] { pPCEMPRES, pPCMAQFISI, pPCTERMINAL, pPNEWCMAQFISI, pPNEWCTERMINAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAQFISI);
		cStmt.setObject(4, pPCTERMINAL);
		cStmt.setObject(5, pPNEWCMAQFISI);
		cStmt.setObject(6, pPNEWCTERMINAL);
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

	public HashMap ejecutaPAC_IAX_TERMINALES__F_UPDATE_TERMINAL(java.math.BigDecimal pPCEMPRES, String pPCMAQFISI,
			String pPCTERMINAL, String pPNEWCMAQFISI, String pPNEWCTERMINAL) throws Exception {
		return this.callPAC_IAX_TERMINALES__F_UPDATE_TERMINAL(pPCEMPRES, pPCMAQFISI, pPCTERMINAL, pPNEWCMAQFISI,
				pPNEWCTERMINAL);
	}
	// --END-PAC_IAX_TERMINALES.F_UPDATE_TERMINAL

}
