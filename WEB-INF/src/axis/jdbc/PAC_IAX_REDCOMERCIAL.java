//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #

package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

//WLS-Ready

public class PAC_IAX_REDCOMERCIAL extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_REDCOMERCIAL.class);
	private Connection conn = null;

	public PAC_IAX_REDCOMERCIAL(Connection conn) {
		this.conn = conn;
	}
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_ARBOLREDCOMERCIAL(PEMPRESA, PFECHA,
	// PCAGENTE, PNOMAGENTE, PTIPAGENTE, PACTIVO, PCBUSQUEDA)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_ARBOLREDCOMERCIAL(java.math.BigDecimal pPEMPRESA,
			java.sql.Date pPFECHA, java.math.BigDecimal pPCAGENTE, String pPNOMAGENTE, java.math.BigDecimal pPTIPAGENTE,
			java.math.BigDecimal pPACTIVO, java.math.BigDecimal pPCBUSQUEDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_ARBOLREDCOMERCIAL(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPEMPRESA", "pPFECHA", "pPCAGENTE", "pPNOMAGENTE", "pPTIPAGENTE", "pPACTIVO",
						"pPCBUSQUEDA" },
				new Object[] { pPEMPRESA, pPFECHA, pPCAGENTE, pPNOMAGENTE, pPTIPAGENTE, pPACTIVO, pPCBUSQUEDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPFECHA);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPNOMAGENTE);
		cStmt.setObject(6, pPTIPAGENTE);
		cStmt.setObject(7, pPACTIVO);
		cStmt.setObject(8, pPCBUSQUEDA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_ARBOLREDCOMERCIAL(java.math.BigDecimal pPEMPRESA,
			java.sql.Date pPFECHA, java.math.BigDecimal pPCAGENTE, String pPNOMAGENTE, java.math.BigDecimal pPTIPAGENTE,
			java.math.BigDecimal pPACTIVO, java.math.BigDecimal pPCBUSQUEDA) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_ARBOLREDCOMERCIAL(pPEMPRESA, pPFECHA, pPCAGENTE, pPNOMAGENTE,
				pPTIPAGENTE, pPACTIVO, pPCBUSQUEDA);
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_ARBOLREDCOMERCIAL
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_DATOSAGENTE(PCAGENTE)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_DATOSAGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTRATOS".toUpperCase())); // Valor de "CONTRATOS"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGENTES".toUpperCase())); // Valor de "AGENTE"
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
			retVal.put("CONTRATOS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("CONTRATOS", null);
		}
		try {
			retVal.put("AGENTE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("AGENTE", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(pPCAGENTE);
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_DATOSAGENTE
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_REDCOMERCIAL(PCAGENTE, PCEMPRES)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_REDCOMERCIAL(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_REDCOMERCIAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCEMPRES" }, new Object[] { pPCAGENTE, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_REDCOMERCIAL".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_REDCOMERCIAL(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_REDCOMERCIAL(pPCAGENTE, pPCEMPRES);
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_REDCOMERCIAL
	// --START-PAC_IAX_REDCOMERCIAL.F_SET_AGENTE(PCAGENTE, PCRETENC, PCTIPIVA,
	// PSPERSON, PCCOMISI, PCTIPAGE, PCACTIVO, PCDOMICI, PCBANCAR, PNCOLEGI,
	// PFBAJAGE, PCTIPBAN)
	/*
	 * private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_AGENTE(java.math.BigDecimal
	 * pPCAGENTE, java.math.BigDecimal pPCRETENC, java.math.BigDecimal pPCTIPIVA,
	 * java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCOMISI,
	 * java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPCACTIVO,
	 * java.math.BigDecimal pPCDOMICI, String pPCBANCAR, java.math.BigDecimal
	 * pPNCOLEGI, java.sql.Date pPFBAJAGE, java.math.BigDecimal pPCTIPBAN) throws
	 * Exception { String
	 * callQuery="{?=call PAC_IAX_REDCOMERCIAL.F_SET_AGENTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] { "pPCAGENTE", "pPCRETENC", "pPCTIPIVA",
	 * "pPSPERSON", "pPCCOMISI", "pPCTIPAGE", "pPCACTIVO", "pPCDOMICI", "pPCBANCAR",
	 * "pPNCOLEGI", "pPFBAJAGE", "pPCTIPBAN" }, new Object[] { pPCAGENTE, pPCRETENC,
	 * pPCTIPIVA, pPSPERSON, pPCCOMISI, pPCTIPAGE, pPCACTIVO, pPCDOMICI, pPCBANCAR,
	 * pPNCOLEGI, pPFBAJAGE, pPCTIPBAN }); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCAGENTE); cStmt.setObject(3, pPCRETENC); cStmt.setObject(4, pPCTIPIVA);
	 * cStmt.setObject(5, pPSPERSON); cStmt.setObject(6, pPCCOMISI);
	 * cStmt.setObject(7, pPCTIPAGE); cStmt.setObject(8, pPCACTIVO);
	 * cStmt.setObject(9, pPCDOMICI); cStmt.setObject(10, pPCBANCAR);
	 * cStmt.setObject(11, pPNCOLEGI); cStmt.setObject(12, pPFBAJAGE);
	 * cStmt.setObject(13, pPCTIPBAN); cStmt.registerOutParameter(1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(14,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal=new HashMap(); try { retVal.put("RETURN", cStmt.getObject(1));
	 * } catch (SQLException e) { retVal.put("RETURN", null); } try {
	 * retVal.put("MENSAJES", cStmt.getObject(14)); } catch (SQLException e) {
	 * retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
	 * cStmt.close(); //AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_AGENTE(java.math.BigDecimal
	 * pPCAGENTE, java.math.BigDecimal pPCRETENC, java.math.BigDecimal pPCTIPIVA,
	 * java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCOMISI,
	 * java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPCACTIVO,
	 * java.math.BigDecimal pPCDOMICI, String pPCBANCAR, java.math.BigDecimal
	 * pPNCOLEGI, java.sql.Date pPFBAJAGE, java.math.BigDecimal pPCTIPBAN) throws
	 * Exception { return this.callPAC_IAX_REDCOMERCIAL__F_SET_AGENTE(pPCAGENTE,
	 * pPCRETENC, pPCTIPIVA, pPSPERSON, pPCCOMISI, pPCTIPAGE, pPCACTIVO, pPCDOMICI,
	 * pPCBANCAR, pPNCOLEGI, pPFBAJAGE, pPCTIPBAN); }
	 */
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_AGENTE

	// --START-PAC_IAX_REDCOMERCIAL.F_SET_CONTRATO(PCEMPRES, PCAGENTE, PNCONTRATO,
	// PFFIRCON)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_CONTRATO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNCONTRATO, java.sql.Date pPFFIRCON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_CONTRATO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCAGENTE", "pPNCONTRATO", "pPFFIRCON" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPNCONTRATO, pPFFIRCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPNCONTRATO);
		cStmt.setObject(5, pPFFIRCON);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_CONTRATO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNCONTRATO, java.sql.Date pPFFIRCON)
			throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_CONTRATO(pPCEMPRES, pPCAGENTE, pPNCONTRATO, pPFFIRCON);
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_CONTRATO

	// --START-PAC_IAX_REDCOMERCIAL.F_SET_REDCOMERCIAL(PCEMPRES, PCAGENTE, PFECHA,
	// PCPADRE, PCCOMINDT, PCPREVISIO, PCPRENIVEL, PCAGEIND, PCPOLVISIO, PCPOLNIVEL,
	// CDOMICI)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_REDCOMERCIAL(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFECHA, java.math.BigDecimal pPCPADRE,
			java.math.BigDecimal pPCCOMINDT, java.math.BigDecimal pPCPREVISIO, java.math.BigDecimal pPCPRENIVEL,
			java.math.BigDecimal pPCAGEIND, java.math.BigDecimal pPCPOLVISIO, java.math.BigDecimal pPCPOLNIVEL,
			java.math.BigDecimal pPCENLACE, java.math.BigDecimal pPCDOMICIAGE) throws Exception { // IAXIS-2415
																									// 27/02/2019
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_REDCOMERCIAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"; // IAXIS-2415
																														// 27/02/2019

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCAGENTE", "pPFECHA", "pPCPADRE", "pPCCOMINDT", "pPCPREVISIO",
						"pPCPRENIVEL", "pPCAGEIND", "pPCPOLVISIO", "pPCPOLNIVEL", "pPCENLACE", "pPCDOMICIAGE" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPFECHA, pPCPADRE, pPCCOMINDT, pPCPREVISIO, pPCPRENIVEL, pPCAGEIND,
						pPCPOLVISIO, pPCPOLNIVEL, pPCENLACE, pPCDOMICIAGE }); // IAXIS-2415 27/02/2019
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPCPADRE);
		cStmt.setObject(6, pPCCOMINDT);
		cStmt.setObject(7, pPCPREVISIO);
		cStmt.setObject(8, pPCPRENIVEL);
		cStmt.setObject(9, pPCAGEIND);
		cStmt.setObject(10, pPCPOLVISIO);
		cStmt.setObject(11, pPCPOLNIVEL);
		cStmt.setObject(12, pPCENLACE);
		cStmt.setObject(13, pPCDOMICIAGE); // IAXIS-2415 27/02/2019
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_REDCOMERCIAL(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFECHA, java.math.BigDecimal pPCPADRE,
			java.math.BigDecimal pPCCOMINDT, java.math.BigDecimal pPCPREVISIO, java.math.BigDecimal pPCPRENIVEL,
			java.math.BigDecimal pPCAGEIND, java.math.BigDecimal pPCPOLVISIO, java.math.BigDecimal pPCPOLNIVEL,
			java.math.BigDecimal pPCENLACE, java.math.BigDecimal pPCDOMICIAGE) throws Exception { // IAXIS-2415
																									// 27/02/2019
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_REDCOMERCIAL(pPCEMPRES, pPCAGENTE, pPFECHA, pPCPADRE, pPCCOMINDT,
				pPCPREVISIO, pPCPRENIVEL, pPCAGEIND, pPCPOLVISIO, pPCPOLNIVEL, pPCENLACE, pPCDOMICIAGE);// AXIS-WLS1SERVER-Ready
																										// //IAXIS-2415
																										// 27/02/2019
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_REDCOMERCIAL

	/*
	 * //--START-PAC_IAX_REDCOMERCIAL.F_GET_AGENTES(PEMPRESA, PFECHA, PCAGENTE,
	 * PNOMAGENTE, PTIPAGENTE, PACTIVO)
	 * 
	 * private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(java.math.BigDecimal
	 * pPEMPRESA, java.sql.Date pPFECHA, java.math.BigDecimal pPCAGENTE, String
	 * pPNOMAGENTE, java.math.BigDecimal pPTIPAGENTE, java.math.BigDecimal pPACTIVO)
	 * throws Exception { String
	 * callQuery="{?=call PAC_IAX_REDCOMERCIAL.F_GET_AGENTES(?, ?, ?, ?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] { "pPEMPRESA", "pPFECHA", "pPCAGENTE",
	 * "pPNOMAGENTE", "pPTIPAGENTE", "pPACTIVO" }, new Object[] { pPEMPRESA,
	 * pPFECHA, pPCAGENTE, pPNOMAGENTE, pPTIPAGENTE, pPACTIVO }); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPEMPRESA); cStmt.setObject(3, pPFECHA); cStmt.setObject(4, pPCAGENTE);
	 * cStmt.setObject(5, pPNOMAGENTE); cStmt.setObject(6, pPTIPAGENTE);
	 * cStmt.setObject(7, pPACTIVO); cStmt.registerOutParameter(1,
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
	 * ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(java.math.BigDecimal pPEMPRESA,
	 * java.sql.Date pPFECHA, java.math.BigDecimal pPCAGENTE, String pPNOMAGENTE,
	 * java.math.BigDecimal pPTIPAGENTE, java.math.BigDecimal pPACTIVO) throws
	 * Exception { return this.callPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(pPEMPRESA,
	 * pPFECHA, pPCAGENTE, pPNOMAGENTE, pPTIPAGENTE, pPACTIVO); }
	 * //--END-PAC_IAX_REDCOMERCIAL.F_GET_AGENTES
	 */
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_AGENTES(PEMPRESA, PFECHA, PCAGENTE,
	// PNOMAGENTE, PTIPAGENTE, PACTIVO, PCTIPMED, PAGRUPADOR, PNNUMIDE, PCPOSTAL,
	// PTELEFONO, PTNOMCOM, PFAX, PMAIL, PCAGE00, PCAGE01, PCAGE02, PCAGE03,
	// PCAGE04, PCAGE05, PCAGE06, PCAGE07, PCAGE08, PCAGE09, PCAGE10, PCAGE11,
	// PCAGE12)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(java.math.BigDecimal pPEMPRESA, java.sql.Date pPFECHA,
			java.math.BigDecimal pPCAGENTE, String pPNOMAGENTE, java.math.BigDecimal pPTIPAGENTE,
			java.math.BigDecimal pPACTIVO, java.math.BigDecimal pPCTIPMED, java.math.BigDecimal pPAGRUPADOR,
			String pPNNUMIDE, String pPCPOSTAL, java.math.BigDecimal pPTELEFONO, String pPTNOMCOM,
			java.math.BigDecimal pPFAX, String pPMAIL, java.math.BigDecimal pPCAGE00, java.math.BigDecimal pPCAGE01,
			java.math.BigDecimal pPCAGE02, java.math.BigDecimal pPCAGE03, java.math.BigDecimal pPCAGE04,
			java.math.BigDecimal pPCAGE05, java.math.BigDecimal pPCAGE06, java.math.BigDecimal pPCAGE07,
			java.math.BigDecimal pPCAGE08, java.math.BigDecimal pPCAGE09, java.math.BigDecimal pPCAGE10,
			java.math.BigDecimal pPCAGE11, java.math.BigDecimal pPCAGE12) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_AGENTES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPEMPRESA", "pPFECHA", "pPCAGENTE", "pPNOMAGENTE", "pPTIPAGENTE", "pPACTIVO",
						"pPCTIPMED", "pPAGRUPADOR", "pPNNUMIDE", "pPCPOSTAL", "pPTELEFONO", "pPTNOMCOM", "pPFAX",
						"pPMAIL", "pPCAGE00", "pPCAGE01", "pPCAGE02", "pPCAGE03", "pPCAGE04", "pPCAGE05", "pPCAGE06",
						"pPCAGE07", "pPCAGE08", "pPCAGE09", "pPCAGE10", "pPCAGE11", "pPCAGE12" },
				new Object[] { pPEMPRESA, pPFECHA, pPCAGENTE, pPNOMAGENTE, pPTIPAGENTE, pPACTIVO, pPCTIPMED,
						pPAGRUPADOR, pPNNUMIDE, pPCPOSTAL, pPTELEFONO, pPTNOMCOM, pPFAX, pPMAIL, pPCAGE00, pPCAGE01,
						pPCAGE02, pPCAGE03, pPCAGE04, pPCAGE05, pPCAGE06, pPCAGE07, pPCAGE08, pPCAGE09, pPCAGE10,
						pPCAGE11, pPCAGE12 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPFECHA);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPNOMAGENTE);
		cStmt.setObject(6, pPTIPAGENTE);
		cStmt.setObject(7, pPACTIVO);
		cStmt.setObject(8, pPCTIPMED);
		cStmt.setObject(9, pPAGRUPADOR);
		cStmt.setObject(10, pPNNUMIDE);
		cStmt.setObject(11, pPCPOSTAL);
		cStmt.setObject(12, pPTELEFONO);
		cStmt.setObject(13, pPTNOMCOM);
		cStmt.setObject(14, pPFAX);
		cStmt.setObject(15, pPMAIL);
		cStmt.setObject(16, pPCAGE00);
		cStmt.setObject(17, pPCAGE01);
		cStmt.setObject(18, pPCAGE02);
		cStmt.setObject(19, pPCAGE03);
		cStmt.setObject(20, pPCAGE04);
		cStmt.setObject(21, pPCAGE05);
		cStmt.setObject(22, pPCAGE06);
		cStmt.setObject(23, pPCAGE07);
		cStmt.setObject(24, pPCAGE08);
		cStmt.setObject(25, pPCAGE09);
		cStmt.setObject(26, pPCAGE10);
		cStmt.setObject(27, pPCAGE11);
		cStmt.setObject(28, pPCAGE12);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(29, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(29));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(java.math.BigDecimal pPEMPRESA, java.sql.Date pPFECHA,
			java.math.BigDecimal pPCAGENTE, String pPNOMAGENTE, java.math.BigDecimal pPTIPAGENTE,
			java.math.BigDecimal pPACTIVO, java.math.BigDecimal pPCTIPMED, java.math.BigDecimal pPAGRUPADOR,
			String pPNNUMIDE, String pPCPOSTAL, java.math.BigDecimal pPTELEFONO, String pPTNOMCOM,
			java.math.BigDecimal pPFAX, String pPMAIL, java.math.BigDecimal pPCAGE00, java.math.BigDecimal pPCAGE01,
			java.math.BigDecimal pPCAGE02, java.math.BigDecimal pPCAGE03, java.math.BigDecimal pPCAGE04,
			java.math.BigDecimal pPCAGE05, java.math.BigDecimal pPCAGE06, java.math.BigDecimal pPCAGE07,
			java.math.BigDecimal pPCAGE08, java.math.BigDecimal pPCAGE09, java.math.BigDecimal pPCAGE10,
			java.math.BigDecimal pPCAGE11, java.math.BigDecimal pPCAGE12) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(pPEMPRESA, pPFECHA, pPCAGENTE, pPNOMAGENTE, pPTIPAGENTE,
				pPACTIVO, pPCTIPMED, pPAGRUPADOR, pPNNUMIDE, pPCPOSTAL, pPTELEFONO, pPTNOMCOM, pPFAX, pPMAIL, pPCAGE00,
				pPCAGE01, pPCAGE02, pPCAGE03, pPCAGE04, pPCAGE05, pPCAGE06, pPCAGE07, pPCAGE08, pPCAGE09, pPCAGE10,
				pPCAGE11, pPCAGE12);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_AGENTES

	// --START-PAC_IAX_REDCOMERCIAL.F_GET_POLAGENTE(PEMPRESA, PCAGENTE, PNPOLIZA,
	// PCPOLCIA, PSSEGURO, PNNUMIDETOM, PSPERSONTOM, PCRAMO, PSPRODUC)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_POLAGENTE(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPOLIZA, String pPCPOLCIA,
			java.math.BigDecimal pPSSEGURO, String pPNNUMIDETOM, java.math.BigDecimal pPSPERSONTOM,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_POLAGENTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPEMPRESA", "pPCAGENTE", "pPNPOLIZA", "pPCPOLCIA", "pPSSEGURO", "pPNNUMIDETOM",
						"pPSPERSONTOM", "pPCRAMO", "pPSPRODUC" },
				new Object[] { pPEMPRESA, pPCAGENTE, pPNPOLIZA, pPCPOLCIA, pPSSEGURO, pPNNUMIDETOM, pPSPERSONTOM,
						pPCRAMO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPCPOLCIA);
		cStmt.setObject(6, pPSSEGURO);
		cStmt.setObject(7, pPNNUMIDETOM);
		cStmt.setObject(8, pPSPERSONTOM);
		cStmt.setObject(9, pPCRAMO);
		cStmt.setObject(10, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_POLAGENTE(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPOLIZA, String pPCPOLCIA,
			java.math.BigDecimal pPSSEGURO, String pPNNUMIDETOM, java.math.BigDecimal pPSPERSONTOM,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_POLAGENTE(pPEMPRESA, pPCAGENTE, pPNPOLIZA, pPCPOLCIA, pPSSEGURO,
				pPNNUMIDETOM, pPSPERSONTOM, pPCRAMO, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_GET_POLAGENTE
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_RECAGENTE(PEMPRESA, PCAGENTE, PCESTREC,
	// PNPOLIZA, PCPOLCIA, PNRECIBO, PCRECCIA, PSSEGURO, PNNUMIDETOM, PSPERSONTOM,
	// PCRAMO, PSPRODUC)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_RECAGENTE(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCESTREC, java.math.BigDecimal pPNPOLIZA,
			String pPCPOLCIA, java.math.BigDecimal pPNRECIBO, String pPCRECCIA, java.math.BigDecimal pPSSEGURO,
			String pPNNUMIDETOM, java.math.BigDecimal pPSPERSONTOM, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_RECAGENTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPEMPRESA", "pPCAGENTE", "pPCESTREC", "pPNPOLIZA", "pPCPOLCIA", "pPNRECIBO",
						"pPCRECCIA", "pPSSEGURO", "pPNNUMIDETOM", "pPSPERSONTOM", "pPCRAMO", "pPSPRODUC" },
				new Object[] { pPEMPRESA, pPCAGENTE, pPCESTREC, pPNPOLIZA, pPCPOLCIA, pPNRECIBO, pPCRECCIA, pPSSEGURO,
						pPNNUMIDETOM, pPSPERSONTOM, pPCRAMO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCESTREC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPCPOLCIA);
		cStmt.setObject(7, pPNRECIBO);
		cStmt.setObject(8, pPCRECCIA);
		cStmt.setObject(9, pPSSEGURO);
		cStmt.setObject(10, pPNNUMIDETOM);
		cStmt.setObject(11, pPSPERSONTOM);
		cStmt.setObject(12, pPCRAMO);
		cStmt.setObject(13, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_RECAGENTE(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCESTREC, java.math.BigDecimal pPNPOLIZA,
			String pPCPOLCIA, java.math.BigDecimal pPNRECIBO, String pPCRECCIA, java.math.BigDecimal pPSSEGURO,
			String pPNNUMIDETOM, java.math.BigDecimal pPSPERSONTOM, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_RECAGENTE(pPEMPRESA, pPCAGENTE, pPCESTREC, pPNPOLIZA, pPCPOLCIA,
				pPNRECIBO, pPCRECCIA, pPSSEGURO, pPNNUMIDETOM, pPSPERSONTOM, pPCRAMO, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_RECAGENTE

	// --START-PAC_IAX_REDCOMERCIAL.F_GET_CONTADOR_AGENTE(PCEMPRES, PCTIPAGE)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_CONTADOR_AGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCTIPAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_CONTADOR_AGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTIPAGE" }, new Object[] { pPCEMPRES, pPCTIPAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTIPAGE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCONTADOR"
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
			retVal.put("PCONTADOR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCONTADOR", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CONTADOR_AGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCTIPAGE) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_CONTADOR_AGENTE(pPCEMPRES, pPCTIPAGE);
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_CONTADOR_AGENTE

	// --START-PAC_IAX_REDCOMERCIAL.F_DEL_PRODPARTICIPACION(PCAGENTE, PSPRODUC,
	// PCACTIVI)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_DEL_PRODPARTICIPACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_DEL_PRODPARTICIPACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCAGENTE, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_PRODPARTICIPACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_DEL_PRODPARTICIPACION(pPCAGENTE, pPSPRODUC, pPCACTIVI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_DEL_PRODPARTICIPACION
	// --START-PAC_IAX_REDCOMERCIAL.F_DEL_SOPORTEARP(PCAGENTE, PFINIVIG)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_DEL_SOPORTEARP(java.math.BigDecimal pPCAGENTE, java.sql.Date pPFINIVIG)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_DEL_SOPORTEARP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPFINIVIG" }, new Object[] { pPCAGENTE, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPFINIVIG);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_SOPORTEARP(java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_DEL_SOPORTEARP(pPCAGENTE, pPFINIVIG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_DEL_SOPORTEARP
	// --START-PAC_IAX_REDCOMERCIAL.F_DEL_SUBVENCION(PCAGENTE, PSPRODUC, PCACTIVI)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_DEL_SUBVENCION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_DEL_SUBVENCION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCAGENTE, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_SUBVENCION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_DEL_SUBVENCION(pPCAGENTE, pPSPRODUC, pPCACTIVI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_DEL_SUBVENCION

	// <%-- Inici BFP bug 20999 25/01/2012 Comisin Indirecta --%>
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_COMISIONVIG_AGENTE(PCAGENTE, PCTIPO,
	// PCCOMIND)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_COMISIONVIG_AGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCCOMIND) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_COMISIONVIG_AGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPO", "pPCCOMIND" },
				new Object[] { pPCAGENTE, pPCTIPO, pPCCOMIND });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCCOMIND);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_COMISIONVIG_AGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCCOMIND) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_COMISIONVIG_AGENTE(pPCAGENTE, pPCTIPO, pPCCOMIND);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_GET_COMISIONVIG_AGENTE
	// <%-- Fi BFP bug 20999 25/01/2012 Comisin Indirecta --%>
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_DESCUENTOVIG_AGENTE(PCAGENTE, PCTIPO)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_DESCUENTOVIG_AGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_DESCUENTOVIG_AGENTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCTIPO" }, new Object[] { pPCAGENTE, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPO);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DESCUENTOVIG_AGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_DESCUENTOVIG_AGENTE(pPCAGENTE, pPCTIPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_DESCUENTOVIG_AGENTE

	// --START-PAC_IAX_REDCOMERCIAL.F_GET_DETPRODPARTICIPACION(PCAGENTE, PSPRODUC,
	// PCACTIVI)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_DETPRODPARTICIPACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_DETPRODPARTICIPACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCAGENTE, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODPARTICIPACION_AGE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DETPRODPARTICIPACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_DETPRODPARTICIPACION(pPCAGENTE, pPSPRODUC, pPCACTIVI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_DETPRODPARTICIPACION
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_DETSOPORTEARP(PCAGENTE, PFINIVIG)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_DETSOPORTEARP(java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_DETSOPORTEARP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPFINIVIG" }, new Object[] { pPCAGENTE, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPFINIVIG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SOPORTEARP_AGENTE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DETSOPORTEARP(java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_DETSOPORTEARP(pPCAGENTE, pPFINIVIG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_DETSOPORTEARP
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_DETSUBVENCION(PCAGENTE, PSPRODUC,
	// PCACTIVI)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_DETSUBVENCION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_DETSUBVENCION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCAGENTE, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SUBVENCION_AGENTE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DETSUBVENCION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_DETSUBVENCION(pPCAGENTE, pPSPRODUC, pPCACTIVI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_DETSUBVENCION

	// bug-27949 Divido los parmetros de la funcin f_set_agente en dos funciones
	// (f_set_agente y f_set_agente_comp)

	// TCS_1569B - ACL - 01/02/2019 - Se agregan campos de impuestos
	// --START-PAC_IAX_REDCOMERCIAL.F_SET_AGENTE(PCAGENTE, PCRETENC, PCTIPIVA,
	// PSPERSON, PCCOMISI, PCDESC, PCTIPAGE, PCACTIVO, PCDOMICI, PCBANCAR, PNCOLEGI,
	// PFBAJAGE, PCTIPBAN, PFINIVIGCOM, PFFINVIGCOM, PFINIVIGDESC, PFFINVIGDESC,
	// PCSOBRECOMISI, PFINIVIGSOBRECOM, PFFINVIGSOBRECOM, PTALIAS, PCLIQUIDO,
	// PCCOMISI_INDIRECT, PFINIVIGCOM_INDIRECT, PFFINVIGCOM_INDIRECT, PCTIPMED,
	// PTNOMCOM, PCDOMCOM, PCTIPRETRIB, PCMOTBAJA, PCBLOQUEO, PNREGDGS, PFINSDGS,
	// PCREBCONTDGS, PCOBLCCC, PCCODCON, PCLAVEINTER, PCDESCRIIVA, PDESCRICRETENC,
	// PDESCRIFUENTE, PCDESCRIICA, PCTIPINT)
    // POST-71 BJHB/PAY-TCS 16-06-2022 ADC - pPCSUC_CAU
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_AGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRETENC, java.math.BigDecimal pPCTIPIVA, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCDESC, java.math.BigDecimal pPCTIPAGE,
			java.math.BigDecimal pPCACTIVO, java.math.BigDecimal pPCDOMICI, String pPCBANCAR, String pPNCOLEGI,
			java.sql.Date pPFBAJAGE, java.math.BigDecimal pPCTIPBAN, java.sql.Date pPFINIVIGCOM,
			java.sql.Date pPFFINVIGCOM, java.sql.Date pPFINIVIGDESC, java.sql.Date pPFFINVIGDESC,
			java.math.BigDecimal pPCSOBRECOMISI, java.sql.Date pPFINIVIGSOBRECOM, java.sql.Date pPFFINVIGSOBRECOM,
			String pPTALIAS, java.math.BigDecimal pPCLIQUIDO, java.math.BigDecimal pPCCOMISI_INDIRECT,
			java.sql.Date pPFINIVIGCOM_INDIRECT, java.sql.Date pPFFINVIGCOM_INDIRECT, java.math.BigDecimal pPCTIPMED,
			String pPTNOMCOM, java.math.BigDecimal pPCDOMCOM, java.math.BigDecimal pPCTIPRETRIB,
			java.math.BigDecimal pPCMOTBAJA, java.math.BigDecimal pPCBLOQUEO, String pPNREGDGS, java.sql.Date pPFINSDGS,
			java.math.BigDecimal pPCREBCONTDGS, java.math.BigDecimal pPCOBLCCC, String pPCCODCON, String pPCLAVEINTER,
			String pPCDESCRIIVA, String pPDESCRICRETENC, String pPDESCRIFUENTE, String pPCDESCRIICA,
			java.math.BigDecimal pPCTIPINT, java.math.BigDecimal pPCSUC_FAC, java.math.BigDecimal pPCSUC_CAU, java.math.BigDecimal pPMODIFICA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_AGENTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}"; // POST-71 BJHB/PAY-TCS 16-06-2022

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPCRETENC", "pPCTIPIVA", "pPSPERSON", "pPCCOMISI", "pPCDESC", "pPCTIPAGE",
						"pPCACTIVO", "pPCDOMICI", "pPCBANCAR", "pPNCOLEGI", "pPFBAJAGE", "pPCTIPBAN", "pPFINIVIGCOM",
						"pPFFINVIGCOM", "pPFINIVIGDESC", "pPFFINVIGDESC", "pPCSOBRECOMISI", "pPFINIVIGSOBRECOM",
						"pPFFINVIGSOBRECOM", "pPTALIAS", "pPCLIQUIDO", "pPCCOMISI_INDIRECT", "pPFINIVIGCOM_INDIRECT",
						"pPFFINVIGCOM_INDIRECT", "pPCTIPMED", "pPTNOMCOM", "pPCDOMCOM", "pPCTIPRETRIB", "pPCMOTBAJA",
						"pPCBLOQUEO", "pPNREGDGS", "pPFINSDGS", "pPCREBCONTDGS", "pPCOBLCCC", "pPCCODCON",
						"pPCLAVEINTER", "pPCDESCRIIVA", "pPDESCRICRETENC", "pPDESCRIFUENTE", "pPCDESCRIICA",
						"pPCTIPINT", "pPCSUC_FAC","pPCSUC_CAU", "pPMODIFICA" }, 
				new Object[] { pPCAGENTE, pPCRETENC, pPCTIPIVA, pPSPERSON, pPCCOMISI, pPCDESC, pPCTIPAGE, pPCACTIVO,
						pPCDOMICI, pPCBANCAR, pPNCOLEGI, pPFBAJAGE, pPCTIPBAN, pPFINIVIGCOM, pPFFINVIGCOM,
						pPFINIVIGDESC, pPFFINVIGDESC, pPCSOBRECOMISI, pPFINIVIGSOBRECOM, pPFFINVIGSOBRECOM, pPTALIAS,
						pPCLIQUIDO, pPCCOMISI_INDIRECT, pPFINIVIGCOM_INDIRECT, pPFFINVIGCOM_INDIRECT, pPCTIPMED,
						pPTNOMCOM, pPCDOMCOM, pPCTIPRETRIB, pPCMOTBAJA, pPCBLOQUEO, pPNREGDGS, pPFINSDGS, pPCREBCONTDGS,
						pPCOBLCCC, pPCCODCON, pPCLAVEINTER, pPCDESCRIIVA, pPDESCRICRETENC, pPDESCRIFUENTE, pPCDESCRIICA,
						pPCTIPINT, pPCSUC_FAC,pPCSUC_CAU,pPMODIFICA }); // POST-71 BJHB/PAY-TCS 16-06-2022 ADC - pPCSUC_CAU
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCRETENC);
		cStmt.setObject(4, pPCTIPIVA);
		cStmt.setObject(5, pPSPERSON);
		cStmt.setObject(6, pPCCOMISI);
		cStmt.setObject(7, pPCDESC);
		cStmt.setObject(8, pPCTIPAGE);
		cStmt.setObject(9, pPCACTIVO);
		cStmt.setObject(10, pPCDOMICI);
		cStmt.setObject(11, pPCBANCAR);
		cStmt.setObject(12, pPNCOLEGI);
		cStmt.setObject(13, pPFBAJAGE);
		cStmt.setObject(14, pPCTIPBAN);
		cStmt.setObject(15, pPFINIVIGCOM);
		cStmt.setObject(16, pPFFINVIGCOM);
		cStmt.setObject(17, pPFINIVIGDESC);
		cStmt.setObject(18, pPFFINVIGDESC);
		cStmt.setObject(19, pPCSOBRECOMISI);
		cStmt.setObject(20, pPFINIVIGSOBRECOM);
		cStmt.setObject(21, pPFFINVIGSOBRECOM);
		cStmt.setObject(22, pPTALIAS);
		cStmt.setObject(23, pPCLIQUIDO);
		cStmt.setObject(24, pPCCOMISI_INDIRECT);
		cStmt.setObject(25, pPFINIVIGCOM_INDIRECT);
		cStmt.setObject(26, pPFFINVIGCOM_INDIRECT);
		cStmt.setObject(27, pPCTIPMED);
		cStmt.setObject(28, pPTNOMCOM);
		cStmt.setObject(29, pPCDOMCOM);
		cStmt.setObject(30, pPCTIPRETRIB);
		cStmt.setObject(31, pPCMOTBAJA);
		cStmt.setObject(32, pPCBLOQUEO);
		cStmt.setObject(33, pPNREGDGS);
		cStmt.setObject(34, pPFINSDGS);
		cStmt.setObject(35, pPCREBCONTDGS);
		cStmt.setObject(36, pPCOBLCCC);
		cStmt.setObject(37, pPCCODCON);
		cStmt.setObject(38, pPCLAVEINTER);
		cStmt.setObject(39, pPCDESCRIIVA);
		cStmt.setObject(40, pPDESCRICRETENC);
		cStmt.setObject(41, pPDESCRIFUENTE);
		cStmt.setObject(42, pPCDESCRIICA);
		cStmt.setObject(43, pPCTIPINT);
		cStmt.setObject(44, pPCSUC_FAC);
        cStmt.setObject(45, pPCSUC_CAU); // POST-71 BJHB/PAY-TCS 16-06-2022 ADC - pPCSUC_CAU
		cStmt.setObject(46, pPMODIFICA); // POST-71 BJHB/PAY-TCS 16-06-2022 SE CORRIO EL CORRELATIVO A 46
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(47, java.sql.Types.NUMERIC); // Valor de "PCAGENTE_OUT" POST-71 BJHB/PAY-TCS 16-06-2022 SE CORRIO EL CORRELATIVO A 47
		cStmt.registerOutParameter(48, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" POST-71 BJHB/PAY-TCS 16-06-2022 SE CORRIO EL CORRELATIVO A 48
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCAGENTE_OUT", cStmt.getObject(47)); // POST-71 BJHB/PAY-TCS 16-06-2022 SE CORRIO EL CORRELATIVO A 47
		} catch (SQLException e) {
			retVal.put("PCAGENTE_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(48)); // POST-71 BJHB/PAY-TCS 16-06-2022 SE CORRIO EL CORRELATIVO A 48
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}
    // POST-71 BJHB/PAY-TCS 16-06-2022 ADC - pPCSUC_CAU
	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_AGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRETENC, java.math.BigDecimal pPCTIPIVA, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCDESC, java.math.BigDecimal pPCTIPAGE,
			java.math.BigDecimal pPCACTIVO, java.math.BigDecimal pPCDOMICI, String pPCBANCAR, String pPNCOLEGI,
			java.sql.Date pPFBAJAGE, java.math.BigDecimal pPCTIPBAN, java.sql.Date pPFINIVIGCOM,
			java.sql.Date pPFFINVIGCOM, java.sql.Date pPFINIVIGDESC, java.sql.Date pPFFINVIGDESC,
			java.math.BigDecimal pPCSOBRECOMISI, java.sql.Date pPFINIVIGSOBRECOM, java.sql.Date pPFFINVIGSOBRECOM,
			String pPTALIAS, java.math.BigDecimal pPCLIQUIDO, java.math.BigDecimal pPCCOMISI_INDIRECT,
			java.sql.Date pPFINIVIGCOM_INDIRECT, java.sql.Date pPFFINVIGCOM_INDIRECT, java.math.BigDecimal pPCTIPMED,
			String pPTNOMCOM, java.math.BigDecimal pPCDOMCOM, java.math.BigDecimal pPCTIPRETRIB,
			java.math.BigDecimal pPCMOTBAJA, java.math.BigDecimal pPCBLOQUEO, String pPNREGDGS, java.sql.Date pPFINSDGS,
			java.math.BigDecimal pPCREBCONTDGS, java.math.BigDecimal pPCOBLCCC, String pPCCODCON, String pPCLAVEINTER,
			String pPCDESCRIIVA, String pPDESCRICRETENC, String pPDESCRIFUENTE, String pPCDESCRIICA,
			java.math.BigDecimal pPCTIPINT, java.math.BigDecimal pPCSUC_FAC,java.math.BigDecimal pPCSUC_CAU, java.math.BigDecimal pPMODIFICA)
			throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_AGENTE(pPCAGENTE, pPCRETENC, pPCTIPIVA, pPSPERSON, pPCCOMISI,
				pPCDESC, pPCTIPAGE, pPCACTIVO, pPCDOMICI, pPCBANCAR, pPNCOLEGI, pPFBAJAGE, pPCTIPBAN, pPFINIVIGCOM,
				pPFFINVIGCOM, pPFINIVIGDESC, pPFFINVIGDESC, pPCSOBRECOMISI, pPFINIVIGSOBRECOM, pPFFINVIGSOBRECOM,
				pPTALIAS, pPCLIQUIDO, pPCCOMISI_INDIRECT, pPFINIVIGCOM_INDIRECT, pPFFINVIGCOM_INDIRECT, pPCTIPMED,
				pPTNOMCOM, pPCDOMCOM, pPCTIPRETRIB, pPCMOTBAJA, pPCBLOQUEO, pPNREGDGS, pPFINSDGS, pPCREBCONTDGS,
				pPCOBLCCC, pPCCODCON, pPCLAVEINTER, pPCDESCRIIVA, pPDESCRICRETENC, pPDESCRIFUENTE, pPCDESCRIICA,
				pPCTIPINT, pPCSUC_FAC, pPCSUC_CAU, pPMODIFICA);// AXIS-WLS1SERVER-Ready -- // POST-71 BJHB/PAY-TCS 16-06-2022 ADC - pPCSUC_CAU
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_SET_AGENTE

	// --START-PAC_IAX_REDCOMERCIAL.F_SET_AGENTE_COMP(PCAGENTE, PCTIPADN, PCAGEDEP,
	// PCTIPINT, PCAGECLAVE, PCOFERMERCAN, PFRECEPCONTRA, PCIDONEIDAD, PCCOMPANI,
	// PCOFIPROPIA, PCCLASIF, PNPLANPAGO, PNNOTARIA, PCPROVIN, PCPOBLAC,
	// PNESCRITURA, PFALTASOC, PTGERENTE, PTCAMARACOMERCIO, PAGRUPADOR, PCACTIVIDAD,
	// PCTIPOACTIV, PPRETENCION, PCINCIDENCIA, PCRATING, PTVALORACION, PCRESOLUCION,
	// PFFINCREDITO, PNLIMCREDITO, PTCOMENTARIOS, PFULTREV, PFULTCKC, PCTIPBANG,
	// PCBANGES, PCCLANEG, PCTIPAGE_LIQUIDA, PIOBJETIVO, PIBONIFICA, PPCOMEXTR,
	// PCTIPCAL, PCFORCAL, PCMESPAG, PPCOMEXTROV, PPPERSISTEN, PPCOMPERS, PCTIPCALB,
	// PCFORCALB, PCMESPAGB, PPCOMBUSI, PILIMITEB, MENSAJES)
	// AAC_INI-CONF_379-20160927 (add pCORTEPROD)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_AGENTE_COMP(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPADN, java.math.BigDecimal pPCAGEDEP, java.math.BigDecimal pPCTIPINT,
			java.math.BigDecimal pPCAGECLAVE, java.math.BigDecimal pPCOFERMERCAN, java.sql.Date pPFRECEPCONTRA,
			java.math.BigDecimal pPCIDONEIDAD, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCOFIPROPIA,
			java.math.BigDecimal pPCCLASIF, java.math.BigDecimal pPNPLANPAGO, java.math.BigDecimal pPNNOTARIA,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPNESCRITURA,
			java.sql.Date pPFALTASOC, String pPTGERENTE, String pPTCAMARACOMERCIO, java.math.BigDecimal pPAGRUPADOR,
			java.math.BigDecimal pPCACTIVIDAD, java.math.BigDecimal pPCTIPOACTIV, java.math.BigDecimal pPPRETENCION,
			java.math.BigDecimal pPCINCIDENCIA, java.math.BigDecimal pPCRATING, String pPTVALORACION,
			java.math.BigDecimal pPCRESOLUCION, java.sql.Date pPFFINCREDITO, java.math.BigDecimal pPNLIMCREDITO,
			String pPTCOMENTARIOS, java.sql.Date pPFULTREV, java.sql.Date pPFULTCKC, java.math.BigDecimal pPCTIPBANG,
			String pPCBANGES, String pPCCLANEG, java.math.BigDecimal pPCTIPAGE_LIQUIDA,
			java.math.BigDecimal pPIOBJETIVO, java.math.BigDecimal pPIBONIFICA, java.math.BigDecimal pPPCOMEXTR,
			java.math.BigDecimal pPCTIPCAL, java.math.BigDecimal pPCFORCAL, java.math.BigDecimal pPCMESPAG,
			java.math.BigDecimal pPPCOMEXTROV, java.math.BigDecimal pPPPERSISTEN, java.math.BigDecimal pPPCOMPERS,
			java.math.BigDecimal pPCTIPCALB, java.math.BigDecimal pPCFORCALB, java.math.BigDecimal pPCMESPAGB,
			java.math.BigDecimal pPPCOMBUSI, java.math.BigDecimal pPILIMITEB, java.math.BigDecimal pPCEXPIDE,
			java.math.BigDecimal pCORTEPROD /* , Object pMENSAJES */) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_AGENTE_COMP(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPCTIPADN", "pPCAGEDEP", "pPCTIPINT", "pPCAGECLAVE", "pPCOFERMERCAN",
						"pPFRECEPCONTRA", "pPCIDONEIDAD", "pPCCOMPANI", "pPCOFIPROPIA", "pPCCLASIF", "pPNPLANPAGO",
						"pPNNOTARIA", "pPCPROVIN", "pPCPOBLAC", "pPNESCRITURA", "pPFALTASOC", "pPTGERENTE",
						"pPTCAMARACOMERCIO", "pPAGRUPADOR", "pPCACTIVIDAD", "pPCTIPOACTIV", "pPPRETENCION",
						"pPCINCIDENCIA", "pPCRATING", "pPTVALORACION", "pPCRESOLUCION", "pPFFINCREDITO",
						"pPNLIMCREDITO", "pPTCOMENTARIOS", "pPFULTREV", "pPFULTCKC", "pPCTIPBANG", "pPCBANGES",
						"pPCCLANEG", "pPCTIPAGE_LIQUIDA", "pPIOBJETIVO", "pPIBONIFICA", "pPPCOMEXTR", "pPCTIPCAL",
						"pPCFORCAL", "pPCMESPAG", "pPPCOMEXTROV", "pPPPERSISTEN", "pPPCOMPERS", "pPCTIPCALB",
						"pPCFORCALB", "pPCMESPAGB", "pPPCOMBUSI", "pPILIMITEB", "pPCEXPIDE", "pCORTEPROD" },
				new Object[] { pPCAGENTE, pPCTIPADN, pPCAGEDEP, pPCTIPINT, pPCAGECLAVE, pPCOFERMERCAN, pPFRECEPCONTRA,
						pPCIDONEIDAD, pPCCOMPANI, pPCOFIPROPIA, pPCCLASIF, pPNPLANPAGO, pPNNOTARIA, pPCPROVIN,
						pPCPOBLAC, pPNESCRITURA, pPFALTASOC, pPTGERENTE, pPTCAMARACOMERCIO, pPAGRUPADOR, pPCACTIVIDAD,
						pPCTIPOACTIV, pPPRETENCION, pPCINCIDENCIA, pPCRATING, pPTVALORACION, pPCRESOLUCION,
						pPFFINCREDITO, pPNLIMCREDITO, pPTCOMENTARIOS, pPFULTREV, pPFULTCKC, pPCTIPBANG, pPCBANGES,
						pPCCLANEG, pPCTIPAGE_LIQUIDA, pPIOBJETIVO, pPIBONIFICA, pPPCOMEXTR, pPCTIPCAL, pPCFORCAL,
						pPCMESPAG, pPPCOMEXTROV, pPPPERSISTEN, pPPCOMPERS, pPCTIPCALB, pPCFORCALB, pPCMESPAGB,
						pPPCOMBUSI, pPILIMITEB, pPCEXPIDE, pCORTEPROD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPADN);
		cStmt.setObject(4, pPCAGEDEP);
		cStmt.setObject(5, pPCTIPINT);
		cStmt.setObject(6, pPCAGECLAVE);
		cStmt.setObject(7, pPCOFERMERCAN);
		cStmt.setObject(8, pPFRECEPCONTRA);
		cStmt.setObject(9, pPCIDONEIDAD);
		cStmt.setObject(10, pPCCOMPANI);
		cStmt.setObject(11, pPCOFIPROPIA);
		cStmt.setObject(12, pPCCLASIF);
		cStmt.setObject(13, pPNPLANPAGO);
		cStmt.setObject(14, pPNNOTARIA);
		cStmt.setObject(15, pPCPROVIN);
		cStmt.setObject(16, pPCPOBLAC);
		cStmt.setObject(17, pPNESCRITURA);
		cStmt.setObject(18, pPFALTASOC);
		cStmt.setObject(19, pPTGERENTE);
		cStmt.setObject(20, pPTCAMARACOMERCIO);
		cStmt.setObject(21, pPAGRUPADOR);
		cStmt.setObject(22, pPCACTIVIDAD);
		cStmt.setObject(23, pPCTIPOACTIV);
		cStmt.setObject(24, pPPRETENCION);
		cStmt.setObject(25, pPCINCIDENCIA);
		cStmt.setObject(26, pPCRATING);
		cStmt.setObject(27, pPTVALORACION);
		cStmt.setObject(28, pPCRESOLUCION);
		cStmt.setObject(29, pPFFINCREDITO);
		cStmt.setObject(30, pPNLIMCREDITO);
		cStmt.setObject(31, pPTCOMENTARIOS);
		cStmt.setObject(32, pPFULTREV);
		cStmt.setObject(33, pPFULTCKC);
		cStmt.setObject(34, pPCTIPBANG);
		cStmt.setObject(35, pPCBANGES);
		cStmt.setObject(36, pPCCLANEG);
		cStmt.setObject(37, pPCTIPAGE_LIQUIDA);
		cStmt.setObject(38, pPIOBJETIVO);
		cStmt.setObject(39, pPIBONIFICA);
		cStmt.setObject(40, pPPCOMEXTR);
		cStmt.setObject(41, pPCTIPCAL);
		cStmt.setObject(42, pPCFORCAL);
		cStmt.setObject(43, pPCMESPAG);
		cStmt.setObject(44, pPPCOMEXTROV);
		cStmt.setObject(45, pPPPERSISTEN);
		cStmt.setObject(46, pPPCOMPERS);
		cStmt.setObject(47, pPCTIPCALB);
		cStmt.setObject(48, pPCFORCALB);
		cStmt.setObject(49, pPCMESPAGB);
		cStmt.setObject(50, pPPCOMBUSI);
		cStmt.setObject(51, pPILIMITEB);
		cStmt.setObject(52, pPCEXPIDE);
		cStmt.setObject(53, pCORTEPROD);
		// cStmt.setObject(53, pMENSAJES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(54, java.sql.Types.NUMERIC); // Valor de "PCAGENTE_OUT"
		cStmt.registerOutParameter(55, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCAGENTE_OUT", cStmt.getObject(54));
		} catch (SQLException e) {
			retVal.put("PCAGENTE_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(55));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_AGENTE_COMP(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPADN, java.math.BigDecimal pPCAGEDEP, java.math.BigDecimal pPCTIPINT,
			java.math.BigDecimal pPCAGECLAVE, java.math.BigDecimal pPCOFERMERCAN, java.sql.Date pPFRECEPCONTRA,
			java.math.BigDecimal pPCIDONEIDAD, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCOFIPROPIA,
			java.math.BigDecimal pPCCLASIF, java.math.BigDecimal pPNPLANPAGO, java.math.BigDecimal pPNNOTARIA,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPNESCRITURA,
			java.sql.Date pPFALTASOC, String pPTGERENTE, String pPTCAMARACOMERCIO, java.math.BigDecimal pPAGRUPADOR,
			java.math.BigDecimal pPCACTIVIDAD, java.math.BigDecimal pPCTIPOACTIV, java.math.BigDecimal pPPRETENCION,
			java.math.BigDecimal pPCINCIDENCIA, java.math.BigDecimal pPCRATING, String pPTVALORACION,
			java.math.BigDecimal pPCRESOLUCION, java.sql.Date pPFFINCREDITO, java.math.BigDecimal pPNLIMCREDITO,
			String pPTCOMENTARIOS, java.sql.Date pPFULTREV, java.sql.Date pPFULTCKC, java.math.BigDecimal pPCTIPBANG,
			String pPCBANGES, String pPCCLANEG, java.math.BigDecimal pPCTIPAGE_LIQUIDA,
			java.math.BigDecimal pPIOBJETIVO, java.math.BigDecimal pPIBONIFICA, java.math.BigDecimal pPPCOMEXTR,
			java.math.BigDecimal pPCTIPCAL, java.math.BigDecimal pPCFORCAL, java.math.BigDecimal pPCMESPAG,
			java.math.BigDecimal pPPCOMEXTROV, java.math.BigDecimal pPPPERSISTEN, java.math.BigDecimal pPPCOMPERS,
			java.math.BigDecimal pPCTIPCALB, java.math.BigDecimal pPCFORCALB, java.math.BigDecimal pPCMESPAGB,
			java.math.BigDecimal pPPCOMBUSI, java.math.BigDecimal pPILIMITEB, java.math.BigDecimal pPCEXPIDE,
			java.math.BigDecimal pCORTEPROD) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_AGENTE_COMP(pPCAGENTE, pPCTIPADN, pPCAGEDEP, pPCTIPINT, pPCAGECLAVE,
				pPCOFERMERCAN, pPFRECEPCONTRA, pPCIDONEIDAD, pPCCOMPANI, pPCOFIPROPIA, pPCCLASIF, pPNPLANPAGO,
				pPNNOTARIA, pPCPROVIN, pPCPOBLAC, pPNESCRITURA, pPFALTASOC, pPTGERENTE, pPTCAMARACOMERCIO, pPAGRUPADOR,
				pPCACTIVIDAD, pPCTIPOACTIV, pPPRETENCION, pPCINCIDENCIA, pPCRATING, pPTVALORACION, pPCRESOLUCION,
				pPFFINCREDITO, pPNLIMCREDITO, pPTCOMENTARIOS, pPFULTREV, pPFULTCKC, pPCTIPBANG, pPCBANGES, pPCCLANEG,
				pPCTIPAGE_LIQUIDA, pPIOBJETIVO, pPIBONIFICA, pPPCOMEXTR, pPCTIPCAL, pPCFORCAL, pPCMESPAG, pPPCOMEXTROV,
				pPPPERSISTEN, pPPCOMPERS, pPCTIPCALB, pPCFORCALB, pPCMESPAGB, pPPCOMBUSI, pPILIMITEB, pPCEXPIDE,
				pCORTEPROD);// AXIS-WLS1SERVER-Ready
	}
	// AAC_FI-CONF_379-20160927
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_AGENTE_COMP

	// --START-PAC_IAX_REDCOMERCIAL.F_SET_PRODPARTICIPACION(PCAGENTE, PSPRODUC,
	// PCACTIVI)

	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_PRODPARTICIPACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_PRODPARTICIPACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPCAGENTE, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
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

		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_PRODPARTICIPACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_PRODPARTICIPACION(pPCAGENTE, pPSPRODUC, pPCACTIVI); // AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_SET_PRODPARTICIPACION
	// --START-PAC_IAX_REDCOMERCIAL.F_SET_SOPORTEARP(PCMODO, PCAGENTE, PIIMPORTE,
	// PFINIVIG, PFFINVIG)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_SOPORTEARP(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPIIMPORTE, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_SOPORTEARP(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMODO", "pPCAGENTE", "pPIIMPORTE", "pPFINIVIG", "pPFFINVIG" },
				new Object[] { pPCMODO, pPCAGENTE, pPIIMPORTE, pPFINIVIG, pPFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPIIMPORTE);
		cStmt.setObject(5, pPFINIVIG);
		cStmt.setObject(6, pPFFINVIG);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_SOPORTEARP(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPIIMPORTE, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_SOPORTEARP(pPCMODO, pPCAGENTE, pPIIMPORTE, pPFINIVIG, pPFFINVIG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_SOPORTEARP

	// --START-PAC_IAX_REDCOMERCIAL.F_SET_SUBVENCION(PCMODO, PCAGENTE, PSPRODUC,
	// PCACTIVI, PIIMPORTE)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_SUBVENCION(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPIIMPORTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_SUBVENCION(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMODO", "pPCAGENTE", "pPSPRODUC", "pPCACTIVI", "pPIIMPORTE" },
				new Object[] { pPCMODO, pPCAGENTE, pPSPRODUC, pPCACTIVI, pPIIMPORTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPIIMPORTE);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_SUBVENCION(java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPIIMPORTE) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_SUBVENCION(pPCMODO, pPCAGENTE, pPSPRODUC, pPCACTIVI, pPIIMPORTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_SUBVENCION

	// --START-PAC_IAX_REDCOMERCIAL.FF_DESAGENTE(PCAGENTE, PFORMATO)
	private HashMap callPAC_IAX_REDCOMERCIAL__FF_DESAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPFORMATO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.FF_DESAGENTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPFORMATO" }, new Object[] { pPCAGENTE, pPFORMATO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPFORMATO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__FF_DESAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPFORMATO) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__FF_DESAGENTE(pPCAGENTE, pPFORMATO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.FF_DESAGENTE

	// --START-PAC_IAX_REDCOMERCIAL.F_TRASPASAR_SUBVENCION(PCAGENTE, PNPLANPAGO)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_TRASPASAR_SUBVENCION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNPLANPAGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_TRASPASAR_SUBVENCION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPNPLANPAGO" }, new Object[] { pPCAGENTE, pPNPLANPAGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNPLANPAGO);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_TRASPASAR_SUBVENCION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNPLANPAGO) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_TRASPASAR_SUBVENCION(pPCAGENTE, pPNPLANPAGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_TRASPASAR_SUBVENCION

	// --START-PAC_IAX_REDCOMERCIAL.F_DEL_AGE_CONTACTO(PCAGENTE, PNORDEN)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_DEL_AGE_CONTACTO(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_DEL_AGE_CONTACTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPNORDEN" }, new Object[] { pPCAGENTE, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_AGE_CONTACTO(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_DEL_AGE_CONTACTO(pPCAGENTE, pPNORDEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_DEL_AGE_CONTACTO
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_CONTACTOAGE(PCAGENTE, PNORDEN)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOAGE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_CONTACTOAGE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPNORDEN" }, new Object[] { pPCAGENTE, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNORDEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGE_CONTACTOS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGE_CONTACTOS".toUpperCase())); // Valor de "PCONTACTO"
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
			retVal.put("PCONTACTO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCONTACTO", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOAGE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOAGE(pPCAGENTE, pPNORDEN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_GET_CONTACTOAGE
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_CONTACTOSAGE(PCAGENTE)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOSAGE(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_CONTACTOSAGE(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOSAGE(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOSAGE(pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_GET_CONTACTOSAGE
	// --START-PAC_IAX_REDCOMERCIAL.F_SET_AGE_CONTACTO(PCAGENTE, PCTIPO, PNORDEN,
	// PNOMBRE, PCARGO, PIDDOMICI, PTELEFONO, PTELEFONO2, PFAX, PWEB, PEMAIL)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_AGE_CONTACTO(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPNORDEN, String pPNOMBRE, String pPCARGO,
			java.math.BigDecimal pPIDDOMICI, java.math.BigDecimal pPTELEFONO, java.math.BigDecimal pPTELEFONO2,
			java.math.BigDecimal pPFAX, String pPWEB, String pPEMAIL) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_AGE_CONTACTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPCTIPO", "pPNORDEN", "pPNOMBRE", "pPCARGO", "pPIDDOMICI", "pPTELEFONO",
						"pPTELEFONO2", "pPFAX", "pPWEB", "pPEMAIL" },
				new Object[] { pPCAGENTE, pPCTIPO, pPNORDEN, pPNOMBRE, pPCARGO, pPIDDOMICI, pPTELEFONO, pPTELEFONO2,
						pPFAX, pPWEB, pPEMAIL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPNORDEN);
		cStmt.setObject(5, pPNOMBRE);
		cStmt.setObject(6, pPCARGO);
		cStmt.setObject(7, pPIDDOMICI);
		cStmt.setObject(8, pPTELEFONO);
		cStmt.setObject(9, pPTELEFONO2);
		cStmt.setObject(10, pPFAX);
		cStmt.setObject(11, pPWEB);
		cStmt.setObject(12, pPEMAIL);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_AGE_CONTACTO(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPNORDEN, String pPNOMBRE, String pPCARGO,
			java.math.BigDecimal pPIDDOMICI, java.math.BigDecimal pPTELEFONO, java.math.BigDecimal pPTELEFONO2,
			java.math.BigDecimal pPFAX, String pPWEB, String pPEMAIL) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_AGE_CONTACTO(pPCAGENTE, pPCTIPO, pPNORDEN, pPNOMBRE, pPCARGO,
				pPIDDOMICI, pPTELEFONO, pPTELEFONO2, pPFAX, pPWEB, pPEMAIL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_AGE_CONTACTO

	// --START-PAC_IAX_REDCOMERCIAL.F_GET_NIVELES(PCEMPRES, PCIDIOMA)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_NIVELES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDIOMA" }, new Object[] { pPCEMPRES, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(pPCEMPRES, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_GET_NIVELES
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_DOCAGENTE(PCAGENTE, PIDDOCGEDOX)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_DOCAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPIDDOCGEDOX) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_DOCAGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPIDDOCGEDOX" }, new Object[] { pPCAGENTE, pPIDDOCGEDOX });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPIDDOCGEDOX);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DOCAGENTE".toUpperCase())); // Valor de "POBDOCAGENTE"
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
			retVal.put("POBDOCAGENTE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("POBDOCAGENTE", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DOCAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPIDDOCGEDOX) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_DOCAGENTE(pPCAGENTE, pPIDDOCGEDOX);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_GET_DOCAGENTE
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_DOCUMENTACION(PCAGENTE)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_DOCUMENTACION(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_DOCUMENTACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DOCAGENTE".toUpperCase())); // Valor de "PTDOCAGENTE"
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
			retVal.put("PTDOCAGENTE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTDOCAGENTE", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DOCUMENTACION(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_DOCUMENTACION(pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_REDCOMERCIAL.F_GET_DOCUMENTACION
	// --START-PAC_IAX_REDCOMERCIAL.F_SET_DOCAGENTE(PCAGENTE, PFCADUCA, PTOBSERVA,
	// PTFILENAME, PIDDOCGEDOX, PTAMANO, PTDESC, PIDCAT)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_DOCAGENTE(java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA,
			String pPTOBSERVA, String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTAMANO, String pPTDESC,
			java.math.BigDecimal pPIDCAT) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_DOCAGENTE(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPFCADUCA", "pPTOBSERVA", "pPTFILENAME", "pPIDDOCGEDOX", "pPTAMANO",
						"pPTDESC", "pPIDCAT" },
				new Object[] { pPCAGENTE, pPFCADUCA, pPTOBSERVA, pPTFILENAME, pPIDDOCGEDOX, pPTAMANO, pPTDESC,
						pPIDCAT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPFCADUCA);
		cStmt.setObject(4, pPTOBSERVA);
		cStmt.setObject(5, pPTFILENAME);
		cStmt.setObject(6, pPIDDOCGEDOX);
		cStmt.setObject(7, pPTAMANO);
		cStmt.setObject(8, pPTDESC);
		cStmt.setObject(9, pPIDCAT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_DOCAGENTE(java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA,
			String pPTOBSERVA, String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTAMANO, String pPTDESC,
			java.math.BigDecimal pPIDCAT) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_DOCAGENTE(pPCAGENTE, pPFCADUCA, pPTOBSERVA, pPTFILENAME,
				pPIDDOCGEDOX, pPTAMANO, pPTDESC, pPIDCAT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_DOCAGENTE

	// --START-PAC_IAX_REDCOMERCIAL.F_BUSCA_PADRE(PCEMPRES, PCAGENTE, PCTIPAGE,
	// PFBUSCA)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_BUSCA_PADRE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPAGE, java.sql.Date pPFBUSCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_BUSCA_PADRE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCAGENTE", "pPCTIPAGE", "pPFBUSCA" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPCTIPAGE, pPFBUSCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCTIPAGE);
		cStmt.setObject(5, pPFBUSCA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PTAGENTE"
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
			retVal.put("PTAGENTE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PTAGENTE", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_BUSCA_PADRE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPAGE, java.sql.Date pPFBUSCA) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_BUSCA_PADRE(pPCEMPRES, pPCAGENTE, pPCTIPAGE, pPFBUSCA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_BUSCA_PADRE

	// --START-PAC_IAX_REDCOMERCIAL.F_GET_RETENCION(PSPERSON)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_RETENCION(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_RETENCION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCRETENC"
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
			retVal.put("PCRETENC", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCRETENC", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_RETENCION(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_RETENCION(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_RETENCION

	// --START-PAC_IAX_REDCOMERCIAL.F_GET_CORREO(PCAGENTE)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_CORREO(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_CORREO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTCORREO"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCENVCOR"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PMSJCORREO"
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
			retVal.put("PTCORREO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTCORREO", null);
		}
		try {
			retVal.put("PCENVCOR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCENVCOR", null);
		}
		try {
			retVal.put("PMSJCORREO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PMSJCORREO", null);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CORREO(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_CORREO(pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_CORREO

	// --START-PAC_IAX_REDCOMERCIAL.F_SET_CORREO(PCAGENTE, PTCORREO, PCENVCOR,
	// CORREO, ENVIO, CODIGO)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_SET_CORREO(java.math.BigDecimal pPCAGENTE, String pPTCORREO,
			java.math.BigDecimal pPCENVCOR, String pCORREO, java.math.BigDecimal pENVIO, java.math.BigDecimal pCODIGO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_SET_CORREO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPTCORREO", "pPCENVCOR", "pCORREO", "pENVIO", "pCODIGO" },
				new Object[] { pPCAGENTE, pPTCORREO, pPCENVCOR, pCORREO, pENVIO, pCODIGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPTCORREO);
		cStmt.setObject(4, pPCENVCOR);
		cStmt.setObject(5, pCORREO);
		cStmt.setObject(6, pENVIO);
		cStmt.setObject(7, pCODIGO);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_SET_CORREO(java.math.BigDecimal pPCAGENTE, String pPTCORREO,
			java.math.BigDecimal pPCENVCOR, String pCORREO, java.math.BigDecimal pENVIO, java.math.BigDecimal pCODIGO)
			throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_SET_CORREO(pPCAGENTE, pPTCORREO, pPCENVCOR, pCORREO, pENVIO, pCODIGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_SET_CORREO

	// Rafael Borduchi - 30-05-2019 iaxis-4077
	// --START-PAC_IAX_REDCOMERCIAL.F_GET_USERS(PCAGENTE, PCTIPO)
	private HashMap callPAC_IAX_REDCOMERCIAL__F_GET_USERS(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REDCOMERCIAL.F_GET_USERS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pIDIOMA" }, new Object[] { pPCAGENTE, pIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pIDIOMA);
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

	public HashMap ejecutaPAC_IAX_REDCOMERCIAL__F_GET_USERS(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pIDIOMA) throws Exception {
		return this.callPAC_IAX_REDCOMERCIAL__F_GET_USERS(pPCAGENTE, pIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_REDCOMERCIAL.F_GET_USERS

	// Rafael Borduchi - 30-05-2019 iaxis-4077
}
