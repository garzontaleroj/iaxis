package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FE_VIDA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ANULACIONES.class);
	private Connection conn = null;

	public PAC_IAX_FE_VIDA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_FE_VIDA.F_GENERAR_FE_VIDA(PSPROCES, PCEMPRES, PCRAMO,
	// PSPRODUC, PCAGENTE, PNPOLIZA, PNCERTIF, PFHASTA, PNGENERAR)
	private HashMap callPAC_IAX_FE_VIDA__F_GENERAR_FE_VIDA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.sql.Date pPFHASTA, java.math.BigDecimal pPNGENERAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_FE_VIDA.F_GENERAR_FE_VIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPCAGENTE", "pPNPOLIZA", "pPNCERTIF",
						"pPFHASTA", "pPNGENERAR" },
				new Object[] { pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC, pPCAGENTE, pPNPOLIZA, pPNCERTIF, pPFHASTA,
						pPNGENERAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCAGENTE);
		cStmt.setObject(7, pPNPOLIZA);
		cStmt.setObject(8, pPNCERTIF);
		cStmt.setObject(9, pPFHASTA);
		cStmt.setObject(10, pPNGENERAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "SPROCES"
		cStmt.registerOutParameter(12, java.sql.Types.VARCHAR); // Valor de "PNOMFICH"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "VTIMP"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("SPROCES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("SPROCES", null);
		}
		try {
			retVal.put("PNOMFICH", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PNOMFICH", null);
		}
		try {
			retVal.put("VTIMP", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("VTIMP", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FE_VIDA__F_GENERAR_FE_VIDA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.sql.Date pPFHASTA, java.math.BigDecimal pPNGENERAR) throws Exception {
		return this.callPAC_IAX_FE_VIDA__F_GENERAR_FE_VIDA(pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC, pPCAGENTE,
				pPNPOLIZA, pPNCERTIF, pPFHASTA, pPNGENERAR);
	}
	// --END-PAC_IAX_FE_VIDA.F_GENERAR_FE_VIDA

	// --START-PAC_IAX_FE_VIDA.F_GET_DATOS_FE_VIDA(PSPROCES, PCEMPRES, PCRAMO,
	// PSPRODUC, PCAGENTE, PNPOLIZA, PNCERTIF, PFHASTA, PNGENERAR, PNPANTALLA)
	private HashMap callPAC_IAX_FE_VIDA__F_GET_DATOS_FE_VIDA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.sql.Date pPFHASTA, java.math.BigDecimal pPNGENERAR, java.math.BigDecimal pPNPANTALLA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FE_VIDA.F_GET_DATOS_FE_VIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPCAGENTE", "pPNPOLIZA", "pPNCERTIF",
						"pPFHASTA", "pPNGENERAR", "pPNPANTALLA" },
				new Object[] { pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC, pPCAGENTE, pPNPOLIZA, pPNCERTIF, pPFHASTA,
						pPNGENERAR, pPNPANTALLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCAGENTE);
		cStmt.setObject(7, pPNPOLIZA);
		cStmt.setObject(8, pPNCERTIF);
		cStmt.setObject(9, pPFHASTA);
		cStmt.setObject(10, pPNGENERAR);
		cStmt.setObject(11, pPNPANTALLA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FE_VIDA__F_GET_DATOS_FE_VIDA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.sql.Date pPFHASTA, java.math.BigDecimal pPNGENERAR, java.math.BigDecimal pPNPANTALLA)
			throws Exception {
		return this.callPAC_IAX_FE_VIDA__F_GET_DATOS_FE_VIDA(pPSPROCES, pPCEMPRES, pPCRAMO, pPSPRODUC, pPCAGENTE,
				pPNPOLIZA, pPNCERTIF, pPFHASTA, pPNGENERAR, pPNPANTALLA);
	}
	// --END-PAC_IAX_FE_VIDA.F_GET_DATOS_FE_VIDA

	// --START-PAC_IAX_FE_VIDA.F_CONFIRMAR_FE_VIDA(PNPOLIZA, PNCERTIF, PTLISTA)
	private HashMap callPAC_IAX_FE_VIDA__F_CONFIRMAR_FE_VIDA(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPTLISTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FE_VIDA.F_CONFIRMAR_FE_VIDA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNCERTIF", "pPTLISTA" },
				new Object[] { pPNPOLIZA, pPNCERTIF, pPTLISTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.setObject(4, pPTLISTA);
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

	public HashMap ejecutaPAC_IAX_FE_VIDA__F_CONFIRMAR_FE_VIDA(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPTLISTA) throws Exception {
		return this.callPAC_IAX_FE_VIDA__F_CONFIRMAR_FE_VIDA(pPNPOLIZA, pPNCERTIF, pPTLISTA);
	}
	// --END-PAC_IAX_FE_VIDA.F_CONFIRMAR_FE_VIDA

	// --START-PAC_IAX_FE_VIDA.F_PERCEPTORES_RENTA(PSSEGURO)
	private HashMap callPAC_IAX_FE_VIDA__F_PERCEPTORES_RENTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_FE_VIDA.F_PERCEPTORES_RENTA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_FE_VIDA__F_PERCEPTORES_RENTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_FE_VIDA__F_PERCEPTORES_RENTA(pPSSEGURO);
	}
	// --END-PAC_IAX_FE_VIDA.F_PERCEPTORES_RENTA

}
