//Revision:# VvrdIXEh6IaL4zp9yVh6vg== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_TRAMITE extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENDA.class);
	private Connection conn = null;

	public PAC_IAX_SIN_TRAMITE(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_TRAMITE.F_GET_CODTRAMITE(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_CODTRAMITE(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_CODTRAMITE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_CODTRAMITE(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_CODTRAMITE(pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_GET_CODTRAMITE

	// --START-PAC_IAX_SIN_TRAMITE.F_GET_OBJ_TRAMITE(PNTRAMTE)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE(java.math.BigDecimal pPNTRAMTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_OBJ_TRAMITE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNTRAMTE" }, new Object[] { pPNTRAMTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNTRAMTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMITE".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMITACION".toUpperCase())); // Valor de "PTRAMITACIONES"
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
			retVal.put("PTRAMITACIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTRAMITACIONES", null);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE(java.math.BigDecimal pPNTRAMTE) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE(pPNTRAMTE);
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_GET_OBJ_TRAMITE

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_SINTRAMITE(PNSINIES, PNTRAMTE,
	// PCTRAMTE)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE(String pPNSINIES, java.math.BigDecimal pPNTRAMTE,
			java.math.BigDecimal pPCTRAMTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_SINTRAMITE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMTE", "pPCTRAMTE" },
				new Object[] { pPNSINIES, pPNTRAMTE, pPCTRAMTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMTE);
		cStmt.setObject(4, pPCTRAMTE);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE(String pPNSINIES, java.math.BigDecimal pPNTRAMTE,
			java.math.BigDecimal pPCTRAMTE) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE(pPNSINIES, pPNTRAMTE, pPCTRAMTE);
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_SINTRAMITE

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_IAX_SIN_RECOBRO(PNSINIES, PNTRAMTE,
	// PFPRESCRIP, PIRECLAMT, PIRECOBT, PICONCURR, PIRCIVIL, PIASSEGUR, PCRESRECOB,
	// PCDESTIM, PNREFGES, PCTIPREC)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_RECOBRO(String pPNSINIES, java.math.BigDecimal pPNTRAMTE,
			java.sql.Date pPFPRESCRIP, java.math.BigDecimal pPIRECLAMT, java.math.BigDecimal pPIRECOBT,
			java.math.BigDecimal pPICONCURR, java.math.BigDecimal pPIRCIVIL, java.math.BigDecimal pPIASSEGUR,
			java.math.BigDecimal pPCRESRECOB, java.math.BigDecimal pPCDESTIM, java.math.BigDecimal pPNREFGES,
			java.math.BigDecimal pPCTIPREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_IAX_SIN_RECOBRO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMTE", "pPFPRESCRIP", "pPIRECLAMT", "pPIRECOBT", "pPICONCURR",
						"pPIRCIVIL", "pPIASSEGUR", "pPCRESRECOB", "pPCDESTIM", "pPNREFGES", "pPCTIPREC" },
				new Object[] { pPNSINIES, pPNTRAMTE, pPFPRESCRIP, pPIRECLAMT, pPIRECOBT, pPICONCURR, pPIRCIVIL,
						pPIASSEGUR, pPCRESRECOB, pPCDESTIM, pPNREFGES, pPCTIPREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMTE);
		cStmt.setObject(4, pPFPRESCRIP);
		cStmt.setObject(5, pPIRECLAMT);
		cStmt.setObject(6, pPIRECOBT);
		cStmt.setObject(7, pPICONCURR);
		cStmt.setObject(8, pPIRCIVIL);
		cStmt.setObject(9, pPIASSEGUR);
		cStmt.setObject(10, pPCRESRECOB);
		cStmt.setObject(11, pPCDESTIM);
		cStmt.setObject(12, pPNREFGES);
		cStmt.setObject(13, pPCTIPREC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_RECOBRO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, java.sql.Date pPFPRESCRIP, java.math.BigDecimal pPIRECLAMT,
			java.math.BigDecimal pPIRECOBT, java.math.BigDecimal pPICONCURR, java.math.BigDecimal pPIRCIVIL,
			java.math.BigDecimal pPIASSEGUR, java.math.BigDecimal pPCRESRECOB, java.math.BigDecimal pPCDESTIM,
			java.math.BigDecimal pPNREFGES, java.math.BigDecimal pPCTIPREC) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_RECOBRO(pPNSINIES, pPNTRAMTE, pPFPRESCRIP, pPIRECLAMT,
				pPIRECOBT, pPICONCURR, pPIRCIVIL, pPIASSEGUR, pPCRESRECOB, pPCDESTIM, pPNREFGES, pPCTIPREC);
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_IAX_SIN_RECOBRO

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_IAX_SIN_LESIONES(PNSINIES, PNTRAMTE,
	// PNLESIONES, PNMUERTOS, PAGRAVANTES, PCGRADORESP, PCTIPLESIONES, PCTIPHOS)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_LESIONES(String pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, java.math.BigDecimal pPNLESIONES, java.math.BigDecimal pPNMUERTOS,
			String pPAGRAVANTES, java.math.BigDecimal pPCGRADORESP, java.math.BigDecimal pPCTIPLESIONES,
			java.math.BigDecimal pPCTIPHOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_IAX_SIN_LESIONES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMTE", "pPNLESIONES", "pPNMUERTOS", "pPAGRAVANTES", "pPCGRADORESP",
						"pPCTIPLESIONES", "pPCTIPHOS" },
				new Object[] { pPNSINIES, pPNTRAMTE, pPNLESIONES, pPNMUERTOS, pPAGRAVANTES, pPCGRADORESP,
						pPCTIPLESIONES, pPCTIPHOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMTE);
		cStmt.setObject(4, pPNLESIONES);
		cStmt.setObject(5, pPNMUERTOS);
		cStmt.setObject(6, pPAGRAVANTES);
		cStmt.setObject(7, pPCGRADORESP);
		cStmt.setObject(8, pPCTIPLESIONES);
		cStmt.setObject(9, pPCTIPHOS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_LESIONES(String pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, java.math.BigDecimal pPNLESIONES, java.math.BigDecimal pPNMUERTOS,
			String pPAGRAVANTES, java.math.BigDecimal pPCGRADORESP, java.math.BigDecimal pPCTIPLESIONES,
			java.math.BigDecimal pPCTIPHOS) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_LESIONES(pPNSINIES, pPNTRAMTE, pPNLESIONES, pPNMUERTOS,
				pPAGRAVANTES, pPCGRADORESP, pPCTIPLESIONES, pPCTIPHOS);
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_IAX_SIN_LESIONES

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_SINTRAMITE_ASIST(PNSINIES, PNTRAMTE,
	// PTREFEXT, PCCIAASIS)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE_ASIST(String pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, String pPTREFEXT, java.math.BigDecimal pPCCIAASIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_SINTRAMITE_ASIST(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMTE", "pPTREFEXT", "pPCCIAASIS" },
				new Object[] { pPNSINIES, pPNTRAMTE, pPTREFEXT, pPCCIAASIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMTE);
		cStmt.setObject(4, pPTREFEXT);
		cStmt.setObject(5, pPCCIAASIS);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE_ASIST(String pPNSINIES,
			java.math.BigDecimal pPNTRAMTE, String pPTREFEXT, java.math.BigDecimal pPCCIAASIS) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE_ASIST(pPNSINIES, pPNTRAMTE, pPTREFEXT, pPCCIAASIS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_SINTRAMITE_ASIST

	// --START-PAC_IAX_SIN_TRAMITE.F_GET_LISTA_PERSONASREL(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_LISTA_PERSONASREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_LISTA_PERSONASREL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIN_TRAMI_PERSONAREL".toUpperCase())); // Valor de "PLISTAPERSREL"
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
			retVal.put("PLISTAPERSREL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PLISTAPERSREL", null);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_LISTA_PERSONASREL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_LISTA_PERSONASREL(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_GET_LISTA_PERSONASREL
	// --START-PAC_IAX_SIN_TRAMITE.F_GET_TRAMITE9999(PNSINIES)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE9999(java.math.BigDecimal pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_TRAMITE9999(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNTRAMIT"
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
			retVal.put("PNTRAMIT", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNTRAMIT", null);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE9999(java.math.BigDecimal pPNSINIES) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE9999(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_GET_TRAMITE9999
	// --START-PAC_IAX_SIN_TRAMITE.F_GET_PROCESOS_JUDICIALES(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_JUDICIALES(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_PROCESOS_JUDICIALES(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_JUDICIALES(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_JUDICIALES(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_GET_PROCESOS_JUDICIALES
	// --START-PAC_IAX_SIN_TRAMITE.F_INI_OBJ_JUDICIAL(PNSINIES, PNTRAMIT, PNORDEN)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_INI_OBJ_JUDICIAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_INI_OBJ_JUDICIAL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMITA_JUDICIAL".toUpperCase())); // Valor de "PROCESO"
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
			retVal.put("PROCESO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PROCESO", null);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_INI_OBJ_JUDICIAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_INI_OBJ_JUDICIAL(pPNSINIES, pPNTRAMIT, pPNORDEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_INI_OBJ_JUDICIAL

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL(PNSINIES, PNTRAMIT, PNORDEN,
	// PCPROCESO, PTPROCESO, PCPOSTAL, PCPOBLAC, PCPROVIN, PTIEXTERNO, PSPROFES,
	// PFRECEP, PFNOTIFI, PFVENCIMI, PFRESPUES, PFCONCIL, PFDESVIN, PTPRETEN,
	// PTEXCEP1, PTEXCEP2, PCCONTI, PCDESPA, PCDESCF, PCPROVINF, PCPOBLACF,
	// PCDESPAO, PCDESCO, PCPROVINO, PCPOBLACO, PCPOSICI, PCDEMAND, PSAPODERA,
	// PIDEMAND, PFTDEMAN, PICONDEN, PCSENTEN, PFSENTE1, PCSENTEN2, PFSENTE2,
	// PCASACION, PFCASACI, PCTSENTE, PFTSENTE, PVTSENTE, PTFALLO)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPTPROCESO,
			String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, String pPTIEXTERNO,
			java.math.BigDecimal pPSPROFES, java.sql.Date pPFRECEP, java.sql.Date pPFNOTIFI, java.sql.Date pPFVENCIMI,
			java.sql.Date pPFRESPUES, java.sql.Date pPFCONCIL, java.sql.Date pPFDESVIN, String pPTPRETEN,
			String pPTEXCEP1, String pPTEXCEP2, java.math.BigDecimal pPCCONTI, java.math.BigDecimal pPCDESPA,
			String pPCDESCF, java.math.BigDecimal pPCPROVINF, java.math.BigDecimal pPCPOBLACF,
			java.math.BigDecimal pPCDESPAO, String pPCDESCO, java.math.BigDecimal pPCPROVINO,
			java.math.BigDecimal pPCPOBLACO, java.math.BigDecimal pPCPOSICI, java.math.BigDecimal pPCDEMAND,
			java.math.BigDecimal pPSAPODERA, java.math.BigDecimal pPIDEMAND, java.sql.Date pPFTDEMAN,
			java.math.BigDecimal pPICONDEN, java.math.BigDecimal pPCSENTEN, java.sql.Date pPFSENTE1,
			java.math.BigDecimal pPCSENTEN2, java.sql.Date pPFSENTE2, java.math.BigDecimal pPCASACION,
			java.sql.Date pPFCASACI, java.math.BigDecimal pPCTSENTE, java.sql.Date pPFTSENTE, String pPVTSENTE,
			String pPTFALLO, java.math.BigDecimal pCORALPROC, java.math.BigDecimal pUNICAINST,
			java.sql.Date pFUNICAINST) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPCPROCESO", "pPTPROCESO", "pPCPOSTAL",
						"pPCPOBLAC", "pPCPROVIN", "pPTIEXTERNO", "pPSPROFES", "pPFRECEP", "pPFNOTIFI", "pPFVENCIMI",
						"pPFRESPUES", "pPFCONCIL", "pPFDESVIN", "pPTPRETEN", "pPTEXCEP1", "pPTEXCEP2", "pPCCONTI",
						"pPCDESPA", "pPCDESCF", "pPCPROVINF", "pPCPOBLACF", "pPCDESPAO", "pPCDESCO", "pPCPROVINO",
						"pPCPOBLACO", "pPCPOSICI", "pPCDEMAND", "pPSAPODERA", "pPIDEMAND", "pPFTDEMAN", "pPICONDEN",
						"pPCSENTEN", "pPFSENTE1", "pPCSENTEN2", "pPFSENTE2", "pPCASACION", "pPFCASACI", "pPCTSENTE",
						"pPFTSENTE", "pPVTSENTE", "pPTFALLO", "pCORALPROC", "pUNICAINST", "pFUNICAINST" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN, pPCPROCESO, pPTPROCESO, pPCPOSTAL, pPCPOBLAC, pPCPROVIN,
						pPTIEXTERNO, pPSPROFES, pPFRECEP, pPFNOTIFI, pPFVENCIMI, pPFRESPUES, pPFCONCIL, pPFDESVIN,
						pPTPRETEN, pPTEXCEP1, pPTEXCEP2, pPCCONTI, pPCDESPA, pPCDESCF, pPCPROVINF, pPCPOBLACF,
						pPCDESPAO, pPCDESCO, pPCPROVINO, pPCPOBLACO, pPCPOSICI, pPCDEMAND, pPSAPODERA, pPIDEMAND,
						pPFTDEMAN, pPICONDEN, pPCSENTEN, pPFSENTE1, pPCSENTEN2, pPFSENTE2, pPCASACION, pPFCASACI,
						pPCTSENTE, pPFTSENTE, pPVTSENTE, pPTFALLO, pCORALPROC, pUNICAINST, pFUNICAINST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPCPROCESO);
		cStmt.setObject(6, pPTPROCESO);
		cStmt.setObject(7, pPCPOSTAL);
		cStmt.setObject(8, pPCPOBLAC);
		cStmt.setObject(9, pPCPROVIN);
		cStmt.setObject(10, pPTIEXTERNO);
		cStmt.setObject(11, pPSPROFES);
		cStmt.setObject(12, pPFRECEP);
		cStmt.setObject(13, pPFNOTIFI);
		cStmt.setObject(14, pPFVENCIMI);
		cStmt.setObject(15, pPFRESPUES);
		cStmt.setObject(16, pPFCONCIL);
		cStmt.setObject(17, pPFDESVIN);
		cStmt.setObject(18, pPTPRETEN);
		cStmt.setObject(19, pPTEXCEP1);
		cStmt.setObject(20, pPTEXCEP2);
		cStmt.setObject(21, pPCCONTI);
		cStmt.setObject(22, pPCDESPA);
		cStmt.setObject(23, pPCDESCF);
		cStmt.setObject(24, pPCPROVINF);
		cStmt.setObject(25, pPCPOBLACF);
		cStmt.setObject(26, pPCDESPAO);
		cStmt.setObject(27, pPCDESCO);
		cStmt.setObject(28, pPCPROVINO);
		cStmt.setObject(29, pPCPOBLACO);
		cStmt.setObject(30, pPCPOSICI);
		cStmt.setObject(31, pPCDEMAND);
		cStmt.setObject(32, pPSAPODERA);
		cStmt.setObject(33, pPIDEMAND);
		cStmt.setObject(34, pPFTDEMAN);
		cStmt.setObject(35, pPICONDEN);
		cStmt.setObject(36, pPCSENTEN);
		cStmt.setObject(37, pPFSENTE1);
		cStmt.setObject(38, pPCSENTEN2);
		cStmt.setObject(39, pPFSENTE2);
		cStmt.setObject(40, pPCASACION);
		cStmt.setObject(41, pPFCASACI);
		cStmt.setObject(42, pPCTSENTE);
		cStmt.setObject(43, pPFTSENTE);
		cStmt.setObject(44, pPVTSENTE);
		cStmt.setObject(45, pPTFALLO);
		cStmt.setObject(46, pCORALPROC);
		cStmt.setObject(47, pUNICAINST);
		cStmt.setObject(48, pFUNICAINST);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(49, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(46));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPTPROCESO,
			String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, String pPTIEXTERNO,
			java.math.BigDecimal pPSPROFES, java.sql.Date pPFRECEP, java.sql.Date pPFNOTIFI, java.sql.Date pPFVENCIMI,
			java.sql.Date pPFRESPUES, java.sql.Date pPFCONCIL, java.sql.Date pPFDESVIN, String pPTPRETEN,
			String pPTEXCEP1, String pPTEXCEP2, java.math.BigDecimal pPCCONTI, java.math.BigDecimal pPCDESPA,
			String pPCDESCF, java.math.BigDecimal pPCPROVINF, java.math.BigDecimal pPCPOBLACF,
			java.math.BigDecimal pPCDESPAO, String pPCDESCO, java.math.BigDecimal pPCPROVINO,
			java.math.BigDecimal pPCPOBLACO, java.math.BigDecimal pPCPOSICI, java.math.BigDecimal pPCDEMAND,
			java.math.BigDecimal pPSAPODERA, java.math.BigDecimal pPIDEMAND, java.sql.Date pPFTDEMAN,
			java.math.BigDecimal pPICONDEN, java.math.BigDecimal pPCSENTEN, java.sql.Date pPFSENTE1,
			java.math.BigDecimal pPCSENTEN2, java.sql.Date pPFSENTE2, java.math.BigDecimal pPCASACION,
			java.sql.Date pPFCASACI, java.math.BigDecimal pPCTSENTE, java.sql.Date pPFTSENTE, String pPVTSENTE,
			String pPTFALLO, java.math.BigDecimal pCORALPROC, java.math.BigDecimal pUNICAINST,
			java.sql.Date pFUNICAINST) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL(pPNSINIES, pPNTRAMIT, pPNORDEN, pPCPROCESO, pPTPROCESO,
				pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPTIEXTERNO, pPSPROFES, pPFRECEP, pPFNOTIFI, pPFVENCIMI, pPFRESPUES,
				pPFCONCIL, pPFDESVIN, pPTPRETEN, pPTEXCEP1, pPTEXCEP2, pPCCONTI, pPCDESPA, pPCDESCF, pPCPROVINF,
				pPCPOBLACF, pPCDESPAO, pPCDESCO, pPCPROVINO, pPCPOBLACO, pPCPOSICI, pPCDEMAND, pPSAPODERA, pPIDEMAND,
				pPFTDEMAN, pPICONDEN, pPCSENTEN, pPFSENTE1, pPCSENTEN2, pPFSENTE2, pPCASACION, pPFCASACI, pPCTSENTE,
				pPFTSENTE, pPVTSENTE, pPTFALLO, pCORALPROC, pUNICAINST, pFUNICAINST);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_DETPER(PNSINIES, PNTRAMIT,
	// PNORDEN, PNROL, PNPERSONA, PNTIPPER, PNNUMIDE, PTNOMBRE, PIIMPORTE)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_DETPER(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNROL, java.math.BigDecimal pPNPERSONA,
			java.math.BigDecimal pPNTIPPER, String pPNNUMIDE, String pPTNOMBRE, java.math.BigDecimal pPIIMPORTE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_DETPER(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPNROL", "pPNPERSONA", "pPNTIPPER", "pPNNUMIDE",
						"pPTNOMBRE", "pPIIMPORTE" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN, pPNROL, pPNPERSONA, pPNTIPPER, pPNNUMIDE, pPTNOMBRE,
						pPIIMPORTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPNROL);
		cStmt.setObject(6, pPNPERSONA);
		cStmt.setObject(7, pPNTIPPER);
		cStmt.setObject(8, pPNNUMIDE);
		cStmt.setObject(9, pPTNOMBRE);
		cStmt.setObject(10, pPIIMPORTE);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_DETPER(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNROL,
			java.math.BigDecimal pPNPERSONA, java.math.BigDecimal pPNTIPPER, String pPNNUMIDE, String pPTNOMBRE,
			java.math.BigDecimal pPIIMPORTE) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_DETPER(pPNSINIES, pPNTRAMIT, pPNORDEN, pPNROL,
				pPNPERSONA, pPNTIPPER, pPNNUMIDE, pPTNOMBRE, pPIIMPORTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_DETPER

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_VALPRET(PNSINIES, PNTRAMIT,
	// PNORDEN, PCGARANT, PIPRETEN)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_VALPRET(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPIPRETEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_VALPRET(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPCGARANT", "pPIPRETEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN, pPCGARANT, pPIPRETEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPIPRETEN);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_VALPRET(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPIPRETEN) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_VALPRET(pPNSINIES, pPNTRAMIT, pPNORDEN, pPCGARANT,
				pPIPRETEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_VALPRET
	// --START-PAC_IAX_SIN_TRAMITE.F_TRASPASAR_JUDICIAL(PROCESO)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_TRASPASAR_JUDICIAL(Object pPROCESO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_TRASPASAR_JUDICIAL(?, ?)}";

		logCall(callQuery, new String[] { "pPROCESO" }, new Object[] { pPROCESO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPROCESO);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_TRASPASAR_JUDICIAL(Object pPROCESO) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_TRASPASAR_JUDICIAL(pPROCESO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_TRASPASAR_JUDICIAL
	// --START-PAC_IAX_SIN_TRAMITE.F_VALIDAR_JUDICIAL(PROCESO)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_VALIDAR_JUDICIAL(Object pPROCESO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_VALIDAR_JUDICIAL(?, ?)}";

		logCall(callQuery, new String[] { "pPROCESO" }, new Object[] { pPROCESO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPROCESO);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_VALIDAR_JUDICIAL(Object pPROCESO) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_VALIDAR_JUDICIAL(pPROCESO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_VALIDAR_JUDICIAL

	// --START-PAC_IAX_SIN_TRAMITE.F_GET_OBJ_JUDICIAL(PNSINIES, PNTRAMIT, PNORDEN)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_OBJ_JUDICIAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_OBJ_JUDICIAL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMITA_JUDICIAL".toUpperCase())); // Valor de "OBJUDICIAL"
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
			retVal.put("OBJUDICIAL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OBJUDICIAL", null);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_JUDICIAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_OBJ_JUDICIAL(pPNSINIES, pPNTRAMIT, pPNORDEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_GET_OBJ_JUDICIAL
	// --START-PAC_IAX_SIN_TRAMITE.F_ELIMINA_DATO_JUDICIAL(PCTIPO, PNSINIES,
	// PNTRAMIT, PNORDEN, PNVALOR)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_JUDICIAL(java.math.BigDecimal pPCTIPO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNVALOR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_ELIMINA_DATO_JUDICIAL(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPO", "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPNVALOR" },
				new Object[] { pPCTIPO, pPNSINIES, pPNTRAMIT, pPNORDEN, pPNVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPNORDEN);
		cStmt.setObject(6, pPNVALOR);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_JUDICIAL(java.math.BigDecimal pPCTIPO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNVALOR)
			throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_JUDICIAL(pPCTIPO, pPNSINIES, pPNTRAMIT, pPNORDEN, pPNVALOR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_ELIMINA_DATO_JUDICIAL
	// --START-PAC_IAX_SIN_TRAMITE.F_GET_OBJ_FISCAL(PNSINIES, PNTRAMIT, PNORDEN)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_OBJ_FISCAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_OBJ_FISCAL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_TRAMITA_FISCAL".toUpperCase())); // Valor de "OBJFISCAL"
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
			retVal.put("OBJFISCAL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OBJFISCAL", null);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_FISCAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_OBJ_FISCAL(pPNSINIES, pPNTRAMIT, pPNORDEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_GET_OBJ_FISCAL
	// --START-PAC_IAX_SIN_TRAMITE.F_GET_PROCESOS_FISCALES(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_FISCALES(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_PROCESOS_FISCALES(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_FISCALES(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_FISCALES(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_GET_PROCESOS_FISCALES

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_FISCAL(PNSINIES, PNTRAMIT, PNORDEN,
	// PFAPERTU, PFIMPUTA, PFNOTIFI, PFAUDIEN, PHAUDIEN, PCAUDIEN, PSPROFES,
	// PCOTERRI, PCPROVIN, PCCONTRA, PCUESPEC, PTCONTRA, PCTIPTRA, PTESTADO,
	// PCMEDIO, PFDESCAR, PFFALLO, PCFALLO, PTFALLO, PCRECURSO, PCTRAMITAD)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN, java.sql.Date pPFAPERTU, java.sql.Date pPFIMPUTA, java.sql.Date pPFNOTIFI,
			java.sql.Date pPFAUDIEN, String pPHAUDIEN, java.math.BigDecimal pPCAUDIEN, java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCOTERRI, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCCONTRA,
			java.math.BigDecimal pPCUESPEC, String pPTCONTRA, java.math.BigDecimal pPCTIPTRA, String pPTESTADO,
			java.math.BigDecimal pPCMEDIO, java.sql.Date pPFDESCAR, java.sql.Date pPFFALLO,
			java.math.BigDecimal pPCFALLO, String pPTFALLO, java.math.BigDecimal pPCRECURSO, String pPCTRAMITAD)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_FISCAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPFAPERTU", "pPFIMPUTA", "pPFNOTIFI", "pPFAUDIEN",
						"pPHAUDIEN", "pPCAUDIEN", "pPSPROFES", "pPCOTERRI", "pPCPROVIN", "pPCCONTRA", "pPCUESPEC",
						"pPTCONTRA", "pPCTIPTRA", "pPTESTADO", "pPCMEDIO", "pPFDESCAR", "pPFFALLO", "pPCFALLO",
						"pPTFALLO", "pPCRECURSO", "pPCTRAMITAD" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN, pPFAPERTU, pPFIMPUTA, pPFNOTIFI, pPFAUDIEN, pPHAUDIEN,
						pPCAUDIEN, pPSPROFES, pPCOTERRI, pPCPROVIN, pPCCONTRA, pPCUESPEC, pPTCONTRA, pPCTIPTRA,
						pPTESTADO, pPCMEDIO, pPFDESCAR, pPFFALLO, pPCFALLO, pPTFALLO, pPCRECURSO, pPCTRAMITAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPFAPERTU);
		cStmt.setObject(6, pPFIMPUTA);
		cStmt.setObject(7, pPFNOTIFI);
		cStmt.setObject(8, pPFAUDIEN);
		cStmt.setObject(9, pPHAUDIEN);
		cStmt.setObject(10, pPCAUDIEN);
		cStmt.setObject(11, pPSPROFES);
		cStmt.setObject(12, pPCOTERRI);
		cStmt.setObject(13, pPCPROVIN);
		cStmt.setObject(14, pPCCONTRA);
		cStmt.setObject(15, pPCUESPEC);
		cStmt.setObject(16, pPTCONTRA);
		cStmt.setObject(17, pPCTIPTRA);
		cStmt.setObject(18, pPTESTADO);
		cStmt.setObject(19, pPCMEDIO);
		cStmt.setObject(20, pPFDESCAR);
		cStmt.setObject(21, pPFFALLO);
		cStmt.setObject(22, pPCFALLO);
		cStmt.setObject(23, pPTFALLO);
		cStmt.setObject(24, pPCRECURSO);
		cStmt.setObject(25, pPCTRAMITAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(26, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(26));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN, java.sql.Date pPFAPERTU, java.sql.Date pPFIMPUTA, java.sql.Date pPFNOTIFI,
			java.sql.Date pPFAUDIEN, String pPHAUDIEN, java.math.BigDecimal pPCAUDIEN, java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCOTERRI, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCCONTRA,
			java.math.BigDecimal pPCUESPEC, String pPTCONTRA, java.math.BigDecimal pPCTIPTRA, String pPTESTADO,
			java.math.BigDecimal pPCMEDIO, java.sql.Date pPFDESCAR, java.sql.Date pPFFALLO,
			java.math.BigDecimal pPCFALLO, String pPTFALLO, java.math.BigDecimal pPCRECURSO, String pPCTRAMITAD)
			throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL(pPNSINIES, pPNTRAMIT, pPNORDEN, pPFAPERTU, pPFIMPUTA,
				pPFNOTIFI, pPFAUDIEN, pPHAUDIEN, pPCAUDIEN, pPSPROFES, pPCOTERRI, pPCPROVIN, pPCCONTRA, pPCUESPEC,
				pPTCONTRA, pPCTIPTRA, pPTESTADO, pPCMEDIO, pPFDESCAR, pPFFALLO, pPCFALLO, pPTFALLO, pPCRECURSO,
				pPCTRAMITAD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_FISCAL

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_FISCAL_VALPRET(PNSINIES, PNTRAMIT,
	// PNORDEN, PCGARANT, PIPRETEN)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL_VALPRET(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPIPRETEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_FISCAL_VALPRET(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPCGARANT", "pPIPRETEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN, pPCGARANT, pPIPRETEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPIPRETEN);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL_VALPRET(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPIPRETEN) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL_VALPRET(pPNSINIES, pPNTRAMIT, pPNORDEN, pPCGARANT,
				pPIPRETEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_FISCAL_VALPRET
	// --START-PAC_IAX_SIN_TRAMITE.F_ELIMINA_DATO_FISCAL(PCTIPO, PNSINIES, PNTRAMIT,
	// PNORDEN, PNVALOR)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_FISCAL(java.math.BigDecimal pPCTIPO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNVALOR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_ELIMINA_DATO_FISCAL(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPO", "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPNVALOR" },
				new Object[] { pPCTIPO, pPNSINIES, pPNTRAMIT, pPNORDEN, pPNVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPO);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNTRAMIT);
		cStmt.setObject(5, pPNORDEN);
		cStmt.setObject(6, pPNVALOR);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_FISCAL(java.math.BigDecimal pPCTIPO, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNVALOR)
			throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_FISCAL(pPCTIPO, pPNSINIES, pPNTRAMIT, pPNORDEN, pPNVALOR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_ELIMINA_DATO_FISCAL

	// --START-PAC_IAX_SIN_TRAMITE.F_GET_TRAMITE_JUDICIAL_AUDIEN(PNSINIES, PNTRAMIT,
	// PNORDEN, PNAUDIEN)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE_JUDICIAL_AUDIEN(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNAUDIEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_GET_TRAMITE_JUDICIAL_AUDIEN(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPNAUDIEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN, pPNAUDIEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPNAUDIEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIN_T_JUDICIAL_AUDIEN".toUpperCase())); // Valor de "AUDIENCIA"
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
			retVal.put("AUDIENCIA", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("AUDIENCIA", null);
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

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE_JUDICIAL_AUDIEN(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNAUDIEN)
			throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE_JUDICIAL_AUDIEN(pPNSINIES, pPNTRAMIT, pPNORDEN, pPNAUDIEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_GET_TRAMITE_JUDICIAL_AUDIEN

	// --START-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_AUDIEN(PNSINIES, PNTRAMIT,
	// PNORDEN, PNAUDIEN, PFAUDIEN, PHAUDIEN, PTAUDIEN, PCDESPA, PTLAUDIE, PCAUDIEN,
	// PCDESPAO, PTLAUDIEO, PCAUDIENO, PSABOGAU, PCORAL, PCESTADO, PCRESOLU,
	// PFINSTA1, PFINSTA2, PFNUEVA, PTRESULT, PCTRAMITAD)
	private HashMap callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_AUDIEN(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNAUDIEN, java.sql.Date pPFAUDIEN, String pPHAUDIEN,
			String pPTAUDIEN, java.math.BigDecimal pPCDESPA, String pPTLAUDIE, String pPCAUDIEN,
			java.math.BigDecimal pPCDESPAO, String pPTLAUDIEO, String pPCAUDIENO, java.math.BigDecimal pPSABOGAU,
			java.math.BigDecimal pPCORAL, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCRESOLU,
			java.sql.Date pPFINSTA1, java.sql.Date pPFINSTA2, java.sql.Date pPFNUEVA, String pPTRESULT,
			String pPCTRAMITAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_AUDIEN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT", "pPNORDEN", "pPNAUDIEN", "pPFAUDIEN", "pPHAUDIEN",
				"pPTAUDIEN", "pPCDESPA", "pPTLAUDIE", "pPCAUDIEN", "pPCDESPAO", "pPTLAUDIEO", "pPCAUDIENO", "pPSABOGAU",
				"pPCORAL", "pPCESTADO", "pPCRESOLU", "pPFINSTA1", "pPFINSTA2", "pPFNUEVA", "pPTRESULT", "pPCTRAMITAD" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNORDEN, pPNAUDIEN, pPFAUDIEN, pPHAUDIEN, pPTAUDIEN, pPCDESPA,
						pPTLAUDIE, pPCAUDIEN, pPCDESPAO, pPTLAUDIEO, pPCAUDIENO, pPSABOGAU, pPCORAL, pPCESTADO,
						pPCRESOLU, pPFINSTA1, pPFINSTA2, pPFNUEVA, pPTRESULT, pPCTRAMITAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPNAUDIEN);
		cStmt.setObject(6, pPFAUDIEN);
		cStmt.setObject(7, pPHAUDIEN);
		cStmt.setObject(8, pPTAUDIEN);
		cStmt.setObject(9, pPCDESPA);
		cStmt.setObject(10, pPTLAUDIE);
		cStmt.setObject(11, pPCAUDIEN);
		cStmt.setObject(12, pPCDESPAO);
		cStmt.setObject(13, pPTLAUDIEO);
		cStmt.setObject(14, pPCAUDIENO);
		cStmt.setObject(15, pPSABOGAU);
		cStmt.setObject(16, pPCORAL);
		cStmt.setObject(17, pPCESTADO);
		cStmt.setObject(18, pPCRESOLU);
		cStmt.setObject(19, pPFINSTA1);
		cStmt.setObject(20, pPFINSTA2);
		cStmt.setObject(21, pPFNUEVA);
		cStmt.setObject(22, pPTRESULT);
		cStmt.setObject(23, pPCTRAMITAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(24, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(24));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_AUDIEN(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNAUDIEN,
			java.sql.Date pPFAUDIEN, String pPHAUDIEN, String pPTAUDIEN, java.math.BigDecimal pPCDESPA,
			String pPTLAUDIE, String pPCAUDIEN, java.math.BigDecimal pPCDESPAO, String pPTLAUDIEO, String pPCAUDIENO,
			java.math.BigDecimal pPSABOGAU, java.math.BigDecimal pPCORAL, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCRESOLU, java.sql.Date pPFINSTA1, java.sql.Date pPFINSTA2, java.sql.Date pPFNUEVA,
			String pPTRESULT, String pPCTRAMITAD) throws Exception {
		return this.callPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_AUDIEN(pPNSINIES, pPNTRAMIT, pPNORDEN, pPNAUDIEN,
				pPFAUDIEN, pPHAUDIEN, pPTAUDIEN, pPCDESPA, pPTLAUDIE, pPCAUDIEN, pPCDESPAO, pPTLAUDIEO, pPCAUDIENO,
				pPSABOGAU, pPCORAL, pPCESTADO, pPCRESOLU, pPFINSTA1, pPFINSTA2, pPFNUEVA, pPTRESULT, pPCTRAMITAD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_TRAMITE.F_SET_OBJ_JUDICIAL_AUDIEN
}
