package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PROCESOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PROCESOS.class);
	private Connection conn = null;

	public PAC_IAX_PROCESOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PROCESOS.F_SET_CONSULTAPROCESOSCAB(PCEMPRES, PSPROCES,
	// PFPROINI, PCPROCES, PNERROR, PCUSUARI)
	private HashMap callPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSCAB(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.sql.Date pPFPROINI, String pPCPROCES, java.math.BigDecimal pPNERROR,
			String pPCUSUARI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROCESOS.F_SET_CONSULTAPROCESOSCAB(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES", "pPFPROINI", "pPCPROCES", "pPNERROR", "pPCUSUARI" },
				new Object[] { pPCEMPRES, pPSPROCES, pPFPROINI, pPCPROCES, pPNERROR, pPCUSUARI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPFPROINI);
		cStmt.setObject(5, pPCPROCES);
		cStmt.setObject(6, pPNERROR);
		cStmt.setObject(7, pPCUSUARI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROCESOSCAB".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSCAB(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.sql.Date pPFPROINI, String pPCPROCES, java.math.BigDecimal pPNERROR,
			String pPCUSUARI) throws Exception {
		return this.callPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSCAB(pPCEMPRES, pPSPROCES, pPFPROINI, pPCPROCES,
				pPNERROR, pPCUSUARI);
	}
	// --END-PAC_IAX_PROCESOS.F_SET_CONSULTAPROCESOSCAB

	// --START-PAC_IAX_PROCESOS.F_SET_CONSULTAPROCESOSLIN(PSPROCES)
	private HashMap callPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSLIN(java.math.BigDecimal pPSPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROCESOS.F_SET_CONSULTAPROCESOSLIN(?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES" }, new Object[] { pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROCESOSLIN".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSLIN(java.math.BigDecimal pPSPROCES) throws Exception {
		return this.callPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSLIN(pPSPROCES);
	}
	// --END-PAC_IAX_PROCESOS.F_SET_CONSULTAPROCESOSLIN

}
