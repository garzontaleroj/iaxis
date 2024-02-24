package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GESTIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_GESTIONES.class);
	private Connection conn = null;

	public PAC_IAX_GESTIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_GESTIONES.F_DESEL_SERVICIO(PSSERVIC)
	private HashMap callPAC_IAX_GESTIONES__F_DESEL_SERVICIO(java.math.BigDecimal pPSSERVIC) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_DESEL_SERVICIO(?, ?)}";

		logCall(callQuery, new String[] { "pPSSERVIC" }, new Object[] { pPSSERVIC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSERVIC);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_DESEL_SERVICIO(java.math.BigDecimal pPSSERVIC) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_DESEL_SERVICIO(pPSSERVIC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTIONES.F_DESEL_SERVICIO
	// --START-PAC_IAX_GESTIONES.F_GET_DETGESTIONES(PSGESTIO, MENSAJES)
	private HashMap callPAC_IAX_GESTIONES__F_GET_DETGESTIONES(java.math.BigDecimal pPSGESTIO, Object pMENSAJES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_DETGESTIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSGESTIO", "pMENSAJES" }, new Object[] { pPSGESTIO, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSGESTIO);
		cStmt.setObject(4, pMENSAJES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMITA_DETGESTION".toUpperCase())); // Valor de
																								// "T_DETGESTIONES"
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
			retVal.put("T_DETGESTIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_DETGESTIONES", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_DETGESTIONES(java.math.BigDecimal pPSGESTIO, Object pMENSAJES)
			throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_DETGESTIONES(pPSGESTIO, pMENSAJES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_DETGESTIONES

	// --START-PAC_IAX_GESTIONES.F_GET_LSTESTADOS(PCTIPGES, PCTIPMOV)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTESTADOS(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCTIPMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTESTADOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPGES", "pPCTIPMOV" }, new Object[] { pPCTIPGES, pPCTIPMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPGES);
		cStmt.setObject(3, pPCTIPMOV);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTESTADOS(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCTIPMOV) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTESTADOS(pPCTIPGES, pPCTIPMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTESTADOS

	// --END-PAC_IAX_GESTIONES.F_GET_LSTESTADOS
	// --START-PAC_IAX_GESTIONES.F_GET_LSTGARANTIAS(PNSINIES, PCTIPGES)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTGARANTIAS(String pPNSINIES, java.math.BigDecimal pPCTIPGES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTGARANTIAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPCTIPGES" }, new Object[] { pPNSINIES, pPCTIPGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPCTIPGES);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTGARANTIAS(String pPNSINIES, java.math.BigDecimal pPCTIPGES)
			throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTGARANTIAS(pPNSINIES, pPCTIPGES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTGARANTIAS

	// --START-PAC_IAX_GESTIONES.F_GET_LSTLOCALIZACION(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTLOCALIZACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTLOCALIZACION

	// --START-PAC_IAX_GESTIONES.F_GET_LSTMOVIMIENTOS(PCTIPGES, PCESTGES, PCSUBGES,
	// MENSAJES)
	// --START-PAC_IAX_GESTIONES.F_GET_LSTMOVIMIENTOS(PCTIPGES, PCESTGES, PCSUBGES)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTMOVIMIENTOS(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCESTGES, java.math.BigDecimal pPCSUBGES) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTMOVIMIENTOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPGES", "pPCESTGES", "pPCSUBGES" },
				new Object[] { pPCTIPGES, pPCESTGES, pPCSUBGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPGES);
		cStmt.setObject(3, pPCESTGES);
		cStmt.setObject(4, pPCSUBGES);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTMOVIMIENTOS(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCESTGES, java.math.BigDecimal pPCSUBGES) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTMOVIMIENTOS(pPCTIPGES, pPCESTGES, pPCSUBGES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTMOVIMIENTOS

	// --END-PAC_IAX_GESTIONES.F_GET_LSTMOVIMIENTOS
	// --START-PAC_IAX_GESTIONES.F_GET_LSTPROFESIONAL(PNSINIES, PNTRAMIT, PNLOCALI,
	// PCTIPPRO, PCSUBPRO, PSGESTIO)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTPROFESIONAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSGESTIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTPROFESIONAL(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNLOCALI", "pPCTIPPRO", "pPCSUBPRO", "pPSGESTIO" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNLOCALI, pPCTIPPRO, pPCSUBPRO, pPSGESTIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNLOCALI);
		cStmt.setObject(5, pPCTIPPRO);
		cStmt.setObject(6, pPCSUBPRO);
		cStmt.setObject(7, pPSGESTIO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTPROFESIONAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSGESTIO) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTPROFESIONAL(pPNSINIES, pPNTRAMIT, pPNLOCALI, pPCTIPPRO, pPCSUBPRO,
				pPSGESTIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTPROFESIONAL

	// --START-PAC_IAX_GESTIONES.F_GET_LSTSEDES(PSPROFES)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTSEDES(java.math.BigDecimal pPSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTSEDES(?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES" }, new Object[] { pPSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTSEDES(java.math.BigDecimal pPSPROFES) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTSEDES(pPSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTSEDES

	// --START-PAC_IAX_GESTIONES.F_GET_LSTSERVICIOS(PSSERVIC, PTDESCRI, PSCONVEN,
	// PFECHA)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTSERVICIOS(java.math.BigDecimal pPSSERVIC, String pPTDESCRI,
			java.math.BigDecimal pPSCONVEN, java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTSERVICIOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSERVIC", "pPTDESCRI", "pPSCONVEN", "pPFECHA" },
				new Object[] { pPSSERVIC, pPTDESCRI, pPSCONVEN, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSERVIC);
		cStmt.setObject(3, pPTDESCRI);
		cStmt.setObject(4, pPSCONVEN);
		cStmt.setObject(5, pPFECHA);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTSERVICIOS(java.math.BigDecimal pPSSERVIC, String pPTDESCRI,
			java.math.BigDecimal pPSCONVEN, java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTSERVICIOS(pPSSERVIC, pPTDESCRI, pPSCONVEN, pPFECHA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTSERVICIOS

	// --START-PAC_IAX_GESTIONES.F_GET_LSTSUBESTADOS(PCTIPGES, PCESTGES, PCTIPMOV)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTSUBESTADOS(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCESTGES, java.math.BigDecimal pPCTIPMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTSUBESTADOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPGES", "pPCESTGES", "pPCTIPMOV" },
				new Object[] { pPCTIPGES, pPCESTGES, pPCTIPMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPGES);
		cStmt.setObject(3, pPCESTGES);
		cStmt.setObject(4, pPCTIPMOV);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTSUBESTADOS(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCESTGES, java.math.BigDecimal pPCTIPMOV) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTSUBESTADOS(pPCTIPGES, pPCESTGES, pPCTIPMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTSUBESTADOS

	// --START-PAC_IAX_GESTIONES.F_GET_LSTSUBPROF(PCTIPGES, PCTIPPRO)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTSUBPROF(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCTIPPRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTSUBPROF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPGES", "pPCTIPPRO" }, new Object[] { pPCTIPGES, pPCTIPPRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPGES);
		cStmt.setObject(3, pPCTIPPRO);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTSUBPROF(java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPCTIPPRO) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTSUBPROF(pPCTIPGES, pPCTIPPRO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTSUBPROF

	// --START-PAC_IAX_GESTIONES.F_GET_LSTTARIFAS(PSPROFES, PSPERSED, PFECHA,
	// PCCONVEN)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTTARIFAS(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPSPERSED, java.sql.Date pPFECHA, java.math.BigDecimal pPCCONVEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTTARIFAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES", "pPSPERSED", "pPFECHA", "pPCCONVEN" },
				new Object[] { pPSPROFES, pPSPERSED, pPFECHA, pPCCONVEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPSPERSED);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPCCONVEN);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTTARIFAS(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPSPERSED, java.sql.Date pPFECHA, java.math.BigDecimal pPCCONVEN) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTTARIFAS(pPSPROFES, pPSPERSED, pPFECHA, pPCCONVEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTTARIFAS

	// --START-PAC_IAX_GESTIONES.F_GET_LSTTIPGESTION(PNSINIES, PCTRAMIT)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTTIPGESTION(String pPNSINIES, java.math.BigDecimal pPCTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTTIPGESTION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPCTRAMIT" }, new Object[] { pPNSINIES, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPCTRAMIT);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTTIPGESTION(String pPNSINIES, java.math.BigDecimal pPCTRAMIT)
			throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTTIPGESTION(pPNSINIES, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTTIPGESTION

	// --START-PAC_IAX_GESTIONES.F_GET_LSTTIPPROF(PCTIPGES)
	private HashMap callPAC_IAX_GESTIONES__F_GET_LSTTIPPROF(java.math.BigDecimal pPCTIPGES) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_LSTTIPPROF(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPGES" }, new Object[] { pPCTIPGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPGES);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_LSTTIPPROF(java.math.BigDecimal pPCTIPGES) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_LSTTIPPROF(pPCTIPGES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_LSTTIPPROF

	// --START-PAC_IAX_GESTIONES.F_GET_MOVGESTIONES(PSGESTIO, MENSAJES)
	private HashMap callPAC_IAX_GESTIONES__F_GET_MOVGESTIONES(java.math.BigDecimal pPSGESTIO, Object pMENSAJES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_MOVGESTIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSGESTIO", "pMENSAJES" }, new Object[] { pPSGESTIO, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSGESTIO);
		cStmt.setObject(4, pMENSAJES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMITA_MOVGESTION".toUpperCase())); // Valor de
																								// "T_MOVGESTIONES"
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
			retVal.put("T_MOVGESTIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_MOVGESTIONES", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_MOVGESTIONES(java.math.BigDecimal pPSGESTIO, Object pMENSAJES)
			throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_MOVGESTIONES(pPSGESTIO, pMENSAJES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTIONES.F_GET_MOVGESTIONES
	// --START-PAC_IAX_GESTIONES.F_GET_OBJ_GESTION()
	private HashMap callPAC_IAX_GESTIONES__F_GET_OBJ_GESTION() throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_OBJ_GESTION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PSSEGURO"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PNSINIES"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNTRAMIT"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PNLOCALI"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCGARANT"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PSGESTIO"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PCTIPREG"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PCTIPGES"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PSPROFES"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "PCTIPPRO"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de "PCSUBPRO"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de "PSPERSED"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PSCONVEN"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de "PCCANCOM"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de "PCCOMDEF"
		cStmt.registerOutParameter(17, java.sql.Types.VARCHAR); // Valor de "PTREFEXT"
		cStmt.registerOutParameter(18, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSSEGURO", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PSSEGURO", null);
		}
		try {
			retVal.put("PNSINIES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNSINIES", null);
		}
		try {
			retVal.put("PNTRAMIT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNTRAMIT", null);
		}
		try {
			retVal.put("PNLOCALI", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PNLOCALI", null);
		}
		try {
			retVal.put("PCGARANT", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCGARANT", null);
		}
		try {
			retVal.put("PSGESTIO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PSGESTIO", null);
		}
		try {
			retVal.put("PCTIPREG", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCTIPREG", null);
		}
		try {
			retVal.put("PCTIPGES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCTIPGES", null);
		}
		try {
			retVal.put("PSPROFES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PSPROFES", null);
		}
		try {
			retVal.put("PCTIPPRO", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PCTIPPRO", null);
		}
		try {
			retVal.put("PCSUBPRO", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PCSUBPRO", null);
		}
		try {
			retVal.put("PSPERSED", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PSPERSED", null);
		}
		try {
			retVal.put("PSCONVEN", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PSCONVEN", null);
		}
		try {
			retVal.put("PCCANCOM", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PCCANCOM", null);
		}
		try {
			retVal.put("PCCOMDEF", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("PCCOMDEF", null);
		}
		try {
			retVal.put("PTREFEXT", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("PTREFEXT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_OBJ_GESTION() throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_OBJ_GESTION();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTIONES.F_GET_OBJ_GESTION
	// --START-PAC_IAX_GESTIONES.F_INI_SERVICIOS(MENSAJES)
	private HashMap callPAC_IAX_GESTIONES__F_INI_SERVICIOS(Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_INI_SERVICIOS(?)}";

		logCall(callQuery, new String[] { "pMENSAJES" }, new Object[] { pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pMENSAJES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_INI_SERVICIOS(Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_INI_SERVICIOS(pMENSAJES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTIONES.F_INI_SERVICIOS
	// --START-PAC_IAX_GESTIONES.F_SEL_SERVICIO(PSGESTIO, PSSERVIC, PTSERVIC,
	// PNVALSER, PNCANTID, PCUNIMED, PTUNIMED, PITOTAL, PCCODMON, PTMONEDA,
	// PCTIPCAL, PFCAMBIO)
	private HashMap callPAC_IAX_GESTIONES__F_SEL_SERVICIO(java.math.BigDecimal pPSGESTIO,
			java.math.BigDecimal pPSSERVIC, java.math.BigDecimal pPTSERVIC, java.math.BigDecimal pPNVALSER,
			java.math.BigDecimal pPNCANTID, java.math.BigDecimal pPCUNIMED, java.math.BigDecimal pPTUNIMED,
			java.math.BigDecimal pPITOTAL, java.math.BigDecimal pPCCODMON, java.math.BigDecimal pPTMONEDA,
			java.math.BigDecimal pPCTIPCAL, java.sql.Date pPFCAMBIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_SEL_SERVICIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSGESTIO", "pPSSERVIC", "pPTSERVIC", "pPNVALSER", "pPNCANTID", "pPCUNIMED",
						"pPTUNIMED", "pPITOTAL", "pPCCODMON", "pPTMONEDA", "pPCTIPCAL", "pPFCAMBIO" },
				new Object[] { pPSGESTIO, pPSSERVIC, pPTSERVIC, pPNVALSER, pPNCANTID, pPCUNIMED, pPTUNIMED, pPITOTAL,
						pPCCODMON, pPTMONEDA, pPCTIPCAL, pPFCAMBIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSGESTIO);
		cStmt.setObject(3, pPSSERVIC);
		cStmt.setObject(4, pPTSERVIC);
		cStmt.setObject(5, pPNVALSER);
		cStmt.setObject(6, pPNCANTID);
		cStmt.setObject(7, pPCUNIMED);
		cStmt.setObject(8, pPTUNIMED);
		cStmt.setObject(9, pPITOTAL);
		cStmt.setObject(10, pPCCODMON);
		cStmt.setObject(11, pPTMONEDA);
		cStmt.setObject(12, pPCTIPCAL);
		cStmt.setObject(13, pPFCAMBIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTIONES__F_SEL_SERVICIO(java.math.BigDecimal pPSGESTIO,
			java.math.BigDecimal pPSSERVIC, java.math.BigDecimal pPTSERVIC, java.math.BigDecimal pPNVALSER,
			java.math.BigDecimal pPNCANTID, java.math.BigDecimal pPCUNIMED, java.math.BigDecimal pPTUNIMED,
			java.math.BigDecimal pPITOTAL, java.math.BigDecimal pPCCODMON, java.math.BigDecimal pPTMONEDA,
			java.math.BigDecimal pPCTIPCAL, java.sql.Date pPFCAMBIO) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_SEL_SERVICIO(pPSGESTIO, pPSSERVIC, pPTSERVIC, pPNVALSER, pPNCANTID,
				pPCUNIMED, pPTUNIMED, pPITOTAL, pPCCODMON, pPTMONEDA, pPCTIPCAL, pPFCAMBIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_SEL_SERVICIO

	// --START-PAC_IAX_GESTIONES.F_SET_GESTION(PMODO, PSGESTIO, PSSEGURO, PNSINIES,
	// PNTRAMIT, PCGARANT, PCTIPREG, PCTIPGES, PSPROFES, PCTIPPRO, PCSUBPRO,
	// PSPERSED, PSCONVEN, PCCANCOM, PCCOMDEF, PTREFEXT, PCESTGES, PCSUBGES,
	// PNLOCALI, PFGESTIO, PSERVICIOS)
	private HashMap callPAC_IAX_GESTIONES__F_SET_GESTION(String pPMODO, java.math.BigDecimal pPSGESTIO,
			java.math.BigDecimal pPSSEGURO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCTIPREG, java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSPERSED, java.math.BigDecimal pPSCONVEN, java.math.BigDecimal pPCCANCOM,
			java.math.BigDecimal pPCCOMDEF, String pPTREFEXT, java.math.BigDecimal pPCESTGES,
			java.math.BigDecimal pPCSUBGES, java.math.BigDecimal pPNLOCALI, java.sql.Date pPFGESTIO, String pPSERVICIOS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_SET_GESTION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPMODO", "pPSGESTIO", "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPCGARANT", "pPCTIPREG",
						"pPCTIPGES", "pPSPROFES", "pPCTIPPRO", "pPCSUBPRO", "pPSPERSED", "pPSCONVEN", "pPCCANCOM",
						"pPCCOMDEF", "pPTREFEXT", "pPCESTGES", "pPCSUBGES", "pPNLOCALI", "pPFGESTIO", "pPSERVICIOS" },
				new Object[] { pPMODO, pPSGESTIO, pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCGARANT, pPCTIPREG, pPCTIPGES,
						pPSPROFES, pPCTIPPRO, pPCSUBPRO, pPSPERSED, pPSCONVEN, pPCCANCOM, pPCCOMDEF, pPTREFEXT,
						pPCESTGES, pPCSUBGES, pPNLOCALI, pPFGESTIO, pPSERVICIOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMODO);
		cStmt.setObject(3, pPSGESTIO);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPNSINIES);
		cStmt.setObject(6, pPNTRAMIT);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPCTIPREG);
		cStmt.setObject(9, pPCTIPGES);
		cStmt.setObject(10, pPSPROFES);
		cStmt.setObject(11, pPCTIPPRO);
		cStmt.setObject(12, pPCSUBPRO);
		cStmt.setObject(13, pPSPERSED);
		cStmt.setObject(14, pPSCONVEN);
		cStmt.setObject(15, pPCCANCOM);
		cStmt.setObject(16, pPCCOMDEF);
		cStmt.setObject(17, pPTREFEXT);
		cStmt.setObject(18, pPCESTGES);
		cStmt.setObject(19, pPCSUBGES);
		cStmt.setObject(20, pPNLOCALI);
		cStmt.setObject(21, pPFGESTIO);
		cStmt.setObject(22, pPSERVICIOS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(23, java.sql.Types.NUMERIC); // Valor de "PSGESTIO_OUT"
		cStmt.registerOutParameter(24, java.sql.Types.VARCHAR); // Valor de "PTLITERA"
		cStmt.registerOutParameter(25, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSGESTIO_OUT", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("PSGESTIO_OUT", null);
		}
		try {
			retVal.put("PTLITERA", cStmt.getObject(24));
		} catch (SQLException e) {
			retVal.put("PTLITERA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(25));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTIONES__F_SET_GESTION(String pPMODO, java.math.BigDecimal pPSGESTIO,
			java.math.BigDecimal pPSSEGURO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCTIPREG, java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSPERSED, java.math.BigDecimal pPSCONVEN, java.math.BigDecimal pPCCANCOM,
			java.math.BigDecimal pPCCOMDEF, String pPTREFEXT, java.math.BigDecimal pPCESTGES,
			java.math.BigDecimal pPCSUBGES, java.math.BigDecimal pPNLOCALI, java.sql.Date pPFGESTIO, String pPSERVICIOS)
			throws Exception {
		return this.callPAC_IAX_GESTIONES__F_SET_GESTION(pPMODO, pPSGESTIO, pPSSEGURO, pPNSINIES, pPNTRAMIT, pPCGARANT,
				pPCTIPREG, pPCTIPGES, pPSPROFES, pPCTIPPRO, pPCSUBPRO, pPSPERSED, pPSCONVEN, pPCCANCOM, pPCCOMDEF,
				pPTREFEXT, pPCESTGES, pPCSUBGES, pPNLOCALI, pPFGESTIO, pPSERVICIOS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_SET_GESTION

	// --START-PAC_IAX_GESTIONES.F_SET_MOVGESTION(PSGESTIO, PCTIPMOV, PCTIPGES,
	// PCESTGES, PCSUBGES, PTCOMENT)
	private HashMap callPAC_IAX_GESTIONES__F_SET_MOVGESTION(java.math.BigDecimal pPSGESTIO,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPCTIPGES, java.math.BigDecimal pPCESTGES,
			java.math.BigDecimal pPCSUBGES, String pPTCOMENT) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_SET_MOVGESTION(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSGESTIO", "pPCTIPMOV", "pPCTIPGES", "pPCESTGES", "pPCSUBGES", "pPTCOMENT" },
				new Object[] { pPSGESTIO, pPCTIPMOV, pPCTIPGES, pPCESTGES, pPCSUBGES, pPTCOMENT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSGESTIO);
		cStmt.setObject(3, pPCTIPMOV);
		cStmt.setObject(4, pPCTIPGES);
		cStmt.setObject(5, pPCESTGES);
		cStmt.setObject(6, pPCSUBGES);
		cStmt.setObject(7, pPTCOMENT);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_SET_MOVGESTION(java.math.BigDecimal pPSGESTIO,
			java.math.BigDecimal pPCTIPMOV, java.math.BigDecimal pPCTIPGES, java.math.BigDecimal pPCESTGES,
			java.math.BigDecimal pPCSUBGES, String pPTCOMENT) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_SET_MOVGESTION(pPSGESTIO, pPCTIPMOV, pPCTIPGES, pPCESTGES, pPCSUBGES,
				pPTCOMENT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_SET_MOVGESTION

	// --START-PAC_IAX_GESTIONES.F_SET_OBJ_GESTION(PSSEGURO, PNSINIES, PNTRAMIT,
	// PNLOCALI, PCGARANT, PSGESTIO, PCTIPREG, PCTIPGES, PSPROFES, PCTIPPRO,
	// PCSUBPRO, PSPERSED, PSCONVEN, PCCANCOM, PCCOMDEF, PTREFEXT, PTOBSERV)
	private HashMap callPAC_IAX_GESTIONES__F_SET_OBJ_GESTION(java.math.BigDecimal pPSSEGURO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSGESTIO, java.math.BigDecimal pPCTIPREG, java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSPERSED, java.math.BigDecimal pPSCONVEN, java.math.BigDecimal pPCCANCOM,
			java.math.BigDecimal pPCCOMDEF, String pPTREFEXT, String pPTOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_SET_OBJ_GESTION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPNLOCALI", "pPCGARANT", "pPSGESTIO",
						"pPCTIPREG", "pPCTIPGES", "pPSPROFES", "pPCTIPPRO", "pPCSUBPRO", "pPSPERSED", "pPSCONVEN",
						"pPCCANCOM", "pPCCOMDEF", "pPTREFEXT", "pPTOBSERV" },
				new Object[] { pPSSEGURO, pPNSINIES, pPNTRAMIT, pPNLOCALI, pPCGARANT, pPSGESTIO, pPCTIPREG, pPCTIPGES,
						pPSPROFES, pPCTIPPRO, pPCSUBPRO, pPSPERSED, pPSCONVEN, pPCCANCOM, pPCCOMDEF, pPTREFEXT,
						pPTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPNLOCALI);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPSGESTIO);
		cStmt.setObject(8, pPCTIPREG);
		cStmt.setObject(9, pPCTIPGES);
		cStmt.setObject(10, pPSPROFES);
		cStmt.setObject(11, pPCTIPPRO);
		cStmt.setObject(12, pPCSUBPRO);
		cStmt.setObject(13, pPSPERSED);
		cStmt.setObject(14, pPSCONVEN);
		cStmt.setObject(15, pPCCANCOM);
		cStmt.setObject(16, pPCCOMDEF);
		cStmt.setObject(17, pPTREFEXT);
		cStmt.setObject(18, pPTOBSERV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTIONES__F_SET_OBJ_GESTION(java.math.BigDecimal pPSSEGURO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSGESTIO, java.math.BigDecimal pPCTIPREG, java.math.BigDecimal pPCTIPGES,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSPERSED, java.math.BigDecimal pPSCONVEN, java.math.BigDecimal pPCCANCOM,
			java.math.BigDecimal pPCCOMDEF, String pPTREFEXT, String pPTOBSERV) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_SET_OBJ_GESTION(pPSSEGURO, pPNSINIES, pPNTRAMIT, pPNLOCALI, pPCGARANT,
				pPSGESTIO, pPCTIPREG, pPCTIPGES, pPSPROFES, pPCTIPPRO, pPCSUBPRO, pPSPERSED, pPSCONVEN, pPCCANCOM,
				pPCCOMDEF, pPTREFEXT, pPTOBSERV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_SET_OBJ_GESTION

	// --START-PAC_IAX_GESTIONES.F_GESTION_MODIFICABLE(PSGESTIO)
	private HashMap callPAC_IAX_GESTIONES__F_GESTION_MODIFICABLE(java.math.BigDecimal pPSGESTIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GESTION_MODIFICABLE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSGESTIO" }, new Object[] { pPSGESTIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSGESTIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PSI_O_NO"
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
			retVal.put("PSI_O_NO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PSI_O_NO", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GESTION_MODIFICABLE(java.math.BigDecimal pPSGESTIO) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GESTION_MODIFICABLE(pPSGESTIO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTIONES.F_GESTION_MODIFICABLE
	// --START-PAC_IAX_GESTIONES.F_GESTION_PERMITIDA(PNSINIES, PNTRAMIT, PCTIPGES)
	private HashMap callPAC_IAX_GESTIONES__F_GESTION_PERMITIDA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPGES) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GESTION_PERMITIDA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPCTIPGES" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPCTIPGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPCTIPGES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PTLITERA"
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
			retVal.put("PTLITERA", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PTLITERA", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GESTION_PERMITIDA(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPCTIPGES) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GESTION_PERMITIDA(pPNSINIES, pPNTRAMIT, pPCTIPGES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GESTION_PERMITIDA

	// --START-PAC_IAX_GESTIONES.F_SEL_SERVICIO(PSCONVEN, PNVALSER, PCCODMON,
	// PCTIPCAL)
	private HashMap callPAC_IAX_GESTIONES__F_SEL_SERVICIO(java.math.BigDecimal pPSCONVEN,
			java.math.BigDecimal pPNVALSER, String pPCCODMON, java.math.BigDecimal pPCTIPCAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_SEL_SERVICIO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONVEN", "pPNVALSER", "pPCCODMON", "pPCTIPCAL" },
				new Object[] { pPSCONVEN, pPNVALSER, pPCCODMON, pPCTIPCAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONVEN);
		cStmt.setObject(3, pPNVALSER);
		cStmt.setObject(4, pPCCODMON);
		cStmt.setObject(5, pPCTIPCAL);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PIPRECIO"
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
			retVal.put("PIPRECIO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PIPRECIO", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_SEL_SERVICIO(java.math.BigDecimal pPSCONVEN,
			java.math.BigDecimal pPNVALSER, String pPCCODMON, java.math.BigDecimal pPCTIPCAL) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_SEL_SERVICIO(pPSCONVEN, pPNVALSER, pPCCODMON, pPCTIPCAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_SEL_SERVICIO

	// --START-PAC_IAX_GESTIONES.F_GET_CFECHA(PCTIPGES)
	private HashMap callPAC_IAX_GESTIONES__F_GET_CFECHA(java.math.BigDecimal pPCTIPGES) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_CFECHA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPGES" }, new Object[] { pPCTIPGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPGES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCFECHA"
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
			retVal.put("PCFECHA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCFECHA", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_CFECHA(java.math.BigDecimal pPCTIPGES) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_CFECHA(pPCTIPGES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_CFECHA

	// --START-PAC_IAX_GESTIONES.F_USUARIO_PERMITIDO(PNSINIES, PNTRAMIT, PSGESTIO,
	// PCTIPMOV)
	private HashMap callPAC_IAX_GESTIONES__F_USUARIO_PERMITIDO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSGESTIO, java.math.BigDecimal pPCTIPMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_USUARIO_PERMITIDO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPSGESTIO", "pPCTIPMOV" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPSGESTIO, pPCTIPMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPSGESTIO);
		cStmt.setObject(5, pPCTIPMOV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCPERMIT"
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
			retVal.put("PCPERMIT", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCPERMIT", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_USUARIO_PERMITIDO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSGESTIO, java.math.BigDecimal pPCTIPMOV) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_USUARIO_PERMITIDO(pPNSINIES, pPNTRAMIT, pPSGESTIO, pPCTIPMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_USUARIO_PERMITIDO

	// --START-PAC_IAX_GESTIONES.F_GET_SERVICIOS(PSCONVEN, PSTARIFA, PNLINEA)
	private HashMap callPAC_IAX_GESTIONES__F_GET_SERVICIOS(java.math.BigDecimal pPSCONVEN,
			java.math.BigDecimal pPSTARIFA, java.math.BigDecimal pPNLINEA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_SERVICIOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONVEN", "pPSTARIFA", "pPNLINEA" },
				new Object[] { pPSCONVEN, pPSTARIFA, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONVEN);
		cStmt.setObject(3, pPSTARIFA);
		cStmt.setObject(4, pPNLINEA);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_SERVICIOS(java.math.BigDecimal pPSCONVEN,
			java.math.BigDecimal pPSTARIFA, java.math.BigDecimal pPNLINEA) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_SERVICIOS(pPSCONVEN, pPSTARIFA, pPNLINEA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_SERVICIOS

	// --START-PAC_IAX_GESTIONES.F_CANCELA_PANTALLA(PSCONVEN, PSPROFES, PNSINIES,
	// PNTRAMIT)
	private HashMap callPAC_IAX_GESTIONES__F_CANCELA_PANTALLA(java.math.BigDecimal pPSCONVEN,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_CANCELA_PANTALLA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONVEN", "pPSPROFES", "pPNSINIES", "pPNTRAMIT" },
				new Object[] { pPSCONVEN, pPSPROFES, pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONVEN);
		cStmt.setObject(3, pPSPROFES);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_CANCELA_PANTALLA(java.math.BigDecimal pPSCONVEN,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_GESTIONES__F_CANCELA_PANTALLA(pPSCONVEN, pPSPROFES, pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_CANCELA_PANTALLA

	// --START-PAC_IAX_GESTIONES.F_GET_ACCESO_TRAMITADOR(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_GESTIONES__F_GET_ACCESO_TRAMITADOR(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONES.F_GET_ACCESO_TRAMITADOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCCONVEN"
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
			retVal.put("PCCONVEN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCCONVEN", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONES__F_GET_ACCESO_TRAMITADOR(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_GESTIONES__F_GET_ACCESO_TRAMITADOR(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONES.F_GET_ACCESO_TRAMITADOR

}
