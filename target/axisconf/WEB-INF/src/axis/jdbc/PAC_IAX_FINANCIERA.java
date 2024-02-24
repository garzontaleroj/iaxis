//Revision:# +OfRjLl75AviPAhxvkU52w== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FINANCIERA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_FINANCIERA.class);
	private Connection conn = null;

	public PAC_IAX_FINANCIERA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_FINANCIERA.F_DEL_ENDEUDA(PSFINANCI, PFCONSULTA, PCFUENTE)
	private HashMap callPAC_IAX_FINANCIERA__F_DEL_ENDEUDA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFCONSULTA,
			java.math.BigDecimal pPCFUENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_DEL_ENDEUDA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPFCONSULTA", "pPCFUENTE" },
				new Object[] { pPSFINANCI, pPFCONSULTA, pPCFUENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPFCONSULTA);
		cStmt.setObject(4, pPCFUENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_DEL_ENDEUDA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFCONSULTA,
			java.math.BigDecimal pPCFUENTE) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_DEL_ENDEUDA(pPSFINANCI, pPFCONSULTA, pPCFUENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_DEL_ENDEUDA
	// --START-PAC_IAX_FINANCIERA.F_DEL_INDICADOR(PSFINANCI, PNMOVIMI, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_DEL_INDICADOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_DEL_INDICADOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI" }, new Object[] { pPSFINANCI, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_DEL_INDICADOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_DEL_INDICADOR(pPSFINANCI, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_DEL_INDICADOR
	// --START-PAC_IAX_FINANCIERA.F_DEL_PARAMETRO(PSFINANCI, PNMOVIMI, PCPARAM,
	// MENSAJES) -- IAXIS-14438
	private HashMap callPAC_IAX_FINANCIERA__F_DEL_PARAMETRO(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_DEL_PARAMETRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCPARAM" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCPARAM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_DEL_PARAMETRO(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_DEL_PARAMETRO(pPSFINANCI, pPNMOVIMI, pPCPARAM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_DEL_PARAMETRO -- IAXIS-14438
	// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se crea la funci�n
	// F_DEL_FIN_GENERAL_DET
	// --START-PAC_IAX_FINANCIERA.F_DEL_FIN_GENERAL_DET(PSFINANCI, PNMOVIMI,
	// MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_DEL_FIN_GENERAL_DET(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_DEL_FIN_GENERAL_DET(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI" }, new Object[] { pPSFINANCI, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_DEL_FIN_GENERAL_DET(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_DEL_FIN_GENERAL_DET(pPSFINANCI, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_DEL_FIN_GENERAL_DET
	// -- FIN TCS_11;IAXIS-2119 - JLTS -

	// --START-PAC_IAX_FINANCIERA.F_DEL_RENTA(PSFINANCI, PFCORTE, PCESVALOR,
	// PIPATRILIQ, PIRENTA, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_DEL_RENTA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFCORTE,
			java.math.BigDecimal pPCESVALOR, java.math.BigDecimal pPIPATRILIQ, java.math.BigDecimal pPIRENTA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_DEL_RENTA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPFCORTE", "pPCESVALOR", "pPIPATRILIQ", "pPIRENTA" },
				new Object[] { pPSFINANCI, pPFCORTE, pPCESVALOR, pPIPATRILIQ, pPIRENTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPFCORTE);
		cStmt.setObject(4, pPCESVALOR);
		cStmt.setObject(5, pPIPATRILIQ);
		cStmt.setObject(6, pPIRENTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_DEL_RENTA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFCORTE,
			java.math.BigDecimal pPCESVALOR, java.math.BigDecimal pPIPATRILIQ, java.math.BigDecimal pPIRENTA)
			throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_DEL_RENTA(pPSFINANCI, pPFCORTE, pPCESVALOR, pPIPATRILIQ, pPIRENTA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_DEL_RENTA
	// --START-PAC_IAX_FINANCIERA.F_GET_DOC(PSFINANCI, PNMOVIMI, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_DOC(java.math.BigDecimal pPSFINANCI, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_DOC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI" }, new Object[] { pPSFINANCI, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_DOC(java.math.BigDecimal pPSFINANCI, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_DOC(pPSFINANCI, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_DOC
	// --START-PAC_IAX_FINANCIERA.F_GET_ENDEUDA(PSFINANCI, PFCONSULTA, PCFUENTE,
	// MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_ENDEUDA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFCONSULTA,
			java.math.BigDecimal pPCFUENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_ENDEUDA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPFCONSULTA", "pPCFUENTE" },
				new Object[] { pPSFINANCI, pPFCONSULTA, pPCFUENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPFCONSULTA);
		cStmt.setObject(4, pPCFUENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_ENDEUDA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFCONSULTA,
			java.math.BigDecimal pPCFUENTE) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_ENDEUDA(pPSFINANCI, pPFCONSULTA, pPCFUENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_ENDEUDA
	// --START-PAC_IAX_FINANCIERA.F_GET_GENERAL(PSFINANCI, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_GENERAL(java.math.BigDecimal pPSFINANCI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_GENERAL(?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI" }, new Object[] { pPSFINANCI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL(java.math.BigDecimal pPSFINANCI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_GENERAL(pPSFINANCI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_GENERAL
	// --START-PAC_IAX_FINANCIERA.F_GET_INDICADOR(PSFINANCI, PNMOVIMI, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_INDICADOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_INDICADOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI" }, new Object[] { pPSFINANCI, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_INDICADOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_INDICADOR(pPSFINANCI, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_INDICADOR
	// --START-PAC_IAX_FINANCIERA.F_GET_PARCUENTA(PSFINANCI, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_PARCUENTA(java.math.BigDecimal pPSFINANCI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_PARCUENTA(?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI" }, new Object[] { pPSFINANCI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_PARCUENTA(java.math.BigDecimal pPSFINANCI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_PARCUENTA(pPSFINANCI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_PARCUENTA
	// --START-PAC_IAX_FINANCIERA.F_GET_RENTA(PSFINANCI, PFRENTA, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_RENTA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFRENTA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_RENTA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPFRENTA" }, new Object[] { pPSFINANCI, pPFRENTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPFRENTA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_RENTA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFRENTA)
			throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_RENTA(pPSFINANCI, pPFRENTA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_RENTA
	// --START-PAC_IAX_FINANCIERA.F_GRABAR_DOC(PSFINANCI, PCMODO, PNMOVIMI,
	// PIDDOCGDX, PTOBSER, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GRABAR_DOC(java.math.BigDecimal pPSFINANCI, String pPCMODO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOCGDX, String pPTOBSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GRABAR_DOC(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPCMODO", "pPNMOVIMI", "pPIDDOCGDX", "pPTOBSER" },
				new Object[] { pPSFINANCI, pPCMODO, pPNMOVIMI, pPIDDOCGDX, pPTOBSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPCMODO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPIDDOCGDX);
		cStmt.setObject(6, pPTOBSER);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GRABAR_DOC(java.math.BigDecimal pPSFINANCI, String pPCMODO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOCGDX, String pPTOBSER) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GRABAR_DOC(pPSFINANCI, pPCMODO, pPNMOVIMI, pPIDDOCGDX, pPTOBSER);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GRABAR_DOC
	// --START-PAC_IAX_FINANCIERA.F_GRABAR_ENDEUDA(PSFINANCI, PFCONSULTA,
	// PCMODO, PCFUENTE, PIMINIMO, PICAPPAG, PICAPEND, PIENDTOT, PNCALIFA,
	// PNCALIFB, PNCALIFC, PNCALIFD, PNCALIFE, PNCONSUL, PNSCORE, PNMORA,
	// PICUPOG, PICUPOS, PFCUPO, PTCUPOR, PCRESTRIC, PTCONCEPC, PTCONCEPS,
	// PTCBUREA, PTCOTROS, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GRABAR_ENDEUDA(java.math.BigDecimal pPSFINANCI, java.sql.Date pPFCONSULTA,
			String pPCMODO, java.math.BigDecimal pPCFUENTE, java.math.BigDecimal pPIMINIMO,
			java.math.BigDecimal pPICAPPAG, java.math.BigDecimal pPICAPEND, java.math.BigDecimal pPIENDTOT,
			java.math.BigDecimal pPNCALIFA, java.math.BigDecimal pPNCALIFB, java.math.BigDecimal pPNCALIFC,
			java.math.BigDecimal pPNCALIFD, java.math.BigDecimal pPNCALIFE, java.math.BigDecimal pPNCONSUL,
			java.math.BigDecimal pPNSCORE, java.math.BigDecimal pPNMORA, java.math.BigDecimal pPICUPOG,
			java.math.BigDecimal pPICUPOS, java.sql.Date pPFCUPO, String pPTCUPOR, java.math.BigDecimal pPCRESTRIC,
			String pPTCONCEPC, String pPTCONCEPS, String pPTCBUREA, String pPTCOTROS) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GRABAR_ENDEUDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSFINANCI", "pPFCONSULTA", "pPCMODO", "pPCFUENTE", "pPIMINIMO", "pPICAPPAG",
						"pPICAPEND", "pPIENDTOT", "pPNCALIFA", "pPNCALIFB", "pPNCALIFC", "pPNCALIFD", "pPNCALIFE",
						"pPNCONSUL", "pPNSCORE", "pPNMORA", "pPICUPOG", "pPICUPOS", "pPFCUPO", "pPTCUPOR", "pPCRESTRIC",
						"pPTCONCEPC", "pPTCONCEPS", "pPTCBUREA", "pPTCOTROS" },
				new Object[] { pPSFINANCI, pPFCONSULTA, pPCMODO, pPCFUENTE, pPIMINIMO, pPICAPPAG, pPICAPEND, pPIENDTOT,
						pPNCALIFA, pPNCALIFB, pPNCALIFC, pPNCALIFD, pPNCALIFE, pPNCONSUL, pPNSCORE, pPNMORA, pPICUPOG,
						pPICUPOS, pPFCUPO, pPTCUPOR, pPCRESTRIC, pPTCONCEPC, pPTCONCEPS, pPTCBUREA, pPTCOTROS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPFCONSULTA);
		cStmt.setObject(4, pPCMODO);
		cStmt.setObject(5, pPCFUENTE);
		cStmt.setObject(6, pPIMINIMO);
		cStmt.setObject(7, pPICAPPAG);
		cStmt.setObject(8, pPICAPEND);
		cStmt.setObject(9, pPIENDTOT);
		cStmt.setObject(10, pPNCALIFA);
		cStmt.setObject(11, pPNCALIFB);
		cStmt.setObject(12, pPNCALIFC);
		cStmt.setObject(13, pPNCALIFD);
		cStmt.setObject(14, pPNCALIFE);
		cStmt.setObject(15, pPNCONSUL);
		cStmt.setObject(16, pPNSCORE);
		cStmt.setObject(17, pPNMORA);
		cStmt.setObject(18, pPICUPOG);
		cStmt.setObject(19, pPICUPOS);
		cStmt.setObject(20, pPFCUPO);
		cStmt.setObject(21, pPTCUPOR);
		cStmt.setObject(22, pPCRESTRIC);
		cStmt.setObject(23, pPTCONCEPC);
		cStmt.setObject(24, pPTCONCEPS);
		cStmt.setObject(25, pPTCBUREA);
		cStmt.setObject(26, pPTCOTROS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(27, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(27));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GRABAR_ENDEUDA(java.math.BigDecimal pPSFINANCI,
			java.sql.Date pPFCONSULTA, String pPCMODO, java.math.BigDecimal pPCFUENTE, java.math.BigDecimal pPIMINIMO,
			java.math.BigDecimal pPICAPPAG, java.math.BigDecimal pPICAPEND, java.math.BigDecimal pPIENDTOT,
			java.math.BigDecimal pPNCALIFA, java.math.BigDecimal pPNCALIFB, java.math.BigDecimal pPNCALIFC,
			java.math.BigDecimal pPNCALIFD, java.math.BigDecimal pPNCALIFE, java.math.BigDecimal pPNCONSUL,
			java.math.BigDecimal pPNSCORE, java.math.BigDecimal pPNMORA, java.math.BigDecimal pPICUPOG,
			java.math.BigDecimal pPICUPOS, java.sql.Date pPFCUPO, String pPTCUPOR, java.math.BigDecimal pPCRESTRIC,
			String pPTCONCEPC, String pPTCONCEPS, String pPTCBUREA, String pPTCOTROS) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GRABAR_ENDEUDA(pPSFINANCI, pPFCONSULTA, pPCMODO, pPCFUENTE, pPIMINIMO,
				pPICAPPAG, pPICAPEND, pPIENDTOT, pPNCALIFA, pPNCALIFB, pPNCALIFC, pPNCALIFD, pPNCALIFE, pPNCONSUL,
				pPNSCORE, pPNMORA, pPICUPOG, pPICUPOS, pPFCUPO, pPTCUPOR, pPCRESTRIC, pPTCONCEPC, pPTCONCEPS, pPTCBUREA,
				pPTCOTROS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GRABAR_ENDEUDA
	// --START-PAC_IAX_FINANCIERA.F_GRABAR_GENERAL(PSPERSON, PSFINANCI, PCMODO,
	// PTDESCRIP, PFCCOMER, PCFOTORUT, PFRUT, PTTITULO, PCFOTOCED, PFEXPICED,
	// PCPAIS, PCPROVIN, PCPOBLAC, PTINFOAD, PCCIIU, PCTIPSOCI, PCESTSOC,
	// PTOBJSOC, PTEXPERI, PFCONSTI, PTVIGENC, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GRABAR_GENERAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSFINANCI, String pPCMODO, String pPTDESCRIP, java.sql.Date pPFCCOMER,
			java.math.BigDecimal pPCFOTORUT, java.sql.Date pPFRUT, String pPTTITULO, java.math.BigDecimal pPCFOTOCED,
			java.sql.Date pPFEXPICED, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPTINFOAD, java.math.BigDecimal pPCCIIU,
			java.math.BigDecimal pPCTIPSOCI, java.math.BigDecimal pPCESTSOC, String pPTOBJSOC, String pPTEXPERI,
			java.sql.Date pPFCONSTI, String pPTVIGENC) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GRABAR_GENERAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPSFINANCI", "pPCMODO", "pPTDESCRIP", "pPFCCOMER", "pPCFOTORUT", "pPFRUT",
						"pPTTITULO", "pPCFOTOCED", "pPFEXPICED", "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPTINFOAD",
						"pPCCIIU", "pPCTIPSOCI", "pPCESTSOC", "pPTOBJSOC", "pPTEXPERI", "pPFCONSTI", "pPTVIGENC" },
				new Object[] { pPSPERSON, pPSFINANCI, pPCMODO, pPTDESCRIP, pPFCCOMER, pPCFOTORUT, pPFRUT, pPTTITULO,
						pPCFOTOCED, pPFEXPICED, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPTINFOAD, pPCCIIU, pPCTIPSOCI,
						pPCESTSOC, pPTOBJSOC, pPTEXPERI, pPFCONSTI, pPTVIGENC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPSFINANCI);
		cStmt.setObject(4, pPCMODO);
		cStmt.setObject(5, pPTDESCRIP);
		cStmt.setObject(6, pPFCCOMER);
		cStmt.setObject(7, pPCFOTORUT);
		cStmt.setObject(8, pPFRUT);
		cStmt.setObject(9, pPTTITULO);
		cStmt.setObject(10, pPCFOTOCED);
		cStmt.setObject(11, pPFEXPICED);
		cStmt.setObject(12, pPCPAIS);
		cStmt.setObject(13, pPCPROVIN);
		cStmt.setObject(14, pPCPOBLAC);
		cStmt.setObject(15, pPTINFOAD);
		cStmt.setObject(16, pPCCIIU);
		cStmt.setObject(17, pPCTIPSOCI);
		cStmt.setObject(18, pPCESTSOC);
		cStmt.setObject(19, pPTOBJSOC);
		cStmt.setObject(20, pPTEXPERI);
		cStmt.setObject(21, pPFCONSTI);
		cStmt.setObject(22, pPTVIGENC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(23, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GRABAR_GENERAL(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSFINANCI, String pPCMODO, String pPTDESCRIP, java.sql.Date pPFCCOMER,
			java.math.BigDecimal pPCFOTORUT, java.sql.Date pPFRUT, String pPTTITULO, java.math.BigDecimal pPCFOTOCED,
			java.sql.Date pPFEXPICED, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPTINFOAD, java.math.BigDecimal pPCCIIU,
			java.math.BigDecimal pPCTIPSOCI, java.math.BigDecimal pPCESTSOC, String pPTOBJSOC, String pPTEXPERI,
			java.sql.Date pPFCONSTI, String pPTVIGENC) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GRABAR_GENERAL(pPSPERSON, pPSFINANCI, pPCMODO, pPTDESCRIP, pPFCCOMER,
				pPCFOTORUT, pPFRUT, pPTTITULO, pPCFOTOCED, pPFEXPICED, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPTINFOAD,
				pPCCIIU, pPCTIPSOCI, pPCESTSOC, pPTOBJSOC, pPTEXPERI, pPFCONSTI, pPTVIGENC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GRABAR_GENERAL
	// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta la funci�n
	// F_GRABAR_GENERAL
	// --START-PAC_IAX_FINANCIERA.F_GRABAR_GENERAL(PSPERSON, PSFINANCI, PCMODO,
	// PTDESCRIP, PFCCOMER, PCFOTORUT, PFRUT, PTTITULO, PCFOTOCED, PFEXPICED,
	// PCPAIS, PCPROVIN, PCPOBLAC, PTINFOAD, PCCIIU, PCTIPSOCI, PCESTSOC,
	// PTOBJSOC, PTEXPERI, PFCONSTI, PTVIGENC, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GRABAR_GENERAL_DET(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMODO, String pPTDESCRIP, java.sql.Date pPFCCOMER,
			java.math.BigDecimal pPCFOTORUT, java.sql.Date pPFRUT, String pPTTITULO, java.math.BigDecimal pPCFOTOCED,
			java.sql.Date pPFEXPICED, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPTINFOAD, java.math.BigDecimal pPCCIIU,
			java.math.BigDecimal pPCTIPSOCI, java.math.BigDecimal pPCESTSOC, String pPTOBJSOC, String pPTEXPERI,
			java.sql.Date pPFCONSTI, String pPTVIGENC) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GRABAR_GENERAL_DET(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCMODO", "pPTDESCRIP", "pPFCCOMER", "pPCFOTORUT", "pPFRUT",
						"pPTTITULO", "pPCFOTOCED", "pPFEXPICED", "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPTINFOAD",
						"pPCCIIU", "pPCTIPSOCI", "pPCESTSOC", "pPTOBJSOC", "pPTEXPERI", "pPFCONSTI", "pPTVIGENC" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCMODO, pPTDESCRIP, pPFCCOMER, pPCFOTORUT, pPFRUT, pPTTITULO,
						pPCFOTOCED, pPFEXPICED, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPTINFOAD, pPCCIIU, pPCTIPSOCI,
						pPCESTSOC, pPTOBJSOC, pPTEXPERI, pPFCONSTI, pPTVIGENC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCMODO);
		cStmt.setObject(5, pPTDESCRIP);
		cStmt.setObject(6, pPFCCOMER);
		cStmt.setObject(7, pPCFOTORUT);
		cStmt.setObject(8, pPFRUT);
		cStmt.setObject(9, pPTTITULO);
		cStmt.setObject(10, pPCFOTOCED);
		cStmt.setObject(11, pPFEXPICED);
		cStmt.setObject(12, pPCPAIS);
		cStmt.setObject(13, pPCPROVIN);
		cStmt.setObject(14, pPCPOBLAC);
		cStmt.setObject(15, pPTINFOAD);
		cStmt.setObject(16, pPCCIIU);
		cStmt.setObject(17, pPCTIPSOCI);
		cStmt.setObject(18, pPCESTSOC);
		cStmt.setObject(19, pPTOBJSOC);
		cStmt.setObject(20, pPTEXPERI);
		cStmt.setObject(21, pPFCONSTI);
		cStmt.setObject(22, pPTVIGENC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(23, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GRABAR_GENERAL_DET(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMODO, String pPTDESCRIP, java.sql.Date pPFCCOMER,
			java.math.BigDecimal pPCFOTORUT, java.sql.Date pPFRUT, String pPTTITULO, java.math.BigDecimal pPCFOTOCED,
			java.sql.Date pPFEXPICED, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC, String pPTINFOAD, java.math.BigDecimal pPCCIIU,
			java.math.BigDecimal pPCTIPSOCI, java.math.BigDecimal pPCESTSOC, String pPTOBJSOC, String pPTEXPERI,
			java.sql.Date pPFCONSTI, String pPTVIGENC) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GRABAR_GENERAL_DET(pPSFINANCI, pPNMOVIMI, pPCMODO, pPTDESCRIP, pPFCCOMER,
				pPCFOTORUT, pPFRUT, pPTTITULO, pPCFOTOCED, pPFEXPICED, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPTINFOAD,
				pPCCIIU, pPCTIPSOCI, pPCESTSOC, pPTOBJSOC, pPTEXPERI, pPFCONSTI, pPTVIGENC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GRABAR_GENERAL
	// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019
	// --START-PAC_IAX_FINANCIERA.F_GRABAR_INDICADOR(PSFINANCI, PNMOVIMI,
	// PCMODO, PIMARGEN, PICAPTRAB, PTRAZCOR, PTPRBACI, PIENDUADA, PNDIACAR,
	// PNROTPRO, PNROTINV, PNDIACICL, PIRENTAB, PIOBLCP, PIOBLLP, PIGASTFIN,
	// PIVALPT, PCESVALOR, PCMONEDA, PFCUPO, PICUPOG, PICUPOS, PFCUPOS, PTCUPOR,
	// PTCONCEPC, PTCONCEPS, PTCBUREA, PTCOTROS, PCMONCAM, PNCAPFIN, MENSAJES)
	/* Cambio para IAXIS-15710 : Start */
	private HashMap callPAC_IAX_FINANCIERA__F_GRABAR_INDICADOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMODO, java.math.BigDecimal pPIMARGEN,
			java.math.BigDecimal pPICAPTRAB, String pPTRAZCOR, String pPTPRBACI, java.math.BigDecimal pPIENDUADA,
			java.math.BigDecimal pPNDIACAR, java.math.BigDecimal pPNROTPRO, java.math.BigDecimal pPNROTINV,
			java.math.BigDecimal pPNDIACICL, java.math.BigDecimal pPIRENTAB, java.math.BigDecimal pPIOBLCP,
			java.math.BigDecimal pPIOBLLP, java.math.BigDecimal pPIGASTFIN, java.math.BigDecimal pPIVALPT,
			java.math.BigDecimal pPCESVALOR, String pPCMONEDA, java.sql.Date pPFCUPO, java.math.BigDecimal pPICUPOG,
			java.math.BigDecimal pPICUPOS, java.sql.Date pPFCUPOS, String pPTCUPOR, String pPTCONCEPC,
			String pPTCONCEPS, String pPTCBUREA, String pPTCOTROS, String pPCMONCAM, java.math.BigDecimal pPNCAPFIN,
			java.math.BigDecimal pPSECTOR_EMPRESA, java.math.BigDecimal pPTAMANO_EMPRESA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GRABAR_INDICADOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ? , ?)}";

		logCall(callQuery,
				new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCMODO", "pPIMARGEN", "pPICAPTRAB", "pPTRAZCOR",
						"pPTPRBACI", "pPIENDUADA", "pPNDIACAR", "pPNROTPRO", "pPNROTINV", "pPNDIACICL", "pPIRENTAB",
						"pPIOBLCP", "pPIOBLLP", "pPIGASTFIN", "pPIVALPT", "pPCESVALOR", "pPCMONEDA", "pPFCUPO",
						"pPICUPOG", "pPICUPOS", "pPFCUPOS", "pPTCUPOR", "pPTCONCEPC", "pPTCONCEPS", "pPTCBUREA",
						"pPTCOTROS", "pPCMONCAM", "pPNCAPFIN", "pPSECTOR_EMPRESA", "pPTAMANO_EMPRESA" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCMODO, pPIMARGEN, pPICAPTRAB, pPTRAZCOR, pPTPRBACI, pPIENDUADA,
						pPNDIACAR, pPNROTPRO, pPNROTINV, pPNDIACICL, pPIRENTAB, pPIOBLCP, pPIOBLLP, pPIGASTFIN,
						pPIVALPT, pPCESVALOR, pPCMONEDA, pPFCUPO, pPICUPOG, pPICUPOS, pPFCUPOS, pPTCUPOR, pPTCONCEPC,
						pPTCONCEPS, pPTCBUREA, pPTCOTROS, pPCMONCAM, pPNCAPFIN, pPSECTOR_EMPRESA, pPTAMANO_EMPRESA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCMODO);
		cStmt.setObject(5, pPIMARGEN);
		cStmt.setObject(6, pPICAPTRAB);
		cStmt.setObject(7, pPTRAZCOR);
		cStmt.setObject(8, pPTPRBACI);
		cStmt.setObject(9, pPIENDUADA);
		cStmt.setObject(10, pPNDIACAR);
		cStmt.setObject(11, pPNROTPRO);
		cStmt.setObject(12, pPNROTINV);
		cStmt.setObject(13, pPNDIACICL);
		cStmt.setObject(14, pPIRENTAB);
		cStmt.setObject(15, pPIOBLCP);
		cStmt.setObject(16, pPIOBLLP);
		cStmt.setObject(17, pPIGASTFIN);
		cStmt.setObject(18, pPIVALPT);
		cStmt.setObject(19, pPCESVALOR);
		cStmt.setObject(20, pPCMONEDA);
		cStmt.setObject(21, pPFCUPO);
		cStmt.setObject(22, pPICUPOG);
		cStmt.setObject(23, pPICUPOS);
		cStmt.setObject(24, pPFCUPOS);
		cStmt.setObject(25, pPTCUPOR);
		cStmt.setObject(26, pPTCONCEPC);
		cStmt.setObject(27, pPTCONCEPS);
		cStmt.setObject(28, pPTCBUREA);
		cStmt.setObject(29, pPTCOTROS);
		cStmt.setObject(30, pPCMONCAM);
		cStmt.setObject(31, pPNCAPFIN);
		cStmt.setObject(33, pPSECTOR_EMPRESA);
		cStmt.setObject(34, pPTAMANO_EMPRESA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(32, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(32));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GRABAR_INDICADOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMODO, java.math.BigDecimal pPIMARGEN,
			java.math.BigDecimal pPICAPTRAB, String pPTRAZCOR, String pPTPRBACI, java.math.BigDecimal pPIENDUADA,
			java.math.BigDecimal pPNDIACAR, java.math.BigDecimal pPNROTPRO, java.math.BigDecimal pPNROTINV,
			java.math.BigDecimal pPNDIACICL, java.math.BigDecimal pPIRENTAB, java.math.BigDecimal pPIOBLCP,
			java.math.BigDecimal pPIOBLLP, java.math.BigDecimal pPIGASTFIN, java.math.BigDecimal pPIVALPT,
			java.math.BigDecimal pPCESVALOR, String pPCMONEDA, java.sql.Date pPFCUPO, java.math.BigDecimal pPICUPOG,
			java.math.BigDecimal pPICUPOS, java.sql.Date pPFCUPOS, String pPTCUPOR, String pPTCONCEPC,
			String pPTCONCEPS, String pPTCBUREA, String pPTCOTROS, String pPCMONCAM, java.math.BigDecimal pPNCAPFIN,
			java.math.BigDecimal pPSECTOR_EMPRESA, java.math.BigDecimal pPTAMANO_EMPRESA) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GRABAR_INDICADOR(pPSFINANCI, pPNMOVIMI, pPCMODO, pPIMARGEN, pPICAPTRAB,
				pPTRAZCOR, pPTPRBACI, pPIENDUADA, pPNDIACAR, pPNROTPRO, pPNROTINV, pPNDIACICL, pPIRENTAB, pPIOBLCP,
				pPIOBLLP, pPIGASTFIN, pPIVALPT, pPCESVALOR, pPCMONEDA, pPFCUPO, pPICUPOG, pPICUPOS, pPFCUPOS, pPTCUPOR,
				pPTCONCEPC, pPTCONCEPS, pPTCBUREA, pPTCOTROS, pPCMONCAM, pPNCAPFIN, pPSECTOR_EMPRESA, pPTAMANO_EMPRESA);// AXIS-WLS1SERVER-Ready
		/* Cambio para IAXIS-15710 : End */
	}

	// --END-PAC_IAX_FINANCIERA.F_GRABAR_INDICADOR
	// --START-PAC_IAX_FINANCIERA.F_GRABAR_RENTA(PSFINANCI, PCMODO, PFCORTE,
	// PCESVALOR, PIPATRILIQ, PIRENTA, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GRABAR_RENTA(java.math.BigDecimal pPSFINANCI, String pPCMODO,
			java.sql.Date pPFCORTE, java.math.BigDecimal pPCESVALOR, java.math.BigDecimal pPIPATRILIQ,
			java.math.BigDecimal pPIRENTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GRABAR_RENTA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSFINANCI", "pPCMODO", "pPFCORTE", "pPCESVALOR", "pPIPATRILIQ", "pPIRENTA" },
				new Object[] { pPSFINANCI, pPCMODO, pPFCORTE, pPCESVALOR, pPIPATRILIQ, pPIRENTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPCMODO);
		cStmt.setObject(4, pPFCORTE);
		cStmt.setObject(5, pPCESVALOR);
		cStmt.setObject(6, pPIPATRILIQ);
		cStmt.setObject(7, pPIRENTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GRABAR_RENTA(java.math.BigDecimal pPSFINANCI, String pPCMODO,
			java.sql.Date pPFCORTE, java.math.BigDecimal pPCESVALOR, java.math.BigDecimal pPIPATRILIQ,
			java.math.BigDecimal pPIRENTA) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GRABAR_RENTA(pPSFINANCI, pPCMODO, pPFCORTE, pPCESVALOR, pPIPATRILIQ,
				pPIRENTA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GRABAR_RENTA
	// --START-PAC_IAX_FINANCIERA.F_INS_PARCUENTA(PSFINANCI, PNMOVIMI, PCPARAM,
	// PNVALPAR, PTVALPAR, PFVALPAR, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_INS_PARCUENTA(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_INS_PARCUENTA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCPARAM", "pPNVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCPARAM);
		cStmt.setObject(5, pPNVALPAR);
		cStmt.setObject(6, pPTVALPAR);
		cStmt.setObject(7, pPFVALPAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_INS_PARCUENTA(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR,
			java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_INS_PARCUENTA(pPSFINANCI, pPNMOVIMI, pPCPARAM, pPNVALPAR, pPTVALPAR,
				pPFVALPAR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_INS_PARCUENTA
	// --START-PAC_IAX_FINANCIERA.F_CALCULA_MODELO(PSFINANCI, PNMOVIMI,
	// PCESVALOR, PCMONORI, PCMONDES, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_CALCULA_MODELO(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCESVALOR, String pPCMONORI, String pPCMONDES)
			throws Exception {
		// INI - TCS_3 - JLTS - 20/02/2018 - Se adicionan los par�metros
		// ICUPOSV1, ICUPOGV1 y NCAPFINV1 como ? --> //TCS_MAMB POST89 - 18/07/2021 - Se adicionan campos psector y ptamano
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_CALCULA_MODELO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
		// FIN - TCS_3 - JLTS - 20/02/2018 - Se adicionan los par�metros
		// ICUPOSV1, ICUPOGV1 y NCAPFINV1 comop ? -->
		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCESVALOR", "pPCMONORI", "pPCMONDES" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCESVALOR, pPCMONORI, pPCMONDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCESVALOR);
		cStmt.setObject(13, pPCMONORI);
		cStmt.setObject(14, pPCMONDES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de
																// "PCUPOSUG"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de
																// "PCUPOGAR"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de
																// "PCAPAFIN"
		// INI - TCS_3 - JLTS - 20/02/2018 - Se adicionan los par�metros
		// ICUPOSV1, ICUPOGV1 y NCAPFINV1 -->
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de
																// "PCUPOSUGV1"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de
																// "PCUPOGARV1"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de
																// "PCAPAFINV1"
		// FIN - TCS_3 - JLTS - 20/02/2018 - Se adicionan los par�metros
		// ICUPOSV1, ICUPOGV1 y NCAPFINV1 -->
		// INI - TCS_9998 IAXIS-2490 - 24/02/2019 - JLTS - Se adiciona campo
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de
																// "PNCONTPOL"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de
																// "PNANIOSVINC"
		// FIN - TCS_9998 IAXIS-2490 - 24/02/2019 - JLTS - Se adiciona campo
        
		 // INI - TCS_MAMB POST89 - 18/07/2021 - Se adicionan campos psector y ptamano
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de "psector"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de "ptamano"
		 // FIN - TCS_MAMB POST89 - 18/07/2021 - Se adicionan campos psector y ptamano
		
		cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCUPOSUG", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCUPOSUG", null);
		}
		try {
			retVal.put("PCUPOGAR", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCUPOGAR", null);
		}
		try {
			retVal.put("PCAPAFIN", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCAPAFIN", null);
		}
		// INI - TCS_3 - JLTS - 20/02/2018 - Se adicionan los par�metros
		// PCUPOSUGV1, PCUPOGARV1 y PCAPAFINV1 -->
		try {
			retVal.put("PCUPOSUGV1", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCUPOSUGV1", null);
		}
		try {
			retVal.put("PCUPOGARV1", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCUPOGARV1", null);
		}
		try {
			retVal.put("PCAPAFINV1", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCAPAFINV1", null);
		}
		// INI -- TCS_9998 IAXIS-2490 - 24/02/2019 - JLTS - Se adicionan campos
		// PNCONTPOL y PNANIOSVINC
		try {
			retVal.put("PNCONTPOL", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PNCONTPOL", null);
		}
		try {
			retVal.put("PNANIOSVINC", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PNANIOSVINC", null);
		}
		// FIN -- TCS_9998 IAXIS-2490 - 24/02/2019 - JLTS
		// FIN - TCS_3 - JLTS - 20/02/2018 - Se adicionan los par�metros
		// PCUPOSUGV1, PCUPOGARV1 y PCAPAFINV1 -->

		try {
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_CALCULA_MODELO(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCESVALOR, String pPCMONORI, String pPCMONDES)
			throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_CALCULA_MODELO(pPSFINANCI, pPNMOVIMI, pPCESVALOR, pPCMONORI, pPCMONDES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_CALCULA_MODELO
	// --START-PAC_IAX_FINANCIERA.F_GET_CIFIN_INTERMEDIO(PCTIPIDE, PNNUMIDE,
	// MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_CIFIN_INTERMEDIO(java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_CIFIN_INTERMEDIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPIDE", "pPNNUMIDE" }, new Object[] { pPCTIPIDE, pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPIDE);
		cStmt.setObject(3, pPNNUMIDE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_CIFIN_INTERMEDIO(java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE)
			throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_CIFIN_INTERMEDIO(pPCTIPIDE, pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_CIFIN_INTERMEDIO
	// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se crea la funci�n
	// F_GET_GENERAL_PERSONA_DET
	// --START-PAC_IAX_FINANCIERA.F_GET_GENERAL_PERSONA_DET(PSPERSON, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA_DET(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_GENERAL_PERSONA_DET(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPNMOVIMI" }, new Object[] { pPSPERSON, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA_DET(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA_DET(pPSPERSON, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_GENERAL_PERSONA_DET
	// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019
	// --START-PAC_IAX_FINANCIERA.F_GET_GENERAL_PERSONA(PSPERSON, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_GENERAL_PERSONA(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_GENERAL_PERSONA
	// --START-PAC_IAX_FINANCIERA.F_GET_INT_CARGA_INFORMACOL(PNIT, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_INT_CARGA_INFORMACOL(String pPNIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_INT_CARGA_INFORMACOL(?, ?)}";

		logCall(callQuery, new String[] { "pPNIT" }, new Object[] { pPNIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNIT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_INT_CARGA_INFORMACOL(String pPNIT) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_INT_CARGA_INFORMACOL(pPNIT);// AXIS-WLS1SERVER-Ready
	}

	// --INI IAXIS-15657 --JTLS --09/06/2021
	// --END-PAC_IAX_FINANCIERA.F_GET_INT_CARGA_INFORMACOL
	// --START-PAC_IAX_FINANCIERA.F_GET_CONPARAM(PSFINANCI, PNMOVIMI, PCMONORI,
	// PCMONDES, pPCOBLIGA)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_CONPARAM(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMONORI, String pPCMONDES, java.math.BigDecimal pPCOBLIGA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_CONPARAM(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCMONORI", "pPCMONDES", "pPCOBLIGA" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCMONORI, pPCMONDES, pPCOBLIGA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCMONORI);
		cStmt.setObject(5, pPCMONDES);
		cStmt.setObject(6, pPCOBLIGA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_CONPARAM(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMONORI, String pPCMONDES, java.math.BigDecimal pPCOBLIGA)
			throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_CONPARAM(pPSFINANCI, pPNMOVIMI, pPCMONORI, pPCMONDES, pPCOBLIGA);// AXIS-WLS1SERVER-Ready
	}

	// --FIN IAXIS-15657 --JTLS --09/06/2021
	// --END-PAC_IAX_FINANCIERA.F_GET_CONPARAM
	// --START-PAC_IAX_FINANCIERA.F_INDICADORES_CLIENTE(PSFINANCI, PNMOVIMI,
	// PCMONORI, PCMONDES, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_INDICADORES_CLIENTE(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMONORI, String pPCMONDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_INDICADORES_CLIENTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCMONORI", "pPCMONDES" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCMONORI, pPCMONDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCMONORI);
		cStmt.setObject(5, pPCMONDES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de
																// "PMAROPECL"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de
																// "PCAPTRACL"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de
																// "PRAZCORCL"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de
																// "PPRUACICL"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de
																// "PENDTOTCL"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de
																// "PROTCARCL"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de
																// "PROTPROCL"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de
																// "PROTINVCL"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de
																// "PCICEFECL"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de
																// "PRENTABCL"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de
																// "POBFICPCL"
		cStmt.registerOutParameter(17, java.sql.Types.NUMERIC); // Valor de
																// "POBFILPCL"
		cStmt.registerOutParameter(18, java.sql.Types.NUMERIC); // Valor de
																// "PGASFINCL"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMAROPECL", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PMAROPECL", null);
		}
		try {
			retVal.put("PCAPTRACL", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCAPTRACL", null);
		}
		try {
			retVal.put("PRAZCORCL", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PRAZCORCL", null);
		}
		try {
			retVal.put("PPRUACICL", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PPRUACICL", null);
		}
		try {
			retVal.put("PENDTOTCL", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PENDTOTCL", null);
		}
		try {
			retVal.put("PROTCARCL", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PROTCARCL", null);
		}
		try {
			retVal.put("PROTPROCL", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PROTPROCL", null);
		}
		try {
			retVal.put("PROTINVCL", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PROTINVCL", null);
		}
		try {
			retVal.put("PCICEFECL", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PCICEFECL", null);
		}
		try {
			retVal.put("PRENTABCL", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PRENTABCL", null);
		}
		try {
			retVal.put("POBFICPCL", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("POBFICPCL", null);
		}
		try {
			retVal.put("POBFILPCL", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("POBFILPCL", null);
		}
		try {
			retVal.put("PGASFINCL", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PGASFINCL", null);
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_INDICADORES_CLIENTE(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMONORI, String pPCMONDES) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_INDICADORES_CLIENTE(pPSFINANCI, pPNMOVIMI, pPCMONORI, pPCMONDES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_INDICADORES_CLIENTE
	// --START-PAC_IAX_FINANCIERA.F_INDICADORES_SECTOR(PSFINANCI, PNMOVIMI,
	// PCMONORI, PCMONDES, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_INDICADORES_SECTOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMONORI, String pPCMONDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_INDICADORES_SECTOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI", "pPCMONORI", "pPCMONDES" },
				new Object[] { pPSFINANCI, pPNMOVIMI, pPCMONORI, pPCMONDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCMONORI);
		cStmt.setObject(5, pPCMONDES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de
																// "PMAROPESE"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de
																// "PCAPTRASE"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de
																// "PRAZCORSE"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de
																// "PPRUACISE"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de
																// "PENDTOTSE"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de
																// "PROTCARSE"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de
																// "PROTPROSE"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de
																// "PROTINVSE"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de
																// "PCICEFESE"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de
																// "PRENTABSE"
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de
																// "POBFICPSE"
		cStmt.registerOutParameter(17, java.sql.Types.NUMERIC); // Valor de
																// "POBFILPSE"
		cStmt.registerOutParameter(18, java.sql.Types.NUMERIC); // Valor de
																// "PGASFINSE"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMAROPESE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PMAROPESE", null);
		}
		try {
			retVal.put("PCAPTRASE", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCAPTRASE", null);
		}
		try {
			retVal.put("PRAZCORSE", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PRAZCORSE", null);
		}
		try {
			retVal.put("PPRUACISE", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PPRUACISE", null);
		}
		try {
			retVal.put("PENDTOTSE", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PENDTOTSE", null);
		}
		try {
			retVal.put("PROTCARSE", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PROTCARSE", null);
		}
		try {
			retVal.put("PROTPROSE", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PROTPROSE", null);
		}
		try {
			retVal.put("PROTINVSE", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PROTINVSE", null);
		}
		try {
			retVal.put("PCICEFESE", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PCICEFESE", null);
		}
		try {
			retVal.put("PRENTABSE", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PRENTABSE", null);
		}
		try {
			retVal.put("POBFICPSE", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("POBFICPSE", null);
		}
		try {
			retVal.put("POBFILPSE", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("POBFILPSE", null);
		}
		try {
			retVal.put("PGASFINSE", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PGASFINSE", null);
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_INDICADORES_SECTOR(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI, String pPCMONORI, String pPCMONDES) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_INDICADORES_SECTOR(pPSFINANCI, pPNMOVIMI, pPCMONORI, pPCMONDES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_INDICADORES_SECTOR
	// --START-PAC_IAX_FINANCIERA.F_GET_FIN_INDICA_SECTOR(PSFINANCI, PCMONORI,
	// PCMONDES, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_FIN_INDICA_SECTOR(java.math.BigDecimal pPSFINANCI, String pPCMONORI,
			String pPCMONDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_FIN_INDICA_SECTOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPCMONORI", "pPCMONDES" },
				new Object[] { pPSFINANCI, pPCMONORI, pPCMONDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPCMONORI);
		cStmt.setObject(4, pPCMONDES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_FIN_INDICA_SECTOR(java.math.BigDecimal pPSFINANCI, String pPCMONORI,
			String pPCMONDES) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_FIN_INDICA_SECTOR(pPSFINANCI, pPCMONORI, pPCMONDES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_FIN_INDICA_SECTOR
	// --START-PAC_IAX_FINANCIERA.F_MODIFICAR_CCIIU(PSFINANCI, PCCIIU)
	private HashMap callPAC_IAX_FINANCIERA__F_MODIFICAR_CCIIU(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPCCIIU) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_MODIFICAR_CCIIU(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPCCIIU" }, new Object[] { pPSFINANCI, pPCCIIU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPCCIIU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_MODIFICAR_CCIIU(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPCCIIU) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_MODIFICAR_CCIIU(pPSFINANCI, pPCCIIU);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_MODIFICAR_CCIIU
	// --START-PAC_IAX_FINANCIERA.F_GET_PERSONA_FIN(PSFINANCI, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_GET_PERSONA_FIN(java.math.BigDecimal pPSFINANCI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_GET_PERSONA_FIN(?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI" }, new Object[] { pPSFINANCI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_GET_PERSONA_FIN(java.math.BigDecimal pPSFINANCI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_GET_PERSONA_FIN(pPSFINANCI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_FINANCIERA.F_GET_PERSONA_FIN

	// INI - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n
	// patrimonial
	// --START-PAC_IAX_FINANCIERA.F_VPATRIMONIAL(PSFINANCI, PNMOVIMI, MENSAJES)
	private HashMap callPAC_IAX_FINANCIERA__F_VPATRIMONIAL(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_FINANCIERA.F_VPATRIMONIAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSFINANCI", "pPNMOVIMI" }, new Object[] { pPSFINANCI, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSFINANCI);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_FINANCIERA__F_VPATRIMONIAL(java.math.BigDecimal pPSFINANCI,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_FINANCIERA__F_VPATRIMONIAL(pPSFINANCI, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FINANCIERA.F_VPATRIMONIAL
	// FIN - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n
	// patrimonial
}
