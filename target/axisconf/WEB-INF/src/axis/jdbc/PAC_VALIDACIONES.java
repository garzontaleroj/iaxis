package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.util.ConversionUtil;

public class PAC_VALIDACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_VALIDACIONES.class);
	private Connection conn = null;

	public PAC_VALIDACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_VALIDACIONES.F_VALIDA_CAMPO(PCEMPRES, PCIDCAMPO, PCAMPO)
	private HashMap callPAC_VALIDACIONES__F_VALIDA_CAMPO(java.math.BigDecimal pPCEMPRES, String pPCIDCAMPO,
			String pPCAMPO) throws Exception {
		String callQuery = "{?=call PAC_VALIDACIONES.F_VALIDA_CAMPO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDCAMPO", "pPCAMPO" },
				new Object[] { pPCEMPRES, pPCIDCAMPO, pPCAMPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDCAMPO);
		cStmt.setObject(4, pPCAMPO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_VALIDACIONES__F_VALIDA_CAMPO(java.math.BigDecimal pPCEMPRES, String pPCIDCAMPO,
			String pPCAMPO) throws Exception {
		return this.callPAC_VALIDACIONES__F_VALIDA_CAMPO(pPCEMPRES, pPCIDCAMPO, pPCAMPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_VALIDACIONES.F_VALIDA_CAMPO

}
