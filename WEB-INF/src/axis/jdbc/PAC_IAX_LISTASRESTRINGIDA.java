//Revision:# gjq/crChkgjpxWGHUak3bg== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LISTASRESTRINGIDA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENDA.class);
	private Connection conn = null;

	public PAC_IAX_LISTASRESTRINGIDA(Connection conn) {
		this.conn = conn;
	}
	/*
	 * //--START-PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA(PCTIPPER,
	 * PCTIPIDE, PNNUMIDE, PTNOMAPE, PCCLALIS, PCTIPLIS, PFINCLUSDESDE,
	 * PFINCLUSHASTA, PFEXCLUSDESDE, PFEXCLUSHASTA, PSPERLRE, PFNACIMI, PTDESCRIP)
	 * private HashMap callPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA
	 * (java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String
	 * pPNNUMIDE, String pPTNOMAPE, java.math.BigDecimal pPCCLALIS,
	 * java.math.BigDecimal pPCTIPLIS, java.sql.Date pPFINCLUSDESDE, java.sql.Date
	 * pPFINCLUSHASTA, java.sql.Date pPFEXCLUSDESDE, java.sql.Date pPFEXCLUSHASTA,
	 * java.math.BigDecimal pPSPERLRE, java.sql.Date pPFNACIMI, String pTDESCRIP)
	 * throws Exception { String
	 * callQuery="{?=call PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?)}"
	 * ;
	 * 
	 * logCall(callQuery, new String[] {"pPCTIPPER", "pPCTIPIDE", "pPNNUMIDE",
	 * "pPTNOMAPE", "pPCCLALIS", "pPCTIPLIS", "pPFINCLUSDESDE", "pPFINCLUSHASTA",
	 * "pPFEXCLUSDESDE", "pPFEXCLUSHASTA", "pPSPERLRE", "pPFNACIMI","pTDESCRIP"},
	 * new Object[] {pPCTIPPER, pPCTIPIDE, pPNNUMIDE, pPTNOMAPE, pPCCLALIS,
	 * pPCTIPLIS, pPFINCLUSDESDE, pPFINCLUSHASTA, pPFEXCLUSDESDE, pPFEXCLUSHASTA,
	 * pPSPERLRE, pPFNACIMI, pTDESCRIP}); CallableStatement
	 * cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPCTIPPER); cStmt.setObject(3, pPCTIPIDE); cStmt.setObject(4, pPNNUMIDE);
	 * cStmt.setObject(5, pPTNOMAPE); cStmt.setObject(6, pPCCLALIS);
	 * cStmt.setObject(7, pPCTIPLIS); cStmt.setObject(8, pPFINCLUSDESDE);
	 * cStmt.setObject(9, pPFINCLUSHASTA); cStmt.setObject(10, pPFEXCLUSDESDE);
	 * cStmt.setObject(11, pPFEXCLUSHASTA); cStmt.setObject(12, pPSPERLRE);
	 * cStmt.setObject(13, pPFNACIMI); cStmt.setObject(14, pTDESCRIP);
	 * cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de
	 * "RETURN" cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(14)); } catch (SQLException e) { retVal.put("MENSAJES",
	 * null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA
	 * (java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String
	 * pPNNUMIDE, String pPTNOMAPE, java.math.BigDecimal pPCCLALIS,
	 * java.math.BigDecimal pPCTIPLIS, java.sql.Date pPFINCLUSDESDE, java.sql.Date
	 * pPFINCLUSHASTA, java.sql.Date pPFEXCLUSDESDE, java.sql.Date pPFEXCLUSHASTA,
	 * java.math.BigDecimal pPSPERLRE, java.sql.Date pPFNACIMI, String pTDESCRIP)
	 * throws Exception { return
	 * this.callPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA(pPCTIPPER,
	 * pPCTIPIDE, pPNNUMIDE, pPTNOMAPE, pPCCLALIS, pPCTIPLIS, pPFINCLUSDESDE,
	 * pPFINCLUSHASTA, pPFEXCLUSDESDE, pPFEXCLUSHASTA, pPSPERLRE, pPFNACIMI,
	 * pTDESCRIP);//AXIS-WLS1SERVER-Ready }
	 * //--END-PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA
	 */

