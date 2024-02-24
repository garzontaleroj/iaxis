/*********************************************************************************************************************/
/***********************************************JBENITEZ - APRIL 2015 - BUG 33886/199826******************************/
/*********************************************************************************************************************/
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/***********************************************IMPORTING PACKAGES*******************************************/
import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

/***********************************************
 * CLASS DEFINITION
 *******************************************/
public class PAC_IAX_CASHDESK extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CASHDESK.class);
	private Connection conn = null;

	public PAC_IAX_CASHDESK(Connection conn) {
		this.conn = conn;
	}

	/***************************************************************************************************************/
	/***********************************************
	 * STARTING FUNCTIONS
	 *******************************************/
	/***************************************************************************************************************/
	/***********************************************
	 * GET_SEQ_CAJA METHOD - JBENITEZ
	 *******************************************/
//--START-PAC_IAX_CASHDESK_MSV.GET_SEQ_CAJA()
	private HashMap callPAC_IAX_CASHDESK__GET_SEQ_CAJA() throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK.GET_SEQ_CAJA(?)}";
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

	public HashMap ejecutaPAC_IAX_CASHDESK__GET_SEQ_CAJA() throws Exception {
		return this.callPAC_IAX_CASHDESK__GET_SEQ_CAJA();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CASHDESK.GET_SEQ_CAJA
	/***********************************************
	 * SAVE_TEMPO METHOD - JBENITEZ
	 *******************************************/
	// --START-PAC_IAX_CASHDESK.F_INS_CASHDESKTMP(TSTEMPO, TOTAL, TPOLICY, TPREMIUM,
	// TID, TSPERSON)
	private HashMap callPAC_IAX_CASHDESK__F_INS_CASHDESKTMP(java.math.BigDecimal pTSTEMPO, java.math.BigDecimal pTOTAL,
			String pTPOLICY, java.math.BigDecimal pTPREMIUM, String pTID, java.math.BigDecimal pTSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK.F_INS_CASHDESKTMP(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pTSTEMPO", "pTOTAL", "pTPOLICY", "pTPREMIUM", "pTID", "pTSPERSON" },
				new Object[] { pTSTEMPO, pTOTAL, pTPOLICY, pTPREMIUM, pTID, pTSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pTSTEMPO);
		cStmt.setObject(3, pTOTAL);
		cStmt.setObject(4, pTPOLICY);
		cStmt.setObject(5, pTPREMIUM);
		cStmt.setObject(6, pTID);
		cStmt.setObject(7, pTSPERSON);
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

	public HashMap ejecutaPAC_IAX_CASHDESK__F_INS_CASHDESKTMP(java.math.BigDecimal pTSTEMPO,
			java.math.BigDecimal pTOTAL, String pTPOLICY, java.math.BigDecimal pTPREMIUM, String pTID,
			java.math.BigDecimal pTSPERSON) throws Exception {
		return this.callPAC_IAX_CASHDESK__F_INS_CASHDESKTMP(pTSTEMPO, pTOTAL, pTPOLICY, pTPREMIUM, pTID, pTSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK.F_INS_CASHDESKTMP

	/***********************************************
	 * SAVE_TEMPO METHOD - JBENITEZ
	 *******************************************/
//--START-PAC_IAX_CASHDESK.DEL_TEMPO(TSTEMPO,  TID)
	private HashMap callPAC_IAX_CASHDESK__F_DEL_CASHDESKTMP(java.math.BigDecimal pTSTEMPO, String pTID)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK.F_DEL_CASHDESKTMP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pTSTEMPO", "pTID" }, new Object[] { pTSTEMPO, pTID });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pTSTEMPO);
		cStmt.setObject(3, pTID);
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

	public HashMap ejecutaPAC_IAX_CASHDESK__F_DEL_CASHDESKTMP(java.math.BigDecimal pTSTEMPO, String pTID)
			throws Exception {
		return this.callPAC_IAX_CASHDESK__F_DEL_CASHDESKTMP(pTSTEMPO, pTID);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK_MSV.DEL_TEMPO

	// --START-PAC_IAX_CASHDESK.F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON,
	// AMOPAY, DATEREC, PAYMET, BNAME, OBANK, ACCONUM, CHNUM, CHTYPE, CLIMOP,
	// PAYTEXT, TID, PTDESCCHK)
	private HashMap callPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(String pPAYERID, String pCURRENCY, String pPAYREASON,
			java.math.BigDecimal pAMOPAY, String pDATEREC, String pPAYMET, String pBNAME, String pOBANK,
			String pACCONUM, String pCHNUM, String pCHTYPE, String pCLIMOP, String pPAYTEXT, String pTID,
			String pPTDESCCHK) throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK.F_APUNTE_PAGO_SPL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPAYERID", "pCURRENCY", "pPAYREASON", "pAMOPAY", "pDATEREC", "pPAYMET", "pBNAME",
						"pOBANK", "pACCONUM", "pCHNUM", "pCHTYPE", "pCLIMOP", "pPAYTEXT", "pTID", "pPTDESCCHK" },
				new Object[] { pPAYERID, pCURRENCY, pPAYREASON, pAMOPAY, pDATEREC, pPAYMET, pBNAME, pOBANK, pACCONUM,
						pCHNUM, pCHTYPE, pCLIMOP, pPAYTEXT, pTID, pPTDESCCHK });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPAYERID);
		cStmt.setObject(3, pCURRENCY);
		cStmt.setObject(4, pPAYREASON);
		cStmt.setObject(5, pAMOPAY);
		cStmt.setObject(6, pDATEREC);
		cStmt.setObject(7, pPAYMET);
		cStmt.setObject(8, pBNAME);
		cStmt.setObject(9, pOBANK);
		cStmt.setObject(10, pACCONUM);
		cStmt.setObject(11, pCHNUM);
		cStmt.setObject(12, pCHTYPE);
		cStmt.setObject(13, pCLIMOP);
		cStmt.setObject(14, pPAYTEXT);
		cStmt.setObject(15, pTID);
		cStmt.setObject(16, pPTDESCCHK);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(String pPAYERID, String pCURRENCY, String pPAYREASON,
			java.math.BigDecimal pAMOPAY, String pDATEREC, String pPAYMET, String pBNAME, String pOBANK,
			String pACCONUM, String pCHNUM, String pCHTYPE, String pCLIMOP, String pPAYTEXT, String pTID,
			String pPTDESCCHK) throws Exception {
		return this.callPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(pPAYERID, pCURRENCY, pPAYREASON, pAMOPAY, pDATEREC, pPAYMET,
				pBNAME, pOBANK, pACCONUM, pCHNUM, pCHTYPE, pCLIMOP, pPAYTEXT, pTID, pPTDESCCHK);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK.DO_TRANSACTION

	// --START-PAC_IAX_CASHDESK.F_LEEPAGOS_SIN_POLIZA(P_SPERSON)
	private HashMap callPAC_IAX_CASHDESK__F_LEEPAGOS_SIN_POLIZA(java.math.BigDecimal pP_SPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK.F_LEEPAGOS_SIN_POLIZA(?, ?)}";

		logCall(callQuery, new String[] { "pP_SPERSON" }, new Object[] { pP_SPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPERSON);
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

	public HashMap ejecutaPAC_IAX_CASHDESK__F_LEEPAGOS_SIN_POLIZA(java.math.BigDecimal pP_SPERSON) throws Exception {
		return this.callPAC_IAX_CASHDESK__F_LEEPAGOS_SIN_POLIZA(pP_SPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK.F_LEEPAGOS_SIN_POLIZA

	// --START-PAC_IAX_CASHDESK.F_EJECUTA_SIN_POLIZA(P_SPERSON, P_CURRENCY,
	// P_PAYREASON, P_MONTO, P_DATEREC, P_PAYMET, P_BNAME, P_OBANK, P_CHDRTYPE,
	// P_CHNUM, P_CHTYPE, P_CLIMOP, P_PAYTEXT, P_SEQ)
	private HashMap callPAC_IAX_CASHDESK__F_EJECUTA_SIN_POLIZA(java.math.BigDecimal pP_SPERSON, String pP_CURRENCY,
			String pP_PAYREASON, java.math.BigDecimal pP_MONTO, String pP_DATEREC, String pP_PAYMET, String pP_BNAME,
			String pP_OBANK, String pP_CHDRTYPE, String pP_CHNUM, String pP_CHTYPE, String pP_CLIMOP, String pP_PAYTEXT,
			java.math.BigDecimal pP_SEQ) throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK.F_EJECUTA_SIN_POLIZA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SPERSON", "pP_CURRENCY", "pP_PAYREASON", "pP_MONTO", "pP_DATEREC", "pP_PAYMET",
						"pP_BNAME", "pP_OBANK", "pP_CHDRTYPE", "pP_CHNUM", "pP_CHTYPE", "pP_CLIMOP", "pP_PAYTEXT",
						"pP_SEQ" },
				new Object[] { pP_SPERSON, pP_CURRENCY, pP_PAYREASON, pP_MONTO, pP_DATEREC, pP_PAYMET, pP_BNAME,
						pP_OBANK, pP_CHDRTYPE, pP_CHNUM, pP_CHTYPE, pP_CLIMOP, pP_PAYTEXT, pP_SEQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPERSON);
		cStmt.setObject(3, pP_CURRENCY);
		cStmt.setObject(4, pP_PAYREASON);
		cStmt.setObject(5, pP_MONTO);
		cStmt.setObject(6, pP_DATEREC);
		cStmt.setObject(7, pP_PAYMET);
		cStmt.setObject(8, pP_BNAME);
		cStmt.setObject(9, pP_OBANK);
		cStmt.setObject(10, pP_CHDRTYPE);
		cStmt.setObject(11, pP_CHNUM);
		cStmt.setObject(12, pP_CHTYPE);
		cStmt.setObject(13, pP_CLIMOP);
		cStmt.setObject(14, pP_PAYTEXT);
		cStmt.setObject(15, pP_SEQ);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CASHDESK__F_EJECUTA_SIN_POLIZA(java.math.BigDecimal pP_SPERSON, String pP_CURRENCY,
			String pP_PAYREASON, java.math.BigDecimal pP_MONTO, String pP_DATEREC, String pP_PAYMET, String pP_BNAME,
			String pP_OBANK, String pP_CHDRTYPE, String pP_CHNUM, String pP_CHTYPE, String pP_CLIMOP, String pP_PAYTEXT,
			java.math.BigDecimal pP_SEQ) throws Exception {
		return this.callPAC_IAX_CASHDESK__F_EJECUTA_SIN_POLIZA(pP_SPERSON, pP_CURRENCY, pP_PAYREASON, pP_MONTO,
				pP_DATEREC, pP_PAYMET, pP_BNAME, pP_OBANK, pP_CHDRTYPE, pP_CHNUM, pP_CHTYPE, pP_CLIMOP, pP_PAYTEXT,
				pP_SEQ);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK.F_EJECUTA_SIN_POLIZA

	// --START-PAC_IAX_CASHDESK.F_GET_DATOSPAGO(PSEQCAJA, PNUMLIN)
	private HashMap callPAC_IAX_CASHDESK__F_GET_DATOSPAGO(java.math.BigDecimal pPSEQCAJA, java.math.BigDecimal pPNUMLIN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK.F_GET_DATOSPAGO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSEQCAJA", "pPNUMLIN" }, new Object[] { pPSEQCAJA, pPNUMLIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSEQCAJA);
		cStmt.setObject(3, pPNUMLIN);
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

	public HashMap ejecutaPAC_IAX_CASHDESK__F_GET_DATOSPAGO(java.math.BigDecimal pPSEQCAJA,
			java.math.BigDecimal pPNUMLIN) throws Exception {
		return this.callPAC_IAX_CASHDESK__F_GET_DATOSPAGO(pPSEQCAJA, pPNUMLIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK.F_GET_DATOSPAGO

}