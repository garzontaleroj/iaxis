package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_IMPAGA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_IMPAGA.class);
	private Connection conn = null;

	public PAC_IAX_IMPAGA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_IMPAGA.F_ELIMINA_DETPRODREPREC(PSIDPRODP, PCMOTIVO,
	// PNIMPAGAD)
	private HashMap callPAC_IAX_IMPAGA__F_ELIMINA_DETPRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPNIMPAGAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_ELIMINA_DETPRODREPREC(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSIDPRODP", "pPCMOTIVO", "pPNIMPAGAD" },
				new Object[] { pPSIDPRODP, pPCMOTIVO, pPNIMPAGAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDPRODP);
		cStmt.setObject(3, pPCMOTIVO);
		cStmt.setObject(4, pPNIMPAGAD);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_ELIMINA_DETPRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPNIMPAGAD) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_ELIMINA_DETPRODREPREC(pPSIDPRODP, pPCMOTIVO, pPNIMPAGAD);
	}

	// --END-PAC_IAX_IMPAGA.F_ELIMINA_DETPRODREPREC
	// --START-PAC_IAX_IMPAGA.F_ELIMINA_IMPAGADO(PSSEGURO, PNRECIBO, PFACCION)
	private HashMap callPAC_IAX_IMPAGA__F_ELIMINA_IMPAGADO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFACCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_ELIMINA_IMPAGADO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRECIBO", "pPFACCION" },
				new Object[] { pPSSEGURO, pPNRECIBO, pPFACCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPFACCION);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_ELIMINA_IMPAGADO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFACCION) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_ELIMINA_IMPAGADO(pPSSEGURO, pPNRECIBO, pPFACCION);
	}

	// --END-PAC_IAX_IMPAGA.F_ELIMINA_IMPAGADO
	// --START-PAC_IAX_IMPAGA.F_ELIMINA_PRODREPREC(PSIDPRODP)
	private HashMap callPAC_IAX_IMPAGA__F_ELIMINA_PRODREPREC(java.math.BigDecimal pPSIDPRODP) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_ELIMINA_PRODREPREC(?, ?)}";

		logCall(callQuery, new String[] { "pPSIDPRODP" }, new Object[] { pPSIDPRODP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDPRODP);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_ELIMINA_PRODREPREC(java.math.BigDecimal pPSIDPRODP) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_ELIMINA_PRODREPREC(pPSIDPRODP);
	}

	// --END-PAC_IAX_IMPAGA.F_ELIMINA_PRODREPREC
	// --START-PAC_IAX_IMPAGA.F_GET_DETIMPAGADO(PSSEGURO, PNRECIBO, PFACCION)
	private HashMap callPAC_IAX_IMPAGA__F_GET_DETIMPAGADO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFACCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_GET_DETIMPAGADO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRECIBO", "pPFACCION" },
				new Object[] { pPSSEGURO, pPNRECIBO, pPFACCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPFACCION);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_GET_DETIMPAGADO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFACCION) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_GET_DETIMPAGADO(pPSSEGURO, pPNRECIBO, pPFACCION);
	}

	// --END-PAC_IAX_IMPAGA.F_GET_DETIMPAGADO
	// --START-PAC_IAX_IMPAGA.F_GET_DETPRODREPREC(PSIDPRODP, PCMOTIVO, PNIMPAGAD)
	private HashMap callPAC_IAX_IMPAGA__F_GET_DETPRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPNIMPAGAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_GET_DETPRODREPREC(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSIDPRODP", "pPCMOTIVO", "pPNIMPAGAD" },
				new Object[] { pPSIDPRODP, pPCMOTIVO, pPNIMPAGAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDPRODP);
		cStmt.setObject(3, pPCMOTIVO);
		cStmt.setObject(4, pPNIMPAGAD);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_GET_DETPRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPNIMPAGAD) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_GET_DETPRODREPREC(pPSIDPRODP, pPCMOTIVO, pPNIMPAGAD);
	}
	// --END-PAC_IAX_IMPAGA.F_GET_DETPRODREPREC

	// --START-PAC_IAX_IMPAGA.F_GET_IMPAGADOS(PSSEGURO, PCRAMO, PSPRODUC, PCTIPREC,
	// PFACCINI, PFACCFIN, PNPOLIZA, PNCERTIF, PNRECIBO, PNIMPAGAD, PCOFICINA,
	// PCAGENTE, PCMOTIVO, PCCARTA, PCACTIMP)
	private HashMap callPAC_IAX_IMPAGA__F_GET_IMPAGADOS(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCTIPREC, java.sql.Date pPFACCINI,
			java.sql.Date pPFACCFIN, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNIMPAGAD, java.math.BigDecimal pPCOFICINA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCCARTA,
			java.math.BigDecimal pPCACTIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_GET_IMPAGADOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPCRAMO", "pPSPRODUC", "pPCTIPREC", "pPFACCINI", "pPFACCFIN", "pPNPOLIZA",
						"pPNCERTIF", "pPNRECIBO", "pPNIMPAGAD", "pPCOFICINA", "pPCAGENTE", "pPCMOTIVO", "pPCCARTA",
						"pPCACTIMP" },
				new Object[] { pPSSEGURO, pPCRAMO, pPSPRODUC, pPCTIPREC, pPFACCINI, pPFACCFIN, pPNPOLIZA, pPNCERTIF,
						pPNRECIBO, pPNIMPAGAD, pPCOFICINA, pPCAGENTE, pPCMOTIVO, pPCCARTA, pPCACTIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCTIPREC);
		cStmt.setObject(6, pPFACCINI);
		cStmt.setObject(7, pPFACCFIN);
		cStmt.setObject(8, pPNPOLIZA);
		cStmt.setObject(9, pPNCERTIF);
		cStmt.setObject(10, pPNRECIBO);
		cStmt.setObject(11, pPNIMPAGAD);
		cStmt.setObject(12, pPCOFICINA);
		cStmt.setObject(13, pPCAGENTE);
		cStmt.setObject(14, pPCMOTIVO);
		cStmt.setObject(15, pPCCARTA);
		cStmt.setObject(16, pPCACTIMP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURSOR"
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
			retVal.put("PCURSOR", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("PCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_GET_IMPAGADOS(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCTIPREC, java.sql.Date pPFACCINI,
			java.sql.Date pPFACCFIN, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNIMPAGAD, java.math.BigDecimal pPCOFICINA,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCCARTA,
			java.math.BigDecimal pPCACTIMP) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_GET_IMPAGADOS(pPSSEGURO, pPCRAMO, pPSPRODUC, pPCTIPREC, pPFACCINI, pPFACCFIN,
				pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPNIMPAGAD, pPCOFICINA, pPCAGENTE, pPCMOTIVO, pPCCARTA, pPCACTIMP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPAGA.F_GET_IMPAGADOS

	// --START-PAC_IAX_IMPAGA.F_GET_PRODREPREC(PSIDPRODP, PSPRODUC, PCTIPOIMP,
	// PCAGENTE)
	private HashMap callPAC_IAX_IMPAGA__F_GET_PRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCTIPOIMP, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_GET_PRODREPREC(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSIDPRODP", "pPSPRODUC", "pPCTIPOIMP", "pPCAGENTE" },
				new Object[] { pPSIDPRODP, pPSPRODUC, pPCTIPOIMP, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDPRODP);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCTIPOIMP);
		cStmt.setObject(5, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_GET_PRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCTIPOIMP, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		return this.callPAC_IAX_IMPAGA__F_GET_PRODREPREC(pPSIDPRODP, pPSPRODUC, pPCTIPOIMP, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPAGA.F_GET_PRODREPREC

	// --START-PAC_IAX_IMPAGA.F_SET_DETPRODREPREC(PSIDPRODP, PCMOTIVO, PCMODIMM,
	// PCACTIMM, PCDIAAVIS, PCMODELO, PCACTIMP, PNDIAAVIS, PNIMPAGAD, PMODO)
	private HashMap callPAC_IAX_IMPAGA__F_SET_DETPRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCMODIMM, java.math.BigDecimal pPCACTIMM,
			java.math.BigDecimal pPCDIAAVIS, java.math.BigDecimal pPCMODELO, java.math.BigDecimal pPCACTIMP,
			java.math.BigDecimal pPNDIAAVIS, java.math.BigDecimal pPNIMPAGAD, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_SET_DETPRODREPREC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSIDPRODP", "pPCMOTIVO", "pPCMODIMM", "pPCACTIMM", "pPCDIAAVIS", "pPCMODELO",
						"pPCACTIMP", "pPNDIAAVIS", "pPNIMPAGAD", "pPMODO" },
				new Object[] { pPSIDPRODP, pPCMOTIVO, pPCMODIMM, pPCACTIMM, pPCDIAAVIS, pPCMODELO, pPCACTIMP,
						pPNDIAAVIS, pPNIMPAGAD, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDPRODP);
		cStmt.setObject(3, pPCMOTIVO);
		cStmt.setObject(4, pPCMODIMM);
		cStmt.setObject(5, pPCACTIMM);
		cStmt.setObject(6, pPCDIAAVIS);
		cStmt.setObject(7, pPCMODELO);
		cStmt.setObject(8, pPCACTIMP);
		cStmt.setObject(9, pPNDIAAVIS);
		cStmt.setObject(10, pPNIMPAGAD);
		cStmt.setObject(11, pPMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_IMPAGA__F_SET_DETPRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCMODIMM, java.math.BigDecimal pPCACTIMM,
			java.math.BigDecimal pPCDIAAVIS, java.math.BigDecimal pPCMODELO, java.math.BigDecimal pPCACTIMP,
			java.math.BigDecimal pPNDIAAVIS, java.math.BigDecimal pPNIMPAGAD, String pPMODO) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_SET_DETPRODREPREC(pPSIDPRODP, pPCMOTIVO, pPCMODIMM, pPCACTIMM, pPCDIAAVIS,
				pPCMODELO, pPCACTIMP, pPNDIAAVIS, pPNIMPAGAD, pPMODO);
	}
	// --END-PAC_IAX_IMPAGA.F_SET_DETPRODREPREC

	// --START-PAC_IAX_IMPAGA.F_SET_IMPAGADO(PSSEGURO, PNRECIBO, PFACCION, PFALTA,
	// PCMOTDEV, PCACCION, PCSITUAC, PTTEXTO, PTERROR)
	private HashMap callPAC_IAX_IMPAGA__F_SET_IMPAGADO(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.sql.Date pPFACCION, java.sql.Date pPFALTA, java.math.BigDecimal pPCMOTDEV,
			java.math.BigDecimal pPCACCION, java.math.BigDecimal pPCSITUAC, String pPTTEXTO, String pPTERROR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_SET_IMPAGADO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRECIBO", "pPFACCION", "pPFALTA", "pPCMOTDEV", "pPCACCION", "pPCSITUAC",
						"pPTTEXTO", "pPTERROR" },
				new Object[] { pPSSEGURO, pPNRECIBO, pPFACCION, pPFALTA, pPCMOTDEV, pPCACCION, pPCSITUAC, pPTTEXTO,
						pPTERROR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPFACCION);
		cStmt.setObject(5, pPFALTA);
		cStmt.setObject(6, pPCMOTDEV);
		cStmt.setObject(7, pPCACCION);
		cStmt.setObject(8, pPCSITUAC);
		cStmt.setObject(9, pPTTEXTO);
		cStmt.setObject(10, pPTERROR);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_SET_IMPAGADO(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.sql.Date pPFACCION, java.sql.Date pPFALTA, java.math.BigDecimal pPCMOTDEV,
			java.math.BigDecimal pPCACCION, java.math.BigDecimal pPCSITUAC, String pPTTEXTO, String pPTERROR)
			throws Exception {
		return this.callPAC_IAX_IMPAGA__F_SET_IMPAGADO(pPSSEGURO, pPNRECIBO, pPFACCION, pPFALTA, pPCMOTDEV, pPCACCION,
				pPCSITUAC, pPTTEXTO, pPTERROR);
	}

	// --END-PAC_IAX_IMPAGA.F_SET_IMPAGADO
	// --START-PAC_IAX_IMPAGA.F_SET_PRODREPREC(PSIDPRODP, PSPRODUC, PFINIEFE,
	// PCTIPOIMP, PCTIPNIMP, PCAGENTE)
	private HashMap callPAC_IAX_IMPAGA__F_SET_PRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPSPRODUC, java.sql.Date pPFINIEFE, java.math.BigDecimal pPCTIPOIMP,
			java.math.BigDecimal pPCTIPNIMP, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_SET_PRODREPREC(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSIDPRODP", "pPSPRODUC", "pPFINIEFE", "pPCTIPOIMP", "pPCTIPNIMP", "pPCAGENTE" },
				new Object[] { pPSIDPRODP, pPSPRODUC, pPFINIEFE, pPCTIPOIMP, pPCTIPNIMP, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSIDPRODP);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPFINIEFE);
		cStmt.setObject(5, pPCTIPOIMP);
		cStmt.setObject(6, pPCTIPNIMP);
		cStmt.setObject(7, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_SET_PRODREPREC(java.math.BigDecimal pPSIDPRODP,
			java.math.BigDecimal pPSPRODUC, java.sql.Date pPFINIEFE, java.math.BigDecimal pPCTIPOIMP,
			java.math.BigDecimal pPCTIPNIMP, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_SET_PRODREPREC(pPSIDPRODP, pPSPRODUC, pPFINIEFE, pPCTIPOIMP, pPCTIPNIMP,
				pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPAGA.F_SET_PRODREPREC

	// --START-PAC_IAX_IMPAGA.F_GET_LSTCARTAS()
	private HashMap callPAC_IAX_IMPAGA__F_GET_LSTCARTAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_GET_LSTCARTAS(?)}";

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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_GET_LSTCARTAS() throws Exception {
		return this.callPAC_IAX_IMPAGA__F_GET_LSTCARTAS();
	}
	// --END-PAC_IAX_IMPAGA.F_GET_LSTCARTAS

	// --START-PAC_IAX_IMPAGA.F_SET_ACCCARTA(PSSEGURO, PNRECIBO, PCACTIMP, PFFEJECU,
	// PCACTACT, PCCARTA)
	private HashMap callPAC_IAX_IMPAGA__F_SET_ACCCARTA(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCACTIMP, java.sql.Date pPFFEJECU, java.math.BigDecimal pPCACTACT,
			java.math.BigDecimal pPCCARTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPAGA.F_SET_ACCCARTA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRECIBO", "pPCACTIMP", "pPFFEJECU", "pPCACTACT", "pPCCARTA" },
				new Object[] { pPSSEGURO, pPNRECIBO, pPCACTIMP, pPFFEJECU, pPCACTACT, pPCCARTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPCACTIMP);
		cStmt.setObject(5, pPFFEJECU);
		cStmt.setObject(6, pPCACTACT);
		cStmt.setObject(7, pPCCARTA);
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

	public HashMap ejecutaPAC_IAX_IMPAGA__F_SET_ACCCARTA(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCACTIMP, java.sql.Date pPFFEJECU, java.math.BigDecimal pPCACTACT,
			java.math.BigDecimal pPCCARTA) throws Exception {
		return this.callPAC_IAX_IMPAGA__F_SET_ACCCARTA(pPSSEGURO, pPNRECIBO, pPCACTIMP, pPFFEJECU, pPCACTACT, pPCCARTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPAGA.F_SET_ACCCARTA

}
