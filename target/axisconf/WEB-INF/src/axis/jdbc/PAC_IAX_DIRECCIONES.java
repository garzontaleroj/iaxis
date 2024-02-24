package axis.jdbc;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DIRECCIONES extends AccesoPL {

	private Connection conn = null;

	public PAC_IAX_DIRECCIONES() {
		super();
	}

	public PAC_IAX_DIRECCIONES(Connection conn) {
		this.conn = conn;
	}

	public HashMap callPAC_IAX_DIRECCIONES__F_GET_TIPOSVIAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_TIPOSVIAS(?)}";

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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_TIPOSVIAS() throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_TIPOSVIAS();
	}

	public HashMap callPAC_IAX_LISTVALORES__F_GET_TIPOSFINCAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_DETVALORES(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.setObject(2, new BigDecimal("800075"));
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
			retVal.put("MENSAJES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOSFINCAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPOSFINCAS();
	}

	public HashMap callPAC_IAX_LISTVALORES__F_GET_USODIRECCION() throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_USODIRECCION(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_USODIRECCION() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_USODIRECCION();
	}

	// --START-PAC_IAX_DIRECCIONES.F_GET_BUSQUEDADIRDIRECCIONES(PTBUSQUEDA,
	// PCPOSTAL, PCTIPVIA, PTNOMVIA, PNDESDE, PNHASTA, PCDESDE, PCHASTA, PTIPFINCA,
	// PCPAIS, PCPROVIN, PCMUNICIPI, PCLOCALIDAD, PALIASFINCA, PINE, PESCALERA,
	// PPISO, PPUERTA, PREFERENCIA, PIDFINCA)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_BUSQUEDADIRDIRECCIONES(java.math.BigDecimal pPTBUSQUEDA,
			String pPCPOSTAL, java.math.BigDecimal pPCTIPVIA, String pPTNOMVIA, java.math.BigDecimal pPNDESDE,
			java.math.BigDecimal pPNHASTA, String pPCDESDE, String pPCHASTA, java.math.BigDecimal pPTIPFINCA,
			java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCMUNICIPI,
			java.math.BigDecimal pPCLOCALIDAD, String pPALIASFINCA, String pPINE, java.math.BigDecimal pPESCALERA,
			java.math.BigDecimal pPPISO, String pPPUERTA, String pPREFERENCIA, java.math.BigDecimal pPIDFINCA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_BUSQUEDADIRDIRECCIONES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPTBUSQUEDA", "pPCPOSTAL", "pPCTIPVIA", "pPTNOMVIA", "pPNDESDE", "pPNHASTA", "pPCDESDE",
						"pPCHASTA", "pPTIPFINCA", "pPCPAIS", "pPCPROVIN", "pPCMUNICIPI", "pPCLOCALIDAD", "pPALIASFINCA",
						"pPINE", "pPESCALERA", "pPPISO", "pPPUERTA", "pPREFERENCIA", "pPIDFINCA" },
				new Object[] { pPTBUSQUEDA, pPCPOSTAL, pPCTIPVIA, pPTNOMVIA, pPNDESDE, pPNHASTA, pPCDESDE, pPCHASTA,
						pPTIPFINCA, pPCPAIS, pPCPROVIN, pPCMUNICIPI, pPCLOCALIDAD, pPALIASFINCA, pPINE, pPESCALERA,
						pPPISO, pPPUERTA, pPREFERENCIA, pPIDFINCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTBUSQUEDA);
		cStmt.setObject(3, pPCPOSTAL);
		cStmt.setObject(4, pPCTIPVIA);
		cStmt.setObject(5, pPTNOMVIA);
		cStmt.setObject(6, pPNDESDE);
		cStmt.setObject(7, pPNHASTA);
		cStmt.setObject(8, pPCDESDE);
		cStmt.setObject(9, pPCHASTA);
		cStmt.setObject(10, pPTIPFINCA);
		cStmt.setObject(11, pPCPAIS);
		cStmt.setObject(12, pPCPROVIN);
		cStmt.setObject(13, pPCMUNICIPI);
		cStmt.setObject(14, pPCLOCALIDAD);
		cStmt.setObject(15, pPALIASFINCA);
		cStmt.setObject(16, pPINE);
		cStmt.setObject(17, pPESCALERA);
		cStmt.setObject(18, pPPISO);
		cStmt.setObject(19, pPPUERTA);
		cStmt.setObject(20, pPREFERENCIA);
		cStmt.setObject(21, pPIDFINCA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DIR_FINCAS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(22, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_BUSQUEDADIRDIRECCIONES(java.math.BigDecimal pPTBUSQUEDA,
			String pPCPOSTAL, java.math.BigDecimal pPCTIPVIA, String pPTNOMVIA, java.math.BigDecimal pPNDESDE,
			java.math.BigDecimal pPNHASTA, String pPCDESDE, String pPCHASTA, java.math.BigDecimal pPTIPFINCA,
			java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCMUNICIPI,
			java.math.BigDecimal pPCLOCALIDAD, String pPALIASFINCA, String pPINE, java.math.BigDecimal pPESCALERA,
			java.math.BigDecimal pPPISO, String pPPUERTA, String pPREFERENCIA, java.math.BigDecimal pPIDFINCA)
			throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_BUSQUEDADIRDIRECCIONES(pPTBUSQUEDA, pPCPOSTAL, pPCTIPVIA, pPTNOMVIA,
				pPNDESDE, pPNHASTA, pPCDESDE, pPCHASTA, pPTIPFINCA, pPCPAIS, pPCPROVIN, pPCMUNICIPI, pPCLOCALIDAD,
				pPALIASFINCA, pPINE, pPESCALERA, pPPISO, pPPUERTA, pPREFERENCIA, pPIDFINCA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_BUSQUEDADIRDIRECCIONES

	// --START-PAC_IAX_DIRECCIONES.F_GET_PORTALES(PIDFINCA)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_PORTALES(java.math.BigDecimal pPIDFINCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_PORTALES(?, ?)}";

		logCall(callQuery, new String[] { "pPIDFINCA" }, new Object[] { pPIDFINCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DIR_PORTALES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_PORTALES(java.math.BigDecimal pPIDFINCA) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_PORTALES(pPIDFINCA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_PORTALES

	// --START-PAC_IAX_DIRECCIONES.F_GET_DEPARTAMENTOS(PIDFINCA, PIDPORTAL)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTOS(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_DEPARTAMENTOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDFINCA", "pPIDPORTAL" }, new Object[] { pPIDFINCA, pPIDPORTAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.setObject(3, pPIDPORTAL);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DIR_DOMICILIOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTOS(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTOS(pPIDFINCA, pPIDPORTAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_DEPARTAMENTOS

	// --START-PAC_IAX_DIRECCIONES.F_GET_FINCA(PIDFINCA)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_FINCA(java.math.BigDecimal pPIDFINCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_FINCA(?, ?)}";

		logCall(callQuery, new String[] { "pPIDFINCA" }, new Object[] { pPIDFINCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_FINCA(java.math.BigDecimal pPIDFINCA) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_FINCA(pPIDFINCA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_FINCA

	// --START-PAC_IAX_DIRECCIONES.F_EXISTE_DOMI(PIDFINCA, PIDPORTAL, PIDDOMICI,
	// PIDGEODIR, PCESCALE, PCPLANTA, PCPUERTA)
	private HashMap callPAC_IAX_DIRECCIONES__F_EXISTE_DOMI(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL, java.math.BigDecimal pPIDDOMICI, java.math.BigDecimal pPIDGEODIR,
			String pPCESCALE, String pPCPLANTA, String pPCPUERTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_EXISTE_DOMI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDFINCA", "pPIDPORTAL", "pPIDDOMICI", "pPIDGEODIR", "pPCESCALE", "pPCPLANTA",
						"pPCPUERTA" },
				new Object[] { pPIDFINCA, pPIDPORTAL, pPIDDOMICI, pPIDGEODIR, pPCESCALE, pPCPLANTA, pPCPUERTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.setObject(3, pPIDPORTAL);
		cStmt.setObject(4, pPIDDOMICI);
		cStmt.setObject(5, pPIDGEODIR);
		cStmt.setObject(6, pPCESCALE);
		cStmt.setObject(7, pPCPLANTA);
		cStmt.setObject(8, pPCPUERTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "VEXISTE"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "VIDDOMICI"
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
			retVal.put("VEXISTE", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("VEXISTE", null);
		}
		try {
			retVal.put("VIDDOMICI", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("VIDDOMICI", null);
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_EXISTE_DOMI(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL, java.math.BigDecimal pPIDDOMICI, java.math.BigDecimal pPIDGEODIR,
			String pPCESCALE, String pPCPLANTA, String pPCPUERTA) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_EXISTE_DOMI(pPIDFINCA, pPIDPORTAL, pPIDDOMICI, pPIDGEODIR, pPCESCALE,
				pPCPLANTA, pPCPUERTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_EXISTE_DOMI

	// --START-PAC_IAX_DIRECCIONES.F_SET_DOMICI(PIDFINCA, PIDPORTAL, PIDGEODIR,
	// PCESCALE, PCPLANTA, PCPUERTA, PCCATAST, PNM2CONS, PCTIPDPT, PTALIAS,
	// PCNOASEG, PTNOASEG)
	private HashMap callPAC_IAX_DIRECCIONES__F_SET_DOMICI(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL, java.math.BigDecimal pPIDGEODIR, String pPCESCALE, String pPCPLANTA,
			String pPCPUERTA, String pPCCATAST, java.math.BigDecimal pPNM2CONS, java.math.BigDecimal pPCTIPDPT,
			String pPTALIAS, java.math.BigDecimal pPCNOASEG, java.math.BigDecimal pPTNOASEG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_SET_DOMICI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDFINCA", "pPIDPORTAL", "pPIDGEODIR", "pPCESCALE", "pPCPLANTA", "pPCPUERTA",
						"pPCCATAST", "pPNM2CONS", "pPCTIPDPT", "pPTALIAS", "pPCNOASEG", "pPTNOASEG" },
				new Object[] { pPIDFINCA, pPIDPORTAL, pPIDGEODIR, pPCESCALE, pPCPLANTA, pPCPUERTA, pPCCATAST, pPNM2CONS,
						pPCTIPDPT, pPTALIAS, pPCNOASEG, pPTNOASEG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.setObject(3, pPIDPORTAL);
		cStmt.setObject(4, pPIDGEODIR);
		cStmt.setObject(5, pPCESCALE);
		cStmt.setObject(6, pPCPLANTA);
		cStmt.setObject(7, pPCPUERTA);
		cStmt.setObject(8, pPCCATAST);
		cStmt.setObject(9, pPNM2CONS);
		cStmt.setObject(10, pPCTIPDPT);
		cStmt.setObject(11, pPTALIAS);
		cStmt.setObject(12, pPCNOASEG);
		cStmt.setObject(13, pPTNOASEG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PIDDOMICIOUT"
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
			retVal.put("PIDDOMICIOUT", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PIDDOMICIOUT", null);
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_SET_DOMICI(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL, java.math.BigDecimal pPIDGEODIR, String pPCESCALE, String pPCPLANTA,
			String pPCPUERTA, String pPCCATAST, java.math.BigDecimal pPNM2CONS, java.math.BigDecimal pPCTIPDPT,
			String pPTALIAS, java.math.BigDecimal pPCNOASEG, java.math.BigDecimal pPTNOASEG) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_SET_DOMICI(pPIDFINCA, pPIDPORTAL, pPIDGEODIR, pPCESCALE, pPCPLANTA,
				pPCPUERTA, pPCCATAST, pPNM2CONS, pPCTIPDPT, pPTALIAS, pPCNOASEG, pPTNOASEG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_SET_DOMICI

	// --START-PAC_IAX_DIRECCIONES.F_SET_FINCASBD()
	private HashMap callPAC_IAX_DIRECCIONES__F_SET_FINCASBD() throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_SET_FINCASBD(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_SET_FINCASBD() throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_SET_FINCASBD();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DIRECCIONES.F_SET_FINCASBD
	// --START-PAC_IAX_DIRECCIONES.F_GET_LOCALIDADES(PCPROVIN, PCPOBLAC)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_LOCALIDADES(java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_LOCALIDADES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPROVIN", "pPCPOBLAC" }, new Object[] { pPCPROVIN, pPCPOBLAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPROVIN);
		cStmt.setObject(3, pPCPOBLAC);
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_LOCALIDADES(java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_LOCALIDADES(pPCPROVIN, pPCPOBLAC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DIRECCIONES.F_GET_LOCALIDADES
	// --START-PAC_IAX_DIRECCIONES.F_GET_LOCALIDAD(PIDLOCAL)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_LOCALIDAD(java.math.BigDecimal pPIDLOCAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_LOCALIDAD(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDLOCAL" }, new Object[] { pPIDLOCAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDLOCAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTLOCALI"
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
			retVal.put("PTLOCALI", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTLOCALI", null);
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_LOCALIDAD(java.math.BigDecimal pPIDLOCAL) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_LOCALIDAD(pPIDLOCAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_LOCALIDAD

	// --START-PAC_IAX_DIRECCIONES.F_GET_PORTAL(PIDFINCA, PIDPORTAL)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_PORTAL(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_PORTAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDFINCA", "pPIDPORTAL" }, new Object[] { pPIDFINCA, pPIDPORTAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.setObject(3, pPIDPORTAL);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DIR_PORTALES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_PORTAL(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_PORTAL(pPIDFINCA, pPIDPORTAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_PORTAL

	// --START-PAC_IAX_DIRECCIONES.F_GET_BUSQUEDAPORTAL(PIDFINCA, PIDPORTAL)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_BUSQUEDAPORTAL(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_BUSQUEDAPORTAL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDFINCA", "pPIDPORTAL" }, new Object[] { pPIDFINCA, pPIDPORTAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.setObject(3, pPIDPORTAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DIR_PORTALES".toUpperCase())); // Valor de "PPORTAL"
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
			retVal.put("PPORTAL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PPORTAL", null);
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_BUSQUEDAPORTAL(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPIDPORTAL) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_BUSQUEDAPORTAL(pPIDFINCA, pPIDPORTAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_BUSQUEDAPORTAL

	// --START-PAC_IAX_DIRECCIONES.F_GET_DEPARTAMENTO(PIDDOMICI)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTO(java.math.BigDecimal pPIDDOMICI) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_DEPARTAMENTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDDOMICI" }, new Object[] { pPIDDOMICI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDDOMICI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DIR_DOMICILIOS".toUpperCase())); // Valor de "PDOMICI"
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
			retVal.put("PDOMICI", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDOMICI", null);
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTO(java.math.BigDecimal pPIDDOMICI) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTO(pPIDDOMICI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_DEPARTAMENTO

	// --START-PAC_IAX_DIRECCIONES.F_GET_FINCAMEN(PIDFINCA)
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_FINCAMEN(java.math.BigDecimal pPIDFINCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_FINCAMEN(?, ?)}";

		logCall(callQuery, new String[] { "pPIDFINCA" }, new Object[] { pPIDFINCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DIR_FINCAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_FINCAMEN(java.math.BigDecimal pPIDFINCA) throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_FINCAMEN(pPIDFINCA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_FINCAMEN

	// --START-PAC_IAX_DIRECCIONES.F_SET_NUEVOPORTAL(PIDFINCA, PTBUSQUEDA, PCPOSTAL,
	// PCTIPVIA, PTNOMVIA, PNDESDE, PNHASTA, PCDESDE, PCHASTA, PTIPFINCA, PCPAIS,
	// PCPROVIN, PCMUNICIPI, PCLOCALIDAD, PALIASFINCA, PINE, PESCALERA, PPISO,
	// PPUERTA, PREFERENCIA)
	private HashMap callPAC_IAX_DIRECCIONES__F_SET_NUEVOPORTAL(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPTBUSQUEDA, String pPCPOSTAL, java.math.BigDecimal pPCTIPVIA, String pPTNOMVIA,
			java.math.BigDecimal pPNDESDE, java.math.BigDecimal pPNHASTA, String pPCDESDE, String pPCHASTA,
			java.math.BigDecimal pPTIPFINCA, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCMUNICIPI, java.math.BigDecimal pPCLOCALIDAD, String pPALIASFINCA, String pPINE,
			java.math.BigDecimal pPESCALERA, java.math.BigDecimal pPPISO, String pPPUERTA, String pPREFERENCIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_SET_NUEVOPORTAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDFINCA", "pPTBUSQUEDA", "pPCPOSTAL", "pPCTIPVIA", "pPTNOMVIA", "pPNDESDE",
						"pPNHASTA", "pPCDESDE", "pPCHASTA", "pPTIPFINCA", "pPCPAIS", "pPCPROVIN", "pPCMUNICIPI",
						"pPCLOCALIDAD", "pPALIASFINCA", "pPINE", "pPESCALERA", "pPPISO", "pPPUERTA", "pPREFERENCIA" },
				new Object[] { pPIDFINCA, pPTBUSQUEDA, pPCPOSTAL, pPCTIPVIA, pPTNOMVIA, pPNDESDE, pPNHASTA, pPCDESDE,
						pPCHASTA, pPTIPFINCA, pPCPAIS, pPCPROVIN, pPCMUNICIPI, pPCLOCALIDAD, pPALIASFINCA, pPINE,
						pPESCALERA, pPPISO, pPPUERTA, pPREFERENCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDFINCA);
		cStmt.setObject(3, pPTBUSQUEDA);
		cStmt.setObject(4, pPCPOSTAL);
		cStmt.setObject(5, pPCTIPVIA);
		cStmt.setObject(6, pPTNOMVIA);
		cStmt.setObject(7, pPNDESDE);
		cStmt.setObject(8, pPNHASTA);
		cStmt.setObject(9, pPCDESDE);
		cStmt.setObject(10, pPCHASTA);
		cStmt.setObject(11, pPTIPFINCA);
		cStmt.setObject(12, pPCPAIS);
		cStmt.setObject(13, pPCPROVIN);
		cStmt.setObject(14, pPCMUNICIPI);
		cStmt.setObject(15, pPCLOCALIDAD);
		cStmt.setObject(16, pPALIASFINCA);
		cStmt.setObject(17, pPINE);
		cStmt.setObject(18, pPESCALERA);
		cStmt.setObject(19, pPPISO);
		cStmt.setObject(20, pPPUERTA);
		cStmt.setObject(21, pPREFERENCIA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DIR_FINCAS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(22, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_SET_NUEVOPORTAL(java.math.BigDecimal pPIDFINCA,
			java.math.BigDecimal pPTBUSQUEDA, String pPCPOSTAL, java.math.BigDecimal pPCTIPVIA, String pPTNOMVIA,
			java.math.BigDecimal pPNDESDE, java.math.BigDecimal pPNHASTA, String pPCDESDE, String pPCHASTA,
			java.math.BigDecimal pPTIPFINCA, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCMUNICIPI, java.math.BigDecimal pPCLOCALIDAD, String pPALIASFINCA, String pPINE,
			java.math.BigDecimal pPESCALERA, java.math.BigDecimal pPPISO, String pPPUERTA, String pPREFERENCIA)
			throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_SET_NUEVOPORTAL(pPIDFINCA, pPTBUSQUEDA, pPCPOSTAL, pPCTIPVIA, pPTNOMVIA,
				pPNDESDE, pPNHASTA, pPCDESDE, pPCHASTA, pPTIPFINCA, pPCPAIS, pPCPROVIN, pPCMUNICIPI, pPCLOCALIDAD,
				pPALIASFINCA, pPINE, pPESCALERA, pPPISO, pPPUERTA, pPREFERENCIA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_SET_NUEVOPORTAL

	// --START-PAC_IAX_DIRECCIONES.F_GET_FINCASMEN()
	private HashMap callPAC_IAX_DIRECCIONES__F_GET_FINCASMEN() throws Exception {
		String callQuery = "{?=call PAC_IAX_DIRECCIONES.F_GET_FINCASMEN(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DIR_FINCAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DIRECCIONES__F_GET_FINCASMEN() throws Exception {
		return this.callPAC_IAX_DIRECCIONES__F_GET_FINCASMEN();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DIRECCIONES.F_GET_FINCASMEN

}
