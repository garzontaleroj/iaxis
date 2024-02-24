//Revision:# WtArgLkSbseum4yv8Rb3aA== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LISTVALORES_SIN extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES_SIN.class);
	private Connection conn = null;

	public PAC_IAX_LISTVALORES_SIN(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_CAUSASINI(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_CAUSASINI(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_CAUSASINI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI, pSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pSSEGURO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CAUSASINI(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pSSEGURO) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_CAUSASINI(pPSPRODUC, pPCACTIVI, pSSEGURO);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_CAUSASINI

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCAUIND(PCTIPPAG)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCAUIND(java.math.BigDecimal pPCTIPPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCAUIND(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPAG" }, new Object[] { pPCTIPPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPAG);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCAUIND(java.math.BigDecimal pPCTIPPAG) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCAUIND(pPCTIPPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCAUIND

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCESTSIN()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCESTSIN() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCESTSIN(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCESTSIN() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCESTSIN();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCESTSIN
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCINFORM()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCINFORM() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCINFORM(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCINFORM() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCINFORM();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCINFORM
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCONPAG(PSPRODUC)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCONPAG(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG(pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCONPAG

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCSUBTRA()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCSUBTRA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCSUBTRA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCSUBTRA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCSUBTRA();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCSUBTRA
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCULPAB()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCULPAB() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCULPAB(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCULPAB() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCULPAB();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCULPAB
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTAGE()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTAGE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTAGE(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTAGE() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTAGE();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTAGE
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTPER()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTPER() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTPER(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTPER() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTPER();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTPER
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTVAL()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTVAL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTVAL(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTVAL() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTVAL();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCESTVAL
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCFORPAG()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCFORPAG() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCFORPAG(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCFORPAG() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCFORPAG();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCFORPAG
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCINFORM()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCINFORM() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCINFORM(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCINFORM() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCINFORM();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCINFORM
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMANUAL()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMANUAL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMANUAL(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMANUAL() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMANUAL();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMANUAL
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMEDDEC()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMEDDEC() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMEDDEC(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMEDDEC() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMEDDEC();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMEDDEC
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMONDA()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMONDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMONDA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMONDA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMONDA();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCMONDA
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCRECLAMA()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCRECLAMA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCRECLAMA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCRECLAMA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCRECLAMA();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCRECLAMA
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCSIGLAS()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCSIGLAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCSIGLAS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCSIGLAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCSIGLAS();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCSIGLAS
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTCAUSIN()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTCAUSIN() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTCAUSIN(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTCAUSIN() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTCAUSIN();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTCAUSIN
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPBAN()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPBAN() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPBAN(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPBAN() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPBAN();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPBAN
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPDES()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPDES(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDES() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDES();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPDES
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPPAG()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPPAG() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPPAG(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPPAG() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPPAG();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPPAG
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPREG()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPREG() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPREG(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPREG() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPREG();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPREG
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPRES()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPRES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPRES(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPRES() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPRES();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPRES
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTRAMIT()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTRAMIT() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTRAMIT(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTRAMIT() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTRAMIT();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTRAMIT
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_MOTIVOSSINI(PSPRODUC, PCCAUSA,
	// PCACTIVI)

	// -- Bug 0012822 - 09/02/2010 - JMF: Afegir paràmetre seguro.
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_MOTIVOSSINI(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCAUSA, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_MOTIVOSSINI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCCAUSA", "pPCACTIVI", "pPSSEGURO" },
				new Object[] { pPSPRODUC, pPCCAUSA, pPCACTIVI, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCCAUSA);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPSSEGURO);
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
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_MOTIVOSSINI(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCCAUSA, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_MOTIVOSSINI(pPSPRODUC, pPCCAUSA, pPCACTIVI, pPSSEGURO);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_MOTIVOSSINI

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_TCOMPANIA()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_TCOMPANIA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_TCOMPANIA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_TCOMPANIA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_TCOMPANIA();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_TCOMPANIA
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_TIPTRAMI(PSSEGURO, PCACTIVI, PCCAUSIN,
	// PMOTSIN, PSPRODUC, PMODO, PCTRAMTE, PCESTSIN, PNSINIES)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_TIPTRAMI(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPMOTSIN,
			java.math.BigDecimal pPSPRODUC, String pPMODO, java.math.BigDecimal pPCTRAMTE,
			java.math.BigDecimal pPCESTSIN, java.math.BigDecimal pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_TIPTRAMI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPCACTIVI", "pPCCAUSIN", "pPMOTSIN", "pPSPRODUC", "pPMODO", "pPCTRAMTE",
						"pPCESTSIN" },
				new Object[] { pPSSEGURO, pPCACTIVI, pPCCAUSIN, pPMOTSIN, pPSPRODUC, pPMODO, pPCTRAMTE, pPCESTSIN,
						pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCCAUSIN);
		cStmt.setObject(5, pPMOTSIN);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPMODO);
		cStmt.setObject(8, pPCTRAMTE);
		cStmt.setObject(9, pPCESTSIN);
		cStmt.setObject(10, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_TIPTRAMI(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPMOTSIN,
			java.math.BigDecimal pPSPRODUC, String pPMODO, java.math.BigDecimal pPCTRAMTE,
			java.math.BigDecimal pPCESTSIN, java.math.BigDecimal pPNSINIES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_TIPTRAMI(pPSSEGURO, pPCACTIVI, pPCCAUSIN, pPMOTSIN, pPSPRODUC,
				pPMODO, pPCTRAMTE, pPCESTSIN, pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_TIPTRAMI

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPDEC()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDEC() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPDEC(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDEC() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDEC();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCTIPDEC

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCACTPROF()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCACTPROF() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCACTPROF(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCACTPROF() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCACTPROF();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCACTPROF

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_CTRAMITAD(PCEMPRES, PCTRAMITPAD)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(java.math.BigDecimal pPCEMPRES, String pPCTRAMITPAD)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_CTRAMITAD(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTRAMITPAD" }, new Object[] { pPCEMPRES, pPCTRAMITPAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTRAMITPAD);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(java.math.BigDecimal pPCEMPRES, String pPCTRAMITPAD)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(pPCEMPRES, pPCTRAMITPAD);
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_CTRAMITAD
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_CUNITRA(PCEMPRES)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_CUNITRA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(pPCEMPRES);
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_CUNITRA
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPROFESIONALES()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPROFESIONALES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTPROFESIONALES(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPROFESIONALES() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPROFESIONALES();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPROFESIONALES
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTACTIVIPRODSIN(PCRAMO, PCMODALI,
	// PCTIPSEG, PCCOLECT)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTACTIVIPRODSIN(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTACTIVIPRODSIN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTACTIVIPRODSIN(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTACTIVIPRODSIN(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT);
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTACTIVIPRODSIN
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCASSIN_CODMOTCAU()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCASSIN_CODMOTCAU() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCASSIN_CODMOTCAU(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCASSIN_CODMOTCAU() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCASSIN_CODMOTCAU();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCASSIN_CODMOTCAU
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTSIN_CODMOTCAU(PCCAUSIN)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU(java.math.BigDecimal pPCCAUSIN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTSIN_CODMOTCAU(?, ?)}";

		logCall(callQuery, new String[] { "pPCCAUSIN" }, new Object[] { pPCCAUSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAUSIN);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU(java.math.BigDecimal pPCCAUSIN)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU(pPCCAUSIN);
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTSIN_CODMOTCAU
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPDESTINATARIO()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPDESTINATARIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPDESTINATARIO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPDESTINATARIO() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPDESTINATARIO();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPDESTINATARIO
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPRODUCTOSSIN()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPRODUCTOSSIN() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTPRODUCTOSSIN(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPRODUCTOSSIN() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPRODUCTOSSIN();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPRODUCTOSSIN
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTACTIVIPRODSIN(PSPRODUC)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTACTIVIPRODSIN(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTACTIVIPRODSIN(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTACTIVIPRODSIN(java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTACTIVIPRODSIN(pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTACTIVIPRODSIN

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTGARANSIN(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANSIN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTGARANSIN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANSIN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANSIN(pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTGARANSIN

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTRAMISIN(PSPRODUC, PCACTIVI,
	// PCGARANT)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMISIN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTTRAMISIN(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMISIN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMISIN(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTRAMISIN

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTELEMENTO()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTELEMENTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTELEMENTO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTELEMENTO() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTELEMENTO();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTELEMENTO
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTFORMULA()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTFORMULA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTFORMULA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTFORMULA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTFORMULA();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTFORMULA

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCODCTASEGURO()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCODCTASEGURO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCODCTASEGURO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCODCTASEGURO() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCODCTASEGURO();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCODCTASEGURO
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTMOVI()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTMOVI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTMOVI(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTMOVI() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTMOVI();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTMOVI

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMODFISCALES()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMODFISCALES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTMODFISCALES(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMODFISCALES() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMODFISCALES();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMODFISCALES

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADO(PCESTSIN)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADO(java.math.BigDecimal pPCESTSIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADO(?, ?)}";

		logCall(callQuery, new String[] { "pPCESTSIN" }, new Object[] { pPCESTSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESTSIN);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADO(java.math.BigDecimal pPCESTSIN) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADO(pPCESTSIN);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADO

	// -- bug 0021196
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOTRA(PCESTSIN)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRA(java.math.BigDecimal pPCESTSIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOTRA(?, ?)}";

		logCall(callQuery, new String[] { "pPCESTSIN" }, new Object[] { pPCESTSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESTSIN);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRA(java.math.BigDecimal pPCESTSIN) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRA(pPCESTSIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOTRA

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCAUSAS()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCAUSAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCAUSAS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCAUSAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCAUSAS();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCAUSAS
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCDOCUME()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCDOCUME() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCDOCUME(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCDOCUME() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCDOCUME();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCDO

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTTRA(PCESTTRA)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTTRA(java.math.BigDecimal pPCESTTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTTRA(?, ?)}";

		logCall(callQuery, new String[] { "pPCESTTRA" }, new Object[] { pPCESTTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESTTRA);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTTRA(java.math.BigDecimal pPCESTTRA) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTTRA(pPCESTTRA);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTTRA

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTEVENTOS()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTEVENTOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTEVENTOS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTEVENTOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTEVENTOS();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTEVENTOS

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LISTTIPDES(PSPRODUC, PCACTIVI,
	// PCTRAMIT, PCCAUSIN, PCMOTSIN)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LISTTIPDES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LISTTIPDES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCTRAMIT", "pPCCAUSIN", "pPCMOTSIN", "pSSEGURO" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCTRAMIT, pPCCAUSIN, pPCMOTSIN, pSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCTRAMIT);
		cStmt.setObject(5, pPCCAUSIN);
		cStmt.setObject(6, pPCMOTSIN);
		cStmt.setObject(7, pSSEGURO);
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
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LISTTIPDES(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCTRAMIT, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pSSEGURO) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LISTTIPDES(pPSPRODUC, pPCACTIVI, pPCTRAMIT, pPCCAUSIN, pPCMOTSIN,
				pSSEGURO);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LISTTIPDES

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSCTESTMOV(PESTVALANT, PESTPAGANT,
	// PESTVAL)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(java.math.BigDecimal pPESTVALANT,
			java.math.BigDecimal pPESTPAGANT, java.math.BigDecimal pPESTVAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSCTESTMOV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPESTVALANT", "pPESTPAGANT", "pPESTVAL" },
				new Object[] { pPESTVALANT, pPESTPAGANT, pPESTVAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPESTVALANT);
		cStmt.setObject(3, pPESTPAGANT);
		cStmt.setObject(4, pPESTVAL);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(java.math.BigDecimal pPESTVALANT,
			java.math.BigDecimal pPESTPAGANT, java.math.BigDecimal pPESTVAL) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(pPESTVALANT, pPESTPAGANT, pPESTVAL);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSCTESTMOV

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTDURPREST()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTDURPREST() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTDURPREST(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTDURPREST() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTDURPREST();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTDURPREST
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOPREST()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOPREST() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOPREST(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOPREST() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOPREST();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOPREST
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTNIVELSINI()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTNIVELSINI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTNIVELSINI(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTNIVELSINI() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTNIVELSINI();
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTNIVELSINI

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPCAP(PNSINIES)
	// -- Bug 0017970 - 16/03/2011 - JMF
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPCAP(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPCAP(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPCAP(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPCAP(pPNSINIES);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPCAP

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPRELASE()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPRELASE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPRELASE(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPRELASE() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPRELASE();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTIPRELASE
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTPAGOSPREST()
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTPAGOSPREST() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTPAGOSPREST(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTPAGOSPREST() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTPAGOSPREST();
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTPAGOSPREST
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPERSONASCAUS(PSSEGURO, PCCAUSIN,
	// PCMOTSIN, PCNIVEL)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPERSONASCAUS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCNIVEL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTPERSONASCAUS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCCAUSIN", "pPCMOTSIN", "pPCNIVEL" },
				new Object[] { pPSSEGURO, pPCCAUSIN, pPCMOTSIN, pPCNIVEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCCAUSIN);
		cStmt.setObject(4, pPCMOTSIN);
		cStmt.setObject(5, pPCNIVEL);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPERSONASCAUS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCNIVEL)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPERSONASCAUS(pPSSEGURO, pPCCAUSIN, pPCMOTSIN, pPCNIVEL);
	}

	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPERSONASCAUS

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTRESC(PSSEGURO, PCCAUSIN)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTRESC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCAUSIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTRESC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCCAUSIN" }, new Object[] { pPSSEGURO, pPCCAUSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCCAUSIN);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTRESC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCAUSIN) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTRESC(pPSSEGURO, pPCCAUSIN);
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTMOTRESC

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCONPAG_DEP(PCTIPPAG, PSPRODUC)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG_DEP(java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCONPAG_DEP(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPAG", "pPSPRODUC" }, new Object[] { pPCTIPPAG, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPAG);
		cStmt.setObject(3, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG_DEP(java.math.BigDecimal pPCTIPPAG,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG_DEP(pPCTIPPAG, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTCCONPAG_DEP

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOTRAMITE(PCESTADO)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRAMITE(java.math.BigDecimal pPCESTADO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOTRAMITE(?, ?)}";

		logCall(callQuery, new String[] { "pPCESTADO" }, new Object[] { pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCESTADO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRAMITE(java.math.BigDecimal pPCESTADO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRAMITE(pPCESTADO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTESTADOTRAMITE

	// ini bug 0023536
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTSUBTIPTRA(PCEMPRES, PCTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTSUBTIPTRA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTSUBTIPTRA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCTRAMIT" }, new Object[] { pPCEMPRES, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCTRAMIT);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTSUBTIPTRA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTSUBTIPTRA(pPCEMPRES, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTSUBTIPTRA

	// Bug 27766
	// --START-PAC_IAX_SINIESTROS.F_GET_LISPIGNORADOS(PSSEGURO)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LISPIGNORADOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LISPIGNORADOS(?,?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
		// cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
		// UsuarioBean.fixOwner(USERNAME, "T_IAX_ASEGURADOS".toUpperCase())); // Valor
		// de "RETURN"
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LISPIGNORADOS(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LISPIGNORADOS(pPSSEGURO);
	}
	// --END-PAC_IAX_SINIESTROS.F_GET_ASEGURADOS

	// --START-PAC_IAX_SINIESTROS.F_GET_BENEFICIARIOS_NOMINALES(PSSEGURO)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_BENEFICIARIOS_NOMINALES(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pfsinies) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_BENEFICIARIOS_NOMINALES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pfsinies" }, new Object[] { pPSSEGURO, pfsinies });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pfsinies);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
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
			retVal.put("MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_BENEFICIARIOS_NOMINALES(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pfsinies) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_BENEFICIARIOS_NOMINALES(pPSSEGURO, pfsinies);
	}

	// --END-PAC_IAX_SINIESTROS.F_GET_ASEGURADOS
	// Fin Bug 27766
	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_ASEGINNOMINADO(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_ASEGINNOMINADO(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_ASEGINNOMINADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_ASEGINNOMINADO(String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_ASEGINNOMINADO(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_ASEGINNOMINADO

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTGARANTIAS_CAP(PSSEGURO)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANTIAS_CAP(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTGARANTIAS_CAP(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANTIAS_CAP(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANTIAS_CAP(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTGARANTIAS_CAP

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_PROCESOS_TRAMITADOR(PCTRAMITAD, PCTIPO,
	// PCTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_PROCESOS_TRAMITADOR(String pPCTRAMITAD,
			java.math.BigDecimal pPCTIPO, String pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_PROCESOS_TRAMITADOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTRAMITAD", "pPCTIPO", "pPCTRAMIT" },
				new Object[] { pPCTRAMITAD, pPCTIPO, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTRAMITAD);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCTRAMIT);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_PROCESOS_TRAMITADOR(String pPCTRAMITAD,
			java.math.BigDecimal pPCTIPO, String pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_PROCESOS_TRAMITADOR(pPCTRAMITAD, pPCTIPO, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_PROCESOS_TRAMITADOR

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTSOLDOC(PNSINIES)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTSOLDOC(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTSOLDOC(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTSOLDOC(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTSOLDOC(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTSOLDOC

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTRAMIT(PNSINIES)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMIT(String pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTTRAMIT(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMIT(String pPNSINIES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMIT(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTTRAMIT

	// --START-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPAGOS(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPAGOS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTPAGOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPAGOS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTPAGOS(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_SIN.F_GET_LSTPAGOS

	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCONTINGENCIA() throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCONTINGENCIA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCONTINGENCIA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCONTINGENCIA();
	}

	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTRIESGOS() throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTRIESGOS(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTRIESGOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTRIESGOS();
	}

	private HashMap callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCLASEPROCESO() throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.F_GET_LSTCLASEPROCESO(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCLASEPROCESO() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__F_GET_LSTCLASEPROCESO();
	}

	private HashMap callPAC_IAX_LISTVALORES_SIN__f_get_lstinstanciaproceso() throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.f_get_lstinstanciaproceso(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstinstanciaproceso() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__f_get_lstinstanciaproceso();
	}

	private HashMap callPAC_IAX_LISTVALORES_SIN__f_get_lstcontingenciafallo() throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.f_get_lstcontingenciafallo(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstcontingenciafallo() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__f_get_lstcontingenciafallo();
	}

	private HashMap callPAC_IAX_LISTVALORES_SIN__f_get_lstcalifmotivo() throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.f_get_lstcalifmotivo(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstcalifmotivo() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__f_get_lstcalifmotivo();
	}

	private HashMap callPAC_IAX_LISTVALORES_SIN__f_get_lstoralproceso() throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES_SIN.f_get_lstoralproceso(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstoralproceso() throws Exception {
		return this.callPAC_IAX_LISTVALORES_SIN__f_get_lstoralproceso();
	}

}
