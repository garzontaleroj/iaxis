package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FISCALIDAD extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ANULACIONES.class);
	private Connection conn = null;

	public PAC_IAX_FISCALIDAD(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_FISCALIDAD.F_GENERAR(P_EMPRESA, P_MODELO, P_FICHERO_IN,
	// P_FECHA_INI, P_FECHA_FIN, P_ANOFISCAL, P_TIPOSOPORTE, P_TIPOCIUDADANO,
	// P_IDIOMA)

	private HashMap callPAC_IAX_FISCALIDAD__F_GENERAR(java.math.BigDecimal pP_EMPRESA, String pP_MODELO,
			String pP_FICHERO_IN, java.sql.Date pP_FECHA_INI, java.sql.Date pP_FECHA_FIN, String pP_ANOFISCAL,
			String pP_TIPOSOPORTE, String pP_TIPOCIUDADANO, java.math.BigDecimal pP_IDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FISCALIDAD.F_GENERAR(?,?,?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pP_EMPRESA", "pP_MODELO", "pP_FICHERO_IN", "pP_FECHA_INI", "pP_FECHA_FIN",
						"pP_ANOFISCAL", "pP_TIPOSOPORTE", "pP_TIPOCIUDADANO", "pP_IDIOMA" },
				new Object[] { pP_EMPRESA, pP_MODELO, pP_FICHERO_IN, pP_FECHA_INI, pP_FECHA_FIN, pP_ANOFISCAL,
						pP_TIPOSOPORTE, pP_TIPOCIUDADANO, pP_IDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_MODELO);
		cStmt.setObject(4, pP_FICHERO_IN);
		cStmt.setObject(5, pP_FECHA_INI);
		cStmt.setObject(6, pP_FECHA_FIN);
		cStmt.setObject(7, pP_ANOFISCAL);
		cStmt.setObject(8, pP_TIPOSOPORTE);
		cStmt.setObject(9, pP_TIPOCIUDADANO);
		cStmt.setObject(10, pP_IDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, java.sql.Types.VARCHAR); // Valor de "P_FICHERO_OUT"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_FICHERO_OUT", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("P_FICHERO_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FISCALIDAD__F_GENERAR(java.math.BigDecimal pP_EMPRESA, String pP_MODELO,
			String pP_FICHERO_IN, java.sql.Date pP_FECHA_INI, java.sql.Date pP_FECHA_FIN, String pP_ANOFISCAL,
			String pP_TIPOSOPORTE, String pP_TIPOCIUDADANO, java.math.BigDecimal pP_IDIOMA) throws Exception {
		return this.callPAC_IAX_FISCALIDAD__F_GENERAR(pP_EMPRESA, pP_MODELO, pP_FICHERO_IN, pP_FECHA_INI, pP_FECHA_FIN,
				pP_ANOFISCAL, pP_TIPOSOPORTE, pP_TIPOCIUDADANO, pP_IDIOMA);
	}
	// --END-PAC_IAX_FISCALIDAD.F_GENERAR

	// --START-PAC_IAX_FISCALIDAD.F_GETDETVALORES(P_EMPRESA, P_CVALOR, P_IDIOMA)

	private HashMap callPAC_IAX_FISCALIDAD__F_GETDETVALORES(java.math.BigDecimal pP_EMPRESA, String pP_CVALOR,
			java.math.BigDecimal pP_IDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FISCALIDAD.F_GETDETVALORES(?,?,?,?)}";
		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_CVALOR", "pP_IDIOMA" },
				new Object[] { pP_EMPRESA, pP_CVALOR, pP_IDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_CVALOR);
		cStmt.setObject(4, pP_IDIOMA);
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

	public HashMap ejecutaPAC_IAX_FISCALIDAD__F_GETDETVALORES(java.math.BigDecimal pP_EMPRESA, String pP_CVALOR,
			java.math.BigDecimal pP_IDIOMA) throws Exception {
		return this.callPAC_IAX_FISCALIDAD__F_GETDETVALORES(pP_EMPRESA, pP_CVALOR, pP_IDIOMA);
	}
	// --END-PAC_IAX_FISCALIDAD.F_GETDETVALORES
	// --START-PAC_IAX_FISCALIDAD.F_GET_MODELOCFG(P_EMPRESA, P_CMODELO)

	private HashMap callPAC_IAX_FISCALIDAD__F_GET_MODELOCFG(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_CMODELO) throws Exception {
		String callQuery = "{?=call PAC_IAX_FISCALIDAD.F_GET_MODELOCFG(?,?,?)}";
		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_CMODELO" }, new Object[] { pP_EMPRESA, pP_CMODELO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_CMODELO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FISCALIDAD__F_GET_MODELOCFG(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_CMODELO) throws Exception {
		return this.callPAC_IAX_FISCALIDAD__F_GET_MODELOCFG(pP_EMPRESA, pP_CMODELO);
	}
	// --END-PAC_IAX_FISCALIDAD.F_GET_MODELOCFG
	// --START-PAC_IAX_FISCALIDAD.F_GET_MODELOS(P_EMPRESA, P_IDIOMA)

	private HashMap callPAC_IAX_FISCALIDAD__F_GET_MODELOS(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_IDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FISCALIDAD.F_GET_MODELOS(?,?,?)}";
		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_IDIOMA" }, new Object[] { pP_EMPRESA, pP_IDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_IDIOMA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FISCALIDAD__F_GET_MODELOS(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_IDIOMA) throws Exception {
		return this.callPAC_IAX_FISCALIDAD__F_GET_MODELOS(pP_EMPRESA, pP_IDIOMA);
	}
	// --END-PAC_IAX_FISCALIDAD.F_GET_MODELOS

	// --START-PAC_IAX_FISCALIDAD.F_FECU(PIDIOMA, FECHA_DESDE, FECHA_HASTA)

	private HashMap callPAC_IAX_FISCALIDAD__F_FECU(java.math.BigDecimal pPIDIOMA, String pFECHA_DESDE,
			String pFECHA_HASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FISCALIDAD.F_FECU(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDIOMA", "pFECHA_DESDE", "pFECHA_HASTA" },
				new Object[] { pPIDIOMA, pFECHA_DESDE, pFECHA_HASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDIOMA);
		cStmt.setObject(3, pFECHA_DESDE);
		cStmt.setObject(4, pFECHA_HASTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "VIMP"
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
			retVal.put("VIMP", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("VIMP", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FISCALIDAD__F_FECU(java.math.BigDecimal pPIDIOMA, String pFECHA_DESDE,
			String pFECHA_HASTA) throws Exception {
		return this.callPAC_IAX_FISCALIDAD__F_FECU(pPIDIOMA, pFECHA_DESDE, pFECHA_HASTA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FISCALIDAD.F_FECU

}
