package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_AGE_PROPIEDADES extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_AGE_PROPIEDADES.class);
	private Connection conn = null;

	public PAC_IAX_AGE_PROPIEDADES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AGE_PROPIEDADES.F_DEL_ESTPARAGENTE(PCAGENTE, PCPARAM)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_DEL_ESTPARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_DEL_ESTPARAGENTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCPARAM" }, new Object[] { pPCAGENTE, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_DEL_ESTPARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM)
			throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_DEL_ESTPARAGENTE(pPCAGENTE, pPCPARAM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_PROPIEDADES.F_DEL_ESTPARAGENTE
	// --START-PAC_IAX_AGE_PROPIEDADES.F_DEL_PARAGENTE(PCAGENTE, PCPARAM)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_DEL_PARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_DEL_PARAGENTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCPARAM" }, new Object[] { pPCAGENTE, pPCPARAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCPARAM);
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_DEL_PARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM)
			throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_DEL_PARAGENTE(pPCAGENTE, pPCPARAM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_PROPIEDADES.F_DEL_PARAGENTE
	// --START-PAC_IAX_AGE_PROPIEDADES.F_GET_ESTPARAGENTE(PCAGENTE, PTOTS)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_GET_ESTPARAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPTOTS) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_GET_ESTPARAGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPTOTS" }, new Object[] { pPCAGENTE, pPTOTS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPTOTS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PAR_AGENTES".toUpperCase())); // Valor de "PPARAGE"
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
			retVal.put("PPARAGE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PPARAGE", null);
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_GET_ESTPARAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPTOTS) throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_GET_ESTPARAGENTE(pPCAGENTE, pPTOTS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_PROPIEDADES.F_GET_ESTPARAGENTE
	// --START-PAC_IAX_AGE_PROPIEDADES.F_GET_PARAGENTE(PCAGENTE, PTOTS)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPTOTS) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_GET_PARAGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPTOTS" }, new Object[] { pPCAGENTE, pPTOTS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPTOTS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
			retVal.put("PCUR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCUR", null);
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPTOTS) throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE(pPCAGENTE, pPTOTS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_PROPIEDADES.F_GET_PARAGENTE
	// --START-PAC_IAX_AGE_PROPIEDADES.F_GET_PARAGENTE_OB(PCAGENTE, PTOTS)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE_OB(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPTOTS) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_GET_PARAGENTE_OB(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPTOTS" }, new Object[] { pPCAGENTE, pPTOTS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPTOTS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PAR_AGENTES".toUpperCase())); // Valor de "PPARAGE"
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
			retVal.put("PPARAGE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PPARAGE", null);
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE_OB(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPTOTS) throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE_OB(pPCAGENTE, pPTOTS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_PROPIEDADES.F_GET_PARAGENTE_OB
	// --START-PAC_IAX_AGE_PROPIEDADES.F_GRABAR_PARAGENTE(PCAGENTE)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_GRABAR_PARAGENTE(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_GRABAR_PARAGENTE(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_GRABAR_PARAGENTE(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_GRABAR_PARAGENTE(pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_PROPIEDADES.F_GRABAR_PARAGENTE
	// --START-PAC_IAX_AGE_PROPIEDADES.F_INS_ESTPARAGENTE(PCAGENTE, PCPARAM,
	// PNVALPAR, PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_INS_ESTPARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM,
			java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_INS_ESTPARAGENTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCPARAM", "pPNVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPNVALPAR);
		cStmt.setObject(5, pPTVALPAR);
		cStmt.setObject(6, pPFVALPAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_INS_ESTPARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM,
			java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_INS_ESTPARAGENTE(pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR,
				pPFVALPAR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AGE_PROPIEDADES.F_INS_ESTPARAGENTE
	// --START-PAC_IAX_AGE_PROPIEDADES.F_INS_PARAGENTE(PCAGENTE, PCPARAM, PNVALPAR,
	// PTVALPAR, PFVALPAR)
	private HashMap callPAC_IAX_AGE_PROPIEDADES__F_INS_PARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM,
			java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGE_PROPIEDADES.F_INS_PARAGENTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCPARAM", "pPNVALPAR", "pPTVALPAR", "pPFVALPAR" },
				new Object[] { pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPNVALPAR);
		cStmt.setObject(5, pPTVALPAR);
		cStmt.setObject(6, pPFVALPAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AGE_PROPIEDADES__F_INS_PARAGENTE(java.math.BigDecimal pPCAGENTE, String pPCPARAM,
			java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
		return this.callPAC_IAX_AGE_PROPIEDADES__F_INS_PARAGENTE(pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGE_PROPIEDADES.F_INS_PARAGENTE

}
