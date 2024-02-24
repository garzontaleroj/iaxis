package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DEVOLUCIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DEVOLUCIONES.class);
	private Connection conn = null;

	public PAC_IAX_DEVOLUCIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DEVOLUCIONES.F_EXEC_DEVOLU()
	private HashMap callPAC_IAX_DEVOLUCIONES__F_EXEC_DEVOLU() throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_EXEC_DEVOLU(?)}";

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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_EXEC_DEVOLU() throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_EXEC_DEVOLU();
	}

	// --END-PAC_IAX_DEVOLUCIONES.F_EXEC_DEVOLU
	// --START-PAC_IAX_DEVOLUCIONES.F_GET_CARGA_FICHERO(PNOMFITXER)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_CARGA_FICHERO(String pPNOMFITXER) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_CARGA_FICHERO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNOMFITXER" }, new Object[] { pPNOMFITXER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNOMFITXER);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "P_FICH_OUT"
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
			retVal.put("PSPROCES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
		}
		try {
			retVal.put("P_FICH_OUT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_FICH_OUT", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CARGA_FICHERO(String pPNOMFITXER) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_CARGA_FICHERO(pPNOMFITXER);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_CARGA_FICHERO

	// bug 0022030
	// --START-PAC_IAX_DEVOLUCIONES.F_GET_CARTAS_DEVOL(PSDEVOLU)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_CARTAS_DEVOL(java.math.BigDecimal pPSDEVOLU) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_CARTAS_DEVOL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSDEVOLU" }, new Object[] { pPSDEVOLU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSDEVOLU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PPLANTILLA"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PNOMFICHERO"
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
			retVal.put("PPLANTILLA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PPLANTILLA", null);
		}
		try {
			retVal.put("PNOMFICHERO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNOMFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CARTAS_DEVOL(java.math.BigDecimal pPSDEVOLU) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_CARTAS_DEVOL(pPSDEVOLU);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_CARTAS_DEVOL

	// --START-PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_CARTAS(PSGESCARTA, PNPOLIZA,
	// PNRECIBO, PCESTIMP, PFINI, PFFIN, PCEMPRES, PCRAMO, PSPRODUC, PCAGENTE,
	// PCREMBAN)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_CARTAS(java.math.BigDecimal pPSGESCARTA,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTIMP,
			java.sql.Date pPFINI, java.sql.Date pPFFIN, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCREMBAN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_CARTAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSGESCARTA", "pPNPOLIZA", "pPNRECIBO", "pPCESTIMP", "pPFINI", "pPFFIN", "pPCEMPRES",
						"pPCRAMO", "pPSPRODUC", "pPCAGENTE", "pPCREMBAN" },
				new Object[] { pPSGESCARTA, pPNPOLIZA, pPNRECIBO, pPCESTIMP, pPFINI, pPFFIN, pPCEMPRES, pPCRAMO,
						pPSPRODUC, pPCAGENTE, pPCREMBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSGESCARTA);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNRECIBO);
		cStmt.setObject(5, pPCESTIMP);
		cStmt.setObject(6, pPFINI);
		cStmt.setObject(7, pPFFIN);
		cStmt.setObject(8, pPCEMPRES);
		cStmt.setObject(9, pPCRAMO);
		cStmt.setObject(10, pPSPRODUC);
		cStmt.setObject(11, pPCAGENTE);
		cStmt.setObject(12, pPCREMBAN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCARTAS"
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
			retVal.put("PCARTAS", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PCARTAS", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_CARTAS(java.math.BigDecimal pPSGESCARTA,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTIMP,
			java.sql.Date pPFINI, java.sql.Date pPFFIN, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCREMBAN)
			throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_CARTAS(pPSGESCARTA, pPNPOLIZA, pPNRECIBO, pPCESTIMP,
				pPFINI, pPFFIN, pPCEMPRES, pPCRAMO, pPSPRODUC, pPCAGENTE, pPCREMBAN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_CARTAS

	// --START-PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_DEVOL(PCEMPRES, PSDEVOLU,
	// PFSOPORT, PFCARGA)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_DEVOL(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSDEVOLU, java.sql.Date pPFSOPORT, java.sql.Date pPFCARGA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_DEVOL(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSDEVOLU", "pPFSOPORT", "pPFCARGA" },
				new Object[] { pPCEMPRES, pPSDEVOLU, pPFSOPORT, pPFCARGA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSDEVOLU);
		cStmt.setObject(4, pPFSOPORT);
		cStmt.setObject(5, pPFCARGA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PDEVOLUCIONES"
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
			retVal.put("PDEVOLUCIONES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PDEVOLUCIONES", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_DEVOL(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSDEVOLU, java.sql.Date pPFSOPORT, java.sql.Date pPFCARGA) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_DEVOL(pPCEMPRES, pPSDEVOLU, pPFSOPORT, pPFCARGA);
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_DEVOL

	// --START-PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_DEVOL(PCEMPRES, PSDEVOLU,
	// PFSOPORT, PFCARGA, PCCOBBAN, PSPERSON, PTIPO, PFCARGAINI, PFCARGAFIN)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_DEVOL(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSDEVOLU, java.sql.Date pPFSOPORT, java.sql.Date pPFCARGA,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPTIPO,
			java.sql.Date pPFCARGAINI, java.sql.Date pPFCARGAFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_DEVOL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPSDEVOLU", "pPFSOPORT", "pPFCARGA", "pPCCOBBAN", "pPSPERSON", "pPTIPO",
						"pPFCARGAINI", "pPFCARGAFIN" },
				new Object[] { pPCEMPRES, pPSDEVOLU, pPFSOPORT, pPFCARGA, pPCCOBBAN, pPSPERSON, pPTIPO, pPFCARGAINI,
						pPFCARGAFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSDEVOLU);
		cStmt.setObject(4, pPFSOPORT);
		cStmt.setObject(5, pPFCARGA);
		cStmt.setObject(8, pPCCOBBAN);
		cStmt.setObject(9, pPSPERSON);
		cStmt.setObject(10, pPTIPO);
		cStmt.setObject(11, pPFCARGAINI);
		cStmt.setObject(12, pPFCARGAFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PDEVOLUCIONES"
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
			retVal.put("PDEVOLUCIONES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PDEVOLUCIONES", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_DEVOL(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSDEVOLU, java.sql.Date pPFSOPORT, java.sql.Date pPFCARGA,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPTIPO,
			java.sql.Date pPFCARGAINI, java.sql.Date pPFCARGAFIN) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_DEVOL(pPCEMPRES, pPSDEVOLU, pPFSOPORT, pPFCARGA, pPCCOBBAN,
				pPSPERSON, pPTIPO, pPFCARGAINI, pPFCARGAFIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_CONSULTA_DEVOL

	// --START-PAC_IAX_DEVOLUCIONES.F_GET_DATOS_DEVOLUCION(PSDEVOLU)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_DATOS_DEVOLUCION(java.math.BigDecimal pPSDEVOLU) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_DATOS_DEVOLUCION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSDEVOLU" }, new Object[] { pPSDEVOLU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSDEVOLU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PDEVOLUCIONES"
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
			retVal.put("PDEVOLUCIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDEVOLUCIONES", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DATOS_DEVOLUCION(java.math.BigDecimal pPSDEVOLU)
			throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_DATOS_DEVOLUCION(pPSDEVOLU);
	}

	// --END-PAC_IAX_DEVOLUCIONES.F_GET_DATOS_DEVOLUCION
	// --START-PAC_IAX_DEVOLUCIONES.F_GET_DATOS_RECIBOS_DEVOL(PSDEVOLU)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_DATOS_RECIBOS_DEVOL(java.math.BigDecimal pPSDEVOLU)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_DATOS_RECIBOS_DEVOL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSDEVOLU" }, new Object[] { pPSDEVOLU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSDEVOLU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLSTRECIBOS"
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
			retVal.put("PLSTRECIBOS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLSTRECIBOS", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DATOS_RECIBOS_DEVOL(java.math.BigDecimal pPSDEVOLU)
			throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_DATOS_RECIBOS_DEVOL(pPSDEVOLU);
	}

	// --END-PAC_IAX_DEVOLUCIONES.F_GET_DATOS_RECIBOS_DEVOL
	// --START-PAC_IAX_DEVOLUCIONES.F_GET_LISTADO_DEVOL(PSDEVOLU)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_LISTADO_DEVOL(java.math.BigDecimal pPSDEVOLU) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_LISTADO_DEVOL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSDEVOLU" }, new Object[] { pPSDEVOLU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSDEVOLU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PNOMFICHERO"
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
			retVal.put("PNOMFICHERO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNOMFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_LISTADO_DEVOL(java.math.BigDecimal pPSDEVOLU) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_LISTADO_DEVOL(pPSDEVOLU);
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_LISTADO_DEVOL

	// --END-PAC_IAX_DEVOLUCIONES.F_GET_LISTADO_DEVOL
	// --START-PAC_IAX_DEVOLUCIONES.F_GET_REC_REVIS(PSDEVOLU)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_REC_REVIS(java.math.BigDecimal pPSDEVOLU) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_REC_REVIS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSDEVOLU" }, new Object[] { pPSDEVOLU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSDEVOLU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SITRECDEV".toUpperCase())); // Valor de "PTSITRECDEV"
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
			retVal.put("PTSITRECDEV", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTSITRECDEV", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_REC_REVIS(java.math.BigDecimal pPSDEVOLU) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_REC_REVIS(pPSDEVOLU);
	}

	// --END-PAC_IAX_DEVOLUCIONES.F_GET_REC_REVIS
	// --START-PAC_IAX_DEVOLUCIONES.F_SET_ESTIMP_CARTA(PSDEVOLU, PNRECIBO, PCESTIMP)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_SET_ESTIMP_CARTA(java.math.BigDecimal pPSDEVOLU,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_SET_ESTIMP_CARTA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSDEVOLU", "pPNRECIBO", "pPCESTIMP" },
				new Object[] { pPSDEVOLU, pPNRECIBO, pPCESTIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSDEVOLU);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPCESTIMP);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_SET_ESTIMP_CARTA(java.math.BigDecimal pPSDEVOLU,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTIMP) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_SET_ESTIMP_CARTA(pPSDEVOLU, pPNRECIBO, pPCESTIMP);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DEVOLUCIONES.F_SET_ESTIMP_CARTA
	// --START-PAC_IAX_DEVOLUCIONES.F_SET_OBJETO_REC_REVIS(PNRECIBO, PSDEVOLU,
	// PCDEVSIT)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_SET_OBJETO_REC_REVIS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSDEVOLU, java.math.BigDecimal pPCDEVSIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_SET_OBJETO_REC_REVIS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPSDEVOLU", "pPCDEVSIT" },
				new Object[] { pPNRECIBO, pPSDEVOLU, pPCDEVSIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPSDEVOLU);
		cStmt.setObject(4, pPCDEVSIT);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_SET_OBJETO_REC_REVIS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSDEVOLU, java.math.BigDecimal pPCDEVSIT) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_SET_OBJETO_REC_REVIS(pPNRECIBO, pPSDEVOLU, pPCDEVSIT);
	}

	// --END-PAC_IAX_DEVOLUCIONES.F_SET_OBJETO_REC_REVIS
	// --START-PAC_IAX_DEVOLUCIONES.F_SET_REC_REVIS()
	private HashMap callPAC_IAX_DEVOLUCIONES__F_SET_REC_REVIS() throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_SET_REC_REVIS(?)}";

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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_SET_REC_REVIS() throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_SET_REC_REVIS();
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_SET_REC_REVIS

	// --START-PAC_IAX_DEVOLUCIONES.F_INICIALIZAR_REC_REVIS(PSDEVOLU)
	private HashMap callPAC_IAX_DEVOLUCIONES__F_INICIALIZAR_REC_REVIS(java.math.BigDecimal pPSDEVOLU) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_INICIALIZAR_REC_REVIS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSDEVOLU" }, new Object[] { pPSDEVOLU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSDEVOLU);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SITRECDEV".toUpperCase())); // Valor de "PTSITRECDEV"
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
			retVal.put("PTSITRECDEV", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTSITRECDEV", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_INICIALIZAR_REC_REVIS(java.math.BigDecimal pPSDEVOLU)
			throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_INICIALIZAR_REC_REVIS(pPSDEVOLU);
	}

	// --END-PAC_IAX_DEVOLUCIONES.F_INICIALIZAR_REC_REVIS
	// --START-PAC_IAX_DEVOLUCIONES.F_GET_DEVOLUCIONES()
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_DEVOLUCIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_DEVOLUCIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PDEVOLUCIONES"
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
			retVal.put("PDEVOLUCIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDEVOLUCIONES", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DEVOLUCIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_DEVOLUCIONES(pPCEMPRES);
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_DEVOLUCIONES

	// --START-PAC_IAX_DEVOLUCIONES.F_GET_DIRECTORIO()
	private HashMap callPAC_IAX_DEVOLUCIONES__F_GET_DIRECTORIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_DEVOLUCIONES.F_GET_DIRECTORIO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.VARCHAR); // Valor de "PPATH"
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
			retVal.put("PPATH", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PPATH", null);
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

	public HashMap ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DIRECTORIO() throws Exception {
		return this.callPAC_IAX_DEVOLUCIONES__F_GET_DIRECTORIO();
	}
	// --END-PAC_IAX_DEVOLUCIONES.F_GET_DIRECTORIO

}
