package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_REEMBOLSOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_REEMBOLSOS.class);
	private Connection conn = null;

	public PAC_IAX_REEMBOLSOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_REEMBOLSOS.F_CONSULTAPOLIZAASEGURADOS(PSPRODUC, PNPOLIZA,
	// PNCERT, PNNUMIDE, PSNIP, PBUSCAR, PTIPOPERSONA)
	private HashMap callPAC_IAX_REEMBOLSOS__F_CONSULTAPOLIZAASEGURADOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT, String pPNNUMIDE, String pPSNIP,
			String pPBUSCAR, java.math.BigDecimal pPTIPOPERSONA) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_CONSULTAPOLIZAASEGURADOS(?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPNPOLIZA", "pPNCERT", "pPNNUMIDE", "pPSNIP", "pPBUSCAR",
						"pPTIPOPERSONA" },
				new Object[] { pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP, pPBUSCAR, pPTIPOPERSONA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNCERT);
		cStmt.setObject(5, pPNNUMIDE);
		cStmt.setObject(6, pPSNIP);
		cStmt.setObject(7, pPBUSCAR);
		cStmt.setObject(8, pPTIPOPERSONA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_CONSULTAPOLIZAASEGURADOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERT, String pPNNUMIDE, String pPSNIP,
			String pPBUSCAR, java.math.BigDecimal pPTIPOPERSONA) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_CONSULTAPOLIZAASEGURADOS(pPSPRODUC, pPNPOLIZA, pPNCERT, pPNNUMIDE, pPSNIP,
				pPBUSCAR, pPTIPOPERSONA);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_CONSULTAPOLIZAASEGURADOS

	// --START-PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMB(PNREEEMB)
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMB(java.math.BigDecimal pPNREEEMB) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMB(?,?)}";
		logCall(callQuery, new String[] { "pPNREEEMB" }, new Object[] { pPNREEEMB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEEMB);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_REEMBOLSOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMB(java.math.BigDecimal pPNREEEMB) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMB(pPNREEEMB);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMB

	// --START-PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMBACTFACT(PNREEMB, PNFACT, PNLINEA)
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBACTFACT(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT, java.math.BigDecimal pPNLINEA) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMBACTFACT(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNREEMB", "pPNFACT", "pPNLINEA" },
				new Object[] { pPNREEMB, pPNFACT, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACT);
		cStmt.setObject(4, pPNLINEA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_REEMBACTFACT".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBACTFACT(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT, java.math.BigDecimal pPNLINEA) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBACTFACT(pPNREEMB, pPNFACT, pPNLINEA);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMBACTFACT

	// --START-PAC_IAX_REEMBOLSOS.F_GET_DATREEMB(PNREEEMB)
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_DATREEMB(java.math.BigDecimal pPNREEEMB) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_DATREEMB(?,?)}";
		logCall(callQuery, new String[] { "pPNREEEMB" }, new Object[] { pPNREEEMB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEEMB);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_REEMBOLSOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATREEMB(java.math.BigDecimal pPNREEEMB) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_DATREEMB(pPNREEEMB);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_DATREEMB

	// --START-PAC_IAX_REEMBOLSOS.F_GET_GARANREEMB(PSSEGURO, PNRIESGO, PFREEMBO)
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_GARANREEMB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFREEMBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_GARANREEMB(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFREEMBO" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFREEMBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFREEMBO);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_GARANREEMB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFREEMBO) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_GARANREEMB(pPSSEGURO, pPNRIESGO, pPFREEMBO);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_GARANREEMB

	// --START-PAC_IAX_REEMBOLSOS.F_GET_IMPORTACTO(PNREEMB, PCACTO, PFACTO)
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_IMPORTACTO(java.math.BigDecimal pPNREEMB, String pPCACTO,
			java.sql.Date pPFACTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_IMPORTACTO(?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNREEMB", "pPCACTO", "pPFACTO" },
				new Object[] { pPNREEMB, pPCACTO, pPFACTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPCACTO);
		cStmt.setObject(4, pPFACTO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "OITARCASS"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "OICASS"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "OPREEMB"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "OIEXTRA"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "ONACTO"
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
			retVal.put("OITARCASS", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OITARCASS", null);
		}
		try {
			retVal.put("OICASS", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("OICASS", null);
		}
		try {
			retVal.put("OPREEMB", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("OPREEMB", null);
		}
		try {
			retVal.put("OIEXTRA", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("OIEXTRA", null);
		}
		try {
			retVal.put("ONACTO", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("ONACTO", null);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_IMPORTACTO(java.math.BigDecimal pPNREEMB, String pPCACTO,
			java.sql.Date pPFACTO) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_IMPORTACTO(pPNREEMB, pPCACTO, pPFACTO);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_IMPORTACTO

	// --START-PAC_IAX_REEMBOLSOS.F_GET_LSTACTOS()
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_LSTACTOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_LSTACTOS(?)}";
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTACTOS() throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_LSTACTOS();
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_LSTACTOS

	// --START-PAC_IAX_REEMBOLSOS.F_GET_LSTAGRSALUD()
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_LSTAGRSALUD() throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_LSTAGRSALUD(?)}";
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTAGRSALUD() throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_LSTAGRSALUD();
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_LSTAGRSALUD

	// --START-PAC_IAX_REEMBOLSOS.F_GET_LSTTIPOFACT()
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOFACT() throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_LSTTIPOFACT(?)}";
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOFACT() throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOFACT();
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_LSTTIPOFACT

	// --START-PAC_IAX_REEMBOLSOS.F_INICIALIZA_REEMB(PSSEGURO, PNRIESGO)
	private HashMap callPAC_IAX_REEMBOLSOS__F_INICIALIZA_REEMB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_INICIALIZA_REEMB(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_REEMBOLSOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_INICIALIZA_REEMB(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_INICIALIZA_REEMB(pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_INICIALIZA_REEMB

	// --START-PAC_IAX_REEMBOLSOS.F_ISPERFILCOMPANY()
	private HashMap callPAC_IAX_REEMBOLSOS__F_ISPERFILCOMPANY() throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_ISPERFILCOMPANY(?)}";
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_ISPERFILCOMPANY() throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_ISPERFILCOMPANY();
	}
	// --END-PAC_IAX_REEMBOLSOS.F_ISPERFILCOMPANY

	// --START-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_ACTIVI(PNPOLIZA, PNCASS, PTNOMBRE,
	// PSNIP)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_ACTIVI(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCASS, String pPTNOMBRE, java.math.BigDecimal pPSNIP) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_ACTIVI(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNCASS", "pPTNOMBRE", "pPSNIP" },
				new Object[] { pPNPOLIZA, pPNCASS, pPTNOMBRE, pPSNIP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCASS);
		cStmt.setObject(4, pPTNOMBRE);
		cStmt.setObject(5, pPSNIP);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_ACTIVI(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCASS, String pPTNOMBRE, java.math.BigDecimal pPSNIP) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_ACTIVI(pPNPOLIZA, pPNCASS, pPTNOMBRE, pPSNIP);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_ACTIVI

	// --START-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_POLIZA(PNPOLIZA, PSPERSON)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_POLIZA(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_POLIZA(?,?,?)}";
		logCall(callQuery, new String[] { "pPNPOLIZA", "pPSPERSON" }, new Object[] { pPNPOLIZA, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_POLIZA(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_POLIZA(pPNPOLIZA, pPSPERSON);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_POLIZA

	// --START-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_REEMBRIESGO(PSSEGURO, PNRIESGO)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_REEMBRIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_REEMBRIESGO(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_REEMBRIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_REEMBRIESGO(pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_REEMBRIESGO

	// --START-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_RIESGO(PSSEGURO, PNRIESGO,
	// PSPERSON)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_RIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_RIESGO(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPSPERSON" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_RIESGO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_RIESGO(pPSSEGURO, pPNRIESGO, pPSPERSON);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_CONSULTA_RIESGO

	// --START-PAC_IAX_REEMBOLSOS.F_SET_REEMBOLSO(PSSEGURO, PNRIESGO, PCGARANT,
	// PCESTADO, PTOBSERV, PCBANCAR, PCTIPBAN, PCORIGEN, PONREEMB)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_REEMBOLSO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCESTADO,
			String pPTOBSERV, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCORIGEN,
			java.math.BigDecimal pPONREEMB) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_REEMBOLSO(?,?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPCGARANT", "pPCESTADO", "pPTOBSERV", "pPCBANCAR",
						"pPCTIPBAN", "pPCORIGEN", "pPONREEMB" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCGARANT, pPCESTADO, pPTOBSERV, pPCBANCAR, pPCTIPBAN, pPCORIGEN,
						pPONREEMB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.NUMERIC); // Valor de "PONREEMB"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPTOBSERV);
		cStmt.setObject(7, pPCBANCAR);
		cStmt.setObject(8, pPCTIPBAN);
		cStmt.setObject(9, pPCORIGEN);
		cStmt.setBigDecimal(10, pPONREEMB);
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PONREEMB", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PONREEMB", null);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_REEMBOLSO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCESTADO,
			String pPTOBSERV, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCORIGEN,
			java.math.BigDecimal pPONREEMB) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_REEMBOLSO(pPSSEGURO, pPNRIESGO, pPCGARANT, pPCESTADO, pPTOBSERV,
				pPCBANCAR, pPCTIPBAN, pPCORIGEN, pPONREEMB);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_REEMBOLSO

	// --START-PAC_IAX_REEMBOLSOS.F_VALIDA_REEMB(PTIPO, PSSEGURO, PNRIESGO,
	// PCGARANT, PSPERSON, PAGR_SALUD, PCACTO, PNACTO, PFACTO, PIIMPORTE, PNREEMB,
	// PNFACT, PNLINEA, PSMANCONT, PFTRANS, MENSAJES)
	private HashMap callPAC_IAX_REEMBOLSOS__F_VALIDA_REEMB(java.math.BigDecimal pPTIPO, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPAGR_SALUD, String pPCACTO, java.math.BigDecimal pPNACTO, java.sql.Date pPFACTO,
			java.math.BigDecimal pPIIMPORTE, java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPSMANCONT, java.sql.Date pPFTRANS, Object pMENSAJES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_VALIDA_REEMB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPTIPO", "pPSSEGURO", "pPNRIESGO", "pPCGARANT", "pPSPERSON", "pPAGR_SALUD", "pPCACTO",
						"pPNACTO", "pPFACTO", "pPIIMPORTE", "pPNREEMB", "pPNFACT", "pPNLINEA", "pPSMANCONT", "pPFTRANS",
						"pMENSAJES" },
				new Object[] { pPTIPO, pPSSEGURO, pPNRIESGO, pPCGARANT, pPSPERSON, pPAGR_SALUD, pPCACTO, pPNACTO,
						pPFACTO, pPIIMPORTE, pPNREEMB, pPNFACT, pPNLINEA, pPSMANCONT, pPFTRANS, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPSPERSON);
		cStmt.setObject(7, pPAGR_SALUD);
		cStmt.setObject(8, pPCACTO);
		cStmt.setObject(9, pPNACTO);
		cStmt.setObject(10, pPFACTO);
		cStmt.setObject(11, pPIIMPORTE);
		cStmt.setObject(12, pPNREEMB);
		cStmt.setObject(13, pPNFACT);
		cStmt.setObject(14, pPNLINEA);
		cStmt.setObject(15, pPSMANCONT);
		cStmt.setObject(16, pPFTRANS);
		cStmt.setObject(17, pMENSAJES);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_VALIDA_REEMB(java.math.BigDecimal pPTIPO,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPAGR_SALUD, String pPCACTO,
			java.math.BigDecimal pPNACTO, java.sql.Date pPFACTO, java.math.BigDecimal pPIIMPORTE,
			java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPSMANCONT, java.sql.Date pPFTRANS, Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_VALIDA_REEMB(pPTIPO, pPSSEGURO, pPNRIESGO, pPCGARANT, pPSPERSON,
				pPAGR_SALUD, pPCACTO, pPNACTO, pPFACTO, pPIIMPORTE, pPNREEMB, pPNFACT, pPNLINEA, pPSMANCONT, pPFTRANS,
				pMENSAJES);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_VALIDA_REEMB

	// --START-PAC_IAX_REEMBOLSOS.F_NETEJA_ERRORS()
	private HashMap callPAC_IAX_REEMBOLSOS__F_NETEJA_ERRORS() throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_NETEJA_ERRORS(?)}";
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_NETEJA_ERRORS() throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_NETEJA_ERRORS();
	}
	// --END-PAC_IAX_REEMBOLSOS.F_NETEJA_ERRORS

	// --START-PAC_IAX_REEMBOLSOS.F_CALCACTO(PNREEMB, PCACTO, PFACTO, PNACTOS,
	// PITARCASS, PICASS, PIPAGO, PPORCENT)
	private HashMap callPAC_IAX_REEMBOLSOS__F_CALCACTO(java.math.BigDecimal pPNREEMB, String pPCACTO,
			java.sql.Date pPFACTO, java.math.BigDecimal pPNACTOS, java.math.BigDecimal pPITARCASS,
			java.math.BigDecimal pPICASS, java.math.BigDecimal pPIPAGO, java.math.BigDecimal pPPORCENT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_CALCACTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNREEMB", "pPCACTO", "pPFACTO", "pPNACTOS", "pPITARCASS", "pPICASS", "pPIPAGO",
						"pPPORCENT" },
				new Object[] { pPNREEMB, pPCACTO, pPFACTO, pPNACTOS, pPITARCASS, pPICASS, pPIPAGO, pPPORCENT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPCACTO);
		cStmt.setObject(4, pPFACTO);
		cStmt.setObject(5, pPNACTOS);
		cStmt.setObject(6, pPITARCASS);
		cStmt.setObject(7, pPICASS);
		cStmt.setObject(8, pPIPAGO);
		cStmt.setObject(9, pPPORCENT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "OICASS"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "OIPAGO"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de "OITOT"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de "oitarcass"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "oiextra"
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
			retVal.put("OICASS", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("OICASS", null);
		}
		try {
			retVal.put("OIPAGO", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("OIPAGO", null);
		}
		try {
			retVal.put("OITOT", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("OITOT", null);
		}
		try {
			retVal.put("OITARCASS", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("OITARCASS", null);
		}
		try {
			retVal.put("OIEXTRA", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("OIEXTRA", null);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_CALCACTO(java.math.BigDecimal pPNREEMB, String pPCACTO,
			java.sql.Date pPFACTO, java.math.BigDecimal pPNACTOS, java.math.BigDecimal pPITARCASS,
			java.math.BigDecimal pPICASS, java.math.BigDecimal pPIPAGO, java.math.BigDecimal pPPORCENT)
			throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_CALCACTO(pPNREEMB, pPCACTO, pPFACTO, pPNACTOS, pPITARCASS, pPICASS,
				pPIPAGO, pPPORCENT);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_CALCACTO

	// --START-PAC_IAX_REEMBOLSOS.F_SET_CONSULTAREEMB(PESTADO, PNREEMB, PNPOLIZA,
	// PNCERTIF, PNCASS, PNOMBRE, PAGRSALUD, POFICINA, PUSUARIO, PNFACTCLI, PFACTO)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_CONSULTAREEMB(java.math.BigDecimal pPESTADO,
			java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPNCASS, String pPNOMBRE, String pPAGRSALUD, java.math.BigDecimal pPOFICINA, String pPUSUARIO,
			String pPNFACTCLI, java.sql.Date pPFACTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_CONSULTAREEMB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPESTADO", "pPNREEMB", "pPNPOLIZA", "pPNCERTIF", "pPNCASS", "pPNOMBRE", "pPAGRSALUD",
						"pPOFICINA", "pPUSUARIO", "pPNFACTCLI", "pPFACTO" },
				new Object[] { pPESTADO, pPNREEMB, pPNPOLIZA, pPNCERTIF, pPNCASS, pPNOMBRE, pPAGRSALUD, pPOFICINA,
						pPUSUARIO, pPNFACTCLI, pPFACTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPESTADO);
		cStmt.setObject(3, pPNREEMB);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPNCERTIF);
		cStmt.setObject(6, pPNCASS);
		cStmt.setObject(7, pPNOMBRE);
		cStmt.setObject(8, pPAGRSALUD);
		cStmt.setObject(9, pPOFICINA);
		cStmt.setObject(10, pPUSUARIO);
		cStmt.setObject(11, pPNFACTCLI);
		cStmt.setObject(12, pPFACTO);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTAREEMB(java.math.BigDecimal pPESTADO,
			java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPNCASS, String pPNOMBRE, String pPAGRSALUD, java.math.BigDecimal pPOFICINA, String pPUSUARIO,
			String pPNFACTCLI, java.sql.Date pPFACTO) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_CONSULTAREEMB(pPESTADO, pPNREEMB, pPNPOLIZA, pPNCERTIF, pPNCASS,
				pPNOMBRE, pPAGRSALUD, pPOFICINA, pPUSUARIO, pPNFACTCLI, pPFACTO);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_CONSULTAREEMB

	// --START-PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMBFACT(PNREEEMB, PNFACT)
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBFACT(java.math.BigDecimal pPNREEEMB,
			java.math.BigDecimal pPNFACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMBFACT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEEMB", "pPNFACT" }, new Object[] { pPNREEEMB, pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEEMB);
		cStmt.setObject(3, pPNFACT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_REEMBFACT".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBFACT(java.math.BigDecimal pPNREEEMB,
			java.math.BigDecimal pPNFACT) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBFACT(pPNREEEMB, pPNFACT);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_DATOS_REEMBFACT

	// --START-PAC_IAX_REEMBOLSOS.F_SET_REEMBFACT(PNREEMB, PNFACTCLI, PNCASASE,
	// PNCASS, PFACUSE, PFFACTURA, PIMPFACT, PFBAJA, PCTIPOFAC, PNFACT, PNFACTEXT,
	// PCTRACTAT)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_REEMBFACT(java.math.BigDecimal pPNREEMB, String pPNFACTCLI,
			String pPNCASASE, String pPNCASS, java.sql.Date pPFACUSE, java.sql.Date pPFFACTURA,
			java.math.BigDecimal pPIMPFACT, java.sql.Date pPFBAJA, java.math.BigDecimal pPCTIPOFAC,
			java.math.BigDecimal pPNFACT, String pPNFACTEXT, java.math.BigDecimal pPCTRACTAT) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_REEMBFACT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNREEMB", "pPNFACTCLI", "pPNCASASE", "pPNCASS", "pPFACUSE", "pPFFACTURA", "pPIMPFACT",
						"pPFBAJA", "pPCTIPOFAC", "pPNFACT", "pPNFACTEXT", "pPCTRACTAT" },
				new Object[] { pPNREEMB, pPNFACTCLI, pPNCASASE, pPNCASS, pPFACUSE, pPFFACTURA, pPIMPFACT, pPFBAJA,
						pPCTIPOFAC, pPNFACT, pPNFACTEXT, pPCTRACTAT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACTCLI);
		cStmt.setObject(4, pPNCASASE);
		cStmt.setObject(5, pPNCASS);
		cStmt.setObject(6, pPFACUSE);
		cStmt.setObject(7, pPFFACTURA);
		cStmt.setObject(8, pPIMPFACT);
		cStmt.setObject(9, pPFBAJA);
		cStmt.setObject(10, pPCTIPOFAC);
		cStmt.setObject(11, pPNFACT);
		cStmt.setObject(12, pPNFACTEXT);
		cStmt.setObject(13, pPCTRACTAT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PNFACTNEW"
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
			retVal.put("PNFACTNEW", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PNFACTNEW", null);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_REEMBFACT(java.math.BigDecimal pPNREEMB, String pPNFACTCLI,
			String pPNCASASE, String pPNCASS, java.sql.Date pPFACUSE, java.sql.Date pPFFACTURA,
			java.math.BigDecimal pPIMPFACT, java.sql.Date pPFBAJA, java.math.BigDecimal pPCTIPOFAC,
			java.math.BigDecimal pPNFACT, String pPNFACTEXT, java.math.BigDecimal pPCTRACTAT) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_REEMBFACT(pPNREEMB, pPNFACTCLI, pPNCASASE, pPNCASS, pPFACUSE,
				pPFFACTURA, pPIMPFACT, pPFBAJA, pPCTIPOFAC, pPNFACT, pPNFACTEXT, pPCTRACTAT);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_REEMBFACT

	// --START-PAC_IAX_REEMBOLSOS.F_SET_REEMBFACTACT(PNREEMB, PNFACT, PCACTO,
	// PNACTO, PFACTO, PITARCASS, PICASS, PPREEMB, PITOT, PIEXTRA, PIPAGO, PIAHORRO,
	// PFBAJA, PNLINEA, PCTIPO, PIPAGOCOMP, PFTRANS)
	private HashMap callPAC_IAX_REEMBOLSOS__F_SET_REEMBFACTACT(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT, String pPCACTO, java.math.BigDecimal pPNACTO, java.sql.Date pPFACTO,
			java.math.BigDecimal pPITARCASS, java.math.BigDecimal pPICASS, java.math.BigDecimal pPPREEMB,
			java.math.BigDecimal pPITOT, java.math.BigDecimal pPIEXTRA, java.math.BigDecimal pPIPAGO,
			java.math.BigDecimal pPIAHORRO, java.sql.Date pPFBAJA, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPIPAGOCOMP, java.sql.Date pPFTRANS) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_SET_REEMBFACTACT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNREEMB", "pPNFACT", "pPCACTO", "pPNACTO", "pPFACTO", "pPITARCASS", "pPICASS",
						"pPPREEMB", "pPITOT", "pPIEXTRA", "pPIPAGO", "pPIAHORRO", "pPFBAJA", "pPNLINEA", "pPCTIPO",
						"pPIPAGOCOMP", "pPFTRANS" },
				new Object[] { pPNREEMB, pPNFACT, pPCACTO, pPNACTO, pPFACTO, pPITARCASS, pPICASS, pPPREEMB, pPITOT,
						pPIEXTRA, pPIPAGO, pPIAHORRO, pPFBAJA, pPNLINEA, pPCTIPO, pPIPAGOCOMP, pPFTRANS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACT);
		cStmt.setObject(4, pPCACTO);
		cStmt.setObject(5, pPNACTO);
		cStmt.setObject(6, pPFACTO);
		cStmt.setObject(7, pPITARCASS);
		cStmt.setObject(8, pPICASS);
		cStmt.setObject(9, pPPREEMB);
		cStmt.setObject(10, pPITOT);
		cStmt.setObject(11, pPIEXTRA);
		cStmt.setObject(12, pPIPAGO);
		cStmt.setObject(13, pPIAHORRO);
		cStmt.setObject(14, pPFBAJA);
		cStmt.setObject(15, pPNLINEA);
		cStmt.setObject(16, pPCTIPO);
		cStmt.setObject(17, pPIPAGOCOMP);
		cStmt.setObject(18, pPFTRANS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(19, java.sql.Types.NUMERIC); // Valor de "PNLINEANEW"
		cStmt.registerOutParameter(20, java.sql.Types.NUMERIC); // Valor de "CTIPOMSJ"
		cStmt.registerOutParameter(21, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PNLINEANEW", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("PNLINEANEW", null);
		}
		try {
			retVal.put("CTIPOMSJ", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("CTIPOMSJ", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(21));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_SET_REEMBFACTACT(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT, String pPCACTO, java.math.BigDecimal pPNACTO, java.sql.Date pPFACTO,
			java.math.BigDecimal pPITARCASS, java.math.BigDecimal pPICASS, java.math.BigDecimal pPPREEMB,
			java.math.BigDecimal pPITOT, java.math.BigDecimal pPIEXTRA, java.math.BigDecimal pPIPAGO,
			java.math.BigDecimal pPIAHORRO, java.sql.Date pPFBAJA, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPIPAGOCOMP, java.sql.Date pPFTRANS) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_SET_REEMBFACTACT(pPNREEMB, pPNFACT, pPCACTO, pPNACTO, pPFACTO, pPITARCASS,
				pPICASS, pPPREEMB, pPITOT, pPIEXTRA, pPIPAGO, pPIAHORRO, pPFBAJA, pPNLINEA, pPCTIPO, pPIPAGOCOMP,
				pPFTRANS);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_SET_REEMBFACTACT

	// --START-PAC_IAX_REEMBOLSOS.F_ACT_FACTURA(PNREEMB, PNFACT)
	private HashMap callPAC_IAX_REEMBOLSOS__F_ACT_FACTURA(java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_ACT_FACTURA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEMB", "pPNFACT" }, new Object[] { pPNREEMB, pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACT);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_ACT_FACTURA(java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT)
			throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_ACT_FACTURA(pPNREEMB, pPNFACT);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_ACT_FACTURA

	// --START-PAC_IAX_REEMBOLSOS.F_MODIF_FACTURA(PNREEMB, PNFACT)
	private HashMap callPAC_IAX_REEMBOLSOS__F_MODIF_FACTURA(java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_MODIF_FACTURA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEMB", "pPNFACT" }, new Object[] { pPNREEMB, pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACT);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_MODIF_FACTURA(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_MODIF_FACTURA(pPNREEMB, pPNFACT);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_MODIF_FACTURA

	// --START-PAC_IAX_REEMBOLSOS.F_GET_LSTTIPOACTOS()
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOACTOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_LSTTIPOACTOS(?)}";

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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOACTOS() throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOACTOS();
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_LSTTIPOACTOS

	// --START-PAC_IAX_REEMBOLSOS.F_EXISTE_FACTCLI(PNREEMB, PNFACTCLI)
	private HashMap callPAC_IAX_REEMBOLSOS__F_EXISTE_FACTCLI(java.math.BigDecimal pPNREEMB, String pPNFACTCLI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_EXISTE_FACTCLI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEMB", "pPNFACTCLI" }, new Object[] { pPNREEMB, pPNFACTCLI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACTCLI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNREEMBDEST"
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
			retVal.put("PNREEMBDEST", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNREEMBDEST", null);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_EXISTE_FACTCLI(java.math.BigDecimal pPNREEMB, String pPNFACTCLI)
			throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_EXISTE_FACTCLI(pPNREEMB, pPNFACTCLI);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_EXISTE_FACTCLI

	// --START-PAC_IAX_REEMBOLSOS.F_TRASPASAR_FACTURA(PNREEMB, PNFACT, PNFACTCLI,
	// PNREEMBORI)
	private HashMap callPAC_IAX_REEMBOLSOS__F_TRASPASAR_FACTURA(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT, String pPNFACTCLI, java.math.BigDecimal pPNREEMBORI) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_TRASPASAR_FACTURA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEMB", "pPNFACT", "pPNFACTCLI", "pPNREEMBORI" },
				new Object[] { pPNREEMB, pPNFACT, pPNFACTCLI, pPNREEMBORI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACT);
		cStmt.setObject(4, pPNFACTCLI);
		cStmt.setObject(5, pPNREEMBORI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_TRASPASAR_FACTURA(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT, String pPNFACTCLI, java.math.BigDecimal pPNREEMBORI) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_TRASPASAR_FACTURA(pPNREEMB, pPNFACT, pPNFACTCLI, pPNREEMBORI);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_TRASPASAR_FACTURA

	// --START-PAC_IAX_REEMBOLSOS.F_CALCOMPLEMENTARIO(PITOT, PIPAGO, PICASS)
	private HashMap callPAC_IAX_REEMBOLSOS__F_CALCOMPLEMENTARIO(java.math.BigDecimal pPITOT,
			java.math.BigDecimal pPIPAGO, java.math.BigDecimal pPICASS) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_CALCOMPLEMENTARIO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPITOT", "pPIPAGO", "pPICASS" }, new Object[] { pPITOT, pPIPAGO, pPICASS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPITOT);
		cStmt.setObject(3, pPIPAGO);
		cStmt.setObject(4, pPICASS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "OIPAGOCOMP"
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
			retVal.put("OIPAGOCOMP", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OIPAGOCOMP", null);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_CALCOMPLEMENTARIO(java.math.BigDecimal pPITOT,
			java.math.BigDecimal pPIPAGO, java.math.BigDecimal pPICASS) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_CALCOMPLEMENTARIO(pPITOT, pPIPAGO, pPICASS);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_CALCOMPLEMENTARIO

	// --START-PAC_IAX_REEMBOLSOS.F_TIPO_FACTURA(PNREEMB, PNFACT)
	private HashMap callPAC_IAX_REEMBOLSOS__F_TIPO_FACTURA(java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_TIPO_FACTURA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEMB", "pPNFACT" }, new Object[] { pPNREEMB, pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACT);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_TIPO_FACTURA(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_TIPO_FACTURA(pPNREEMB, pPNFACT);
	}

	// --END-PAC_IAX_REEMBOLSOS.F_TIPO_FACTURA
	// --START-PAC_IAX_REEMBOLSOS.F_GET_DATA_BAIXA(PNREEMB, PNFACT)
	private HashMap callPAC_IAX_REEMBOLSOS__F_GET_DATA_BAIXA(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_GET_DATA_BAIXA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEMB", "pPNFACT" }, new Object[] { pPNREEMB, pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPNFACT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PFBAJA"
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
			retVal.put("PFBAJA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFBAJA", null);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATA_BAIXA(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPNFACT) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_GET_DATA_BAIXA(pPNREEMB, pPNFACT);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_GET_DATA_BAIXA

	// --START-PAC_IAX_REEMBOLSOS.F_MODIFICAR_CCC(PNREEMB, PCHECK)
	private HashMap callPAC_IAX_REEMBOLSOS__F_MODIFICAR_CCC(java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPCHECK)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_REEMBOLSOS.F_MODIFICAR_CCC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNREEMB", "pPCHECK" }, new Object[] { pPNREEMB, pPCHECK });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNREEMB);
		cStmt.setObject(3, pPCHECK);
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

	public HashMap ejecutaPAC_IAX_REEMBOLSOS__F_MODIFICAR_CCC(java.math.BigDecimal pPNREEMB,
			java.math.BigDecimal pPCHECK) throws Exception {
		return this.callPAC_IAX_REEMBOLSOS__F_MODIFICAR_CCC(pPNREEMB, pPCHECK);
	}
	// --END-PAC_IAX_REEMBOLSOS.F_MODIFICAR_CCC

}
