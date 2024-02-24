package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LISTVALORES_AUT extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES_AUT.class);
	private Connection conn = null;

	public PAC_IAX_LISTVALORES_AUT(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH_PORMARCA(PCMARCA, PCTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(String pPCMARCA,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH_PORMARCA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMARCA", "pPCTRAMIT" }, new Object[] { pPCMARCA, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(String pPCMARCA,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(pPCMARCA, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH_PORMARCA

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCACTIVI(PSPRODUC)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCACTIVI(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCACTIVI(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCACTIVI(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCACTIVI(pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCACTIVI

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCMARCA()
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCMARCA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCMARCA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCMARCA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCMARCA();
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCMARCA

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMARCAS(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTMARCAS(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMARCAS

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMARCAS()
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTMARCAS(?,?)}";

		logCall(callQuery, new String[] { "pPCTRAMIT" }, new Object[] { pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTRAMIT);
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
			retVal.put("MENSAJES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(pPCTRAMIT);
	}

	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMARCAS
	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCMODELO(PCMARCA)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCMODELO(String pPCMARCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCMODELO(?, ?)}";

		logCall(callQuery, new String[] { "pPCMARCA" }, new Object[] { pPCMARCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCMODELO(String pPCMARCA) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCMODELO(pPCMARCA);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCMODELO

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMODELOS(PCTIPVEH, PCCLAVEH,
	// P_CMARCA, PCTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(String pPCTIPVEH, String pPCCLAVEH, String pP_CMARCA,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTMODELOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPVEH", "pPCCLAVEH", "pP_CMARCA", "pPCTRAMIT" },
				new Object[] { pPCTIPVEH, pPCCLAVEH, pP_CMARCA, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPVEH);
		cStmt.setObject(3, pPCCLAVEH);
		cStmt.setObject(4, pP_CMARCA);
		cStmt.setObject(5, pPCTRAMIT);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(String pPCTIPVEH, String pPCCLAVEH,
			String pP_CMARCA, java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(pPCTIPVEH, pPCCLAVEH, pP_CMARCA, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMODELOS

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCPAISMAT()
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCPAISMAT() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCPAISMAT(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCPAISMAT() throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCPAISMAT();
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCPAISMAT

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTNUMPUERTAS(P_CMARCA, P_CMODELO)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTNUMPUERTAS(String pP_CMARCA, String pP_CMODELO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTNUMPUERTAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CMARCA", "pP_CMODELO" }, new Object[] { pP_CMARCA, pP_CMODELO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CMARCA);
		cStmt.setObject(3, pP_CMODELO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTNUMPUERTAS(String pP_CMARCA, String pP_CMODELO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTNUMPUERTAS(pP_CMARCA, pP_CMODELO);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTNUMPUERTAS

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTVERSIONES(P_CMARCA, P_CMODELO,
	// P_NUMPUERTAS, P_CMOTOR, PCTIPVEH, PCCLAVEH, PCVERSION, PCTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTVERSIONES(String pP_CMARCA, String pP_CMODELO,
			String pP_NUMPUERTAS, String pP_CMOTOR, String pPCTIPVEH, String pPCCLAVEH, String pPCVERSION,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTVERSIONES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CMARCA", "pP_CMODELO", "pP_NUMPUERTAS", "pP_CMOTOR", "pPCTIPVEH", "pPCCLAVEH",
						"pPCVERSION", "pPCTRAMIT" },
				new Object[] { pP_CMARCA, pP_CMODELO, pP_NUMPUERTAS, pP_CMOTOR, pPCTIPVEH, pPCCLAVEH, pPCVERSION,
						pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CMARCA);
		cStmt.setObject(3, pP_CMODELO);
		cStmt.setObject(4, pP_NUMPUERTAS);
		cStmt.setObject(5, pP_CMOTOR);
		cStmt.setObject(6, pPCTIPVEH);
		cStmt.setObject(7, pPCCLAVEH);
		cStmt.setObject(8, pPCVERSION);
		cStmt.setObject(9, pPCTRAMIT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTVERSIONES(String pP_CMARCA, String pP_CMODELO,
			String pP_NUMPUERTAS, String pP_CMOTOR, String pPCTIPVEH, String pPCCLAVEH, String pPCVERSION,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTVERSIONES(pP_CMARCA, pP_CMODELO, pP_NUMPUERTAS, pP_CMOTOR,
				pPCTIPVEH, pPCCLAVEH, pPCVERSION, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTVERSIONES

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_VERSION(P_CVERSION, PHOMOLOGAR,
	// PCTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(String pP_CVERSION, java.math.BigDecimal pPHOMOLOGAR,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_VERSION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CVERSION", "pPHOMOLOGAR", "pPCTRAMIT" },
				new Object[] { pP_CVERSION, pPHOMOLOGAR, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CVERSION);
		cStmt.setObject(3, pPHOMOLOGAR);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(String pP_CVERSION, java.math.BigDecimal pPHOMOLOGAR,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(pP_CVERSION, pPHOMOLOGAR, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_VERSION

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTUSO(P_CCLAVEH, P_CTIPVEH, P_SPRODUC,
	// P_CACTIVI)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTUSO(String pP_CCLAVEH, String pP_CTIPVEH,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_CACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTUSO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CCLAVEH", "pP_CTIPVEH", "pP_SPRODUC", "pP_CACTIVI" },
				new Object[] { pP_CCLAVEH, pP_CTIPVEH, pP_SPRODUC, pP_CACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CCLAVEH);
		cStmt.setObject(3, pP_CTIPVEH);
		cStmt.setObject(4, pP_SPRODUC);
		cStmt.setObject(5, pP_CACTIVI);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTUSO(String pP_CCLAVEH, String pP_CTIPVEH,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_CACTIVI) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTUSO(pP_CCLAVEH, pP_CTIPVEH, pP_SPRODUC, pP_CACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTUSO

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCSUBUSO(PCUSU, PCTIPVEH, PCCLAVEH)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCSUBUSO(String pPCUSU, String pPCTIPVEH, String pPCCLAVEH)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCSUBUSO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCUSU", "pPCTIPVEH", "pPCCLAVEH" },
				new Object[] { pPCUSU, pPCTIPVEH, pPCCLAVEH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSU);
		cStmt.setObject(3, pPCTIPVEH);
		cStmt.setObject(4, pPCCLAVEH);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCSUBUSO(String pPCUSU, String pPCTIPVEH, String pPCCLAVEH)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCSUBUSO(pPCUSU, pPCTIPVEH, pPCCLAVEH);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCSUBUSO

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTSUBUSO(P_CCLAVEH, P_CTIPVEH, P_USO,
	// P_SPRODUC, P_CACTIVI)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTSUBUSO(String pP_CCLAVEH, String pP_CTIPVEH, String pP_USO,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_CACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTSUBUSO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CCLAVEH", "pP_CTIPVEH", "pP_USO", "pP_SPRODUC", "pP_CACTIVI" },
				new Object[] { pP_CCLAVEH, pP_CTIPVEH, pP_USO, pP_SPRODUC, pP_CACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CCLAVEH);
		cStmt.setObject(3, pP_CTIPVEH);
		cStmt.setObject(4, pP_USO);
		cStmt.setObject(5, pP_SPRODUC);
		cStmt.setObject(6, pP_CACTIVI);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTSUBUSO(String pP_CCLAVEH, String pP_CTIPVEH, String pP_USO,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_CACTIVI) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTSUBUSO(pP_CCLAVEH, pP_CTIPVEH, pP_USO, pP_SPRODUC,
				pP_CACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTSUBUSO

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCUSU(PSPRODUC, PCACTIVI, PCTIPVEH,
	// PCCLAVEH)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCUSU(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCTIPVEH, String pPCCLAVEH) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCUSU(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCTIPVEH", "pPCCLAVEH" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCTIPVEH, pPCCLAVEH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCTIPVEH);
		cStmt.setObject(5, pPCCLAVEH);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCUSU(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCTIPVEH, String pPCCLAVEH) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCUSU(pPSPRODUC, pPCACTIVI, pPCTIPVEH, pPCCLAVEH);
	}

	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCUSU
	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCVERSION(PCMARCA, PCMODELO)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCVERSION(String pPCMARCA, java.math.BigDecimal pPCMODELO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCVERSION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMARCA", "pPCMODELO" }, new Object[] { pPCMARCA, pPCMODELO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
		cStmt.setObject(3, pPCMODELO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCVERSION(String pPCMARCA, java.math.BigDecimal pPCMODELO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCVERSION(pPCMARCA, pPCMODELO);
	}

	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCVERSION
	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTNANOFAB(PCVERSION)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTNANOFAB(String pPCVERSION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTNANOFAB(?, ?)}";

		logCall(callQuery, new String[] { "pPCVERSION" }, new Object[] { pPCVERSION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCVERSION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTNANOFAB(String pPCVERSION) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTNANOFAB(pPCVERSION);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTNANOFAB

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH()
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH() throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCLAVEH(P_CTIPVEH)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(String pP_CTIPVEH) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCLAVEH(?, ?)}";

		logCall(callQuery, new String[] { "pP_CTIPVEH" }, new Object[] { pP_CTIPVEH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CTIPVEH);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(String pP_CTIPVEH) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(pP_CTIPVEH);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCLAVEH

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOSNOSERIE(P_CVERSION)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOSNOSERIE(String pP_CVERSION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOSNOSERIE(?, ?)}";

		logCall(callQuery, new String[] { "pP_CVERSION" }, new Object[] { pP_CVERSION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CVERSION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOSNOSERIE(String pP_CVERSION) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOSNOSERIE(pP_CVERSION);
	}

	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOSNOSERIE
	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOSSERIE(P_CVERSION)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOSSERIE(String pP_CVERSION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOSSERIE(?, ?)}";

		logCall(callQuery, new String[] { "pP_CVERSION" }, new Object[] { pP_CVERSION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CVERSION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOSSERIE(String pP_CVERSION) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOSSERIE(pP_CVERSION);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOSSERIE

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMODALIDADES()
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODALIDADES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTMODALIDADES(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODALIDADES() throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODALIDADES();
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTMODALIDADES

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCLAVEH_PORMARCA(PCMARCA, P_CTIPVEH)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(String pPCMARCA, String pP_CTIPVEH)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCLAVEH_PORMARCA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMARCA", "pP_CTIPVEH" }, new Object[] { pPCMARCA, pP_CTIPVEH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
		cStmt.setObject(3, pP_CTIPVEH);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(String pPCMARCA, String pP_CTIPVEH)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(pPCMARCA, pP_CTIPVEH);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCLAVEH_PORMARCA

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_ANYOS_VERSION(P_CVERSION, P_NRIESGO)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION(String pP_CVERSION,
			java.math.BigDecimal pP_NRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_ANYOS_VERSION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CVERSION", "pP_NRIESGO" }, new Object[] { pP_CVERSION, pP_NRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CVERSION);
		cStmt.setObject(3, pP_NRIESGO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION(String pP_CVERSION,
			java.math.BigDecimal pP_NRIESGO) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION(pP_CVERSION, pP_NRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_ANYOS_VERSION

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOS()
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTACCESORIOS

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTDISPOSITIVOS()
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTDISPOSITIVOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTDISPOSITIVOS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTDISPOSITIVOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTDISPOSITIVOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTDISPOSITIVOS

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTASEGURABLES(PCACCESORIO, PCTIPO)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTASEGURABLES(String pPCACCESORIO, java.math.BigDecimal pPCTIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTASEGURABLES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCACCESORIO", "pPCTIPO" }, new Object[] { pPCACCESORIO, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCACCESORIO);
		cStmt.setObject(3, pPCTIPO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTASEGURABLES(String pPCACCESORIO,
			java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTASEGURABLES(pPCACCESORIO, pPCTIPO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTASEGURABLES
	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTPESOS(PSPRODUC) // Bug 25202 -- ECP
	// -- 18/02/2013
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTPESOS(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTPESOS(?, ?)}";

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

	/**
	 * @param pPSPRODUC
	 * @return
	 * @throws Exception
	 */
	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTPESOS(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTPESOS(pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTPESOS

	// --START-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH_PORMARCAMODEL(PCMARCA,
	// PCMODEL, PCTRAMIT)
	private HashMap callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCAMODEL(String pPCMARCA, String pPCMODEL,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH_PORMARCAMODEL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMARCA", "pPCMODEL", "pPCTRAMIT" },
				new Object[] { pPCMARCA, pPCMODEL, pPCTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
		cStmt.setObject(3, pPCMODEL);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCAMODEL(String pPCMARCA, String pPCMODEL,
			java.math.BigDecimal pPCTRAMIT) throws Exception {
		return this.callPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCAMODEL(pPCMARCA, pPCMODEL, pPCTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_AUT.F_GET_LSTCTIPVEH_PORMARCAMODEL

}
