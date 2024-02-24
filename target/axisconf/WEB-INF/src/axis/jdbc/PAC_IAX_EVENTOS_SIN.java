package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_EVENTOS_SIN extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_EVENTOS_SIN.class);
	private Connection conn = null;

	public PAC_IAX_EVENTOS_SIN(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_EVENTOS_SIN.F_DEL_EVENTO(PCEVENTO)
	private HashMap callPAC_IAX_EVENTOS_SIN__F_DEL_EVENTO(String pPCEVENTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_EVENTOS_SIN.F_DEL_EVENTO(?, ?)}";

		logCall(callQuery, new String[] { "pPCEVENTO" }, new Object[] { pPCEVENTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEVENTO);
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

	public HashMap ejecutaPAC_IAX_EVENTOS_SIN__F_DEL_EVENTO(String pPCEVENTO) throws Exception {
		return this.callPAC_IAX_EVENTOS_SIN__F_DEL_EVENTO(pPCEVENTO);
	}

	// --END-PAC_IAX_EVENTOS_SIN.F_DEL_EVENTO
	// --START-PAC_IAX_EVENTOS_SIN.F_GET_EVENTO(PCEVENTO)
	private HashMap callPAC_IAX_EVENTOS_SIN__F_GET_EVENTO(String pPCEVENTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_EVENTOS_SIN.F_GET_EVENTO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEVENTO" }, new Object[] { pPCEVENTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEVENTO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PCEVENTO_OUT"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PFINIEVE"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "PFFINEVE"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PDESEVENTOS"
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
			retVal.put("PCEVENTO_OUT", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCEVENTO_OUT", null);
		}
		try {
			retVal.put("PFINIEVE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFINIEVE", null);
		}
		try {
			retVal.put("PFFINEVE", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFFINEVE", null);
		}
		try {
			retVal.put("PDESEVENTOS", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PDESEVENTOS", null);
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

	public HashMap ejecutaPAC_IAX_EVENTOS_SIN__F_GET_EVENTO(String pPCEVENTO) throws Exception {
		return this.callPAC_IAX_EVENTOS_SIN__F_GET_EVENTO(pPCEVENTO);
	}

	// --END-PAC_IAX_EVENTOS_SIN.F_GET_EVENTO
	// --START-PAC_IAX_EVENTOS_SIN.F_GET_EVENTOS(PCEVENTO, PTEVENTO, PFINICIO,
	// PFFINAL)
	private HashMap callPAC_IAX_EVENTOS_SIN__F_GET_EVENTOS(String pPCEVENTO, String pPTEVENTO, java.sql.Date pPFINICIO,
			java.sql.Date pPFFINAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_EVENTOS_SIN.F_GET_EVENTOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEVENTO", "pPTEVENTO", "pPFINICIO", "pPFFINAL" },
				new Object[] { pPCEVENTO, pPTEVENTO, pPFINICIO, pPFFINAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEVENTO);
		cStmt.setObject(3, pPTEVENTO);
		cStmt.setObject(4, pPFINICIO);
		cStmt.setObject(5, pPFFINAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PEVENTOS"
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
			retVal.put("PEVENTOS", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PEVENTOS", null);
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

	public HashMap ejecutaPAC_IAX_EVENTOS_SIN__F_GET_EVENTOS(String pPCEVENTO, String pPTEVENTO,
			java.sql.Date pPFINICIO, java.sql.Date pPFFINAL) throws Exception {
		return this.callPAC_IAX_EVENTOS_SIN__F_GET_EVENTOS(pPCEVENTO, pPTEVENTO, pPFINICIO, pPFFINAL);
	}

	// --END-PAC_IAX_EVENTOS_SIN.F_GET_EVENTOS
	// --START-PAC_IAX_EVENTOS_SIN.F_SET_CODEVENTO(PCEVENTO, PFINIEVE, PFFINEVE)
	private HashMap callPAC_IAX_EVENTOS_SIN__F_SET_CODEVENTO(String pPCEVENTO, java.sql.Date pPFINIEVE,
			java.sql.Date pPFFINEVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_EVENTOS_SIN.F_SET_CODEVENTO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEVENTO", "pPFINIEVE", "pPFFINEVE" },
				new Object[] { pPCEVENTO, pPFINIEVE, pPFFINEVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEVENTO);
		cStmt.setObject(3, pPFINIEVE);
		cStmt.setObject(4, pPFFINEVE);
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

	public HashMap ejecutaPAC_IAX_EVENTOS_SIN__F_SET_CODEVENTO(String pPCEVENTO, java.sql.Date pPFINIEVE,
			java.sql.Date pPFFINEVE) throws Exception {
		return this.callPAC_IAX_EVENTOS_SIN__F_SET_CODEVENTO(pPCEVENTO, pPFINIEVE, pPFFINEVE);
	}

	// --END-PAC_IAX_EVENTOS_SIN.F_SET_CODEVENTO
	// --START-PAC_IAX_EVENTOS_SIN.F_SET_DESEVENTO(PCEVENTO, PTTITEVE, PTEVENTO,
	// PCIDIOMA)
	private HashMap callPAC_IAX_EVENTOS_SIN__F_SET_DESEVENTO(String pPCEVENTO, String pPTTITEVE, String pPTEVENTO,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_EVENTOS_SIN.F_SET_DESEVENTO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEVENTO", "pPTTITEVE", "pPTEVENTO", "pPCIDIOMA" },
				new Object[] { pPCEVENTO, pPTTITEVE, pPTEVENTO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEVENTO);
		cStmt.setObject(3, pPTTITEVE);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_EVENTOS_SIN__F_SET_DESEVENTO(String pPCEVENTO, String pPTTITEVE, String pPTEVENTO,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_EVENTOS_SIN__F_SET_DESEVENTO(pPCEVENTO, pPTTITEVE, pPTEVENTO, pPCIDIOMA);
	}
	// --END-PAC_IAX_EVENTOS_SIN.F_SET_DESEVENTO

}
