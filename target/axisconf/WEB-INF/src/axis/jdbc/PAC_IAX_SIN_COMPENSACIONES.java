//Revision:# tXc6gOYG126pBkc4bxfqtw== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//AAC_INI:0033798: POSPT500-POSADM/POSSIN: Incidencia cruce de siniestros VS cartera (bug hermano interno)

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_COMPENSACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_SINIESTROS.class);
	private Connection conn = null;

	public PAC_IAX_SIN_COMPENSACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_COMPENSACIONES.F_COMPENSA_RESERVA_PAGOSAUT(PSSEGURO,
	// PNRIESGO, PNSINIES, PNTRAMIT, PIDRES)
	private HashMap callPAC_IAX_SIN_COMPENSACIONES__F_COMPENSA_RESERVA_PAGOSAUT(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPIDRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_COMPENSACIONES.F_COMPENSA_RESERVA_PAGOSAUT(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPNSINIES", "pPNTRAMIT", "pPIDRES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNSINIES, pPNTRAMIT, pPIDRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPNTRAMIT);
		cStmt.setObject(6, pPIDRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PTLITERA"
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
			retVal.put("PTLITERA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PTLITERA", null);
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

	public HashMap ejecutaPAC_IAX_SIN_COMPENSACIONES__F_COMPENSA_RESERVA_PAGOSAUT(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPIDRES) throws Exception {
		return this.callPAC_IAX_SIN_COMPENSACIONES__F_COMPENSA_RESERVA_PAGOSAUT(pPSSEGURO, pPNRIESGO, pPNSINIES,
				pPNTRAMIT, pPIDRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_COMPENSACIONES.F_COMPENSA_RESERVA_PAGOSAUT

	// --START-PAC_IAX_SIN_COMPENSACIONES.F_VALIDA_COMPENSACION_RESERVA(PSSEGURO,
	// PNRIESGO, PNSINIES, PIDRES)
	private HashMap callPAC_IAX_SIN_COMPENSACIONES__F_VALIDA_COMPENSACION_RESERVA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPIDRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_COMPENSACIONES.F_VALIDA_COMPENSACION_RESERVA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPNSINIES", "pPIDRES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNSINIES, pPIDRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPIDRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PTLITERA"
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
			retVal.put("PTLITERA", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PTLITERA", null);
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

	public HashMap ejecutaPAC_IAX_SIN_COMPENSACIONES__F_VALIDA_COMPENSACION_RESERVA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNSINIES, java.math.BigDecimal pPIDRES) throws Exception {
		return this.callPAC_IAX_SIN_COMPENSACIONES__F_VALIDA_COMPENSACION_RESERVA(pPSSEGURO, pPNRIESGO, pPNSINIES,
				pPIDRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_COMPENSACIONES.F_VALIDA_COMPENSACION_RESERVA
}
