package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CFG_FILE extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CFG.class);
	private Connection conn = null;

	public PAC_IAX_CFG_FILE(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CFG_FILE.F_GET_PROCESO_CARGADO(PCPROCESO, PTFICHERO)
	private HashMap callPAC_IAX_CFG_FILE__F_GET_PROCESO_CARGADO(java.math.BigDecimal pPCPROCESO, String pPTFICHERO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG_FILE.F_GET_PROCESO_CARGADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPROCESO", "pPTFICHERO" }, new Object[] { pPCPROCESO, pPTFICHERO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPROCESO);
		cStmt.setObject(3, pPTFICHERO);
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

	public HashMap ejecutaPAC_IAX_CFG_FILE__F_GET_PROCESO_CARGADO(java.math.BigDecimal pPCPROCESO, String pPTFICHERO)
			throws Exception {
		return this.callPAC_IAX_CFG_FILE__F_GET_PROCESO_CARGADO(pPCPROCESO, pPTFICHERO);
	}
	// --END-PAC_IAX_CFG_FILE.F_GET_PROCESO_CARGADO

	// --START-PAC_IAX_CFG_FILE.F_EJECUTA_PROCESO(P_CPROCESO, P_TFILE, P_SPROCES,
	// P_NNUMCASO)
	private HashMap callPAC_IAX_CFG_FILE__F_EJECUTA_PROCESO(java.math.BigDecimal pP_CPROCESO, String pP_TFILE,
			java.math.BigDecimal pP_SPROCES, java.math.BigDecimal pP_NNUMCASO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG_FILE.F_EJECUTA_PROCESO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CPROCESO", "pP_TFILE", "pP_SPROCES", "pP_NNUMCASO" },
				new Object[] { pP_CPROCESO, pP_TFILE, pP_SPROCES, pP_NNUMCASO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPROCESO);
		cStmt.setObject(3, pP_TFILE);
		cStmt.setObject(4, pP_SPROCES);
		cStmt.setObject(5, pP_NNUMCASO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "P_SPROCESSAL"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "P_TPANTALLA"
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
			retVal.put("P_SPROCESSAL", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_SPROCESSAL", null);
		}
		try {
			retVal.put("P_TPANTALLA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_TPANTALLA", null);
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

	public HashMap ejecutaPAC_IAX_CFG_FILE__F_EJECUTA_PROCESO(java.math.BigDecimal pP_CPROCESO, String pP_TFILE,
			java.math.BigDecimal pP_SPROCES, java.math.BigDecimal pP_NNUMCASO) throws Exception {
		return this.callPAC_IAX_CFG_FILE__F_EJECUTA_PROCESO(pP_CPROCESO, pP_TFILE, pP_SPROCES, pP_NNUMCASO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CFG_FILE.F_EJECUTA_PROCESO

	// --START-PAC_IAX_CFG_FILE.F_GET_DATOS_PROCESO(P_CPROCESO)
	private HashMap callPAC_IAX_CFG_FILE__F_GET_DATOS_PROCESO(java.math.BigDecimal pP_CPROCESO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG_FILE.F_GET_DATOS_PROCESO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CPROCESO" }, new Object[] { pP_CPROCESO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CPROCESO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "P_TDESTINO"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "P_TPROCESO"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "P_BORRAFICH"
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
			retVal.put("P_TDESTINO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_TDESTINO", null);
		}
		try {
			retVal.put("P_TPROCESO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_TPROCESO", null);
		}
		try {
			retVal.put("P_BORRAFICH", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_BORRAFICH", null);
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

	public HashMap ejecutaPAC_IAX_CFG_FILE__F_GET_DATOS_PROCESO(java.math.BigDecimal pP_CPROCESO) throws Exception {
		return this.callPAC_IAX_CFG_FILE__F_GET_DATOS_PROCESO(pP_CPROCESO);
	}
	// --END-PAC_IAX_CFG_FILE.F_GET_DATOS_PROCESO

	// --START-PAC_IAX_CFG_FILE.F_GET_PROCESOS()
	private HashMap callPAC_IAX_CFG_FILE__F_GET_PROCESOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG_FILE.F_GET_PROCESOS(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_TPROCESOS"
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
			retVal.put("P_TPROCESOS", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("P_TPROCESOS", null);
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

	public HashMap ejecutaPAC_IAX_CFG_FILE__F_GET_PROCESOS() throws Exception {
		return this.callPAC_IAX_CFG_FILE__F_GET_PROCESOS();
	}
	// --END-PAC_IAX_CFG_FILE.F_GET_PROCESOS

}
