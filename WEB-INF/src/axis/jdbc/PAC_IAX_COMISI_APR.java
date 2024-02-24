
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_COMISI_APR extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COMISI_APR.class);
	private Connection conn = null;

	public PAC_IAX_COMISI_APR(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COMISI_ADQUI.F_OBTENER_COMISIONES(P_SSEGURO)
	private HashMap callPAC_IAX_COMISI_ADQUI__F_OBTENER_COMISIONES(java.math.BigDecimal pP_SSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISI_ADQUI.F_OBTENER_COMISIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO" }, new Object[] { pP_SSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_COMISI_ADQUI__F_OBTENER_COMISIONES(java.math.BigDecimal pP_SSEGURO) throws Exception {
		return this.callPAC_IAX_COMISI_ADQUI__F_OBTENER_COMISIONES(pP_SSEGURO);
	}

	// --END-PAC_IAX_COMISI_ADQUI.F_OBTENER_COMISIONES
	// --START-PAC_IAX_COMISI_ADQUI.F_OBTENER_POLIZAS(P_CAGENTE, P_TAGENTE,
	// P_NPOLIZA, P_NCERTIF, P_DESDE, P_HASTA)
	private HashMap callPAC_IAX_COMISI_ADQUI__F_OBTENER_POLIZAS(java.math.BigDecimal pP_CAGENTE, String pP_TAGENTE,
			java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_NCERTIF, java.sql.Date pP_DESDE,
			java.sql.Date pP_HASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISI_ADQUI.F_OBTENER_POLIZAS(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CAGENTE", "pP_TAGENTE", "pP_NPOLIZA", "pP_NCERTIF", "pP_DESDE", "pP_HASTA" },
				new Object[] { pP_CAGENTE, pP_TAGENTE, pP_NPOLIZA, pP_NCERTIF, pP_DESDE, pP_HASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CAGENTE);
		cStmt.setObject(3, pP_TAGENTE);
		cStmt.setObject(4, pP_NPOLIZA);
		cStmt.setObject(5, pP_NCERTIF);
		cStmt.setObject(6, pP_DESDE);
		cStmt.setObject(7, pP_HASTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_COMISI_ADQUI__F_OBTENER_POLIZAS(java.math.BigDecimal pP_CAGENTE, String pP_TAGENTE,
			java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_NCERTIF, java.sql.Date pP_DESDE,
			java.sql.Date pP_HASTA) throws Exception {
		return this.callPAC_IAX_COMISI_ADQUI__F_OBTENER_POLIZAS(pP_CAGENTE, pP_TAGENTE, pP_NPOLIZA, pP_NCERTIF,
				pP_DESDE, pP_HASTA);
	}

	// --END-PAC_IAX_COMISI_ADQUI.F_OBTENER_POLIZAS
	// --START-PAC_IAX_COMISI_ADQUI.F_OBTENER_TOTAL_COMIS(P_SSEGURO)
	private HashMap callPAC_IAX_COMISI_ADQUI__F_OBTENER_TOTAL_COMIS(java.math.BigDecimal pP_SSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISI_ADQUI.F_OBTENER_TOTAL_COMIS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO" }, new Object[] { pP_SSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "P_NPOLIZA"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "P_FEFECTO"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "P_VTO"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "P_TOTCOM"
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
			retVal.put("P_NPOLIZA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_NPOLIZA", null);
		}
		try {
			retVal.put("P_FEFECTO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_FEFECTO", null);
		}
		try {
			retVal.put("P_VTO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_VTO", null);
		}
		try {
			retVal.put("P_TOTCOM", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_TOTCOM", null);
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

	public HashMap ejecutaPAC_IAX_COMISI_ADQUI__F_OBTENER_TOTAL_COMIS(java.math.BigDecimal pP_SSEGURO)
			throws Exception {
		return this.callPAC_IAX_COMISI_ADQUI__F_OBTENER_TOTAL_COMIS(pP_SSEGURO);
	}

	// --END-PAC_IAX_COMISI_ADQUI.F_OBTENER_TOTAL_COMIS
	// --START-PAC_IAX_COMISI_APR.F_OBTENER_COMISIONES(P_SSEGURO)
	private HashMap callPAC_IAX_COMISI_APR__F_OBTENER_COMISIONES(java.math.BigDecimal pP_SSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISI_APR.F_OBTENER_COMISIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO" }, new Object[] { pP_SSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_COMISI_APR__F_OBTENER_COMISIONES(java.math.BigDecimal pP_SSEGURO) throws Exception {
		return this.callPAC_IAX_COMISI_APR__F_OBTENER_COMISIONES(pP_SSEGURO);
	}

	// --END-PAC_IAX_COMISI_APR.F_OBTENER_COMISIONES
	// --START-PAC_IAX_COMISI_APR.F_OBTENER_POLIZAS(P_CAGENTE, P_TAGENTE, P_NPOLIZA,
	// P_NCERTIF, P_DESDE, P_HASTA)
	private HashMap callPAC_IAX_COMISI_APR__F_OBTENER_POLIZAS(java.math.BigDecimal pP_CAGENTE, String pP_TAGENTE,
			java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_NCERTIF, java.sql.Date pP_DESDE,
			java.sql.Date pP_HASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISI_APR.F_OBTENER_POLIZAS(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CAGENTE", "pP_TAGENTE", "pP_NPOLIZA", "pP_NCERTIF", "pP_DESDE", "pP_HASTA" },
				new Object[] { pP_CAGENTE, pP_TAGENTE, pP_NPOLIZA, pP_NCERTIF, pP_DESDE, pP_HASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CAGENTE);
		cStmt.setObject(3, pP_TAGENTE);
		cStmt.setObject(4, pP_NPOLIZA);
		cStmt.setObject(5, pP_NCERTIF);
		cStmt.setObject(6, pP_DESDE);
		cStmt.setObject(7, pP_HASTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_COMISI_APR__F_OBTENER_POLIZAS(java.math.BigDecimal pP_CAGENTE, String pP_TAGENTE,
			java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_NCERTIF, java.sql.Date pP_DESDE,
			java.sql.Date pP_HASTA) throws Exception {
		return this.callPAC_IAX_COMISI_APR__F_OBTENER_POLIZAS(pP_CAGENTE, pP_TAGENTE, pP_NPOLIZA, pP_NCERTIF, pP_DESDE,
				pP_HASTA);
	}

	// --END-PAC_IAX_COMISI_APR.F_OBTENER_POLIZAS
	// --START-PAC_IAX_COMISI_APR.F_OBTENER_TOTAL_COMIS(P_SSEGURO)
	private HashMap callPAC_IAX_COMISI_APR__F_OBTENER_TOTAL_COMIS(java.math.BigDecimal pP_SSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISI_APR.F_OBTENER_TOTAL_COMIS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO" }, new Object[] { pP_SSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "P_NPOLIZA"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "P_FEFECTO"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "P_VTO"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "P_TOTCOM"
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
			retVal.put("P_NPOLIZA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_NPOLIZA", null);
		}
		try {
			retVal.put("P_FEFECTO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_FEFECTO", null);
		}
		try {
			retVal.put("P_VTO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_VTO", null);
		}
		try {
			retVal.put("P_TOTCOM", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_TOTCOM", null);
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

	public HashMap ejecutaPAC_IAX_COMISI_APR__F_OBTENER_TOTAL_COMIS(java.math.BigDecimal pP_SSEGURO) throws Exception {
		return this.callPAC_IAX_COMISI_APR__F_OBTENER_TOTAL_COMIS(pP_SSEGURO);
	}
	// --END-PAC_IAX_COMISI_APR.F_OBTENER_TOTAL_COMIS

}