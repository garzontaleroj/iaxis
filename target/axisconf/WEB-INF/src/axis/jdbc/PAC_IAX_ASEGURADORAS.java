package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_ASEGURADORAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENSEGU.class);
	private Connection conn = null;

	public PAC_IAX_ASEGURADORAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ASEGURADORAS.F_DEL_ASEGURADORAS(PCCODASEG, PCCODDGS)
	private HashMap callPAC_IAX_ASEGURADORAS__F_DEL_ASEGURADORAS(java.math.BigDecimal pPCCODASEG, String pPCCODDGS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ASEGURADORAS.F_DEL_ASEGURADORAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODASEG", "pPCCODDGS" }, new Object[] { pPCCODASEG, pPCCODDGS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODASEG);
		cStmt.setObject(3, pPCCODDGS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ASEGURADORAS__F_DEL_ASEGURADORAS(java.math.BigDecimal pPCCODASEG, String pPCCODDGS)
			throws Exception {
		return this.callPAC_IAX_ASEGURADORAS__F_DEL_ASEGURADORAS(pPCCODASEG, pPCCODDGS);
	}

	// --END-PAC_IAX_ASEGURADORAS.F_DEL_ASEGURADORAS
	// --START-PAC_IAX_ASEGURADORAS.F_DEL_ASEGURADORAS_PLANES(PCCODASEG, PCCODIGO)
	private HashMap callPAC_IAX_ASEGURADORAS__F_DEL_ASEGURADORAS_PLANES(java.math.BigDecimal pPCCODASEG,
			java.math.BigDecimal pPCCODIGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ASEGURADORAS.F_DEL_ASEGURADORAS_PLANES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODASEG", "pPCCODIGO" }, new Object[] { pPCCODASEG, pPCCODIGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODASEG);
		cStmt.setObject(3, pPCCODIGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ASEGURADORAS__F_DEL_ASEGURADORAS_PLANES(java.math.BigDecimal pPCCODASEG,
			java.math.BigDecimal pPCCODIGO) throws Exception {
		return this.callPAC_IAX_ASEGURADORAS__F_DEL_ASEGURADORAS_PLANES(pPCCODASEG, pPCCODIGO);
	}

	// --END-PAC_IAX_ASEGURADORAS.F_DEL_ASEGURADORAS_PLANES
	// --START-PAC_IAX_ASEGURADORAS.F_GET_ASEGURADORAS(PCEMPRES, PCCODASEG,
	// PCCODIGO, PCCODDEP, PCCODDGS, PNOMBRE, PCTRASP)
	private HashMap callPAC_IAX_ASEGURADORAS__F_GET_ASEGURADORAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODASEG, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCCODDEP,
			String pPCCODDGS, String pPNOMBRE, java.math.BigDecimal pPCTRASP) throws Exception {
		String callQuery = "{?=call PAC_IAX_ASEGURADORAS.F_GET_ASEGURADORAS(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCODASEG", "pPCCODIGO", "pPCCODDEP", "pPCCODDGS", "pPNOMBRE",
						"pPCTRASP" },
				new Object[] { pPCEMPRES, pPCCODASEG, pPCCODIGO, pPCCODDEP, pPCCODDGS, pPNOMBRE, pPCTRASP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODASEG);
		cStmt.setObject(4, pPCCODIGO);
		cStmt.setObject(5, pPCCODDEP);
		cStmt.setObject(6, pPCCODDGS);
		cStmt.setObject(7, pPNOMBRE);
		cStmt.setObject(8, pPCTRASP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ASEGURADORAS".toUpperCase())); // Valor de "ASEGURADORAS"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("ASEGURADORAS", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("ASEGURADORAS", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ASEGURADORAS__F_GET_ASEGURADORAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODASEG, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCCODDEP,
			String pPCCODDGS, String pPNOMBRE, java.math.BigDecimal pPCTRASP) throws Exception {
		return this.callPAC_IAX_ASEGURADORAS__F_GET_ASEGURADORAS(pPCEMPRES, pPCCODASEG, pPCCODIGO, pPCCODDEP, pPCCODDGS,
				pPNOMBRE, pPCTRASP);
	}

	// --END-PAC_IAX_ASEGURADORAS.F_GET_ASEGURADORAS
	// --START-PAC_IAX_ASEGURADORAS.F_GET_NOMASEG(VSPERSON)
	private HashMap callPAC_IAX_ASEGURADORAS__F_GET_NOMASEG(java.math.BigDecimal pVSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_ASEGURADORAS.F_GET_NOMASEG(?, ?)}";

		logCall(callQuery, new String[] { "pVSPERSON" }, new Object[] { pVSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pVSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ASEGURADORAS__F_GET_NOMASEG(java.math.BigDecimal pVSPERSON) throws Exception {
		return this.callPAC_IAX_ASEGURADORAS__F_GET_NOMASEG(pVSPERSON);
	}

	// --END-PAC_IAX_ASEGURADORAS.F_GET_NOMASEG
	// --START-PAC_IAX_ASEGURADORAS.F_GET_OB_ASEGURADORAS(CCODASEG, CODDGS)
	private HashMap callPAC_IAX_ASEGURADORAS__F_GET_OB_ASEGURADORAS(String pCCODASEG, String pCODDGS) throws Exception {
		String callQuery = "{?=call PAC_IAX_ASEGURADORAS.F_GET_OB_ASEGURADORAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODASEG", "pCODDGS" }, new Object[] { pCCODASEG, pCODDGS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODASEG);
		cStmt.setObject(3, pCODDGS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_ASEGURADORAS".toUpperCase())); // Valor de "OB_ASEG"
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
			retVal.put("OB_ASEG", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("OB_ASEG", null);
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

	public HashMap ejecutaPAC_IAX_ASEGURADORAS__F_GET_OB_ASEGURADORAS(String pCCODASEG, String pCODDGS)
			throws Exception {
		return this.callPAC_IAX_ASEGURADORAS__F_GET_OB_ASEGURADORAS(pCCODASEG, pCODDGS);
	}

	// --END-PAC_IAX_ASEGURADORAS.F_GET_OB_ASEGURADORAS
	// --START-PAC_IAX_ASEGURADORAS.F_SET_ASEGURADORAS(VCCODASEG, VSPERSON,
	// VCCODBAN, VCBANCAR, VCEMPRES, VCCODDEP, VCCODDGS, VCTIPBAN, VCLISTBLANC)
	private HashMap callPAC_IAX_ASEGURADORAS__F_SET_ASEGURADORAS(String pVCCODASEG, java.math.BigDecimal pVSPERSON,
			java.math.BigDecimal pVCCODBAN, String pVCBANCAR, java.math.BigDecimal pVCEMPRES,
			java.math.BigDecimal pVCCODDEP, String pVCCODDGS, java.math.BigDecimal pVCTIPBAN,
			java.math.BigDecimal pVCLISTBLANC) throws Exception {
		String callQuery = "{?=call PAC_IAX_ASEGURADORAS.F_SET_ASEGURADORAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pVCCODASEG", "pVSPERSON", "pVCCODBAN", "pVCBANCAR", "pVCEMPRES", "pVCCODDEP",
						"pVCCODDGS", "pVCTIPBAN", "pVCLISTBLANC" },
				new Object[] { pVCCODASEG, pVSPERSON, pVCCODBAN, pVCBANCAR, pVCEMPRES, pVCCODDEP, pVCCODDGS, pVCTIPBAN,
						pVCLISTBLANC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pVCCODASEG);
		cStmt.setObject(3, pVSPERSON);
		cStmt.setObject(4, pVCCODBAN);
		cStmt.setObject(5, pVCBANCAR);
		cStmt.setObject(6, pVCEMPRES);
		cStmt.setObject(7, pVCCODDEP);
		cStmt.setObject(8, pVCCODDGS);
		cStmt.setObject(9, pVCTIPBAN);
		cStmt.setObject(10, pVCLISTBLANC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ASEGURADORAS__F_SET_ASEGURADORAS(String pVCCODASEG, java.math.BigDecimal pVSPERSON,
			java.math.BigDecimal pVCCODBAN, String pVCBANCAR, java.math.BigDecimal pVCEMPRES,
			java.math.BigDecimal pVCCODDEP, String pVCCODDGS, java.math.BigDecimal pVCTIPBAN,
			java.math.BigDecimal pVCLISTBLANC) throws Exception {
		return this.callPAC_IAX_ASEGURADORAS__F_SET_ASEGURADORAS(pVCCODASEG, pVSPERSON, pVCCODBAN, pVCBANCAR, pVCEMPRES,
				pVCCODDEP, pVCCODDGS, pVCTIPBAN, pVCLISTBLANC);
	}
	// --END-PAC_IAX_ASEGURADORAS.F_SET_ASEGURADORAS
}
