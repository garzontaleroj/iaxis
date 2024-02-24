package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_BASESTECNICAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_BASESTECNICAS.class);
	private Connection conn = null;

	public PAC_IAX_BASESTECNICAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_BASESTECNICAS.F_OBTBASESTECNICAS(PSSEGURO, PNRIESGO,
	// PNMOVIMI, PTABLA)
	private HashMap callPAC_IAX_BASESTECNICAS__F_OBTBASESTECNICAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPTABLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_BASESTECNICAS.F_OBTBASESTECNICAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPNMOVIMI", "pPTABLA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPTABLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(6, pPTABLA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BASESTECNICAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_BASESTECNICAS__F_OBTBASESTECNICAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPTABLA) throws Exception {
		return this.callPAC_IAX_BASESTECNICAS__F_OBTBASESTECNICAS(pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPTABLA);
	}
	// --END-PAC_IAX_BASESTECNICAS.F_OBTBASESTECNICAS

}
