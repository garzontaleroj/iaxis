package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DESCUENTOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DESCUENTOS.class);
	private Connection conn = null;

	public PAC_IAX_DESCUENTOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DESCUENTOS.F_ACT_CDESC(PCDESC)
	private HashMap callPAC_IAX_DESCUENTOS__F_ACT_CDESC(java.math.BigDecimal pPCDESC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_ACT_CDESC(?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC" }, new Object[] { pPCDESC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_ACT_CDESC(java.math.BigDecimal pPCDESC) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_ACT_CDESC(pPCDESC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_ACT_CDESC
	// --START-PAC_IAX_DESCUENTOS.F_CANC_DETDESC_ALT(PCDESC, PSPRODUC, PCACTIVI,
	// PCGARANT, PNIVEL, PCMODDESC, PFINIVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_CANC_DETDESC_ALT(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_CANC_DETDESC_ALT(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDESC", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODDESC", "pPFINIVIG" },
				new Object[] { pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODDESC, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODDESC);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_CANC_DETDESC_ALT(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_CANC_DETDESC_ALT(pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODDESC, pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_CANC_DETDESC_ALT
	// --START-PAC_IAX_DESCUENTOS.F_DEL_DETDESC_ALT(PCDESC, PSPRODUC, PCACTIVI,
	// PCGARANT, PNIVEL, PCMODDESC, PFINIVIG, PNINIALT, PELIMINA)
	private HashMap callPAC_IAX_DESCUENTOS__F_DEL_DETDESC_ALT(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPELIMINA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_DEL_DETDESC_ALT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDESC", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODDESC", "pPFINIVIG",
						"pPNINIALT", "pPELIMINA" },
				new Object[] { pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODDESC, pPFINIVIG, pPNINIALT,
						pPELIMINA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODDESC);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.setObject(9, pPNINIALT);
		cStmt.setObject(10, pPELIMINA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_DEL_DETDESC_ALT(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPELIMINA) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_DEL_DETDESC_ALT(pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODDESC, pPFINIVIG, pPNINIALT, pPELIMINA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DESCUENTOS.F_DEL_DETDESC_ALT

	// --START-PAC_IAX_DESCUENTOS.F_DUPLICAR_CUADRO(PCDESC_ORI, PCDESC_NUEVO,
	// PTDESC_NUEVO)
	private HashMap callPAC_IAX_DESCUENTOS__F_DUPLICAR_CUADRO(java.math.BigDecimal pPCDESC_ORI,
			java.math.BigDecimal pPCDESC_NUEVO, String pPTDESC_NUEVO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_DUPLICAR_CUADRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC_ORI", "pPCDESC_NUEVO", "pPTDESC_NUEVO" },
				new Object[] { pPCDESC_ORI, pPCDESC_NUEVO, pPTDESC_NUEVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC_ORI);
		cStmt.setObject(3, pPCDESC_NUEVO);
		cStmt.setObject(4, pPTDESC_NUEVO);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_DUPLICAR_CUADRO(java.math.BigDecimal pPCDESC_ORI,
			java.math.BigDecimal pPCDESC_NUEVO, String pPTDESC_NUEVO) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_DUPLICAR_CUADRO(pPCDESC_ORI, pPCDESC_NUEVO, pPTDESC_NUEVO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_DUPLICAR_CUADRO
	// --START-PAC_IAX_DESCUENTOS.F_DUPLICAR_CUADRO_PROD(PCSPRODUC, PFINIVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_DUPLICAR_CUADRO_PROD(java.math.BigDecimal pPCSPRODUC,
			java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_DUPLICAR_CUADRO_PROD(?, ?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_DUPLICAR_CUADRO_PROD(java.math.BigDecimal pPCSPRODUC,
			java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_DUPLICAR_CUADRO_PROD(pPCSPRODUC, pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_DUPLICAR_CUADRO_PROD
	// --START-PAC_IAX_DESCUENTOS.F_GET_ALTURAS(PSPRODUC, PCACTIVI, PCGARANT,
	// PCDESC, PCMODDESC, PFINIVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_ALTURAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_ALTURAS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCDESC", "pPCMODDESC", "pPFINIVIG" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCDESC, pPCMODDESC, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCDESC);
		cStmt.setObject(6, pPCMODDESC);
		cStmt.setObject(7, pPFINIVIG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_ALTURAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_ALTURAS(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCDESC, pPCMODDESC,
				pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_ALTURAS
	// --START-PAC_IAX_DESCUENTOS.F_GET_CUADRODESCUENTO(PCDESC, PFINIVIG, PFFINVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_CUADRODESCUENTO(java.math.BigDecimal pPCDESC, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_CUADRODESCUENTO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC", "pPFINIVIG", "pPFFINVIG" },
				new Object[] { pPCDESC, pPFINIVIG, pPFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPFINIVIG);
		cStmt.setObject(4, pPFFINVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CUADRODESCUENTO".toUpperCase())); // Valor de "PCUADRODESCUENTO"
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
			retVal.put("PCUADRODESCUENTO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCUADRODESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_CUADRODESCUENTO(java.math.BigDecimal pPCDESC,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_CUADRODESCUENTO(pPCDESC, pPFINIVIG, pPFFINVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_CUADRODESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_GET_CUADROSDESCUENTO(PCDESC, PTDESC, PCTIPO,
	// PCESTADO, PFFECHAINI, PFFECHAFIN)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_CUADROSDESCUENTO(java.math.BigDecimal pPCDESC, String pPTDESC,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFFECHAINI,
			java.sql.Date pPFFECHAFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_CUADROSDESCUENTO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC", "pPTDESC", "pPCTIPO", "pPCESTADO", "pPFFECHAINI", "pPFFECHAFIN" },
				new Object[] { pPCDESC, pPTDESC, pPCTIPO, pPCESTADO, pPFFECHAINI, pPFFECHAFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPTDESC);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPFFECHAINI);
		cStmt.setObject(7, pPFFECHAFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CUADRODESCUENTO".toUpperCase())); // Valor de "PCUADROS"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_CUADROSDESCUENTO(java.math.BigDecimal pPCDESC, String pPTDESC,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFFECHAINI,
			java.sql.Date pPFFECHAFIN) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_CUADROSDESCUENTO(pPCDESC, pPTDESC, pPCTIPO, pPCESTADO, pPFFECHAINI,
				pPFFECHAFIN);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_CUADROSDESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO(PCDESC, PCAGRPROD, PCRAMO,
	// PSPRODUC, PCACTIVI, PCGARANT, PTODOS, PFINIVIG, PFFINVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPTODOS,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDESC", "pPCAGRPROD", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPTODOS",
						"pPFINIVIG", "pPFFINVIG" },
				new Object[] { pPCDESC, pPCAGRPROD, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPTODOS, pPFINIVIG,
						pPFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
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
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETDESCUENTO".toUpperCase())); // Valor de "PT_DESCUENTO"
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
			retVal.put("PT_DESCUENTO", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PT_DESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPTODOS,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO(pPCDESC, pPCAGRPROD, pPCRAMO, pPSPRODUC, pPCACTIVI,
				pPCGARANT, pPTODOS, pPFINIVIG, pPFFINVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO_OBJ(PCDESC, PSPRODUC,
	// PCACTIVI, PCGARANT, PCMODDESC)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO_OBJ(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCMODDESC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO_OBJ(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCMODDESC" },
				new Object[] { pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCMODDESC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPCMODDESC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETDESCUENTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO_OBJ(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCMODDESC) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO_OBJ(pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT,
				pPCMODDESC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO_OBJ
	// --START-PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO_PROD(PCDESC, PCAGRPROD,
	// PCRAMO, PSPRODUC, PCACTIVI, PCGARANT, PFINIVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO_PROD(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO_PROD(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDESC", "pPCAGRPROD", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPFINIVIG" },
				new Object[] { pPCDESC, pPCAGRPROD, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPCAGRPROD);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETDESCUENTO".toUpperCase())); // Valor de "PT_DESCUENTO"
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
			retVal.put("PT_DESCUENTO", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PT_DESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO_PROD(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCAGRPROD, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO_PROD(pPCDESC, pPCAGRPROD, pPCRAMO, pPSPRODUC,
				pPCACTIVI, pPCGARANT, pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_DETALLE_DESCUENTO_PROD
	// --START-PAC_IAX_DESCUENTOS.F_GET_DETALLE_NIVEL(PSPRODUC, PCACTIVI, PCGARANT,
	// PCNIVEL, PCDESC)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_DETALLE_NIVEL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.math.BigDecimal pPCDESC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_DETALLE_NIVEL(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCNIVEL", "pPCDESC" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT, pPCNIVEL, pPCDESC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCNIVEL);
		cStmt.setObject(6, pPCDESC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETDESCUENTO".toUpperCase())); // Valor de "PT_DESCUENTO"
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
			retVal.put("PT_DESCUENTO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PT_DESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_NIVEL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.math.BigDecimal pPCDESC) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_DETALLE_NIVEL(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCNIVEL, pPCDESC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_DETALLE_NIVEL
	// --START-PAC_IAX_DESCUENTOS.F_GET_DETDESC_ALT(PCDESC, PSPRODUC, PCACTIVI,
	// PCGARANT, PNIVEL, PCMODDESC, PFINIVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_DETDESC_ALT(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_DETDESC_ALT(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDESC", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODDESC", "pPFINIVIG" },
				new Object[] { pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODDESC, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODDESC);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETDESCUENTO".toUpperCase())); // Valor de "PT_DESCUENTO"
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
			retVal.put("PT_DESCUENTO", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PT_DESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_DETDESC_ALT(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_DETDESC_ALT(pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODDESC, pPFINIVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_DETDESC_ALT
	// --START-PAC_IAX_DESCUENTOS.F_GET_HIST_CUADRODESCUENTO(PCDESC)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_HIST_CUADRODESCUENTO(java.math.BigDecimal pPCDESC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_HIST_CUADRODESCUENTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC" }, new Object[] { pPCDESC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CUADRODESCUENTO".toUpperCase())); // Valor de "PDETDESCUENTO"
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
			retVal.put("PDETDESCUENTO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDETDESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_HIST_CUADRODESCUENTO(java.math.BigDecimal pPCDESC)
			throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_HIST_CUADRODESCUENTO(pPCDESC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_HIST_CUADRODESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_GET_LSFECHASVIGENCIA(PSPRODUC, PCTIPO)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_LSFECHASVIGENCIA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_LSFECHASVIGENCIA(?, ?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_LSFECHASVIGENCIA(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_LSFECHASVIGENCIA(pPSPRODUC, pPCTIPO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_LSFECHASVIGENCIA
	// --START-PAC_IAX_DESCUENTOS.F_GET_OBJ_CUADRODESCUENTO(PCDESC)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_OBJ_CUADRODESCUENTO(java.math.BigDecimal pPCDESC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_OBJ_CUADRODESCUENTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC" }, new Object[] { pPCDESC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CUADRODESCUENTO".toUpperCase())); // Valor de "PCUADRODESCUENTO"
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
			retVal.put("PCUADRODESCUENTO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCUADRODESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_OBJ_CUADRODESCUENTO(java.math.BigDecimal pPCDESC) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_OBJ_CUADRODESCUENTO(pPCDESC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_OBJ_CUADRODESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_GET_OBJ_DETALLE_DESCUENTO()
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_OBJ_DETALLE_DESCUENTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_OBJ_DETALLE_DESCUENTO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETDESCUENTO".toUpperCase())); // Valor de "PDETALLEDESCUENTO"
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
			retVal.put("PDETALLEDESCUENTO", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PDETALLEDESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_OBJ_DETALLE_DESCUENTO() throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_OBJ_DETALLE_DESCUENTO();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_OBJ_DETALLE_DESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_GET_PORPRODUCTO(PSPRODUC, PCACTIVI, PCGARANT,
	// PCNIVEL, PCFINIVIG)
	private HashMap callPAC_IAX_DESCUENTOS__F_GET_PORPRODUCTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.sql.Date pPCFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_GET_PORPRODUCTO(?, ?, ?, ?, ?, ?, ?)}";

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
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETDESCUENTO".toUpperCase())); // Valor de "PT_DESCUENTO"
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
			retVal.put("PT_DESCUENTO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PT_DESCUENTO", null);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_GET_PORPRODUCTO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCNIVEL,
			java.sql.Date pPCFINIVIG) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_GET_PORPRODUCTO(pPSPRODUC, pPCACTIVI, pPCGARANT, pPCNIVEL, pPCFINIVIG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_GET_PORPRODUCTO
	// --START-PAC_IAX_DESCUENTOS.F_SET_DETALLE_DESCUENTO(PCDESC, PSPRODUC,
	// PCACTIVI, PCGARANT, PNIVEL, PCMODDESC, PFINIVIG, PPDESC, PNINIALT, PNFINALT,
	// PNINDICE)
	private HashMap callPAC_IAX_DESCUENTOS__F_SET_DETALLE_DESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPPDESC, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT,
			java.math.BigDecimal pPNINDICE) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_SET_DETALLE_DESCUENTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDESC", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPNIVEL", "pPCMODDESC", "pPFINIVIG",
						"pPPDESC", "pPNINIALT", "pPNFINALT", "pPNINDICE" },
				new Object[] { pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL, pPCMODDESC, pPFINIVIG, pPPDESC,
						pPNINIALT, pPNFINALT, pPNINDICE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNIVEL);
		cStmt.setObject(7, pPCMODDESC);
		cStmt.setObject(8, pPFINIVIG);
		cStmt.setObject(9, pPPDESC);
		cStmt.setObject(10, pPNINIALT);
		cStmt.setObject(11, pPNFINALT);
		cStmt.setObject(12, pPNINDICE);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_SET_DETALLE_DESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNIVEL, java.math.BigDecimal pPCMODDESC, java.sql.Date pPFINIVIG,
			java.math.BigDecimal pPPDESC, java.math.BigDecimal pPNINIALT, java.math.BigDecimal pPNFINALT,
			java.math.BigDecimal pPNINDICE) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_SET_DETALLE_DESCUENTO(pPCDESC, pPSPRODUC, pPCACTIVI, pPCGARANT, pPNIVEL,
				pPCMODDESC, pPFINIVIG, pPPDESC, pPNINIALT, pPNFINALT, pPNINDICE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_SET_DETALLE_DESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_SET_OBJ_CUADRODESCUENTO(PCDESC, PCTIPO,
	// PCESTADO, PFINIVIG, PFFINVIG, PMODO)
	private HashMap callPAC_IAX_DESCUENTOS__F_SET_OBJ_CUADRODESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_SET_OBJ_CUADRODESCUENTO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDESC", "pPCTIPO", "pPCESTADO", "pPFINIVIG", "pPFFINVIG", "pPMODO" },
				new Object[] { pPCDESC, pPCTIPO, pPCESTADO, pPFINIVIG, pPFFINVIG, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_SET_OBJ_CUADRODESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, String pPMODO) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_SET_OBJ_CUADRODESCUENTO(pPCDESC, pPCTIPO, pPCESTADO, pPFINIVIG, pPFFINVIG,
				pPMODO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_SET_OBJ_CUADRODESCUENTO
	// --START-PAC_IAX_DESCUENTOS.F_SET_OBJ_DESCCUADRO(PCIDIOMA, PCDESC, PTDESC)
	private HashMap callPAC_IAX_DESCUENTOS__F_SET_OBJ_DESCCUADRO(java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCDESC, String pPTDESC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_SET_OBJ_DESCCUADRO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCIDIOMA", "pPCDESC", "pPTDESC" },
				new Object[] { pPCIDIOMA, pPCDESC, pPTDESC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCIDIOMA);
		cStmt.setObject(3, pPCDESC);
		cStmt.setObject(4, pPTDESC);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_SET_OBJ_DESCCUADRO(java.math.BigDecimal pPCIDIOMA,
			java.math.BigDecimal pPCDESC, String pPTDESC) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_SET_OBJ_DESCCUADRO(pPCIDIOMA, pPCDESC, pPTDESC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_SET_OBJ_DESCCUADRO
	// --START-PAC_IAX_DESCUENTOS.F_SET_TRASPASO_DETALLE_OBJ_BD()
	private HashMap callPAC_IAX_DESCUENTOS__F_SET_TRASPASO_DETALLE_OBJ_BD() throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_SET_TRASPASO_DETALLE_OBJ_BD(?)}";

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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_SET_TRASPASO_DETALLE_OBJ_BD() throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_SET_TRASPASO_DETALLE_OBJ_BD();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCUENTOS.F_SET_TRASPASO_DETALLE_OBJ_BD
	// --START-PAC_IAX_DESCUENTOS.F_SET_TRASPASO_OBJ_BD()
	private HashMap callPAC_IAX_DESCUENTOS__F_SET_TRASPASO_OBJ_BD() throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_SET_TRASPASO_OBJ_BD(?)}";

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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_SET_TRASPASO_OBJ_BD() throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_SET_TRASPASO_OBJ_BD();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DESCUENTOS.F_SET_TRASPASO_OBJ_BD

	// --START-PAC_IAX_DESCUENTOS.F_SET_CUADRODESCUENTO(PCDESC, PCTIPO, PCESTADO,
	// PFINIVIG, PFFINVIG, PDESCRIPCIONES, PMODO)
	private HashMap callPAC_IAX_DESCUENTOS__F_SET_CUADRODESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, Object pPDESCRIPCIONES, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCUENTOS.F_SET_CUADRODESCUENTO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDESC", "pPCTIPO", "pPCESTADO", "pPFINIVIG", "pPFFINVIG", "pPDESCRIPCIONES",
						"pPMODO" },
				new Object[] { pPCDESC, pPCTIPO, pPCESTADO, pPFINIVIG, pPFFINVIG, pPDESCRIPCIONES, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDESC);
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

	public HashMap ejecutaPAC_IAX_DESCUENTOS__F_SET_CUADRODESCUENTO(java.math.BigDecimal pPCDESC,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, Object pPDESCRIPCIONES, String pPMODO) throws Exception {
		return this.callPAC_IAX_DESCUENTOS__F_SET_CUADRODESCUENTO(pPCDESC, pPCTIPO, pPCESTADO, pPFINIVIG, pPFFINVIG,
				pPDESCRIPCIONES, pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DESCUENTOS.F_SET_CUADRODESCUENTO

}
