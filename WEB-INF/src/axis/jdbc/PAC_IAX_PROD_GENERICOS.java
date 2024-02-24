package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PROD_GENERICOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PROD_GENERICOS.class);
	private Connection conn = null;

	public PAC_IAX_PROD_GENERICOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PROD_GENERICOS.F_CONTRATAR_ESPECIFICO(PSSEGURO, PCCOMPANI,
	// PSPRODUC)
	private HashMap callPAC_IAX_PROD_GENERICOS__F_CONTRATAR_ESPECIFICO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROD_GENERICOS.F_CONTRATAR_ESPECIFICO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCCOMPANI", "pPSPRODUC" },
				new Object[] { pPSSEGURO, pPCCOMPANI, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PSPRODUCESP"
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
			retVal.put("PSPRODUCESP", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PSPRODUCESP", null);
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

	public HashMap ejecutaPAC_IAX_PROD_GENERICOS__F_CONTRATAR_ESPECIFICO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_PROD_GENERICOS__F_CONTRATAR_ESPECIFICO(pPSSEGURO, pPCCOMPANI, pPSPRODUC);
	}

	// --END-PAC_IAX_PROD_GENERICOS.F_CONTRATAR_ESPECIFICO
	// --START-PAC_IAX_PROD_GENERICOS.F_MARCAR_COMPANIA(PSSEGURO, PCCOMPANI,
	// PSPRODUC, PMARCAR, PIDDOC)
	private HashMap callPAC_IAX_PROD_GENERICOS__F_MARCAR_COMPANIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPMARCAR,
			java.math.BigDecimal pPIDDOC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROD_GENERICOS.F_MARCAR_COMPANIA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCCOMPANI", "pPSPRODUC", "pPMARCAR", "pPIDDOC" },
				new Object[] { pPSSEGURO, pPCCOMPANI, pPSPRODUC, pPMARCAR, pPIDDOC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPMARCAR);
		cStmt.setObject(6, pPIDDOC);
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

	public HashMap ejecutaPAC_IAX_PROD_GENERICOS__F_MARCAR_COMPANIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPMARCAR,
			java.math.BigDecimal pPIDDOC) throws Exception {
		return this.callPAC_IAX_PROD_GENERICOS__F_MARCAR_COMPANIA(pPSSEGURO, pPCCOMPANI, pPSPRODUC, pPMARCAR, pPIDDOC);
	}

	// --END-PAC_IAX_PROD_GENERICOS.F_MARCAR_COMPANIA
	// --START-PAC_IAX_PROD_GENERICOS.F_OBTENER_COMPANIAS(PSSEGURO)
	private HashMap callPAC_IAX_PROD_GENERICOS__F_OBTENER_COMPANIAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROD_GENERICOS.F_OBTENER_COMPANIAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_COMPANIPROD".toUpperCase())); // Valor de "PTCOMPANIAS"
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
			retVal.put("PTCOMPANIAS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTCOMPANIAS", null);
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

	public HashMap ejecutaPAC_IAX_PROD_GENERICOS__F_OBTENER_COMPANIAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_PROD_GENERICOS__F_OBTENER_COMPANIAS(pPSSEGURO);
	}

	// --END-PAC_IAX_PROD_GENERICOS.F_OBTENER_COMPANIAS
	// --START-PAC_IAX_PROD_GENERICOS.F_PEDIR_PRESUPUESTO()
	private HashMap callPAC_IAX_PROD_GENERICOS__F_PEDIR_PRESUPUESTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROD_GENERICOS.F_PEDIR_PRESUPUESTO(?)}";

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

	public HashMap ejecutaPAC_IAX_PROD_GENERICOS__F_PEDIR_PRESUPUESTO() throws Exception {
		return this.callPAC_IAX_PROD_GENERICOS__F_PEDIR_PRESUPUESTO();
	}
	// --END-PAC_IAX_PROD_GENERICOS.F_PEDIR_PRESUPUESTO

}
