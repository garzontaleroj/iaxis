package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_ALM extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ALM.class);
	private Connection conn = null;

	public PAC_IAX_ALM(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ALM.F_GET_ALMCRITERIO(P_CEMPRES)
	private HashMap callPAC_IAX_ALM__F_GET_ALMCRITERIO(java.math.BigDecimal pP_CEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_ALM.F_GET_ALMCRITERIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CEMPRES" }, new Object[] { pP_CEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_RCRITERIO"
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
			retVal.put("P_RCRITERIO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_RCRITERIO", null);
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

	public HashMap ejecutaPAC_IAX_ALM__F_GET_ALMCRITERIO(java.math.BigDecimal pP_CEMPRES) throws Exception {
		return this.callPAC_IAX_ALM__F_GET_ALMCRITERIO(pP_CEMPRES);
	}
	// --END-PAC_IAX_ALM.F_GET_ALMCRITERIO

	// --START-PAC_IAX_ALM.F_GENERA_ALM(P_CEMPRES, P_FCALCUL, P_SPRODUC,
	// P_PINTFUTDEF, P_PCREDIBDEF, P_CRAMO)
	private HashMap callPAC_IAX_ALM__F_GENERA_ALM(java.math.BigDecimal pP_CEMPRES, java.sql.Date pP_FCALCUL,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_PINTFUTDEF, java.math.BigDecimal pP_PCREDIBDEF,
			java.math.BigDecimal pP_CRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ALM.F_GENERA_ALM(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CEMPRES", "pP_FCALCUL", "pP_SPRODUC", "pP_PINTFUTDEF", "pP_PCREDIBDEF", "pP_CRAMO" },
				new Object[] { pP_CEMPRES, pP_FCALCUL, pP_SPRODUC, pP_PINTFUTDEF, pP_PCREDIBDEF, pP_CRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_FCALCUL);
		cStmt.setObject(4, pP_SPRODUC);
		cStmt.setObject(5, pP_PINTFUTDEF);
		cStmt.setObject(6, pP_PCREDIBDEF);
		cStmt.setObject(7, pP_CRAMO);
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

	public HashMap ejecutaPAC_IAX_ALM__F_GENERA_ALM(java.math.BigDecimal pP_CEMPRES, java.sql.Date pP_FCALCUL,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_PINTFUTDEF, java.math.BigDecimal pP_PCREDIBDEF,
			java.math.BigDecimal pP_CRAMO) throws Exception {
		return this.callPAC_IAX_ALM__F_GENERA_ALM(pP_CEMPRES, pP_FCALCUL, pP_SPRODUC, pP_PINTFUTDEF, pP_PCREDIBDEF,
				pP_CRAMO);
	}
	// --END-PAC_IAX_ALM.F_GENERA_ALM

	// --START-PAC_IAX_ALM.F_DEL_ALMCRITERIO(P_CEMPRES, P_NORDEN)
	private HashMap callPAC_IAX_ALM__F_DEL_ALMCRITERIO(java.math.BigDecimal pP_CEMPRES, java.math.BigDecimal pP_NORDEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ALM.F_DEL_ALMCRITERIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CEMPRES", "pP_NORDEN" }, new Object[] { pP_CEMPRES, pP_NORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_NORDEN);
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

	public HashMap ejecutaPAC_IAX_ALM__F_DEL_ALMCRITERIO(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_NORDEN) throws Exception {
		return this.callPAC_IAX_ALM__F_DEL_ALMCRITERIO(pP_CEMPRES, pP_NORDEN);
	}
	// --END-PAC_IAX_ALM.F_DEL_ALMCRITERIO

	// --START-PAC_IAX_ALM.F_SET_ALMCRITERIO(P_CEMPRES, P_TCRITERIO, P_NORDEN,
	// P_PCREDIBI, P_PINTFUT)
	private HashMap callPAC_IAX_ALM__F_SET_ALMCRITERIO(java.math.BigDecimal pP_CEMPRES, String pP_TCRITERIO,
			java.math.BigDecimal pP_NORDEN, java.math.BigDecimal pP_PCREDIBI, java.math.BigDecimal pP_PINTFUT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ALM.F_SET_ALMCRITERIO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CEMPRES", "pP_TCRITERIO", "pP_NORDEN", "pP_PCREDIBI", "pP_PINTFUT" },
				new Object[] { pP_CEMPRES, pP_TCRITERIO, pP_NORDEN, pP_PCREDIBI, pP_PINTFUT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_TCRITERIO);
		cStmt.setObject(4, pP_NORDEN);
		cStmt.setObject(5, pP_PCREDIBI);
		cStmt.setObject(6, pP_PINTFUT);
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

	public HashMap ejecutaPAC_IAX_ALM__F_SET_ALMCRITERIO(java.math.BigDecimal pP_CEMPRES, String pP_TCRITERIO,
			java.math.BigDecimal pP_NORDEN, java.math.BigDecimal pP_PCREDIBI, java.math.BigDecimal pP_PINTFUT)
			throws Exception {
		return this.callPAC_IAX_ALM__F_SET_ALMCRITERIO(pP_CEMPRES, pP_TCRITERIO, pP_NORDEN, pP_PCREDIBI, pP_PINTFUT);
	}
	// --END-PAC_IAX_ALM.F_SET_ALMCRITERIO

	// --START-PAC_IAX_ALM.F_GET_ALMDETALLE(P_CEMPRES, P_SPRODUC, P_NPOLIZA,
	// P_NCERTIF, P_FVALORA, P_CRAMO)
	private HashMap callPAC_IAX_ALM__F_GET_ALMDETALLE(java.math.BigDecimal pP_CEMPRES, java.math.BigDecimal pP_SPRODUC,
			java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_NCERTIF, java.sql.Date pP_FVALORA,
			java.math.BigDecimal pP_CRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ALM.F_GET_ALMDETALLE(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CEMPRES", "pP_SPRODUC", "pP_NPOLIZA", "pP_NCERTIF", "pP_FVALORA", "pP_CRAMO" },
				new Object[] { pP_CEMPRES, pP_SPRODUC, pP_NPOLIZA, pP_NCERTIF, pP_FVALORA, pP_CRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_SPRODUC);
		cStmt.setObject(4, pP_NPOLIZA);
		cStmt.setObject(5, pP_NCERTIF);
		cStmt.setObject(6, pP_FVALORA);
		cStmt.setObject(7, pP_CRAMO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_RDETALLE"
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
			retVal.put("P_RDETALLE", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_RDETALLE", null);
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

	public HashMap ejecutaPAC_IAX_ALM__F_GET_ALMDETALLE(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_NCERTIF,
			java.sql.Date pP_FVALORA, java.math.BigDecimal pP_CRAMO) throws Exception {
		return this.callPAC_IAX_ALM__F_GET_ALMDETALLE(pP_CEMPRES, pP_SPRODUC, pP_NPOLIZA, pP_NCERTIF, pP_FVALORA,
				pP_CRAMO);
	}
	// --END-PAC_IAX_ALM.F_GET_ALMDETALLE

	// --START-PAC_IAX_ALM.F_INFORME(P_TCARTERA, P_SPRODUC, P_NAGRUPA, P_NTIPO,
	// P_CEMPRES, P_CRAMO)
	private HashMap callPAC_IAX_ALM__F_INFORME(String pP_TCARTERA, java.math.BigDecimal pP_SPRODUC,
			java.math.BigDecimal pP_NAGRUPA, java.math.BigDecimal pP_NTIPO, java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_CRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ALM.F_INFORME(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_TCARTERA", "pP_SPRODUC", "pP_NAGRUPA", "pP_NTIPO", "pP_CEMPRES", "pP_CRAMO" },
				new Object[] { pP_TCARTERA, pP_SPRODUC, pP_NAGRUPA, pP_NTIPO, pP_CEMPRES, pP_CRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TCARTERA);
		cStmt.setObject(3, pP_SPRODUC);
		cStmt.setObject(4, pP_NAGRUPA);
		cStmt.setObject(5, pP_NTIPO);
		cStmt.setObject(6, pP_CEMPRES);
		cStmt.setObject(7, pP_CRAMO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "P_NOMFICHERO"
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
			retVal.put("P_NOMFICHERO", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_NOMFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_ALM__F_INFORME(String pP_TCARTERA, java.math.BigDecimal pP_SPRODUC,
			java.math.BigDecimal pP_NAGRUPA, java.math.BigDecimal pP_NTIPO, java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_CRAMO) throws Exception {
		return this.callPAC_IAX_ALM__F_INFORME(pP_TCARTERA, pP_SPRODUC, pP_NAGRUPA, pP_NTIPO, pP_CEMPRES, pP_CRAMO);
	}
	// --END-PAC_IAX_ALM.F_INFORME

}
