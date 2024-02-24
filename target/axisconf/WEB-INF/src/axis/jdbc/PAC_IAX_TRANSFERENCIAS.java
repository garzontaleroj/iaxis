package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_TRANSFERENCIAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_TRANSFERENCIAS.class);
	private Connection conn = null;

	public PAC_IAX_TRANSFERENCIAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_TRANSFERENCIAS.F_ACTUALIZA_REMESAS_PREVIO(PSREMESA,
	// PCMARCADO)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_ACTUALIZA_REMESAS_PREVIO(java.math.BigDecimal pPSREMESA,
			java.math.BigDecimal pPCMARCADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_ACTUALIZA_REMESAS_PREVIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSREMESA", "pPCMARCADO" }, new Object[] { pPSREMESA, pPCMARCADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSREMESA);
		cStmt.setObject(3, pPCMARCADO);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_ACTUALIZA_REMESAS_PREVIO(java.math.BigDecimal pPSREMESA,
			java.math.BigDecimal pPCMARCADO) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_ACTUALIZA_REMESAS_PREVIO(pPSREMESA, pPCMARCADO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_ACTUALIZA_REMESAS_PREVIO
	// --START-PAC_IAX_TRANSFERENCIAS.F_GENERACION_FICHERO(PNREMESA, PFABONO)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GENERACION_FICHERO(java.math.BigDecimal pPNREMESA,
			java.sql.Date pPFABONO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GENERACION_FICHERO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREMESA", "pPFABONO" }, new Object[] { pPNREMESA, pPFABONO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREMESA);
		cStmt.setObject(3, pPFABONO);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GENERACION_FICHERO(java.math.BigDecimal pPNREMESA,
			java.sql.Date pPFABONO) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GENERACION_FICHERO(pPNREMESA, pPFABONO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_GENERACION_FICHERO
	// --START-PAC_IAX_TRANSFERENCIAS.F_GENERAR_FICHERO_EXCEL()
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL() throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GENERAR_FICHERO_EXCEL(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.VARCHAR); // Valor de "PARAMS_OUT"
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
			retVal.put("PARAMS_OUT", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PARAMS_OUT", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL() throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_GENERAR_FICHERO_EXCEL

	// --START-PAC_IAX_TRANSFERENCIAS.F_GENERAR_FICHERO_EXCEL(PPREVIO)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL(java.math.BigDecimal pPPREVIO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GENERAR_FICHERO_EXCEL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPREVIO" }, new Object[] { pPPREVIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(4, pPPREVIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.VARCHAR); // Valor de "PARAMS_OUT"
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
			retVal.put("PARAMS_OUT", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PARAMS_OUT", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL(java.math.BigDecimal pPPREVIO)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL(pPPREVIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_GENERAR_FICHERO_EXCEL

	// --START-PAC_IAX_TRANSFERENCIAS.F_GET_DESC_CONCEPTO(PTIPPROCESO)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(String pPTIPPROCESO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GET_DESC_CONCEPTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPPROCESO" }, new Object[] { pPTIPPROCESO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPPROCESO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTLITERA"
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
			retVal.put("PTLITERA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTLITERA", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(String pPTIPPROCESO) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(pPTIPPROCESO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_GET_DESC_CONCEPTO
	// --START-PAC_IAX_TRANSFERENCIAS.F_GET_DIAS_ABONO(PCEMPRES)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GET_DIAS_ABONO(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GET_DIAS_ABONO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNUMDIAS"
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
			retVal.put("PNUMDIAS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNUMDIAS", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DIAS_ABONO(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GET_DIAS_ABONO(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_GET_DIAS_ABONO
	// --START-PAC_IAX_TRANSFERENCIAS.F_GET_TRANSFERENCIAS(PCEMPRES, PAGRUPACION,
	// PCRAMO, PSPRODUC, PFABONOINI, PFABONOFIN, PFTRANSINI, PFTRANSFIN,
	// PCTRANSFERIDOS, PCTIPOBUSQUEDA, NREMESA, PCCC)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGRUPACION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFABONOINI, java.sql.Date pPFABONOFIN, java.sql.Date pPFTRANSINI, java.sql.Date pPFTRANSFIN,
			java.math.BigDecimal pPCTRANSFERIDOS, String pPCTIPOBUSQUEDA, java.math.BigDecimal pNREMESA, String pPCCC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GET_TRANSFERENCIAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPAGRUPACION", "pPCRAMO", "pPSPRODUC", "pPFABONOINI", "pPFABONOFIN",
						"pPFTRANSINI", "pPFTRANSFIN", "pPCTRANSFERIDOS", "pPCTIPOBUSQUEDA", "pNREMESA", "pPCCC" },
				new Object[] { pPCEMPRES, pPAGRUPACION, pPCRAMO, pPSPRODUC, pPFABONOINI, pPFABONOFIN, pPFTRANSINI,
						pPFTRANSFIN, pPCTRANSFERIDOS, pPCTIPOBUSQUEDA, pNREMESA, pPCCC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPAGRUPACION);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPFABONOINI);
		cStmt.setObject(7, pPFABONOFIN);
		cStmt.setObject(8, pPFTRANSINI);
		cStmt.setObject(9, pPFTRANSFIN);
		cStmt.setObject(10, pPCTRANSFERIDOS);
		cStmt.setObject(11, pPCTIPOBUSQUEDA);
		cStmt.setObject(12, pNREMESA);
		cStmt.setObject(13, pPCCC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURTRANSFERENCIAS"
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
			retVal.put("PCURTRANSFERENCIAS", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PCURTRANSFERENCIAS", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGRUPACION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFABONOINI, java.sql.Date pPFABONOFIN, java.sql.Date pPFTRANSINI, java.sql.Date pPFTRANSFIN,
			java.math.BigDecimal pPCTRANSFERIDOS, String pPCTIPOBUSQUEDA, java.math.BigDecimal pNREMESA, String pPCCC)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS(pPCEMPRES, pPAGRUPACION, pPCRAMO, pPSPRODUC,
				pPFABONOINI, pPFABONOFIN, pPFTRANSINI, pPFTRANSFIN, pPCTRANSFERIDOS, pPCTIPOBUSQUEDA, pNREMESA, pPCCC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_GET_TRANSFERENCIAS
	// --START-PAC_IAX_TRANSFERENCIAS.F_GET_TRANSFERENCIAS_AGRUP(PCEMPRES,
	// PAGRUPACION, PCRAMO, PSPRODUC, PFABONOINI, PFABONOFIN, PFTRANSINI,
	// PFTRANSFIN, PCTRANSFERIDOS, PCTIPOBUSQUEDA, NREMESA)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS_AGRUP(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGRUPACION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFABONOINI, java.sql.Date pPFABONOFIN, java.sql.Date pPFTRANSINI, java.sql.Date pPFTRANSFIN,
			java.math.BigDecimal pPCTRANSFERIDOS, String pPCTIPOBUSQUEDA, java.math.BigDecimal pNREMESA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GET_TRANSFERENCIAS_AGRUP(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPAGRUPACION", "pPCRAMO", "pPSPRODUC", "pPFABONOINI", "pPFABONOFIN",
						"pPFTRANSINI", "pPFTRANSFIN", "pPCTRANSFERIDOS", "pPCTIPOBUSQUEDA", "pNREMESA" },
				new Object[] { pPCEMPRES, pPAGRUPACION, pPCRAMO, pPSPRODUC, pPFABONOINI, pPFABONOFIN, pPFTRANSINI,
						pPFTRANSFIN, pPCTRANSFERIDOS, pPCTIPOBUSQUEDA, pNREMESA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPAGRUPACION);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPFABONOINI);
		cStmt.setObject(7, pPFABONOFIN);
		cStmt.setObject(8, pPFTRANSINI);
		cStmt.setObject(9, pPFTRANSFIN);
		cStmt.setObject(10, pPCTRANSFERIDOS);
		cStmt.setObject(11, pPCTIPOBUSQUEDA);
		cStmt.setObject(12, pNREMESA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURTRANSFERENCIAS"
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
			retVal.put("PCURTRANSFERENCIAS", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PCURTRANSFERENCIAS", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS_AGRUP(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGRUPACION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFABONOINI, java.sql.Date pPFABONOFIN, java.sql.Date pPFTRANSINI, java.sql.Date pPFTRANSFIN,
			java.math.BigDecimal pPCTRANSFERIDOS, String pPCTIPOBUSQUEDA, java.math.BigDecimal pNREMESA)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS_AGRUP(pPCEMPRES, pPAGRUPACION, pPCRAMO, pPSPRODUC,
				pPFABONOINI, pPFABONOFIN, pPFTRANSINI, pPFTRANSFIN, pPCTRANSFERIDOS, pPCTIPOBUSQUEDA, pNREMESA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_GET_TRANSFERENCIAS_AGRUP
	// --START-PAC_IAX_TRANSFERENCIAS.F_INSERT_REMESAS_PREVIO(PCEMPRES, PAGRUPACION,
	// PCRAMO, PSPRODUC, PFABONOINI, PFABONOFIN, PFTRANSINI, PFTRANSFIN,
	// PCTRANSFERIDOS, PNREMESA, PTIPPROCESO, PIIMPORTT, PSPERSON)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_INSERT_REMESAS_PREVIO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGRUPACION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFABONOINI, java.sql.Date pPFABONOFIN, java.sql.Date pPFTRANSINI, java.sql.Date pPFTRANSFIN,
			java.math.BigDecimal pPCTRANSFERIDOS, java.math.BigDecimal pPNREMESA, String pPTIPPROCESO,
			java.math.BigDecimal pPIIMPORTT, java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_INSERT_REMESAS_PREVIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPAGRUPACION", "pPCRAMO", "pPSPRODUC", "pPFABONOINI", "pPFABONOFIN",
						"pPFTRANSINI", "pPFTRANSFIN", "pPCTRANSFERIDOS", "pPNREMESA", "pPTIPPROCESO", "pPIIMPORTT",
						"pPSPERSON" },
				new Object[] { pPCEMPRES, pPAGRUPACION, pPCRAMO, pPSPRODUC, pPFABONOINI, pPFABONOFIN, pPFTRANSINI,
						pPFTRANSFIN, pPCTRANSFERIDOS, pPNREMESA, pPTIPPROCESO, pPIIMPORTT, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPAGRUPACION);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPFABONOINI);
		cStmt.setObject(7, pPFABONOFIN);
		cStmt.setObject(8, pPFTRANSINI);
		cStmt.setObject(9, pPFTRANSFIN);
		cStmt.setObject(10, pPCTRANSFERIDOS);
		cStmt.setObject(11, pPNREMESA);
		cStmt.setObject(12, pPTIPPROCESO);
		cStmt.setObject(13, pPIIMPORTT);
		cStmt.setObject(14, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_INSERT_REMESAS_PREVIO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGRUPACION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFABONOINI, java.sql.Date pPFABONOFIN, java.sql.Date pPFTRANSINI, java.sql.Date pPFTRANSFIN,
			java.math.BigDecimal pPCTRANSFERIDOS, java.math.BigDecimal pPNREMESA, String pPTIPPROCESO,
			java.math.BigDecimal pPIIMPORTT, java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_INSERT_REMESAS_PREVIO(pPCEMPRES, pPAGRUPACION, pPCRAMO, pPSPRODUC,
				pPFABONOINI, pPFABONOFIN, pPFTRANSINI, pPFTRANSFIN, pPCTRANSFERIDOS, pPNREMESA, pPTIPPROCESO,
				pPIIMPORTT, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_INSERT_REMESAS_PREVIO
	// --START-PAC_IAX_TRANSFERENCIAS.F_LIMPIA_REMESASPREVIO()
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_LIMPIA_REMESASPREVIO(?)}";

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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO() throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_LIMPIA_REMESASPREVIO
	// --START-PAC_IAX_TRANSFERENCIAS.F_REGISTROS_DUPLICADOS(PTIPOBUSQUEDA)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_REGISTROS_DUPLICADOS(String pPTIPOBUSQUEDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_REGISTROS_DUPLICADOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPOBUSQUEDA" }, new Object[] { pPTIPOBUSQUEDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPOBUSQUEDA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PHAYREGISTROS"
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
			retVal.put("PHAYREGISTROS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PHAYREGISTROS", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_REGISTROS_DUPLICADOS(String pPTIPOBUSQUEDA) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_REGISTROS_DUPLICADOS(pPTIPOBUSQUEDA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_REGISTROS_DUPLICADOS
	// --START-PAC_IAX_TRANSFERENCIAS.F_REGISTROS_PENDIENTES()
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_REGISTROS_PENDIENTES() throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_REGISTROS_PENDIENTES(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PHAYREGISTROS"
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
			retVal.put("PHAYREGISTROS", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PHAYREGISTROS", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_REGISTROS_PENDIENTES() throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_REGISTROS_PENDIENTES();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_REGISTROS_PENDIENTES
	// --START-PAC_IAX_TRANSFERENCIAS.F_TRANSFERIR(PCEMPRES, PFABONO)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_TRANSFERIR(java.math.BigDecimal pPCEMPRES, java.sql.Date pPFABONO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_TRANSFERIR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFABONO" }, new Object[] { pPCEMPRES, pPFABONO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFABONO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNREMESA"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PARAMS_OUT"
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
			retVal.put("PNREMESA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNREMESA", null);
		}
		try {
			retVal.put("PARAMS_OUT", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PARAMS_OUT", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_TRANSFERIR(java.math.BigDecimal pPCEMPRES, java.sql.Date pPFABONO)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_TRANSFERIR(pPCEMPRES, pPFABONO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_TRANSFERIR
	// --START-PAC_IAX_TRANSFERENCIAS.F_VALIDA_FABONO(PFABONO)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_VALIDA_FABONO(java.sql.Date pPFABONO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_VALIDA_FABONO(?, ?)}";

		logCall(callQuery, new String[] { "pPFABONO" }, new Object[] { pPFABONO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFABONO);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_VALIDA_FABONO(java.sql.Date pPFABONO) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_VALIDA_FABONO(pPFABONO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_VALIDA_FABONO

	// --START-PAC_IAX_TRANSFERENCIAS.F_GET_CUENTAS(PNREMESA, PCCC)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GET_CUENTAS(java.math.BigDecimal pPNREMESA, String pPCCC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GET_CUENTAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREMESA", "pPCCC" }, new Object[] { pPNREMESA, pPCCC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREMESA);
		cStmt.setObject(3, pPCCC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURBANCOS"
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
			retVal.put("PCURBANCOS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCURBANCOS", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_CUENTAS(java.math.BigDecimal pPNREMESA, String pPCCC)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GET_CUENTAS(pPNREMESA, pPCCC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_TRANSFERENCIAS.F_GET_CUENTAS
	// --START-PAC_IAX_TRANSFERENCIAS.F_GET_TOTAL(PNREMESA, PCCC)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GET_TOTAL(java.math.BigDecimal pPNREMESA, String pPCCC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GET_TOTAL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREMESA", "pPCCC" }, new Object[] { pPNREMESA, pPCCC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREMESA);
		cStmt.setObject(3, pPCCC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PTOTAL"
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
			retVal.put("PTOTAL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTOTAL", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TOTAL(java.math.BigDecimal pPNREMESA, String pPCCC)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GET_TOTAL(pPNREMESA, pPCCC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_GET_TOTAL

	// --START-PAC_IAX_TRANSFERENCIAS.F_SET_FCAMBIO(PSREMESA, PFCAMBIO)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_SET_FCAMBIO(java.math.BigDecimal pPSREMESA, java.sql.Date pPFCAMBIO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_SET_FCAMBIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSREMESA", "pPFCAMBIO" }, new Object[] { pPSREMESA, pPFCAMBIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSREMESA);
		cStmt.setObject(3, pPFCAMBIO);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_SET_FCAMBIO(java.math.BigDecimal pPSREMESA, java.sql.Date pPFCAMBIO)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_SET_FCAMBIO(pPSREMESA, pPFCAMBIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_SET_FCAMBIO

	// --START-PAC_IAX_TRANSFERENCIAS.F_GET_TRANS_RETENIDA(PCAGENTE)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_GET_TRANS_RETENIDA(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_GET_TRANS_RETENIDA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURTRANSFERENCIAS"
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
			retVal.put("PCURTRANSFERENCIAS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCURTRANSFERENCIAS", null);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TRANS_RETENIDA(java.math.BigDecimal pPCAGENTE)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_GET_TRANS_RETENIDA(pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_GET_TRANS_RETENIDA

	// --START-PAC_IAX_TRANSFERENCIAS.F_TRANS_RET_CANCELA(PSCLAVE)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_CANCELA(java.math.BigDecimal pPSCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_TRANS_RET_CANCELA(?, ?)}";

		logCall(callQuery, new String[] { "pPSCLAVE" }, new Object[] { pPSCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAVE);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_CANCELA(java.math.BigDecimal pPSCLAVE) throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_CANCELA(pPSCLAVE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_TRANS_RET_CANCELA

	// --START-PAC_IAX_TRANSFERENCIAS.F_TRANS_RET_DESBLOQUEA(PSCLAVE)
	private HashMap callPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_DESBLOQUEA(java.math.BigDecimal pPSCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRANSFERENCIAS.F_TRANS_RET_DESBLOQUEA(?, ?)}";

		logCall(callQuery, new String[] { "pPSCLAVE" }, new Object[] { pPSCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLAVE);
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

	public HashMap ejecutaPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_DESBLOQUEA(java.math.BigDecimal pPSCLAVE)
			throws Exception {
		return this.callPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_DESBLOQUEA(pPSCLAVE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRANSFERENCIAS.F_TRANS_RET_DESBLOQUEA

}
