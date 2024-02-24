package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_AGE_DATOS extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_AGE_DATOS.class);
	private Connection conn = null;

	public PAC_IAX_AGE_DATOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AGE_DATOS.F_DEL_ASOCIACION(PCAGENTE, PCTIPASOCIACION)
	private HashMap callPAC_IAX_AGE_DATOS__F_DEL_ASOCIACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPASOCIACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_DEL_ASOCIACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPASOCIACION" },
				new Object[] { pPCAGENTE, pPCTIPASOCIACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPASOCIACION);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_DEL_ASOCIACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPASOCIACION) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_DEL_ASOCIACION(pPCAGENTE, pPCTIPASOCIACION);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_DEL_ASOCIACION
	// --START-PAC_IAX_AGE_DATOS.F_DEL_BANCO(PCAGENTE, PCTIPBANCO)
	private HashMap callPAC_IAX_AGE_DATOS__F_DEL_BANCO(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPBANCO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_DEL_BANCO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPBANCO" }, new Object[] { pPCAGENTE, pPCTIPBANCO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPBANCO);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_DEL_BANCO(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPBANCO) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_DEL_BANCO(pPCAGENTE, pPCTIPBANCO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_DEL_BANCO
	// --START-PAC_IAX_AGE_DATOS.F_DEL_ENTIDADASEG(PCAGENTE, PCTIPENTIDADASEG)
	private HashMap callPAC_IAX_AGE_DATOS__F_DEL_ENTIDADASEG(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPENTIDADASEG) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_DEL_ENTIDADASEG(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPENTIDADASEG" },
				new Object[] { pPCAGENTE, pPCTIPENTIDADASEG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPENTIDADASEG);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_DEL_ENTIDADASEG(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPENTIDADASEG) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_DEL_ENTIDADASEG(pPCAGENTE, pPCTIPENTIDADASEG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_DEL_ENTIDADASEG
	// --START-PAC_IAX_AGE_DATOS.F_DEL_REFERENCIA(PCAGENTE, PNORDREFERENCIA)
	private HashMap callPAC_IAX_AGE_DATOS__F_DEL_REFERENCIA(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDREFERENCIA) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_DEL_REFERENCIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPNORDREFERENCIA" },
				new Object[] { pPCAGENTE, pPNORDREFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNORDREFERENCIA);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_DEL_REFERENCIA(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDREFERENCIA) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_DEL_REFERENCIA(pPCAGENTE, pPNORDREFERENCIA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_DEL_REFERENCIA
	// --START-PAC_IAX_AGE_DATOS.F_GET_ASOCIACION(PCAGENTE, PCTIPASOCIACION,
	// PNUMCOLEGIADO)
	private HashMap callPAC_IAX_AGE_DATOS__F_GET_ASOCIACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPASOCIACION, String pPNUMCOLEGIADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_GET_ASOCIACION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPASOCIACION", "pPNUMCOLEGIADO" },
				new Object[] { pPCAGENTE, pPCTIPASOCIACION, pPNUMCOLEGIADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPASOCIACION);
		cStmt.setObject(4, pPNUMCOLEGIADO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGE_ASOCIACION".toUpperCase())); // Valor de "POASOCIACION"
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
			retVal.put("POASOCIACION", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("POASOCIACION", null);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_GET_ASOCIACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPASOCIACION, String pPNUMCOLEGIADO) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_GET_ASOCIACION(pPCAGENTE, pPCTIPASOCIACION, pPNUMCOLEGIADO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_GET_ASOCIACION
	// --START-PAC_IAX_AGE_DATOS.F_GET_BANCO(PCAGENTE, PCTIPBANCO)
	private HashMap callPAC_IAX_AGE_DATOS__F_GET_BANCO(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPBANCO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_GET_BANCO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPBANCO" }, new Object[] { pPCAGENTE, pPCTIPBANCO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPBANCO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGE_BANCO".toUpperCase())); // Valor de "POBANCO"
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
			retVal.put("POBANCO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("POBANCO", null);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_GET_BANCO(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPBANCO) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_GET_BANCO(pPCAGENTE, pPCTIPBANCO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_GET_BANCO
	// --START-PAC_IAX_AGE_DATOS.F_GET_ENTIDADASEG(PCAGENTE, PCTIPENTIDADASEG)
	private HashMap callPAC_IAX_AGE_DATOS__F_GET_ENTIDADASEG(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPENTIDADASEG) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_GET_ENTIDADASEG(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPENTIDADASEG" },
				new Object[] { pPCAGENTE, pPCTIPENTIDADASEG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPENTIDADASEG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGE_ENTIDADASEG".toUpperCase())); // Valor de "POENTIDADASEG"
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
			retVal.put("POENTIDADASEG", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("POENTIDADASEG", null);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_GET_ENTIDADASEG(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPENTIDADASEG) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_GET_ENTIDADASEG(pPCAGENTE, pPCTIPENTIDADASEG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_GET_ENTIDADASEG
	// --START-PAC_IAX_AGE_DATOS.F_GET_REFERENCIA(PCAGENTE, PNORDREFERENCIA,
	// PTREFERENCIA)
	private HashMap callPAC_IAX_AGE_DATOS__F_GET_REFERENCIA(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDREFERENCIA, String pPTREFERENCIA) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_GET_REFERENCIA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPNORDREFERENCIA", "pPTREFERENCIA" },
				new Object[] { pPCAGENTE, pPNORDREFERENCIA, pPTREFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNORDREFERENCIA);
		cStmt.setObject(4, pPTREFERENCIA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGE_REFERENCIA".toUpperCase())); // Valor de "POREFERENCIA"
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
			retVal.put("POREFERENCIA", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("POREFERENCIA", null);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_GET_REFERENCIA(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDREFERENCIA, String pPTREFERENCIA) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_GET_REFERENCIA(pPCAGENTE, pPNORDREFERENCIA, pPTREFERENCIA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_GET_REFERENCIA
	// --START-PAC_IAX_AGE_DATOS.F_SET_ASOCIACION(PCAGENTE, PCTIPASOCIACION,
	// PNUMCOLEGIADO, PCTIPASOCIACION_ORIG)
	private HashMap callPAC_IAX_AGE_DATOS__F_SET_ASOCIACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPASOCIACION, String pPNUMCOLEGIADO, java.math.BigDecimal pPCTIPASOCIACION_ORIG)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_SET_ASOCIACION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPASOCIACION", "pPNUMCOLEGIADO", "pPCTIPASOCIACION_ORIG" },
				new Object[] { pPCAGENTE, pPCTIPASOCIACION, pPNUMCOLEGIADO, pPCTIPASOCIACION_ORIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPASOCIACION);
		cStmt.setObject(4, pPNUMCOLEGIADO);
		cStmt.setObject(5, pPCTIPASOCIACION_ORIG);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_SET_ASOCIACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPASOCIACION, String pPNUMCOLEGIADO, java.math.BigDecimal pPCTIPASOCIACION_ORIG)
			throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_SET_ASOCIACION(pPCAGENTE, pPCTIPASOCIACION, pPNUMCOLEGIADO,
				pPCTIPASOCIACION_ORIG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGE_DATOS.F_SET_ASOCIACION

	// --START-PAC_IAX_AGE_DATOS.F_SET_BANCO(PCAGENTE, PCTIPBANCO, PCTIPBANCO_ORIG)
	private HashMap callPAC_IAX_AGE_DATOS__F_SET_BANCO(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPBANCO,
			java.math.BigDecimal pPCTIPBANCO_ORIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_SET_BANCO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPBANCO", "pPCTIPBANCO_ORIG" },
				new Object[] { pPCAGENTE, pPCTIPBANCO, pPCTIPBANCO_ORIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPBANCO);
		cStmt.setObject(4, pPCTIPBANCO_ORIG);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_SET_BANCO(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPBANCO, java.math.BigDecimal pPCTIPBANCO_ORIG) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_SET_BANCO(pPCAGENTE, pPCTIPBANCO, pPCTIPBANCO_ORIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_SET_BANCO
	// --START-PAC_IAX_AGE_DATOS.F_SET_ENTIDADASEG(PCAGENTE, PCTIPENTIDADASEG,
	// PCTIPENTIDADASEG_ORIG)
	private HashMap callPAC_IAX_AGE_DATOS__F_SET_ENTIDADASEG(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPENTIDADASEG, java.math.BigDecimal pPCTIPENTIDADASEG_ORIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_SET_ENTIDADASEG(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPENTIDADASEG", "pPCTIPENTIDADASEG_ORIG" },
				new Object[] { pPCAGENTE, pPCTIPENTIDADASEG, pPCTIPENTIDADASEG_ORIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPENTIDADASEG);
		cStmt.setObject(4, pPCTIPENTIDADASEG_ORIG);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_SET_ENTIDADASEG(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPENTIDADASEG, java.math.BigDecimal pPCTIPENTIDADASEG_ORIG) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_SET_ENTIDADASEG(pPCAGENTE, pPCTIPENTIDADASEG, pPCTIPENTIDADASEG_ORIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_DATOS.F_SET_ENTIDADASEG
	// --START-PAC_IAX_AGE_DATOS.F_SET_REFERENCIA(PCAGENTE, PNORDREFERENCIA,
	// PTREFERENCIA)
	private HashMap callPAC_IAX_AGE_DATOS__F_SET_REFERENCIA(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDREFERENCIA, String pPTREFERENCIA) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_SET_REFERENCIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPNORDREFERENCIA", "pPTREFERENCIA" },
				new Object[] { pPCAGENTE, pPNORDREFERENCIA, pPTREFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNORDREFERENCIA);
		cStmt.setObject(4, pPTREFERENCIA);
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_SET_REFERENCIA(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDREFERENCIA, String pPTREFERENCIA) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_SET_REFERENCIA(pPCAGENTE, pPNORDREFERENCIA, pPTREFERENCIA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGE_DATOS.F_SET_REFERENCIA

	// --START-PAC_IAX_AGE_DATOS.F_GET_PROD_USU(PCAGENTE, PCRAMO)
	private HashMap callPAC_IAX_AGE_DATOS__F_GET_PROD_USU(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCRAMO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_GET_PROD_USU(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCRAMO" }, new Object[] { pPCAGENTE, pPCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCRAMO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROD_USU".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_GET_PROD_USU(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRAMO) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_GET_PROD_USU(pPCAGENTE, pPCRAMO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGE_DATOS.F_GET_PROD_USU

	// --START-PAC_IAX_AGE_DATOS.F_SET_PROD_USU(PSELECCIONADO, PCDELEGA, PCRAMO,
	// PCMODALI, PCTIPSEG, PCCOLECT, PEMITIR, PACCESIBLE)
	private HashMap callPAC_IAX_AGE_DATOS__F_SET_PROD_USU(java.math.BigDecimal pPSELECCIONADO,
			java.math.BigDecimal pPCDELEGA, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPEMITIR,
			java.math.BigDecimal pPACCESIBLE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_DATOS.F_SET_PROD_USU(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSELECCIONADO", "pPCDELEGA", "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT",
						"pPEMITIR", "pPACCESIBLE" },
				new Object[] { pPSELECCIONADO, pPCDELEGA, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPEMITIR,
						pPACCESIBLE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSELECCIONADO);
		cStmt.setObject(3, pPCDELEGA);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPCMODALI);
		cStmt.setObject(6, pPCTIPSEG);
		cStmt.setObject(7, pPCCOLECT);
		cStmt.setObject(8, pPEMITIR);
		cStmt.setObject(9, pPACCESIBLE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGE_DATOS__F_SET_PROD_USU(java.math.BigDecimal pPSELECCIONADO,
			java.math.BigDecimal pPCDELEGA, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPEMITIR,
			java.math.BigDecimal pPACCESIBLE) throws Exception {
		return this.callPAC_IAX_AGE_DATOS__F_SET_PROD_USU(pPSELECCIONADO, pPCDELEGA, pPCRAMO, pPCMODALI, pPCTIPSEG,
				pPCCOLECT, pPEMITIR, pPACCESIBLE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGE_DATOS.F_SET_PROD_USU

}
