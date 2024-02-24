package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PARAM extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES.class);
	private Connection conn = null;

	public PAC_IAX_PARAM(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PARAM.F_PARINSTALACION_FF(P_CPARAM)
	private HashMap callPAC_IAX_PARAM__F_PARINSTALACION_FF(String pP_CPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PARAM.F_PARINSTALACION_FF(?, ?)}";

		logCall(callQuery, new String[] { "pP_CPARAM" }, new Object[] { pP_CPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPARAM);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PARAM__F_PARINSTALACION_FF(String pP_CPARAM) throws Exception {
		return this.callPAC_IAX_PARAM__F_PARINSTALACION_FF(pP_CPARAM);
	}

	// --END-PAC_IAX_PARAM.F_PARINSTALACION_FF
	// --START-PAC_IAX_PARAM.F_PARINSTALACION_NN(P_CPARAM)
	private HashMap callPAC_IAX_PARAM__F_PARINSTALACION_NN(String pP_CPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PARAM.F_PARINSTALACION_NN(?, ?)}";

		logCall(callQuery, new String[] { "pP_CPARAM" }, new Object[] { pP_CPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPARAM);
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

	public HashMap ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN(String pP_CPARAM) throws Exception {
		return this.callPAC_IAX_PARAM__F_PARINSTALACION_NN(pP_CPARAM);
	}

	// --END-PAC_IAX_PARAM.F_PARINSTALACION_NN
	// --START-PAC_IAX_PARAM.F_PARINSTALACION_TT(P_CPARAM)
	private HashMap callPAC_IAX_PARAM__F_PARINSTALACION_TT(String pP_CPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PARAM.F_PARINSTALACION_TT(?, ?)}";

		logCall(callQuery, new String[] { "pP_CPARAM" }, new Object[] { pP_CPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPARAM);
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

	public HashMap ejecutaPAC_IAX_PARAM__F_PARINSTALACION_TT(String pP_CPARAM) throws Exception {
		return this.callPAC_IAX_PARAM__F_PARINSTALACION_TT(pP_CPARAM);
	}
	// --END-PAC_IAX_PARAM.F_PARINSTALACION_TT

	// --START-PAC_IAX_PARAM.F_PAREMPRESA_N(P_CPARAM, P_CEMPRES)
	private HashMap callPAC_IAX_PARAM__F_PAREMPRESA_N(String pP_CPARAM, java.math.BigDecimal pP_CEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PARAM.F_PAREMPRESA_N(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CPARAM", "pP_CEMPRES" }, new Object[] { pP_CPARAM, pP_CEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPARAM);
		cStmt.setObject(3, pP_CEMPRES);
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

	public HashMap ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(String pP_CPARAM, java.math.BigDecimal pP_CEMPRES)
			throws Exception {
		return this.callPAC_IAX_PARAM__F_PAREMPRESA_N(pP_CPARAM, pP_CEMPRES);
	}
	// --END-PAC_IAX_PARAM.F_PAREMPRESA_N

	// --START-PAC_IAX_PARAM.F_PAREMPRESA_T(P_CPARAM, P_CEMPRES)
	private HashMap callPAC_IAX_PARAM__F_PAREMPRESA_T(String pP_CPARAM, java.math.BigDecimal pP_CEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PARAM.F_PAREMPRESA_T(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CPARAM", "pP_CEMPRES" }, new Object[] { pP_CPARAM, pP_CEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPARAM);
		cStmt.setObject(3, pP_CEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T(String pP_CPARAM, java.math.BigDecimal pP_CEMPRES)
			throws Exception {
		return this.callPAC_IAX_PARAM__F_PAREMPRESA_T(pP_CPARAM, pP_CEMPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PARAM.F_PAREMPRESA_T

	// --START-PAC_IAX_PARAM.F_PAREMPRESA_F(P_CPARAM, P_CEMPRES)
	private HashMap callPAC_IAX_PARAM__F_PAREMPRESA_F(String pP_CPARAM, java.math.BigDecimal pP_CEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PARAM.F_PAREMPRESA_F(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CPARAM", "pP_CEMPRES" }, new Object[] { pP_CPARAM, pP_CEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPARAM);
		cStmt.setObject(3, pP_CEMPRES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PARAM__F_PAREMPRESA_F(String pP_CPARAM, java.math.BigDecimal pP_CEMPRES)
			throws Exception {
		return this.callPAC_IAX_PARAM__F_PAREMPRESA_F(pP_CPARAM, pP_CEMPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PARAM.F_PAREMPRESA_F

	// --START-PAC_IAX_PARAM.F_PARGARANPRO_N(PSPRODUC, PCACTIVI, PCGARANT, PCPARAM)
	private HashMap callPAC_IAX_PARAM__F_PARGARANPRO_N(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_PARAM.F_PARGARANPRO_N(?, ?, ?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_PARAM__F_PARGARANPRO_N(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_PARAM__F_PARGARANPRO_N(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPARAM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PARAM.F_PARGARANPRO_N

}
