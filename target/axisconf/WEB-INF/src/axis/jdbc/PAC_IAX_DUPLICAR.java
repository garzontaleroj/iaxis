package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DUPLICAR extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DUPLICAR.class);
	private Connection conn = null;

	public PAC_IAX_DUPLICAR(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DUPLICAR.F_VALIDA_DUP_SEGURO(PSSEGUROORIG)

	private HashMap callPAC_IAX_DUPLICAR__F_VALIDA_DUP_SEGURO(java.math.BigDecimal pPSSEGUROORIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DUPLICAR.F_VALIDA_DUP_SEGURO(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGUROORIG" }, new Object[] { pPSSEGUROORIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();

		cStmt.setObject(2, pPSSEGUROORIG);
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

	public HashMap ejecutaPAC_IAX_DUPLICAR__F_VALIDA_DUP_SEGURO(java.math.BigDecimal pPSSEGUROORIG) throws Exception {
		return this.callPAC_IAX_DUPLICAR__F_VALIDA_DUP_SEGURO(pPSSEGUROORIG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_DUP_SEGURO
}
