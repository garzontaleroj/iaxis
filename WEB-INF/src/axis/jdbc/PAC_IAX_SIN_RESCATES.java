package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_RESCATES extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_SIN_RESCATES.class);
	private Connection conn = null;

	public PAC_IAX_SIN_RESCATES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_RESCATES.F_RESCATE_POLIZA(PSSEGURO, PNRIESGO, PFECHA,
	// PIMPORTE, PIPENALI, TIPOOPER, PIMPRCM, PPCTRETEN, PCMOTRESC, PFONDOSINFO,
	// PCTIPCAL)
	private HashMap callPAC_IAX_SIN_RESCATES__F_RESCATE_POLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPIPENALI, java.math.BigDecimal pTIPOOPER, java.math.BigDecimal pPIMPRCM,
			java.math.BigDecimal pPPCTRETEN, java.math.BigDecimal pPCMOTRESC, Object pPFONDOSINFO,
			java.math.BigDecimal pPCTIPCAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_RESCATES.F_RESCATE_POLIZA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPIMPORTE", "pPIPENALI", "pTIPOOPER", "pPIMPRCM",
						"pPPCTRETEN", "pPCMOTRESC", "pPFONDOSINFO", "pPCTIPCAL" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPIPENALI, pTIPOOPER, pPIMPRCM, pPPCTRETEN,
						pPCMOTRESC, pPFONDOSINFO, pPCTIPCAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPIMPORTE);
		cStmt.setObject(6, pPIPENALI);
		cStmt.setObject(7, pTIPOOPER);
		cStmt.setObject(9, pPIMPRCM);
		cStmt.setObject(10, pPPCTRETEN);
		cStmt.setObject(11, pPCMOTRESC);
		cStmt.setObject(12, pPFONDOSINFO);
		cStmt.setObject(13, pPCTIPCAL);
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

	public HashMap ejecutaPAC_IAX_SIN_RESCATES__F_RESCATE_POLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPIPENALI, java.math.BigDecimal pTIPOOPER, java.math.BigDecimal pPIMPRCM,
			java.math.BigDecimal pPPCTRETEN, java.math.BigDecimal pPCMOTRESC, Object pPFONDOSINFO,
			java.math.BigDecimal pPCTIPCAL) throws Exception {
		return this.callPAC_IAX_SIN_RESCATES__F_RESCATE_POLIZA(pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPIPENALI,
				pTIPOOPER, pPIMPRCM, pPPCTRETEN, pPCMOTRESC, pPFONDOSINFO, pPCTIPCAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_RESCATES.F_RESCATE_POLIZA

	// --START-PAC_IAX_SIN_RESCATES.F_VALIDA_PERMITE_RESCATE(PSSEGURO, PNRIESGO,
	// PFECHA, PCCAUSIN, PIMPORTE, PFONDOSINFO, PCTIPCAL)
	private HashMap callPAC_IAX_SIN_RESCATES__F_VALIDA_PERMITE_RESCATE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPIMPORTE, Object pPFONDOSINFO, java.math.BigDecimal pPCTIPCAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_RESCATES.F_VALIDA_PERMITE_RESCATE(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPCCAUSIN", "pPIMPORTE", "pPFONDOSINFO",
						"pPCTIPCAL" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPCCAUSIN, pPIMPORTE, pPFONDOSINFO, pPCTIPCAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPCCAUSIN);
		cStmt.setObject(6, pPIMPORTE);
		cStmt.setObject(7, pPFONDOSINFO);
		cStmt.setObject(8, pPCTIPCAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIN_RESCATES__F_VALIDA_PERMITE_RESCATE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPIMPORTE, Object pPFONDOSINFO, java.math.BigDecimal pPCTIPCAL) throws Exception {
		return this.callPAC_IAX_SIN_RESCATES__F_VALIDA_PERMITE_RESCATE(pPSSEGURO, pPNRIESGO, pPFECHA, pPCCAUSIN,
				pPIMPORTE, pPFONDOSINFO, pPCTIPCAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_RESCATES.F_VALIDA_PERMITE_RESCATE

	// --START-PAC_IAX_SIN_RESCATES.F_VALOR_SIMULACION(PSSEGURO, PNRIESGO, PFECHA,
	// PIMPORTE, PCCAUSIN, PCTIPCAL, PIMPPENALI, PIMPRCM, PPCTRETEN)
	private HashMap callPAC_IAX_SIN_RESCATES__F_VALOR_SIMULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCTIPCAL, java.math.BigDecimal pPIMPPENALI,
			java.math.BigDecimal pPIMPRCM, java.math.BigDecimal pPPCTRETEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_RESCATES.F_VALOR_SIMULACION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPIMPORTE", "pPCCAUSIN", "pPCTIPCAL",
						"pPIMPPENALI", "pPIMPRCM", "pPPCTRETEN" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPCCAUSIN, pPCTIPCAL, pPIMPPENALI, pPIMPRCM,
						pPPCTRETEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPIMPORTE);
		cStmt.setObject(6, pPCCAUSIN);
		cStmt.setObject(7, pPCTIPCAL);
		cStmt.setObject(9, pPIMPPENALI);
		cStmt.setObject(10, pPIMPRCM);
		cStmt.setObject(11, pPPCTRETEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SIMRESCATE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIN_RESCATES__F_VALOR_SIMULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCCAUSIN, java.math.BigDecimal pPCTIPCAL, java.math.BigDecimal pPIMPPENALI,
			java.math.BigDecimal pPIMPRCM, java.math.BigDecimal pPPCTRETEN) throws Exception {
		return this.callPAC_IAX_SIN_RESCATES__F_VALOR_SIMULACION(pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPCCAUSIN,
				pPCTIPCAL, pPIMPPENALI, pPIMPRCM, pPPCTRETEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_RESCATES.F_VALOR_SIMULACION

}
