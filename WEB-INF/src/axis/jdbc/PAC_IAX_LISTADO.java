package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LISTADO extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTADO.class);
	private Connection conn = null;

	public PAC_IAX_LISTADO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LISTADO.F_GENERAR_LISTADO(P_CEMPRES, P_SPROCES, P_CAGENTE)
	private HashMap callPAC_IAX_LISTADO__F_GENERAR_LISTADO(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPROCES, java.math.BigDecimal pP_CAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTADO.F_GENERAR_LISTADO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CEMPRES", "pP_SPROCES", "pP_CAGENTE" },
				new Object[] { pP_CEMPRES, pP_SPROCES, pP_CAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_SPROCES);
		cStmt.setObject(4, pP_CAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "P_FITXER1"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "P_FITXER2"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "P_FITXER3"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "P_FITXER4"
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
			retVal.put("P_FITXER1", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_FITXER1", null);
		}
		try {
			retVal.put("P_FITXER2", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_FITXER2", null);
		}
		try {
			retVal.put("P_FITXER3", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_FITXER3", null);
		}
		try {
			retVal.put("P_FITXER4", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_FITXER4", null);
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

	public HashMap ejecutaPAC_IAX_LISTADO__F_GENERAR_LISTADO(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPROCES, java.math.BigDecimal pP_CAGENTE) throws Exception {
		return this.callPAC_IAX_LISTADO__F_GENERAR_LISTADO(pP_CEMPRES, pP_SPROCES, pP_CAGENTE);
	}
	// --END-PAC_IAX_LISTADO.F_GENERAR_LISTADO

	// --START-PAC_IAX_LISTADO.F_GENERA_REPORT(PSINTERF, PCEMPRES, PDATASOURCE,
	// PCIDIOMA, PCMAPEAD)
	private HashMap callPAC_IAX_LISTADO__F_GENERA_REPORT(java.math.BigDecimal pPSINTERF, java.math.BigDecimal pPCEMPRES,
			String pPDATASOURCE, java.math.BigDecimal pPCIDIOMA, String pPCMAPEAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTADO.F_GENERA_REPORT(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPCEMPRES", "pPDATASOURCE", "pPCIDIOMA", "pPCMAPEAD" },
				new Object[] { pPSINTERF, pPCEMPRES, pPDATASOURCE, pPCIDIOMA, pPCMAPEAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINTERF);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPDATASOURCE);
		cStmt.setObject(5, pPCIDIOMA);
		cStmt.setObject(6, pPCMAPEAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PERROR"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "PREPORT"
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
			retVal.put("PERROR", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PERROR", null);
		}
		try {
			retVal.put("PREPORT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PREPORT", null);
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

	public HashMap ejecutaPAC_IAX_LISTADO__F_GENERA_REPORT(java.math.BigDecimal pPSINTERF,
			java.math.BigDecimal pPCEMPRES, String pPDATASOURCE, java.math.BigDecimal pPCIDIOMA, String pPCMAPEAD)
			throws Exception {
		return this.callPAC_IAX_LISTADO__F_GENERA_REPORT(pPSINTERF, pPCEMPRES, pPDATASOURCE, pPCIDIOMA, pPCMAPEAD);
	}
	// --END-PAC_IAX_LISTADO.F_GENERA_REPORT

}