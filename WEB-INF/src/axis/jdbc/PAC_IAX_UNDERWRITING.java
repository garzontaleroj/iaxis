package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_UNDERWRITING extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_UNDERWRITING.class);
	private Connection conn = null;

	public PAC_IAX_UNDERWRITING(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_UNDERWRITING.F_ACTIVO_UNDW_IF01(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_UNDERWRITING__F_ACTIVO_UNDW_IF01(java.math.BigDecimal pPSPRODUC, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_UNDERWRITING.F_ACTIVO_UNDW_IF01(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPTABLAS" }, new Object[] { pPSPRODUC, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPTABLAS);
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

	public HashMap ejecutaPAC_IAX_UNDERWRITING__F_ACTIVO_UNDW_IF01(java.math.BigDecimal pPSPRODUC, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_UNDERWRITING__F_ACTIVO_UNDW_IF01(pPSPRODUC, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UNDERWRITING.F_ACTIVO_UNDW_IF01

	// --START-PAC_IAX_UNDERWRITING.F_GET_ICD10CODES(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_UNDERWRITING__F_GET_ICD10CODES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_UNDERWRITING.F_GET_ICD10CODES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_UNDERWRITING__F_GET_ICD10CODES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_UNDERWRITING__F_GET_ICD10CODES(pPSSEGURO, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UNDERWRITING.F_GET_ICD10CODES

	// --START-PAC_IAX_UNDERWRITING.F_SETRECHAZO_ICD10CODES(PSSEGURO, PNMOVIMI,
	// PCINDEX)
	private HashMap callPAC_IAX_UNDERWRITING__F_SETRECHAZO_ICD10CODES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, String pPCINDEX) throws Exception {
		String callQuery = "{?=call PAC_IAX_UNDERWRITING.F_SETRECHAZO_ICD10CODES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPCINDEX" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPCINDEX });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCINDEX);
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

	public HashMap ejecutaPAC_IAX_UNDERWRITING__F_SETRECHAZO_ICD10CODES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, String pPCINDEX) throws Exception {
		return this.callPAC_IAX_UNDERWRITING__F_SETRECHAZO_ICD10CODES(pPSSEGURO, pPNMOVIMI, pPCINDEX);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UNDERWRITING.F_SETRECHAZO_ICD10CODES

	// --START-PAC_IAX_UNDERWRITING.F_GET_EVIDENCES()
	private HashMap callPAC_IAX_UNDERWRITING__F_GET_EVIDENCES() throws Exception {
		String callQuery = "{?=call PAC_IAX_UNDERWRITING.F_GET_EVIDENCES(?)}";

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

	public HashMap ejecutaPAC_IAX_UNDERWRITING__F_GET_EVIDENCES() throws Exception {
		return this.callPAC_IAX_UNDERWRITING__F_GET_EVIDENCES();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UNDERWRITING.F_GET_EVIDENCES

}
