package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_FRANQUICIAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_SIN_FRANQUICIAS.class);
	private Connection conn = null;

	public PAC_IAX_SIN_FRANQUICIAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_FRANQUICIAS.F_FRAN_TOT(P_SSEGURO, P_NMOVIMI, P_NRIESGO,
	// P_CGARANT, P_IMPORTE, P_FECHA)
	private HashMap callPAC_IAX_SIN_FRANQUICIAS__F_FRAN_TOT(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NMOVIMI, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_CGARANT,
			java.math.BigDecimal pP_IMPORTE, java.sql.Date pP_FECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_FRANQUICIAS.F_FRAN_TOT(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SSEGURO", "pP_NMOVIMI", "pP_NRIESGO", "pP_CGARANT", "pP_IMPORTE", "pP_FECHA" },
				new Object[] { pP_SSEGURO, pP_NMOVIMI, pP_NRIESGO, pP_CGARANT, pP_IMPORTE, pP_FECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NMOVIMI);
		cStmt.setObject(4, pP_NRIESGO);
		cStmt.setObject(5, pP_CGARANT);
		cStmt.setObject(6, pP_IMPORTE);
		cStmt.setObject(7, pP_FECHA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "P_IFRANQ"
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
			retVal.put("P_IFRANQ", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_IFRANQ", null);
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

	public HashMap ejecutaPAC_IAX_SIN_FRANQUICIAS__F_FRAN_TOT(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NMOVIMI, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_CGARANT,
			java.math.BigDecimal pP_IMPORTE, java.sql.Date pP_FECHA) throws Exception {
		return this.callPAC_IAX_SIN_FRANQUICIAS__F_FRAN_TOT(pP_SSEGURO, pP_NMOVIMI, pP_NRIESGO, pP_CGARANT, pP_IMPORTE,
				pP_FECHA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_FRANQUICIAS.F_FRAN_TOT

}
