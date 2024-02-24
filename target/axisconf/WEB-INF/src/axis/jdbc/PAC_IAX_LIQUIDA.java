//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LIQUIDA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LIQUIDA.class);
	private Connection conn = null;

	public PAC_IAX_LIQUIDA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LIQUIDA.F_GET_FECINILIQ()

	private HashMap callPAC_IAX_LIQUIDA__F_GET_FECINILIQ() throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_FECINILIQ(?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_FECINILIQ() throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_FECINILIQ();
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_FECINILIQ

	// --START-PAC_IAX_LIQUIDA.F_GET_PROC_CIERRES_LIQ(PMODO, PFECLIQ, PCEMPRES)

	private HashMap callPAC_IAX_LIQUIDA__F_GET_PROC_CIERRES_LIQ(java.math.BigDecimal pPMODO, java.sql.Date pPFECLIQ,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_PROC_CIERRES_LIQ(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMODO", "pPFECLIQ", "pPCEMPRES" },
				new Object[] { pPMODO, pPFECLIQ, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMODO);
		cStmt.setObject(3, pPFECLIQ);
		cStmt.setObject(4, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_PROC_CIERRES_LIQ(java.math.BigDecimal pPMODO, java.sql.Date pPFECLIQ,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_PROC_CIERRES_LIQ(pPMODO, pPFECLIQ, pPCEMPRES);
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_PROC_CIERRES_LIQ

	// --START-PAC_IAX_LIQUIDA.F_CONSULTARECIBOS(P_CEMPRES, P_SPRODUC, P_NPOLIZA,
	// P_CAGENTE, P_FEMIINI, P_FEMIFIN, P_FEFEINI, P_FEFEFIN, P_FCOBINI, P_FCOBFIN)

	private HashMap callPAC_IAX_LIQUIDA__F_CONSULTARECIBOS(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_CAGENTE,
			java.sql.Date pP_FEMIINI, java.sql.Date pP_FEMIFIN, java.sql.Date pP_FEFEINI, java.sql.Date pP_FEFEFIN,
			java.sql.Date pP_FCOBINI, java.sql.Date pP_FCOBFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_CONSULTARECIBOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_CEMPRES", "pP_SPRODUC", "pP_NPOLIZA", "pP_CAGENTE", "pP_FEMIINI", "pP_FEMIFIN",
						"pP_FEFEINI", "pP_FEFEFIN", "pP_FCOBINI", "pP_FCOBFIN" },
				new Object[] { pP_CEMPRES, pP_SPRODUC, pP_NPOLIZA, pP_CAGENTE, pP_FEMIINI, pP_FEMIFIN, pP_FEFEINI,
						pP_FEFEFIN, pP_FCOBINI, pP_FCOBFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
		cStmt.setObject(3, pP_SPRODUC);
		cStmt.setObject(4, pP_NPOLIZA);
		cStmt.setObject(5, pP_CAGENTE);
		cStmt.setObject(6, pP_FEMIINI);
		cStmt.setObject(7, pP_FEMIFIN);
		cStmt.setObject(8, pP_FEFEINI);
		cStmt.setObject(9, pP_FEFEFIN);
		cStmt.setObject(10, pP_FCOBINI);
		cStmt.setObject(11, pP_FCOBFIN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RECIBOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_CONSULTARECIBOS(java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_NPOLIZA, java.math.BigDecimal pP_CAGENTE,
			java.sql.Date pP_FEMIINI, java.sql.Date pP_FEMIFIN, java.sql.Date pP_FEFEINI, java.sql.Date pP_FEFEFIN,
			java.sql.Date pP_FCOBINI, java.sql.Date pP_FCOBFIN) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_CONSULTARECIBOS(pP_CEMPRES, pP_SPRODUC, pP_NPOLIZA, pP_CAGENTE, pP_FEMIINI,
				pP_FEMIFIN, pP_FEFEINI, pP_FEFEFIN, pP_FCOBINI, pP_FCOBFIN);
	}
	// --END-PAC_IAX_LIQUIDA.F_CONSULTARECIBOS
	// --START-PAC_IAX_LIQUIDA.F_DEL_CTAS(PCEMPRES, PCAGENTE, PNNUMLIN)

	private HashMap callPAC_IAX_LIQUIDA__F_DEL_CTAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNNUMLIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_DEL_CTAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCAGENTE", "pPNNUMLIN" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPNNUMLIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPNNUMLIN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_DEL_CTAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNNUMLIN) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_DEL_CTAS(pPCEMPRES, pPCAGENTE, pPNNUMLIN);
	}
	// --END-PAC_IAX_LIQUIDA.F_DEL_CTAS
	// --START-PAC_IAX_LIQUIDA.F_GET_ANYOCARANT(PCEMPRES)

	private HashMap callPAC_IAX_LIQUIDA__F_GET_ANYOCARANT(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_ANYOCARANT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PANYO"
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
			retVal.put("PANYO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PANYO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_ANYOCARANT(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_ANYOCARANT(pPCEMPRES);
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_ANYOCARANT
	// --START-PAC_IAX_LIQUIDA.F_GET_CTAS(PCAGENTE)

	private HashMap callPAC_IAX_LIQUIDA__F_GET_CTAS(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_CTAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCUENTASTEC"
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
			retVal.put("PCURCUENTASTEC", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCURCUENTASTEC", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_CTAS(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_CTAS(pPCAGENTE);
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_CTAS
	// --START-PAC_IAX_LIQUIDA.F_GET_DATOS_CTA(PCEMPRES, PCAGENTE, PNNUMLIN)

	private HashMap callPAC_IAX_LIQUIDA__F_GET_DATOS_CTA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNNUMLIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_DATOS_CTA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCAGENTE", "pPNNUMLIN" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPNNUMLIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPNNUMLIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURDETCUENT"
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
			retVal.put("PCURDETCUENT", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURDETCUENT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_DATOS_CTA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNNUMLIN) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_DATOS_CTA(pPCEMPRES, pPCAGENTE, pPNNUMLIN);
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_DATOS_CTA
	// --START-PAC_IAX_LIQUIDA.F_GET_MESCARANT(PCEMPRES)

	private HashMap callPAC_IAX_LIQUIDA__F_GET_MESCARANT(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_MESCARANT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PMES"
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
			retVal.put("PMES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PMES", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_MESCARANT(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_MESCARANT(pPCEMPRES);
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_MESCARANT
	// --START-PAC_IAX_LIQUIDA.F_GET_RECLIQUI()

	private HashMap callPAC_IAX_LIQUIDA__F_GET_RECLIQUI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_RECLIQUI(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SELRECLIQ".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_RECLIQUI() throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_RECLIQUI();
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_RECLIQUI
	// --START-PAC_IAX_LIQUIDA.F_GET_SALDOAGENTE(PCEMPRES, PCAGENTE)

	private HashMap callPAC_IAX_LIQUIDA__F_GET_SALDOAGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_SALDOAGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCAGENTE" }, new Object[] { pPCEMPRES, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSALDO"
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
			retVal.put("PSALDO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSALDO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_SALDOAGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_SALDOAGENTE(pPCEMPRES, pPCAGENTE);
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_SALDOAGENTE
	// --START-PAC_IAX_LIQUIDA.F_GET_SSEGURO(PNPOLIZA, PNCERTIF, PTABLAS)

	private HashMap callPAC_IAX_LIQUIDA__F_GET_SSEGURO(java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_GET_SSEGURO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNCERTIF", "pPTABLAS" },
				new Object[] { pPNPOLIZA, pPNCERTIF, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.setObject(4, pPTABLAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PSSEGURO"
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
			retVal.put("PSSEGURO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PSSEGURO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_GET_SSEGURO(java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPTABLAS) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_GET_SSEGURO(pPNPOLIZA, pPNCERTIF, pPTABLAS);
	}
	// --END-PAC_IAX_LIQUIDA.F_GET_SSEGURO
	// --START-PAC_IAX_LIQUIDA.F_LIQUIDA(P_RECIBOS)

	private HashMap callPAC_IAX_LIQUIDA__F_LIQUIDA(Object pP_RECIBOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_LIQUIDA(?, ?)}";

		logCall(callQuery, new String[] { "pP_RECIBOS" }, new Object[] { pP_RECIBOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_RECIBOS);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_LIQUIDA(Object pP_RECIBOS) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_LIQUIDA(pP_RECIBOS);
	}
	// --END-PAC_IAX_LIQUIDA.F_LIQUIDA

	// --START-PAC_IAX_LIQUIDA.F_LIQUIDALIQ(PCAGENTE, PCEMPRES, PMODO, PFECLIQ,
	// PSPROCES, PSUCURSAL, PADNSUC, PCLIQUIDO)
	private HashMap callPAC_IAX_LIQUIDA__F_LIQUIDALIQ(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPMODO, java.sql.Date pPFECLIQ, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPSUCURSAL, java.math.BigDecimal pPADNSUC, java.math.BigDecimal pPCLIQUIDO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_LIQUIDALIQ(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPCEMPRES", "pPMODO", "pPFECLIQ", "pPSPROCES", "pPSUCURSAL", "pPADNSUC",
						"pPCLIQUIDO" },
				new Object[] { pPCAGENTE, pPCEMPRES, pPMODO, pPFECLIQ, pPSPROCES, pPSUCURSAL, pPADNSUC, pPCLIQUIDO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPMODO);
		cStmt.setObject(5, pPFECLIQ);
		cStmt.setObject(6, pPSPROCES);
		cStmt.setObject(8, pPSUCURSAL);
		cStmt.setObject(9, pPADNSUC);
		cStmt.setObject(10, pPCLIQUIDO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PRUTA"
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
			retVal.put("PRUTA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PRUTA", null);
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

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_LIQUIDALIQ(java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPMODO, java.sql.Date pPFECLIQ, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPSUCURSAL, java.math.BigDecimal pPADNSUC, java.math.BigDecimal pPCLIQUIDO)
			throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_LIQUIDALIQ(pPCAGENTE, pPCEMPRES, pPMODO, pPFECLIQ, pPSPROCES, pPSUCURSAL,
				pPADNSUC, pPCLIQUIDO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LIQUIDA.F_LIQUIDALIQ

	// --START-PAC_IAX_LIQUIDA.F_SETOBJETORECLIQUI(P_NRECIBO, P_SMOVREC, P_LIQSELEC)

	private HashMap callPAC_IAX_LIQUIDA__F_SETOBJETORECLIQUI(java.math.BigDecimal pP_NRECIBO,
			java.math.BigDecimal pP_SMOVREC, java.math.BigDecimal pP_LIQSELEC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_SETOBJETORECLIQUI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NRECIBO", "pP_SMOVREC", "pP_LIQSELEC" },
				new Object[] { pP_NRECIBO, pP_SMOVREC, pP_LIQSELEC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NRECIBO);
		cStmt.setObject(3, pP_SMOVREC);
		cStmt.setObject(4, pP_LIQSELEC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_SETOBJETORECLIQUI(java.math.BigDecimal pP_NRECIBO,
			java.math.BigDecimal pP_SMOVREC, java.math.BigDecimal pP_LIQSELEC) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_SETOBJETORECLIQUI(pP_NRECIBO, pP_SMOVREC, pP_LIQSELEC);
	}
	// --END-PAC_IAX_LIQUIDA.F_SETOBJETORECLIQUI
	// --START-PAC_IAX_LIQUIDA.F_SET_CTA(PCEMPRES, PCAGENTE, PSSEGURO, PNNUMLIN,
	// PCDEBHAB, PIMPORTE, PNDOCUME, PTDESCRIP, PMODO, PNRECIBO, PNSINIES,
	// PCCONCEPTO, PFFECMOV, PFVALOR)

	private HashMap callPAC_IAX_LIQUIDA__F_SET_CTA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCDEBHAB,
			java.math.BigDecimal pPIMPORTE, String pPNDOCUME, String pPTDESCRIP, java.math.BigDecimal pPMODO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCCONCEPTO,
			java.sql.Date pPFFECMOV, java.sql.Date pPFVALOR, java.math.BigDecimal pPCFISCAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_SET_CTA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCAGENTE", "pPSSEGURO", "pPNNUMLIN", "pPCDEBHAB", "pPIMPORTE",
						"pPNDOCUME", "pPTDESCRIP", "pPMODO", "pPNRECIBO", "pPNSINIES", "pPCCONCEPTO", "pPFFECMOV",
						"pPFVALOR", "pPCFISCAL" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPSSEGURO, pPNNUMLIN, pPCDEBHAB, pPIMPORTE, pPNDOCUME, pPTDESCRIP,
						pPMODO, pPNRECIBO, pPNSINIES, pPCCONCEPTO, pPFFECMOV, pPFVALOR, pPCFISCAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPNNUMLIN);
		cStmt.setObject(6, pPCDEBHAB);
		cStmt.setObject(7, pPIMPORTE);
		cStmt.setObject(8, pPNDOCUME);
		cStmt.setObject(9, pPTDESCRIP);
		cStmt.setObject(10, pPMODO);
		cStmt.setObject(11, pPNRECIBO);
		cStmt.setObject(12, pPNSINIES);
		cStmt.setObject(13, pPCCONCEPTO);
		cStmt.setObject(14, pPFFECMOV);
		cStmt.setObject(15, pPFVALOR);
		cStmt.setObject(16, pPCFISCAL);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_SET_CTA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCDEBHAB,
			java.math.BigDecimal pPIMPORTE, String pPNDOCUME, String pPTDESCRIP, java.math.BigDecimal pPMODO,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCCONCEPTO,
			java.sql.Date pPFFECMOV, java.sql.Date pPFVALOR, java.math.BigDecimal pPCFISCAL) throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_SET_CTA(pPCEMPRES, pPCAGENTE, pPSSEGURO, pPNNUMLIN, pPCDEBHAB, pPIMPORTE,
				pPNDOCUME, pPTDESCRIP, pPMODO, pPNRECIBO, pPNSINIES, pPCCONCEPTO, pPFFECMOV, pPFVALOR, pPCFISCAL);
	}
	// --END-PAC_IAX_LIQUIDA.F_SET_CTA
	// --START-PAC_IAX_LIQUIDA.F_SET_RECLIQUI()

	private HashMap callPAC_IAX_LIQUIDA__F_SET_RECLIQUI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LIQUIDA.F_SET_RECLIQUI(?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__F_SET_RECLIQUI() throws Exception {
		return this.callPAC_IAX_LIQUIDA__F_SET_RECLIQUI();
	}
	// --END-PAC_IAX_LIQUIDA.F_SET_RECLIQUI
	// --START-PAC_IAX_LIQUIDA.P_LIQUIDA_MENS()

	private HashMap callPAC_IAX_LIQUIDA__P_LIQUIDA_MENS() throws Exception {
		String callQuery = "{call PAC_IAX_LIQUIDA.P_LIQUIDA_MENS()}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LIQUIDA__P_LIQUIDA_MENS() throws Exception {
		return this.callPAC_IAX_LIQUIDA__P_LIQUIDA_MENS();
	}
	// --END-PAC_IAX_LIQUIDA.P_LIQUIDA_MENS

	// --START-PAC_LIQUIDA.F_INSERT_LIQUIDAFACT_INTER(SPROCES, CAGENTE)
	private HashMap callPAC_LIQUIDA__F_INSERT_LIQUIDAFACT_INTER(String pSPROCES, java.math.BigDecimal pCAGENTE)
			throws Exception {
		String callQuery = "{?=call PAC_LIQUIDA.F_INSERT_LIQUIDAFACT_INTER(?, ?)}";

		logCall(callQuery, new String[] { "pSPROCES", "pCAGENTE" }, new Object[] { pSPROCES, pCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROCES);
		cStmt.setObject(3, pCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_LIQUIDA__F_INSERT_LIQUIDAFACT_INTER(String pSPROCES, java.math.BigDecimal pCAGENTE)
			throws Exception {
		return this.callPAC_LIQUIDA__F_INSERT_LIQUIDAFACT_INTER(pSPROCES, pCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_LIQUIDA.F_INSERT_LIQUIDAFACT_INTER
}
