package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_RESCATES extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_RESCATES.class);
	private Connection conn = null;

	public PAC_IAX_RESCATES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_RESCATES.F_VALOR_SIMULACION(PSSEGURO, PNRIESGO, PFECHA,
	// PIMPORTE, PCCAUSIN)
	private HashMap callPAC_IAX_RESCATES__F_VALOR_SIMULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCCAUSIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_RESCATES.F_VALOR_SIMULACION(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPIMPORTE", "pPCCAUSIN" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPCCAUSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPIMPORTE);
		cStmt.setObject(6, pPCCAUSIN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIMRESCATE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_RESCATES__F_VALOR_SIMULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCCAUSIN) throws Exception {
		return this.callPAC_IAX_RESCATES__F_VALOR_SIMULACION(pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPCCAUSIN);
	}

	// --END-PAC_IAX_RESCATES.F_VALOR_SIMULACION
	// --START-PAC_IAX_RESCATES.F_RESCATE_POLIZA(PSSEGURO, PNRIESGO, PFECHA,
	// PIMPORTE, PIPENALI, TIPOOPER)
	private HashMap callPAC_IAX_RESCATES__F_RESCATE_POLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPIPENALI, java.math.BigDecimal pTIPOOPER) throws Exception {
		String callQuery = "{?=call PAC_IAX_RESCATES.F_RESCATE_POLIZA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPIMPORTE", "pPIPENALI", "pTIPOOPER" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPIPENALI, pTIPOOPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPIMPORTE);
		cStmt.setObject(6, pPIPENALI);
		cStmt.setObject(7, pTIPOOPER);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_RESCATES__F_RESCATE_POLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPIPENALI, java.math.BigDecimal pTIPOOPER) throws Exception {
		return this.callPAC_IAX_RESCATES__F_RESCATE_POLIZA(pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPIPENALI,
				pTIPOOPER);
	}
	// --END-PAC_IAX_RESCATES.F_RESCATE_POLIZA

	// --START-PAC_IAX_RESCATES.F_VALIDA_PERMITE_RESCATE(PSSEGURO, PNRIESGO, PFECHA,
	// PCCAUSIN, PIMPORTE)
	private HashMap callPAC_IAX_RESCATES__F_VALIDA_PERMITE_RESCATE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPIMPORTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_RESCATES.F_VALIDA_PERMITE_RESCATE(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPCCAUSIN", "pPIMPORTE" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPCCAUSIN, pPIMPORTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPCCAUSIN);
		cStmt.setObject(6, pPIMPORTE);
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

	public HashMap ejecutaPAC_IAX_RESCATES__F_VALIDA_PERMITE_RESCATE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPIMPORTE) throws Exception {
		return this.callPAC_IAX_RESCATES__F_VALIDA_PERMITE_RESCATE(pPSSEGURO, pPNRIESGO, pPFECHA, pPCCAUSIN, pPIMPORTE);
	}
	// --END-PAC_IAX_RESCATES.F_VALIDA_PERMITE_RESCATE

}
