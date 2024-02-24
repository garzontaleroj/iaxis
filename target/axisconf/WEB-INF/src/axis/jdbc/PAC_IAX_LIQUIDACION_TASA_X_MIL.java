//Revision:# LuMQrURT4eQK7/wAt43X6w== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LIQUIDACION_TASA_X_MIL extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENDA.class);
	private Connection conn = null;

	public PAC_IAX_LIQUIDACION_TASA_X_MIL(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LIQUIDACION_TASA_X_MIL.LIQUIDACION_TASA_X_MIL(PCMODO,
	// PCEMPRESA, PCAGENTE, PCSUCURSAL, PFDESDE, PFHASTA)
	private HashMap callPAC_IAX_LIQUIDACION_TASA_X_MIL__LIQUIDACION_TASA_X_MIL(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCEMPRESA, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCSUCURSAL,
			java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDACION_TASA_X_MIL.LIQUIDACION_TASA_X_MIL(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMODO", "pPCEMPRESA", "pPCAGENTE", "pPCSUCURSAL", "pPFDESDE", "pPFHASTA" },
				new Object[] { pPCMODO, pPCEMPRESA, pPCAGENTE, pPCSUCURSAL, pPFDESDE, pPFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPCEMPRESA);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPCSUCURSAL);
		cStmt.setObject(6, pPFDESDE);
		cStmt.setObject(7, pPFHASTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDACION_TASA_X_MIL__LIQUIDACION_TASA_X_MIL(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCEMPRESA, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCSUCURSAL,
			java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		return this.callPAC_IAX_LIQUIDACION_TASA_X_MIL__LIQUIDACION_TASA_X_MIL(pPCMODO, pPCEMPRESA, pPCAGENTE,
				pPCSUCURSAL, pPFDESDE, pPFHASTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LIQUIDACION_TASA_X_MIL.LIQUIDACION_TASA_X_MIL

}
