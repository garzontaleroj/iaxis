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

//WLS-Ready

public class PAC_IAX_COMISIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COMISIONES.class);
	private Connection conn = null;

	public PAC_IAX_COMISIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COMISIONES.F_ACT_CCOMISI(PCCOMISI)

	private HashMap callPAC_IAX_COMISIONES__F_ACT_CCOMISI(java.math.BigDecimal pPCCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_ACT_CCOMISI(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI" }, new Object[] { pPCCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_ACT_CCOMISI(java.math.BigDecimal pPCCOMISI) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_ACT_CCOMISI(pPCCOMISI);
	}
	// --END-PAC_IAX_COMISIONES.F_ACT_CCOMISI
	// --START-PAC_IAX_COMISIONES.F_DUPLICAR_CUADRO(PCCOMISI_ORI, PCCOMISI_NUEVO,
	// PTCOMISI_NUEVO)

	private HashMap callPAC_IAX_COMISIONES__F_DUPLICAR_CUADRO(java.math.BigDecimal pPCCOMISI_ORI,
			java.math.BigDecimal pPCCOMISI_NUEVO, String pPTCOMISI_NUEVO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_DUPLICAR_CUADRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI_ORI", "pPCCOMISI_NUEVO", "pPTCOMISI_NUEVO" },
				new Object[] { pPCCOMISI_ORI, pPCCOMISI_NUEVO, pPTCOMISI_NUEVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI_ORI);
		cStmt.setObject(3, pPCCOMISI_NUEVO);
		cStmt.setObject(4, pPTCOMISI_NUEVO);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_DUPLICAR_CUADRO(java.math.BigDecimal pPCCOMISI_ORI,
			java.math.BigDecimal pPCCOMISI_NUEVO, String pPTCOMISI_NUEVO) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_DUPLICAR_CUADRO(pPCCOMISI_ORI, pPCCOMISI_NUEVO, pPTCOMISI_NUEVO);
	}
	// --END-PAC_IAX_COMISIONES.F_DUPLICAR_CUADRO

	// --START-PAC_IAX_COMISIONES.F_GET_CUADROCOMISION(PCCOMISI, PFINIVIG, PFFINVIG)

	private HashMap callPAC_IAX_COMISIONES__F_GET_CUADROCOMISION(java.math.BigDecimal pPCCOMISI,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_CUADROCOMISION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI", "pPFINIVIG", "pPFFINVIG" },
				new Object[] { pPCCOMISI, pPFINIVIG, pPFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPFINIVIG);
		cStmt.setObject(4, pPFFINVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CUADROCOMISION".toUpperCase())); // Valor de "PCUADROCOMISION"
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
			retVal.put("PCUADROCOMISION", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCUADROCOMISION", null);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_CUADROCOMISION(java.math.BigDecimal pPCCOMISI,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_CUADROCOMISION(pPCCOMISI, pPFINIVIG, pPFFINVIG);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_CUADROCOMISION
	// --START-PAC_IAX_COMISIONES.F_GET_CUADROSCOMISION(PCCOMISI, PTCOMISI, PCTIPO,
	// PCESTADO, PFFECHAINI, PFFECHAFIN)

	private HashMap callPAC_IAX_COMISIONES__F_GET_CUADROSCOMISION(java.math.BigDecimal pPCCOMISI, String pPTCOMISI,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFFECHAINI,
			java.sql.Date pPFFECHAFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_CUADROSCOMISION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPTCOMISI", "pPCTIPO", "pPCESTADO", "pPFFECHAINI", "pPFFECHAFIN" },
				new Object[] { pPCCOMISI, pPTCOMISI, pPCTIPO, pPCESTADO, pPFFECHAINI, pPFFECHAFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPTCOMISI);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPFFECHAINI);
		cStmt.setObject(7, pPFFECHAFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CUADROCOMISION".toUpperCase())); // Valor de "PCUADROS"
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
			retVal.put("PCUADROS", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCUADROS", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_CUADROSCOMISION(java.math.BigDecimal pPCCOMISI, String pPTCOMISI,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFFECHAINI,
			java.sql.Date pPFFECHAFIN) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_CUADROSCOMISION(pPCCOMISI, pPTCOMISI, pPCTIPO, pPCESTADO, pPFFECHAINI,
				pPFFECHAFIN);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_CUADROSCOMISION

	// --START-PAC_IAX_COMISIONES.F_GET_DETALLE_COMISION(PCCOMISI, PCAGRPROD,
	// PCRAMO, PSPRODUC, PCACTIVI, PCGARANT, PTODOS, PFINIVIG, PFFINVIG)

	private HashMap callPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPTODOS,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_DETALLE_COMISION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPCAGRPROD", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPTODOS",
						"pPFINIVIG", "pPFFINVIG" },
				new Object[] { pPCCOMISI, pPCAGRPROD, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPTODOS, pPFINIVIG,
						pPFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPCAGRPROD);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPTODOS);
		cStmt.setObject(9, pPFINIVIG);
		cStmt.setObject(10, pPFFINVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETCOMISION".toUpperCase())); // Valor de "PT_COMISION"
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
			retVal.put("PT_COMISION", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PT_COMISION", null);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPTODOS,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION(pPCCOMISI, pPCAGRPROD, pPCRAMO, pPSPRODUC, pPCACTIVI,
				pPCGARANT, pPTODOS, pPFINIVIG, pPFFINVIG);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_DETALLE_COMISION

	// --START-PAC_IAX_COMISIONES.F_GET_DETALLE_COMISION_PROD(PCCOMISI, PCAGRPROD,
	// PCRAMO, PSPRODUC, PCACTIVI, PCGARANT, PFINIVIG)

	private HashMap callPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION_PROD(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_DETALLE_COMISION_PROD(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPCAGRPROD", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT",
						"pPFINIVIG" },
				new Object[] { pPCCOMISI, pPCAGRPROD, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPCAGRPROD);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETCOMISION".toUpperCase())); // Valor de "PT_COMISION"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PT_COMISION", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PT_COMISION", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION_PROD(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION_PROD(pPCCOMISI, pPCAGRPROD, pPCRAMO, pPSPRODUC,
				pPCACTIVI, pPCGARANT, pPFINIVIG);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_DETALLE_COMISION_PROD

	// --END-PAC_IAX_COMISIONES.F_GET_DETALLE_COMISION_PROD
	// --START-PAC_IAX_COMISIONES.F_GET_DETALLE_NIVEL(PSPRODUC, PCACTIVI, PCGARANT,
	// PCNIVEL, PCCOMISI)

	private HashMap callPAC_IAX_COMISIONES__F_GET_DETALLE_NIVEL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.math.BigDecimal pPCCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_DETALLE_NIVEL(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCNIVEL", "pPCCOMISI" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCNIVEL, pPCCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCNIVEL);
		cStmt.setObject(6, pPCCOMISI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETCOMISION".toUpperCase())); // Valor de "PT_COMISION"
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
			retVal.put("PT_COMISION", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PT_COMISION", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_NIVEL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.math.BigDecimal pPCCOMISI) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_DETALLE_NIVEL(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCNIVEL, pPCCOMISI);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_DETALLE_NIVEL
	// --START-PAC_IAX_COMISIONES.F_GET_HIST_CUADROCOMISION(PCCOMISI)

	private HashMap callPAC_IAX_COMISIONES__F_GET_HIST_CUADROCOMISION(java.math.BigDecimal pPCCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_HIST_CUADROCOMISION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI" }, new Object[] { pPCCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CUADROCOMISION".toUpperCase())); // Valor de "PDETCOMISION"
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
			retVal.put("PDETCOMISION", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDETCOMISION", null);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_HIST_CUADROCOMISION(java.math.BigDecimal pPCCOMISI)
			throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_HIST_CUADROCOMISION(pPCCOMISI);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_HIST_CUADROCOMISION
	// --START-PAC_IAX_COMISIONES.F_GET_OBJ_CUADROCOMISION(CCOMISI)

	private HashMap callPAC_IAX_COMISIONES__F_GET_OBJ_CUADROCOMISION(java.math.BigDecimal pCCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_OBJ_CUADROCOMISION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCOMISI" }, new Object[] { pCCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCOMISI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CUADROCOMISION".toUpperCase())); // Valor de "PCUADROCOMISION"
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
			retVal.put("PCUADROCOMISION", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCUADROCOMISION", null);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_OBJ_CUADROCOMISION(java.math.BigDecimal pCCOMISI) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_OBJ_CUADROCOMISION(pCCOMISI);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_OBJ_CUADROCOMISION
	// --START-PAC_IAX_COMISIONES.F_GET_OBJ_DETALLE_COMISION()

	private HashMap callPAC_IAX_COMISIONES__F_GET_OBJ_DETALLE_COMISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_OBJ_DETALLE_COMISION(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETCOMISION".toUpperCase())); // Valor de "PDETALLECOMISION"
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
			retVal.put("PDETALLECOMISION", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PDETALLECOMISION", null);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_OBJ_DETALLE_COMISION() throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_OBJ_DETALLE_COMISION();
	}
	// --END-PAC_IAX_COMISIONES.F_GET_OBJ_DETALLE_COMISION
	// --START-PAC_IAX_COMISIONES.F_GET_PORPRODUCTO(PSPRODUC, PCACTIVI, PCGARANT,
	// PCNIVEL, PCFINIVIG)

	private HashMap callPAC_IAX_COMISIONES__F_GET_PORPRODUCTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.sql.Date pPCFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_PORPRODUCTO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCNIVEL", "pPCFINIVIG" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCNIVEL, pPCFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCNIVEL);
		cStmt.setObject(6, pPCFINIVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETCOMISION".toUpperCase())); // Valor de "PT_COMISION"
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
			retVal.put("PT_COMISION", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PT_COMISION", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_PORPRODUCTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.sql.Date pPCFINIVIG) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_PORPRODUCTO(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCNIVEL, pPCFINIVIG);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_PORPRODUCTO

	// --START-PAC_IAX_COMISIONES.F_SET_DETALLE_COMISION(PCCOMISI, PSPRODUC,
	// PCACTIVI, PCGARANT, PNIVEL, PCMODCOM, PFINIVIG, PPCOMISI, PNINIALT, PNFINALT,
	// PDONDE)
	private HashMap callPAC_IAX_COMISIONES__F_SET_DETALLE_COMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT,
			java.math.BigDecimal pCCRITERIO, java.math.BigDecimal pNDESDE, java.math.BigDecimal pNHASTA, String pPDONDE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_SET_DETALLE_COMISION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODCOM", "pPFINIVIG",
						"pPPCOMISI", "pPNINIALT", "pPNFINALT", "pCCRITERIO", "pNDESDE", "pNHASTA", "pPDONDE" },
				new Object[] { pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODCOM, pPFINIVIG, pPPCOMISI,
						pPNINIALT, pPNFINALT, pCCRITERIO, pNDESDE, pNHASTA, pPDONDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODCOM);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.setObject(9, pPPCOMISI);
		cStmt.setObject(10, pPNINIALT);
		cStmt.setObject(11, pPNFINALT);
		cStmt.setObject(12, pCCRITERIO);
		cStmt.setObject(13, pNDESDE);
		cStmt.setObject(14, pNHASTA);
		cStmt.setObject(16, pPDONDE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_SET_DETALLE_COMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT,
			java.math.BigDecimal pCCRITERIO, BigDecimal pNDESDE, BigDecimal pNHASTA, String pPDONDE) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_SET_DETALLE_COMISION(pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODCOM, pPFINIVIG, pPPCOMISI, pPNINIALT, pPNFINALT, pCCRITERIO, pNDESDE, pNHASTA, pPDONDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_SET_DETALLE_COMISION

	// --START-PAC_IAX_COMISIONES.F_SET_OBJ_CUADROCOMISION(PCCOMISI, PCTIPO,
	// PCESTADO, PFINIVIG, PFFINVIG, PMODO)

	private HashMap callPAC_IAX_COMISIONES__F_SET_OBJ_CUADROCOMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_SET_OBJ_CUADROCOMISION(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI", "pPCTIPO", "pPCESTADO", "pPFINIVIG", "pPFFINVIG", "pPMODO" },
				new Object[] { pPCCOMISI, pPCTIPO, pPCESTADO, pPFINIVIG, pPFFINVIG, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCESTADO);
		cStmt.setObject(5, pPFINIVIG);
		cStmt.setObject(6, pPFFINVIG);
		cStmt.setObject(7, pPMODO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_SET_OBJ_CUADROCOMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, String pPMODO) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_SET_OBJ_CUADROCOMISION(pPCCOMISI, pPCTIPO, pPCESTADO, pPFINIVIG,
				pPFFINVIG, pPMODO);
	}
	// --END-PAC_IAX_COMISIONES.F_SET_OBJ_CUADROCOMISION
	// --START-PAC_IAX_COMISIONES.F_SET_OBJ_DESCCUADRO(PCIDIOMA, PCCOMISI, PTCOMISI)

	private HashMap callPAC_IAX_COMISIONES__F_SET_OBJ_DESCCUADRO(java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCCOMISI, String pPTCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_SET_OBJ_DESCCUADRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCIDIOMA", "pPCCOMISI", "pPTCOMISI" },
				new Object[] { pPCIDIOMA, pPCCOMISI, pPTCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCIDIOMA);
		cStmt.setObject(3, pPCCOMISI);
		cStmt.setObject(4, pPTCOMISI);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_SET_OBJ_DESCCUADRO(java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCCOMISI, String pPTCOMISI) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_SET_OBJ_DESCCUADRO(pPCIDIOMA, pPCCOMISI, pPTCOMISI);
	}
	// --END-PAC_IAX_COMISIONES.F_SET_OBJ_DESCCUADRO
	// --START-PAC_IAX_COMISIONES.F_SET_TRASPASO_DETALLE_OBJ_BD()

	private HashMap callPAC_IAX_COMISIONES__F_SET_TRASPASO_DETALLE_OBJ_BD() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_SET_TRASPASO_DETALLE_OBJ_BD(?)}";

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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_SET_TRASPASO_DETALLE_OBJ_BD() throws Exception {
		return this.callPAC_IAX_COMISIONES__F_SET_TRASPASO_DETALLE_OBJ_BD();
	}
	// --END-PAC_IAX_COMISIONES.F_SET_TRASPASO_DETALLE_OBJ_BD
	// --START-PAC_IAX_COMISIONES.F_SET_TRASPASO_OBJ_BD()

	private HashMap callPAC_IAX_COMISIONES__F_SET_TRASPASO_OBJ_BD() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_SET_TRASPASO_OBJ_BD(?)}";

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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_SET_TRASPASO_OBJ_BD() throws Exception {
		return this.callPAC_IAX_COMISIONES__F_SET_TRASPASO_OBJ_BD();
	}
	// --END-PAC_IAX_COMISIONES.F_SET_TRASPASO_OBJ_BD

	// --START-PAC_IAX_COMISIONES.F_GET_LSFECHASVIGENCIA(PSPRODUC, PCTIPO)

	private HashMap callPAC_IAX_COMISIONES__F_GET_LSFECHASVIGENCIA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_LSFECHASVIGENCIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCTIPO" }, new Object[] { pPSPRODUC, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCTIPO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_LSFECHASVIGENCIA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_LSFECHASVIGENCIA(pPSPRODUC, pPCTIPO);
	}
	// --END-PAC_IAX_COMISIONES.F_GET_LSFECHASVIGENCIA

	// --START-PAC_IAX_COMISIONES.F_DUPLICAR_CUADRO_PROD(PCSPRODUC, PFINIVIG)

	private HashMap callPAC_IAX_COMISIONES__F_DUPLICAR_CUADRO_PROD(java.math.BigDecimal pPCSPRODUC,
			java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_DUPLICAR_CUADRO_PROD(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCSPRODUC", "pPFINIVIG" }, new Object[] { pPCSPRODUC, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCSPRODUC);
		cStmt.setObject(3, pPFINIVIG);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_DUPLICAR_CUADRO_PROD(java.math.BigDecimal pPCSPRODUC,
			java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_DUPLICAR_CUADRO_PROD(pPCSPRODUC, pPFINIVIG);
	}
	// --END-PAC_IAX_COMISIONES.F_DUPLICAR_CUADRO_PROD

	// --START-PAC_IAX_COMISIONES.F_GET_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI,
	// PCGARANT, PNIVEL, PCMODCOM, PFINIVIG)
	private HashMap callPAC_IAX_COMISIONES__F_GET_DETCOM_ALT(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_DETCOM_ALT(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODCOM",
						"pPFINIVIG" },
				new Object[] { pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODCOM, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODCOM);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETCOMISION".toUpperCase())); // Valor de "PT_COMISION"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PT_COMISION", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PT_COMISION", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_DETCOM_ALT(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_DETCOM_ALT(pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODCOM, pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_GET_DETCOM_ALT

	// --START-PAC_IAX_COMISIONES.F_CANC_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI,
	// PCGARANT, PNIVEL, PCMODCOM, PFINIVIG)
	private HashMap callPAC_IAX_COMISIONES__F_CANC_DETCOM_ALT(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_CANC_DETCOM_ALT(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODCOM",
						"pPFINIVIG" },
				new Object[] { pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODCOM, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODCOM);
		cStmt.setObject(8, pPFINIVIG);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_CANC_DETCOM_ALT(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_CANC_DETCOM_ALT(pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODCOM, pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_CANC_DETCOM_ALT

	// --START-PAC_IAX_COMISIONES.F_DEL_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI,
	// PCGARANT, PNIVEL, PCMODCOM, PFINIVIG, PNINIALT, PCCRITERIO, PNHASTA, PNDESDE)
	private HashMap callPAC_IAX_COMISIONES__F_DEL_DETCOM_ALT(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPCCRITERIO, java.math.BigDecimal pPNHASTA,
			java.math.BigDecimal pPNDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_DEL_DETCOM_ALT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODCOM", "pPFINIVIG",
						"pPNINIALT", "pPCCRITERIO", "pPNHASTA", "pPNDESDE" },
				new Object[] { pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODCOM, pPFINIVIG, pPNINIALT,
						pPCCRITERIO, pPNHASTA, pPNDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODCOM);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.setObject(9, pPNINIALT);
		cStmt.setObject(10, pPCCRITERIO);
		cStmt.setObject(11, pPNHASTA);
		cStmt.setObject(12, pPNDESDE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_DEL_DETCOM_ALT(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODCOM, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPCCRITERIO, java.math.BigDecimal pPNHASTA,
			java.math.BigDecimal pPNDESDE) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_DEL_DETCOM_ALT(pPCCOMISI, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODCOM, pPFINIVIG, pPNINIALT, pPCCRITERIO, pPNHASTA, pPNDESDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_DEL_DETCOM_ALT

	// --START-PAC_IAX_COMISIONES.F_SET_CUADROCOMISION(PCCOMISI, PCTIPO, PCESTADO,
	// PFINIVIG, PFFINVIG, PDESCRIPCIONES, PMODO)
	private HashMap callPAC_IAX_COMISIONES__F_SET_CUADROCOMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, Object pPDESCRIPCIONES, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_SET_CUADROCOMISION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMISI", "pPCTIPO", "pPCESTADO", "pPFINIVIG", "pPFFINVIG", "pPDESCRIPCIONES",
						"pPMODO" },
				new Object[] { pPCCOMISI, pPCTIPO, pPCESTADO, pPFINIVIG, pPFFINVIG, pPDESCRIPCIONES, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCESTADO);
		cStmt.setObject(5, pPFINIVIG);
		cStmt.setObject(6, pPFFINVIG);
		cStmt.setObject(7, pPDESCRIPCIONES);
		cStmt.setObject(8, pPMODO);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_SET_CUADROCOMISION(java.math.BigDecimal pPCCOMISI,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, Object pPDESCRIPCIONES, String pPMODO) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_SET_CUADROCOMISION(pPCCOMISI, pPCTIPO, pPCESTADO, pPFINIVIG, pPFFINVIG,
				pPDESCRIPCIONES, pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_SET_CUADROCOMISION

	// --START-PAC_IAX_COMISIONES.F_SET_COMISIONDESGLOSE(PCACTIVI, PCGARANT,
	// PCCOMISI, PCMODCOM, PFINIVIG, PNINIALT, PSPRODUC, PNFINALT, PNIVEL,
	// PCCRITERIO, PNDESDE, PNHASTA, DESGLOSE)
	private HashMap callPAC_IAX_COMISIONES__F_SET_COMISIONDESGLOSE(java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCMODCOM,
			java.sql.Date pPFINIVIG, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNFINALT, java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCCRITERIO,
			java.math.BigDecimal pPNDESDE, java.math.BigDecimal pPNHASTA, Object pDESGLOSE) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_SET_COMISIONDESGLOSE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCACTIVI", "pPCGARANT", "pPCCOMISI", "pPCMODCOM", "pPFINIVIG", "pPNINIALT",
						"pPSPRODUC", "pPNFINALT", "pPNIVEL", "pPCCRITERIO", "pPNDESDE", "pPNHASTA", "pDESGLOSE" },
				new Object[] { pPCACTIVI, pPCGARANT, pPCCOMISI, pPCMODCOM, pPFINIVIG, pPNINIALT, pPSPRODUC, pPNFINALT,
						pPNIVEL, pPCCRITERIO, pPNDESDE, pPNHASTA, pDESGLOSE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCACTIVI);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCCOMISI);
		cStmt.setObject(5, pPCMODCOM);
		cStmt.setObject(6, pPFINIVIG);
		cStmt.setObject(7, pPNINIALT);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPNFINALT);
		cStmt.setObject(10, pPNIVEL);
		cStmt.setObject(11, pPCCRITERIO);
		cStmt.setObject(12, pPNDESDE);
		cStmt.setObject(13, pPNHASTA);
		cStmt.setObject(14, pDESGLOSE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_SET_COMISIONDESGLOSE(java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCMODCOM,
			java.sql.Date pPFINIVIG, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNFINALT, java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCCRITERIO,
			java.math.BigDecimal pPNDESDE, java.math.BigDecimal pPNHASTA, Object pDESGLOSE) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_SET_COMISIONDESGLOSE(pPCACTIVI, pPCGARANT, pPCCOMISI, pPCMODCOM,
				pPFINIVIG, pPNINIALT, pPSPRODUC, pPNFINALT, pPNIVEL, pPCCRITERIO, pPNDESDE, pPNHASTA, pDESGLOSE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_SET_COMISIONDESGLOSE

	// --START-PAC_IAX_COMISIONES.F_GET_COMISIONDESGLOSE(PCACTIVI, PCGARANT,
	// PCCOMISI, PCMODCOM, PFINIVIG, PNINIALT, PSPRODUC, PNFINALT)
	private HashMap callPAC_IAX_COMISIONES__F_GET_COMISIONDESGLOSE(java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCMODCOM,
			java.sql.Date pPFINIVIG, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNFINALT) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_COMISIONDESGLOSE(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCACTIVI", "pPCGARANT", "pPCCOMISI", "pPCMODCOM", "pPFINIVIG", "pPNINIALT",
						"pPSPRODUC", "pPNFINALT" },
				new Object[] { pPCACTIVI, pPCGARANT, pPCCOMISI, pPCMODCOM, pPFINIVIG, pPNINIALT, pPSPRODUC,
						pPNFINALT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCACTIVI);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCCOMISI);
		cStmt.setObject(5, pPCMODCOM);
		cStmt.setObject(6, pPFINIVIG);
		cStmt.setObject(7, pPNINIALT);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPNFINALT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_COMISIONDESGLOSE(java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCMODCOM,
			java.sql.Date pPFINIVIG, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNFINALT) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_COMISIONDESGLOSE(pPCACTIVI, pPCGARANT, pPCCOMISI, pPCMODCOM,
				pPFINIVIG, pPNINIALT, pPSPRODUC, pPNFINALT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_GET_COMISIONDESGLOSE

	// --START-PAC_IAX_COMISIONES.F_DEL_COMISIONDESGLOSE(PCACTIVI, PCGARANT,
	// PCCOMISI, PCMODCOM, PFINIVIG, PNINIALT, PSPRODUC, PNFINALT)
	private HashMap callPAC_IAX_COMISIONES__F_DEL_COMISIONDESGLOSE(java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCMODCOM,
			java.sql.Date pPFINIVIG, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNFINALT) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_DEL_COMISIONDESGLOSE(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCACTIVI", "pPCGARANT", "pPCCOMISI", "pPCMODCOM", "pPFINIVIG", "pPNINIALT",
						"pPSPRODUC", "pPNFINALT" },
				new Object[] { pPCACTIVI, pPCGARANT, pPCCOMISI, pPCMODCOM, pPFINIVIG, pPNINIALT, pPSPRODUC,
						pPNFINALT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCACTIVI);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPCCOMISI);
		cStmt.setObject(5, pPCMODCOM);
		cStmt.setObject(6, pPFINIVIG);
		cStmt.setObject(7, pPNINIALT);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPNFINALT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMISIONES__F_DEL_COMISIONDESGLOSE(java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCCOMISI, java.math.BigDecimal pPCMODCOM,
			java.sql.Date pPFINIVIG, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNFINALT) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_DEL_COMISIONDESGLOSE(pPCACTIVI, pPCGARANT, pPCCOMISI, pPCMODCOM,
				pPFINIVIG, pPNINIALT, pPSPRODUC, pPNFINALT);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONES.F_DEL_COMISIONDESGLOSE
	// --START-PAC_IAX_COMISIONES.F_GET_FECHAVIGENCIA(PCCOMISI)
	private HashMap callPAC_IAX_COMISIONES__F_GET_FECHAVIGENCIA(java.math.BigDecimal pPCCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_FECHAVIGENCIA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI" }, new Object[] { pPCCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_FECHAVIGENCIA(java.math.BigDecimal pPCCOMISI) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_FECHAVIGENCIA(pPCCOMISI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_GET_FECHAVIGENCIA

	// --START-PAC_IAX_COMISIONES.F_INS_CONFCLAWBACK(PNEMPRES, PNMESI, PNMESF,
	// PNANULAC)
	private HashMap callPAC_IAX_COMISIONES__F_INS_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI, java.math.BigDecimal pPNMESF, java.math.BigDecimal pPNANULAC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_INS_CONFCLAWBACK(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNEMPRES", "pPNMESI", "pPNMESF", "pPNANULAC" },
				new Object[] { pPNEMPRES, pPNMESI, pPNMESF, pPNANULAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNEMPRES);
		cStmt.setObject(3, pPNMESI);
		cStmt.setObject(4, pPNMESF);
		cStmt.setObject(5, pPNANULAC);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_INS_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI, java.math.BigDecimal pPNMESF, java.math.BigDecimal pPNANULAC)
			throws Exception {
		return this.callPAC_IAX_COMISIONES__F_INS_CONFCLAWBACK(pPNEMPRES, pPNMESI, pPNMESF, pPNANULAC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONES.F_INS_CONFCLAWBACK
	// --START-PAC_IAX_COMISIONES.F_UPD_CONFCLAWBACK(PNEMPRES, PNMESI_OLD,
	// PNMESI_NEW, PNMESF_OLD, PNMESF_NEW, PNANULAC_OLD, PNANULAC_NEW)
	private HashMap callPAC_IAX_COMISIONES__F_UPD_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI_OLD, java.math.BigDecimal pPNMESI_NEW, java.math.BigDecimal pPNMESF_OLD,
			java.math.BigDecimal pPNMESF_NEW, java.math.BigDecimal pPNANULAC_OLD, java.math.BigDecimal pPNANULAC_NEW)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_UPD_CONFCLAWBACK(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNEMPRES", "pPNMESI_OLD", "pPNMESI_NEW", "pPNMESF_OLD", "pPNMESF_NEW", "pPNANULAC_OLD",
						"pPNANULAC_NEW" },
				new Object[] { pPNEMPRES, pPNMESI_OLD, pPNMESI_NEW, pPNMESF_OLD, pPNMESF_NEW, pPNANULAC_OLD,
						pPNANULAC_NEW });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNEMPRES);
		cStmt.setObject(3, pPNMESI_OLD);
		cStmt.setObject(4, pPNMESI_NEW);
		cStmt.setObject(5, pPNMESF_OLD);
		cStmt.setObject(6, pPNMESF_NEW);
		cStmt.setObject(7, pPNANULAC_OLD);
		cStmt.setObject(8, pPNANULAC_NEW);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_UPD_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI_OLD, java.math.BigDecimal pPNMESI_NEW, java.math.BigDecimal pPNMESF_OLD,
			java.math.BigDecimal pPNMESF_NEW, java.math.BigDecimal pPNANULAC_OLD, java.math.BigDecimal pPNANULAC_NEW)
			throws Exception {
		return this.callPAC_IAX_COMISIONES__F_UPD_CONFCLAWBACK(pPNEMPRES, pPNMESI_OLD, pPNMESI_NEW, pPNMESF_OLD,
				pPNMESF_NEW, pPNANULAC_OLD, pPNANULAC_NEW);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONES.F_UPD_CONFCLAWBACK
	// --START-PAC_IAX_COMISIONES.F_DEL_CONFCLAWBACK(PNEMPRES, PNMESI, PNMESF,
	// PNANULAC)
	private HashMap callPAC_IAX_COMISIONES__F_DEL_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI, java.math.BigDecimal pPNMESF, java.math.BigDecimal pPNANULAC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_DEL_CONFCLAWBACK(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNEMPRES", "pPNMESI", "pPNMESF", "pPNANULAC" },
				new Object[] { pPNEMPRES, pPNMESI, pPNMESF, pPNANULAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNEMPRES);
		cStmt.setObject(3, pPNMESI);
		cStmt.setObject(4, pPNMESF);
		cStmt.setObject(5, pPNANULAC);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_DEL_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI, java.math.BigDecimal pPNMESF, java.math.BigDecimal pPNANULAC)
			throws Exception {
		return this.callPAC_IAX_COMISIONES__F_DEL_CONFCLAWBACK(pPNEMPRES, pPNMESI, pPNMESF, pPNANULAC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMISIONES.F_DEL_CONFCLAWBACK
	// --START-PAC_IAX_COMISIONES.F_GET_CONFCLAWBACK(PNEMPRES, PNMESI, PNMESF,
	// PNANULAC)
	private HashMap callPAC_IAX_COMISIONES__F_GET_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI, java.math.BigDecimal pPNMESF, java.math.BigDecimal pPNANULAC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_GET_CONFCLAWBACK(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNEMPRES", "pPNMESI", "pPNMESF", "pPNANULAC" },
				new Object[] { pPNEMPRES, pPNMESI, pPNMESF, pPNANULAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNEMPRES);
		cStmt.setObject(3, pPNMESI);
		cStmt.setObject(4, pPNMESF);
		cStmt.setObject(5, pPNANULAC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_GET_CONFCLAWBACK(java.math.BigDecimal pPNEMPRES,
			java.math.BigDecimal pPNMESI, java.math.BigDecimal pPNMESF, java.math.BigDecimal pPNANULAC)
			throws Exception {
		return this.callPAC_IAX_COMISIONES__F_GET_CONFCLAWBACK(pPNEMPRES, pPNMESI, pPNMESF, pPNANULAC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMISIONES.F_GET_CONFCLAWBACK

	// INI TCS_2 - ACL - 22/01/2019
	// --START-PAC_IAX_COMISIONES.F_VALIDA_CUADRO(PCCOMISI)

	private HashMap callPAC_IAX_COMISIONES__F_VALIDA_CUADRO(java.math.BigDecimal pPCCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_VALIDA_CUADRO(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI" }, new Object[] { pPCCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_VALIDA_CUADRO(java.math.BigDecimal pPCCOMISI) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_VALIDA_CUADRO(pPCCOMISI);
	}
	// --END-PAC_IAX_COMISIONES.F_VALIDA_CUADRO

	// --START-PAC_IAX_COMISIONES.F_ANULAR_CUADRO(PCCOMISI)

	private HashMap callPAC_IAX_COMISIONES__F_ANULAR_CUADRO(java.math.BigDecimal pPCCOMISI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMISIONES.F_ANULAR_CUADRO(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMISI" }, new Object[] { pPCCOMISI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMISI);
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

	public HashMap ejecutaPAC_IAX_COMISIONES__F_ANULAR_CUADRO(java.math.BigDecimal pPCCOMISI) throws Exception {
		return this.callPAC_IAX_COMISIONES__F_ANULAR_CUADRO(pPCCOMISI);
	}
	// --END-PAC_IAX_COMISIONES.F_ANULAR_CUADRO
	// FIN TCS_2 - ACL - 22/01/2019
}
