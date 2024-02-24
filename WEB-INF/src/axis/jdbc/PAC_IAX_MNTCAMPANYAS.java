package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MNTCAMPANYAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MNTCAMPANYAS.class);
	private Connection conn = null;

	public PAC_IAX_MNTCAMPANYAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MNTCAMPANYAS.F_GET_CAMPANYAS(PCCAMPANYA, PTCAMPANYA)
	private HashMap callPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYAS(java.math.BigDecimal pPCCAMPANYA, String pPTCAMPANYA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTCAMPANYAS.F_GET_CAMPANYAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA", "pPTCAMPANYA" }, new Object[] { pPCCAMPANYA, pPTCAMPANYA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPTCAMPANYA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CAMPANYAS".toUpperCase())); // Valor de "PCAMPANYAS"
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
			retVal.put("PCAMPANYAS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCAMPANYAS", null);
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

	public HashMap ejecutaPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYAS(java.math.BigDecimal pPCCAMPANYA, String pPTCAMPANYA)
			throws Exception {
		return this.callPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYAS(pPCCAMPANYA, pPTCAMPANYA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTCAMPANYAS.F_GET_CAMPANYAS

	// --START-PAC_IAX_MNTCAMPANYAS.F_GET_CAMPANYA(PCCAMPANYA, PTODO)
	private HashMap callPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYA(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPTODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTCAMPANYAS.F_GET_CAMPANYA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA", "pPTODO" }, new Object[] { pPCCAMPANYA, pPTODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPTODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CAMPANYAS".toUpperCase())); // Valor de "PCAMPANYA"
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
			retVal.put("PCAMPANYA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCAMPANYA", null);
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

	public HashMap ejecutaPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYA(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPTODO) throws Exception {
		return this.callPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYA(pPCCAMPANYA, pPTODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTCAMPANYAS.F_GET_CAMPANYA

	// --START-PAC_IAX_MNTCAMPANYAS.F_SET_CAMPANYAS(PCCAMPANYA, PTCAMPANYA,
	// PCIDIOMA)
	private HashMap callPAC_IAX_MNTCAMPANYAS__F_SET_CAMPANYAS(java.math.BigDecimal pPCCAMPANYA, String pPTCAMPANYA,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTCAMPANYAS.F_SET_CAMPANYAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA", "pPTCAMPANYA", "pPCIDIOMA" },
				new Object[] { pPCCAMPANYA, pPTCAMPANYA, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPTCAMPANYA);
		cStmt.setObject(4, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_MNTCAMPANYAS__F_SET_CAMPANYAS(java.math.BigDecimal pPCCAMPANYA, String pPTCAMPANYA,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_MNTCAMPANYAS__F_SET_CAMPANYAS(pPCCAMPANYA, pPTCAMPANYA, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTCAMPANYAS.F_SET_CAMPANYAS

	// --START-PAC_IAX_MNTCAMPANYAS.F_ACT_CCAMPANYA(PCCAMPANYA)
	private HashMap callPAC_IAX_MNTCAMPANYAS__F_ACT_CCAMPANYA(java.math.BigDecimal pPCCAMPANYA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTCAMPANYAS.F_ACT_CCAMPANYA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA" }, new Object[] { pPCCAMPANYA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
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

	public HashMap ejecutaPAC_IAX_MNTCAMPANYAS__F_ACT_CCAMPANYA(java.math.BigDecimal pPCCAMPANYA) throws Exception {
		return this.callPAC_IAX_MNTCAMPANYAS__F_ACT_CCAMPANYA(pPCCAMPANYA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTCAMPANYAS.F_ACT_CCAMPANYA

	// --START-PAC_IAX_MNTCAMPANYAS.F_DEL_CAMPANYA(PCCAMPANYA)
	private HashMap callPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA(java.math.BigDecimal pPCCAMPANYA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTCAMPANYAS.F_DEL_CAMPANYA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA" }, new Object[] { pPCCAMPANYA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
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

	public HashMap ejecutaPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA(java.math.BigDecimal pPCCAMPANYA) throws Exception {
		return this.callPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA(pPCCAMPANYA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTCAMPANYAS.F_DEL_CAMPANYA
	// --START-PAC_IAX_MNTCAMPANYAS.F_DEL_CAMPANYA_LIN(PCCAMPANYA, PCIDIOMA)
	private HashMap callPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA_LIN(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTCAMPANYAS.F_DEL_CAMPANYA_LIN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA", "pPCIDIOMA" }, new Object[] { pPCCAMPANYA, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA_LIN(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA_LIN(pPCCAMPANYA, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTCAMPANYAS.F_DEL_CAMPANYA_LIN

}
