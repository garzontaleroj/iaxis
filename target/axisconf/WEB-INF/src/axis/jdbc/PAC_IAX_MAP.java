package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MAP extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MAP.class);
	private Connection conn = null;

	public PAC_IAX_MAP(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MAP.F_EJECUTA(PMAP, PPARAM)
	private HashMap callPAC_IAX_MAP__F_EJECUTA(String pPMAP, String pPPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_EJECUTA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMAP", "pPPARAM" }, new Object[] { pPMAP, pPPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMAP);
		cStmt.setObject(3, pPPARAM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PEJECUTAREP"
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
			retVal.put("PEJECUTAREP", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PEJECUTAREP", null);
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

	public HashMap ejecutaPAC_IAX_MAP__F_EJECUTA(String pPMAP, String pPPARAM) throws Exception {
		return this.callPAC_IAX_MAP__F_EJECUTA(pPMAP, pPPARAM);
	}

	// --END-PAC_IAX_MAP.F_EJECUTA
	// --START-PAC_IAX_MAP.F_EJECUTA_MULTIMAP(PMAPS, PPARAM)
	private HashMap callPAC_IAX_MAP__F_EJECUTA_MULTIMAP(String pPMAPS, String pPPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_EJECUTA_MULTIMAP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMAPS", "pPPARAM" }, new Object[] { pPMAPS, pPPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMAPS);
		cStmt.setObject(3, pPPARAM);
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

	public HashMap ejecutaPAC_IAX_MAP__F_EJECUTA_MULTIMAP(String pPMAPS, String pPPARAM) throws Exception {
		return this.callPAC_IAX_MAP__F_EJECUTA_MULTIMAP(pPMAPS, pPPARAM);
	}

	// --END-PAC_IAX_MAP.F_EJECUTA_MULTIMAP
	// --START-PAC_IAX_MAP.F_GET_ARBOL(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_ARBOL(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_ARBOL(?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_ARBOL(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_ARBOL(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_ARBOL
	// --START-PAC_IAX_MAP.F_GET_CABECERAMAP(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_CABECERAMAP(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_CABECERAMAP(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTCOMENTARIO"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTIPOTRAT"
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
			retVal.put("PTCOMENTARIO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTCOMENTARIO", null);
		}
		try {
			retVal.put("PTIPOTRAT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTIPOTRAT", null);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_CABECERAMAP(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_CABECERAMAP(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_CABECERAMAP
	// --START-PAC_IAX_MAP.F_GET_DATMAP(PMAP)
	private HashMap callPAC_IAX_MAP__F_GET_DATMAP(String pPMAP) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_DATMAP(?, ?)}";

		logCall(callQuery, new String[] { "pPMAP" }, new Object[] { pPMAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMAP);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_DATMAP(String pPMAP) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_DATMAP(pPMAP);
	}

	// --END-PAC_IAX_MAP.F_GET_DATMAP
	// --START-PAC_IAX_MAP.F_GET_LISTADOMAPS(PTIPTRAT, PTIPMAP)
	private HashMap callPAC_IAX_MAP__F_GET_LISTADOMAPS(String pPTIPTRAT, java.math.BigDecimal pPTIPMAP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_LISTADOMAPS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPTRAT", "pPTIPMAP" }, new Object[] { pPTIPTRAT, pPTIPMAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPTRAT);
		cStmt.setObject(3, pPTIPMAP);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_LISTADOMAPS(String pPTIPTRAT, java.math.BigDecimal pPTIPMAP)
			throws Exception {
		return this.callPAC_IAX_MAP__F_GET_LISTADOMAPS(pPTIPTRAT, pPTIPMAP);
	}

	// --END-PAC_IAX_MAP.F_GET_LISTADOMAPS
	// --START-PAC_IAX_MAP.F_GET_LSTTABLAHIJOS(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_LSTTABLAHIJOS(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_LSTTABLAHIJOS(?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_LSTTABLAHIJOS(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_LSTTABLAHIJOS(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_LSTTABLAHIJOS
	// --START-PAC_IAX_MAP.F_GET_MAPCABECERA(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_MAPCABECERA(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_MAPCABECERA(?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_MAPCABECERA(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_MAPCABECERA(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_MAPCABECERA
	// --START-PAC_IAX_MAP.F_GET_MAPCABTRATAR(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_MAPCABTRATAR(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_MAPCABTRATAR(?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_MAPCABTRATAR(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_MAPCABTRATAR(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_MAPCABTRATAR
	// --START-PAC_IAX_MAP.F_GET_MAPCOMODIN(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_MAPCOMODIN(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_MAPCOMODIN(?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_MAPCOMODIN(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_MAPCOMODIN(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_MAPCOMODIN
	// --START-PAC_IAX_MAP.F_GET_MAPCONDICION(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_MAPCONDICION(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_MAPCONDICION(?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_MAPCONDICION(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_MAPCONDICION(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_MAPCONDICION
	// --START-PAC_IAX_MAP.F_GET_MAPDETALLE(PCMAPEAD, PNORDEN)
	private HashMap callPAC_IAX_MAP__F_GET_MAPDETALLE(String pPCMAPEAD, java.math.BigDecimal pPNORDEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_MAPDETALLE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPNORDEN" }, new Object[] { pPCMAPEAD, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_MAPDETALLE(String pPCMAPEAD, java.math.BigDecimal pPNORDEN)
			throws Exception {
		return this.callPAC_IAX_MAP__F_GET_MAPDETALLE(pPCMAPEAD, pPNORDEN);
	}

	// --END-PAC_IAX_MAP.F_GET_MAPDETALLE
	// --START-PAC_IAX_MAP.F_GET_MAPDETTRATAR(PCMAPEAD, PNORDEN)
	private HashMap callPAC_IAX_MAP__F_GET_MAPDETTRATAR(String pPCMAPEAD, java.math.BigDecimal pPNORDEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_MAPDETTRATAR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPNORDEN" }, new Object[] { pPCMAPEAD, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_MAPDETTRATAR(String pPCMAPEAD, java.math.BigDecimal pPNORDEN)
			throws Exception {
		return this.callPAC_IAX_MAP__F_GET_MAPDETTRATAR(pPCMAPEAD, pPNORDEN);
	}

	// --END-PAC_IAX_MAP.F_GET_MAPDETTRATAR
	// --START-PAC_IAX_MAP.F_GET_MAPTABLA(PCMAPEAD)
	private HashMap callPAC_IAX_MAP__F_GET_MAPTABLA(String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_MAPTABLA(?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD" }, new Object[] { pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_MAPTABLA(String pPCMAPEAD) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_MAPTABLA(pPCMAPEAD);
	}

	// --END-PAC_IAX_MAP.F_GET_MAPTABLA
	// --START-PAC_IAX_MAP.F_GET_OBJETO(NODE_VALUE, NODE_LABEL)
	private HashMap callPAC_IAX_MAP__F_GET_OBJETO(String pNODE_VALUE, String pNODE_LABEL) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_OBJETO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pNODE_VALUE", "pNODE_LABEL" }, new Object[] { pNODE_VALUE, pNODE_LABEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNODE_VALUE);
		cStmt.setObject(3, pNODE_LABEL);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_OBJETO(String pNODE_VALUE, String pNODE_LABEL) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_OBJETO(pNODE_VALUE, pNODE_LABEL);
	}

	// --END-PAC_IAX_MAP.F_GET_OBJETO
	// --START-PAC_IAX_MAP.F_GET_TIPOMAP(PMAP)
	private HashMap callPAC_IAX_MAP__F_GET_TIPOMAP(String pPMAP) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_TIPOMAP(?, ?)}";

		logCall(callQuery, new String[] { "pPMAP" }, new Object[] { pPMAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMAP);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_TIPOMAP(String pPMAP) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_TIPOMAP(pPMAP);
	}
	// --END-PAC_IAX_MAP.F_GET_TIPOMAP
	// --START-PAC_IAX_MAP.F_SET_MAPDETALLE(PCMAPEAD, PNORDEN, PNPOSICION,
	// PNLONGITUD)
	/*
	 * private HashMap callPAC_IAX_MAP__F_SET_MAPDETALLE (String pPCMAPEAD,
	 * java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNPOSICION,
	 * java.math.BigDecimal pPNLONGITUD) throws Exception { String
	 * callQuery="{?=call PAC_IAX_MAP.F_SET_MAPDETALLE(?, ?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] {"pPCMAPEAD", "pPNORDEN", "pPNPOSICION",
	 * "pPNLONGITUD"}, new Object[] {pPCMAPEAD, pPNORDEN, pPNPOSICION,
	 * pPNLONGITUD}); CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCMAPEAD); cStmt.setObject(3, pPNORDEN); cStmt.setObject(4, pPNPOSICION);
	 * cStmt.setObject(5, pPNLONGITUD); cStmt.registerOutParameter(1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(6,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal=new HashMap(); try { retVal.put("RETURN", cStmt.getObject(1));
	 * } catch (SQLException e) { retVal.put("RETURN", null); } try {
	 * retVal.put("MENSAJES", cStmt.getObject(6)); } catch (SQLException e) {
	 * retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPDETALLE (String pPCMAPEAD,
	 * java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNPOSICION,
	 * java.math.BigDecimal pPNLONGITUD) throws Exception { return
	 * this.callPAC_IAX_MAP__F_SET_MAPDETALLE(pPCMAPEAD, pPNORDEN, pPNPOSICION,
	 * pPNLONGITUD); }
	 */
	// --END-PAC_IAX_MAP.F_SET_MAPDETALLE*/
	// --START-PAC_IAX_MAP.F_SET_MAPDETTRATAR(PCMAPEAD, PTCAMPO, PTMASCARA,
	// PTCONDICION, PCTABLA, PNVECES, PCTIPCAMPO)
	/*
	 * private HashMap callPAC_IAX_MAP__F_SET_MAPDETTRATAR (String pPCMAPEAD, String
	 * pPTCAMPO, String pPTMASCARA, String pPTCONDICION, java.math.BigDecimal
	 * pPCTABLA, java.math.BigDecimal pPNVECES, String pPCTIPCAMPO) throws Exception
	 * { String
	 * callQuery="{?=call PAC_IAX_MAP.F_SET_MAPDETTRATAR(?, ?, ?, ?, ?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] {"pPCMAPEAD", "pPTCAMPO", "pPTMASCARA",
	 * "pPTCONDICION", "pPCTABLA", "pPNVECES", "pPCTIPCAMPO"}, new Object[]
	 * {pPCMAPEAD, pPTCAMPO, pPTMASCARA, pPTCONDICION, pPCTABLA, pPNVECES,
	 * pPCTIPCAMPO}); CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCMAPEAD); cStmt.setObject(3, pPTCAMPO); cStmt.setObject(4, pPTMASCARA);
	 * cStmt.setObject(5, pPTCONDICION); cStmt.setObject(6, pPCTABLA);
	 * cStmt.setObject(7, pPNVECES); cStmt.setObject(8, pPCTIPCAMPO);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(9)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPDETTRATAR (String pPCMAPEAD,
	 * String pPTCAMPO, String pPTMASCARA, String pPTCONDICION, java.math.BigDecimal
	 * pPCTABLA, java.math.BigDecimal pPNVECES, String pPCTIPCAMPO) throws Exception
	 * { return this.callPAC_IAX_MAP__F_SET_MAPDETTRATAR(pPCMAPEAD, pPTCAMPO,
	 * pPTMASCARA, pPTCONDICION, pPCTABLA, pPNVECES, pPCTIPCAMPO); }
	 */
	// --END-PAC_IAX_MAP.F_SET_MAPDETTRATAR

	// --START-PAC_IAX_MAP.F_GENERAR_LISTADOS(PMAP, PPARAM)
	private HashMap callPAC_IAX_MAP__F_GENERAR_LISTADOS(String pPMAP, String pPPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GENERAR_LISTADOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMAP", "pPPARAM" }, new Object[] { pPMAP, pPPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMAP);
		cStmt.setObject(3, pPPARAM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PEJECUTAREP"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "VTIMP"
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
			retVal.put("PEJECUTAREP", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PEJECUTAREP", null);
		}
		try {
			retVal.put("VTIMP", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("VTIMP", null);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GENERAR_LISTADOS(String pPMAP, String pPPARAM) throws Exception {
		return this.callPAC_IAX_MAP__F_GENERAR_LISTADOS(pPMAP, pPPARAM);
	}
	// --END-PAC_IAX_MAP.F_GENERAR_LISTADOS

	// --START-PAC_IAX_MAP.F_SET_MAPCABECERA(PCMAPEAD, PTDESMAP, PTPARPATH,
	// PTTIPOMAP, PCSEPARADOR, PCMAPCOMODIN, PTTIPOTRAT, PTCOMENTARIO, PTPARAMETROS,
	// PCMANTEN, PGENERA_REPORT)
	private HashMap callPAC_IAX_MAP__F_SET_MAPCABECERA(String pPCMAPEAD, String pPTDESMAP, String pPTPARPATH,
			java.math.BigDecimal pPTTIPOMAP, String pPCSEPARADOR, String pPCMAPCOMODIN, String pPTTIPOTRAT,
			String pPTCOMENTARIO, String pPTPARAMETROS, java.math.BigDecimal pPCMANTEN,
			java.math.BigDecimal pPGENERA_REPORT) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPCABECERA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMAPEAD", "pPTDESMAP", "pPTPARPATH", "pPTTIPOMAP", "pPCSEPARADOR", "pPCMAPCOMODIN",
						"pPTTIPOTRAT", "pPTCOMENTARIO", "pPTPARAMETROS", "pPCMANTEN", "pPGENERA_REPORT" },
				new Object[] { pPCMAPEAD, pPTDESMAP, pPTPARPATH, pPTTIPOMAP, pPCSEPARADOR, pPCMAPCOMODIN, pPTTIPOTRAT,
						pPTCOMENTARIO, pPTPARAMETROS, pPCMANTEN, pPGENERA_REPORT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPTDESMAP);
		cStmt.setObject(4, pPTPARPATH);
		cStmt.setObject(5, pPTTIPOMAP);
		cStmt.setObject(6, pPCSEPARADOR);
		cStmt.setObject(7, pPCMAPCOMODIN);
		cStmt.setObject(8, pPTTIPOTRAT);
		cStmt.setObject(9, pPTCOMENTARIO);
		cStmt.setObject(10, pPTPARAMETROS);
		cStmt.setObject(11, pPCMANTEN);
		cStmt.setObject(12, pPGENERA_REPORT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, java.sql.Types.VARCHAR); // Valor de "PCMAPEAD_SALIDA"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCMAPEAD_SALIDA", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PCMAPEAD_SALIDA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPCABECERA(String pPCMAPEAD, String pPTDESMAP, String pPTPARPATH,
			java.math.BigDecimal pPTTIPOMAP, String pPCSEPARADOR, String pPCMAPCOMODIN, String pPTTIPOTRAT,
			String pPTCOMENTARIO, String pPTPARAMETROS, java.math.BigDecimal pPCMANTEN,
			java.math.BigDecimal pPGENERA_REPORT) throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPCABECERA(pPCMAPEAD, pPTDESMAP, pPTPARPATH, pPTTIPOMAP, pPCSEPARADOR,
				pPCMAPCOMODIN, pPTTIPOTRAT, pPTCOMENTARIO, pPTPARAMETROS, pPCMANTEN, pPGENERA_REPORT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MAP.F_SET_MAPCABECERA

	// --START-PAC_IAX_MAP.F_DEL_MAPCOMODIN(PCMAPEAD, PCMAPCOM)
	private HashMap callPAC_IAX_MAP__F_DEL_MAPCOMODIN(String pPCMAPEAD, String pPCMAPCOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_DEL_MAPCOMODIN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPCMAPCOM" }, new Object[] { pPCMAPEAD, pPCMAPCOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPCMAPCOM);
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

	public HashMap ejecutaPAC_IAX_MAP__F_DEL_MAPCOMODIN(String pPCMAPEAD, String pPCMAPCOM) throws Exception {
		return this.callPAC_IAX_MAP__F_DEL_MAPCOMODIN(pPCMAPEAD, pPCMAPCOM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_DEL_MAPCOMODIN
	// --START-PAC_IAX_MAP.F_SET_MAPCOMODIN(PCMAPEAD, PCMAPCOM)
	private HashMap callPAC_IAX_MAP__F_SET_MAPCOMODIN(String pPCMAPEAD, String pPCMAPCOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPCOMODIN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPCMAPCOM" }, new Object[] { pPCMAPEAD, pPCMAPCOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPCMAPCOM);
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

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPCOMODIN(String pPCMAPEAD, String pPCMAPCOM) throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPCOMODIN(pPCMAPEAD, pPCMAPCOM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_SET_MAPCOMODIN
	// --START-PAC_IAX_MAP.F_DEL_MAPCABTRATAR(PCMAPEAD, PCTABLA, PNVECES)
	private HashMap callPAC_IAX_MAP__F_DEL_MAPCABTRATAR(String pPCMAPEAD, java.math.BigDecimal pPCTABLA,
			java.math.BigDecimal pPNVECES) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_DEL_MAPCABTRATAR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPCTABLA", "pPNVECES" },
				new Object[] { pPCMAPEAD, pPCTABLA, pPNVECES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPCTABLA);
		cStmt.setObject(4, pPNVECES);
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

	public HashMap ejecutaPAC_IAX_MAP__F_DEL_MAPCABTRATAR(String pPCMAPEAD, java.math.BigDecimal pPCTABLA,
			java.math.BigDecimal pPNVECES) throws Exception {
		return this.callPAC_IAX_MAP__F_DEL_MAPCABTRATAR(pPCMAPEAD, pPCTABLA, pPNVECES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_DEL_MAPCABTRATAR
	// --START-PAC_IAX_MAP.F_SET_MAPCABTRATAR(PCMAPEAD, PCTABLA, PNVECES, PTSENTEN,
	// PCPARAM, PCPRAGMA)
	private HashMap callPAC_IAX_MAP__F_SET_MAPCABTRATAR(String pPCMAPEAD, java.math.BigDecimal pPCTABLA,
			java.math.BigDecimal pPNVECES, String pPTSENTEN, java.math.BigDecimal pPCPARAM,
			java.math.BigDecimal pPCPRAGMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPCABTRATAR(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPCTABLA", "pPNVECES", "pPTSENTEN", "pPCPARAM", "pPCPRAGMA" },
				new Object[] { pPCMAPEAD, pPCTABLA, pPNVECES, pPTSENTEN, pPCPARAM, pPCPRAGMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPCTABLA);
		cStmt.setObject(4, pPNVECES);
		cStmt.setObject(5, pPTSENTEN);
		cStmt.setObject(6, pPCPARAM);
		cStmt.setObject(7, pPCPRAGMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPCABTRATAR(String pPCMAPEAD, java.math.BigDecimal pPCTABLA,
			java.math.BigDecimal pPNVECES, String pPTSENTEN, java.math.BigDecimal pPCPARAM,
			java.math.BigDecimal pPCPRAGMA) throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPCABTRATAR(pPCMAPEAD, pPCTABLA, pPNVECES, pPTSENTEN, pPCPARAM, pPCPRAGMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_SET_MAPCABTRATAR
	// --START-PAC_IAX_MAP.F_DEL_MAPXML(PCMAPEAD, PTPARE, PNORDFILL, PTTAG)
	private HashMap callPAC_IAX_MAP__F_DEL_MAPXML(String pPCMAPEAD, String pPTPARE, java.math.BigDecimal pPNORDFILL,
			String pPTTAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_DEL_MAPXML(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPTPARE", "pPNORDFILL", "pPTTAG" },
				new Object[] { pPCMAPEAD, pPTPARE, pPNORDFILL, pPTTAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPTPARE);
		cStmt.setObject(4, pPNORDFILL);
		cStmt.setObject(5, pPTTAG);
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

	public HashMap ejecutaPAC_IAX_MAP__F_DEL_MAPXML(String pPCMAPEAD, String pPTPARE, java.math.BigDecimal pPNORDFILL,
			String pPTTAG) throws Exception {
		return this.callPAC_IAX_MAP__F_DEL_MAPXML(pPCMAPEAD, pPTPARE, pPNORDFILL, pPTTAG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_DEL_MAPXML
	// --START-PAC_IAX_MAP.F_SET_MAPXML(PCMAPEAD, PTPARE, PNORDFILL, PTTAG,
	// PCATRIBUTS, PCTABLAFILLS, PNORDEN)
	private HashMap callPAC_IAX_MAP__F_SET_MAPXML(String pPCMAPEAD, String pPTPARE, java.math.BigDecimal pPNORDFILL,
			String pPTTAG, java.math.BigDecimal pPCATRIBUTS, java.math.BigDecimal pPCTABLAFILLS,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPXML(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMAPEAD", "pPTPARE", "pPNORDFILL", "pPTTAG", "pPCATRIBUTS", "pPCTABLAFILLS",
						"pPNORDEN" },
				new Object[] { pPCMAPEAD, pPTPARE, pPNORDFILL, pPTTAG, pPCATRIBUTS, pPCTABLAFILLS, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPTPARE);
		cStmt.setObject(4, pPNORDFILL);
		cStmt.setObject(5, pPTTAG);
		cStmt.setObject(6, pPCATRIBUTS);
		cStmt.setObject(7, pPCTABLAFILLS);
		cStmt.setObject(8, pPNORDEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPXML(String pPCMAPEAD, String pPTPARE, java.math.BigDecimal pPNORDFILL,
			String pPTTAG, java.math.BigDecimal pPCATRIBUTS, java.math.BigDecimal pPCTABLAFILLS,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPXML(pPCMAPEAD, pPTPARE, pPNORDFILL, pPTTAG, pPCATRIBUTS, pPCTABLAFILLS,
				pPNORDEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_SET_MAPXML
	// --START-PAC_IAX_MAP.F_DEL_MAPDETALLE(PCMAPEAD, PNORDEN)
	private HashMap callPAC_IAX_MAP__F_DEL_MAPDETALLE(String pPCMAPEAD, java.math.BigDecimal pPNORDEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_DEL_MAPDETALLE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPNORDEN" }, new Object[] { pPCMAPEAD, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_MAP__F_DEL_MAPDETALLE(String pPCMAPEAD, java.math.BigDecimal pPNORDEN)
			throws Exception {
		return this.callPAC_IAX_MAP__F_DEL_MAPDETALLE(pPCMAPEAD, pPNORDEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_DEL_MAPDETALLE
	// --START-PAC_IAX_MAP.F_SET_MAPDETALLE(PCMAPEAD, PNORDEN, PNPOSICION,
	// PNLONGITUD, PTTAG)
	private HashMap callPAC_IAX_MAP__F_SET_MAPDETALLE(String pPCMAPEAD, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPNPOSICION, java.math.BigDecimal pPNLONGITUD, String pPTTAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPDETALLE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMAPEAD", "pPNORDEN", "pPNPOSICION", "pPNLONGITUD", "pPTTAG" },
				new Object[] { pPCMAPEAD, pPNORDEN, pPNPOSICION, pPNLONGITUD, pPTTAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPNPOSICION);
		cStmt.setObject(5, pPNLONGITUD);
		cStmt.setObject(6, pPTTAG);
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

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPDETALLE(String pPCMAPEAD, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPNPOSICION, java.math.BigDecimal pPNLONGITUD, String pPTTAG) throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPDETALLE(pPCMAPEAD, pPNORDEN, pPNPOSICION, pPNLONGITUD, pPTTAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MAP.F_SET_MAPDETALLE

	// --START-PAC_IAX_MAP.F_DEL_MAPCONDICION(PNCONDICION)
	private HashMap callPAC_IAX_MAP__F_DEL_MAPCONDICION(java.math.BigDecimal pPNCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_DEL_MAPCONDICION(?, ?)}";

		logCall(callQuery, new String[] { "pPNCONDICION" }, new Object[] { pPNCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCONDICION);
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

	public HashMap ejecutaPAC_IAX_MAP__F_DEL_MAPCONDICION(java.math.BigDecimal pPNCONDICION) throws Exception {
		return this.callPAC_IAX_MAP__F_DEL_MAPCONDICION(pPNCONDICION);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_DEL_MAPCONDICION
	// --START-PAC_IAX_MAP.F_DEL_MAPDETTRATAR(PCMAPEAD, PTCONDICION, PCTABLA,
	// PNVECES, PTCAMPO, PNORDEN, PTSETWHERE)
	private HashMap callPAC_IAX_MAP__F_DEL_MAPDETTRATAR(String pPCMAPEAD, String pPTCONDICION,
			java.math.BigDecimal pPCTABLA, java.math.BigDecimal pPNVECES, String pPTCAMPO,
			java.math.BigDecimal pPNORDEN, String pPTSETWHERE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_DEL_MAPDETTRATAR(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMAPEAD", "pPTCONDICION", "pPCTABLA", "pPNVECES", "pPTCAMPO", "pPNORDEN",
						"pPTSETWHERE" },
				new Object[] { pPCMAPEAD, pPTCONDICION, pPCTABLA, pPNVECES, pPTCAMPO, pPNORDEN, pPTSETWHERE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPTCONDICION);
		cStmt.setObject(4, pPCTABLA);
		cStmt.setObject(5, pPNVECES);
		cStmt.setObject(6, pPTCAMPO);
		cStmt.setObject(7, pPNORDEN);
		cStmt.setObject(8, pPTSETWHERE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MAP__F_DEL_MAPDETTRATAR(String pPCMAPEAD, String pPTCONDICION,
			java.math.BigDecimal pPCTABLA, java.math.BigDecimal pPNVECES, String pPTCAMPO,
			java.math.BigDecimal pPNORDEN, String pPTSETWHERE) throws Exception {
		return this.callPAC_IAX_MAP__F_DEL_MAPDETTRATAR(pPCMAPEAD, pPTCONDICION, pPCTABLA, pPNVECES, pPTCAMPO, pPNORDEN,
				pPTSETWHERE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_DEL_MAPDETTRATAR
	// --START-PAC_IAX_MAP.F_DEL_MAPTABLA(PCTABLA)
	private HashMap callPAC_IAX_MAP__F_DEL_MAPTABLA(java.math.BigDecimal pPCTABLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_DEL_MAPTABLA(?, ?)}";

		logCall(callQuery, new String[] { "pPCTABLA" }, new Object[] { pPCTABLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTABLA);
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

	public HashMap ejecutaPAC_IAX_MAP__F_DEL_MAPTABLA(java.math.BigDecimal pPCTABLA) throws Exception {
		return this.callPAC_IAX_MAP__F_DEL_MAPTABLA(pPCTABLA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_DEL_MAPTABLA
	// --START-PAC_IAX_MAP.F_SET_MAPCONDICION(PNCONDICION, PTVALCOND, PNPOSCOND,
	// PNLONGCOND, PNORDCOND, PCTABLA)
	private HashMap callPAC_IAX_MAP__F_SET_MAPCONDICION(java.math.BigDecimal pPNCONDICION, String pPTVALCOND,
			java.math.BigDecimal pPNPOSCOND, java.math.BigDecimal pPNLONGCOND, java.math.BigDecimal pPNORDCOND,
			java.math.BigDecimal pPCTABLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPCONDICION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNCONDICION", "pPTVALCOND", "pPNPOSCOND", "pPNLONGCOND", "pPNORDCOND", "pPCTABLA" },
				new Object[] { pPNCONDICION, pPTVALCOND, pPNPOSCOND, pPNLONGCOND, pPNORDCOND, pPCTABLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCONDICION);
		cStmt.setObject(3, pPTVALCOND);
		cStmt.setObject(4, pPNPOSCOND);
		cStmt.setObject(5, pPNLONGCOND);
		cStmt.setObject(6, pPNORDCOND);
		cStmt.setObject(7, pPCTABLA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PNCONDICION_OUT"
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
			retVal.put("PNCONDICION_OUT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PNCONDICION_OUT", null);
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

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPCONDICION(java.math.BigDecimal pPNCONDICION, String pPTVALCOND,
			java.math.BigDecimal pPNPOSCOND, java.math.BigDecimal pPNLONGCOND, java.math.BigDecimal pPNORDCOND,
			java.math.BigDecimal pPCTABLA) throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPCONDICION(pPNCONDICION, pPTVALCOND, pPNPOSCOND, pPNLONGCOND, pPNORDCOND,
				pPCTABLA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_SET_MAPCONDICION
	// --START-PAC_IAX_MAP.F_SET_MAPDETTRATAR(PCMAPEAD, PTCONDICION, PCTABLA,
	// PNVECES, PTCAMPO, PCTIPCAMPO, PTMASCARA, PNORDEN, PTSETWHERE)
	private HashMap callPAC_IAX_MAP__F_SET_MAPDETTRATAR(String pPCMAPEAD, String pPTCONDICION,
			java.math.BigDecimal pPCTABLA, java.math.BigDecimal pPNVECES, String pPTCAMPO, String pPCTIPCAMPO,
			String pPTMASCARA, java.math.BigDecimal pPNORDEN, String pPTSETWHERE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPDETTRATAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMAPEAD", "pPTCONDICION", "pPCTABLA", "pPNVECES", "pPTCAMPO", "pPCTIPCAMPO",
						"pPTMASCARA", "pPNORDEN", "pPTSETWHERE" },
				new Object[] { pPCMAPEAD, pPTCONDICION, pPCTABLA, pPNVECES, pPTCAMPO, pPCTIPCAMPO, pPTMASCARA, pPNORDEN,
						pPTSETWHERE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPTCONDICION);
		cStmt.setObject(4, pPCTABLA);
		cStmt.setObject(5, pPNVECES);
		cStmt.setObject(6, pPTCAMPO);
		cStmt.setObject(7, pPCTIPCAMPO);
		cStmt.setObject(8, pPTMASCARA);
		cStmt.setObject(9, pPNORDEN);
		cStmt.setObject(10, pPTSETWHERE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPDETTRATAR(String pPCMAPEAD, String pPTCONDICION,
			java.math.BigDecimal pPCTABLA, java.math.BigDecimal pPNVECES, String pPTCAMPO, String pPCTIPCAMPO,
			String pPTMASCARA, java.math.BigDecimal pPNORDEN, String pPTSETWHERE) throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPDETTRATAR(pPCMAPEAD, pPTCONDICION, pPCTABLA, pPNVECES, pPTCAMPO,
				pPCTIPCAMPO, pPTMASCARA, pPNORDEN, pPTSETWHERE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MAP.F_SET_MAPDETTRATAR

	// --START-PAC_IAX_MAP.F_SET_MAPTABLA(PCTABLA, PTFROM, PTDESCRIP)
	private HashMap callPAC_IAX_MAP__F_SET_MAPTABLA(java.math.BigDecimal pPCTABLA, String pPTFROM, String pPTDESCRIP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_SET_MAPTABLA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTABLA", "pPTFROM", "pPTDESCRIP" },
				new Object[] { pPCTABLA, pPTFROM, pPTDESCRIP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTABLA);
		cStmt.setObject(3, pPTFROM);
		cStmt.setObject(4, pPTDESCRIP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCTABLA_OUT"
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
			retVal.put("PCTABLA_OUT", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCTABLA_OUT", null);
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

	public HashMap ejecutaPAC_IAX_MAP__F_SET_MAPTABLA(java.math.BigDecimal pPCTABLA, String pPTFROM, String pPTDESCRIP)
			throws Exception {
		return this.callPAC_IAX_MAP__F_SET_MAPTABLA(pPCTABLA, pPTFROM, pPTDESCRIP);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_SET_MAPTABLA
	// --START-PAC_IAX_MAP.F_GET_UNICO_MAPDETTRATAR(PCMAPEAD, PTCONDICION, PCTABLA,
	// PNVECES, PTCAMPO, PNORDEN, PTSETWHERE)
	private HashMap callPAC_IAX_MAP__F_GET_UNICO_MAPDETTRATAR(String pPCMAPEAD, String pPTCONDICION,
			java.math.BigDecimal pPCTABLA, java.math.BigDecimal pPNVECES, String pPTCAMPO,
			java.math.BigDecimal pPNORDEN, String pPTSETWHERE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_UNICO_MAPDETTRATAR(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMAPEAD", "pPTCONDICION", "pPCTABLA", "pPNVECES", "pPTCAMPO", "pPNORDEN",
						"pPTSETWHERE" },
				new Object[] { pPCMAPEAD, pPTCONDICION, pPCTABLA, pPNVECES, pPTCAMPO, pPNORDEN, pPTSETWHERE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAPEAD);
		cStmt.setObject(3, pPTCONDICION);
		cStmt.setObject(4, pPCTABLA);
		cStmt.setObject(5, pPNVECES);
		cStmt.setObject(6, pPTCAMPO);
		cStmt.setObject(7, pPNORDEN);
		cStmt.setObject(8, pPTSETWHERE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_UNICO_MAPDETTRATAR(String pPCMAPEAD, String pPTCONDICION,
			java.math.BigDecimal pPCTABLA, java.math.BigDecimal pPNVECES, String pPTCAMPO,
			java.math.BigDecimal pPNORDEN, String pPTSETWHERE) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_UNICO_MAPDETTRATAR(pPCMAPEAD, pPTCONDICION, pPCTABLA, pPNVECES, pPTCAMPO,
				pPNORDEN, pPTSETWHERE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_GET_UNICO_MAPDETTRATAR
	// --START-PAC_IAX_MAP.F_GET_UNICO_MAPCONDICION(PNCONDICION)
	private HashMap callPAC_IAX_MAP__F_GET_UNICO_MAPCONDICION(java.math.BigDecimal pPNCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_UNICO_MAPCONDICION(?, ?)}";

		logCall(callQuery, new String[] { "pPNCONDICION" }, new Object[] { pPNCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCONDICION);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_UNICO_MAPCONDICION(java.math.BigDecimal pPNCONDICION) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_UNICO_MAPCONDICION(pPNCONDICION);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MAP.F_GET_UNICO_MAPCONDICION
	// --START-PAC_IAX_MAP.F_GET_UNICO_MAPTABLA(PCTABLA)
	private HashMap callPAC_IAX_MAP__F_GET_UNICO_MAPTABLA(java.math.BigDecimal pPCTABLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MAP.F_GET_UNICO_MAPTABLA(?, ?)}";

		logCall(callQuery, new String[] { "pPCTABLA" }, new Object[] { pPCTABLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTABLA);
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

	public HashMap ejecutaPAC_IAX_MAP__F_GET_UNICO_MAPTABLA(java.math.BigDecimal pPCTABLA) throws Exception {
		return this.callPAC_IAX_MAP__F_GET_UNICO_MAPTABLA(pPCTABLA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MAP.F_GET_UNICO_MAPTABLA

}
