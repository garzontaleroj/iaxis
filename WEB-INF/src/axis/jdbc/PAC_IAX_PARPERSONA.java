package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PARPERSONA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PARPERSONA.class);
	private Connection conn = null;

	public PAC_IAX_PARPERSONA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PARPERSONA.F_GET_DETPARAM(PCODIGO, PCONDICION, PCIDIOMA)
	private HashMap callPAC_IAX_PARPERSONA__F_GET_DETPARAM(String pPCODIGO, String pPCONDICION,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PARPERSONA.F_GET_DETPARAM(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCODIGO", "pPCONDICION", "pPCIDIOMA" },
				new Object[] { pPCODIGO, pPCONDICION, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCODIGO);
		cStmt.setObject(3, pPCONDICION);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PARPERSONA__F_GET_DETPARAM(String pPCODIGO, String pPCONDICION,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_PARPERSONA__F_GET_DETPARAM(pPCODIGO, pPCONDICION, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PARPERSONA.F_GET_DETPARAM

}
