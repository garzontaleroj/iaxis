package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DOMICILIACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DOMICILIACIONES.class);
	private Connection conn = null;

	public PAC_IAX_DOMICILIACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(PSPROCES, PCEMPRES, PFEFECTO,
	// PFFECCOB, PCRAMO, PSPRODUC)

	private HashMap callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFEFECTO, java.sql.Date pPFFECCOB,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES", "pPCEMPRES", "pPFEFECTO", "pPFFECCOB", "pPCRAMO", "pPSPRODUC" },
				new Object[] { pPSPROCES, pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPFEFECTO);
		cStmt.setObject(5, pPFFECCOB);
		cStmt.setObject(6, pPCRAMO);
		cStmt.setObject(7, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "SPROCES"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "NOMMAP1"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "NOMMAP2"
		cStmt.registerOutParameter(11, java.sql.Types.VARCHAR); // Valor de "NOMDR"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("SPROCES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("SPROCES", null);
		}
		try {
			retVal.put("NOMMAP1", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("NOMMAP1", null);
		}
		try {
			retVal.put("NOMMAP2", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("NOMMAP2", null);
		}
		try {
			retVal.put("NOMDR", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("NOMDR", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFEFECTO, java.sql.Date pPFFECCOB,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(pPSPROCES, pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO,
				pPSPRODUC);
	}
	// --END-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR

	// --START-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(PSPROCES, PCEMPRES,
	// PCRAMO, PSPRODUC, PFEFECTO, PSPRODOM, PCCOBBAN, PCBANCO, PCTIPCTA, PFVTOTAR,
	// PCREFEREN, PDFEFECTO)
	/*
	 * private HashMap
	 * callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(java.math.BigDecimal
	 * pPSPROCES, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
	 * java.math.BigDecimal pPSPRODUC, java.sql.Date pPFEFECTO, java.math.BigDecimal
	 * pPSPRODOM, java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCBANCO,
	 * java.math.BigDecimal pPCTIPCTA, String pPFVTOTAR, String pPCREFEREN,
	 * java.sql.Date pPDFEFECTO) throws Exception { String
	 * callQuery="{?=call PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] { "pPSPROCES", "pPCEMPRES", "pPCRAMO",
	 * "pPSPRODUC", "pPFEFECTO", "pPSPRODOM", "pPCCOBBAN", "pPCBANCO", "pPCTIPCTA",
	 * "pPFVTOTAR", "pPCREFEREN", "pPDFEFECTO" }, new Object[] { pPSPROCES,
	 * pPCEMPRES, pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM, pPCCOBBAN, pPCBANCO,
	 * pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO }); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSPROCES); cStmt.setObject(3, pPCEMPRES); cStmt.setObject(4, pPCRAMO);
	 * cStmt.setObject(5, pPSPRODUC); cStmt.setObject(6, pPFEFECTO);
	 * cStmt.setObject(7, pPSPRODOM); cStmt.setObject(9, pPCCOBBAN);
	 * cStmt.setObject(10, pPCBANCO); cStmt.setObject(11, pPCTIPCTA);
	 * cStmt.setObject(12, pPFVTOTAR); cStmt.setObject(13, pPCREFEREN);
	 * cStmt.setObject(14, pPDFEFECTO); cStmt.registerOutParameter(1,
	 * oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
	 * cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(8)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } retVal=new ConversionUtil().convertOracleObjects(retVal);
	 * //AXIS-WLS1SERVER-Ready cStmt.close(); //AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap
	 * ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(java.math.BigDecimal
	 * pPSPROCES, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
	 * java.math.BigDecimal pPSPRODUC, java.sql.Date pPFEFECTO, java.math.BigDecimal
	 * pPSPRODOM, java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCBANCO,
	 * java.math.BigDecimal pPCTIPCTA, String pPFVTOTAR, String pPCREFEREN,
	 * java.sql.Date pPDFEFECTO) throws Exception { return
	 * this.callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(pPSPROCES, pPCEMPRES,
	 * pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM, pPCCOBBAN, pPCBANCO, pPCTIPCTA,
	 * pPFVTOTAR, pPCREFEREN, pPDFEFECTO); //AXIS-WLS1SERVER-Ready }
	 */
	// --END-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION

	// --START-PAC_IAX_DOMICILIACIONES.F_GET_PROCESO()

	private HashMap callPAC_IAX_DOMICILIACIONES__F_GET_PROCESO() throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_GET_PROCESO(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_GET_PROCESO() throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_GET_PROCESO();
	}
	// --END-PAC_IAX_DOMICILIACIONES.F_GET_PROCESO

	// --START-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(PSPROCES, PCEMPRES,
	// PCRAMO, PSPRODUC, PFEFECTO, PSPRODOM)
	/*
	 * private HashMap callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION
	 * (java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCEMPRES,
	 * java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.sql.Date
	 * pPFEFECTO, java.math.BigDecimal pPSPRODOM) throws Exception { String
	 * callQuery="{?=call PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPSPROCES", "pPCEMPRES", "pPCRAMO",
	 * "pPSPRODUC", "pPFEFECTO", "pPSPRODOM"}, new Object[] {pPSPROCES, pPCEMPRES,
	 * pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPSPROCES); cStmt.setObject(3, pPCEMPRES); cStmt.setObject(4, pPCRAMO);
	 * cStmt.setObject(5, pPSPRODUC); cStmt.setObject(6, pPFEFECTO);
	 * cStmt.setObject(7, pPSPRODOM); cStmt.registerOutParameter(1,
	 * oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
	 * cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(8)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION
	 * (java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCEMPRES,
	 * java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.sql.Date
	 * pPFEFECTO, java.math.BigDecimal pPSPRODOM) throws Exception { return
	 * this.callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(pPSPROCES, pPCEMPRES,
	 * pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM); }
	 */
	// --END-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION
	// --START-PAC_IAX_DOMICILIACIONES.F_SET_PRODDOMIS(PCEMPRES, PSPROCES, PSPRODUC,
	// PSELECCIO)

	private HashMap callPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSELECCIO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_SET_PRODDOMIS(?, ?, ?, ?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSELECCIO)
			throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(pPCEMPRES, pPSPROCES, pPSPRODUC, pPSELECCIO);
	}

	// --END-PAC_IAX_DOMICILIACIONES.F_SET_PRODDOMIS
	// --START-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(PSPROCES, PCEMPRES, PFEFECTO,
	// PFFECCOB, PCRAMO, PSPRODUC, PSPRODOM, PCCOBBAN, PCBANCO, PCTIPCTA, PFVTOTAR,
	// PCREFEREN, PDFEFECTO, PCAGENTE, PTAGENTE, PNNUMIDE, PTTOMADOR, PNRECIBO)
	private HashMap callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFEFECTO, java.sql.Date pPFFECCOB,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSPRODOM,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA,
			String pPFVTOTAR, String pPCREFEREN, java.sql.Date pPDFEFECTO, java.math.BigDecimal pPCAGENTE,
			String pPTAGENTE, String pPNNUMIDE, String pPTTOMADOR, java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_DOMICILIAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPFEFECTO", "pPFFECCOB", "pPCRAMO", "pPSPRODUC", "pPSPRODOM",
						"pPCCOBBAN", "pPCBANCO", "pPCTIPCTA", "pPFVTOTAR", "pPCREFEREN", "pPDFEFECTO", "pPCAGENTE",
						"pPTAGENTE", "pPNNUMIDE", "pPTTOMADOR", "pPNRECIBO" },
				new Object[] { pPSPROCES, pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO, pPSPRODUC, pPSPRODOM, pPCCOBBAN,
						pPCBANCO, pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO, pPCAGENTE, pPTAGENTE, pPNNUMIDE,
						pPTTOMADOR, pPNRECIBO });
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
		cStmt.setObject(15, pPCAGENTE);
		cStmt.setObject(16, pPTAGENTE);
		cStmt.setObject(17, pPNNUMIDE);
		cStmt.setObject(18, pPTTOMADOR);
		cStmt.setObject(19, pPNRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(20, java.sql.Types.NUMERIC); // Valor de "SPROCES"
		cStmt.registerOutParameter(21, java.sql.Types.VARCHAR); // Valor de "NOMMAP1"
		cStmt.registerOutParameter(22, java.sql.Types.VARCHAR); // Valor de "NOMMAP2"
		cStmt.registerOutParameter(23, java.sql.Types.VARCHAR); // Valor de "NOMDR"
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
			retVal.put("SPROCES", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("SPROCES", null);
		}
		try {
			retVal.put("NOMMAP1", cStmt.getObject(21));
		} catch (SQLException e) {
			retVal.put("NOMMAP1", null);
		}
		try {
			retVal.put("NOMMAP2", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("NOMMAP2", null);
		}
		try {
			retVal.put("NOMDR", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("NOMDR", null);
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

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFEFECTO, java.sql.Date pPFFECCOB,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSPRODOM,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA,
			String pPFVTOTAR, String pPCREFEREN, java.sql.Date pPDFEFECTO, java.math.BigDecimal pPCAGENTE,
			String pPTAGENTE, String pPNNUMIDE, String pPTTOMADOR, java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(pPSPROCES, pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO,
				pPSPRODUC, pPSPRODOM, pPCCOBBAN, pPCBANCO, pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO, pPCAGENTE,
				pPTAGENTE, pPNNUMIDE, pPTTOMADOR, pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOMICILIACIONES.F_DOMICILIAR

	// --START-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION_CAB(PCEMPRES, PSPROCES,
	// PCCOBBAN, PFINIREM, PFFINREM)
	private HashMap callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION_CAB(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCCOBBAN, java.sql.Date pPFINIREM,
			java.sql.Date pPFFINREM) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION_CAB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES", "pPCCOBBAN", "pPFINIREM", "pPFFINREM" },
				new Object[] { pPCEMPRES, pPSPROCES, pPCCOBBAN, pPFINIREM, pPFFINREM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPCCOBBAN);
		cStmt.setObject(5, pPFINIREM);
		cStmt.setObject(6, pPFFINREM);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION_CAB(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCCOBBAN, java.sql.Date pPFINIREM,
			java.sql.Date pPFFINREM) throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION_CAB(pPCEMPRES, pPSPROCES, pPCCOBBAN, pPFINIREM,
				pPFFINREM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION_CAB

	// --START-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(PSPROCES, PCEMPRES,
	// PCRAMO, PSPRODUC, PFEFECTO, PSPRODOM, PCCOBBAN, PCBANCO, PCTIPCTA, PFVTOTAR,
	// PCREFEREN, PDFEFECTO, PCAGENTE, PTAGENTE, PNNUMIDE, PTTOMADOR, PNRECIBO)
	private HashMap callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFEFECTO, java.math.BigDecimal pPSPRODOM, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA, String pPFVTOTAR, String pPCREFEREN,
			java.sql.Date pPDFEFECTO, java.math.BigDecimal pPCAGENTE, String pPTAGENTE, String pPNNUMIDE,
			String pPTTOMADOR, java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPFEFECTO", "pPSPRODOM", "pPCCOBBAN",
						"pPCBANCO", "pPCTIPCTA", "pPFVTOTAR", "pPCREFEREN", "pPDFEFECTO", "pPCAGENTE", "pPTAGENTE",
						"pPNNUMIDE", "pPTTOMADOR", "pPNRECIBO" },
				new Object[] { pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC, pPFEFECTO, pPSPRODOM, pPCCOBBAN, pPCBANCO,
						pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO, pPCAGENTE, pPTAGENTE, pPNNUMIDE, pPTTOMADOR,
						pPNRECIBO });
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
		cStmt.setObject(15, pPCAGENTE);
		cStmt.setObject(16, pPTAGENTE);
		cStmt.setObject(17, pPNNUMIDE);
		cStmt.setObject(18, pPTTOMADOR);
		cStmt.setObject(19, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFEFECTO, java.math.BigDecimal pPSPRODOM, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCTIPCTA, String pPFVTOTAR, String pPCREFEREN,
			java.sql.Date pPDFEFECTO, java.math.BigDecimal pPCAGENTE, String pPTAGENTE, String pPNNUMIDE,
			String pPTTOMADOR, java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC,
				pPFEFECTO, pPSPRODOM, pPCCOBBAN, pPCBANCO, pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO, pPCAGENTE,
				pPTAGENTE, pPNNUMIDE, pPTTOMADOR, pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOMICILIACIONES.F_GET_DOMICILIACION

	// --START-PAC_IAX_DOMICILIACIONES.F_RETRO_DOMICILIACION(PCEMPRES, PSPROCES,
	// PFECHA, PCIDIOMA)
	private HashMap callPAC_IAX_DOMICILIACIONES__F_RETRO_DOMICILIACION(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.sql.Date pPFECHA, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_RETRO_DOMICILIACION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES", "pPFECHA", "pPCIDIOMA" },
				new Object[] { pPCEMPRES, pPSPROCES, pPFECHA, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_RETRO_DOMICILIACION(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.sql.Date pPFECHA, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_RETRO_DOMICILIACION(pPCEMPRES, pPSPROCES, pPFECHA, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOMICILIACIONES.F_RETRO_DOMICILIACION

	// --START-PAC_IAX_DOMICILIACIONES.F_SET_DOMICILIACION_CAB(PCEMPRES, PSPROCES,
	// PCCOBBAN, PFEFECTO, PTFILEENV, PTFILEDEV, PCESTDOM, PCREMBAN, PSDEVOLU,
	// PSPROCIE, PCIDIOMA)
	private HashMap callPAC_IAX_DOMICILIACIONES__F_SET_DOMICILIACION_CAB(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCCOBBAN, java.sql.Date pPFEFECTO, String pPTFILEENV,
			String pPTFILEDEV, java.math.BigDecimal pPCESTDOM, String pPCREMBAN, java.math.BigDecimal pPSDEVOLU,
			java.math.BigDecimal pPSPROCIE, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOMICILIACIONES.F_SET_DOMICILIACION_CAB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPSPROCES", "pPCCOBBAN", "pPFEFECTO", "pPTFILEENV", "pPTFILEDEV",
						"pPCESTDOM", "pPCREMBAN", "pPSDEVOLU", "pPSPROCIE", "pPCIDIOMA" },
				new Object[] { pPCEMPRES, pPSPROCES, pPCCOBBAN, pPFEFECTO, pPTFILEENV, pPTFILEDEV, pPCESTDOM, pPCREMBAN,
						pPSDEVOLU, pPSPROCIE, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPCCOBBAN);
		cStmt.setObject(5, pPFEFECTO);
		cStmt.setObject(6, pPTFILEENV);
		cStmt.setObject(7, pPTFILEDEV);
		cStmt.setObject(8, pPCESTDOM);
		cStmt.setObject(9, pPCREMBAN);
		cStmt.setObject(10, pPSDEVOLU);
		cStmt.setObject(11, pPSPROCIE);
		cStmt.setObject(12, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOMICILIACIONES__F_SET_DOMICILIACION_CAB(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCCOBBAN, java.sql.Date pPFEFECTO, String pPTFILEENV,
			String pPTFILEDEV, java.math.BigDecimal pPCESTDOM, String pPCREMBAN, java.math.BigDecimal pPSDEVOLU,
			java.math.BigDecimal pPSPROCIE, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_DOMICILIACIONES__F_SET_DOMICILIACION_CAB(pPCEMPRES, pPSPROCES, pPCCOBBAN, pPFEFECTO,
				pPTFILEENV, pPTFILEDEV, pPCESTDOM, pPCREMBAN, pPSDEVOLU, pPSPROCIE, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOMICILIACIONES.F_SET_DOMICILIACION_CAB

}
