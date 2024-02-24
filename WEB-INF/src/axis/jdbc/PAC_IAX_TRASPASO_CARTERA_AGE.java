package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_TRASPASO_CARTERA_AGE extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_TRASPASO_CARTERA_AGE.class);
	private Connection conn = null;

	public PAC_IAX_TRASPASO_CARTERA_AGE(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_TRASPASO_CARTERA_AGE.F_TRASPASAR_CARTERA(PCAGEINI, PCAGEFIN,
	// PCTIPTRA, PSSEGURO, PNRECIBO, PSPROCES_IN, PTIPOTRAS, PCOMIS, PCMOTRASPASO,
	// PTOBSERV)
	private HashMap callPAC_IAX_TRASPASO_CARTERA_AGE__F_TRASPASAR_CARTERA(java.math.BigDecimal pPCAGEINI,
			java.math.BigDecimal pPCAGEFIN, String pPCTIPTRA, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSPROCES_IN, java.math.BigDecimal pPTIPOTRAS,
			String pPCOMIS, java.math.BigDecimal pPCMOTRASPASO, String pPTOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASO_CARTERA_AGE.F_TRASPASAR_CARTERA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGEINI", "pPCAGEFIN", "pPCTIPTRA", "pPSSEGURO", "pPNRECIBO", "pPSPROCES_IN",
						"pPTIPOTRAS", "pPCOMIS", "pPCMOTRASPASO", "pPTOBSERV" },
				new Object[] { pPCAGEINI, pPCAGEFIN, pPCTIPTRA, pPSSEGURO, pPNRECIBO, pPSPROCES_IN, pPTIPOTRAS, pPCOMIS,
						pPCMOTRASPASO, pPTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGEINI);
		cStmt.setObject(3, pPCAGEFIN);
		cStmt.setObject(4, pPCTIPTRA);
		cStmt.setObject(5, pPSSEGURO);
		cStmt.setObject(6, pPNRECIBO);
		cStmt.setObject(7, pPSPROCES_IN);
		cStmt.setObject(8, pPTIPOTRAS);
		cStmt.setObject(9, pPCOMIS);
		cStmt.setObject(10, pPCMOTRASPASO);
		cStmt.setObject(11, pPTOBSERV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de "PSPROCES_OUT"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSPROCES_OUT", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PSPROCES_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_TRASPASAR_CARTERA(java.math.BigDecimal pPCAGEINI,
			java.math.BigDecimal pPCAGEFIN, String pPCTIPTRA, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSPROCES_IN, java.math.BigDecimal pPTIPOTRAS,
			String pPCOMIS, java.math.BigDecimal pPCMOTRASPASO, String pPTOBSERV) throws Exception {
		return this.callPAC_IAX_TRASPASO_CARTERA_AGE__F_TRASPASAR_CARTERA(pPCAGEINI, pPCAGEFIN, pPCTIPTRA, pPSSEGURO,
				pPNRECIBO, pPSPROCES_IN, pPTIPOTRAS, pPCOMIS, pPCMOTRASPASO, pPTOBSERV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRASPASO_CARTERA_AGE.F_TRASPASAR_CARTERA

	// --START-PAC_IAX_TRASPASO_CARTERA_AGE.F_GET_LISTTRASPASOS(PCAGEINI, PCAGEFIN,
	// PFEFECTO)
	private HashMap callPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTTRASPASOS(java.math.BigDecimal pPCAGEINI,
			java.math.BigDecimal pPCAGEFIN, java.sql.Date pPFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASO_CARTERA_AGE.F_GET_LISTTRASPASOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGEINI", "pPCAGEFIN", "pPFEFECTO" },
				new Object[] { pPCAGEINI, pPCAGEFIN, pPFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGEINI);
		cStmt.setObject(3, pPCAGEFIN);
		cStmt.setObject(4, pPFEFECTO);
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

	public HashMap ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTTRASPASOS(java.math.BigDecimal pPCAGEINI,
			java.math.BigDecimal pPCAGEFIN, java.sql.Date pPFEFECTO) throws Exception {
		return this.callPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTTRASPASOS(pPCAGEINI, pPCAGEFIN, pPFEFECTO);
	}
	// --END-PAC_IAX_TRASPASO_CARTERA_AGE.F_GET_LISTTRASPASOS

	// --START-PAC_IAX_TRASPASO_CARTERA_AGE.F_GET_LISTDETTRASP(PSPROCES)
	private HashMap callPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTDETTRASP(java.math.BigDecimal pPSPROCES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASO_CARTERA_AGE.F_GET_LISTDETTRASP(?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES" }, new Object[] { pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTDETTRASP(java.math.BigDecimal pPSPROCES)
			throws Exception {
		return this.callPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTDETTRASP(pPSPROCES);
	}
	// --END-PAC_IAX_TRASPASO_CARTERA_AGE.F_GET_LISTDETTRASP

}
