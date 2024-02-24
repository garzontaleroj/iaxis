package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MNTUSER extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MNTUSER.class);
	private Connection conn = null;

	public PAC_IAX_MNTUSER(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MNTUSER.F_DEL_CFGFORMPROPERTY(PCEMPRES, PCIDCFG, PCFORM,
	// PCITEM, PCPRPTY)
	private HashMap callPAC_IAX_MNTUSER__F_DEL_CFGFORMPROPERTY(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDCFG, String pPCFORM, String pPCITEM, java.math.BigDecimal pPCPRPTY)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_DEL_CFGFORMPROPERTY(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDCFG", "pPCFORM", "pPCITEM", "pPCPRPTY" },
				new Object[] { pPCEMPRES, pPCIDCFG, pPCFORM, pPCITEM, pPCPRPTY });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDCFG);
		cStmt.setObject(4, pPCFORM);
		cStmt.setObject(5, pPCITEM);
		cStmt.setObject(6, pPCPRPTY);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_DEL_CFGFORMPROPERTY(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDCFG, String pPCFORM, String pPCITEM, java.math.BigDecimal pPCPRPTY)
			throws Exception {
		return this.callPAC_IAX_MNTUSER__F_DEL_CFGFORMPROPERTY(pPCEMPRES, pPCIDCFG, pPCFORM, pPCITEM, pPCPRPTY);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_DEL_CFGFORMPROPERTY
	// --START-PAC_IAX_MNTUSER.F_GET_CCFGFORM(PCEMPRES)
	private HashMap callPAC_IAX_MNTUSER__F_GET_CCFGFORM(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_CCFGFORM(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_CCFGFORM(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_CCFGFORM(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_GET_CCFGFORM
	// --START-PAC_IAX_MNTUSER.F_GET_CFGFORMPROPERTY(PCEMPRES, PCFORM, PCMODO,
	// PCCFGFORM, PSPRODUC)
	private HashMap callPAC_IAX_MNTUSER__F_GET_CFGFORMPROPERTY(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPCMODO, String pPCCFGFORM, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_CFGFORMPROPERTY(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPCMODO", "pPCCFGFORM", "pPSPRODUC" },
				new Object[] { pPCEMPRES, pPCFORM, pPCMODO, pPCCFGFORM, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPCMODO);
		cStmt.setObject(5, pPCCFGFORM);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PCIDCFG"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCIDCFG", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCIDCFG", null);
		}
		try {
			retVal.put("PCURSOR", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_CFGFORMPROPERTY(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPCMODO, String pPCCFGFORM, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_CFGFORMPROPERTY(pPCEMPRES, pPCFORM, pPCMODO, pPCCFGFORM, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTUSER.F_GET_CFGFORMPROPERTY

	// --START-PAC_IAX_MNTUSER.F_GET_CODFORM(PCEMPRES, PSPRODUC, PCMODO)
	private HashMap callPAC_IAX_MNTUSER__F_GET_CODFORM(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC,
			String pPCMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_CODFORM(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPRODUC", "pPCMODO" },
				new Object[] { pPCEMPRES, pPSPRODUC, pPCMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_CODFORM(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC,
			String pPCMODO) throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_CODFORM(pPCEMPRES, pPSPRODUC, pPCMODO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_GET_CODFORM
	// --START-PAC_IAX_MNTUSER.F_GET_CODMODO(PCEMPRES, PSPRODUC)
	private HashMap callPAC_IAX_MNTUSER__F_GET_CODMODO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_CODMODO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPRODUC" }, new Object[] { pPCEMPRES, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_CODMODO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_CODMODO(pPCEMPRES, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_GET_CODMODO
	// --START-PAC_IAX_MNTUSER.F_SET_CFGFORM(PCEMPRES, PCFORM, PCMODO, PCCFGFORM,
	// PSPRODUC, PCIDCFG)
	private HashMap callPAC_IAX_MNTUSER__F_SET_CFGFORM(java.math.BigDecimal pPCEMPRES, String pPCFORM, String pPCMODO,
			String pPCCFGFORM, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCIDCFG) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_SET_CFGFORM(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPCMODO", "pPCCFGFORM", "pPSPRODUC", "pPCIDCFG" },
				new Object[] { pPCEMPRES, pPCFORM, pPCMODO, pPCCFGFORM, pPSPRODUC, pPCIDCFG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPCMODO);
		cStmt.setObject(5, pPCCFGFORM);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCIDCFG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "OCIDCFG"
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
			retVal.put("OCIDCFG", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("OCIDCFG", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_SET_CFGFORM(java.math.BigDecimal pPCEMPRES, String pPCFORM, String pPCMODO,
			String pPCCFGFORM, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCIDCFG) throws Exception {
		return this.callPAC_IAX_MNTUSER__F_SET_CFGFORM(pPCEMPRES, pPCFORM, pPCMODO, pPCCFGFORM, pPSPRODUC, pPCIDCFG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_SET_CFGFORM
	// --START-PAC_IAX_MNTUSER.F_SET_CFGFORMPROPERTY(PCEMPRES, PCIDCFG, PCFORM,
	// PCITEM, PCPRPTY, PCVALUE)
	private HashMap callPAC_IAX_MNTUSER__F_SET_CFGFORMPROPERTY(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDCFG, String pPCFORM, String pPCITEM, java.math.BigDecimal pPCPRPTY,
			java.math.BigDecimal pPCVALUE) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_SET_CFGFORMPROPERTY(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDCFG", "pPCFORM", "pPCITEM", "pPCPRPTY", "pPCVALUE" },
				new Object[] { pPCEMPRES, pPCIDCFG, pPCFORM, pPCITEM, pPCPRPTY, pPCVALUE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDCFG);
		cStmt.setObject(4, pPCFORM);
		cStmt.setObject(5, pPCITEM);
		cStmt.setObject(6, pPCPRPTY);
		cStmt.setObject(7, pPCVALUE);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_SET_CFGFORMPROPERTY(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDCFG, String pPCFORM, String pPCITEM, java.math.BigDecimal pPCPRPTY,
			java.math.BigDecimal pPCVALUE) throws Exception {
		return this.callPAC_IAX_MNTUSER__F_SET_CFGFORMPROPERTY(pPCEMPRES, pPCIDCFG, pPCFORM, pPCITEM, pPCPRPTY,
				pPCVALUE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_SET_CFGFORMPROPERTY
	// --START-PAC_IAX_MNTUSER.F_GET_PRODUCTOS(PCEMPRES)
	private HashMap callPAC_IAX_MNTUSER__F_GET_PRODUCTOS(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_PRODUCTOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_PRODUCTOS(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_PRODUCTOS(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTUSER.F_GET_PRODUCTOS

	// --START-PAC_IAX_MNTUSER.F_GET_CODFORM_N()
	private HashMap callPAC_IAX_MNTUSER__F_GET_CODFORM_N() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_CODFORM_N(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_CODFORM_N() throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_CODFORM_N();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_GET_CODFORM_N
	// --START-PAC_IAX_MNTUSER.F_GET_CODMODO_N()
	private HashMap callPAC_IAX_MNTUSER__F_GET_CODMODO_N() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_CODMODO_N(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_CODMODO_N() throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_CODMODO_N();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTUSER.F_GET_CODMODO_N
	// --START-PAC_IAX_MNTUSER.F_GET_CABCFGFORM(PCIDCFG, PCEMPRES, PCFORM, PCMODO,
	// PCCFGFORM, PSPRODUC)
	private HashMap callPAC_IAX_MNTUSER__F_GET_CABCFGFORM(java.math.BigDecimal pPCIDCFG, java.math.BigDecimal pPCEMPRES,
			String pPCFORM, String pPCMODO, String pPCCFGFORM, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTUSER.F_GET_CABCFGFORM(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCIDCFG", "pPCEMPRES", "pPCFORM", "pPCMODO", "pPCCFGFORM", "pPSPRODUC" },
				new Object[] { pPCIDCFG, pPCEMPRES, pPCFORM, pPCMODO, pPCCFGFORM, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCIDCFG);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCFORM);
		cStmt.setObject(5, pPCMODO);
		cStmt.setObject(6, pPCCFGFORM);
		cStmt.setObject(7, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_MNTUSER__F_GET_CABCFGFORM(java.math.BigDecimal pPCIDCFG,
			java.math.BigDecimal pPCEMPRES, String pPCFORM, String pPCMODO, String pPCCFGFORM,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_MNTUSER__F_GET_CABCFGFORM(pPCIDCFG, pPCEMPRES, pPCFORM, pPCMODO, pPCCFGFORM, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTUSER.F_GET_CABCFGFORM
}
