package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_RECHAZO extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_RECHAZO.class);
	private Connection conn = null;

	public PAC_IAX_RECHAZO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_RECHAZO.RECHAZO(PSSEGURO, PCMOTMOV, PNMOVIMI, PACCION,
	// PTOBSERV)
	private HashMap callPAC_IAX_RECHAZO__RECHAZO(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPACCION, String pPTOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_RECHAZO.RECHAZO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMOTMOV", "pPNMOVIMI", "pPACCION", "pPTOBSERV" },
				new Object[] { pPSSEGURO, pPCMOTMOV, pPNMOVIMI, pPACCION, pPTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPACCION);
		cStmt.setObject(6, pPTOBSERV);
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

	public HashMap ejecutaPAC_IAX_RECHAZO__RECHAZO(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPACCION, String pPTOBSERV) throws Exception {
		return this.callPAC_IAX_RECHAZO__RECHAZO(pPSSEGURO, pPCMOTMOV, pPNMOVIMI, pPACCION, pPTOBSERV);
	}
	// --END-PAC_IAX_RECHAZO.RECHAZO

}
