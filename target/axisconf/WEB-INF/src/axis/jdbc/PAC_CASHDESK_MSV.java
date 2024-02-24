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
public class PAC_CASHDESK_MSV extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_CASHDESK_MSV.class);
	private Connection conn = null;

	public PAC_CASHDESK_MSV(Connection conn) {
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
	private HashMap callPAC_IAX_CASHDESK_MSV__GET_SEQ_CAJA() throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK_MSV.GET_SEQ_CAJA(?)}";
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

	public HashMap ejecutaPAC_IAX_CASHDESK_MSV__GET_SEQ_CAJA() throws Exception {
		return this.callPAC_IAX_CASHDESK_MSV__GET_SEQ_CAJA();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CASHDESK_MSV.GET_SEQ_CAJA
	/***********************************************
	 * SAVE_TEMPO METHOD - JBENITEZ
	 *******************************************/
//--START-PAC_IAX_CASHDESK_MSV.SAVE_TEMPO(TSTEMPO,  TOTAL,  TPOLICY,  TPREMIUM,  TID)
	private HashMap callPAC_IAX_CASHDESK_MSV__SAVE_TEMPO(java.math.BigDecimal pTSTEMPO, String pTOTAL, String pTPOLICY,
			String pTPREMIUM, String pTID) throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK_MSV.SAVE_TEMPO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pTSTEMPO", "pTOTAL", "pTPOLICY", "pTPREMIUM", "pTID" },
				new Object[] { pTSTEMPO, pTOTAL, pTPOLICY, pTPREMIUM, pTID });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pTSTEMPO);
		cStmt.setObject(3, pTOTAL);
		cStmt.setObject(4, pTPOLICY);
		cStmt.setObject(5, pTPREMIUM);
		cStmt.setObject(6, pTID);
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

	public HashMap ejecutaPAC_IAX_CASHDESK_MSV__SAVE_TEMPO(java.math.BigDecimal pTSTEMPO, String pTOTAL,
			String pTPOLICY, String pTPREMIUM, String pTID) throws Exception {
		return this.callPAC_IAX_CASHDESK_MSV__SAVE_TEMPO(pTSTEMPO, pTOTAL, pTPOLICY, pTPREMIUM, pTID);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CASHDESK_MSV.SAVE_TEMPO
	/***********************************************
	 * SAVE_TEMPO METHOD - JBENITEZ
	 *******************************************/
//--START-PAC_IAX_CASHDESK_MSV.DEL_TEMPO(TSTEMPO,  TID)
	private HashMap callPAC_IAX_CASHDESK_MSV__DEL_TEMPO(java.math.BigDecimal pTSTEMPO, String pTID) throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK_MSV.DEL_TEMPO(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_CASHDESK_MSV__DEL_TEMPO(java.math.BigDecimal pTSTEMPO, String pTID) throws Exception {
		return this.callPAC_IAX_CASHDESK_MSV__DEL_TEMPO(pTSTEMPO, pTID);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK_MSV.DEL_TEMPO

	// --START-PAC_IAX_CASHDESK_MSV.DO_TRANSACTION(PAYERID, CURRENCY, PAYREASON,
	// AMOPAY, DATEREC, PAYMET, BNAME, OBANK, ACCONUM, CHNUM, CHTYPE, CLIMOP,
	// PAYTEXT, TID)
	private HashMap callPAC_IAX_CASHDESK_MSV__DO_TRANSACTION(String pPAYERID, String pCURRENCY, String pPAYREASON,
			String pAMOPAY, String pDATEREC, String pPAYMET, String pBNAME, String pOBANK, String pACCONUM,
			String pCHNUM, String pCHTYPE, String pCLIMOP, String pPAYTEXT, String pTID) throws Exception {
		String callQuery = "{?=call PAC_IAX_CASHDESK_MSV.DO_TRANSACTION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPAYERID", "pCURRENCY", "pPAYREASON", "pAMOPAY", "pDATEREC", "pPAYMET", "pBNAME",
						"pOBANK", "pACCONUM", "pCHNUM", "pCHTYPE", "pCLIMOP", "pPAYTEXT", "pTID" },
				new Object[] { pPAYERID, pCURRENCY, pPAYREASON, pAMOPAY, pDATEREC, pPAYMET, pBNAME, pOBANK, pACCONUM,
						pCHNUM, pCHTYPE, pCLIMOP, pPAYTEXT, pTID });
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

	public HashMap ejecutaPAC_IAX_CASHDESK_MSV__DO_TRANSACTION(String pPAYERID, String pCURRENCY, String pPAYREASON,
			String pAMOPAY, String pDATEREC, String pPAYMET, String pBNAME, String pOBANK, String pACCONUM,
			String pCHNUM, String pCHTYPE, String pCLIMOP, String pPAYTEXT, String pTID) throws Exception {
		return this.callPAC_IAX_CASHDESK_MSV__DO_TRANSACTION(pPAYERID, pCURRENCY, pPAYREASON, pAMOPAY, pDATEREC,
				pPAYMET, pBNAME, pOBANK, pACCONUM, pCHNUM, pCHTYPE, pCLIMOP, pPAYTEXT, pTID);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CASHDESK_MSV.DO_TRANSACTION

}