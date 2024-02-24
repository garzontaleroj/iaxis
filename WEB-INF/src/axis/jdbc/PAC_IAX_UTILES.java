//Revision:# DR+dHvY2OEp95T7YIk0Drw== #
package axis.jdbc;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_UTILES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_UTILES.class);
	private Connection conn = null;

	public PAC_IAX_UTILES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_UTILES.F_IMPORTE_CAMBIO(P_MONEDA_INICIAL, P_MONEDA_FINAL,
	// P_FECHA, P_IMPORTE)
	private HashMap callPAC_IAX_UTILES__F_IMPORTE_CAMBIO(String pP_MONEDA_INICIAL, String pP_MONEDA_FINAL,
			java.sql.Date pP_FECHA, java.math.BigDecimal pP_IMPORTE) throws Exception {
		/** Changed for IAXIS-4320 PK-19/06/2019 Start */
		// String callQuery="{?=call PAC_IAX_UTILES.F_IMPORTE_CAMBIO(?, ?, sysdate, ?,
		// ?, ?)}"; IAXIS-5198 JLTS
		String callQuery = "{?=call PAC_IAX_UTILES.F_IMPORTE_CAMBIO(?, ?, ?, ?, ?, ?)}"; // IAXIS-5198 JLTS

		logCall(callQuery, new String[] { "pP_MONEDA_INICIAL", "pP_MONEDA_FINAL", "pP_FECHA", "pP_IMPORTE" },
				new Object[] { pP_MONEDA_INICIAL, pP_MONEDA_FINAL, pP_FECHA, pP_IMPORTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_MONEDA_INICIAL);
		cStmt.setObject(3, pP_MONEDA_FINAL);
		cStmt.setObject(4, pP_FECHA); // IAXIS-5198 JLTS
		cStmt.setObject(5, pP_IMPORTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "P_MONEDA_FINAL"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "P_CAMBIO"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"

		/*
		 * cStmt.setObject(4, pP_IMPORTE); IAXIS-5198 JLTS cStmt.registerOutParameter(1,
		 * java.sql.Types.NUMERIC); // Valor de "RETURN" cStmt.registerOutParameter(3,
		 * java.sql.Types.VARCHAR); // Valor de "P_MONEDA_FINAL"
		 * cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "P_CAMBIO"
		 * cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
		 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
		 * "MENSAJES"
		 */
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_MONEDA_FINAL", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_MONEDA_FINAL", null);
		}
		try {
			retVal.put("P_CAMBIO", cStmt.getObject(6)); // IAXIS-5198 JLTS
		} catch (SQLException e) {
			retVal.put("P_CAMBIO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(7)); // IAXIS-3640 CJMR
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		/** Changed for IAXIS-4320 PK-19/06/2019 End */
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_UTILES__F_IMPORTE_CAMBIO(String pP_MONEDA_INICIAL, String pP_MONEDA_FINAL,
			java.sql.Date pP_FECHA, java.math.BigDecimal pP_IMPORTE) throws Exception {
		return this.callPAC_IAX_UTILES__F_IMPORTE_CAMBIO(pP_MONEDA_INICIAL, pP_MONEDA_FINAL, pP_FECHA, pP_IMPORTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_IMPORTE_CAMBIO

	// --START-PAC_IAX_UTILES.F_GET_USER_COMP(PCUSER)
	private HashMap callPAC_IAX_UTILES__F_GET_USER_COMP(String pPCUSER) throws Exception {
		String callQuery = "{?=call PAC_IAX_UTILES.F_GET_USER_COMP(?, ?)}";

		logCall(callQuery, new String[] { "pPCUSER" }, new Object[] { pPCUSER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSER);
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

	public HashMap ejecutaPAC_IAX_UTILES__F_GET_USER_COMP(String pPCUSER) throws Exception {
		return this.callPAC_IAX_UTILES__F_GET_USER_COMP(pPCUSER);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_GET_USER_COMP

	// --START-PAC_IAX_UTILES.F_GET_HISPROCESOSREA(PCNOMTABLA, PCNOMCAMPO,
	// PCUSUARIOMOD, PFMODIFI_INI, PFMODIFI_FIN)
	private HashMap callPAC_IAX_UTILES__F_GET_HISPROCESOSREA(String pPCNOMTABLA, String pPCNOMCAMPO,
			String pPCUSUARIOMOD, java.sql.Date pPFMODIFI_INI, java.sql.Date pPFMODIFI_FIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_UTILES.F_GET_HISPROCESOSREA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCNOMTABLA", "pPCNOMCAMPO", "pPCUSUARIOMOD", "pPFMODIFI_INI", "pPFMODIFI_FIN" },
				new Object[] { pPCNOMTABLA, pPCNOMCAMPO, pPCUSUARIOMOD, pPFMODIFI_INI, pPFMODIFI_FIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCNOMTABLA);
		cStmt.setObject(3, pPCNOMCAMPO);
		cStmt.setObject(4, pPCUSUARIOMOD);
		cStmt.setObject(5, pPFMODIFI_INI);
		cStmt.setObject(6, pPFMODIFI_FIN);
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

	public HashMap ejecutaPAC_IAX_UTILES__F_GET_HISPROCESOSREA(String pPCNOMTABLA, String pPCNOMCAMPO,
			String pPCUSUARIOMOD, java.sql.Date pPFMODIFI_INI, java.sql.Date pPFMODIFI_FIN) throws Exception {
		return this.callPAC_IAX_UTILES__F_GET_HISPROCESOSREA(pPCNOMTABLA, pPCNOMCAMPO, pPCUSUARIOMOD, pPFMODIFI_INI,
				pPFMODIFI_FIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_GET_HISPROCESOSREA

	// --START-PAC_IAX_UTILES.F_SET_ACUERDO_PRIMA(PNNUMIDE, PTOMADOR, PCODSUCURSAL,
	// PSUCURSAL, PDIRECCION, PTELEFONO_FIJO, PTELEFONO_CELULAR, PNNUMIDE_REP,
	// PREPRESENTANTE, PVALOR, PLUGAR, PFECHA, PNRO_CUOTAS, PCREPRESENTANTE)
	private HashMap callPAC_IAX_UTILES__F_SET_ACUERDO_PRIMA(String pPNNUMIDE, String pPTOMADOR,
			java.math.BigDecimal pPCODSUCURSAL, String pPSUCURSAL, String pPDIRECCION, String pPTELEFONO_FIJO,
			String pPTELEFONO_CELULAR, String pPNNUMIDE_REP, String pPREPRESENTANTE, java.math.BigDecimal pPVALOR,
			String pPLUGAR, java.sql.Date pPFECHA, java.math.BigDecimal pPNRO_CUOTAS,
			java.math.BigDecimal pPCREPRESENTANTE, String pCUSUARIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_UTILES.F_SET_ACUERDO_PRIMA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNNUMIDE", "pPTOMADOR", "pPCODSUCURSAL", "pPSUCURSAL", "pPDIRECCION",
						"pPTELEFONO_FIJO", "pPTELEFONO_CELULAR", "pPNNUMIDE_REP", "pPREPRESENTANTE", "pPVALOR",
						"pPLUGAR", "pPFECHA", "pPNRO_CUOTAS", "pPCREPRESENTANTE", "pCUSUARIO" },
				new Object[] { pPNNUMIDE, pPTOMADOR, pPCODSUCURSAL, pPSUCURSAL, pPDIRECCION, pPTELEFONO_FIJO,
						pPTELEFONO_CELULAR, pPNNUMIDE_REP, pPREPRESENTANTE, pPVALOR, pPLUGAR, pPFECHA, pPNRO_CUOTAS,
						pPCREPRESENTANTE, pCUSUARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.setObject(2, pPNNUMIDE);
		cStmt.setObject(3, pPTOMADOR);
		cStmt.setObject(4, pPCODSUCURSAL);
		cStmt.setObject(5, pPSUCURSAL);
		cStmt.setObject(6, pPDIRECCION);
		cStmt.setObject(7, pPTELEFONO_FIJO);
		cStmt.setObject(8, pPTELEFONO_CELULAR);
		cStmt.setObject(9, pPNNUMIDE_REP);
		cStmt.setObject(10, pPREPRESENTANTE);
		cStmt.setObject(11, pPVALOR);
		cStmt.setObject(12, pPLUGAR);
		cStmt.setObject(13, pPFECHA);
		cStmt.setObject(14, pPNRO_CUOTAS);
		cStmt.setObject(15, pPCREPRESENTANTE);
		cStmt.registerOutParameter(16, java.sql.Types.NUMERIC); // Valor de "PIDACUERDO"
		cStmt.setObject(17, pCUSUARIO);
		cStmt.registerOutParameter(18, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PIDACUERDO", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("PIDACUERDO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_UTILES__F_SET_ACUERDO_PRIMA(String pPNNUMIDE, String pPTOMADOR,
			java.math.BigDecimal pPCODSUCURSAL, String pPSUCURSAL, String pPDIRECCION, String pPTELEFONO_FIJO,
			String pPTELEFONO_CELULAR, String pPNNUMIDE_REP, String pPREPRESENTANTE, java.math.BigDecimal pPVALOR,
			String pPLUGAR, java.sql.Date pPFECHA, java.math.BigDecimal pPNRO_CUOTAS,
			java.math.BigDecimal pPCREPRESENTANTE, String pCUSUARIO) throws Exception {
		return this.callPAC_IAX_UTILES__F_SET_ACUERDO_PRIMA(pPNNUMIDE, pPTOMADOR, pPCODSUCURSAL, pPSUCURSAL,
				pPDIRECCION, pPTELEFONO_FIJO, pPTELEFONO_CELULAR, pPNNUMIDE_REP, pPREPRESENTANTE, pPVALOR, pPLUGAR,
				pPFECHA, pPNRO_CUOTAS, pPCREPRESENTANTE, pCUSUARIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_SET_ACUERDO_PRIMA

	// --START-PAC_IAX_UTILES.F_SET_DET_ACUERDO_PRIMA(PIDACUERDO, PNRO_CUOTA,
	// PPORCENTAJE, PVALOR, PFECHA_PAGO)
	private HashMap callPAC_IAX_UTILES__F_SET_DET_ACUERDO_PRIMA(java.math.BigDecimal pPIDACUERDO,
			java.math.BigDecimal pPNRO_CUOTA, String pPPORCENTAJE, String pPVALOR,// TASK-55 ACUERDO PAGO 24/03/2023
			java.sql.Date pPFECHA_PAGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_UTILES.F_SET_DET_ACUERDO_PRIMA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDACUERDO", "pPNRO_CUOTA", "pPPORCENTAJE", "pPVALOR", "pPFECHA_PAGO" },
				new Object[] { pPIDACUERDO, pPNRO_CUOTA, pPPORCENTAJE, pPVALOR, pPFECHA_PAGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDACUERDO);
		cStmt.setObject(3, pPNRO_CUOTA);
		cStmt.setObject(4, pPPORCENTAJE);
		cStmt.setObject(5, pPVALOR);
		cStmt.setObject(6, pPFECHA_PAGO);
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

	public HashMap ejecutaPAC_IAX_UTILES__F_SET_DET_ACUERDO_PRIMA(java.math.BigDecimal pPIDACUERDO,
			java.math.BigDecimal pPNRO_CUOTA, String pPPORCENTAJE, String pPVALOR,//task55 mamb 24/02/2022
			java.sql.Date pPFECHA_PAGO) throws Exception {
		return this.callPAC_IAX_UTILES__F_SET_DET_ACUERDO_PRIMA(pPIDACUERDO, pPNRO_CUOTA, pPPORCENTAJE, pPVALOR,
				pPFECHA_PAGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_SET_DET_ACUERDO_PRIMA

	// SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
	// --START-PAC_IAX_UTILES.F_SET_POLIZAS_ACUERDO_PRIMA(PIDACUERDO, NPOLIZA,
	// NCERTIF, PVALOR)
	private HashMap callPAC_IAX_UTILES__F_SET_POLIZAS_ACUERDO_PRIMA(java.math.BigDecimal pPIDACUERDO, String pNPOLIZA,
			String pNRECIBO, java.math.BigDecimal pSALDO, java.math.BigDecimal pPVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_UTILES.F_SET_POLIZAS_ACUERDO_PRIMA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDACUERDO", "pNPOLIZA", "pNRECIBO", "pSALDO", "pPVALOR" },
				new Object[] { pPIDACUERDO, pNPOLIZA, pNRECIBO, pSALDO, pPVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDACUERDO);
		cStmt.setObject(3, pNPOLIZA);
		cStmt.setObject(4, pNRECIBO);
		cStmt.setObject(5, pSALDO);
		cStmt.setObject(6, pPVALOR);
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
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_UTILES__F_SET_POLIZAS_ACUERDO_PRIMA(java.math.BigDecimal pPIDACUERDO, String pNPOLIZA,
			String pNRECIBO, BigDecimal pSALDO, java.math.BigDecimal pPVALOR) throws Exception {
		return this.callPAC_IAX_UTILES__F_SET_POLIZAS_ACUERDO_PRIMA(pPIDACUERDO, pNPOLIZA, pNRECIBO, pSALDO, pPVALOR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_SET_POLIZAS_ACUERDO_PRIMA

	// --START-callPAC_IAX_UTILES__F_GET_TIPIVA
	private HashMap callPAC_IAX_UTILES__F_GET_TIPIVA(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_UTILES.F_GET_TIPIVA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNNUMIDE", "pPTOMADOR" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "vtipiva"
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
			retVal.put("VTIPIVA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("VTIPIVA", null);
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

	public HashMap ejecutaPAC_IAX_UTILES__F_GET_TIPIVA(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO)
			throws Exception {
		return this.callPAC_IAX_UTILES__F_GET_TIPIVA(pPSSEGURO, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_GET_TIPIVA

	// --START-callPAC_IAX_UTILES__F_GET_ULTMOV
	private HashMap callPAC_IAX_UTILES__F_GET_ULTMOV(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPTIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_UTILES.F_GET_ULTMOV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTIPO" }, new Object[] { pPSSEGURO, pPTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTIPO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ULTIMO MOVIMIENTO"
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
			retVal.put("VULTMOV", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("VULTMOV", null);
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

	public HashMap ejecutaPAC_IAX_UTILES__F_GET_ULTMOV(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO)
			throws Exception {
		return this.callPAC_IAX_UTILES__F_GET_ULTMOV(pPSSEGURO, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_UTILES.F_GET_ULTMOV

}
