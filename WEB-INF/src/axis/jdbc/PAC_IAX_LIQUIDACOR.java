package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LIQUIDACOR extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LIQUIDA.class);
	private Connection conn = null;

	public PAC_IAX_LIQUIDACOR(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LIQUIDACOR.F_PROPUESTA_FECHAINICIO(P_CCOMPANI, P_MES, P_ANYO)
	private HashMap callPAC_IAX_LIQUIDACOR__F_PROPUESTA_FECHAINICIO(java.math.BigDecimal pP_CCOMPANI,
			java.math.BigDecimal pP_MES, java.math.BigDecimal pP_ANYO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_PROPUESTA_FECHAINICIO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CCOMPANI", "pP_MES", "pP_ANYO" },
				new Object[] { pP_CCOMPANI, pP_MES, pP_ANYO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CCOMPANI);
		cStmt.setObject(3, pP_MES);
		cStmt.setObject(4, pP_ANYO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "P_FINILIQ"
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
			retVal.put("P_FINILIQ", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_FINILIQ", null);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_PROPUESTA_FECHAINICIO(java.math.BigDecimal pP_CCOMPANI,
			java.math.BigDecimal pP_MES, java.math.BigDecimal pP_ANYO) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_PROPUESTA_FECHAINICIO(pP_CCOMPANI, pP_MES, pP_ANYO);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_PROPUESTA_FECHAINICIO

	// --START-PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA(P_CEMPRES, P_SPRODUC, P_SPROLIQ,
	// P_NMES, P_ANYO, P_CESTADO, P_NPOLIZA, P_CPOLCIA, P_NRECIBO, P_CRECCIA,
	// P_CCOMPANI, P_CAGENTE, P_FEMIINI, P_FEMIFIN, P_FEFEINI, P_FEFEFIN, P_FCOBINI,
	// P_FCOBFIN)
	private HashMap callPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_SPROLIQ, java.math.BigDecimal pP_NMES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CESTADO, java.math.BigDecimal pP_NPOLIZA,
			String pP_CPOLCIA, java.math.BigDecimal pP_NRECIBO, String pP_CRECCIA, java.math.BigDecimal pP_CCOMPANI,
			java.math.BigDecimal pP_CAGENTE, java.sql.Date pP_FEMIINI, java.sql.Date pP_FEMIFIN,
			java.sql.Date pP_FEFEINI, java.sql.Date pP_FEFEFIN, java.sql.Date pP_FCOBINI, java.sql.Date pP_FCOBFIN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CEMPRES", "pP_SPRODUC", "pP_SPROLIQ", "pP_NMES", "pP_ANYO", "pP_CESTADO",
						"pP_NPOLIZA", "pP_CPOLCIA", "pP_NRECIBO", "pP_CRECCIA", "pP_CCOMPANI", "pP_CAGENTE",
						"pP_FEMIINI", "pP_FEMIFIN", "pP_FEFEINI", "pP_FEFEFIN", "pP_FCOBINI", "pP_FCOBFIN" },
				new Object[] { pP_CEMPRES, pP_SPRODUC, pP_SPROLIQ, pP_NMES, pP_ANYO, pP_CESTADO, pP_NPOLIZA, pP_CPOLCIA,
						pP_NRECIBO, pP_CRECCIA, pP_CCOMPANI, pP_CAGENTE, pP_FEMIINI, pP_FEMIFIN, pP_FEFEINI, pP_FEFEFIN,
						pP_FCOBINI, pP_FCOBFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_SPRODUC);
		cStmt.setObject(4, pP_SPROLIQ);
		cStmt.setObject(5, pP_NMES);
		cStmt.setObject(6, pP_ANYO);
		cStmt.setObject(7, pP_CESTADO);
		cStmt.setObject(8, pP_NPOLIZA);
		cStmt.setObject(9, pP_CPOLCIA);
		cStmt.setObject(10, pP_NRECIBO);
		cStmt.setObject(11, pP_CRECCIA);
		cStmt.setObject(12, pP_CCOMPANI);
		cStmt.setObject(13, pP_CAGENTE);
		cStmt.setObject(14, pP_FEMIINI);
		cStmt.setObject(15, pP_FEMIFIN);
		cStmt.setObject(16, pP_FEFEINI);
		cStmt.setObject(17, pP_FEFEFIN);
		cStmt.setObject(18, pP_FCOBINI);
		cStmt.setObject(19, pP_FCOBFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(20, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_LIQUIDACION".toUpperCase())); // Valor de "PT_LIQUIDA"
		cStmt.registerOutParameter(21, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PT_LIQUIDA", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("PT_LIQUIDA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(21));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_SPROLIQ, java.math.BigDecimal pP_NMES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CESTADO, java.math.BigDecimal pP_NPOLIZA,
			String pP_CPOLCIA, java.math.BigDecimal pP_NRECIBO, String pP_CRECCIA, java.math.BigDecimal pP_CCOMPANI,
			java.math.BigDecimal pP_CAGENTE, java.sql.Date pP_FEMIINI, java.sql.Date pP_FEMIFIN,
			java.sql.Date pP_FEFEINI, java.sql.Date pP_FEFEFIN, java.sql.Date pP_FCOBINI, java.sql.Date pP_FCOBFIN)
			throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA(pP_CEMPRES, pP_SPRODUC, pP_SPROLIQ, pP_NMES, pP_ANYO,
				pP_CESTADO, pP_NPOLIZA, pP_CPOLCIA, pP_NRECIBO, pP_CRECCIA, pP_CCOMPANI, pP_CAGENTE, pP_FEMIINI,
				pP_FEMIFIN, pP_FEFEINI, pP_FEFEFIN, pP_FCOBINI, pP_FCOBFIN);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA

	// --START-PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA_CAB(P_CEMPRES, P_SPRODUC, P_SPROLIQ,
	// P_NMES, P_ANYO, P_CESTADO, P_NPOLIZA, P_CPOLCIA, P_NRECIBO, P_CRECCIA,
	// P_CCOMPANI, P_CAGENTE, P_FEMIINI, P_FEMIFIN, P_FEFEINI, P_FEFEFIN, P_FCOBINI,
	// P_FCOBFIN)
	private HashMap callPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_CAB(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_SPROLIQ, java.math.BigDecimal pP_NMES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CESTADO, java.math.BigDecimal pP_NPOLIZA,
			String pP_CPOLCIA, java.math.BigDecimal pP_NRECIBO, String pP_CRECCIA, java.math.BigDecimal pP_CCOMPANI,
			java.math.BigDecimal pP_CAGENTE, java.sql.Date pP_FEMIINI, java.sql.Date pP_FEMIFIN,
			java.sql.Date pP_FEFEINI, java.sql.Date pP_FEFEFIN, java.sql.Date pP_FCOBINI, java.sql.Date pP_FCOBFIN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA_CAB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CEMPRES", "pP_SPRODUC", "pP_SPROLIQ", "pP_NMES", "pP_ANYO", "pP_CESTADO",
						"pP_NPOLIZA", "pP_CPOLCIA", "pP_NRECIBO", "pP_CRECCIA", "pP_CCOMPANI", "pP_CAGENTE",
						"pP_FEMIINI", "pP_FEMIFIN", "pP_FEFEINI", "pP_FEFEFIN", "pP_FCOBINI", "pP_FCOBFIN" },
				new Object[] { pP_CEMPRES, pP_SPRODUC, pP_SPROLIQ, pP_NMES, pP_ANYO, pP_CESTADO, pP_NPOLIZA, pP_CPOLCIA,
						pP_NRECIBO, pP_CRECCIA, pP_CCOMPANI, pP_CAGENTE, pP_FEMIINI, pP_FEMIFIN, pP_FEFEINI, pP_FEFEFIN,
						pP_FCOBINI, pP_FCOBFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_SPRODUC);
		cStmt.setObject(4, pP_SPROLIQ);
		cStmt.setObject(5, pP_NMES);
		cStmt.setObject(6, pP_ANYO);
		cStmt.setObject(7, pP_CESTADO);
		cStmt.setObject(8, pP_NPOLIZA);
		cStmt.setObject(9, pP_CPOLCIA);
		cStmt.setObject(10, pP_NRECIBO);
		cStmt.setObject(11, pP_CRECCIA);
		cStmt.setObject(12, pP_CCOMPANI);
		cStmt.setObject(13, pP_CAGENTE);
		cStmt.setObject(14, pP_FEMIINI);
		cStmt.setObject(15, pP_FEMIFIN);
		cStmt.setObject(16, pP_FEFEINI);
		cStmt.setObject(17, pP_FEFEFIN);
		cStmt.setObject(18, pP_FCOBINI);
		cStmt.setObject(19, pP_FCOBFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(20, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_LIQUIDACION".toUpperCase())); // Valor de "PT_LIQUIDA"
		cStmt.registerOutParameter(21, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PT_LIQUIDA", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("PT_LIQUIDA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(21));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_CAB(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_SPROLIQ, java.math.BigDecimal pP_NMES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CESTADO, java.math.BigDecimal pP_NPOLIZA,
			String pP_CPOLCIA, java.math.BigDecimal pP_NRECIBO, String pP_CRECCIA, java.math.BigDecimal pP_CCOMPANI,
			java.math.BigDecimal pP_CAGENTE, java.sql.Date pP_FEMIINI, java.sql.Date pP_FEMIFIN,
			java.sql.Date pP_FEFEINI, java.sql.Date pP_FEFEFIN, java.sql.Date pP_FCOBINI, java.sql.Date pP_FCOBFIN)
			throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_CAB(pP_CEMPRES, pP_SPRODUC, pP_SPROLIQ, pP_NMES, pP_ANYO,
				pP_CESTADO, pP_NPOLIZA, pP_CPOLCIA, pP_NRECIBO, pP_CRECCIA, pP_CCOMPANI, pP_CAGENTE, pP_FEMIINI,
				pP_FEMIFIN, pP_FEFEINI, pP_FEFEFIN, pP_FCOBINI, pP_FCOBFIN);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA_CAB

	// --START-PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA_OB(P_SPROLIQ)
	private HashMap callPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_OB(java.math.BigDecimal pP_SPROLIQ) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA_OB(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROLIQ" }, new Object[] { pP_SPROLIQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROLIQ);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_LIQUIDACION".toUpperCase())); // Valor de "POB_LIQUIDA"
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
			retVal.put("POB_LIQUIDA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("POB_LIQUIDA", null);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_OB(java.math.BigDecimal pP_SPROLIQ) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_OB(pP_SPROLIQ);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_GET_LIQUIDA_OB

	// --START-PAC_IAX_LIQUIDACOR.F_GET_LSTLIQUIDA_OB()
	private HashMap callPAC_IAX_LIQUIDACOR__F_GET_LSTLIQUIDA_OB() throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_GET_LSTLIQUIDA_OB(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_LIQUIDACION".toUpperCase())); // Valor de "POB_LIQUIDA"
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
			retVal.put("POB_LIQUIDA", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("POB_LIQUIDA", null);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_GET_LSTLIQUIDA_OB() throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_GET_LSTLIQUIDA_OB();
	}
	// --END-PAC_IAX_LIQUIDACOR.F_GET_LSTLIQUIDA_OB

	// --START-PAC_IAX_LIQUIDACOR.F_INICIALIZA_LIQUIDACION(P_MES, P_ANYO,
	// P_CCOMPANI, P_FINILIQ, P_FFINLIQ, P_IMPORTE, P_TLIQUIDA)
	private HashMap callPAC_IAX_LIQUIDACOR__F_INICIALIZA_LIQUIDACION(java.math.BigDecimal pP_MES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CCOMPANI, java.sql.Date pP_FINILIQ,
			java.sql.Date pP_FFINLIQ, java.math.BigDecimal pP_IMPORTE, String pP_TLIQUIDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_INICIALIZA_LIQUIDACION(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_MES", "pP_ANYO", "pP_CCOMPANI", "pP_FINILIQ", "pP_FFINLIQ", "pP_IMPORTE",
						"pP_TLIQUIDA" },
				new Object[] { pP_MES, pP_ANYO, pP_CCOMPANI, pP_FINILIQ, pP_FFINLIQ, pP_IMPORTE, pP_TLIQUIDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_MES);
		cStmt.setObject(3, pP_ANYO);
		cStmt.setObject(4, pP_CCOMPANI);
		cStmt.setObject(5, pP_FINILIQ);
		cStmt.setObject(6, pP_FFINLIQ);
		cStmt.setObject(7, pP_IMPORTE);
		cStmt.setObject(8, pP_TLIQUIDA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "P_SPROCES"
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
			retVal.put("P_SPROCES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("P_SPROCES", null);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_INICIALIZA_LIQUIDACION(java.math.BigDecimal pP_MES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CCOMPANI, java.sql.Date pP_FINILIQ,
			java.sql.Date pP_FFINLIQ, java.math.BigDecimal pP_IMPORTE, String pP_TLIQUIDA) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_INICIALIZA_LIQUIDACION(pP_MES, pP_ANYO, pP_CCOMPANI, pP_FINILIQ,
				pP_FFINLIQ, pP_IMPORTE, pP_TLIQUIDA);
	}

	// --END-PAC_IAX_LIQUIDACOR.F_INICIALIZA_LIQUIDACION
	// --START-PAC_IAX_LIQUIDACOR.F_MODIFICA_LIQUIDACION(P_MES, P_ANYO, P_CCOMPANI,
	// P_FINILIQ, P_FFINLIQ, P_IMPORTE, P_TLIQUIDA, P_SPROCES)
	private HashMap callPAC_IAX_LIQUIDACOR__F_MODIFICA_LIQUIDACION(java.math.BigDecimal pP_MES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CCOMPANI, java.sql.Date pP_FINILIQ,
			java.sql.Date pP_FFINLIQ, java.math.BigDecimal pP_IMPORTE, String pP_TLIQUIDA,
			java.math.BigDecimal pP_SPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_MODIFICA_LIQUIDACION(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_MES", "pP_ANYO", "pP_CCOMPANI", "pP_FINILIQ", "pP_FFINLIQ", "pP_IMPORTE",
						"pP_TLIQUIDA", "pP_SPROCES" },
				new Object[] { pP_MES, pP_ANYO, pP_CCOMPANI, pP_FINILIQ, pP_FFINLIQ, pP_IMPORTE, pP_TLIQUIDA,
						pP_SPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_MES);
		cStmt.setObject(3, pP_ANYO);
		cStmt.setObject(4, pP_CCOMPANI);
		cStmt.setObject(5, pP_FINILIQ);
		cStmt.setObject(6, pP_FFINLIQ);
		cStmt.setObject(7, pP_IMPORTE);
		cStmt.setObject(8, pP_TLIQUIDA);
		cStmt.setObject(9, pP_SPROCES);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_MODIFICA_LIQUIDACION(java.math.BigDecimal pP_MES,
			java.math.BigDecimal pP_ANYO, java.math.BigDecimal pP_CCOMPANI, java.sql.Date pP_FINILIQ,
			java.sql.Date pP_FFINLIQ, java.math.BigDecimal pP_IMPORTE, String pP_TLIQUIDA,
			java.math.BigDecimal pP_SPROCES) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_MODIFICA_LIQUIDACION(pP_MES, pP_ANYO, pP_CCOMPANI, pP_FINILIQ, pP_FFINLIQ,
				pP_IMPORTE, pP_TLIQUIDA, pP_SPROCES);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_MODIFICA_LIQUIDACION

	// --START-PAC_IAX_LIQUIDACOR.F_SET_RECLIQUI(P_SPROLIQ)
	private HashMap callPAC_IAX_LIQUIDACOR__F_SET_RECLIQUI(java.math.BigDecimal pP_SPROLIQ) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_SET_RECLIQUI(?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROLIQ" }, new Object[] { pP_SPROLIQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROLIQ);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_SET_RECLIQUI(java.math.BigDecimal pP_SPROLIQ) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_SET_RECLIQUI(pP_SPROLIQ);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_SET_RECLIQUI

	// --START-PAC_IAX_LIQUIDACOR.F_SETOBJETORECLIQUI(P_NRECIBO, P_SPROLIQ, P_SELEC,
	// P_SIGNO, P_MODIF)
	private HashMap callPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUI(String pP_NRECIBO, java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_SELEC, java.math.BigDecimal pP_SIGNO, java.math.BigDecimal pP_MODIF)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_SETOBJETORECLIQUI(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NRECIBO", "pP_SPROLIQ", "pP_SELEC", "pP_SIGNO", "pP_MODIF" },
				new Object[] { pP_NRECIBO, pP_SPROLIQ, pP_SELEC, pP_SIGNO, pP_MODIF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NRECIBO);
		cStmt.setObject(3, pP_SPROLIQ);
		cStmt.setObject(4, pP_SELEC);
		cStmt.setObject(5, pP_SIGNO);
		cStmt.setObject(6, pP_MODIF);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUI(String pP_NRECIBO, java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_SELEC, java.math.BigDecimal pP_SIGNO, java.math.BigDecimal pP_MODIF)
			throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUI(pP_NRECIBO, pP_SPROLIQ, pP_SELEC, pP_SIGNO, pP_MODIF);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_SETOBJETORECLIQUI

	// --START-PAC_IAX_LIQUIDACOR.F_SET_MOVLIQUI(P_SPROLIQ, P_CESTLIQ)
	private HashMap callPAC_IAX_LIQUIDACOR__F_SET_MOVLIQUI(java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_CESTLIQ) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_SET_MOVLIQUI(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROLIQ", "pP_CESTLIQ" }, new Object[] { pP_SPROLIQ, pP_CESTLIQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROLIQ);
		cStmt.setObject(3, pP_CESTLIQ);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_SET_MOVLIQUI(java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_CESTLIQ) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_SET_MOVLIQUI(pP_SPROLIQ, pP_CESTLIQ);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_SET_MOVLIQUI

	// --START-PAC_IAX_LIQUIDACOR.F_GET_RECIBOS_PROPUESTOS(P_SPROLIQ, P_NRECIBO,
	// P_CCOMPANI, P_CAGENTE, P_CMONSEG, P_CMONLIQ, P_CGESCOB, P_CRAMO, P_SPRODUC,
	// P_FEFECTOINI, P_FEFECTOFIN)
	private HashMap callPAC_IAX_LIQUIDACOR__F_GET_RECIBOS_PROPUESTOS(java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_NRECIBO, java.math.BigDecimal pP_CCOMPANI, java.math.BigDecimal pP_CAGENTE,
			String pP_CMONSEG, String pP_CMONLIQ, java.math.BigDecimal pP_CGESCOB, java.math.BigDecimal pP_CRAMO,
			String pP_SPRODUC, java.sql.Date pP_FEFECTOINI, java.sql.Date pP_FEFECTOFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_GET_RECIBOS_PROPUESTOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SPROLIQ", "pP_NRECIBO", "pP_CCOMPANI", "pP_CAGENTE", "pP_CMONSEG", "pP_CMONLIQ",
						"pP_CGESCOB", "pP_CRAMO", "pP_SPRODUC", "pP_FEFECTOINI", "pP_FEFECTOFIN" },
				new Object[] { pP_SPROLIQ, pP_NRECIBO, pP_CCOMPANI, pP_CAGENTE, pP_CMONSEG, pP_CMONLIQ, pP_CGESCOB,
						pP_CRAMO, pP_SPRODUC, pP_FEFECTOINI, pP_FEFECTOFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROLIQ);
		cStmt.setObject(3, pP_NRECIBO);
		cStmt.setObject(4, pP_CCOMPANI);
		cStmt.setObject(5, pP_CAGENTE);
		cStmt.setObject(6, pP_CMONSEG);
		cStmt.setObject(7, pP_CMONLIQ);
		cStmt.setObject(8, pP_CGESCOB);
		cStmt.setObject(9, pP_CRAMO);
		cStmt.setObject(10, pP_SPRODUC);
		cStmt.setObject(11, pP_FEFECTOINI);
		cStmt.setObject(12, pP_FEFECTOFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_LIQUIDA_REC".toUpperCase())); // Valor de "PT_RECLIQUIDA"
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
			retVal.put("PT_RECLIQUIDA", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PT_RECLIQUIDA", null);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_GET_RECIBOS_PROPUESTOS(java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_NRECIBO, java.math.BigDecimal pP_CCOMPANI, java.math.BigDecimal pP_CAGENTE,
			String pP_CMONSEG, String pP_CMONLIQ, java.math.BigDecimal pP_CGESCOB, java.math.BigDecimal pP_CRAMO,
			String pP_SPRODUC, java.sql.Date pP_FEFECTOINI, java.sql.Date pP_FEFECTOFIN) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_GET_RECIBOS_PROPUESTOS(pP_SPROLIQ, pP_NRECIBO, pP_CCOMPANI, pP_CAGENTE,
				pP_CMONSEG, pP_CMONLIQ, pP_CGESCOB, pP_CRAMO, pP_SPRODUC, pP_FEFECTOINI, pP_FEFECTOFIN);
	}

	// --END-PAC_IAX_LIQUIDACOR.F_GET_RECIBOS_PROPUESTOS
	// --START-PAC_IAX_LIQUIDACOR.F_SETOBJETORECLIQUIALL(P_SPROLIQ, P_SELEC)
	private HashMap callPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUIALL(java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_SELEC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_SETOBJETORECLIQUIALL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROLIQ", "pP_SELEC" }, new Object[] { pP_SPROLIQ, pP_SELEC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROLIQ);
		cStmt.setObject(3, pP_SELEC);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUIALL(java.math.BigDecimal pP_SPROLIQ,
			java.math.BigDecimal pP_SELEC) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUIALL(pP_SPROLIQ, pP_SELEC);
	}

	// --END-PAC_IAX_LIQUIDACOR.F_SETOBJETORECLIQUIALL
	// --START-PAC_IAX_LIQUIDACOR.F_GET_LSTLIQUIDA_REC(P_NRECIBO)
	private HashMap callPAC_IAX_LIQUIDACOR__F_GET_LSTLIQUIDA_REC(java.math.BigDecimal pP_NRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACOR.F_GET_LSTLIQUIDA_REC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NRECIBO" }, new Object[] { pP_NRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_LIQUIDAREC"
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
			retVal.put("P_LIQUIDAREC", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_LIQUIDAREC", null);
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

	public HashMap ejecutaPAC_IAX_LIQUIDACOR__F_GET_LSTLIQUIDA_REC(java.math.BigDecimal pP_NRECIBO) throws Exception {
		return this.callPAC_IAX_LIQUIDACOR__F_GET_LSTLIQUIDA_REC(pP_NRECIBO);
	}
	// --END-PAC_IAX_LIQUIDACOR.F_GET_LSTLIQUIDA_REC

}
