package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MENU extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COMMON.class);
	private Connection conn = null;

	public PAC_IAX_MENU(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MENU.F_GET_MENU(PCIDIOMA)
	private HashMap callPAC_IAX_MENU__F_GET_MENU(java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MENU.F_GET_MENU(?,?)}";
		logCall(callQuery, new String[] { "pPCIDIOMA" }, new Object[] { pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_MENU__F_GET_MENU(java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_MENU__F_GET_MENU(pPCIDIOMA);
	}
	// --END-PAC_IAX_MENU.F_GET_MENU

	// --START-PAC_IAX_MENU.F_GET_MODULOS_MENU()
	private HashMap callPAC_IAX_MENU__F_GET_MODULOS_MENU() throws Exception {
		String callQuery = "{?=call PAC_IAX_MENU.F_GET_MODULOS_MENU(?)}";

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

	public HashMap ejecutaPAC_IAX_MENU__F_GET_MODULOS_MENU() throws Exception {
		return this.callPAC_IAX_MENU__F_GET_MODULOS_MENU();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MENU.F_GET_MODULOS_MENU

	// --START-PAC_IAX_MENU.F_GET_URLFORMS(PCFORM)
	private HashMap callPAC_IAX_MENU__F_GET_URLFORMS(String pPCFORM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MENU.F_GET_URLFORMS(?,?)}";
		logCall(callQuery, new String[] { "pPCFORM" }, new Object[] { pPCFORM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCFORM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MENU__F_GET_URLFORMS(String pPCFORM) throws Exception {
		return this.callPAC_IAX_MENU__F_GET_URLFORMS(pPCFORM);
	}
	// --END-PAC_IAX_MENU.F_GET_URLFORMS

	// --START-PAC_IAX_MENU.F_GET_URL(PCMENU)
	private HashMap callPAC_IAX_MENU__F_GET_URL(java.math.BigDecimal pPCMENU) throws Exception {
		String callQuery = "{?=call PAC_IAX_MENU.F_GET_URL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMENU" }, new Object[] { pPCMENU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMENU);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNVISTA"
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
			retVal.put("PNVISTA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNVISTA", null);
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

	public HashMap ejecutaPAC_IAX_MENU__F_GET_URL(java.math.BigDecimal pPCMENU) throws Exception {
		return this.callPAC_IAX_MENU__F_GET_URL(pPCMENU);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MENU.F_GET_URL

	// --START-PAC_IAX_MENU.F_GET_URLADF(PCFORM)
	private HashMap callPAC_IAX_MENU__F_GET_URLADF(String pPCFORM) throws Exception {
		String callQuery = "{?=call PAC_IAX_MENU.F_GET_URLADF(?, ?)}";

		logCall(callQuery, new String[] { "pPCFORM" }, new Object[] { pPCFORM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCFORM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MENU__F_GET_URLADF(String pPCFORM) throws Exception {
		return this.callPAC_IAX_MENU__F_GET_URLADF(pPCFORM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MENU.F_GET_URLADF

	// --START-PAC_IAX_MENU.F_GET_TOKEN()
	private HashMap callPAC_IAX_MENU__F_GET_TOKEN() throws Exception {
		String callQuery = "{?=call PAC_IAX_MENU.F_GET_TOKEN(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MENU__F_GET_TOKEN() throws Exception {
		return this.callPAC_IAX_MENU__F_GET_TOKEN();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MENU.F_GET_TOKEN

}
