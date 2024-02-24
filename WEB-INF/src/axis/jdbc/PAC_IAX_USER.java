//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_USER extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_USER.class);
	private Connection conn = null;

	public PAC_IAX_USER(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_USER.F_CONSULTA_USUARIOS(PCEMPRES, PUSER, PTUSERNAME,
	// PCDELEGA)

	private HashMap callPAC_IAX_USER__F_CONSULTA_USUARIOS(java.math.BigDecimal pPCEMPRES, String pPUSER,
			String pPTUSERNAME, java.math.BigDecimal pPCDELEGA) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_CONSULTA_USUARIOS(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPUSER", "pPTUSERNAME", "pPCDELEGA" },
				new Object[] { pPCEMPRES, pPUSER, pPTUSERNAME, pPCDELEGA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPUSER);
		cStmt.setObject(4, pPTUSERNAME);
		cStmt.setObject(5, pPCDELEGA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_CONSULTA_USUARIOS(java.math.BigDecimal pPCEMPRES, String pPUSER,
			String pPTUSERNAME, java.math.BigDecimal pPCDELEGA) throws Exception {
		return this.callPAC_IAX_USER__F_CONSULTA_USUARIOS(pPCEMPRES, pPUSER, pPTUSERNAME, pPCDELEGA);
	}
	// --END-PAC_IAX_USER.F_CONSULTA_USUARIOS
	// --START-PAC_IAX_USER.F_DEL_USUARIO(PCUSUARI)

	private HashMap callPAC_IAX_USER__F_DEL_USUARIO(String pPCUSUARI) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_DEL_USUARIO(?,?)}";
		logCall(callQuery, new String[] { "pPCUSUARI" }, new Object[] { pPCUSUARI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSUARI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_DEL_USUARIO(String pPCUSUARI) throws Exception {
		return this.callPAC_IAX_USER__F_DEL_USUARIO(pPCUSUARI);
	}
	// --END-PAC_IAX_USER.F_DEL_USUARIO
	// --START-PAC_IAX_USER.F_GET_DATUSUARIO(PUSER)

	private HashMap callPAC_IAX_USER__F_GET_DATUSUARIO(String pPUSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_GET_DATUSUARIO(?,?)}";
		logCall(callQuery, new String[] { "pPUSER" }, new Object[] { pPUSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_USERS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_GET_DATUSUARIO(String pPUSER) throws Exception {
		return this.callPAC_IAX_USER__F_GET_DATUSUARIO(pPUSER);
	}
	// --END-PAC_IAX_USER.F_GET_DATUSUARIO
	// --START-PAC_IAX_USER.F_GET_USER()

	private HashMap callPAC_IAX_USER__F_GET_USER() throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_GET_USER(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_USER__F_GET_USER() throws Exception {
		return this.callPAC_IAX_USER__F_GET_USER();
	}
	// --END-PAC_IAX_USER.F_GET_USER
	// --START-PAC_IAX_USER.F_SET_DATUSUARIO(PUSER, PTUSERNAME, PCIDIOMA)

	private HashMap callPAC_IAX_USER__F_SET_DATUSUARIO(String pPUSER, String pPTUSERNAME,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_SET_DATUSUARIO(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPUSER", "pPTUSERNAME", "pPCIDIOMA" },
				new Object[] { pPUSER, pPTUSERNAME, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.setObject(3, pPTUSERNAME);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_SET_DATUSUARIO(String pPUSER, String pPTUSERNAME,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_USER__F_SET_DATUSUARIO(pPUSER, pPTUSERNAME, pPCIDIOMA);
	}
	// --END-PAC_IAX_USER.F_SET_DATUSUARIO
	// --START-PAC_IAX_USER.F_SET_PASSWORD(PUSER, POLDPWD, PNEWPWD)

	private HashMap callPAC_IAX_USER__F_SET_PASSWORD(String pPUSER, String pPOLDPWD, String pPNEWPWD) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_SET_PASSWORD(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPUSER", "pPOLDPWD", "pPNEWPWD" },
				new Object[] { pPUSER, pPOLDPWD, pPNEWPWD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.setObject(3, pPOLDPWD);
		cStmt.setObject(4, pPNEWPWD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_SET_PASSWORD(String pPUSER, String pPOLDPWD, String pPNEWPWD)
			throws Exception {
		return this.callPAC_IAX_USER__F_SET_PASSWORD(pPUSER, pPOLDPWD, pPNEWPWD);
	}
	// --END-PAC_IAX_USER.F_SET_PASSWORD

	// --START-PAC_IAX_USER.F_SET_USUARIO(PCUSUARI, PCIDIOMA, PCEMPRES, PTUSUNOM,
	// PCDELEGA, POLDPWD, PNEWPWD, PNEWPWDCNF, PCEMPLEADO, PCWIZARD, PCFORM,
	// PCACCION, PCMENU, PCCONSUPL, PCDOCUMENTACIO, PCAUTLOG, PCACCPROD, PCCFGMAP,
	// PCVISPUBLI, PCROL, PCUSUAGRU, PMAIL_USU, PTELFUSU, PUNIDEPT, PCATEGPROF,
	// PSPERSON, pAREAS)
	// INI IAXIS-4994 SE AGREGA PARAMETRO pPAREAS
	// INI SingleSignOn FCG 21/12/2020 Se agrega parametro pidREQ
	private HashMap callPAC_IAX_USER__F_SET_USUARIO(String pPCUSUARI, java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCEMPRES, String pPTUSUNOM, java.math.BigDecimal pPCDELEGA, String pPOLDPWD,
			String pPNEWPWD, String pPNEWPWDCNF, String pPCEMPLEADO, String pPCWIZARD, String pPCFORM, String pPCACCION,
			String pPCMENU, String pPCCONSUPL, String pPCDOCUMENTACIO, java.math.BigDecimal pPCAUTLOG,
			String pPCACCPROD, String pPCCFGMAP, java.math.BigDecimal pPCVISPUBLI, String pPCROL,
			java.math.BigDecimal pPCUSUAGRU, String pPMAIL_USU, String pPTELFUSU, java.math.BigDecimal pPUNIDEPT,
			java.math.BigDecimal pPCATEGPROF, java.math.BigDecimal pPSPERSON, String pPAREAS, String pidREQ,
			String pINFESP) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_SET_USUARIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCUSUARI", "pPCIDIOMA", "pPCEMPRES", "pPTUSUNOM", "pPCDELEGA", "pPOLDPWD",
				"pPNEWPWD", "pPNEWPWDCNF", "pPCEMPLEADO", "pPCWIZARD", "pPCFORM", "pPCACCION", "pPCMENU", "pPCCONSUPL",
				"pPCDOCUMENTACIO", "pPCAUTLOG", "pPCACCPROD", "pPCCFGMAP", "pPCVISPUBLI", "pPCROL", "pPCUSUAGRU",
				"pPMAIL_USU", "pPTELFUSU", "pPUNIDEPT", "pPCATEGPROF", "pPSPERSON", "pPAREAS", "pidREQ", "pINFESP" },
				new Object[] { pPCUSUARI, pPCIDIOMA, pPCEMPRES, pPTUSUNOM, pPCDELEGA, pPOLDPWD, pPNEWPWD, pPNEWPWDCNF,
						pPCEMPLEADO, pPCWIZARD, pPCFORM, pPCACCION, pPCMENU, pPCCONSUPL, pPCDOCUMENTACIO, pPCAUTLOG,
						pPCACCPROD, pPCCFGMAP, pPCVISPUBLI, pPCROL, pPCUSUAGRU, pPMAIL_USU, pPTELFUSU, pPUNIDEPT,
						pPCATEGPROF, pPSPERSON, pPAREAS, pidREQ, pINFESP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSUARI);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPTUSUNOM);
		cStmt.setObject(6, pPCDELEGA);
		cStmt.setObject(7, pPOLDPWD);
		cStmt.setObject(8, pPNEWPWD);
		cStmt.setObject(9, pPNEWPWDCNF);
		cStmt.setObject(10, pPCEMPLEADO);
		cStmt.setObject(11, pPCWIZARD);
		cStmt.setObject(12, pPCFORM);
		cStmt.setObject(13, pPCACCION);
		cStmt.setObject(14, pPCMENU);
		cStmt.setObject(15, pPCCONSUPL);
		cStmt.setObject(16, pPCDOCUMENTACIO);
		cStmt.setObject(17, pPCAUTLOG);
		cStmt.setObject(18, pPCACCPROD);
		cStmt.setObject(19, pPCCFGMAP);
		cStmt.setObject(20, pPCVISPUBLI);
		cStmt.setObject(21, pPCROL);
		cStmt.setObject(22, pPCUSUAGRU);
		cStmt.setObject(23, pPMAIL_USU);
		cStmt.setObject(24, pPTELFUSU);
		cStmt.setObject(25, pPUNIDEPT);
		cStmt.setObject(26, pPCATEGPROF);
		cStmt.setObject(27, pPSPERSON);
		cStmt.setObject(28, pPAREAS);
		cStmt.setObject(29, pidREQ);
		cStmt.setObject(30, pINFESP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(31));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	// INI IAXIS-4994 SE AGREGA PARAMETRO pPAREAS
	public HashMap ejecutaPAC_IAX_USER__F_SET_USUARIO(String pPCUSUARI, java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCEMPRES, String pPTUSUNOM, java.math.BigDecimal pPCDELEGA, String pPOLDPWD,
			String pPNEWPWD, String pPNEWPWDCNF, String pPCEMPLEADO, String pPCWIZARD, String pPCFORM, String pPCACCION,
			String pPCMENU, String pPCCONSUPL, String pPCDOCUMENTACIO, java.math.BigDecimal pPCAUTLOG,
			String pPCACCPROD, String pPCCFGMAP, java.math.BigDecimal pPCVISPUBLI, String pPCROL,
			java.math.BigDecimal pPCUSUAGRU, String pPMAIL_USU, String pPTELFUSU, java.math.BigDecimal pPUNIDEPT,
			java.math.BigDecimal pPCATEGPROF, java.math.BigDecimal pPSPERSON, String pPAREAS, String pidREQ,
			String pINFESP) throws Exception {
		return this.callPAC_IAX_USER__F_SET_USUARIO(pPCUSUARI, pPCIDIOMA, pPCEMPRES, pPTUSUNOM, pPCDELEGA, pPOLDPWD,
				pPNEWPWD, pPNEWPWDCNF, pPCEMPLEADO, pPCWIZARD, pPCFORM, pPCACCION, pPCMENU, pPCCONSUPL, pPCDOCUMENTACIO,
				pPCAUTLOG, pPCACCPROD, pPCCFGMAP, pPCVISPUBLI, pPCROL, pPCUSUAGRU, pPMAIL_USU, pPTELFUSU, pPUNIDEPT,
				pPCATEGPROF, pPSPERSON, pPAREAS, pidREQ, pINFESP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_USER.F_SET_USUARIO
	// FIN SingleSignOn FCG 21/12/2020 Se agrega parametro pidREQ

	// --START-PAC_IAX_USER.F_GET_USUARIO(PUSER)
	private HashMap callPAC_IAX_USER__F_GET_USUARIO(String pPUSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_GET_USUARIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPUSER" }, new Object[] { pPUSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_USUARIOS".toUpperCase())); // Valor de "PUSUARIO"
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
			retVal.put("PUSUARIO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PUSUARIO", null);
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

	public HashMap ejecutaPAC_IAX_USER__F_GET_USUARIO(String pPUSER) throws Exception {
		return this.callPAC_IAX_USER__F_GET_USUARIO(pPUSER);
	}
	// --END-PAC_IAX_USER.F_GET_USUARIO

	// --START-PAC_IAX_USER.F_ACTIVAR_USUARIO(PCUSUARI)
	private HashMap callPAC_IAX_USER__F_ACTIVAR_USUARIO(String pPCUSUARI) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_ACTIVAR_USUARIO(?,?)}";
		logCall(callQuery, new String[] { "pPCUSUARI" }, new Object[] { pPCUSUARI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSUARI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_ACTIVAR_USUARIO(String pPCUSUARI) throws Exception {
		return this.callPAC_IAX_USER__F_ACTIVAR_USUARIO(pPCUSUARI);
	}
	// --END-PAC_IAX_USER.F_ACTIVAR_USUARIO

	// --START-PAC_IAX_USER.F_GET_USUARIO_VISION(PCUSUARI, PNOMUSUARIO)
	private HashMap callPAC_IAX_USER__F_GET_USUARIO_VISION(String pPCUSUARI, String pPNOMUSUARIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_GET_USUARIO_VISION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCUSUARI", "pPNOMUSUARIO" }, new Object[] { pPCUSUARI, pPNOMUSUARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSUARI);
		cStmt.setObject(3, pPNOMUSUARIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_USERS".toUpperCase())); // Valor de "PTUSUARIO"
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
			retVal.put("PTUSUARIO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTUSUARIO", null);
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

	public HashMap ejecutaPAC_IAX_USER__F_GET_USUARIO_VISION(String pPCUSUARI, String pPNOMUSUARIO) throws Exception {
		return this.callPAC_IAX_USER__F_GET_USUARIO_VISION(pPCUSUARI, pPNOMUSUARIO);
	}

	// --END-PAC_IAX_USER.F_GET_USUARIO_VISION
	// --START-PAC_IAX_USER.F_VAL_CAMBIO_PASWD(PUSER)
	private HashMap callPAC_IAX_USER__F_VAL_CAMBIO_PASWD(String pPUSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_VAL_CAMBIO_PASWD(?, ?)}";

		logCall(callQuery, new String[] { "pPUSER" }, new Object[] { pPUSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_VAL_CAMBIO_PASWD(String pPUSER) throws Exception {
		return this.callPAC_IAX_USER__F_VAL_CAMBIO_PASWD(pPUSER);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_USER.F_VAL_CAMBIO_PASWD

	// --START-PAC_IAX_USER.F_GET_USUARIOS(PUSER, PUSERNAME)
	private HashMap callPAC_IAX_USER__F_GET_USUARIOS(String pPUSER, String pPUSERNAME) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_GET_USUARIOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPUSER", "pPUSERNAME" }, new Object[] { pPUSER, pPUSERNAME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.setObject(3, pPUSERNAME);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_USERS".toUpperCase())); // Valor de "TUSERS"
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
			retVal.put("TUSERS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("TUSERS", null);
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

	public HashMap ejecutaPAC_IAX_USER__F_GET_USUARIOS(String pPUSER, String pPUSERNAME) throws Exception {
		return this.callPAC_IAX_USER__F_GET_USUARIOS(pPUSER, pPUSERNAME);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_USER.F_GET_USUARIOS

	// --START-PAC_IAX_USER.F_GET_IDREQ(PUSER) - 21/12/2020 FCG SSO
	private HashMap callPAC_IAX_USER__F_GET_IDREQ(String pPUSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_USER.F_GET_IDREQ(?,?)}";
		logCall(callQuery, new String[] { "pPUSER" }, new Object[] { pPUSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.registerOutParameter(1, java.sql.Types.CLOB); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_USER__F_GET_IDREQ(String pPUSER) throws Exception {
		return this.callPAC_IAX_USER__F_GET_IDREQ(pPUSER);
	}
	// --END-PAC_IAX_USER.F_GET_IDREQ(PUSER) - 21/12/2020 FCG SSO

}
