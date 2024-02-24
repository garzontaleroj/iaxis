package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

//WLS-Ready 

public class PAC_IAX_LISTVALORES_COA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES_COA.class);
	private Connection conn = null;

	public PAC_IAX_LISTVALORES_COA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LISTVALORES_COA.F_GET_TIPCOASEGURO()

	private HashMap callPAC_IAX_LISTVALORES_COA__F_GET_TIPCOASEGURO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_CATRIBU, java.math.BigDecimal pP_CVALOR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_COA.F_GET_TIPCOASEGURO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pP_SPRODUC", "pP_CATRIBU", "pP_CVALOR" },
				new Object[] { pPCEMPRES, pP_SPRODUC, pP_CATRIBU, pP_CVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pP_SPRODUC);
		cStmt.setObject(4, pP_CATRIBU);
		cStmt.setObject(5, pP_CVALOR);
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
			retVal.put("MENSAJES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPCOASEGURO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pP_CVALOR, java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_CATRIBU)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_COA__F_GET_TIPCOASEGURO(pPCEMPRES, pP_CVALOR, pP_SPRODUC, pP_CATRIBU); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_COA.F_GET_TIPCOASEGURO
	// --START-PAC_IAX_LISTVALORES_COA.F_GET_TIPO_MOVCTA()

	private HashMap callPAC_IAX_LISTVALORES_COA__F_GET_TIPO_MOVCTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_COA.F_GET_TIPO_MOVCTA(?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPO_MOVCTA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_COA__F_GET_TIPO_MOVCTA(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_COA.F_GET_TIPO_MOVCTA

	// --START-PAC_IAX_LISTVALORES_COA.F_GET_TIPO_IMPORTE()

	/*
	 * private HashMap
	 * callPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE(java.math.BigDecimal
	 * pPCEMPRES) throws Exception { String
	 * callQuery="{?=call PAC_IAX_LISTVALORES_COA.F_GET_TIPO_IMPORTE(?, ?)}";
	 * 
	 * logCall(callQuery, new String[] { }, new Object[] { });
	 * 
	 * // logCall(callQuery, new String[] {"pPCEMPRES"}, new Object[] {pPCEMPRES });
	 * 
	 * CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase();
	 * cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de
	 * "RETURN" //cStmt.setObject(2, pPCEMPRES); cStmt.registerOutParameter(2,
	 * oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" //
	 * cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(2)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } retVal=new ConversionUtil().convertOracleObjects(retVal);
	 * //AXIS-WLS1SERVER-Ready cStmt.close(); //AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap
	 * ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE(java.math.BigDecimal
	 * pPCEMPRES) throws Exception { return
	 * this.callPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE(pPCEMPRES);
	 * //AXIS-WLS1SERVER-Ready } //--END-PAC_IAX_LISTVALORES_COA.F_GET_TIPO_IMPORTE
	 */

	// --START-PAC_IAX_LISTVALORES_COA.F_GET_TIPO_IMPORTE(PCEMPRES)
	private HashMap callPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_COA.F_GET_TIPO_IMPORTE(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_COA.F_GET_TIPO_IMPORTE

}
