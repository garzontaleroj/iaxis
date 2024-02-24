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

public class PAC_IAX_INFORMES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_INFORMES.class);
	private Connection conn = null;

	public PAC_IAX_INFORMES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_INFORMES.F_LANZAR_COBFALLECIMIENTO(PINICOBERTURA,
	// PFINCOBERTURA, PFICHERO, PTIPOENVIO)
	private HashMap callPAC_IAX_INFORMES__F_LANZAR_COBFALLECIMIENTO(java.sql.Date pPINICOBERTURA,
			java.sql.Date pPFINCOBERTURA, String pPFICHERO, java.math.BigDecimal pPTIPOENVIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_LANZAR_COBFALLECIMIENTO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPINICOBERTURA", "pPFINCOBERTURA", "pPFICHERO", "pPTIPOENVIO" },
				new Object[] { pPINICOBERTURA, pPFINCOBERTURA, pPFICHERO, pPTIPOENVIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPINICOBERTURA);
		cStmt.setObject(3, pPFINCOBERTURA);
		cStmt.setObject(4, pPFICHERO);
		cStmt.setObject(5, pPTIPOENVIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PFGENERADO"
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
			retVal.put("PFGENERADO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PFGENERADO", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_LANZAR_COBFALLECIMIENTO(java.sql.Date pPINICOBERTURA,
			java.sql.Date pPFINCOBERTURA, String pPFICHERO, java.math.BigDecimal pPTIPOENVIO) throws Exception {
		return this.callPAC_IAX_INFORMES__F_LANZAR_COBFALLECIMIENTO(pPINICOBERTURA, pPFINCOBERTURA, pPFICHERO,
				pPTIPOENVIO);
	}

	// --END-PAC_IAX_INFORMES.F_LANZAR_COBFALLECIMIENTO
	// --START-PAC_IAX_INFORMES.F_OBTENER_TRASPASOS(PFDESDE, PFHASTA, PCEMPRES)
	private HashMap callPAC_IAX_INFORMES__F_OBTENER_TRASPASOS(java.sql.Date pPFDESDE, java.sql.Date pPFHASTA,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_OBTENER_TRASPASOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFDESDE", "pPFHASTA", "pPCEMPRES" },
				new Object[] { pPFDESDE, pPFHASTA, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFDESDE);
		cStmt.setObject(3, pPFHASTA);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PFICHERO"
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
			retVal.put("PFICHERO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_OBTENER_TRASPASOS(java.sql.Date pPFDESDE, java.sql.Date pPFHASTA,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_INFORMES__F_OBTENER_TRASPASOS(pPFDESDE, pPFHASTA, pPCEMPRES);
	}
	// --END-PAC_IAX_INFORMES.F_OBTENER_TRASPASOS

	// --START-PAC_IAX_INFORMES.F_LANZAR_LIST001(P_CINFORME, P_CIDIOMA, P_CEMPRES,
	// P_FINIEFE, P_FFINEFE, P_CTIPAGE, P_CAGENTE, P_SPERSON, P_CNEGOCIO,
	// P_CODIGOSN, P_SPRODUC)
	private HashMap callPAC_IAX_INFORMES__F_LANZAR_LIST001(java.math.BigDecimal pP_CINFORME,
			java.math.BigDecimal pP_CIDIOMA, java.math.BigDecimal pP_CEMPRES, java.sql.Date pP_FINIEFE,
			java.sql.Date pP_FFINEFE, java.math.BigDecimal pP_CTIPAGE, java.math.BigDecimal pP_CAGENTE,
			java.math.BigDecimal pP_SPERSON, java.math.BigDecimal pP_CNEGOCIO, String pP_CODIGOSN, String pP_SPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_LANZAR_LIST001(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CINFORME", "pP_CIDIOMA", "pP_CEMPRES", "pP_FINIEFE", "pP_FFINEFE", "pP_CTIPAGE",
						"pP_CAGENTE", "pP_SPERSON", "pP_CNEGOCIO", "pP_CODIGOSN", "pP_SPRODUC" },
				new Object[] { pP_CINFORME, pP_CIDIOMA, pP_CEMPRES, pP_FINIEFE, pP_FFINEFE, pP_CTIPAGE, pP_CAGENTE,
						pP_SPERSON, pP_CNEGOCIO, pP_CODIGOSN, pP_SPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CINFORME);
		cStmt.setObject(3, pP_CIDIOMA);
		cStmt.setObject(4, pP_CEMPRES);
		cStmt.setObject(5, pP_FINIEFE);
		cStmt.setObject(6, pP_FFINEFE);
		cStmt.setObject(7, pP_CTIPAGE);
		cStmt.setObject(8, pP_CAGENTE);
		cStmt.setObject(9, pP_SPERSON);
		cStmt.setObject(10, pP_CNEGOCIO);
		cStmt.setObject(11, pP_CODIGOSN);
		cStmt.setObject(12, pP_SPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, java.sql.Types.VARCHAR); // Valor de "P_FGENERADO"
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
			retVal.put("P_FGENERADO", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("P_FGENERADO", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_LANZAR_LIST001(java.math.BigDecimal pP_CINFORME,
			java.math.BigDecimal pP_CIDIOMA, java.math.BigDecimal pP_CEMPRES, java.sql.Date pP_FINIEFE,
			java.sql.Date pP_FFINEFE, java.math.BigDecimal pP_CTIPAGE, java.math.BigDecimal pP_CAGENTE,
			java.math.BigDecimal pP_SPERSON, java.math.BigDecimal pP_CNEGOCIO, String pP_CODIGOSN, String pP_SPRODUC)
			throws Exception {
		return this.callPAC_IAX_INFORMES__F_LANZAR_LIST001(pP_CINFORME, pP_CIDIOMA, pP_CEMPRES, pP_FINIEFE, pP_FFINEFE,
				pP_CTIPAGE, pP_CAGENTE, pP_SPERSON, pP_CNEGOCIO, pP_CODIGOSN, pP_SPRODUC);
	}

	// --END-PAC_IAX_INFORMES.F_LANZAR_LIST001
	// --START-PAC_IAX_INFORMES.F_GET_DOCUMENTACION(PSSEGURO)
	private HashMap callPAC_IAX_INFORMES__F_GET_DOCUMENTACION(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_DOCUMENTACION(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_DOCUMENTACION(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_DOCUMENTACION(pPSSEGURO);
	}
	// --END-PAC_IAX_INFORMES.F_GET_DOCUMENTACION
	// --START-PAC_IAX_INFORMES.F_EJECUTA_INFORME(PCMAP, PCEMPRES, PCEXPORT,
	// PPARAMS, PCIDIOMA, PCBATCH, PEMAIL)
	/*
	 * private HashMap callPAC_IAX_INFORMES__F_EJECUTA_INFORME (String pPCMAP,
	 * java.math.BigDecimal pPCEMPRES, String pPCEXPORT, Object pPPARAMS,
	 * java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCBATCH, String
	 * pPEMAIL) throws Exception { String
	 * callQuery="{?=call PAC_IAX_INFORMES.F_EJECUTA_INFORME(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPCMAP", "pPCEMPRES", "pPCEXPORT",
	 * "pPPARAMS", "pPCIDIOMA", "pPCBATCH", "pPEMAIL"}, new Object[] {pPCMAP,
	 * pPCEMPRES, pPCEXPORT, pPPARAMS, pPCIDIOMA, pPCBATCH, pPEMAIL});
	 * CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCMAP); cStmt.setObject(3, pPCEMPRES); cStmt.setObject(4, pPCEXPORT);
	 * cStmt.setObject(5, pPPARAMS); cStmt.setObject(6, pPCIDIOMA);
	 * cStmt.setObject(7, pPCBATCH); cStmt.setObject(8, pPEMAIL);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de
	 * "ONOMFICHERO" cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); //
	 * Valor de "OFICHERO" cStmt.registerOutParameter(11,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" cStmt.execute();
	 * HashMap retVal=new HashMap(); try { retVal.put("RETURN", cStmt.getObject(1));
	 * } catch (SQLException e) { retVal.put("RETURN", null); } try {
	 * retVal.put("ONOMFICHERO", cStmt.getObject(9)); } catch (SQLException e) {
	 * retVal.put("ONOMFICHERO", null); } try { retVal.put("OFICHERO",
	 * cStmt.getObject(10)); } catch (SQLException e) { retVal.put("OFICHERO",
	 * null); } try { retVal.put("MENSAJES", cStmt.getObject(11)); } catch
	 * (SQLException e) { retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME (String pPCMAP,
	 * java.math.BigDecimal pPCEMPRES, String pPCEXPORT, Object pPPARAMS,
	 * java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCBATCH, String
	 * pPEMAIL) throws Exception { return
	 * this.callPAC_IAX_INFORMES__F_EJECUTA_INFORME(pPCMAP, pPCEMPRES, pPCEXPORT,
	 * pPPARAMS, pPCIDIOMA, pPCBATCH, pPEMAIL);//AXIS-WLS1SERVER-Ready }
	 * //--END-PAC_IAX_INFORMES.F_EJECUTA_INFORME
	 */

	// --START-PAC_IAX_INFORMES.F_GET_CFGINFORME(PCEMPRES, PCFORM, PTEVENTO,
	// PSPRODUC, PCMAP)
	private HashMap callPAC_IAX_INFORMES__F_GET_CFGINFORME(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_CFGINFORME(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC", "pPCMAP" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCMAP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCONFIGSINF"
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
			retVal.put("PCURCONFIGSINF", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCURCONFIGSINF", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_CFGINFORME(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_CFGINFORME(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_GET_CFGINFORME

	// --START-PAC_IAX_INFORMES.F_GET_DETPLANTILLAS(PCCODPLAN, PCIDIOMA, PTDESCRIP,
	// PCINFORME, PCPATH)
	/*
	 * private HashMap callPAC_IAX_INFORMES__F_GET_DETPLANTILLAS (String pPCCODPLAN,
	 * java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String pPCINFORME, String
	 * pPCPATH) throws Exception { String
	 * callQuery="{?=call PAC_IAX_INFORMES.F_GET_DETPLANTILLAS(?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPCCODPLAN", "pPCIDIOMA", "pPTDESCRIP",
	 * "pPCINFORME", "pPCPATH"}, new Object[] {pPCCODPLAN, pPCIDIOMA, pPTDESCRIP,
	 * pPCINFORME, pPCPATH}); CallableStatement cStmt=conn.prepareCall(callQuery);
	 * String USERNAME=conn.getMetaData().getUserName().toUpperCase();
	 * cStmt.setObject(2, pPCCODPLAN); cStmt.setObject(3, pPCIDIOMA);
	 * cStmt.setObject(4, pPTDESCRIP); cStmt.setObject(5, pPCINFORME);
	 * cStmt.setObject(6, pPCPATH); cStmt.registerOutParameter(1,
	 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(7,
	 * oracle.jdbc.OracleTypes.CURSOR); // Valor de "ODETPLANTILLAS"
	 * cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("ODETPLANTILLAS",
	 * cStmt.getObject(7)); } catch (SQLException e) { retVal.put("ODETPLANTILLAS",
	 * null); } try { retVal.put("MENSAJES", cStmt.getObject(8)); } catch
	 * (SQLException e) { retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_INFORMES__F_GET_DETPLANTILLAS (String
	 * pPCCODPLAN, java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String
	 * pPCINFORME, String pPCPATH) throws Exception { return
	 * this.callPAC_IAX_INFORMES__F_GET_DETPLANTILLAS(pPCCODPLAN, pPCIDIOMA,
	 * pPTDESCRIP, pPCINFORME, pPCPATH);//AXIS-WLS1SERVER-Ready }
	 * //--END-PAC_IAX_INFORMES.F_GET_DETPLANTILLAS
	 */

	// --START-PAC_IAX_INFORMES.F_GET_INFORMES(PCEMPRES, PCFORM, PTEVENTO, PSPRODUC,
	// PSTIPO)
	private HashMap callPAC_IAX_INFORMES__F_GET_INFORMES(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSTIPO,
			java.math.BigDecimal pPCAREA) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_INFORMES(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC", "pPSTIPO", "pPCAREA" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPSTIPO, pPCAREA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPSTIPO);
		cStmt.setObject(7, pPCAREA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCONFIGSINF"
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
			retVal.put("PCURCONFIGSINF", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCURCONFIGSINF", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_INFORMES(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSTIPO,
			java.math.BigDecimal pPCAREA) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_INFORMES(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPSTIPO, pPCAREA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_GET_INFORMES

	// --START-PAC_IAX_INFORMES.F_GET_LISTAINFORMESREPORTS(PCEMPRES, PIDIOMA,
	// PCFORM, PCMAP)
	private HashMap callPAC_IAX_INFORMES__F_GET_LISTAINFORMESREPORTS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPIDIOMA, String pPCFORM, String pPCMAP) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_LISTAINFORMESREPORTS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPIDIOMA", "pPCFORM", "pPCMAP" },
				new Object[] { pPCEMPRES, pPIDIOMA, pPCFORM, pPCMAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPIDIOMA);
		cStmt.setObject(4, pPCFORM);
		cStmt.setObject(5, pPCMAP);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_LISTAINFORMESREPORTS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPIDIOMA, String pPCFORM, String pPCMAP) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_LISTAINFORMESREPORTS(pPCEMPRES, pPIDIOMA, pPCFORM, pPCMAP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_GET_LISTAINFORMESREPORTS

	// --START-PAC_IAX_INFORMES.F_GET_PARAMS(PCEMPRES, PCFORM, PTEVENTO, PSPRODUC,
	// PCMAP)
	private HashMap callPAC_IAX_INFORMES__F_GET_PARAMS(java.math.BigDecimal pPCEMPRES, String pPCFORM, String pPTEVENTO,
			java.math.BigDecimal pPSPRODUC, String pPCMAP) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_PARAMS(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC", "pPCMAP" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCMAP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "OPARAMS"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "OCEXPORT"
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
			retVal.put("OPARAMS", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("OPARAMS", null);
		}
		try {
			retVal.put("OCEXPORT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("OCEXPORT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_PARAMS(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_PARAMS(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INFORMES.F_GET_PARAMS
	// --START-PAC_IAX_INFORMES.F_GET_PARAMS_INFORME(PCEMPRES, PCFORM, PTEVENTO,
	// PSPRODUC, PCMAP, PCCFGFORM)
	private HashMap callPAC_IAX_INFORMES__F_GET_PARAMS_INFORME(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPCCFGFORM) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_PARAMS_INFORME(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC", "pPCMAP", "pPCCFGFORM" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP, pPCCFGFORM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCMAP);
		cStmt.setObject(7, pPCCFGFORM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "OPARAMS"
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
			retVal.put("OPARAMS", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("OPARAMS", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_PARAMS_INFORME(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPCCFGFORM) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_PARAMS_INFORME(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP,
				pPCCFGFORM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INFORMES.F_GET_PARAMS_INFORME
	// --START-PAC_IAX_INFORMES.F_GET_PARLIST(PCEMPRES, PCFORM, PTEVENTO, PSPRODUC,
	// PCMAP, PCPARAM)
	private HashMap callPAC_IAX_INFORMES__F_GET_PARLIST(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPCPARAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_PARLIST(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPTEVENTO", "pPSPRODUC", "pPCMAP", "pPCPARAM" },
				new Object[] { pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCMAP);
		cStmt.setObject(7, pPCPARAM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "OLIST"
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
			retVal.put("OLIST", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("OLIST", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_PARLIST(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCMAP, String pPCPARAM) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_PARLIST(pPCEMPRES, pPCFORM, pPTEVENTO, pPSPRODUC, pPCMAP, pPCPARAM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INFORMES.F_GET_PARLIST
	// --START-PAC_IAX_INFORMES.F_INS_CFGLANZARINFORMESPARAMS(PCEMPRES, PCFORM,
	// PCMAP, PTEVENTO, PSPRODUC, PCCFGFORM, PTPARAM, PCTIPO, PNORDER, PSLITERA,
	// PNOTNULL, PLVALOR)
	private HashMap callPAC_IAX_INFORMES__F_INS_CFGLANZARINFORMESPARAMS(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPCMAP, String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCCFGFORM, String pPTPARAM,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPNORDER, java.math.BigDecimal pPSLITERA,
			java.math.BigDecimal pPNOTNULL, String pPLVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_INS_CFGLANZARINFORMESPARAMS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCFORM", "pPCMAP", "pPTEVENTO", "pPSPRODUC", "pPCCFGFORM", "pPTPARAM",
						"pPCTIPO", "pPNORDER", "pPSLITERA", "pPNOTNULL", "pPLVALOR" },
				new Object[] { pPCEMPRES, pPCFORM, pPCMAP, pPTEVENTO, pPSPRODUC, pPCCFGFORM, pPTPARAM, pPCTIPO,
						pPNORDER, pPSLITERA, pPNOTNULL, pPLVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPCMAP);
		cStmt.setObject(5, pPTEVENTO);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCCFGFORM);
		cStmt.setObject(8, pPTPARAM);
		cStmt.setObject(9, pPCTIPO);
		cStmt.setObject(10, pPNORDER);
		cStmt.setObject(11, pPSLITERA);
		cStmt.setObject(12, pPNOTNULL);
		cStmt.setObject(13, pPLVALOR);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_INS_CFGLANZARINFORMESPARAMS(java.math.BigDecimal pPCEMPRES,
			String pPCFORM, String pPCMAP, String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCCFGFORM,
			String pPTPARAM, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPNORDER,
			java.math.BigDecimal pPSLITERA, java.math.BigDecimal pPNOTNULL, String pPLVALOR) throws Exception {
		return this.callPAC_IAX_INFORMES__F_INS_CFGLANZARINFORMESPARAMS(pPCEMPRES, pPCFORM, pPCMAP, pPTEVENTO,
				pPSPRODUC, pPCCFGFORM, pPTPARAM, pPCTIPO, pPNORDER, pPSLITERA, pPNOTNULL, pPLVALOR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_INS_CFGLANZARINFORMESPARAMS

	// --START-PAC_IAX_INFORMES.F_SET_CFGLANZARINFORMES(PCEMPRES, PCFORM, PCMAP,
	// PTEVENTO, PSPRODUC, PSLITERA, PLPARAMS, PGENERAREPORT, PCCFGFORM, PLEXPORT,
	// PCTIPO)
	private HashMap callPAC_IAX_INFORMES__F_SET_CFGLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPCMAP, String pPTEVENTO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSLITERA,
			String pPLPARAMS, java.math.BigDecimal pPGENERAREPORT, String pPCCFGFORM, String pPLEXPORT,
			java.math.BigDecimal pPCTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_SET_CFGLANZARINFORMES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCFORM", "pPCMAP", "pPTEVENTO", "pPSPRODUC", "pPSLITERA", "pPLPARAMS",
						"pPGENERAREPORT", "pPCCFGFORM", "pPLEXPORT", "pPCTIPO" },
				new Object[] { pPCEMPRES, pPCFORM, pPCMAP, pPTEVENTO, pPSPRODUC, pPSLITERA, pPLPARAMS, pPGENERAREPORT,
						pPCCFGFORM, pPLEXPORT, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPCMAP);
		cStmt.setObject(5, pPTEVENTO);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPSLITERA);
		cStmt.setObject(8, pPLPARAMS);
		cStmt.setObject(9, pPGENERAREPORT);
		cStmt.setObject(10, pPCCFGFORM);
		cStmt.setObject(11, pPLEXPORT);
		cStmt.setObject(12, pPCTIPO);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_SET_CFGLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPCMAP, String pPTEVENTO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSLITERA,
			String pPLPARAMS, java.math.BigDecimal pPGENERAREPORT, String pPCCFGFORM, String pPLEXPORT,
			java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_INFORMES__F_SET_CFGLANZARINFORMES(pPCEMPRES, pPCFORM, pPCMAP, pPTEVENTO, pPSPRODUC,
				pPSLITERA, pPLPARAMS, pPGENERAREPORT, pPCCFGFORM, pPLEXPORT, pPCTIPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_SET_CFGLANZARINFORMES

	// --START-PAC_IAX_INFORMES.F_SET_CODIPLANTILLAS(PCCODPLAN, PIDCONSULTA, PGEDOX,
	// PIDCAT, PCGENFICH, PCGENPDF, PCGENREP, PCTIPODOC, PCFDIGITAL)
	/*
	 * private HashMap callPAC_IAX_INFORMES__F_SET_CODIPLANTILLAS (String
	 * pPCCODPLAN, java.math.BigDecimal pPIDCONSULTA, String pPGEDOX,
	 * java.math.BigDecimal pPIDCAT, java.math.BigDecimal pPCGENFICH,
	 * java.math.BigDecimal pPCGENPDF, java.math.BigDecimal pPCGENREP,
	 * java.math.BigDecimal pPCTIPODOC, String pPCFDIGITAL) throws Exception {
	 * String
	 * callQuery="{?=call PAC_IAX_INFORMES.F_SET_CODIPLANTILLAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPCCODPLAN", "pPIDCONSULTA", "pPGEDOX",
	 * "pPIDCAT", "pPCGENFICH", "pPCGENPDF", "pPCGENREP", "pPCTIPODOC",
	 * "pPCFDIGITAL"}, new Object[] {pPCCODPLAN, pPIDCONSULTA, pPGEDOX, pPIDCAT,
	 * pPCGENFICH, pPCGENPDF, pPCGENREP, pPCTIPODOC, pPCFDIGITAL});
	 * CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCCODPLAN); cStmt.setObject(3, pPIDCONSULTA); cStmt.setObject(4, pPGEDOX);
	 * cStmt.setObject(5, pPIDCAT); cStmt.setObject(6, pPCGENFICH);
	 * cStmt.setObject(7, pPCGENPDF); cStmt.setObject(8, pPCGENREP);
	 * cStmt.setObject(9, pPCTIPODOC); cStmt.setObject(10, pPCFDIGITAL);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(11)); } catch (SQLException e) { retVal.put("MENSAJES",
	 * null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_INFORMES__F_SET_CODIPLANTILLAS (String
	 * pPCCODPLAN, java.math.BigDecimal pPIDCONSULTA, String pPGEDOX,
	 * java.math.BigDecimal pPIDCAT, java.math.BigDecimal pPCGENFICH,
	 * java.math.BigDecimal pPCGENPDF, java.math.BigDecimal pPCGENREP,
	 * java.math.BigDecimal pPCTIPODOC, String pPCFDIGITAL) throws Exception {
	 * return this.callPAC_IAX_INFORMES__F_SET_CODIPLANTILLAS(pPCCODPLAN,
	 * pPIDCONSULTA, pPGEDOX, pPIDCAT, pPCGENFICH, pPCGENPDF, pPCGENREP, pPCTIPODOC,
	 * pPCFDIGITAL);//AXIS-WLS1SERVER-Ready }
	 */
	// --END-PAC_IAX_INFORMES.F_SET_CODIPLANTILLAS
	// --START-PAC_IAX_INFORMES.F_SET_DETPLANTILLAS(PCCODPLAN, PCIDIOMA, PTDESCRIP,
	// PCINFORME, PCPATH, PCMAPEAD, PCFIRMA, PTCONFIRMA)
	/*
	 * private HashMap callPAC_IAX_INFORMES__F_SET_DETPLANTILLAS (String pPCCODPLAN,
	 * java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String pPCINFORME, String
	 * pPCPATH, String pPCMAPEAD, java.math.BigDecimal pPCFIRMA, String pPTCONFIRMA)
	 * throws Exception { String
	 * callQuery="{?=call PAC_IAX_INFORMES.F_SET_DETPLANTILLAS(?, ?, ?, ?, ?, ?, ?, ?, ?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPCCODPLAN", "pPCIDIOMA", "pPTDESCRIP",
	 * "pPCINFORME", "pPCPATH", "pPCMAPEAD", "pPCFIRMA", "pPTCONFIRMA"}, new
	 * Object[] {pPCCODPLAN, pPCIDIOMA, pPTDESCRIP, pPCINFORME, pPCPATH, pPCMAPEAD,
	 * pPCFIRMA, pPTCONFIRMA}); CallableStatement cStmt=conn.prepareCall(callQuery);
	 * String USERNAME=conn.getMetaData().getUserName().toUpperCase();
	 * cStmt.setObject(2, pPCCODPLAN); cStmt.setObject(3, pPCIDIOMA);
	 * cStmt.setObject(4, pPTDESCRIP); cStmt.setObject(5, pPCINFORME);
	 * cStmt.setObject(6, pPCPATH); cStmt.setObject(7, pPCMAPEAD);
	 * cStmt.setObject(8, pPCFIRMA); cStmt.setObject(9, pPTCONFIRMA);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(10)); } catch (SQLException e) { retVal.put("MENSAJES",
	 * null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_INFORMES__F_SET_DETPLANTILLAS (String
	 * pPCCODPLAN, java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String
	 * pPCINFORME, String pPCPATH, String pPCMAPEAD, java.math.BigDecimal pPCFIRMA,
	 * String pPTCONFIRMA) throws Exception { return
	 * this.callPAC_IAX_INFORMES__F_SET_DETPLANTILLAS(pPCCODPLAN, pPCIDIOMA,
	 * pPTDESCRIP, pPCINFORME, pPCPATH, pPCMAPEAD, pPCFIRMA,
	 * pPTCONFIRMA);//AXIS-WLS1SERVER-Ready }
	 * //--END-PAC_IAX_INFORMES.F_SET_DETPLANTILLAS
	 */

	// --START-PAC_IAX_INFORMES.F_DEL_CFGLANZARINFORMESPARAMS(PCEMPRES, PCFORM,
	// PCMAP, PTEVENTO, PSPRODUC, PCCFGFORM)
	private HashMap callPAC_IAX_INFORMES__F_DEL_CFGLANZARINFORMESPARAMS(java.math.BigDecimal pPCEMPRES, String pPCFORM,
			String pPCMAP, String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCCFGFORM) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_DEL_CFGLANZARINFORMESPARAMS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCFORM", "pPCMAP", "pPTEVENTO", "pPSPRODUC", "pPCCFGFORM" },
				new Object[] { pPCEMPRES, pPCFORM, pPCMAP, pPTEVENTO, pPSPRODUC, pPCCFGFORM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCFORM);
		cStmt.setObject(4, pPCMAP);
		cStmt.setObject(5, pPTEVENTO);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCCFGFORM);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_DEL_CFGLANZARINFORMESPARAMS(java.math.BigDecimal pPCEMPRES,
			String pPCFORM, String pPCMAP, String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCCFGFORM)
			throws Exception {
		return this.callPAC_IAX_INFORMES__F_DEL_CFGLANZARINFORMESPARAMS(pPCEMPRES, pPCFORM, pPCMAP, pPTEVENTO,
				pPSPRODUC, pPCCFGFORM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_DEL_CFGLANZARINFORMESPARAMS

	// --START-PAC_IAX_INFORMES.F_UPD_CFGLANZARINFORMES(PCEMPRES, PCMAP, PTEVENTO,
	// PSPRODUC, PCCFGFORM, PLEXPORT, PSLITERA)
	private HashMap callPAC_IAX_INFORMES__F_UPD_CFGLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCCFGFORM, String pPLEXPORT,
			java.math.BigDecimal pPSLITERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_UPD_CFGLANZARINFORMES(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCMAP", "pPTEVENTO", "pPSPRODUC", "pPCCFGFORM", "pPLEXPORT",
						"pPSLITERA" },
				new Object[] { pPCEMPRES, pPCMAP, pPTEVENTO, pPSPRODUC, pPCCFGFORM, pPLEXPORT, pPSLITERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAP);
		cStmt.setObject(4, pPTEVENTO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCCFGFORM);
		cStmt.setObject(7, pPLEXPORT);
		cStmt.setObject(8, pPSLITERA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INFORMES__F_UPD_CFGLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			String pPTEVENTO, java.math.BigDecimal pPSPRODUC, String pPCCFGFORM, String pPLEXPORT,
			java.math.BigDecimal pPSLITERA) throws Exception {
		return this.callPAC_IAX_INFORMES__F_UPD_CFGLANZARINFORMES(pPCEMPRES, pPCMAP, pPTEVENTO, pPSPRODUC, pPCCFGFORM,
				pPLEXPORT, pPSLITERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_UPD_CFGLANZARINFORMES

	// --START-PAC_IAX_INFORMES.F_DEL_DETALLEPLANTILLAS(PCCODPLAN)
	/*
	 * private HashMap callPAC_IAX_INFORMES__F_DEL_DETALLEPLANTILLAS (String
	 * pPCCODPLAN) throws Exception { String
	 * callQuery="{?=call PAC_IAX_INFORMES.F_DEL_DETALLEPLANTILLAS(?, ?)}";
	 * 
	 * logCall(callQuery, new String[] {"pPCCODPLAN"}, new Object[] {pPCCODPLAN});
	 * CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCCODPLAN); cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor
	 * de "RETURN" cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(3)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_INFORMES__F_DEL_DETALLEPLANTILLAS (String
	 * pPCCODPLAN) throws Exception { return
	 * this.callPAC_IAX_INFORMES__F_DEL_DETALLEPLANTILLAS(pPCCODPLAN);//AXIS-
	 * WLS1SERVER-Ready }
	 */
	// --END-PAC_IAX_INFORMES.F_DEL_DETALLEPLANTILLAS

	// --START-PAC_IAX_INFORMES.F_GET_LISTAINFORMES(PCEMPRES, PCMAP, PCESTADO,
	// PCUSER, PFINI, PFFIN, PCBATCH)
	private HashMap callPAC_IAX_INFORMES__F_GET_LISTAINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			java.math.BigDecimal pPCESTADO, String pPCUSER, java.sql.Date pPFINI, java.sql.Date pPFFIN,
			java.math.BigDecimal pPCBATCH) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_LISTAINFORMES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCMAP", "pPCESTADO", "pPCUSER", "pPFINI", "pPFFIN", "pPCBATCH" },
				new Object[] { pPCEMPRES, pPCMAP, pPCESTADO, pPCUSER, pPFINI, pPFFIN, pPCBATCH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAP);
		cStmt.setObject(4, pPCESTADO);
		cStmt.setObject(5, pPCUSER);
		cStmt.setObject(6, pPFINI);
		cStmt.setObject(7, pPFFIN);
		cStmt.setObject(8, pPCBATCH);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSONINFORMES"
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
			retVal.put("PCURSONINFORMES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCURSONINFORMES", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_LISTAINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			java.math.BigDecimal pPCESTADO, String pPCUSER, java.sql.Date pPFINI, java.sql.Date pPFFIN,
			java.math.BigDecimal pPCBATCH) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_LISTAINFORMES(pPCEMPRES, pPCMAP, pPCESTADO, pPCUSER, pPFINI, pPFFIN,
				pPCBATCH);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INFORMES.F_GET_LISTAINFORMES
	// --START-PAC_IAX_INFORMES.F_UPD_INF_BATCH(PCESTADO, PTERROR, PTFICHERO,
	// PSINTERF)
	private HashMap callPAC_IAX_INFORMES__F_UPD_INF_BATCH(java.math.BigDecimal pPCESTADO, String pPTERROR,
			String pPTFICHERO, java.math.BigDecimal pPSINTERF) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_UPD_INF_BATCH(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCESTADO", "pPTERROR", "pPTFICHERO", "pPSINTERF" },
				new Object[] { pPCESTADO, pPTERROR, pPTFICHERO, pPSINTERF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESTADO);
		cStmt.setObject(3, pPTERROR);
		cStmt.setObject(4, pPTFICHERO);
		cStmt.setObject(5, pPSINTERF);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_UPD_INF_BATCH(java.math.BigDecimal pPCESTADO, String pPTERROR,
			String pPTFICHERO, java.math.BigDecimal pPSINTERF) throws Exception {
		return this.callPAC_IAX_INFORMES__F_UPD_INF_BATCH(pPCESTADO, pPTERROR, pPTFICHERO, pPSINTERF);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_UPD_INF_BATCH

	// --START-PAC_IAX_INFORMES.F_GET_IDIOMASINFORME(PCEMPRES, PCCODPLAN, PCFORM)
	/*
	 * private HashMap callPAC_IAX_INFORMES__F_GET_IDIOMASINFORME
	 * (java.math.BigDecimal pPCEMPRES, String pPCCODPLAN, String pPCFORM) throws
	 * Exception { String
	 * callQuery="{?=call PAC_IAX_INFORMES.F_GET_IDIOMASINFORME(?, ?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] {"pPCEMPRES", "pPCCODPLAN", "pPCFORM"}, new
	 * Object[] {pPCEMPRES, pPCCODPLAN, pPCFORM}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCEMPRES); cStmt.setObject(3, pPCCODPLAN); cStmt.setObject(4, pPCFORM);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de
	 * "PCURSORIDIOMAS" cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("PCURSORIDIOMAS",
	 * cStmt.getObject(5)); } catch (SQLException e) { retVal.put("PCURSORIDIOMAS",
	 * null); } try { retVal.put("MENSAJES", cStmt.getObject(6)); } catch
	 * (SQLException e) { retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_INFORMES__F_GET_IDIOMASINFORME
	 * (java.math.BigDecimal pPCEMPRES, String pPCCODPLAN, String pPCFORM) throws
	 * Exception { return this.callPAC_IAX_INFORMES__F_GET_IDIOMASINFORME(pPCEMPRES,
	 * pPCCODPLAN, pPCFORM);//AXIS-WLS1SERVER-Ready }
	 */
	// --END-PAC_IAX_INFORMES.F_GET_IDIOMASINFORME
	// --START-PAC_IAX_INFORMES.F_GET_USUARIOS(PCEMPRES)
	private HashMap callPAC_IAX_INFORMES__F_GET_USUARIOS(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_USUARIOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSORUSUARIOS"
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
			retVal.put("PCURSORUSUARIOS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCURSORUSUARIOS", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_USUARIOS(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_USUARIOS(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_GET_USUARIOS

	// --START-PAC_IAX_INFORMES.F_EJECUTA_INFORME(PCMAP, PCEMPRES, PCEXPORT,
	// PPARAMS, PCIDIOMA, PCBATCH, PEMAIL)
	private HashMap callPAC_IAX_INFORMES__F_EJECUTA_INFORME(String pPCMAP, java.math.BigDecimal pPCEMPRES,
			String pPCEXPORT, Object pPPARAMS, java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCBATCH,
			String pPEMAIL, java.math.BigDecimal pPCGENREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_EJECUTA_INFORME(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMAP", "pPCEMPRES", "pPCEXPORT", "pPPARAMS", "pPCIDIOMA", "pPCBATCH", "pPEMAIL",
						"pPCGENREC" },
				new Object[] { pPCMAP, pPCEMPRES, pPCEXPORT, pPPARAMS, pPCIDIOMA, pPCBATCH, pPEMAIL, pPCGENREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMAP);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCEXPORT);
		cStmt.setObject(5, pPPARAMS);
		cStmt.setObject(6, pPCIDIOMA);
		cStmt.setObject(7, pPCBATCH);
		cStmt.setObject(8, pPEMAIL);
		cStmt.setObject(12, pPCGENREC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "ONOMFICHERO"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "OFICHERO"
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
			retVal.put("ONOMFICHERO", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("ONOMFICHERO", null);
		}
		try {
			retVal.put("OFICHERO", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("OFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(String pPCMAP, java.math.BigDecimal pPCEMPRES,
			String pPCEXPORT, Object pPPARAMS, java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCBATCH,
			String pPEMAIL, java.math.BigDecimal pPCGENREC) throws Exception {
		return this.callPAC_IAX_INFORMES__F_EJECUTA_INFORME(pPCMAP, pPCEMPRES, pPCEXPORT, pPPARAMS, pPCIDIOMA, pPCBATCH,
				pPEMAIL, pPCGENREC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_EJECUTA_INFORME

	// --START-PAC_IAX_INFORMES.F_GET_IDIOMASINFORME(PCEMPRES, PCMAP, PCFORM)
	private HashMap callPAC_IAX_INFORMES__F_GET_IDIOMASINFORME(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			String pPCFORM) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_IDIOMASINFORME(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCMAP", "pPCFORM" },
				new Object[] { pPCEMPRES, pPCMAP, pPCFORM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAP);
		cStmt.setObject(4, pPCFORM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSORIDIOMAS"
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
			retVal.put("PCURSORIDIOMAS", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURSORIDIOMAS", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_IDIOMASINFORME(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			String pPCFORM) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_IDIOMASINFORME(pPCEMPRES, pPCMAP, pPCFORM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INFORMES.F_GET_IDIOMASINFORME

	// --START-PAC_IAX_INFORMES.F_DEL_DETLANZARINFORMES(PCEMPRES, PCMAP)
	private HashMap callPAC_IAX_INFORMES__F_DEL_DETLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_DEL_DETLANZARINFORMES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCMAP" }, new Object[] { pPCEMPRES, pPCMAP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAP);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_DEL_DETLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP)
			throws Exception {
		return this.callPAC_IAX_INFORMES__F_DEL_DETLANZARINFORMES(pPCEMPRES, pPCMAP);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INFORMES.F_DEL_DETLANZARINFORMES
	// --START-PAC_IAX_INFORMES.F_GET_DETLANZARINFORMES(PCEMPRESA, PCMAP, PCIDIOMA,
	// PTDESCRIP, PCINFORME)
	private HashMap callPAC_IAX_INFORMES__F_GET_DETLANZARINFORMES(java.math.BigDecimal pPCEMPRESA, String pPCMAP,
			java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String pPCINFORME) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_GET_DETLANZARINFORMES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRESA", "pPCMAP", "pPCIDIOMA", "pPTDESCRIP", "pPCINFORME" },
				new Object[] { pPCEMPRESA, pPCMAP, pPCIDIOMA, pPTDESCRIP, pPCINFORME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRESA);
		cStmt.setObject(3, pPCMAP);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.setObject(5, pPTDESCRIP);
		cStmt.setObject(6, pPCINFORME);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "ODETPLANTILLAS"
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
			retVal.put("ODETPLANTILLAS", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("ODETPLANTILLAS", null);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_GET_DETLANZARINFORMES(java.math.BigDecimal pPCEMPRESA, String pPCMAP,
			java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String pPCINFORME) throws Exception {
		return this.callPAC_IAX_INFORMES__F_GET_DETLANZARINFORMES(pPCEMPRESA, pPCMAP, pPCIDIOMA, pPTDESCRIP,
				pPCINFORME);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INFORMES.F_GET_DETLANZARINFORMES
	// --START-PAC_IAX_INFORMES.F_SET_DETLANZARINFORMES(PCEMPRES, PCMAP, PCIDIOMA,
	// PTDESCRIP, PCINFORME)
	private HashMap callPAC_IAX_INFORMES__F_SET_DETLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String pPCINFORME) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_SET_DETLANZARINFORMES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCMAP", "pPCIDIOMA", "pPTDESCRIP", "pPCINFORME" },
				new Object[] { pPCEMPRES, pPCMAP, pPCIDIOMA, pPTDESCRIP, pPCINFORME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCMAP);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.setObject(5, pPTDESCRIP);
		cStmt.setObject(6, pPCINFORME);
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

	public HashMap ejecutaPAC_IAX_INFORMES__F_SET_DETLANZARINFORMES(java.math.BigDecimal pPCEMPRES, String pPCMAP,
			java.math.BigDecimal pPCIDIOMA, String pPTDESCRIP, String pPCINFORME) throws Exception {
		return this.callPAC_IAX_INFORMES__F_SET_DETLANZARINFORMES(pPCEMPRES, pPCMAP, pPCIDIOMA, pPTDESCRIP, pPCINFORME);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INFORMES.F_SET_DETLANZARINFORMES
	/* Funtion for inserting IAXIS 3602 Shubendu Informe Tecnico */
	public HashMap ejecutaPAC_IAX_INFORMES__f_inforeme_technico(String pRECLAMO, String pDEPLAZO, String pInterventor,
			String pSupervisor, String pFUENTEDEINFO, java.sql.Date pFELABORACION) throws Exception {
		return this.callPAC_IAX_INFORMES__f_inforeme_technico(pRECLAMO, pDEPLAZO, pInterventor, pSupervisor,
				pFUENTEDEINFO, pFELABORACION);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_INFORMES__f_inforeme_technico(String pRECLAMO, String pDEPLAZO, String pInterventor,
			String pSupervisor, String pFUENTEDEINFO, java.sql.Date pFELABORACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.f_inforeme_technico(?, ?, ?, ?, ?, ?,?)}";
		logCall(callQuery,
				new String[] { "pRECLAMO", "pDEPLAZO", "pInterventor", "pSupervisor", "pFUENTEDEINFO",
						"pFELABORACION" },
				new Object[] { pRECLAMO, pDEPLAZO, pInterventor, pSupervisor, pFUENTEDEINFO, pFELABORACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pRECLAMO);
		cStmt.setObject(3, pDEPLAZO);
		cStmt.setObject(4, pInterventor);
		cStmt.setObject(5, pSupervisor);
		cStmt.setObject(6, pFUENTEDEINFO);
		cStmt.setObject(7, pFELABORACION);
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
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	// Kaio-tarea4113
	private HashMap callPAC_IAX_INFORMES__F_EJECUTA_VALIDA_INFORME(String pPPARAMS, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.f_valida_fecha_madurez(?, ?)}";

		logCall(callQuery, new String[] { "pPPARAMS", "pPCIDIOMA" }, new Object[] { pPPARAMS, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPARAMS);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}// Fin Kaio-tarea4113

	// Kaio-tarea4113
	public HashMap ejecutaPAC_IAX_INFORMES__F_EJECUTA_VALIDA_INFORME(String pPPARAMS, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		return this.callPAC_IAX_INFORMES__F_EJECUTA_VALIDA_INFORME(pPPARAMS, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// Fin Kaio-tarea4113

	//// Kaio INICIO TAREA 4136
	public HashMap ejecutaPAC_IAX_INFORMES__F_LISTA_POLIZAS_PENDIENTES(java.math.BigDecimal pPTOMADOR,
			java.math.BigDecimal pPINTERMEDIARIO) throws Exception {
		return this.callPAC_IAX_INFORMES__F_LISTA_POLIZAS_PENDIENTES(pPTOMADOR, pPINTERMEDIARIO);
	}

	private HashMap callPAC_IAX_INFORMES__F_LISTA_POLIZAS_PENDIENTES(java.math.BigDecimal pPTOMADOR,
			java.math.BigDecimal pPINTERMEDIARIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_LISTA_POLIZAS_PENDIENTES(?,?,?,?)}";
		// String callQuery="{?=call F_LISTA_POLIZAS_PENDIENTES(?,?)}";

		logCall(callQuery, new String[] { "pPTOMADOR", "pPINTERMEDIARIO" },
				new Object[] { pPTOMADOR, pPINTERMEDIARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTOMADOR);
		cStmt.setObject(3, pPINTERMEDIARIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC);
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(4));
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

	// INI IAXIS-4136 JRVG 23/04/2020
	public HashMap ejecutaPAC_IAX_INFORMES__F_INS_OBS_CUENTACOBRO(String pPOBS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pMARCA) throws Exception {
		return this.callPAC_IAX_INFORMES__F_INS_OBS_CUENTACOBRO(pPOBS, pPSSEGURO, pPNRECIBO, pMARCA);
	}

	private HashMap callPAC_IAX_INFORMES__F_INS_OBS_CUENTACOBRO(String pPOBS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pMARCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.F_INS_OBS_CUENTACOBRO(?,?,?,?,?)}";
		// String callQuery="{?=call F_INS_OBS_CUENTACOBRO(?,?,?)}";

		logCall(callQuery, new String[] { "pPOBSID", "pPSSEGURO, pPNRECIBO,pMARCA " },
				new Object[] { pPOBS, pPSSEGURO, pPNRECIBO, pMARCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPOBS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRECIBO);
		cStmt.setObject(5, pMARCA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase()));
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
	}// Kaio FIN TAREA 4136
		// INI IAXIS-4136 JRVG 23/04/2020

	private HashMap callPAC_IAX_INFORMES__F_TIPO_REPORTE_PAGARE(String pNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_INFORMES.f_tipo_reporte_pagare(?)}";

		logCall(callQuery, new String[] { "pNSINIES" }, new Object[] { pNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR);
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INFORMES__F_TIPO_REPORTE_PAGARE(String pNSINIES) throws Exception {
		return this.callPAC_IAX_INFORMES__F_TIPO_REPORTE_PAGARE(pNSINIES);
	}

}
