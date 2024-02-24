package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CFG extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CFG.class);
	private Connection conn = null;

	public PAC_IAX_CFG(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CFG.F_GET_DEF_FORM_PROPERTY()

	private HashMap callPAC_IAX_CFG__F_GET_DEF_FORM_PROPERTY() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_DEF_FORM_PROPERTY(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_DEF_FORM_PROPERTY() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_DEF_FORM_PROPERTY();
	}
	// --END-PAC_IAX_CFG.F_GET_DEF_FORM_PROPERTY
	/*
	 * //--START-PAC_IAX_CFG.F_GET_DEP_FORM_PROPERTY(PCFORM, PCMODO, PSPRODUC)
	 * private HashMap callPAC_IAX_CFG__F_GET_DEP_FORM_PROPERTY (String pPCFORM,
	 * String pPCMODO, java.math.BigDecimal pPSPRODUC) throws Exception { String
	 * callQuery = "{?=call PAC_IAX_CFG.F_GET_DEP_FORM_PROPERTY(?,?,?,?)}"; logCall
	 * (callQuery, new String[] {"pPCFORM", "pPCMODO", "pPSPRODUC"}, new Object[]
	 * {pPCFORM, pPCMODO, pPSPRODUC}); CallableStatement cStmt =
	 * conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject (2, pPCFORM);
	 * cStmt.setObject (3, pPCMODO); cStmt.setObject (4, pPSPRODUC);
	 * cStmt.registerOutParameter (1, oracle.jdbc.OracleTypes.CURSOR); // Valor de
	 * "RETURN" cStmt.registerOutParameter (5, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute (); HashMap retVal = new HashMap (); try{ retVal.put
	 * ("RETURN", cStmt.getObject (1)); }catch (SQLException e){ retVal.put
	 * ("RETURN", null); } try{ retVal.put ("MENSAJES", cStmt.getObject (5)); }catch
	 * (SQLException e){ retVal.put ("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_CFG__F_GET_DEP_FORM_PROPERTY (String pPCFORM,
	 * String pPCMODO, java.math.BigDecimal pPSPRODUC) throws Exception { return
	 * this.callPAC_IAX_CFG__F_GET_DEP_FORM_PROPERTY(pPCFORM, pPCMODO, pPSPRODUC); }
	 * //--END-PAC_IAX_CFG.F_GET_DEP_FORM_PROPERTY
	 */
	// --START-PAC_IAX_CFG.F_GET_FORM_PROPERTY(PCFORM, PCMODO, PSPRODUC)

	private HashMap callPAC_IAX_CFG__F_GET_FORM_PROPERTY(String pPCFORM, String pPCMODO, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_FORM_PROPERTY(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCFORM", "pPCMODO", "pPSPRODUC" },
				new Object[] { pPCFORM, pPCMODO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCFORM);
		cStmt.setObject(3, pPCMODO);
		cStmt.setObject(4, pPSPRODUC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_FORM_PROPERTY(String pPCFORM, String pPCMODO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_CFG__F_GET_FORM_PROPERTY(pPCFORM, pPCMODO, pPSPRODUC);
	}
	// --END-PAC_IAX_CFG.F_GET_FORM_PROPERTY
	// --START-PAC_IAX_CFG.F_GET_FORM_WIZARD(PCMODO, PSPRODUC, PCFORM, PCCAMPO,
	// PCTIPNVG)

	private HashMap callPAC_IAX_CFG__F_GET_FORM_WIZARD(String pPCMODO, java.math.BigDecimal pPSPRODUC, String pPCFORM,
			String pPCCAMPO, java.math.BigDecimal pPCTIPNVG) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_FORM_WIZARD(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCMODO", "pPSPRODUC", "pPCFORM", "pPCCAMPO", "pPCTIPNVG" },
				new Object[] { pPCMODO, pPSPRODUC, pPCFORM, pPCCAMPO, pPCTIPNVG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCFORM);
		cStmt.setObject(5, pPCCAMPO);
		cStmt.setObject(6, pPCTIPNVG);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(String pPCMODO, java.math.BigDecimal pPSPRODUC, String pPCFORM,
			String pPCCAMPO, java.math.BigDecimal pPCTIPNVG) throws Exception {
		return this.callPAC_IAX_CFG__F_GET_FORM_WIZARD(pPCMODO, pPSPRODUC, pPCFORM, pPCCAMPO, pPCTIPNVG);
	}
	// --END-PAC_IAX_CFG.F_GET_FORM_WIZARD
	// --START-PAC_IAX_CFG.F_GET_WIZARD(PCMODO, PSPRODUC)

	private HashMap callPAC_IAX_CFG__F_GET_WIZARD(String pPCMODO, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_WIZARD(?,?,?)}";
		logCall(callQuery, new String[] { "pPCMODO", "pPSPRODUC" }, new Object[] { pPCMODO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_WIZARD(String pPCMODO, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_CFG__F_GET_WIZARD(pPCMODO, pPSPRODUC);
	}
	// --END-PAC_IAX_CFG.F_GET_WIZARD
	// --START-PAC_IAX_CFG.F_GET_DEP_FORM_PROPERTY(PCFORM, PCMODO, PSPRODUC)

	private HashMap callPAC_IAX_CFG__F_GET_DEP_FORM_PROPERTY(String pPCFORM, String pPCMODO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_DEP_FORM_PROPERTY(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCFORM", "pPCMODO", "pPSPRODUC" },
				new Object[] { pPCFORM, pPCMODO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCFORM);
		cStmt.setObject(3, pPCMODO);
		cStmt.setObject(4, pPSPRODUC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_DEP_FORM_PROPERTY(String pPCFORM, String pPCMODO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_CFG__F_GET_DEP_FORM_PROPERTY(pPCFORM, pPCMODO, pPSPRODUC);
	}
	// --END-PAC_IAX_CFG.F_GET_DEP_FORM_PROPERTY

	// --START-PAC_IAX_CFG.F_GET_LST_CFGACCION()

	private HashMap callPAC_IAX_CFG__F_GET_LST_CFGACCION() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CFGACCION(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CFGACCION() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CFGACCION();
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CFGACCION
	// --START-PAC_IAX_CFG.F_GET_LST_CFGFORM()

	private HashMap callPAC_IAX_CFG__F_GET_LST_CFGFORM() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CFGFORM(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CFGFORM() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CFGFORM();
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CFGFORM
	// --START-PAC_IAX_CFG.F_GET_LST_CFGWIZARD()

	private HashMap callPAC_IAX_CFG__F_GET_LST_CFGWIZARD() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CFGWIZARD(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CFGWIZARD() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CFGWIZARD();
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CFGWIZARD
	// --START-PAC_IAX_CFG.F_GET_LST_ROLMENU()

	private HashMap callPAC_IAX_CFG__F_GET_LST_ROLMENU() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_ROLMENU(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_ROLMENU() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_ROLMENU();
	}
	// --END-PAC_IAX_CFG.F_GET_LST_ROLMENU

	// --START-PAC_IAX_CFG.F_GET_LST_CODSUPLEM()

	private HashMap callPAC_IAX_CFG__F_GET_LST_CODSUPLEM() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CODSUPLEM(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CODSUPLEM() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CODSUPLEM();
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CODSUPLEM

	// --START-PAC_IAX_CFG.F_GET_LST_CFGDOC()

	private HashMap callPAC_IAX_CFG__F_GET_LST_CFGDOC() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CFGDOC(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CFGDOC() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CFGDOC();
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CFGDOC
	// --START-PAC_IAX_CFG.F_ENVIAR_NOTIFICACION(PCEMPRES, PMODO, PTEVENTO,
	// PSPRODUC, PSSEGURO, PNRIESGO, PNSINIES, PCMOTMOV)

	private HashMap callPAC_IAX_CFG__F_ENVIAR_NOTIFICACION(java.math.BigDecimal pPCEMPRES, String pPMODO,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCMOTMOV)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_ENVIAR_NOTIFICACION(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPMODO", "pPTEVENTO", "pPSPRODUC", "pPSSEGURO", "pPNRIESGO", "pPNSINIES",
						"pPCMOTMOV" },
				new Object[] { pPCEMPRES, pPMODO, pPTEVENTO, pPSPRODUC, pPSSEGURO, pPNRIESGO, pPNSINIES, pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPMODO);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPSSEGURO);
		cStmt.setObject(7, pPNRIESGO);
		cStmt.setObject(8, pPNSINIES);
		cStmt.setObject(9, pPCMOTMOV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_ENVIAR_NOTIFICACION(java.math.BigDecimal pPCEMPRES, String pPMODO,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCMOTMOV)
			throws Exception {
		return this.callPAC_IAX_CFG__F_ENVIAR_NOTIFICACION(pPCEMPRES, pPMODO, pPTEVENTO, pPSPRODUC, pPSSEGURO,
				pPNRIESGO, pPNSINIES, pPCMOTMOV);
	}
	// --END-PAC_IAX_CFG.F_ENVIAR_NOTIFICACION

	// --START-PAC_IAX_CFG.F_GET_INFORMES(PCEMPRES, PCFORM, PTEVENTO, PSPRODUC)

	private HashMap callPAC_IAX_CFG__F_GET_INFORMES(java.math.BigDecimal pPCEMPRES, String pPCFORM, String pPTEVENTO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_INFORMES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCONFIGSINF"
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
			retVal.put("PCURCONFIGSINF", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCURCONFIGSINF", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_INFORMES(java.math.BigDecimal pPCEMPRES, String pPCFORM, String pPTEVENTO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_CFG__F_GET_INFORMES(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC);
	}
	// --END-PAC_IAX_CFG.F_GET_INFORMES

	// --START-PAC_IAX_CFG.F_EJECUTAR_INFORME(PCEMPRES, PCFORM, PTEVENTO, PSPRODUC,
	// PCMAP, PPARAMS)

	private HashMap callPAC_IAX_CFG__F_EJECUTAR_INFORME(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPPARAMS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_EJECUTAR_INFORME(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC", "pPCMAP", "pPPARAMS" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP, pPPARAMS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCMAP);
		cStmt.setObject(7, pPPARAMS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "VTIMP"
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
			retVal.put("VTIMP", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("VTIMP", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPPARAMS) throws Exception {
		return this.callPAC_IAX_CFG__F_EJECUTAR_INFORME(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP, pPPARAMS);
	}
	// --END-PAC_IAX_CFG.F_EJECUTAR_INFORME

	// --START-PAC_IAX_CFG.F_EJECUTAR_INFORME_BATCH(PCEMPRES, PCFORM, PTEVENTO,
	// PSPRODUC, PCMAP, PPARAMS, PSPROCES)

	private HashMap callPAC_IAX_CFG__F_EJECUTAR_INFORME_BATCH(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPPARAMS,
			java.math.BigDecimal pPSPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_EJECUTAR_INFORME_BATCH(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC", "pPCMAP", "pPPARAMS", "pPSPROCES" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP, pPPARAMS, pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCMAP);
		cStmt.setObject(7, pPPARAMS);
		cStmt.setObject(8, pPSPROCES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "VTIMP"
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
			retVal.put("VTIMP", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("VTIMP", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME_BATCH(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPPARAMS,
			java.math.BigDecimal pPSPROCES) throws Exception {
		return this.callPAC_IAX_CFG__F_EJECUTAR_INFORME_BATCH(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP,
				pPPARAMS, pPSPROCES);
	}
	// --END-PAC_IAX_CFG.F_EJECUTAR_INFORME_BATCH

	// --START-PAC_IAX_CFG.F_GET_LST_CACCPROD()

	private HashMap callPAC_IAX_CFG__F_GET_LST_CACCPROD() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CACCPROD(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CACCPROD() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CACCPROD();
	}

	// --END-PAC_IAX_CFG.F_GET_LST_CACCPROD
	// --START-PAC_IAX_CFG.F_GET_LST_CFGMAP()
	private HashMap callPAC_IAX_CFG__F_GET_LST_CFGMAP() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CFGMAP(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CFGMAP() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CFGMAP();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CFGMAP

	// --START-PAC_IAX_CFG.F_GET_LST_CFGROL()
	private HashMap callPAC_IAX_CFG__F_GET_LST_CFGROL() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CFGROL(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CFGROL() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CFGROL();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CFGROL

	// --START-PAC_IAX_CFG.F_GET_LST_USUAGRU()
	private HashMap callPAC_IAX_CFG__F_GET_LST_USUAGRU() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_USUAGRU(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_USUAGRU() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_USUAGRU();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CFG.F_GET_LST_USUAGRU
	// --START-PAC_IAX_CFG.F_NEW_ROL(PCROL, PTROL, PCIDIOMA, PCEMPRES, PCWIZARD,
	// PCFORM, PCACCION, PCMENU, PCCONSUPL, PCDOCUMENTACIO, PCACCPROD, PCMAP,
	// PCUSUAGRU, PCILIMITE)
	private HashMap callPAC_IAX_CFG__F_NEW_ROL(String pPCROL, String pPTROL, java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCEMPRES, String pPCWIZARD, String pPCFORM, String pPCACCION, String pPCMENU,
			String pPCCONSUPL, String pPCDOCUMENTACIO, String pPCACCPROD, String pPCMAP, String pPCUSUAGRU,
			java.math.BigDecimal pPCILIMITE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_NEW_ROL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCROL", "pPTROL", "pPCIDIOMA", "pPCEMPRES", "pPCWIZARD", "pPCFORM", "pPCACCION",
						"pPCMENU", "pPCCONSUPL", "pPCDOCUMENTACIO", "pPCACCPROD", "pPCMAP", "pPCUSUAGRU",
						"pPCILIMITE" },
				new Object[] { pPCROL, pPTROL, pPCIDIOMA, pPCEMPRES, pPCWIZARD, pPCFORM, pPCACCION, pPCMENU, pPCCONSUPL,
						pPCDOCUMENTACIO, pPCACCPROD, pPCMAP, pPCUSUAGRU, pPCILIMITE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCROL);
		cStmt.setObject(3, pPTROL);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.setObject(5, pPCEMPRES);
		cStmt.setObject(6, pPCWIZARD);
		cStmt.setObject(7, pPCFORM);
		cStmt.setObject(8, pPCACCION);
		cStmt.setObject(9, pPCMENU);
		cStmt.setObject(10, pPCCONSUPL);
		cStmt.setObject(11, pPCDOCUMENTACIO);
		cStmt.setObject(12, pPCACCPROD);
		cStmt.setObject(13, pPCMAP);
		cStmt.setObject(14, pPCUSUAGRU);
		cStmt.setObject(15, pPCILIMITE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_NEW_ROL(String pPCROL, String pPTROL, java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCEMPRES, String pPCWIZARD, String pPCFORM, String pPCACCION, String pPCMENU,
			String pPCCONSUPL, String pPCDOCUMENTACIO, String pPCACCPROD, String pPCMAP, String pPCUSUAGRU,
			java.math.BigDecimal pPCILIMITE) throws Exception {
		return this.callPAC_IAX_CFG__F_NEW_ROL(pPCROL, pPTROL, pPCIDIOMA, pPCEMPRES, pPCWIZARD, pPCFORM, pPCACCION,
				pPCMENU, pPCCONSUPL, pPCDOCUMENTACIO, pPCACCPROD, pPCMAP, pPCUSUAGRU, pPCILIMITE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CFG.F_NEW_ROL
	// --START-PAC_IAX_CFG.F_SET_ROL(PCROL, PTROL, PCIDIOMA, PCEMPRES, PCWIZARD,
	// PCFORM, PCACCION, PCMENU, PCCONSUPL, PCDOCUMENTACIO, PCACCPROD, PCMAP,
	// PCUSUAGRU, PCILIMITE)
	private HashMap callPAC_IAX_CFG__F_SET_ROL(String pPCROL, String pPTROL, java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCEMPRES, String pPCWIZARD, String pPCFORM, String pPCACCION, String pPCMENU,
			String pPCCONSUPL, String pPCDOCUMENTACIO, String pPCACCPROD, String pPCMAP, String pPCUSUAGRU,
			java.math.BigDecimal pPCILIMITE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_SET_ROL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCROL", "pPTROL", "pPCIDIOMA", "pPCEMPRES", "pPCWIZARD", "pPCFORM", "pPCACCION",
						"pPCMENU", "pPCCONSUPL", "pPCDOCUMENTACIO", "pPCACCPROD", "pPCMAP", "pPCUSUAGRU",
						"pPCILIMITE" },
				new Object[] { pPCROL, pPTROL, pPCIDIOMA, pPCEMPRES, pPCWIZARD, pPCFORM, pPCACCION, pPCMENU, pPCCONSUPL,
						pPCDOCUMENTACIO, pPCACCPROD, pPCMAP, pPCUSUAGRU, pPCILIMITE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCROL);
		cStmt.setObject(3, pPTROL);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.setObject(5, pPCEMPRES);
		cStmt.setObject(6, pPCWIZARD);
		cStmt.setObject(7, pPCFORM);
		cStmt.setObject(8, pPCACCION);
		cStmt.setObject(9, pPCMENU);
		cStmt.setObject(10, pPCCONSUPL);
		cStmt.setObject(11, pPCDOCUMENTACIO);
		cStmt.setObject(12, pPCACCPROD);
		cStmt.setObject(13, pPCMAP);
		cStmt.setObject(14, pPCUSUAGRU);
		cStmt.setObject(15, pPCILIMITE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_SET_ROL(String pPCROL, String pPTROL, java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCEMPRES, String pPCWIZARD, String pPCFORM, String pPCACCION, String pPCMENU,
			String pPCCONSUPL, String pPCDOCUMENTACIO, String pPCACCPROD, String pPCMAP, String pPCUSUAGRU,
			java.math.BigDecimal pPCILIMITE) throws Exception {
		return this.callPAC_IAX_CFG__F_SET_ROL(pPCROL, pPTROL, pPCIDIOMA, pPCEMPRES, pPCWIZARD, pPCFORM, pPCACCION,
				pPCMENU, pPCCONSUPL, pPCDOCUMENTACIO, pPCACCPROD, pPCMAP, pPCUSUAGRU, pPCILIMITE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CFG.F_SET_ROL

	// --START-PAC_IAX_CFG.F_GET_ROL(PCROL, PCEMPRES)
	private HashMap callPAC_IAX_CFG__F_GET_ROL(String pPCROL, java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_ROL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCROL", "pPCEMPRES" }, new Object[] { pPCROL, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCROL);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTROL"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PCWIZARD"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PCFORM"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PCACCION"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "PCMENU"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "PCCONSUPL"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "PCDOCUMENTACIO"
		cStmt.registerOutParameter(11, java.sql.Types.VARCHAR); // Valor de "PCACCPROD"
		cStmt.registerOutParameter(12, java.sql.Types.VARCHAR); // Valor de "PCMAP"
		cStmt.registerOutParameter(13, java.sql.Types.VARCHAR); // Valor de "PCUSUAGRU"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PCILIMITE"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PTROL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTROL", null);
		}
		try {
			retVal.put("PCWIZARD", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCWIZARD", null);
		}
		try {
			retVal.put("PCFORM", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCFORM", null);
		}
		try {
			retVal.put("PCACCION", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCACCION", null);
		}
		try {
			retVal.put("PCMENU", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCMENU", null);
		}
		try {
			retVal.put("PCCONSUPL", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCCONSUPL", null);
		}
		try {
			retVal.put("PCDOCUMENTACIO", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCDOCUMENTACIO", null);
		}
		try {
			retVal.put("PCACCPROD", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PCACCPROD", null);
		}
		try {
			retVal.put("PCMAP", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PCMAP", null);
		}
		try {
			retVal.put("PCUSUAGRU", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PCUSUAGRU", null);
		}
		try {
			retVal.put("PCILIMITE", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PCILIMITE", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_ROL(String pPCROL, java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_CFG__F_GET_ROL(pPCROL, pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CFG.F_GET_ROL
	// --START-PAC_IAX_CFG.F_GET_ROLES(PCROL, PTROL)
	private HashMap callPAC_IAX_CFG__F_GET_ROLES(String pPCROL, String pPTROL) throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_ROLES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCROL", "pPTROL" }, new Object[] { pPCROL, pPTROL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCROL);
		cStmt.setObject(3, pPTROL);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CFG__F_GET_ROLES(String pPCROL, String pPTROL) throws Exception {
		return this.callPAC_IAX_CFG__F_GET_ROLES(pPCROL, pPTROL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CFG.F_GET_ROLES

	// --START-PAC_IAX_CFG.F_GET_LST_CFGINF()

	private HashMap callPAC_IAX_CFG__F_GET_LST_CFGINF() throws Exception {
		String callQuery = "{?=call PAC_IAX_CFG.F_GET_LST_CFGINF(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CFG__F_GET_LST_CFGINF() throws Exception {
		return this.callPAC_IAX_CFG__F_GET_LST_CFGINF();
	}
	// --END-PAC_IAX_CFG.F_GET_LST_CFGINF

}
