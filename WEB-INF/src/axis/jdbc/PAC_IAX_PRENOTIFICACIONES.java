package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PRENOTIFICACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRENOTIFICACIONES.class);
	private Connection conn = null;

	public PAC_IAX_PRENOTIFICACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(PSPROCES, PCEMPRES, PFEFECTO,
	// PFFECCOB, PCRAMO, PSPRODUC)

	/*
	 * private HashMap callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, Date pPFEFECTO, Date pPFFECCOB, BigDecimal
	 * pPCRAMO, BigDecimal pPSPRODUC) throws Exception { String callQuery =
	 * "{?=call PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] { "pPSPROCES", "pPCEMPRES", "pPFEFECTO",
	 * "pPFFECCOB", "pPCRAMO", "pPSPRODUC" }, new Object[] { pPSPROCES, pPCEMPRES,
	 * pPFEFECTO, pPFFECCOB, pPCRAMO, pPSPRODUC }); CallableStatement cStmt =
	 * conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSPROCES); cStmt.setObject(3, pPCEMPRES); cStmt.setObject(4, pPFEFECTO);
	 * cStmt.setObject(5, pPFFECCOB); cStmt.setObject(6, pPCRAMO);
	 * cStmt.setObject(7, pPSPRODUC); cStmt.registerOutParameter(1, Types.NUMERIC);
	 * // Valor de "RETURN" cStmt.registerOutParameter(8, Types.NUMERIC); // Valor
	 * de "SPROCES" cStmt.registerOutParameter(9, Types.VARCHAR); // Valor de
	 * "NOMMAP1" cStmt.registerOutParameter(10, Types.VARCHAR); // Valor de
	 * "NOMMAP2" cStmt.registerOutParameter(11, Types.VARCHAR); // Valor de "NOMDR"
	 * cStmt.registerOutParameter(12, OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal = new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("SPROCES",
	 * cStmt.getObject(8)); } catch (SQLException e) { retVal.put("SPROCES", null);
	 * } try { retVal.put("NOMMAP1", cStmt.getObject(9)); } catch (SQLException e) {
	 * retVal.put("NOMMAP1", null); } try { retVal.put("NOMMAP2",
	 * cStmt.getObject(10)); } catch (SQLException e) { retVal.put("NOMMAP2", null);
	 * } try { retVal.put("NOMDR", cStmt.getObject(11)); } catch (SQLException e) {
	 * retVal.put("NOMDR", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(12)); } catch (SQLException e) { retVal.put("MENSAJES",
	 * null); } cStmt.close();
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, Date pPFEFECTO, Date pPFFECCOB, BigDecimal
	 * pPCRAMO, BigDecimal pPSPRODUC) throws Exception { return new
	 * ConversionUtil().convertOracleObjects(this.
	 * callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(pPSPROCES, pPCEMPRES, pPFEFECTO,
	 * pPFFECCOB, pPCRAMO, pPSPRODUC)); }
	 * //--END-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR
	 * 
	 * //--START-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(PSPROCES, PCEMPRES,
	 * PCRAMO, PSPRODUC, PFEFECTO)
	 * 
	 * private HashMap callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, BigDecimal pPCRAMO, BigDecimal pPSPRODUC,
	 * Date pPFEFECTO) throws Exception { String callQuery =
	 * "{?=call PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(?, ?, ?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] { "pPSPROCES", "pPCEMPRES", "pPCRAMO",
	 * "pPSPRODUC", "pPFEFECTO" }, new Object[] { pPSPROCES, pPCEMPRES, pPCRAMO,
	 * pPSPRODUC, pPFEFECTO }); CallableStatement cStmt =
	 * conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSPROCES); cStmt.setObject(3, pPCEMPRES); cStmt.setObject(4, pPCRAMO);
	 * cStmt.setObject(5, pPSPRODUC); cStmt.setObject(6, pPFEFECTO);
	 * cStmt.registerOutParameter(1, OracleTypes.CURSOR); // Valor de "RETURN"
	 * cStmt.registerOutParameter(7, OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal = new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(7)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } cStmt.close();
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, BigDecimal pPCRAMO, BigDecimal pPSPRODUC,
	 * Date pPFEFECTO) throws Exception { return new
	 * ConversionUtil().convertOracleObjects(this.
	 * callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(pPSPROCES, pPCEMPRES,
	 * pPCRAMO, pPSPRODUC, pPFEFECTO)); }
	 * //--END-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION
	 * 
	 * //--START-PAC_IAX_DOMICILIACIONES.F_GET_PROCESO()
	 * 
	 * private HashMap callPAC_IAX_DOMICILIACIONES__F_GET_PROCESO() throws Exception
	 * { String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_GET_PROCESO(?, ?)}";
	 * 
	 * logCall(callQuery, new String[] { }, new Object[] { }); CallableStatement
	 * cStmt = conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.registerOutParameter(1,
	 * Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(2,
	 * Types.NUMERIC); // Valor de "PSPROCES" cStmt.registerOutParameter(3,
	 * OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal = new HashMap(); try { retVal.put("RETURN",
	 * cStmt.getObject(1)); } catch (SQLException e) { retVal.put("RETURN", null); }
	 * try { retVal.put("PSPROCES", cStmt.getObject(2)); } catch (SQLException e) {
	 * retVal.put("PSPROCES", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(3)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } cStmt.close();
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_GET_PROCESO() throws
	 * Exception { return new ConversionUtil().convertOracleObjects(this.
	 * callPAC_IAX_DOMICILIACIONES__F_GET_PROCESO()); }
	 * //--END-PAC_IAX_DOMICILIACIONES.F_GET_PROCESO
	 * 
	 * //--START-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(PSPROCES, PCEMPRES,
	 * PCRAMO, PSPRODUC, PFEFECTO, PSPRODOM)
	 * 
	 * private HashMap callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, BigDecimal pPCRAMO, BigDecimal pPSPRODUC,
	 * Date pPFEFECTO, BigDecimal pPSPRODOM) throws Exception { String callQuery =
	 * "{?=call PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(?, ?, ?, ?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] { "pPSPROCES", "pPCEMPRES", "pPCRAMO",
	 * "pPSPRODUC", "pPFEFECTO", "pPSPRODOM" }, new Object[] { pPSPROCES, pPCEMPRES,
	 * pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM }); CallableStatement cStmt =
	 * conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSPROCES); cStmt.setObject(3, pPCEMPRES); cStmt.setObject(4, pPCRAMO);
	 * cStmt.setObject(5, pPSPRODUC); cStmt.setObject(6, pPFEFECTO);
	 * cStmt.setObject(7, pPSPRODOM); cStmt.registerOutParameter(1,
	 * OracleTypes.CURSOR); // Valor de "RETURN" cStmt.registerOutParameter(8,
	 * OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal = new HashMap(); try { retVal.put("RETURN",
	 * cStmt.getObject(1)); } catch (SQLException e) { retVal.put("RETURN", null); }
	 * try { retVal.put("MENSAJES", cStmt.getObject(8)); } catch (SQLException e) {
	 * retVal.put("MENSAJES", null); } cStmt.close();
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, BigDecimal pPCRAMO, BigDecimal pPSPRODUC,
	 * Date pPFEFECTO, BigDecimal pPSPRODOM) throws Exception { return new
	 * ConversionUtil().convertOracleObjects(this.
	 * callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(pPSPROCES, pPCEMPRES,
	 * pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM)); }
	 * //--END-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION
	 * //--START-PAC_IAX_DOMICILIACIONES.F_SET_PRODDOMIS(PCEMPRES, PSPROCES,
	 * PSPRODUC, PSELECCIO)
	 * 
	 * private HashMap callPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(BigDecimal
	 * pPCEMPRES, BigDecimal pPSPROCES, BigDecimal pPSPRODUC, BigDecimal pPSELECCIO)
	 * throws Exception { String callQuery =
	 * "{?=call PAC_IAX_DOMICILIACIONES.F_SET_PRODDOMIS(?, ?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES", "pPSPRODUC",
	 * "pPSELECCIO" }, new Object[] { pPCEMPRES, pPSPROCES, pPSPRODUC, pPSELECCIO
	 * }); CallableStatement cStmt = conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCEMPRES); cStmt.setObject(3, pPSPROCES); cStmt.setObject(4, pPSPRODUC);
	 * cStmt.setObject(5, pPSELECCIO); cStmt.registerOutParameter(1, Types.NUMERIC);
	 * // Valor de "RETURN" cStmt.registerOutParameter(6, OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal = new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(6)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } cStmt.close();
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(BigDecimal
	 * pPCEMPRES, BigDecimal pPSPROCES, BigDecimal pPSPRODUC, BigDecimal pPSELECCIO)
	 * throws Exception { return new ConversionUtil().convertOracleObjects(this.
	 * callPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(pPCEMPRES, pPSPROCES, pPSPRODUC,
	 * pPSELECCIO)); } //--END-PAC_IAX_DOMICILIACIONES.F_SET_PRODDOMIS
	 * //--START-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(PSPROCES, PCEMPRES, PFEFECTO,
	 * PFFECCOB, PCRAMO, PSPRODUC, PSPRODOM)
	 * 
	 * private HashMap callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, Date pPFEFECTO, Date pPFFECCOB, BigDecimal
	 * pPCRAMO, BigDecimal pPSPRODUC, BigDecimal pPSPRODOM) throws Exception {
	 * String callQuery =
	 * "{?=call PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] { "pPSPROCES", "pPCEMPRES", "pPFEFECTO",
	 * "pPFFECCOB", "pPCRAMO", "pPSPRODUC", "pPSPRODOM" }, new Object[] { pPSPROCES,
	 * pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO, pPSPRODUC, pPSPRODOM });
	 * CallableStatement cStmt = conn.prepareCall(callQuery); String USERNAME =
	 * conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSPROCES); cStmt.setObject(3, pPCEMPRES); cStmt.setObject(4, pPFEFECTO);
	 * cStmt.setObject(5, pPFFECCOB); cStmt.setObject(6, pPCRAMO);
	 * cStmt.setObject(7, pPSPRODUC); cStmt.setObject(8, pPSPRODOM);
	 * cStmt.registerOutParameter(1, Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(9, Types.NUMERIC); // Valor de "SPROCES"
	 * cStmt.registerOutParameter(10, Types.VARCHAR); // Valor de "NOMMAP1"
	 * cStmt.registerOutParameter(11, Types.VARCHAR); // Valor de "NOMMAP2"
	 * cStmt.registerOutParameter(12, Types.VARCHAR); // Valor de "NOMDR"
	 * cStmt.registerOutParameter(13, OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal = new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("SPROCES",
	 * cStmt.getObject(9)); } catch (SQLException e) { retVal.put("SPROCES", null);
	 * } try { retVal.put("NOMMAP1", cStmt.getObject(10)); } catch (SQLException e)
	 * { retVal.put("NOMMAP1", null); } try { retVal.put("NOMMAP2",
	 * cStmt.getObject(11)); } catch (SQLException e) { retVal.put("NOMMAP2", null);
	 * } try { retVal.put("NOMDR", cStmt.getObject(12)); } catch (SQLException e) {
	 * retVal.put("NOMDR", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(13)); } catch (SQLException e) { retVal.put("MENSAJES",
	 * null); } cStmt.close();
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(BigDecimal
	 * pPSPROCES, BigDecimal pPCEMPRES, Date pPFEFECTO, Date pPFFECCOB, BigDecimal
	 * pPCRAMO, BigDecimal pPSPRODUC, BigDecimal pPSPRODOM) throws Exception {
	 * return new ConversionUtil().convertOracleObjects(this.
	 * callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(pPSPROCES, pPCEMPRES, pPFEFECTO,
	 * pPFFECCOB, pPCRAMO, pPSPRODUC, pPSPRODOM)); }
	 * //--END-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR
	 */

	// --START-PAC_IAX_PRENOTIFICACIONES.F_DOMICILIAR(PSPROCES, PCEMPRES, PFEFECTO,
	// PFFECCOB, PCRAMO, PSPRODUC, PSPRODOM, PCCOBBAN, PCBANCO, PCTIPCTA, PFVTOTAR,
	// PCREFEREN, PDFEFECTO)
	private HashMap callPAC_IAX_PRENOTIFICACIONES__F_DOMICILIAR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFEFECTO, java.sql.Date pPFFECCOB,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSPRODOM,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA,
			String pPFVTOTAR, String pPCREFEREN, java.sql.Date pPDFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRENOTIFICACIONES.F_DOMICILIAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPFEFECTO", "pPFFECCOB", "pPCRAMO", "pPSPRODUC", "pPSPRODOM",
						"pPCCOBBAN", "pPCBANCO", "pPCTIPCTA", "pPFVTOTAR", "pPCREFEREN", "pPDFEFECTO" },
				new Object[] { pPSPROCES, pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO, pPSPRODUC, pPSPRODOM, pPCCOBBAN,
						pPCBANCO, pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPFEFECTO);
		cStmt.setObject(5, pPFFECCOB);
		cStmt.setObject(6, pPCRAMO);
		cStmt.setObject(7, pPSPRODUC);
		cStmt.setObject(8, pPSPRODOM);
		cStmt.setObject(9, pPCCOBBAN);
		cStmt.setObject(10, pPCBANCO);
		cStmt.setObject(11, pPCTIPCTA);
		cStmt.setObject(12, pPFVTOTAR);
		cStmt.setObject(13, pPCREFEREN);
		cStmt.setObject(14, pPDFEFECTO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de "SPROCES"
		cStmt.registerOutParameter(16, java.sql.Types.VARCHAR); // Valor de "NOMMAP1"
		cStmt.registerOutParameter(17, java.sql.Types.VARCHAR); // Valor de "NOMMAP2"
		cStmt.registerOutParameter(18, java.sql.Types.VARCHAR); // Valor de "NOMDR"
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
			retVal.put("SPROCES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("SPROCES", null);
		}
		try {
			retVal.put("NOMMAP1", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("NOMMAP1", null);
		}
		try {
			retVal.put("NOMMAP2", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("NOMMAP2", null);
		}
		try {
			retVal.put("NOMDR", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("NOMDR", null);
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

	public HashMap ejecutaPAC_IAX_PRENOTIFICACIONES__F_DOMICILIAR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFEFECTO, java.sql.Date pPFFECCOB,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSPRODOM,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA,
			String pPFVTOTAR, String pPCREFEREN, java.sql.Date pPDFEFECTO) throws Exception {
		return this.callPAC_IAX_PRENOTIFICACIONES__F_DOMICILIAR(pPSPROCES, pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO,
				pPSPRODUC, pPSPRODOM, pPCCOBBAN, pPCBANCO, pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRENOTIFICACIONES.F_DOMICILIAR
	// --START-PAC_IAX_PRENOTIFICACIONES.F_GET_DOMICILIACION(PSPROCES, PCEMPRES,
	// PCRAMO, PSPRODUC, PFEFECTO, PSPRODOM, PCCOBBAN, PCBANCO, PCTIPCTA, PFVTOTAR,
	// PCREFEREN, PDFEFECTO)
	private HashMap callPAC_IAX_PRENOTIFICACIONES__F_GET_DOMICILIACION(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFEFECTO, java.math.BigDecimal pPSPRODOM, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA, String pPFVTOTAR, String pPCREFEREN,
			java.sql.Date pPDFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRENOTIFICACIONES.F_GET_DOMICILIACION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPFEFECTO", "pPSPRODOM", "pPCCOBBAN",
						"pPCBANCO", "pPCTIPCTA", "pPFVTOTAR", "pPCREFEREN", "pPDFEFECTO" },
				new Object[] { pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM, pPCCOBBAN, pPCBANCO,
						pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPFEFECTO);
		cStmt.setObject(7, pPSPRODOM);
		cStmt.setObject(9, pPCCOBBAN);
		cStmt.setObject(10, pPCBANCO);
		cStmt.setObject(11, pPCTIPCTA);
		cStmt.setObject(12, pPFVTOTAR);
		cStmt.setObject(13, pPCREFEREN);
		cStmt.setObject(14, pPDFEFECTO);
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

	public HashMap ejecutaPAC_IAX_PRENOTIFICACIONES__F_GET_DOMICILIACION(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFEFECTO, java.math.BigDecimal pPSPRODOM, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA, String pPFVTOTAR, String pPCREFEREN,
			java.sql.Date pPDFEFECTO) throws Exception {
		return this.callPAC_IAX_PRENOTIFICACIONES__F_GET_DOMICILIACION(pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC,
				pPFEFECTO, pPSPRODOM, pPCCOBBAN, pPCBANCO, pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRENOTIFICACIONES.F_GET_DOMICILIACION
	// --START-PAC_IAX_PRENOTIFICACIONES.F_GET_PROCESO()
	private HashMap callPAC_IAX_PRENOTIFICACIONES__F_GET_PROCESO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRENOTIFICACIONES.F_GET_PROCESO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
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
			retVal.put("PSPROCES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_PRENOTIFICACIONES__F_GET_PROCESO() throws Exception {
		return this.callPAC_IAX_PRENOTIFICACIONES__F_GET_PROCESO();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRENOTIFICACIONES.F_GET_PROCESO
	// --START-PAC_IAX_PRENOTIFICACIONES.F_SET_PRODDOMIS(PCEMPRES, PSPROCES,
	// PSPRODUC, PSELECCIO)
	private HashMap callPAC_IAX_PRENOTIFICACIONES__F_SET_PRODDOMIS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSELECCIO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRENOTIFICACIONES.F_SET_PRODDOMIS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES", "pPSPRODUC", "pPSELECCIO" },
				new Object[] { pPCEMPRES, pPSPROCES, pPSPRODUC, pPSELECCIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPSELECCIO);
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

	public HashMap ejecutaPAC_IAX_PRENOTIFICACIONES__F_SET_PRODDOMIS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSELECCIO)
			throws Exception {
		return this.callPAC_IAX_PRENOTIFICACIONES__F_SET_PRODDOMIS(pPCEMPRES, pPSPROCES, pPSPRODUC, pPSELECCIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRENOTIFICACIONES.F_SET_PRODDOMIS

	// --START-PAC_IAX_PRENOTIFICACIONES.F_DOMRECIBOS(PCEMPRES, PSPROCES, PFCOBRO)
	private HashMap callPAC_IAX_PRENOTIFICACIONES__F_DOMRECIBOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.sql.Date pPFCOBRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRENOTIFICACIONES.F_DOMRECIBOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES", "pPFCOBRO" },
				new Object[] { pPCEMPRES, pPSPROCES, pPFCOBRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(5, pPFCOBRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PRUTA"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "VTIMP"
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
			retVal.put("PRUTA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PRUTA", null);
		}
		try {
			retVal.put("VTIMP", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("VTIMP", null);
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

	public HashMap ejecutaPAC_IAX_PRENOTIFICACIONES__F_DOMRECIBOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.sql.Date pPFCOBRO) throws Exception {
		return this.callPAC_IAX_PRENOTIFICACIONES__F_DOMRECIBOS(pPCEMPRES, pPSPROCES, pPFCOBRO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRENOTIFICACIONES.F_DOMRECIBOS

}
