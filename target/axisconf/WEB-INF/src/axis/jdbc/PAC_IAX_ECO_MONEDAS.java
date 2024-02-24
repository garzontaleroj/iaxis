package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_ECO_MONEDAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ECO_MONEDAS.class);
	private Connection conn = null;

	public PAC_IAX_ECO_MONEDAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ECO_MONEDAS.F_OBTENER_CMONEDA(PMONEDA)

	private HashMap callPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONEDA(String pPMONEDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ECO_MONEDAS.F_OBTENER_CMONEDA(?, ?)}";

		logCall(callQuery, new String[] { "pPMONEDA" }, new Object[] { pPMONEDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMONEDA);
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

	public HashMap ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONEDA(String pPMONEDA) throws Exception {
		return this.callPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONEDA(pPMONEDA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ECO_MONEDAS.F_OBTENER_CMONEDA
	// --START-PAC_IAX_ECO_MONEDAS.F_OBTENER_CMONINT(PMONEDA)

	private HashMap callPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONINT(java.math.BigDecimal pPMONEDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ECO_MONEDAS.F_OBTENER_CMONINT(?, ?)}";

		logCall(callQuery, new String[] { "pPMONEDA" }, new Object[] { pPMONEDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMONEDA);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONINT(java.math.BigDecimal pPMONEDA) throws Exception {
		return this.callPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONINT(pPMONEDA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ECO_MONEDAS.F_OBTENER_CMONINT
	// --START-PAC_IAX_ECO_MONEDAS.F_OBTENER_MONEDA_PRODUCTO2(PSPRODUC)

	private HashMap callPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ECO_MONEDAS.F_OBTENER_MONEDA_PRODUCTO2(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(pPSPRODUC); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ECO_MONEDAS.F_OBTENER_MONEDA_PRODUCTO2
	// --START-PAC_IAX_ECO_MONEDAS.F_OBTENER_MONEDA_SEGURO2(PSSEGURO)

	private HashMap callPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ECO_MONEDAS.F_OBTENER_MONEDA_SEGURO2(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ECO_MONEDAS.F_OBTENER_MONEDA_SEGURO2

}
