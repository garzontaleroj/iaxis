
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_TRASPASOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_TRASPASOS.class);
	private Connection conn = null;

	public PAC_IAX_TRASPASOS(Connection conn) {
		this.conn = conn;
	}
	// --START-PAC_IAX_TRASPASOS.F_ANULAR_TRASPASO(PSTRAS, CMOTIVO)

	private HashMap callPAC_IAX_TRASPASOS__F_ANULAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pCMOTIVO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_ANULAR_TRASPASO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS", "pCMOTIVO" }, new Object[] { pPSTRAS, pCMOTIVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
		cStmt.setObject(3, pCMOTIVO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_ANULAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pCMOTIVO) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_ANULAR_TRASPASO(pPSTRAS, pCMOTIVO);
	}
	// --END-PAC_IAX_TRASPASOS.F_ANULAR_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_CONFIRMAR_TRASPASO(PSTRAS, PINOUT, PEXTERN)

	private HashMap callPAC_IAX_TRASPASOS__F_CONFIRMAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPINOUT, java.math.BigDecimal pPEXTERN) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_CONFIRMAR_TRASPASO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS", "pPINOUT", "pPEXTERN" },
				new Object[] { pPSTRAS, pPINOUT, pPEXTERN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
		cStmt.setObject(3, pPINOUT);
		cStmt.setObject(4, pPEXTERN);
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

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_CONFIRMAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPINOUT, java.math.BigDecimal pPEXTERN) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_CONFIRMAR_TRASPASO(pPSTRAS, pPINOUT, pPEXTERN);
	}
	// --END-PAC_IAX_TRASPASOS.F_CONFIRMAR_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_DEL_TRASPASO(PSTRAS)

	private HashMap callPAC_IAX_TRASPASOS__F_DEL_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_DEL_TRASPASO(?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS" }, new Object[] { pPSTRAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
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

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_DEL_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_DEL_TRASPASO(pPSTRAS);
	}
	// --END-PAC_IAX_TRASPASOS.F_DEL_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_DEMORAR_TRASPASO(PSTRAS, PINOUT, PEXTERN,
	// CMOTIVO)

	private HashMap callPAC_IAX_TRASPASOS__F_DEMORAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPINOUT, java.math.BigDecimal pPEXTERN, java.math.BigDecimal pCMOTIVO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_DEMORAR_TRASPASO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS", "pPINOUT", "pPEXTERN", "pCMOTIVO" },
				new Object[] { pPSTRAS, pPINOUT, pPEXTERN, pCMOTIVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
		cStmt.setObject(3, pPINOUT);
		cStmt.setObject(4, pPEXTERN);
		cStmt.setObject(5, pCMOTIVO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_DEMORAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPINOUT, java.math.BigDecimal pPEXTERN, java.math.BigDecimal pCMOTIVO)
			throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_DEMORAR_TRASPASO(pPSTRAS, pPINOUT, pPEXTERN, pCMOTIVO);
	}
	// --END-PAC_IAX_TRASPASOS.F_DEMORAR_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_DESCONFIRMAR_TRASPASO(PSTRAS)

	private HashMap callPAC_IAX_TRASPASOS__F_DESCONFIRMAR_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_DESCONFIRMAR_TRASPASO(?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS" }, new Object[] { pPSTRAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
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

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_DESCONFIRMAR_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_DESCONFIRMAR_TRASPASO(pPSTRAS);
	}
	// --END-PAC_IAX_TRASPASOS.F_DESCONFIRMAR_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_EJECUTAR_TRASPASO(PSTRAS, PSSEGURO, PNRIESGO,
	// PCAGRPRO, PCINOUT, PCTIPTRAS, PCEXTERN, PCTIPDER, PCTIPTRASSOL, PIIMPTEMP,
	// NPORCEN, NPARPLA, CCODPLA, CCOMPANI, CTIPBAN, CBANCAR, TPOLEXT, NCERTEXT,
	// PFEFECTO, PFVALMOV)

	private HashMap callPAC_IAX_TRASPASOS__F_EJECUTAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCAGRPRO,
			java.math.BigDecimal pPCINOUT, java.math.BigDecimal pPCTIPTRAS, java.math.BigDecimal pPCEXTERN,
			java.math.BigDecimal pPCTIPDER, java.math.BigDecimal pPCTIPTRASSOL, java.math.BigDecimal pPIIMPTEMP,
			java.math.BigDecimal pNPORCEN, java.math.BigDecimal pNPARPLA, java.math.BigDecimal pCCODPLA,
			java.math.BigDecimal pCCOMPANI, java.math.BigDecimal pCTIPBAN, String pCBANCAR, String pTPOLEXT,
			java.math.BigDecimal pNCERTEXT, java.sql.Date pPFEFECTO, java.sql.Date pPFVALMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_EJECUTAR_TRASPASO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSTRAS", "pPSSEGURO", "pPNRIESGO", "pPCAGRPRO", "pPCINOUT", "pPCTIPTRAS", "pPCEXTERN",
						"pPCTIPDER", "pPCTIPTRASSOL", "pPIIMPTEMP", "pNPORCEN", "pNPARPLA", "pCCODPLA", "pCCOMPANI",
						"pCTIPBAN", "pCBANCAR", "pTPOLEXT", "pNCERTEXT", "pPFEFECTO", "pPFVALMOV" },
				new Object[] { pPSTRAS, pPSSEGURO, pPNRIESGO, pPCAGRPRO, pPCINOUT, pPCTIPTRAS, pPCEXTERN, pPCTIPDER,
						pPCTIPTRASSOL, pPIIMPTEMP, pNPORCEN, pNPARPLA, pCCODPLA, pCCOMPANI, pCTIPBAN, pCBANCAR,
						pTPOLEXT, pNCERTEXT, pPFEFECTO, pPFVALMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCAGRPRO);
		cStmt.setObject(6, pPCINOUT);
		cStmt.setObject(7, pPCTIPTRAS);
		cStmt.setObject(8, pPCEXTERN);
		cStmt.setObject(9, pPCTIPDER);
		cStmt.setObject(10, pPCTIPTRASSOL);
		cStmt.setObject(11, pPIIMPTEMP);
		cStmt.setObject(12, pNPORCEN);
		cStmt.setObject(13, pNPARPLA);
		cStmt.setObject(14, pCCODPLA);
		cStmt.setObject(15, pCCOMPANI);
		cStmt.setObject(16, pCTIPBAN);
		cStmt.setObject(17, pCBANCAR);
		cStmt.setObject(18, pTPOLEXT);
		cStmt.setObject(19, pNCERTEXT);
		cStmt.setObject(20, pPFEFECTO);
		cStmt.setObject(21, pPFVALMOV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(22, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_EJECUTAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCAGRPRO,
			java.math.BigDecimal pPCINOUT, java.math.BigDecimal pPCTIPTRAS, java.math.BigDecimal pPCEXTERN,
			java.math.BigDecimal pPCTIPDER, java.math.BigDecimal pPCTIPTRASSOL, java.math.BigDecimal pPIIMPTEMP,
			java.math.BigDecimal pNPORCEN, java.math.BigDecimal pNPARPLA, java.math.BigDecimal pCCODPLA,
			java.math.BigDecimal pCCOMPANI, java.math.BigDecimal pCTIPBAN, String pCBANCAR, String pTPOLEXT,
			java.math.BigDecimal pNCERTEXT, java.sql.Date pPFEFECTO, java.sql.Date pPFVALMOV) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_EJECUTAR_TRASPASO(pPSTRAS, pPSSEGURO, pPNRIESGO, pPCAGRPRO, pPCINOUT,
				pPCTIPTRAS, pPCEXTERN, pPCTIPDER, pPCTIPTRASSOL, pPIIMPTEMP, pNPORCEN, pNPARPLA, pCCODPLA, pCCOMPANI,
				pCTIPBAN, pCBANCAR, pTPOLEXT, pNCERTEXT, pPFEFECTO, pPFVALMOV);
	}
	// --END-PAC_IAX_TRASPASOS.F_EJECUTAR_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_ENVIAR_TRASPASO(PSTRAS)

	private HashMap callPAC_IAX_TRASPASOS__F_ENVIAR_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_ENVIAR_TRASPASO(?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS" }, new Object[] { pPSTRAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
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

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_ENVIAR_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_ENVIAR_TRASPASO(pPSTRAS);
	}
	// --END-PAC_IAX_TRASPASOS.F_ENVIAR_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_GET_CCODPLA(PCCODPLA_DGS)

	private HashMap callPAC_IAX_TRASPASOS__F_GET_CCODPLA(String pPCCODPLA_DGS) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_GET_CCODPLA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODPLA_DGS" }, new Object[] { pPCCODPLA_DGS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODPLA_DGS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCCODPLA"
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
			retVal.put("PCCODPLA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCCODPLA", null);
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

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_GET_CCODPLA(String pPCCODPLA_DGS) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_GET_CCODPLA(pPCCODPLA_DGS);
	}
	// --END-PAC_IAX_TRASPASOS.F_GET_CCODPLA
	// --START-PAC_IAX_TRASPASOS.F_GET_TCOMPANI(PCCOMPANI_DGS)

	private HashMap callPAC_IAX_TRASPASOS__F_GET_TCOMPANI(String pPCCOMPANI_DGS) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_GET_TCOMPANI(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI_DGS" }, new Object[] { pPCCOMPANI_DGS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI_DGS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCCOMPANI"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTCOMPANI"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCTIPBAN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PCBANCAR"
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
			retVal.put("PCCOMPANI", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCCOMPANI", null);
		}
		try {
			retVal.put("PTCOMPANI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTCOMPANI", null);
		}
		try {
			retVal.put("PCTIPBAN", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCTIPBAN", null);
		}
		try {
			retVal.put("PCBANCAR", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCBANCAR", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_GET_TCOMPANI(String pPCCOMPANI_DGS) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_GET_TCOMPANI(pPCCOMPANI_DGS);
	}
	// --END-PAC_IAX_TRASPASOS.F_GET_TCOMPANI
	// --START-PAC_IAX_TRASPASOS.F_GET_TRASPASO(PSTRAS)

	private HashMap callPAC_IAX_TRASPASOS__F_GET_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_GET_TRASPASO(?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS" }, new Object[] { pPSTRAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_TRASPASOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_GET_TRASPASO(java.math.BigDecimal pPSTRAS) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_GET_TRASPASO(pPSTRAS);
	}
	// --END-PAC_IAX_TRASPASOS.F_GET_TRASPASO

	// --START-PAC_IAX_TRASPASOS.F_GET_TRASPASOS_POL(PSSEGURO, PMODO)

	private HashMap callPAC_IAX_TRASPASOS__F_GET_TRASPASOS_POL(java.math.BigDecimal pPSSEGURO, String pPMODO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_GET_TRASPASOS_POL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPMODO" }, new Object[] { pPSSEGURO, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TRASPASOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_GET_TRASPASOS_POL(java.math.BigDecimal pPSSEGURO, String pPMODO)
			throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_GET_TRASPASOS_POL(pPSSEGURO, pPMODO);
	}
	// --END-PAC_IAX_TRASPASOS.F_GET_TRASPASOS_POL

	// --START-PAC_IAX_TRASPASOS.F_GET_TRASPASOS(PSPRODUC, CRAMO, PFILTROPROD,
	// NPOLIZA, NCERTIF, PNNUMNIDE, PBUSCAR, PTIPOPERSONA, PSNIP, PCINOUT, PCESTADO,
	// PFSOLICI, PCTIPTRAS, PCTIPTRASSOL, PMODO)

	private HashMap callPAC_IAX_TRASPASOS__F_GET_TRASPASOS(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pCRAMO,
			String pPFILTROPROD, java.math.BigDecimal pNPOLIZA, java.math.BigDecimal pNCERTIF, String pPNNUMNIDE,
			String pPBUSCAR, java.math.BigDecimal pPTIPOPERSONA, String pPSNIP, java.math.BigDecimal pPCINOUT,
			java.math.BigDecimal pPCESTADO, java.sql.Date pPFSOLICI, java.math.BigDecimal pPCTIPTRAS,
			java.math.BigDecimal pPCTIPTRASSOL, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_GET_TRASPASOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pCRAMO", "pPFILTROPROD", "pNPOLIZA", "pNCERTIF", "pPNNUMNIDE", "pPBUSCAR",
						"pPTIPOPERSONA", "pPSNIP", "pPCINOUT", "pPCESTADO", "pPFSOLICI", "pPCTIPTRAS", "pPCTIPTRASSOL",
						"pPMODO" },
				new Object[] { pPSPRODUC, pCRAMO, pPFILTROPROD, pNPOLIZA, pNCERTIF, pPNNUMNIDE, pPBUSCAR, pPTIPOPERSONA,
						pPSNIP, pPCINOUT, pPCESTADO, pPFSOLICI, pPCTIPTRAS, pPCTIPTRASSOL, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pCRAMO);
		cStmt.setObject(4, pPFILTROPROD);
		cStmt.setObject(5, pNPOLIZA);
		cStmt.setObject(6, pNCERTIF);
		cStmt.setObject(7, pPNNUMNIDE);
		cStmt.setObject(8, pPBUSCAR);
		cStmt.setObject(9, pPTIPOPERSONA);
		cStmt.setObject(10, pPSNIP);
		cStmt.setObject(11, pPCINOUT);
		cStmt.setObject(12, pPCESTADO);
		cStmt.setObject(13, pPFSOLICI);
		cStmt.setObject(14, pPCTIPTRAS);
		cStmt.setObject(15, pPCTIPTRASSOL);
		cStmt.setObject(16, pPMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TRASPASOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_GET_TRASPASOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pCRAMO, String pPFILTROPROD, java.math.BigDecimal pNPOLIZA,
			java.math.BigDecimal pNCERTIF, String pPNNUMNIDE, String pPBUSCAR, java.math.BigDecimal pPTIPOPERSONA,
			String pPSNIP, java.math.BigDecimal pPCINOUT, java.math.BigDecimal pPCESTADO, java.sql.Date pPFSOLICI,
			java.math.BigDecimal pPCTIPTRAS, java.math.BigDecimal pPCTIPTRASSOL, String pPMODO) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_GET_TRASPASOS(pPSPRODUC, pCRAMO, pPFILTROPROD, pNPOLIZA, pNCERTIF,
				pPNNUMNIDE, pPBUSCAR, pPTIPOPERSONA, pPSNIP, pPCINOUT, pPCESTADO, pPFSOLICI, pPCTIPTRAS, pPCTIPTRASSOL,
				pPMODO);
	}
	// --END-PAC_IAX_TRASPASOS.F_GET_TRASPASOS
	// --START-PAC_IAX_TRASPASOS.F_INFORMAR_TRASPASO(PSTRAS, FANTIGI, IIMPANU,
	// NPARRET, IIMPRET, TMEMO, NPARPOS2006, PORCPOS2006, NPARANT2007, PORCANT2007)

	private HashMap callPAC_IAX_TRASPASOS__F_INFORMAR_TRASPASO(java.math.BigDecimal pPSTRAS, java.sql.Date pFANTIGI,
			java.math.BigDecimal pIIMPANU, java.math.BigDecimal pNPARRET, java.math.BigDecimal pIIMPRET, String pTMEMO,
			java.math.BigDecimal pNPARPOS2006, java.math.BigDecimal pPORCPOS2006, java.math.BigDecimal pNPARANT2007,
			java.math.BigDecimal pPORCANT2007) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_INFORMAR_TRASPASO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSTRAS", "pFANTIGI", "pIIMPANU", "pNPARRET", "pIIMPRET", "pTMEMO", "pNPARPOS2006",
						"pPORCPOS2006", "pNPARANT2007", "pPORCANT2007" },
				new Object[] { pPSTRAS, pFANTIGI, pIIMPANU, pNPARRET, pIIMPRET, pTMEMO, pNPARPOS2006, pPORCPOS2006,
						pNPARANT2007, pPORCANT2007 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
		cStmt.setObject(3, pFANTIGI);
		cStmt.setObject(4, pIIMPANU);
		cStmt.setObject(5, pNPARRET);
		cStmt.setObject(6, pIIMPRET);
		cStmt.setObject(7, pTMEMO);
		cStmt.setObject(8, pNPARPOS2006);
		cStmt.setObject(9, pPORCPOS2006);
		cStmt.setObject(10, pNPARANT2007);
		cStmt.setObject(11, pPORCANT2007);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_INFORMAR_TRASPASO(java.math.BigDecimal pPSTRAS, java.sql.Date pFANTIGI,
			java.math.BigDecimal pIIMPANU, java.math.BigDecimal pNPARRET, java.math.BigDecimal pIIMPRET, String pTMEMO,
			java.math.BigDecimal pNPARPOS2006, java.math.BigDecimal pPORCPOS2006, java.math.BigDecimal pNPARANT2007,
			java.math.BigDecimal pPORCANT2007) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_INFORMAR_TRASPASO(pPSTRAS, pFANTIGI, pIIMPANU, pNPARRET, pIIMPRET, pTMEMO,
				pNPARPOS2006, pPORCPOS2006, pNPARANT2007, pPORCANT2007);
	}
	// --END-PAC_IAX_TRASPASOS.F_INFORMAR_TRASPASO

	// --START-PAC_IAX_TRASPASOS.F_RECHAZAR_TRASPASO(PSTRAS, PINOUT, PEXTERN,
	// CMOTIVO)

	private HashMap callPAC_IAX_TRASPASOS__F_RECHAZAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPINOUT, java.math.BigDecimal pPEXTERN, java.math.BigDecimal pCMOTIVO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_RECHAZAR_TRASPASO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSTRAS", "pPINOUT", "pPEXTERN", "pCMOTIVO" },
				new Object[] { pPSTRAS, pPINOUT, pPEXTERN, pCMOTIVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTRAS);
		cStmt.setObject(3, pPINOUT);
		cStmt.setObject(4, pPEXTERN);
		cStmt.setObject(5, pCMOTIVO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_RECHAZAR_TRASPASO(java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPINOUT, java.math.BigDecimal pPEXTERN, java.math.BigDecimal pCMOTIVO)
			throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_RECHAZAR_TRASPASO(pPSTRAS, pPINOUT, pPEXTERN, pCMOTIVO);
	}
	// --END-PAC_IAX_TRASPASOS.F_RECHAZAR_TRASPASO
	// --START-PAC_IAX_TRASPASOS.F_SET_TRASPASO(PSSEGURO, PSPRODUC, PCAGRPRO,
	// PFSOLICI, PCINOUT, PCTIPTRAS, PCEXTERN, PCTIPDER, PCESTADO, PCTIPTRASSOL,
	// PIIMPTEMP, NPORCEN, NPARPLA, CCODPLA, TCCODPLA, CCOMPANI, TCOMPANI, CTIPBAN,
	// CBANCAR, TPOLEXT, NCERTEXT, FANTIGI, IIMPANU, NPARRET, IIMPRET, NPARPOS2006,
	// PORCPOS2006, NPARANT2007, PORCANT2007, TMEMO, NREF, CMOTIVO, FEFECTO, FVALOR,
	// PSTRAS)

	private HashMap callPAC_IAX_TRASPASOS__F_SET_TRASPASO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGRPRO, java.sql.Date pPFSOLICI,
			java.math.BigDecimal pPCINOUT, java.math.BigDecimal pPCTIPTRAS, java.math.BigDecimal pPCEXTERN,
			java.math.BigDecimal pPCTIPDER, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPTRASSOL,
			java.math.BigDecimal pPIIMPTEMP, java.math.BigDecimal pNPORCEN, java.math.BigDecimal pNPARPLA,
			java.math.BigDecimal pCCODPLA, String pTCCODPLA, java.math.BigDecimal pCCOMPANI, String pTCOMPANI,
			java.math.BigDecimal pCTIPBAN, String pCBANCAR, String pTPOLEXT, java.math.BigDecimal pNCERTEXT,
			java.sql.Date pFANTIGI, java.math.BigDecimal pIIMPANU, java.math.BigDecimal pNPARRET,
			java.math.BigDecimal pIIMPRET, java.math.BigDecimal pNPARPOS2006, java.math.BigDecimal pPORCPOS2006,
			java.math.BigDecimal pNPARANT2007, java.math.BigDecimal pPORCANT2007, String pTMEMO, String pNREF,
			java.math.BigDecimal pCMOTIVO, java.sql.Date pFEFECTO, java.sql.Date pFVALOR, java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPCTIPCONT, java.sql.Date pPFCONTIG, java.math.BigDecimal pPCTIPCAP,
			java.math.BigDecimal pPIMPORTE, java.sql.Date pPFPROPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRASPASOS.F_SET_TRASPASO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPSPRODUC", "pPCAGRPRO", "pPFSOLICI", "pPCINOUT", "pPCTIPTRAS",
						"pPCEXTERN", "pPCTIPDER", "pPCESTADO", "pPCTIPTRASSOL", "pPIIMPTEMP", "pNPORCEN", "pNPARPLA",
						"pCCODPLA", "pTCCODPLA", "pCCOMPANI", "pTCOMPANI", "pCTIPBAN", "pCBANCAR", "pTPOLEXT",
						"pNCERTEXT", "pFANTIGI", "pIIMPANU", "pNPARRET", "pIIMPRET", "pNPARPOS2006", "pPORCPOS2006",
						"pNPARANT2007", "pPORCANT2007", "pTMEMO", "pNREF", "pCMOTIVO", "pFEFECTO", "pFVALOR", "pPSTRAS",
						"pPCTIPCONT", "pPFCONTIG", "pPCTIPCAP", "pPIMPORTE", "pPFPROPAG" },
				new Object[] { pPSSEGURO, pPSPRODUC, pPCAGRPRO, pPFSOLICI, pPCINOUT, pPCTIPTRAS, pPCEXTERN, pPCTIPDER,
						pPCESTADO, pPCTIPTRASSOL, pPIIMPTEMP, pNPORCEN, pNPARPLA, pCCODPLA, pTCCODPLA, pCCOMPANI,
						pTCOMPANI, pCTIPBAN, pCBANCAR, pTPOLEXT, pNCERTEXT, pFANTIGI, pIIMPANU, pNPARRET, pIIMPRET,
						pNPARPOS2006, pPORCPOS2006, pNPARANT2007, pPORCANT2007, pTMEMO, pNREF, pCMOTIVO, pFEFECTO,
						pFVALOR, pPSTRAS, pPCTIPCONT, pPFCONTIG, pPCTIPCAP, pPIMPORTE, pPFPROPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCAGRPRO);
		cStmt.setObject(5, pPFSOLICI);
		cStmt.setObject(6, pPCINOUT);
		cStmt.setObject(7, pPCTIPTRAS);
		cStmt.setObject(8, pPCEXTERN);
		cStmt.setObject(9, pPCTIPDER);
		cStmt.setObject(10, pPCESTADO);
		cStmt.setObject(11, pPCTIPTRASSOL);
		cStmt.setObject(12, pPIIMPTEMP);
		cStmt.setObject(13, pNPORCEN);
		cStmt.setObject(14, pNPARPLA);
		cStmt.setObject(15, pCCODPLA);
		cStmt.setObject(16, pTCCODPLA);
		cStmt.setObject(17, pCCOMPANI);
		cStmt.setObject(18, pTCOMPANI);
		cStmt.setObject(19, pCTIPBAN);
		cStmt.setObject(20, pCBANCAR);
		cStmt.setObject(21, pTPOLEXT);
		cStmt.setObject(22, pNCERTEXT);
		cStmt.setObject(23, pFANTIGI);
		cStmt.setObject(24, pIIMPANU);
		cStmt.setObject(25, pNPARRET);
		cStmt.setObject(26, pIIMPRET);
		cStmt.setObject(27, pNPARPOS2006);
		cStmt.setObject(28, pPORCPOS2006);
		cStmt.setObject(29, pNPARANT2007);
		cStmt.setObject(30, pPORCANT2007);
		cStmt.setObject(31, pTMEMO);
		cStmt.setObject(32, pNREF);
		cStmt.setObject(33, pCMOTIVO);
		cStmt.setObject(34, pFEFECTO);
		cStmt.setObject(35, pFVALOR);
		cStmt.setObject(36, pPSTRAS);
		cStmt.setObject(37, pPCTIPCONT);
		cStmt.setObject(38, pPFCONTIG);
		cStmt.setObject(39, pPCTIPCAP);
		cStmt.setObject(40, pPIMPORTE);
		cStmt.setObject(41, pPFPROPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(42, java.sql.Types.NUMERIC); // Valor de "PSTRAS_OUT"
		cStmt.registerOutParameter(43, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSTRAS_OUT", cStmt.getObject(42));
		} catch (SQLException e) {
			retVal.put("PSTRAS_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(43));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TRASPASOS__F_SET_TRASPASO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGRPRO, java.sql.Date pPFSOLICI,
			java.math.BigDecimal pPCINOUT, java.math.BigDecimal pPCTIPTRAS, java.math.BigDecimal pPCEXTERN,
			java.math.BigDecimal pPCTIPDER, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPTRASSOL,
			java.math.BigDecimal pPIIMPTEMP, java.math.BigDecimal pNPORCEN, java.math.BigDecimal pNPARPLA,
			java.math.BigDecimal pCCODPLA, String pTCCODPLA, java.math.BigDecimal pCCOMPANI, String pTCOMPANI,
			java.math.BigDecimal pCTIPBAN, String pCBANCAR, String pTPOLEXT, java.math.BigDecimal pNCERTEXT,
			java.sql.Date pFANTIGI, java.math.BigDecimal pIIMPANU, java.math.BigDecimal pNPARRET,
			java.math.BigDecimal pIIMPRET, java.math.BigDecimal pNPARPOS2006, java.math.BigDecimal pPORCPOS2006,
			java.math.BigDecimal pNPARANT2007, java.math.BigDecimal pPORCANT2007, String pTMEMO, String pNREF,
			java.math.BigDecimal pCMOTIVO, java.sql.Date pFEFECTO, java.sql.Date pFVALOR, java.math.BigDecimal pPSTRAS,
			java.math.BigDecimal pPCTIPCONT, java.sql.Date pPFCONTIG, java.math.BigDecimal pPCTIPCAP,
			java.math.BigDecimal pPIMPORTE, java.sql.Date pPFPROPAG) throws Exception {
		return this.callPAC_IAX_TRASPASOS__F_SET_TRASPASO(pPSSEGURO, pPSPRODUC, pPCAGRPRO, pPFSOLICI, pPCINOUT,
				pPCTIPTRAS, pPCEXTERN, pPCTIPDER, pPCESTADO, pPCTIPTRASSOL, pPIIMPTEMP, pNPORCEN, pNPARPLA, pCCODPLA,
				pTCCODPLA, pCCOMPANI, pTCOMPANI, pCTIPBAN, pCBANCAR, pTPOLEXT, pNCERTEXT, pFANTIGI, pIIMPANU, pNPARRET,
				pIIMPRET, pNPARPOS2006, pPORCPOS2006, pNPARANT2007, pPORCANT2007, pTMEMO, pNREF, pCMOTIVO, pFEFECTO,
				pFVALOR, pPSTRAS, pPCTIPCONT, pPFCONTIG, pPCTIPCAP, pPIMPORTE, pPFPROPAG);
	}
	// --END-PAC_IAX_TRASPASOS.F_SET_TRASPASO

}
