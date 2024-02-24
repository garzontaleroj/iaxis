package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready 

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_RELACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_RELACIONES.class);
	private Connection conn = null;

	public PAC_IAX_RELACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_RELACIONES.F_OBTENER_RELACIONES(PCEMPRES, PCAGENTE,
	// PSRELACION, PFINIEFE, PFFINEFE)
	private HashMap callPAC_IAX_RELACIONES__F_OBTENER_RELACIONES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSRELACION, java.sql.Date pPFINIEFE,
			java.sql.Date pPFFINEFE) throws Exception {
		String callQuery = "{?=call PAC_IAX_RELACIONES.F_OBTENER_RELACIONES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCAGENTE", "pPSRELACION", "pPFINIEFE", "pPFFINEFE" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPSRELACION, pPFINIEFE, pPFFINEFE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPSRELACION);
		cStmt.setObject(5, pPFINIEFE);
		cStmt.setObject(6, pPFFINEFE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PRELACIONES"
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
			retVal.put("PRELACIONES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PRELACIONES", null);
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

	public HashMap ejecutaPAC_IAX_RELACIONES__F_OBTENER_RELACIONES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSRELACION, java.sql.Date pPFINIEFE,
			java.sql.Date pPFFINEFE) throws Exception {
		return this.callPAC_IAX_RELACIONES__F_OBTENER_RELACIONES(pPCEMPRES, pPCAGENTE, pPSRELACION, pPFINIEFE,
				pPFFINEFE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RELACIONES.F_OBTENER_RELACIONES
	// --START-PAC_IAX_RELACIONES.F_SET_RECIBOS_RELACION(PCAGENTE, PCRELACION,
	// PNRECIBO, PCTIPO)
	private HashMap callPAC_IAX_RELACIONES__F_SET_RECIBOS_RELACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRELACION, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCTIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RELACIONES.F_SET_RECIBOS_RELACION(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPCRELACION", "pPNRECIBO", "pPCTIPO" },
				new Object[] { pPCAGENTE, pPCRELACION, pPNRECIBO, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPCRELACION);
		cStmt.setObject(4, pPNRECIBO);
		cStmt.setObject(5, pPCTIPO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_RELACIONES".toUpperCase())); // Valor de "PTOB_IAX_RELACIONES"
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
			retVal.put("PTOB_IAX_RELACIONES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PTOB_IAX_RELACIONES", null);
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

	public HashMap ejecutaPAC_IAX_RELACIONES__F_SET_RECIBOS_RELACION(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCRELACION, java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCTIPO)
			throws Exception {
		return this.callPAC_IAX_RELACIONES__F_SET_RECIBOS_RELACION(pPCAGENTE, pPCRELACION, pPNRECIBO, pPCTIPO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RELACIONES.F_SET_RECIBOS_RELACION
	// --START-PAC_IAX_RELACIONES.F_GUARDAR_RECIBO_EN_RELACION(PTIAXINFO, PCAGENTE)
	private HashMap callPAC_IAX_RELACIONES__F_GUARDAR_RECIBO_EN_RELACION(Object pPTIAXINFO,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_RELACIONES.F_GUARDAR_RECIBO_EN_RELACION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIAXINFO", "pPCAGENTE" }, new Object[] { pPTIAXINFO, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIAXINFO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSRELACION"
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
			retVal.put("PSRELACION", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSRELACION", null);
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

	public HashMap ejecutaPAC_IAX_RELACIONES__F_GUARDAR_RECIBO_EN_RELACION(Object pPTIAXINFO,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_RELACIONES__F_GUARDAR_RECIBO_EN_RELACION(pPTIAXINFO, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RELACIONES.F_GUARDAR_RECIBO_EN_RELACION

	// --START-PAC_IAX_RELACIONES.F_GET_REG_RETRO_COBRO_MASIVO(PNRECIBO)
	private HashMap callPAC_IAX_RELACIONES__F_GET_REG_RETRO_COBRO_MASIVO(java.math.BigDecimal pPNRECIBO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RELACIONES.F_GET_REG_RETRO_COBRO_MASIVO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PRECIBO"
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
			retVal.put("PRECIBO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PRECIBO", null);
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

	public HashMap ejecutaPAC_IAX_RELACIONES__F_GET_REG_RETRO_COBRO_MASIVO(java.math.BigDecimal pPNRECIBO)
			throws Exception {
		return this.callPAC_IAX_RELACIONES__F_GET_REG_RETRO_COBRO_MASIVO(pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RELACIONES.F_GET_REG_RETRO_COBRO_MASIVO

	// --START-PAC_IAX_RELACIONES.F_GET_RETRO_COBRO_MASIVO(PCEMPRES, PSPROLIQ,
	// PCIDIOMA)
	private HashMap callPAC_IAX_RELACIONES__F_GET_RETRO_COBRO_MASIVO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROLIQ, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_RELACIONES.F_GET_RETRO_COBRO_MASIVO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROLIQ", "pPCIDIOMA" },
				new Object[] { pPCEMPRES, pPSPROLIQ, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROLIQ);
		cStmt.setObject(4, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_RELACIONES__F_GET_RETRO_COBRO_MASIVO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROLIQ, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_RELACIONES__F_GET_RETRO_COBRO_MASIVO(pPCEMPRES, pPSPROLIQ, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_RELACIONES.F_GET_RETRO_COBRO_MASIVO
	// --START-PAC_IAX_RELACIONES.F_SET_RETRO_COBRO_MASIVO(PCEMPRES, PSPROLIQ,
	// PLISTRECIBOS, PFRETRO)
	private HashMap callPAC_IAX_RELACIONES__F_SET_RETRO_COBRO_MASIVO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROLIQ, String pPLISTRECIBOS, java.sql.Date pPFRETRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RELACIONES.F_SET_RETRO_COBRO_MASIVO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROLIQ", "pPLISTRECIBOS", "pPFRETRO" },
				new Object[] { pPCEMPRES, pPSPROLIQ, pPLISTRECIBOS, pPFRETRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROLIQ);
		cStmt.setObject(4, pPLISTRECIBOS);
		cStmt.setObject(5, pPFRETRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PSMOVAGR"
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
			retVal.put("PSMOVAGR", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PSMOVAGR", null);
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

	public HashMap ejecutaPAC_IAX_RELACIONES__F_SET_RETRO_COBRO_MASIVO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROLIQ, String pPLISTRECIBOS, java.sql.Date pPFRETRO) throws Exception {
		return this.callPAC_IAX_RELACIONES__F_SET_RETRO_COBRO_MASIVO(pPCEMPRES, pPSPROLIQ, pPLISTRECIBOS, pPFRETRO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RELACIONES.F_SET_RETRO_COBRO_MASIVO

}