//--START-PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA(PCTIPPER,  PCTIPIDE,  PNNUMIDE,  PTNOMAPE,  PCCLALIS,  PCTIPLIS,  PFINCLUSDESDE,  PFINCLUSHASTA,  PFEXCLUSDESDE,  PFEXCLUSHASTA,  PSPERLRE,  PFNACIMI,  PTDESCRIP)
	private HashMap callPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA(java.math.BigDecimal pPCTIPPER,
			java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, String pPTNOMAPE, java.math.BigDecimal pPCCLALIS,
			java.math.BigDecimal pPCTIPLIS, java.sql.Date pPFINCLUSDESDE, java.sql.Date pPFINCLUSHASTA,
			java.sql.Date pPFEXCLUSDESDE, java.sql.Date pPFEXCLUSHASTA, java.math.BigDecimal pPSPERLRE,
			java.sql.Date pPFNACIMI, String pPTDESCRIP) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPPER", "pPCTIPIDE", "pPNNUMIDE", "pPTNOMAPE", "pPCCLALIS", "pPCTIPLIS",
						"pPFINCLUSDESDE", "pPFINCLUSHASTA", "pPFEXCLUSDESDE", "pPFEXCLUSHASTA", "pPSPERLRE",
						"pPFNACIMI", "pPTDESCRIP" },
				new Object[] { pPCTIPPER, pPCTIPIDE, pPNNUMIDE, pPTNOMAPE, pPCCLALIS, pPCTIPLIS, pPFINCLUSDESDE,
						pPFINCLUSHASTA, pPFEXCLUSDESDE, pPFEXCLUSHASTA, pPSPERLRE, pPFNACIMI, pPTDESCRIP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPER);
		cStmt.setObject(3, pPCTIPIDE);
		cStmt.setObject(4, pPNNUMIDE);
		cStmt.setObject(5, pPTNOMAPE);
		cStmt.setObject(6, pPCCLALIS);
		cStmt.setObject(7, pPCTIPLIS);
		cStmt.setObject(8, pPFINCLUSDESDE);
		cStmt.setObject(9, pPFINCLUSHASTA);
		cStmt.setObject(10, pPFEXCLUSDESDE);
		cStmt.setObject(11, pPFEXCLUSHASTA);
		cStmt.setObject(12, pPSPERLRE);
		cStmt.setObject(13, pPFNACIMI);
		cStmt.setObject(14, pPTDESCRIP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA(java.math.BigDecimal pPCTIPPER,
			java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, String pPTNOMAPE, java.math.BigDecimal pPCCLALIS,
			java.math.BigDecimal pPCTIPLIS, java.sql.Date pPFINCLUSDESDE, java.sql.Date pPFINCLUSHASTA,
			java.sql.Date pPFEXCLUSDESDE, java.sql.Date pPFEXCLUSHASTA, java.math.BigDecimal pPSPERLRE,
			java.sql.Date pPFNACIMI, String pPTDESCRIP) throws Exception {
		return this.callPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA(pPCTIPPER, pPCTIPIDE, pPNNUMIDE, pPTNOMAPE,
				pPCCLALIS, pPCTIPLIS, pPFINCLUSDESDE, pPFINCLUSHASTA, pPFEXCLUSDESDE, pPFEXCLUSHASTA, pPSPERLRE,
				pPFNACIMI, pPTDESCRIP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA

//javendano CONF 239
	// --START-PAC_IAX_LISTASRESTRINGIDA.F_SET_LISTARESTRINGIDA(PSPERSON, PCCLALIS,
	// PCTIPLIS, PCNOTIFI, PSPERLRE, PFEXCLUS, PFINCLUS, PCINCLUS, PFNACIMI,
	// PTDESCRIP, PTOBSERV, PTMOTEXC)
	private HashMap callPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCCLALIS, java.math.BigDecimal pPCTIPLIS, java.math.BigDecimal pPCNOTIFI,
			java.math.BigDecimal pPSPERLRE, java.sql.Date pPFEXCLUS, java.sql.Date pPFINCLUS,
			java.math.BigDecimal pPCINCLUS, java.sql.Date pPFNACIMI, String pPTDESCRIP, String pPTOBSERV,
			String pPTMOTEXC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTASRESTRINGIDA.F_SET_LISTARESTRINGIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCCLALIS", "pPCTIPLIS", "pPCNOTIFI", "pPSPERLRE", "pPFEXCLUS",
						"pPFINCLUS", "pPCINCLUS", "pPFNACIMI", "pPTDESCRIP", "pPTOBSERV", "pPTMOTEXC" },
				new Object[] { pPSPERSON, pPCCLALIS, pPCTIPLIS, pPCNOTIFI, pPSPERLRE, pPFEXCLUS, pPFINCLUS, pPCINCLUS,
						pPFNACIMI, pPTDESCRIP, pPTOBSERV, pPTMOTEXC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCCLALIS);
		cStmt.setObject(4, pPCTIPLIS);
		cStmt.setObject(5, pPCNOTIFI);
		cStmt.setObject(6, pPSPERLRE);
		cStmt.setObject(7, pPFEXCLUS);
		cStmt.setObject(8, pPFINCLUS);
		cStmt.setObject(9, pPCINCLUS);
		cStmt.setObject(10, pPFNACIMI);
		cStmt.setObject(11, pPTDESCRIP);
		cStmt.setObject(12, pPTOBSERV);
		cStmt.setObject(13, pPTMOTEXC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PSPERLRE_OUT"
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
			retVal.put("PSPERLRE_OUT", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PSPERLRE_OUT", null);
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

	public HashMap ejecutaPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCCLALIS, java.math.BigDecimal pPCTIPLIS, java.math.BigDecimal pPCNOTIFI,
			java.math.BigDecimal pPSPERLRE, java.sql.Date pPFEXCLUS, java.sql.Date pPFINCLUS,
			java.math.BigDecimal pPCINCLUS, java.sql.Date pPFNACIMI, String pPTDESCRIP, String pPTOBSERV,
			String pPTMOTEXC) throws Exception {
		return this.callPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA(pPSPERSON, pPCCLALIS, pPCTIPLIS, pPCNOTIFI,
				pPSPERLRE, pPFEXCLUS, pPFINCLUS, pPCINCLUS, pPFNACIMI, pPTDESCRIP, pPTOBSERV, pPTMOTEXC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTASRESTRINGIDA.F_SET_LISTARESTRINGIDA

	// JAVENDANO CONF 239

	// --START-PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA_AUT(PCMATRIC,
	// PCODMOTOR, PCCHASIS, PNBASTID, PCCLALIS, PCTIPLIS, PFINCLUSDESDE,
	// PFINCLUSHASTA, PFEXCLUSDESDE, PFEXCLUSHASTA, PSMATRICLRE)
	private HashMap callPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA_AUT(String pPCMATRIC, String pPCODMOTOR,
			String pPCCHASIS, String pPNBASTID, java.math.BigDecimal pPCCLALIS, java.math.BigDecimal pPCTIPLIS,
			java.sql.Date pPFINCLUSDESDE, java.sql.Date pPFINCLUSHASTA, java.sql.Date pPFEXCLUSDESDE,
			java.sql.Date pPFEXCLUSHASTA, java.math.BigDecimal pPSMATRICLRE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA_AUT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMATRIC", "pPCODMOTOR", "pPCCHASIS", "pPNBASTID", "pPCCLALIS", "pPCTIPLIS",
						"pPFINCLUSDESDE", "pPFINCLUSHASTA", "pPFEXCLUSDESDE", "pPFEXCLUSHASTA", "pPSMATRICLRE" },
				new Object[] { pPCMATRIC, pPCODMOTOR, pPCCHASIS, pPNBASTID, pPCCLALIS, pPCTIPLIS, pPFINCLUSDESDE,
						pPFINCLUSHASTA, pPFEXCLUSDESDE, pPFEXCLUSHASTA, pPSMATRICLRE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMATRIC);
		cStmt.setObject(3, pPCODMOTOR);
		cStmt.setObject(4, pPCCHASIS);
		cStmt.setObject(5, pPNBASTID);
		cStmt.setObject(6, pPCCLALIS);
		cStmt.setObject(7, pPCTIPLIS);
		cStmt.setObject(8, pPFINCLUSDESDE);
		cStmt.setObject(9, pPFINCLUSHASTA);
		cStmt.setObject(10, pPFEXCLUSDESDE);
		cStmt.setObject(11, pPFEXCLUSHASTA);
		cStmt.setObject(12, pPSMATRICLRE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA_AUT(String pPCMATRIC, String pPCODMOTOR,
			String pPCCHASIS, String pPNBASTID, java.math.BigDecimal pPCCLALIS, java.math.BigDecimal pPCTIPLIS,
			java.sql.Date pPFINCLUSDESDE, java.sql.Date pPFINCLUSHASTA, java.sql.Date pPFEXCLUSDESDE,
			java.sql.Date pPFEXCLUSHASTA, java.math.BigDecimal pPSMATRICLRE) throws Exception {
		return this.callPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA_AUT(pPCMATRIC, pPCODMOTOR, pPCCHASIS,
				pPNBASTID, pPCCLALIS, pPCTIPLIS, pPFINCLUSDESDE, pPFINCLUSHASTA, pPFEXCLUSDESDE, pPFEXCLUSHASTA,
				pPSMATRICLRE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTASRESTRINGIDA.F_GET_LISTARESTRINGIDA_AUT

	// --START-PAC_IAX_LISTASRESTRINGIDA.F_SET_LISTARESTRINGIDA_AUT(PSMATRIC,
	// PCODMOTOR, PCCHASIS, PNBASTID, PCCLALIS, PCTIPLIS, PCNOTIFI, PSMATRICLRE,
	// PFEXCLUS, PFINCLUS, PCINCLUS)
	private HashMap callPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA_AUT(String pPSMATRIC, String pPCODMOTOR,
			String pPCCHASIS, String pPNBASTID, java.math.BigDecimal pPCCLALIS, java.math.BigDecimal pPCTIPLIS,
			java.math.BigDecimal pPCNOTIFI, java.math.BigDecimal pPSMATRICLRE, java.sql.Date pPFEXCLUS,
			java.sql.Date pPFINCLUS, java.math.BigDecimal pPCINCLUS) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTASRESTRINGIDA.F_SET_LISTARESTRINGIDA_AUT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSMATRIC", "pPCODMOTOR", "pPCCHASIS", "pPNBASTID", "pPCCLALIS", "pPCTIPLIS",
						"pPCNOTIFI", "pPSMATRICLRE", "pPFEXCLUS", "pPFINCLUS", "pPCINCLUS" },
				new Object[] { pPSMATRIC, pPCODMOTOR, pPCCHASIS, pPNBASTID, pPCCLALIS, pPCTIPLIS, pPCNOTIFI,
						pPSMATRICLRE, pPFEXCLUS, pPFINCLUS, pPCINCLUS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSMATRIC);
		cStmt.setObject(3, pPCODMOTOR);
		cStmt.setObject(4, pPCCHASIS);
		cStmt.setObject(5, pPNBASTID);
		cStmt.setObject(6, pPCCLALIS);
		cStmt.setObject(7, pPCTIPLIS);
		cStmt.setObject(8, pPCNOTIFI);
		cStmt.setObject(9, pPSMATRICLRE);
		cStmt.setObject(10, pPFEXCLUS);
		cStmt.setObject(11, pPFINCLUS);
		cStmt.setObject(12, pPCINCLUS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de "PSMATRICLRE_OUT"
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
			retVal.put("PSMATRICLRE_OUT", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PSMATRICLRE_OUT", null);
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

	public HashMap ejecutaPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA_AUT(String pPSMATRIC, String pPCODMOTOR,
			String pPCCHASIS, String pPNBASTID, java.math.BigDecimal pPCCLALIS, java.math.BigDecimal pPCTIPLIS,
			java.math.BigDecimal pPCNOTIFI, java.math.BigDecimal pPSMATRICLRE, java.sql.Date pPFEXCLUS,
			java.sql.Date pPFINCLUS, java.math.BigDecimal pPCINCLUS) throws Exception {
		return this.callPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA_AUT(pPSMATRIC, pPCODMOTOR, pPCCHASIS,
				pPNBASTID, pPCCLALIS, pPCTIPLIS, pPCNOTIFI, pPSMATRICLRE, pPFEXCLUS, pPFINCLUS, pPCINCLUS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTASRESTRINGIDA.F_SET_LISTARESTRINGIDA_AUT

	/* JAVENDANO CONF 239 */
	// --START-PAC_IAX_LISTASRESTRINGIDA.F_GET_HISTORICO_PERSONA(PNNUMIDE)
	private HashMap callPAC_IAX_LISTASRESTRINGIDA__F_GET_HISTORICO_PERSONA(String pPNNUMIDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTASRESTRINGIDA.F_GET_HISTORICO_PERSONA(?, ?)}";

		logCall(callQuery, new String[] { "pPNNUMIDE" }, new Object[] { pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMIDE);
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

	public HashMap ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_HISTORICO_PERSONA(String pPNNUMIDE) throws Exception {
		return this.callPAC_IAX_LISTASRESTRINGIDA__F_GET_HISTORICO_PERSONA(pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTASRESTRINGIDA.F_GET_HISTORICO_PERSONA

}
