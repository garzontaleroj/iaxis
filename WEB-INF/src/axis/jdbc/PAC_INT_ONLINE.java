package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.util.ConversionUtil;

public class PAC_INT_ONLINE extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_INT_ONLINE.class);
	private Connection conn = null;

	public PAC_INT_ONLINE(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_INT_ONLINE.F_INICIALIZAR_LOG_LISTENER(PCINTERF, PTMENOUT)
	private HashMap callPAC_INT_ONLINE__F_INICIALIZAR_LOG_LISTENER(String pPCINTERF, String pPTMENOUT)
			throws Exception {
		String callQuery = "{?=call PAC_INT_ONLINE.F_INICIALIZAR_LOG_LISTENER(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCINTERF", "pPTMENOUT" }, new Object[] { pPCINTERF, pPTMENOUT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCINTERF);
		cStmt.setObject(3, pPTMENOUT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSINTERF"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSINTERF", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSINTERF", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_INT_ONLINE__F_INICIALIZAR_LOG_LISTENER(String pPCINTERF, String pPTMENOUT)
			throws Exception {
		return this.callPAC_INT_ONLINE__F_INICIALIZAR_LOG_LISTENER(pPCINTERF, pPTMENOUT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_INT_ONLINE.F_INICIALIZAR_LOG_LISTENER

	// --START-PAC_INT_ONLINE.F_LOG_HOSTIN(PSINTERF, PTMENINHOST)
	private HashMap callPAC_INT_ONLINE__F_LOG_HOSTIN(java.math.BigDecimal pPSINTERF, String pPTMENINHOST)
			throws Exception {
		String callQuery = "{?=call PAC_INT_ONLINE.F_LOG_HOSTIN(?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPTMENINHOST" }, new Object[] { pPSINTERF, pPTMENINHOST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINTERF);
		cStmt.setObject(3, pPTMENINHOST);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_INT_ONLINE__F_LOG_HOSTIN(java.math.BigDecimal pPSINTERF, String pPTMENINHOST)
			throws Exception {
		return this.callPAC_INT_ONLINE__F_LOG_HOSTIN(pPSINTERF, pPTMENINHOST);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_INT_ONLINE.F_LOG_HOSTIN

	// --START-PAC_INT_ONLINE.F_LOG_HOSTOUT(PSINTERF, PTMENOUTHOST)
	private HashMap callPAC_INT_ONLINE__F_LOG_HOSTOUT(java.math.BigDecimal pPSINTERF, String pPTMENOUTHOST)
			throws Exception {
		String callQuery = "{?=call PAC_INT_ONLINE.F_LOG_HOSTOUT(?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPTMENOUTHOST" }, new Object[] { pPSINTERF, pPTMENOUTHOST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINTERF);
		cStmt.setObject(3, pPTMENOUTHOST);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_INT_ONLINE__F_LOG_HOSTOUT(java.math.BigDecimal pPSINTERF, String pPTMENOUTHOST)
			throws Exception {
		return this.callPAC_INT_ONLINE__F_LOG_HOSTOUT(pPSINTERF, pPTMENOUTHOST);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_INT_ONLINE.F_LOG_HOSTOUT

	// --START-PAC_INT_ONLINE.F_OBTENER_VALORES_AXIS(PEMP, PCAMPO)
	private HashMap callPAC_INT_ONLINE__F_OBTENER_VALORES_AXIS(String pPEMP, String pPCAMPO) throws Exception {
		String callQuery = "{?=call PAC_INT_ONLINE.F_OBTENER_VALORES_AXIS(?, ?)}";

		logCall(callQuery, new String[] { "pPEMP", "pPCAMPO" }, new Object[] { pPEMP, pPCAMPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMP);
		cStmt.setObject(3, pPCAMPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_INT_ONLINE__F_OBTENER_VALORES_AXIS(String pPEMP, String pPCAMPO) throws Exception {
		return this.callPAC_INT_ONLINE__F_OBTENER_VALORES_AXIS(pPEMP, pPCAMPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_INT_ONLINE.F_OBTENER_VALORES_AXIS

	// --START-PAC_INT_ONLINE.F_OBTENER_VALORES_EMP(PEMP, PCAMPO)
	private HashMap callPAC_INT_ONLINE__F_OBTENER_VALORES_EMP(String pPEMP, String pPCAMPO) throws Exception {
		String callQuery = "{?=call PAC_INT_ONLINE.F_OBTENER_VALORES_EMP(?, ?)}";

		logCall(callQuery, new String[] { "pPEMP", "pPCAMPO" }, new Object[] { pPEMP, pPCAMPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMP);
		cStmt.setObject(3, pPCAMPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_INT_ONLINE__F_OBTENER_VALORES_EMP(String pPEMP, String pPCAMPO) throws Exception {
		return this.callPAC_INT_ONLINE__F_OBTENER_VALORES_EMP(pPEMP, pPCAMPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_INT_ONLINE.F_OBTENER_VALORES_EMP

	// --START-PAC_INT_ONLINE.F_OBTENER_VALOR_AXIS(PEMP, PCAMPO, PVALEMP)
	private HashMap callPAC_INT_ONLINE__F_OBTENER_VALOR_AXIS(String pPEMP, String pPCAMPO, String pPVALEMP)
			throws Exception {
		String callQuery = "{?=call PAC_INT_ONLINE.F_OBTENER_VALOR_AXIS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPEMP", "pPCAMPO", "pPVALEMP" }, new Object[] { pPEMP, pPCAMPO, pPVALEMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMP);
		cStmt.setObject(3, pPCAMPO);
		cStmt.setObject(4, pPVALEMP);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_INT_ONLINE__F_OBTENER_VALOR_AXIS(String pPEMP, String pPCAMPO, String pPVALEMP)
			throws Exception {
		return this.callPAC_INT_ONLINE__F_OBTENER_VALOR_AXIS(pPEMP, pPCAMPO, pPVALEMP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_INT_ONLINE.F_OBTENER_VALOR_AXIS

	// --START-PAC_INT_ONLINE.F_OBTENER_VALOR_EMP(PEMP, PCAMPO, PVALAXIS)
	private HashMap callPAC_INT_ONLINE__F_OBTENER_VALOR_EMP(String pPEMP, String pPCAMPO, String pPVALAXIS)
			throws Exception {
		String callQuery = "{?=call PAC_INT_ONLINE.F_OBTENER_VALOR_EMP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPEMP", "pPCAMPO", "pPVALAXIS" },
				new Object[] { pPEMP, pPCAMPO, pPVALAXIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMP);
		cStmt.setObject(3, pPCAMPO);
		cStmt.setObject(4, pPVALAXIS);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_INT_ONLINE__F_OBTENER_VALOR_EMP(String pPEMP, String pPCAMPO, String pPVALAXIS)
			throws Exception {
		return this.callPAC_INT_ONLINE__F_OBTENER_VALOR_EMP(pPEMP, pPCAMPO, pPVALAXIS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_INT_ONLINE.F_OBTENER_VALOR_EMP

}
