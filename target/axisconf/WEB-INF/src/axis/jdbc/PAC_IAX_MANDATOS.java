package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MANDATOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MANDATOS.class);
	private Connection conn = null;

	public PAC_IAX_MANDATOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MANDATOS.F_CONSULTA_MANDATOS(PNNUMIDE, PNOMBRE,
	// PDEUDORMANDANTE, PFVENCIMIENTO, PFORMAPAGO, PCBANCO, PCBANCAR, PTIPOTARJETA,
	// PNUMTARJETA, PINSTEMISORA, PMANDATO, PACCION, PSUCURSAL, PESTADO, PCONSULTA)
	private HashMap callPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS(String pPNNUMIDE, String pPNOMBRE,
			java.math.BigDecimal pPDEUDORMANDANTE, String pPFVENCIMIENTO, java.math.BigDecimal pPFORMAPAGO,
			java.math.BigDecimal pPCBANCO, String pPCBANCAR, java.math.BigDecimal pPTIPOTARJETA, String pPNUMTARJETA,
			java.math.BigDecimal pPINSTEMISORA, java.math.BigDecimal pPMANDATO, java.math.BigDecimal pPACCION,
			String pPSUCURSAL, java.math.BigDecimal pPESTADO, java.math.BigDecimal pPCONSULTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_CONSULTA_MANDATOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNNUMIDE", "pPNOMBRE", "pPDEUDORMANDANTE", "pPFVENCIMIENTO", "pPFORMAPAGO", "pPCBANCO",
						"pPCBANCAR", "pPTIPOTARJETA", "pPNUMTARJETA", "pPINSTEMISORA", "pPMANDATO", "pPACCION",
						"pPSUCURSAL", "pPESTADO", "pPCONSULTA" },
				new Object[] { pPNNUMIDE, pPNOMBRE, pPDEUDORMANDANTE, pPFVENCIMIENTO, pPFORMAPAGO, pPCBANCO, pPCBANCAR,
						pPTIPOTARJETA, pPNUMTARJETA, pPINSTEMISORA, pPMANDATO, pPACCION, pPSUCURSAL, pPESTADO,
						pPCONSULTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMIDE);
		cStmt.setObject(3, pPNOMBRE);
		cStmt.setObject(4, pPDEUDORMANDANTE);
		cStmt.setObject(5, pPFVENCIMIENTO);
		cStmt.setObject(6, pPFORMAPAGO);
		cStmt.setObject(7, pPCBANCO);
		cStmt.setObject(8, pPCBANCAR);
		cStmt.setObject(9, pPTIPOTARJETA);
		cStmt.setObject(10, pPNUMTARJETA);
		cStmt.setObject(11, pPINSTEMISORA);
		cStmt.setObject(12, pPMANDATO);
		cStmt.setObject(13, pPACCION);
		cStmt.setObject(14, pPSUCURSAL);
		cStmt.setObject(15, pPESTADO);
		cStmt.setObject(16, pPCONSULTA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS(String pPNNUMIDE, String pPNOMBRE,
			java.math.BigDecimal pPDEUDORMANDANTE, String pPFVENCIMIENTO, java.math.BigDecimal pPFORMAPAGO,
			java.math.BigDecimal pPCBANCO, String pPCBANCAR, java.math.BigDecimal pPTIPOTARJETA, String pPNUMTARJETA,
			java.math.BigDecimal pPINSTEMISORA, java.math.BigDecimal pPMANDATO, java.math.BigDecimal pPACCION,
			String pPSUCURSAL, java.math.BigDecimal pPESTADO, java.math.BigDecimal pPCONSULTA) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS(pPNNUMIDE, pPNOMBRE, pPDEUDORMANDANTE, pPFVENCIMIENTO,
				pPFORMAPAGO, pPCBANCO, pPCBANCAR, pPTIPOTARJETA, pPNUMTARJETA, pPINSTEMISORA, pPMANDATO, pPACCION,
				pPSUCURSAL, pPESTADO, pPCONSULTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_CONSULTA_MANDATOS

	// --START-PAC_IAX_MANDATOS.F_GETESTADOSMANDATO(PNUMFOLIO)
	private HashMap callPAC_IAX_MANDATOS__F_GETESTADOSMANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_GETESTADOSMANDATO(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMFOLIO" }, new Object[] { pPNUMFOLIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMFOLIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_GETESTADOSMANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_GETESTADOSMANDATO(pPNUMFOLIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_GETESTADOSMANDATO

	// --START-PAC_IAX_MANDATOS.F_GETPOLIZASMANDATO(PNUMFOLIO)
	private HashMap callPAC_IAX_MANDATOS__F_GETPOLIZASMANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_GETPOLIZASMANDATO(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMFOLIO" }, new Object[] { pPNUMFOLIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMFOLIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_GETPOLIZASMANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_GETPOLIZASMANDATO(pPNUMFOLIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_GETPOLIZASMANDATO

	// --START-PAC_IAX_MANDATOS.F_GETGESTIONESMANDATO(PNUMFOLIO)
	private HashMap callPAC_IAX_MANDATOS__F_GETGESTIONESMANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_GETGESTIONESMANDATO(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMFOLIO" }, new Object[] { pPNUMFOLIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMFOLIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_GETGESTIONESMANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_GETGESTIONESMANDATO(pPNUMFOLIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_GETGESTIONESMANDATO

	// --START-PAC_IAX_MANDATOS.F_GET_LSTACCIONES_MANDATO(PNUMFOLIO)
	private HashMap callPAC_IAX_MANDATOS__F_GET_LSTACCIONES_MANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_GET_LSTACCIONES_MANDATO(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMFOLIO" }, new Object[] { pPNUMFOLIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMFOLIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_GET_LSTACCIONES_MANDATO(java.math.BigDecimal pPNUMFOLIO)
			throws Exception {
		return this.callPAC_IAX_MANDATOS__F_GET_LSTACCIONES_MANDATO(pPNUMFOLIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_GET_LSTACCIONES_MANDATO

	// --START-PAC_IAX_MANDATOS.F_SET_MANDATOS_GESTION(PNUMFOLIO, PACCION,
	// PFPROXAVISO, PMOTRECHAZO, PCOMENTARIO)
	private HashMap callPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION(java.math.BigDecimal pPNUMFOLIO,
			java.math.BigDecimal pPACCION, java.sql.Date pPFPROXAVISO, java.math.BigDecimal pPMOTRECHAZO,
			String pPCOMENTARIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_SET_MANDATOS_GESTION(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNUMFOLIO", "pPACCION", "pPFPROXAVISO", "pPMOTRECHAZO", "pPCOMENTARIO" },
				new Object[] { pPNUMFOLIO, pPACCION, pPFPROXAVISO, pPMOTRECHAZO, pPCOMENTARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMFOLIO);
		cStmt.setObject(3, pPACCION);
		cStmt.setObject(4, pPFPROXAVISO);
		cStmt.setObject(5, pPMOTRECHAZO);
		cStmt.setObject(6, pPCOMENTARIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION(java.math.BigDecimal pPNUMFOLIO,
			java.math.BigDecimal pPACCION, java.sql.Date pPFPROXAVISO, java.math.BigDecimal pPMOTRECHAZO,
			String pPCOMENTARIO) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION(pPNUMFOLIO, pPACCION, pPFPROXAVISO, pPMOTRECHAZO,
				pPCOMENTARIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_SET_MANDATOS_GESTION

	// --START-PAC_IAX_MANDATOS.F_GET_LSTESTADOS_MANDMASIVA()
	private HashMap callPAC_IAX_MANDATOS__F_GET_LSTESTADOS_MANDMASIVA() throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_GET_LSTESTADOS_MANDMASIVA(?)}";

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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_GET_LSTESTADOS_MANDMASIVA() throws Exception {
		return this.callPAC_IAX_MANDATOS__F_GET_LSTESTADOS_MANDMASIVA();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_GET_LSTESTADOS_MANDMASIVA

	// --START-PAC_IAX_MANDATOS.F_GET_ACCIONES_MANDMASIVA(PESTADO)
	private HashMap callPAC_IAX_MANDATOS__F_GET_ACCIONES_MANDMASIVA(java.math.BigDecimal pPESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_GET_ACCIONES_MANDMASIVA(?, ?)}";

		logCall(callQuery, new String[] { "pPESTADO" }, new Object[] { pPESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPESTADO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_GET_ACCIONES_MANDMASIVA(java.math.BigDecimal pPESTADO) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_GET_ACCIONES_MANDMASIVA(pPESTADO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_GET_ACCIONES_MANDMASIVA

	// --START-PAC_IAX_MANDATOS.F_SET_MANDATOS_GESTION_MASIVA(PCADENANUMFOL,
	// PACCION)
	private HashMap callPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION_MASIVA(String pPCADENANUMFOL,
			java.math.BigDecimal pPACCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_SET_MANDATOS_GESTION_MASIVA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCADENANUMFOL", "pPACCION" }, new Object[] { pPCADENANUMFOL, pPACCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCADENANUMFOL);
		cStmt.setObject(3, pPACCION);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNOMINA"
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
			retVal.put("PNOMINA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNOMINA", null);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION_MASIVA(String pPCADENANUMFOL,
			java.math.BigDecimal pPACCION) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION_MASIVA(pPCADENANUMFOL, pPACCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_SET_MANDATOS_GESTION_MASIVA

	// --START-PAC_IAX_MANDATOS.F_CONSULTA_MANDATOS_MASIVA(PESTADO, PNOMINA)
	private HashMap callPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS_MASIVA(java.math.BigDecimal pPESTADO,
			java.math.BigDecimal pPNOMINA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_CONSULTA_MANDATOS_MASIVA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPESTADO", "pPNOMINA" }, new Object[] { pPESTADO, pPNOMINA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPESTADO);
		cStmt.setObject(3, pPNOMINA);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS_MASIVA(java.math.BigDecimal pPESTADO,
			java.math.BigDecimal pPNOMINA) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS_MASIVA(pPESTADO, pPNOMINA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_CONSULTA_MANDATOS_MASIVA

	// --START-PAC_IAX_MANDATOS.F_CONSULTA_DOCUMENTOS(PNOMINA)
	private HashMap callPAC_IAX_MANDATOS__F_CONSULTA_DOCUMENTOS(java.math.BigDecimal pPNOMINA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_CONSULTA_DOCUMENTOS(?, ?)}";

		logCall(callQuery, new String[] { "pPNOMINA" }, new Object[] { pPNOMINA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNOMINA);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_CONSULTA_DOCUMENTOS(java.math.BigDecimal pPNOMINA) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_CONSULTA_DOCUMENTOS(pPNOMINA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_CONSULTA_DOCUMENTOS

	// --START-PAC_IAX_MANDATOS.F_CONSCOBRADORESBANC()
	private HashMap callPAC_IAX_MANDATOS__F_CONSCOBRADORESBANC() throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_CONSCOBRADORESBANC(?)}";

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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_CONSCOBRADORESBANC() throws Exception {
		return this.callPAC_IAX_MANDATOS__F_CONSCOBRADORESBANC();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_CONSCOBRADORESBANC

	// --START-PAC_IAX_MANDATOS.F_CONS_DOC_MANDATO(PNUMFOLIO)
	private HashMap callPAC_IAX_MANDATOS__F_CONS_DOC_MANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_CONS_DOC_MANDATO(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMFOLIO" }, new Object[] { pPNUMFOLIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMFOLIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_CONS_DOC_MANDATO(java.math.BigDecimal pPNUMFOLIO) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_CONS_DOC_MANDATO(pPNUMFOLIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_CONS_DOC_MANDATO

	// --START-PAC_IAX_MANDATOS.F_SET_MANDATOS_DOCUMENTOS(PIDDOCGEDOX, PNUMFOLIO)
	private HashMap callPAC_IAX_MANDATOS__F_SET_MANDATOS_DOCUMENTOS(java.math.BigDecimal pPIDDOCGEDOX,
			java.math.BigDecimal pPNUMFOLIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_SET_MANDATOS_DOCUMENTOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDDOCGEDOX", "pPNUMFOLIO" }, new Object[] { pPIDDOCGEDOX, pPNUMFOLIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDDOCGEDOX);
		cStmt.setObject(3, pPNUMFOLIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_SET_MANDATOS_DOCUMENTOS(java.math.BigDecimal pPIDDOCGEDOX,
			java.math.BigDecimal pPNUMFOLIO) throws Exception {
		return this.callPAC_IAX_MANDATOS__F_SET_MANDATOS_DOCUMENTOS(pPIDDOCGEDOX, pPNUMFOLIO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MANDATOS.F_SET_MANDATOS_DOCUMENTOS
	// --START-PAC_IAX_MANDATOS.F_USUPERMISOGESTION(PCMANDATO, PNUMFOLIO)
	private HashMap callPAC_IAX_MANDATOS__F_USUPERMISOGESTION(String pPCMANDATO, java.math.BigDecimal pPNUMFOLIO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MANDATOS.F_USUPERMISOGESTION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMANDATO", "pPNUMFOLIO" }, new Object[] { pPCMANDATO, pPNUMFOLIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMANDATO);
		cStmt.setObject(3, pPNUMFOLIO);
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

	public HashMap ejecutaPAC_IAX_MANDATOS__F_USUPERMISOGESTION(String pPCMANDATO, java.math.BigDecimal pPNUMFOLIO)
			throws Exception {
		return this.callPAC_IAX_MANDATOS__F_USUPERMISOGESTION(pPCMANDATO, pPNUMFOLIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MANDATOS.F_USUPERMISOGESTION

}
