package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_RENTAS extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_RENTAS.class);
	private Connection conn = null;

	public PAC_IAX_RENTAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_RENTAS.F_EDADASEG(PSSEGURO, PNRIESGO)
	private HashMap callPAC_IAX_RENTAS__F_EDADASEG(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_EDADASEG(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PEDADASEG"
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
			retVal.put("PEDADASEG", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PEDADASEG", null);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_EDADASEG(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO)
			throws Exception {
		return this.callPAC_IAX_RENTAS__F_EDADASEG(pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_RENTAS.F_EDADASEG

	// --START-PAC_IAX_RENTAS.F_GET_CONSULTAPAGOS(PCEMPRES, PCRAMO, PSPRODUC,
	// PNPOLIZA, PNCERTIF)
	private HashMap callPAC_IAX_RENTAS__F_GET_CONSULTAPAGOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_CONSULTAPAGOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF" },
				new Object[] { pPCEMPRES, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNCERTIF);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_CONSULTAPAGOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_CONSULTAPAGOS(pPCEMPRES, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF);
	}

	// --END-PAC_IAX_RENTAS.F_GET_CONSULTAPAGOS
	// --START-PAC_IAX_RENTAS.F_GET_DAT_POLREN(PSRECREN)
	private HashMap callPAC_IAX_RENTAS__F_GET_DAT_POLREN(java.math.BigDecimal pPSRECREN) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_DAT_POLREN(?, ?)}";

		logCall(callQuery, new String[] { "pPSRECREN" }, new Object[] { pPSRECREN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRECREN);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_DAT_POLREN(java.math.BigDecimal pPSRECREN) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_DAT_POLREN(pPSRECREN);
	}

	// --END-PAC_IAX_RENTAS.F_GET_DAT_POLREN
	// --START-PAC_IAX_RENTAS.F_GET_DAT_RENTA(PSSEGURO)
	private HashMap callPAC_IAX_RENTAS__F_GET_DAT_RENTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_DAT_RENTA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_DAT_RENTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_DAT_RENTA(pPSSEGURO);
	}

	// --END-PAC_IAX_RENTAS.F_GET_DAT_RENTA
	// --START-PAC_IAX_RENTAS.F_GET_DETPAGO_RENTA(PSSEGURO, PSRECREN)
	private HashMap callPAC_IAX_RENTAS__F_GET_DETPAGO_RENTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSRECREN) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_DETPAGO_RENTA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSRECREN" }, new Object[] { pPSSEGURO, pPSRECREN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSRECREN);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_DETPAGO_RENTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSRECREN) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_DETPAGO_RENTA(pPSSEGURO, pPSRECREN);
	}

	// --END-PAC_IAX_RENTAS.F_GET_DETPAGO_RENTA
	// --START-PAC_IAX_RENTAS.F_GET_MOV_RECREN(PSRECREN)
	private HashMap callPAC_IAX_RENTAS__F_GET_MOV_RECREN(java.math.BigDecimal pPSRECREN) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_MOV_RECREN(?, ?)}";

		logCall(callQuery, new String[] { "pPSRECREN" }, new Object[] { pPSRECREN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRECREN);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_MOV_RECREN(java.math.BigDecimal pPSRECREN) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_MOV_RECREN(pPSRECREN);
	}

	// --END-PAC_IAX_RENTAS.F_GET_MOV_RECREN
	// --START-PAC_IAX_RENTAS.F_GET_PAGOS_RENTA(PSSEGURO)
	private HashMap callPAC_IAX_RENTAS__F_GET_PAGOS_RENTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_PAGOS_RENTA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_PAGOS_RENTA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_PAGOS_RENTA(pPSSEGURO);
	}

	// --END-PAC_IAX_RENTAS.F_GET_PAGOS_RENTA
	// --START-PAC_IAX_RENTAS.F_GET_PRODRENTAS(PCEMPRES, PCRAMO, PSPRODUC)
	private HashMap callPAC_IAX_RENTAS__F_GET_PRODRENTAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_PRODRENTAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCRAMO", "pPSPRODUC" },
				new Object[] { pPCEMPRES, pPCRAMO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_PRODRENTAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_PRODRENTAS(pPCEMPRES, pPCRAMO, pPSPRODUC);
	}

	// --END-PAC_IAX_RENTAS.F_GET_PRODRENTAS
	// --START-PAC_IAX_RENTAS.F_SETOBJETOPRODRENTA(PSPRODUC, PCSELECC)
	private HashMap callPAC_IAX_RENTAS__F_SETOBJETOPRODRENTA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCSELECC) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_SETOBJETOPRODRENTA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCSELECC" }, new Object[] { pPSPRODUC, pPCSELECC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCSELECC);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_SETOBJETOPRODRENTA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCSELECC) throws Exception {
		return this.callPAC_IAX_RENTAS__F_SETOBJETOPRODRENTA(pPSPRODUC, pPCSELECC);
	}
	// --END-PAC_IAX_RENTAS.F_SETOBJETOPRODRENTA

	// --START-PAC_IAX_RENTAS.F_SET_RENTAS(PCEMPRES, PFECHA, PCTIPO, PSPROCES)
	private HashMap callPAC_IAX_RENTAS__F_SET_RENTAS(java.math.BigDecimal pPCEMPRES, java.sql.Date pPFECHA,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPSPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_SET_RENTAS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFECHA", "pPCTIPO", "pPSPROCES" },
				new Object[] { pPCEMPRES, pPFECHA, pPCTIPO, pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFECHA);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPSPROCES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "NOMMAP1"
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
			retVal.put("NOMMAP1", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("NOMMAP1", null);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_SET_RENTAS(java.math.BigDecimal pPCEMPRES, java.sql.Date pPFECHA,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPSPROCES) throws Exception {
		return this.callPAC_IAX_RENTAS__F_SET_RENTAS(pPCEMPRES, pPFECHA, pPCTIPO, pPSPROCES);
	}
	// --END-PAC_IAX_RENTAS.F_SET_RENTAS

	// --START-PAC_IAX_RENTAS.F_GET_CAB_RENTA(PSRECREN)
	private HashMap callPAC_IAX_RENTAS__F_GET_CAB_RENTA(java.math.BigDecimal pPSRECREN) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_CAB_RENTA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSRECREN" }, new Object[] { pPSRECREN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRECREN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CABRENTA".toUpperCase())); // Valor de "OOCABRENTA"
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
			retVal.put("OOCABRENTA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OOCABRENTA", null);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_CAB_RENTA(java.math.BigDecimal pPSRECREN) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_CAB_RENTA(pPSRECREN);
	}
	// --END-PAC_IAX_RENTAS.F_GET_CAB_RENTA

	// --START-PAC_IAX_RENTAS.F_GET_PAGORENTA(PSRECREN)
	private HashMap callPAC_IAX_RENTAS__F_GET_PAGORENTA(java.math.BigDecimal pPSRECREN) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_PAGORENTA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSRECREN" }, new Object[] { pPSRECREN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRECREN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PAGORENTA".toUpperCase())); // Valor de "OOPAGORENTA"
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
			retVal.put("OOPAGORENTA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OOPAGORENTA", null);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_PAGORENTA(java.math.BigDecimal pPSRECREN) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_PAGORENTA(pPSRECREN);
	}
	// --END-PAC_IAX_RENTAS.F_GET_PAGORENTA

	// --START-PAC_IAX_RENTAS.F_GET_CONSULTAPAGOSRENTA(PCEMPRES, PSPRODUC, PNPOLIZA,
	// PNCERTIF, PCESTADO)
	private HashMap callPAC_IAX_RENTAS__F_GET_CONSULTAPAGOSRENTA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_GET_CONSULTAPAGOSRENTA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPCESTADO" },
				new Object[] { pPCEMPRES, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPNCERTIF);
		cStmt.setObject(6, pPCESTADO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PAGORENTA".toUpperCase())); // Valor de "OTPAGORENTA"
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
			retVal.put("OTPAGORENTA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("OTPAGORENTA", null);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_GET_CONSULTAPAGOSRENTA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_RENTAS__F_GET_CONSULTAPAGOSRENTA(pPCEMPRES, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPCESTADO);
	}
	// --END-PAC_IAX_RENTAS.F_GET_CONSULTAPAGOSRENTA

	// --START-PAC_IAX_RENTAS.F_ACT_PAGORENTA(PSRECREN, PCTIPBAN, PCUENTA, PBASE,
	// PPORCENTAJE, PBRUTO, PRETENCION, PNETO, PESTPAG, PFECHAMOV)
	private HashMap callPAC_IAX_RENTAS__F_ACT_PAGORENTA(java.math.BigDecimal pPSRECREN, java.math.BigDecimal pPCTIPBAN,
			String pPCUENTA, java.math.BigDecimal pPBASE, java.math.BigDecimal pPPORCENTAJE,
			java.math.BigDecimal pPBRUTO, java.math.BigDecimal pPRETENCION, java.math.BigDecimal pPNETO,
			java.math.BigDecimal pPESTPAG, java.sql.Date pPFECHAMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_ACT_PAGORENTA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSRECREN", "pPCTIPBAN", "pPCUENTA", "pPBASE", "pPPORCENTAJE", "pPBRUTO", "pPRETENCION",
						"pPNETO", "pPESTPAG", "pPFECHAMOV" },
				new Object[] { pPSRECREN, pPCTIPBAN, pPCUENTA, pPBASE, pPPORCENTAJE, pPBRUTO, pPRETENCION, pPNETO,
						pPESTPAG, pPFECHAMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRECREN);
		cStmt.setObject(3, pPCTIPBAN);
		cStmt.setObject(4, pPCUENTA);
		cStmt.setObject(5, pPBASE);
		cStmt.setObject(6, pPPORCENTAJE);
		cStmt.setObject(7, pPBRUTO);
		cStmt.setObject(8, pPRETENCION);
		cStmt.setObject(9, pPNETO);
		cStmt.setObject(10, pPESTPAG);
		cStmt.setObject(11, pPFECHAMOV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_ACT_PAGORENTA(java.math.BigDecimal pPSRECREN,
			java.math.BigDecimal pPCTIPBAN, String pPCUENTA, java.math.BigDecimal pPBASE,
			java.math.BigDecimal pPPORCENTAJE, java.math.BigDecimal pPBRUTO, java.math.BigDecimal pPRETENCION,
			java.math.BigDecimal pPNETO, java.math.BigDecimal pPESTPAG, java.sql.Date pPFECHAMOV) throws Exception {
		return this.callPAC_IAX_RENTAS__F_ACT_PAGORENTA(pPSRECREN, pPCTIPBAN, pPCUENTA, pPBASE, pPPORCENTAJE, pPBRUTO,
				pPRETENCION, pPNETO, pPESTPAG, pPFECHAMOV);
	}

	// --END-PAC_IAX_RENTAS.F_ACT_PAGORENTA
	// --START-PAC_IAX_RENTAS.F_BLOQ_PROXPAGOS(PSSEGURO)
	private HashMap callPAC_IAX_RENTAS__F_BLOQ_PROXPAGOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_BLOQ_PROXPAGOS(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_BLOQ_PROXPAGOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_RENTAS__F_BLOQ_PROXPAGOS(pPSSEGURO);
	}

	// --END-PAC_IAX_RENTAS.F_BLOQ_PROXPAGOS
	// --START-PAC_IAX_RENTAS.F_CALC_RENTAS(PSRECREN, PSSEGURO, PCTIPCALC, PCTIPBAN)
	private HashMap callPAC_IAX_RENTAS__F_CALC_RENTAS(java.math.BigDecimal pPSRECREN, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPCALC, java.math.BigDecimal pPCTIPBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_CALC_RENTAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSRECREN", "pPSSEGURO", "pPCTIPCALC", "pPCTIPBAN" },
				new Object[] { pPSRECREN, pPSSEGURO, pPCTIPCALC, pPCTIPBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRECREN);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPCTIPCALC);
		cStmt.setObject(5, pPCTIPBAN);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_CALC_RENTAS(java.math.BigDecimal pPSRECREN, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPCALC, java.math.BigDecimal pPCTIPBAN) throws Exception {
		return this.callPAC_IAX_RENTAS__F_CALC_RENTAS(pPSRECREN, pPSSEGURO, pPCTIPCALC, pPCTIPBAN);
	}
	// --END-PAC_IAX_RENTAS.F_CALC_RENTAS

	// --START-PAC_IAX_RENTAS.F_ACTUALIZA_TIPOCALCUL(PSSEGURO, PTIPOCALCUL)
	private HashMap callPAC_IAX_RENTAS__F_ACTUALIZA_TIPOCALCUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPTIPOCALCUL) throws Exception {
		String callQuery = "{?=call PAC_IAX_RENTAS.F_ACTUALIZA_TIPOCALCUL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTIPOCALCUL" }, new Object[] { pPSSEGURO, pPTIPOCALCUL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTIPOCALCUL);
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

	public HashMap ejecutaPAC_IAX_RENTAS__F_ACTUALIZA_TIPOCALCUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPTIPOCALCUL) throws Exception {
		return this.callPAC_IAX_RENTAS__F_ACTUALIZA_TIPOCALCUL(pPSSEGURO, pPTIPOCALCUL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RENTAS.F_ACTUALIZA_TIPOCALCUL

}
