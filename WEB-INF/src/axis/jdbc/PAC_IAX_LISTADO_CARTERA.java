package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LISTADO_CARTERA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTADO_CARTERA.class);
	private Connection conn = null;

	public PAC_IAX_LISTADO_CARTERA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LISTADO_CARTERA.F_LISTADO_COMPARA_CARTERAS(PCCOMPANI,
	// PSPRODUC, PFDESDE, PFHASTA)
	private HashMap callPAC_IAX_LISTADO_CARTERA__F_LISTADO_COMPARA_CARTERAS(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSPRODUC, java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTADO_CARTERA.F_LISTADO_COMPARA_CARTERAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPSPRODUC", "pPFDESDE", "pPFHASTA" },
				new Object[] { pPCCOMPANI, pPSPRODUC, pPFDESDE, pPFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPFDESDE);
		cStmt.setObject(5, pPFHASTA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_COMPARACARTERAS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTADO_CARTERA__F_LISTADO_COMPARA_CARTERAS(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSPRODUC, java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		return this.callPAC_IAX_LISTADO_CARTERA__F_LISTADO_COMPARA_CARTERAS(pPCCOMPANI, pPSPRODUC, pPFDESDE, pPFHASTA);
	}
	// --END-PAC_IAX_LISTADO_CARTERA.F_LISTADO_COMPARA_CARTERAS

	// --START-PAC_IAX_LISTADO_CARTERA.F_LISTADO_POLIZAS_SINCARTERA(PCCOMPANI,
	// PSPRODUC, PFDESDE, PFHASTA)
	private HashMap callPAC_IAX_LISTADO_CARTERA__F_LISTADO_POLIZAS_SINCARTERA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSPRODUC, java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTADO_CARTERA.F_LISTADO_POLIZAS_SINCARTERA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPSPRODUC", "pPFDESDE", "pPFHASTA" },
				new Object[] { pPCCOMPANI, pPSPRODUC, pPFDESDE, pPFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPFDESDE);
		cStmt.setObject(5, pPFHASTA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_COMPARACARTERAS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTADO_CARTERA__F_LISTADO_POLIZAS_SINCARTERA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSPRODUC, java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		return this.callPAC_IAX_LISTADO_CARTERA__F_LISTADO_POLIZAS_SINCARTERA(pPCCOMPANI, pPSPRODUC, pPFDESDE,
				pPFHASTA);
	}
	// --END-PAC_IAX_LISTADO_CARTERA.F_LISTADO_POLIZAS_SINCARTERA

}
