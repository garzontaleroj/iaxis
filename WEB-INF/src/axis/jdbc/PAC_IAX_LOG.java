package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LOG extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LOG.class);
	private Connection conn = null;

	public PAC_IAX_LOG(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LOG.F_LOG_ACTIVIDAD(PTORIGEN, PTMODO, PIDDOC, PCONTADOR)
	private HashMap callPAC_IAX_LOG__F_LOG_ACTIVIDAD(String pPTORIGEN, String pPTMODO, java.math.BigDecimal pPIDDOC,
			java.math.BigDecimal pPCONTADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_LOG.F_LOG_ACTIVIDAD(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTORIGEN", "pPTMODO", "pPIDDOC", "pPCONTADOR" },
				new Object[] { pPTORIGEN, pPTMODO, pPIDDOC, pPCONTADOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTORIGEN);
		cStmt.setObject(3, pPTMODO);
		cStmt.setObject(4, pPIDDOC);
		cStmt.setObject(5, pPCONTADOR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD(String pPTORIGEN, String pPTMODO, java.math.BigDecimal pPIDDOC,
			java.math.BigDecimal pPCONTADOR) throws Exception {
		return this.callPAC_IAX_LOG__F_LOG_ACTIVIDAD(pPTORIGEN, pPTMODO, pPIDDOC, pPCONTADOR);
	}
	// --END-PAC_IAX_LOG.F_LOG_ACTIVIDAD

	// --START-PAC_IAX_LOG.F_LOG_CONSULTAS(PTCONSULTA, PTLLAMADA, PCTIPO, PCORIGEN)

	private HashMap callPAC_IAX_LOG__F_LOG_CONSULTAS(String pPTCONSULTA, String pPTLLAMADA,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCORIGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LOG.F_LOG_CONSULTAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTCONSULTA", "pPTLLAMADA", "pPCTIPO", "pPCORIGEN" },
				new Object[] { pPTCONSULTA, pPTLLAMADA, pPCTIPO, pPCORIGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTCONSULTA);
		cStmt.setObject(3, pPTLLAMADA);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPCORIGEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_LOG__F_LOG_CONSULTAS(String pPTCONSULTA, String pPTLLAMADA,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCORIGEN) throws Exception {
		return this.callPAC_IAX_LOG__F_LOG_CONSULTAS(pPTCONSULTA, pPTLLAMADA, pPCTIPO, pPCORIGEN);
	}
	// --END-PAC_IAX_LOG.F_LOG_CONSULTAS

}
