package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MNTTABLAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MNTTABLAS.class);
	private Connection conn = null;

	public PAC_IAX_MNTTABLAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MNTTABLAS.F_ELIMINAREGISTRO(POBTABLA)

	private HashMap callPAC_IAX_MNTTABLAS__F_ELIMINAREGISTRO(Object pPOBTABLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTTABLAS.F_ELIMINAREGISTRO(?,?)}";
		logCall(callQuery, new String[] { "pPOBTABLA" }, new Object[] { pPOBTABLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPOBTABLA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTTABLAS__F_ELIMINAREGISTRO(Object pPOBTABLA) throws Exception {
		return this.callPAC_IAX_MNTTABLAS__F_ELIMINAREGISTRO(pPOBTABLA);
	}
	// --END-PAC_IAX_MNTTABLAS.F_ELIMINAREGISTRO
	// --START-PAC_IAX_MNTTABLAS.F_GET_IDIOMAS()

	private HashMap callPAC_IAX_MNTTABLAS__F_GET_IDIOMAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTTABLAS.F_GET_IDIOMAS(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTTABLAS__F_GET_IDIOMAS() throws Exception {
		return this.callPAC_IAX_MNTTABLAS__F_GET_IDIOMAS();
	}
	// --END-PAC_IAX_MNTTABLAS.F_GET_IDIOMAS
	// --START-PAC_IAX_MNTTABLAS.F_GET_TABDETVALORES(PTABLA, PRELACION, PVALORES)

	private HashMap callPAC_IAX_MNTTABLAS__F_GET_TABDETVALORES(String pPTABLA, String pPRELACION, String pPVALORES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTTABLAS.F_GET_TABDETVALORES(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPTABLA", "pPRELACION", "pPVALORES" },
				new Object[] { pPTABLA, pPRELACION, pPVALORES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLA);
		cStmt.setObject(3, pPRELACION);
		cStmt.setObject(4, pPVALORES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTTABLAS__F_GET_TABDETVALORES(String pPTABLA, String pPRELACION, String pPVALORES)
			throws Exception {
		return this.callPAC_IAX_MNTTABLAS__F_GET_TABDETVALORES(pPTABLA, pPRELACION, pPVALORES);
	}
	// --END-PAC_IAX_MNTTABLAS.F_GET_TABDETVALORES
	// --START-PAC_IAX_MNTTABLAS.F_GET_TABLAS()

	private HashMap callPAC_IAX_MNTTABLAS__F_GET_TABLAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTTABLAS.F_GET_TABLAS(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTTABLAS__F_GET_TABLAS() throws Exception {
		return this.callPAC_IAX_MNTTABLAS__F_GET_TABLAS();
	}
	// --END-PAC_IAX_MNTTABLAS.F_GET_TABLAS
	// --START-PAC_IAX_MNTTABLAS.F_GET_TABVALORES(PTABLA)

	private HashMap callPAC_IAX_MNTTABLAS__F_GET_TABVALORES(String pPTABLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTTABLAS.F_GET_TABVALORES(?,?)}";
		logCall(callQuery, new String[] { "pPTABLA" }, new Object[] { pPTABLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTTABLAS__F_GET_TABVALORES(String pPTABLA) throws Exception {
		return this.callPAC_IAX_MNTTABLAS__F_GET_TABVALORES(pPTABLA);
	}
	// --END-PAC_IAX_MNTTABLAS.F_GET_TABVALORES
	// --START-PAC_IAX_MNTTABLAS.F_GRABAREGISTROS(POBTABLA)

	private HashMap callPAC_IAX_MNTTABLAS__F_GRABAREGISTROS(Object pPOBTABLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTTABLAS.F_GRABAREGISTROS(?,?)}";
		logCall(callQuery, new String[] { "pPOBTABLA" }, new Object[] { pPOBTABLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPOBTABLA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTTABLAS__F_GRABAREGISTROS(Object pPOBTABLA) throws Exception {
		return this.callPAC_IAX_MNTTABLAS__F_GRABAREGISTROS(pPOBTABLA);
	}
	// --END-PAC_IAX_MNTTABLAS.F_GRABAREGISTROS

}
