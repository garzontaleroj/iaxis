package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CONTABILIDAD extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CONTABILIDAD.class);
	private Connection conn = null;

	public PAC_IAX_CONTABILIDAD(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CONTABILIDAD.F_CIERRA_CONTABILIDAD(P_EMPRESA, P_FECHA,
	// P_NMESES)
	private HashMap callPAC_IAX_CONTABILIDAD__F_CIERRA_CONTABILIDAD(java.math.BigDecimal pP_EMPRESA,
			java.sql.Date pP_FECHA, java.math.BigDecimal pP_NMESES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_CIERRA_CONTABILIDAD(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_FECHA", "pP_NMESES" },
				new Object[] { pP_EMPRESA, pP_FECHA, pP_NMESES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_FECHA);
		cStmt.setObject(4, pP_NMESES);
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_CIERRA_CONTABILIDAD(java.math.BigDecimal pP_EMPRESA,
			java.sql.Date pP_FECHA, java.math.BigDecimal pP_NMESES) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_CIERRA_CONTABILIDAD(pP_EMPRESA, pP_FECHA, pP_NMESES);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_CIERRA_CONTABILIDAD
	// --START-PAC_IAX_CONTABILIDAD.F_DEL_DETALLEPLANTILLA(P_EMPRESA, P_SMODCON,
	// P_NLINEA)
	private HashMap callPAC_IAX_CONTABILIDAD__F_DEL_DETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_NLINEA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_DEL_DETALLEPLANTILLA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_SMODCON", "pP_NLINEA" },
				new Object[] { pP_EMPRESA, pP_SMODCON, pP_NLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_SMODCON);
		cStmt.setObject(4, pP_NLINEA);
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_DEL_DETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_NLINEA) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_DEL_DETALLEPLANTILLA(pP_EMPRESA, pP_SMODCON, pP_NLINEA);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_DEL_DETALLEPLANTILLA
	// --START-PAC_IAX_CONTABILIDAD.F_DUPLICARMODELO(P_EMPRESA, P_SMODCON)
	private HashMap callPAC_IAX_CONTABILIDAD__F_DUPLICARMODELO(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_DUPLICARMODELO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_SMODCON" }, new Object[] { pP_EMPRESA, pP_SMODCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_SMODCON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "P_NEWSMOD"
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
			retVal.put("P_NEWSMOD", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_NEWSMOD", null);
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_DUPLICARMODELO(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_DUPLICARMODELO(pP_EMPRESA, pP_SMODCON);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_DUPLICARMODELO
	// --START-PAC_IAX_CONTABILIDAD.F_GENERA_CONTABILIDAD(P_EMPRESA, P_ANY, P_MES,
	// P_NMESES)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GENERA_CONTABILIDAD(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_ANY, java.math.BigDecimal pP_MES, java.math.BigDecimal pP_NMESES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GENERA_CONTABILIDAD(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_ANY", "pP_MES", "pP_NMESES" },
				new Object[] { pP_EMPRESA, pP_ANY, pP_MES, pP_NMESES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_ANY);
		cStmt.setObject(4, pP_MES);
		cStmt.setObject(5, pP_NMESES);
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GENERA_CONTABILIDAD(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_ANY, java.math.BigDecimal pP_MES, java.math.BigDecimal pP_NMESES) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GENERA_CONTABILIDAD(pP_EMPRESA, pP_ANY, pP_MES, pP_NMESES);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_GENERA_CONTABILIDAD
	// --START-PAC_IAX_CONTABILIDAD.F_GET_CONSULTADESGLOSE(P_CUENTA, P_CONCEPTO,
	// P_EMPRESA, P_FECHA, P_PAIS, P_LINEA, P_ASIENTO, P_ACTUAL, PMES)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_CONSULTADESGLOSE(String pP_CUENTA, String pP_CONCEPTO,
			java.math.BigDecimal pP_EMPRESA, java.sql.Date pP_FECHA, java.math.BigDecimal pP_PAIS,
			java.math.BigDecimal pP_LINEA, java.math.BigDecimal pP_ASIENTO, java.math.BigDecimal pP_ACTUAL,
			java.math.BigDecimal pPMES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_CONSULTADESGLOSE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CUENTA", "pP_CONCEPTO", "pP_EMPRESA", "pP_FECHA", "pP_PAIS", "pP_LINEA",
						"pP_ASIENTO", "pP_ACTUAL", "pPMES" },
				new Object[] { pP_CUENTA, pP_CONCEPTO, pP_EMPRESA, pP_FECHA, pP_PAIS, pP_LINEA, pP_ASIENTO, pP_ACTUAL,
						pPMES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CUENTA);
		cStmt.setObject(3, pP_CONCEPTO);
		cStmt.setObject(4, pP_EMPRESA);
		cStmt.setObject(5, pP_FECHA);
		cStmt.setObject(6, pP_PAIS);
		cStmt.setObject(7, pP_LINEA);
		cStmt.setObject(8, pP_ASIENTO);
		cStmt.setObject(9, pP_ACTUAL);
		cStmt.setObject(10, pPMES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTADESGLOSE(String pP_CUENTA, String pP_CONCEPTO,
			java.math.BigDecimal pP_EMPRESA, java.sql.Date pP_FECHA, java.math.BigDecimal pP_PAIS,
			java.math.BigDecimal pP_LINEA, java.math.BigDecimal pP_ASIENTO, java.math.BigDecimal pP_ACTUAL,
			java.math.BigDecimal pPMES) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_CONSULTADESGLOSE(pP_CUENTA, pP_CONCEPTO, pP_EMPRESA, pP_FECHA,
				pP_PAIS, pP_LINEA, pP_ASIENTO, pP_ACTUAL, pPMES);
	}
	// --END-PAC_IAX_CONTABILIDAD.F_GET_CONSULTADESGLOSE

	// --START-PAC_IAX_CONTABILIDAD.F_GET_CONSULTADETALLEPLANTILLA(P_EMPRESA,
	// P_SMODCON)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_CONSULTADETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_CONSULTADETALLEPLANTILLA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_SMODCON" }, new Object[] { pP_EMPRESA, pP_SMODCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_SMODCON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETMODCONTA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTADETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_CONSULTADETALLEPLANTILLA(pP_EMPRESA, pP_SMODCON);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_GET_CONSULTADETALLEPLANTILLA
	// --START-PAC_IAX_CONTABILIDAD.F_GET_CONSULTAHISTORICO(P_EMPRESA, P_ANY, P_MES,
	// P_PAIS)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_CONSULTAHISTORICO(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_ANY, java.math.BigDecimal pP_MES, java.math.BigDecimal pP_PAIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_CONSULTAHISTORICO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_ANY", "pP_MES", "pP_PAIS" },
				new Object[] { pP_EMPRESA, pP_ANY, pP_MES, pP_PAIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_ANY);
		cStmt.setObject(4, pP_MES);
		cStmt.setObject(5, pP_PAIS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTAHISTORICO(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_ANY, java.math.BigDecimal pP_MES, java.math.BigDecimal pP_PAIS) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_CONSULTAHISTORICO(pP_EMPRESA, pP_ANY, pP_MES, pP_PAIS);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_GET_CONSULTAHISTORICO
	// --START-PAC_IAX_CONTABILIDAD.F_GET_CONSULTAPLANTILLA(P_EMPRESA, P_TIPO_AS)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_CONSULTAPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_TIPO_AS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_CONSULTAPLANTILLA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_TIPO_AS" }, new Object[] { pP_EMPRESA, pP_TIPO_AS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_TIPO_AS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MODCONTA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTAPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_TIPO_AS) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_CONSULTAPLANTILLA(pP_EMPRESA, pP_TIPO_AS);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_GET_CONSULTAPLANTILLA
	// --START-PAC_IAX_CONTABILIDAD.F_GET_CONSULTASIMULACION(P_EMPRESA, P_ANY,
	// P_MES, P_PAIS, P_NMESES)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_CONSULTASIMULACION(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_ANY, java.math.BigDecimal pP_MES, java.math.BigDecimal pP_PAIS,
			java.math.BigDecimal pP_NMESES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_CONSULTASIMULACION(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_ANY", "pP_MES", "pP_PAIS", "pP_NMESES" },
				new Object[] { pP_EMPRESA, pP_ANY, pP_MES, pP_PAIS, pP_NMESES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_ANY);
		cStmt.setObject(4, pP_MES);
		cStmt.setObject(5, pP_PAIS);
		cStmt.setObject(6, pP_NMESES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTASIMULACION(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_ANY, java.math.BigDecimal pP_MES, java.math.BigDecimal pP_PAIS,
			java.math.BigDecimal pP_NMESES) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_CONSULTASIMULACION(pP_EMPRESA, pP_ANY, pP_MES, pP_PAIS, pP_NMESES);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_GET_CONSULTASIMULACION
	// --START-PAC_IAX_CONTABILIDAD.F_GRABAR_DETALLEPLANTILLA(P_EMPRESA, P_SMODCON,
	// P_NLINEA, P_TDESCRI, P_CUENTAC, P_TIPOLIN, P_TSELECT)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GRABAR_DETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_NLINEA, String pP_TDESCRI, String pP_CUENTAC,
			java.math.BigDecimal pP_TIPOLIN, String pP_TSELECT) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GRABAR_DETALLEPLANTILLA(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_EMPRESA", "pP_SMODCON", "pP_NLINEA", "pP_TDESCRI", "pP_CUENTAC", "pP_TIPOLIN",
						"pP_TSELECT" },
				new Object[] { pP_EMPRESA, pP_SMODCON, pP_NLINEA, pP_TDESCRI, pP_CUENTAC, pP_TIPOLIN, pP_TSELECT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_SMODCON);
		cStmt.setObject(4, pP_NLINEA);
		cStmt.setObject(5, pP_TDESCRI);
		cStmt.setObject(6, pP_CUENTAC);
		cStmt.setObject(7, pP_TIPOLIN);
		cStmt.setObject(8, pP_TSELECT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DETMODCONTA".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GRABAR_DETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_NLINEA, String pP_TDESCRI, String pP_CUENTAC,
			java.math.BigDecimal pP_TIPOLIN, String pP_TSELECT) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GRABAR_DETALLEPLANTILLA(pP_EMPRESA, pP_SMODCON, pP_NLINEA, pP_TDESCRI,
				pP_CUENTAC, pP_TIPOLIN, pP_TSELECT);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_GRABAR_DETALLEPLANTILLA
	// --START-PAC_IAX_CONTABILIDAD.F_GRABAR_PLANTILLA(P_EMPRESA, P_TIPO_AS, P_FFIN)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GRABAR_PLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_TIPO_AS, java.sql.Date pP_FFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GRABAR_PLANTILLA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_TIPO_AS", "pP_FFIN" },
				new Object[] { pP_EMPRESA, pP_TIPO_AS, pP_FFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_TIPO_AS);
		cStmt.setObject(4, pP_FFIN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_MODCONTA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GRABAR_PLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_TIPO_AS, java.sql.Date pP_FFIN) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GRABAR_PLANTILLA(pP_EMPRESA, pP_TIPO_AS, pP_FFIN);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_GRABAR_PLANTILLA
	// --START-PAC_IAX_CONTABILIDAD.F_RECUPERA_DETALLEPLANTILLA(P_EMPRESA,
	// P_SMODCON, P_NLINEA)
	private HashMap callPAC_IAX_CONTABILIDAD__F_RECUPERA_DETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_NLINEA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_RECUPERA_DETALLEPLANTILLA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA", "pP_SMODCON", "pP_NLINEA" },
				new Object[] { pP_EMPRESA, pP_SMODCON, pP_NLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.setObject(3, pP_SMODCON);
		cStmt.setObject(4, pP_NLINEA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DETMODCONTA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_RECUPERA_DETALLEPLANTILLA(java.math.BigDecimal pP_EMPRESA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_NLINEA) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_RECUPERA_DETALLEPLANTILLA(pP_EMPRESA, pP_SMODCON, pP_NLINEA);
	}

	// --END-PAC_IAX_CONTABILIDAD.F_RECUPERA_DETALLEPLANTILLA
	// --START-PAC_IAX_CONTABILIDAD.F_RECUPERA_PLANTILLA(P_SMODCON)
	private HashMap callPAC_IAX_CONTABILIDAD__F_RECUPERA_PLANTILLA(java.math.BigDecimal pP_SMODCON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_RECUPERA_PLANTILLA(?, ?)}";

		logCall(callQuery, new String[] { "pP_SMODCON" }, new Object[] { pP_SMODCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SMODCON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_MODCONTA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_RECUPERA_PLANTILLA(java.math.BigDecimal pP_SMODCON) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_RECUPERA_PLANTILLA(pP_SMODCON);
	}
	// --END-PAC_IAX_CONTABILIDAD.F_RECUPERA_PLANTILLA

	// --START-PAC_IAX_CONTABILIDAD.F_CONTABILIZA_DIARIO(PCEMPRES, PFCONTABILIDAD)
	private HashMap callPAC_IAX_CONTABILIDAD__F_CONTABILIZA_DIARIO(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTABILIDAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_CONTABILIZA_DIARIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFCONTABILIDAD" },
				new Object[] { pPCEMPRES, pPFCONTABILIDAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFCONTABILIDAD);
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_CONTABILIZA_DIARIO(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTABILIDAD) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_CONTABILIZA_DIARIO(pPCEMPRES, pPFCONTABILIDAD);
	}
	// --END-PAC_IAX_CONTABILIDAD.F_CONTABILIZA_DIARIO

	// --START-PAC_IAX_CONTABILIDAD.F_GET_CONTABILIDAD_DIARIA(PCEMPRES, PFCONTABINI,
	// PFCONTABFIN, PFTRASPASINI, PFTRASPASFIN, PFADMININI, PFADMINFIN,
	// PCHECKTRASPAS)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_CONTABILIDAD_DIARIA(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTABINI, java.sql.Date pPFCONTABFIN, java.sql.Date pPFTRASPASINI,
			java.sql.Date pPFTRASPASFIN, java.sql.Date pPFADMININI, java.sql.Date pPFADMINFIN,
			java.math.BigDecimal pPCHECKTRASPAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_CONTABILIDAD_DIARIA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPFCONTABINI", "pPFCONTABFIN", "pPFTRASPASINI", "pPFTRASPASFIN",
						"pPFADMININI", "pPFADMINFIN", "pPCHECKTRASPAS" },
				new Object[] { pPCEMPRES, pPFCONTABINI, pPFCONTABFIN, pPFTRASPASINI, pPFTRASPASFIN, pPFADMININI,
						pPFADMINFIN, pPCHECKTRASPAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFCONTABINI);
		cStmt.setObject(4, pPFCONTABFIN);
		cStmt.setObject(5, pPFTRASPASINI);
		cStmt.setObject(6, pPFTRASPASFIN);
		cStmt.setObject(7, pPFADMININI);
		cStmt.setObject(8, pPFADMINFIN);
		cStmt.setObject(9, pPCHECKTRASPAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCONTDIARIAS"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCONTDIARIAS", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCONTDIARIAS", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONTABILIDAD_DIARIA(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTABINI, java.sql.Date pPFCONTABFIN, java.sql.Date pPFTRASPASINI,
			java.sql.Date pPFTRASPASFIN, java.sql.Date pPFADMININI, java.sql.Date pPFADMINFIN,
			java.math.BigDecimal pPCHECKTRASPAS) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_CONTABILIDAD_DIARIA(pPCEMPRES, pPFCONTABINI, pPFCONTABFIN,
				pPFTRASPASINI, pPFTRASPASFIN, pPFADMININI, pPFADMINFIN, pPCHECKTRASPAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_GET_CONTABILIDAD_DIARIA

	// --START-PAC_IAX_CONTABILIDAD.F_MONTAR_FICHERO(PCEMPRES, PFCONTABINI,
	// PFCONTABFIN, PFTRASPASINI, PFTRASPASFIN, PFADMININI, PFADMINFIN,
	// PCHECKTRASPAS)
	private HashMap callPAC_IAX_CONTABILIDAD__F_MONTAR_FICHERO(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTABINI, java.sql.Date pPFCONTABFIN, java.sql.Date pPFTRASPASINI,
			java.sql.Date pPFTRASPASFIN, java.sql.Date pPFADMININI, java.sql.Date pPFADMINFIN,
			java.math.BigDecimal pPCHECKTRASPAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_MONTAR_FICHERO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPFCONTABINI", "pPFCONTABFIN", "pPFTRASPASINI", "pPFTRASPASFIN",
						"pPFADMININI", "pPFADMINFIN", "pPCHECKTRASPAS" },
				new Object[] { pPCEMPRES, pPFCONTABINI, pPFCONTABFIN, pPFTRASPASINI, pPFTRASPASFIN, pPFADMININI,
						pPFADMINFIN, pPCHECKTRASPAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFCONTABINI);
		cStmt.setObject(4, pPFCONTABFIN);
		cStmt.setObject(5, pPFTRASPASINI);
		cStmt.setObject(6, pPFTRASPASFIN);
		cStmt.setObject(7, pPFADMININI);
		cStmt.setObject(8, pPFADMINFIN);
		cStmt.setObject(9, pPCHECKTRASPAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "PNOMFICHERO"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PNOMFICHERO", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PNOMFICHERO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_MONTAR_FICHERO(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTABINI, java.sql.Date pPFCONTABFIN, java.sql.Date pPFTRASPASINI,
			java.sql.Date pPFTRASPASFIN, java.sql.Date pPFADMININI, java.sql.Date pPFADMINFIN,
			java.math.BigDecimal pPCHECKTRASPAS) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_MONTAR_FICHERO(pPCEMPRES, pPFCONTABINI, pPFCONTABFIN, pPFTRASPASINI,
				pPFTRASPASFIN, pPFADMININI, pPFADMINFIN, pPCHECKTRASPAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_MONTAR_FICHERO

	// --START-PAC_IAX_CONTABILIDAD.F_TRASPASAR(PCEMPRES, PFECINI, PFECFIN,
	// PFADMININI, PFADMINFIN)
	private HashMap callPAC_IAX_CONTABILIDAD__F_TRASPASAR(java.math.BigDecimal pPCEMPRES, java.sql.Date pPFECINI,
			java.sql.Date pPFECFIN, java.sql.Date pPFADMININI, java.sql.Date pPFADMINFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_TRASPASAR(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFECINI", "pPFECFIN", "pPFADMININI", "pPFADMINFIN" },
				new Object[] { pPCEMPRES, pPFECINI, pPFECFIN, pPFADMININI, pPFADMINFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFECINI);
		cStmt.setObject(4, pPFECFIN);
		cStmt.setObject(5, pPFADMININI);
		cStmt.setObject(6, pPFADMINFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PNOMFICHERO"
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
			retVal.put("PNOMFICHERO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PNOMFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_TRASPASAR(java.math.BigDecimal pPCEMPRES, java.sql.Date pPFECINI,
			java.sql.Date pPFECFIN, java.sql.Date pPFADMININI, java.sql.Date pPFADMINFIN) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_TRASPASAR(pPCEMPRES, pPFECINI, pPFECFIN, pPFADMININI, pPFADMINFIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_TRASPASAR

	// --START-PAC_IAX_CONTABILIDAD.F_GET_DETCONTABILIDAD_DIARIA(PCEMPRES, PFCONTAB,
	// PCCUENTA, PNLINEA, PSMODCON, PCPAIS, PFEFEADM, PCPROCES)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_DETCONTABILIDAD_DIARIA(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTAB, String pPCCUENTA, java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPSMODCON,
			java.math.BigDecimal pPCPAIS, java.sql.Date pPFEFEADM, java.math.BigDecimal pPCPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_DETCONTABILIDAD_DIARIA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPFCONTAB", "pPCCUENTA", "pPNLINEA", "pPSMODCON", "pPCPAIS", "pPFEFEADM",
						"pPCPROCES" },
				new Object[] { pPCEMPRES, pPFCONTAB, pPCCUENTA, pPNLINEA, pPSMODCON, pPCPAIS, pPFEFEADM, pPCPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFCONTAB);
		cStmt.setObject(4, pPCCUENTA);
		cStmt.setObject(5, pPNLINEA);
		cStmt.setObject(6, pPSMODCON);
		cStmt.setObject(7, pPCPAIS);
		cStmt.setObject(8, pPFEFEADM);
		cStmt.setObject(9, pPCPROCES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PDETCONTAB"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PDETCONTAB", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PDETCONTAB", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_DETCONTABILIDAD_DIARIA(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTAB, String pPCCUENTA, java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPSMODCON,
			java.math.BigDecimal pPCPAIS, java.sql.Date pPFEFEADM, java.math.BigDecimal pPCPROCES) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_DETCONTABILIDAD_DIARIA(pPCEMPRES, pPFCONTAB, pPCCUENTA, pPNLINEA,
				pPSMODCON, pPCPAIS, pPFEFEADM, pPCPROCES);
	}
	// --END-PAC_IAX_CONTABILIDAD.F_GET_DETCONTABILIDAD_DIARIA

	// --START-PAC_IAX_CONTABILIDAD.F_MONTARFICHERO_DETALLE(P_CEMPRES, P_FCONTABINI,
	// P_FCONTABFIN, P_CCUENTA, P_NLINEA, P_SMODCON, P_CPAIS, P_FEFEADM, P_CPROCES)
	private HashMap callPAC_IAX_CONTABILIDAD__F_MONTARFICHERO_DETALLE(java.math.BigDecimal pP_CEMPRES,
			java.sql.Date pP_FCONTABINI, java.sql.Date pP_FCONTABFIN, String pP_CCUENTA, java.math.BigDecimal pP_NLINEA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_CPAIS, java.sql.Date pP_FEFEADM,
			java.math.BigDecimal pP_CPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_MONTARFICHERO_DETALLE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CEMPRES", "pP_FCONTABINI", "pP_FCONTABFIN", "pP_CCUENTA", "pP_NLINEA", "pP_SMODCON",
						"pP_CPAIS", "pP_FEFEADM", "pP_CPROCES" },
				new Object[] { pP_CEMPRES, pP_FCONTABINI, pP_FCONTABFIN, pP_CCUENTA, pP_NLINEA, pP_SMODCON, pP_CPAIS,
						pP_FEFEADM, pP_CPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_FCONTABINI);
		cStmt.setObject(4, pP_FCONTABFIN);
		cStmt.setObject(5, pP_CCUENTA);
		cStmt.setObject(6, pP_NLINEA);
		cStmt.setObject(7, pP_SMODCON);
		cStmt.setObject(8, pP_CPAIS);
		cStmt.setObject(9, pP_FEFEADM);
		cStmt.setObject(10, pP_CPROCES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, java.sql.Types.VARCHAR); // Valor de "P_NOMFICHERO"
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
			retVal.put("P_NOMFICHERO", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("P_NOMFICHERO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_MONTARFICHERO_DETALLE(java.math.BigDecimal pP_CEMPRES,
			java.sql.Date pP_FCONTABINI, java.sql.Date pP_FCONTABFIN, String pP_CCUENTA, java.math.BigDecimal pP_NLINEA,
			java.math.BigDecimal pP_SMODCON, java.math.BigDecimal pP_CPAIS, java.sql.Date pP_FEFEADM,
			java.math.BigDecimal pP_CPROCES) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_MONTARFICHERO_DETALLE(pP_CEMPRES, pP_FCONTABINI, pP_FCONTABFIN,
				pP_CCUENTA, pP_NLINEA, pP_SMODCON, pP_CPAIS, pP_FEFEADM, pP_CPROCES);
	}
	// --END-PAC_IAX_CONTABILIDAD.F_MONTARFICHERO_DETALLE

	// --START-PAC_IAX_CONTABILIDAD.F_GET_APUNTESMANUALES(PCEMPRES, PFCONTA_INI,
	// PFCONTA_FIN, PFEFEADM_INI, PFEFEADM_FIN)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_APUNTESMANUALES(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTA_INI, java.sql.Date pPFCONTA_FIN, java.sql.Date pPFEFEADM_INI,
			java.sql.Date pPFEFEADM_FIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_APUNTESMANUALES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPFCONTA_INI", "pPFCONTA_FIN", "pPFEFEADM_INI", "pPFEFEADM_FIN" },
				new Object[] { pPCEMPRES, pPFCONTA_INI, pPFCONTA_FIN, pPFEFEADM_INI, pPFEFEADM_FIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFCONTA_INI);
		cStmt.setObject(4, pPFCONTA_FIN);
		cStmt.setObject(5, pPFEFEADM_INI);
		cStmt.setObject(6, pPFEFEADM_FIN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_APUNTESMANUALES(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFCONTA_INI, java.sql.Date pPFCONTA_FIN, java.sql.Date pPFEFEADM_INI,
			java.sql.Date pPFEFEADM_FIN) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_APUNTESMANUALES(pPCEMPRES, pPFCONTA_INI, pPFCONTA_FIN,
				pPFEFEADM_INI, pPFEFEADM_FIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_GET_APUNTESMANUALES

	// --START-PAC_IAX_CONTABILIDAD.F_DEL_APUNTEMANUAL(PCPAIS, PFEFEADM, PCPROCES,
	// PCCUENTA, PNLINEA, PNASIENT, PCEMPRES, PFCONTA, PTDESCRI, PSINTERF, PTTIPPAG,
	// PIDPAGO, PCCOLETILLA, POTROS)
	private HashMap callPAC_IAX_CONTABILIDAD__F_DEL_APUNTEMANUAL(java.math.BigDecimal pPCPAIS, java.sql.Date pPFEFEADM,
			java.math.BigDecimal pPCPROCES, String pPCCUENTA, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPNASIENT, java.math.BigDecimal pPCEMPRES, java.sql.Date pPFCONTA, String pPTDESCRI,
			java.math.BigDecimal pPSINTERF, java.math.BigDecimal pPTTIPPAG, java.math.BigDecimal pPIDPAGO,
			String pPCCOLETILLA, String pPOTROS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_DEL_APUNTEMANUAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCPAIS", "pPFEFEADM", "pPCPROCES", "pPCCUENTA", "pPNLINEA", "pPNASIENT", "pPCEMPRES",
						"pPFCONTA", "pPTDESCRI", "pPSINTERF", "pPTTIPPAG", "pPIDPAGO", "pPCCOLETILLA", "pPOTROS" },
				new Object[] { pPCPAIS, pPFEFEADM, pPCPROCES, pPCCUENTA, pPNLINEA, pPNASIENT, pPCEMPRES, pPFCONTA,
						pPTDESCRI, pPSINTERF, pPTTIPPAG, pPIDPAGO, pPCCOLETILLA, pPOTROS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPAIS);
		cStmt.setObject(3, pPFEFEADM);
		cStmt.setObject(4, pPCPROCES);
		cStmt.setObject(5, pPCCUENTA);
		cStmt.setObject(6, pPNLINEA);
		cStmt.setObject(7, pPNASIENT);
		cStmt.setObject(8, pPCEMPRES);
		cStmt.setObject(9, pPFCONTA);
		cStmt.setObject(10, pPTDESCRI);
		cStmt.setObject(11, pPSINTERF);
		cStmt.setObject(12, pPTTIPPAG);
		cStmt.setObject(13, pPIDPAGO);
		cStmt.setObject(14, pPCCOLETILLA);
		cStmt.setObject(15, pPOTROS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_DEL_APUNTEMANUAL(java.math.BigDecimal pPCPAIS,
			java.sql.Date pPFEFEADM, java.math.BigDecimal pPCPROCES, String pPCCUENTA, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPNASIENT, java.math.BigDecimal pPCEMPRES, java.sql.Date pPFCONTA, String pPTDESCRI,
			java.math.BigDecimal pPSINTERF, java.math.BigDecimal pPTTIPPAG, java.math.BigDecimal pPIDPAGO,
			String pPCCOLETILLA, String pPOTROS) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_DEL_APUNTEMANUAL(pPCPAIS, pPFEFEADM, pPCPROCES, pPCCUENTA, pPNLINEA,
				pPNASIENT, pPCEMPRES, pPFCONTA, pPTDESCRI, pPSINTERF, pPTTIPPAG, pPIDPAGO, pPCCOLETILLA, pPOTROS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_DEL_APUNTEMANUAL

	// --START-PAC_IAX_CONTABILIDAD.F_GET_APUNTES(PCEMPRES, PFCONTA_INI,
	// PFCONTA_FIN, PFEFEADM_INI, PFEFEADM_FIN, PIDPAGO)
	private HashMap callPAC_IAX_CONTABILIDAD__F_GET_APUNTES(String pPCEMPRES, java.sql.Date pPFCONTA_INI,
			java.sql.Date pPFCONTA_FIN, java.sql.Date pPFEFEADM_INI, java.sql.Date pPFEFEADM_FIN,
			java.math.BigDecimal pPIDPAGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_GET_APUNTES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPFCONTA_INI", "pPFCONTA_FIN", "pPFEFEADM_INI", "pPFEFEADM_FIN",
						"pPIDPAGO" },
				new Object[] { pPCEMPRES, pPFCONTA_INI, pPFCONTA_FIN, pPFEFEADM_INI, pPFEFEADM_FIN, pPIDPAGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFCONTA_INI);
		cStmt.setObject(4, pPFCONTA_FIN);
		cStmt.setObject(5, pPFEFEADM_INI);
		cStmt.setObject(6, pPFEFEADM_FIN);
		cStmt.setObject(7, pPIDPAGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_GET_APUNTES(String pPCEMPRES, java.sql.Date pPFCONTA_INI,
			java.sql.Date pPFCONTA_FIN, java.sql.Date pPFEFEADM_INI, java.sql.Date pPFEFEADM_FIN,
			java.math.BigDecimal pPIDPAGO) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_GET_APUNTES(pPCEMPRES, pPFCONTA_INI, pPFCONTA_FIN, pPFEFEADM_INI,
				pPFEFEADM_FIN, pPIDPAGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_GET_APUNTES

	// --START-PAC_IAX_CONTABILIDAD.F_SET_APUNTEMANUAL(PSINTERF, PTTIPPAG, PIDPAGO,
	// PFCONTA, PNASIENT, PNLINEA, PCCUENTA, PCCOLETILLA, PTAPUNTE, PIAPUNTE,
	// PTDESCRI, PFEFEADM, POTROS, PCENLACE, PCEMPRES, PCPROCES, PCPAIS, PFTRASPASO,
	// PCLAVEASI, PTIPODIARIO, PFASIENTO)
	private HashMap callPAC_IAX_CONTABILIDAD__F_SET_APUNTEMANUAL(java.math.BigDecimal pPSINTERF,
			java.math.BigDecimal pPTTIPPAG, java.math.BigDecimal pPIDPAGO, java.sql.Date pPFCONTA,
			java.math.BigDecimal pPNASIENT, java.math.BigDecimal pPNLINEA, String pPCCUENTA, String pPCCOLETILLA,
			String pPTAPUNTE, java.math.BigDecimal pPIAPUNTE, String pPTDESCRI, java.sql.Date pPFEFEADM, String pPOTROS,
			String pPCENLACE, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCPROCES,
			java.math.BigDecimal pPCPAIS, java.sql.Date pPFTRASPASO, String pPCLAVEASI, String pPTIPODIARIO,
			java.sql.Date pPFASIENTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_SET_APUNTEMANUAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPTTIPPAG", "pPIDPAGO", "pPFCONTA", "pPNASIENT", "pPNLINEA",
				"pPCCUENTA", "pPCCOLETILLA", "pPTAPUNTE", "pPIAPUNTE", "pPTDESCRI", "pPFEFEADM", "pPOTROS", "pPCENLACE",
				"pPCEMPRES", "pPCPROCES", "pPCPAIS", "pPFTRASPASO", "pPCLAVEASI", "pPTIPODIARIO", "pPFASIENTO" },
				new Object[] { pPSINTERF, pPTTIPPAG, pPIDPAGO, pPFCONTA, pPNASIENT, pPNLINEA, pPCCUENTA, pPCCOLETILLA,
						pPTAPUNTE, pPIAPUNTE, pPTDESCRI, pPFEFEADM, pPOTROS, pPCENLACE, pPCEMPRES, pPCPROCES, pPCPAIS,
						pPFTRASPASO, pPCLAVEASI, pPTIPODIARIO, pPFASIENTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINTERF);
		cStmt.setObject(3, pPTTIPPAG);
		cStmt.setObject(4, pPIDPAGO);
		cStmt.setObject(5, pPFCONTA);
		cStmt.setObject(6, pPNASIENT);
		cStmt.setObject(7, pPNLINEA);
		cStmt.setObject(8, pPCCUENTA);
		cStmt.setObject(9, pPCCOLETILLA);
		cStmt.setObject(10, pPTAPUNTE);
		cStmt.setObject(11, pPIAPUNTE);
		cStmt.setObject(12, pPTDESCRI);
		cStmt.setObject(13, pPFEFEADM);
		cStmt.setObject(14, pPOTROS);
		cStmt.setObject(15, pPCENLACE);
		cStmt.setObject(16, pPCEMPRES);
		cStmt.setObject(17, pPCPROCES);
		cStmt.setObject(18, pPCPAIS);
		cStmt.setObject(19, pPFTRASPASO);
		cStmt.setObject(20, pPCLAVEASI);
		cStmt.setObject(21, pPTIPODIARIO);
		cStmt.setObject(22, pPFASIENTO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(23, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_SET_APUNTEMANUAL(java.math.BigDecimal pPSINTERF,
			java.math.BigDecimal pPTTIPPAG, java.math.BigDecimal pPIDPAGO, java.sql.Date pPFCONTA,
			java.math.BigDecimal pPNASIENT, java.math.BigDecimal pPNLINEA, String pPCCUENTA, String pPCCOLETILLA,
			String pPTAPUNTE, java.math.BigDecimal pPIAPUNTE, String pPTDESCRI, java.sql.Date pPFEFEADM, String pPOTROS,
			String pPCENLACE, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCPROCES,
			java.math.BigDecimal pPCPAIS, java.sql.Date pPFTRASPASO, String pPCLAVEASI, String pPTIPODIARIO,
			java.sql.Date pPFASIENTO) throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_SET_APUNTEMANUAL(pPSINTERF, pPTTIPPAG, pPIDPAGO, pPFCONTA, pPNASIENT,
				pPNLINEA, pPCCUENTA, pPCCOLETILLA, pPTAPUNTE, pPIAPUNTE, pPTDESCRI, pPFEFEADM, pPOTROS, pPCENLACE,
				pPCEMPRES, pPCPROCES, pPCPAIS, pPFTRASPASO, pPCLAVEASI, pPTIPODIARIO, pPFASIENTO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_SET_APUNTEMANUAL

	// --START-PAC_IAX_CONTABILIDAD.F_TRASPASA_APUNTEMANUAL()
	private HashMap callPAC_IAX_CONTABILIDAD__F_TRASPASA_APUNTEMANUAL() throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTABILIDAD.F_TRASPASA_APUNTEMANUAL(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTABILIDAD__F_TRASPASA_APUNTEMANUAL() throws Exception {
		return this.callPAC_IAX_CONTABILIDAD__F_TRASPASA_APUNTEMANUAL();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTABILIDAD.F_TRASPASA_APUNTEMANUAL

}
