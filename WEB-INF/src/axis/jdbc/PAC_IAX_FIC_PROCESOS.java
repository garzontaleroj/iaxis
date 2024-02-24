package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FIC_PROCESOS extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_PROCESOS.class);
	private Connection conn = null;

	public PAC_IAX_FIC_PROCESOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_FIC_PROCESOS.F_GET_FICPROCESOS(PCEMPRES, PSPROCES, PTGESTOR,
	// PTFORMAT, PTANIO, PTMES, PTDIASEM, PNERROR, PCUSUARI, PFPROINI)
	private HashMap callPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, String pPTGESTOR, String pPTFORMAT, String pPTANIO, String pPTMES,
			String pPTDIASEM, java.math.BigDecimal pPNERROR, String pPCUSUARI, java.sql.Date pPFPROINI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FIC_PROCESOS.F_GET_FICPROCESOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPSPROCES", "pPTGESTOR", "pPTFORMAT", "pPTANIO", "pPTMES", "pPTDIASEM",
						"pPNERROR", "pPCUSUARI", "pPFPROINI" },
				new Object[] { pPCEMPRES, pPSPROCES, pPTGESTOR, pPTFORMAT, pPTANIO, pPTMES, pPTDIASEM, pPNERROR,
						pPCUSUARI, pPFPROINI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPTGESTOR);
		cStmt.setObject(5, pPTFORMAT);
		cStmt.setObject(6, pPTANIO);
		cStmt.setObject(7, pPTMES);
		cStmt.setObject(8, pPTDIASEM);
		cStmt.setObject(9, pPNERROR);
		cStmt.setObject(10, pPCUSUARI);
		cStmt.setObject(11, pPFPROINI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, String pPTGESTOR, String pPTFORMAT, String pPTANIO, String pPTMES,
			String pPTDIASEM, java.math.BigDecimal pPNERROR, String pPCUSUARI, java.sql.Date pPFPROINI)
			throws Exception {
		return this.callPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOS(pPCEMPRES, pPSPROCES, pPTGESTOR, pPTFORMAT, pPTANIO,
				pPTMES, pPTDIASEM, pPNERROR, pPCUSUARI, pPFPROINI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FIC_PROCESOS.F_GET_FICPROCESOS

	// --START-PAC_IAX_FIC_PROCESOS.F_GET_FICPROCESOSDET(PSPROCES)
	private HashMap callPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOSDET(java.math.BigDecimal pPSPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_FIC_PROCESOS.F_GET_FICPROCESOSDET(?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES" }, new Object[] { pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_FIC_PROCESOSDET".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOSDET(java.math.BigDecimal pPSPROCES) throws Exception {
		return this.callPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOSDET(pPSPROCES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FIC_PROCESOS.F_GET_FICPROCESOSDET

}
