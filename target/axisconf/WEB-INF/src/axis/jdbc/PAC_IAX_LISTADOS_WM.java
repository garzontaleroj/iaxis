package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LISTADOS_WM extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTADOS_WM.class);
	private Connection conn = null;

	public PAC_IAX_LISTADOS_WM(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LISTADOS_WM.F_LISTADO_CARTERA(P_FINICAR, P_FFINCAR,
	// P_CAGENTE)
	private HashMap callPAC_IAX_LISTADOS_WM__F_LISTADO_CARTERA(java.sql.Date pP_FINICAR, java.sql.Date pP_FFINCAR,
			java.math.BigDecimal pP_CAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTADOS_WM.F_LISTADO_CARTERA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_FINICAR", "pP_FFINCAR", "pP_CAGENTE" },
				new Object[] { pP_FINICAR, pP_FFINCAR, pP_CAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_FINICAR);
		cStmt.setObject(3, pP_FFINCAR);
		cStmt.setObject(4, pP_CAGENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_LISTADOCARTERA_WM".toUpperCase())); // Valor de "RETURN"
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
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTADOS_WM__F_LISTADO_CARTERA(java.sql.Date pP_FINICAR, java.sql.Date pP_FFINCAR,
			java.math.BigDecimal pP_CAGENTE) throws Exception {
		return new ConversionUtil().convertOracleObjects(
				this.callPAC_IAX_LISTADOS_WM__F_LISTADO_CARTERA(pP_FINICAR, pP_FFINCAR, pP_CAGENTE));
	}

	// --END-PAC_IAX_LISTADOS_WM.F_LISTADO_CARTERA
	// --START-PAC_IAX_LISTADOS_WM.F_LISTADO_POLIZAS(P_FINICAR, P_FFINCAR,
	// P_CAGENTE)
	private HashMap callPAC_IAX_LISTADOS_WM__F_LISTADO_POLIZAS(java.sql.Date pP_FINICAR, java.sql.Date pP_FFINCAR,
			java.math.BigDecimal pP_CAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTADOS_WM.F_LISTADO_POLIZAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_FINICAR", "pP_FFINCAR", "pP_CAGENTE" },
				new Object[] { pP_FINICAR, pP_FFINCAR, pP_CAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_FINICAR);
		cStmt.setObject(3, pP_FFINCAR);
		cStmt.setObject(4, pP_CAGENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_LISTADOPOLIZAS_WM".toUpperCase())); // Valor de "RETURN"
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
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTADOS_WM__F_LISTADO_POLIZAS(java.sql.Date pP_FINICAR, java.sql.Date pP_FFINCAR,
			java.math.BigDecimal pP_CAGENTE) throws Exception {
		return new ConversionUtil().convertOracleObjects(
				this.callPAC_IAX_LISTADOS_WM__F_LISTADO_POLIZAS(pP_FINICAR, pP_FFINCAR, pP_CAGENTE));
	}

	// --END-PAC_IAX_LISTADOS_WM.F_LISTADO_POLIZAS
	// --START-PAC_IAX_LISTADOS_WM.F_LISTADO_SINIESTROS(P_FINICAR, P_FFINCAR,
	// P_CAGENTE)
	private HashMap callPAC_IAX_LISTADOS_WM__F_LISTADO_SINIESTROS(java.sql.Date pP_FINICAR, java.sql.Date pP_FFINCAR,
			java.math.BigDecimal pP_CAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTADOS_WM.F_LISTADO_SINIESTROS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_FINICAR", "pP_FFINCAR", "pP_CAGENTE" },
				new Object[] { pP_FINICAR, pP_FFINCAR, pP_CAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_FINICAR);
		cStmt.setObject(3, pP_FFINCAR);
		cStmt.setObject(4, pP_CAGENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_LISTADOSINIESTROS_WM".toUpperCase())); // Valor de "RETURN"
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
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTADOS_WM__F_LISTADO_SINIESTROS(java.sql.Date pP_FINICAR, java.sql.Date pP_FFINCAR,
			java.math.BigDecimal pP_CAGENTE) throws Exception {
		return new ConversionUtil().convertOracleObjects(
				this.callPAC_IAX_LISTADOS_WM__F_LISTADO_SINIESTROS(pP_FINICAR, pP_FFINCAR, pP_CAGENTE));
	}
	// --END-PAC_IAX_LISTADOS_WM.F_LISTADO_SINIESTROS

}
