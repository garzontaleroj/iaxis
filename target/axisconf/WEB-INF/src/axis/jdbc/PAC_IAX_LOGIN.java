//Revision:# Scvnealey5lTLLbUefjiVA== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LOGIN extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LOGIN.class);
	private Connection conn = null;

	public PAC_IAX_LOGIN(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LOGIN.F_IAX_AUTOLOGIN(PUSUARIO)
	private HashMap callPAC_IAX_LOGIN__F_IAX_AUTOLOGIN(String pPUSUARIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LOGIN.F_IAX_AUTOLOGIN(?,?,?)}";
		logCall(callQuery, new String[] { "pPUSUARIO" }, new Object[] { pPUSUARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSUARIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_USERS".toUpperCase())); // Valor de "PDATUSER"
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
			retVal.put("PDATUSER", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDATUSER", null);
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

	public HashMap ejecutaPAC_IAX_LOGIN__F_IAX_AUTOLOGIN(String pPUSUARIO) throws Exception {
		return this.callPAC_IAX_LOGIN__F_IAX_AUTOLOGIN(pPUSUARIO);
	}

	// --END-PAC_IAX_LOGIN.F_IAX_AUTOLOGIN
	// --START-PAC_IAX_LOGIN.F_IAX_LOGIN(PUSUARIO, PPWD)
	// --START-PAC_IAX_LOGIN.F_IAX_LOGIN(PUSUARIO, PPWD, REMOTEIP, PTIPCON,
	// POFICINA, PTERMINAL, PEMPRESA)
	private HashMap callPAC_IAX_LOGIN__F_IAX_LOGIN(String pPUSUARIO, String pPPWD, String pREMOTEIP, String pPTIPCON,
			java.math.BigDecimal pPOFICINA, String pPTERMINAL, java.math.BigDecimal pPEMPRESA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LOGIN.F_IAX_LOGIN(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPUSUARIO", "pPPWD", "pREMOTEIP", "pPTIPCON", "pPOFICINA", "pPTERMINAL", "pPEMPRESA" },
				new Object[] { pPUSUARIO, pPPWD, pREMOTEIP, pPTIPCON, pPOFICINA, pPTERMINAL, pPEMPRESA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSUARIO);
		cStmt.setObject(3, ConversionUtil.desencriptar(pPPWD));
		cStmt.setObject(4, pREMOTEIP);
		cStmt.setObject(5, pPTIPCON);
		cStmt.setObject(6, pPOFICINA);
		cStmt.setObject(7, pPTERMINAL);
		cStmt.setObject(8, pPEMPRESA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_USERS".toUpperCase())); // Valor de "PDATUSER"
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
			retVal.put("PDATUSER", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PDATUSER", null);
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

	public HashMap ejecutaPAC_IAX_LOGIN__F_IAX_LOGIN(String pPUSUARIO, String pPPWD, String pREMOTEIP, String pPTIPCON,
			java.math.BigDecimal pPOFICINA, String pPTERMINAL, java.math.BigDecimal pPEMPRESA) throws Exception {
		return this.callPAC_IAX_LOGIN__F_IAX_LOGIN(pPUSUARIO, pPPWD, pREMOTEIP, pPTIPCON, pPOFICINA, pPTERMINAL,
				pPEMPRESA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LOGIN.F_IAX_LOGIN

	// --START-PAC_IAX_LOGIN.P_IAX_INICONNECT(PUSUARIO, PIDIOMA, PAGENTE, PEMPRESA,
	// PUSUARIO)
	private HashMap callPAC_IAX_LOGIN__P_IAX_INICONNECT(String pPUSUARIO) throws Exception {
		String callQuery = "{call PAC_IAX_LOGIN.P_IAX_INICONNECT(?)}";
		logCall(callQuery, new String[] { "pPUSUARIO" }, new Object[] { pPUSUARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPUSUARIO);
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LOGIN__P_IAX_INICONNECT(String pPUSUARIO) throws Exception {
		return this.callPAC_IAX_LOGIN__P_IAX_INICONNECT(pPUSUARIO);
	}
	// --END-PAC_IAX_LOGIN.P_IAX_INICONNECT

	// --START-PAC_IAX_LOGIN.F_DESLOGEA(PUSER)
	private HashMap callPAC_IAX_LOGIN__F_DESLOGEA(String pPUSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_LOGIN.F_DESLOGEA(?, ?)}";

		logCall(callQuery, new String[] { "pPUSER" }, new Object[] { pPUSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
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

	public HashMap ejecutaPAC_IAX_LOGIN__F_DESLOGEA(String pPUSER) throws Exception {
		return this.callPAC_IAX_LOGIN__F_DESLOGEA(pPUSER);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LOGIN.F_DESLOGEA
	// --START-PAC_IAX_LOGIN.F_LOGEA(PUSER)
	private HashMap callPAC_IAX_LOGIN__F_LOGEA(String pPUSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_LOGIN.F_LOGEA(?, ?)}";

		logCall(callQuery, new String[] { "pPUSER" }, new Object[] { pPUSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
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

	public HashMap ejecutaPAC_IAX_LOGIN__F_LOGEA(String pPUSER) throws Exception {
		return this.callPAC_IAX_LOGIN__F_LOGEA(pPUSER);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LOGIN.F_LOGEA

	// --START-PAC_IAX_LOGIN.F_LIMITE_SESIONES()
	private HashMap callPAC_IAX_LOGIN__F_LIMITE_SESIONES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LOGIN.F_LIMITE_SESIONES(?)}";

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

	public HashMap ejecutaPAC_IAX_LOGIN__F_LIMITE_SESIONES() throws Exception {
		return this.callPAC_IAX_LOGIN__F_LIMITE_SESIONES();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LOGIN.F_LIMITE_SESIONES
}
