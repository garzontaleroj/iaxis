package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CTACLIENTE extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CTACLIENTE.class);
	private Connection conn = null;

	public PAC_IAX_CTACLIENTE(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CTACLIENTE.F_OBTENERMOVIMIENTOS(PSPERSON, PSSEGURO, PSPRODUC,
	// PFECHAINI, PFECHAFIN, PCMOVIMI, PCMEDMOV, PIMPORTE)
	private HashMap callPAC_IAX_CTACLIENTE__F_OBTENERMOVIMIENTOS(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPRODUC, java.sql.Date pPFECHAINI,
			java.sql.Date pPFECHAFIN, java.math.BigDecimal pPCMOVIMI, java.math.BigDecimal pPCMEDMOV,
			java.math.BigDecimal pPIMPORTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CTACLIENTE.F_OBTENERMOVIMIENTOS(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPSSEGURO", "pPSPRODUC", "pPFECHAINI", "pPFECHAFIN", "pPCMOVIMI",
						"pPCMEDMOV", "pPIMPORTE" },
				new Object[] { pPSPERSON, pPSSEGURO, pPSPRODUC, pPFECHAINI, pPFECHAFIN, pPCMOVIMI, pPCMEDMOV,
						pPIMPORTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPFECHAINI);
		cStmt.setObject(6, pPFECHAFIN);
		cStmt.setObject(7, pPCMOVIMI);
		cStmt.setObject(8, pPCMEDMOV);
		cStmt.setObject(9, pPIMPORTE);
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

	public HashMap ejecutaPAC_IAX_CTACLIENTE__F_OBTENERMOVIMIENTOS(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPRODUC, java.sql.Date pPFECHAINI,
			java.sql.Date pPFECHAFIN, java.math.BigDecimal pPCMOVIMI, java.math.BigDecimal pPCMEDMOV,
			java.math.BigDecimal pPIMPORTE) throws Exception {
		return this.callPAC_IAX_CTACLIENTE__F_OBTENERMOVIMIENTOS(pPSPERSON, pPSSEGURO, pPSPRODUC, pPFECHAINI,
				pPFECHAFIN, pPCMOVIMI, pPCMEDMOV, pPIMPORTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CTACLIENTE.F_OBTENERMOVIMIENTOS

	// --START-PAC_IAX_CTACLIENTE.F_OBTENERPOLIZAS(SPERSON)

	private HashMap callPAC_IAX_CTACLIENTE__F_OBTENERPOLIZAS(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CTACLIENTE.F_OBTENERPOLIZAS(?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CTACLIENTE__F_OBTENERPOLIZAS(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_CTACLIENTE__F_OBTENERPOLIZAS(pSPERSON); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CTACLIENTE.F_OBTENERPOLIZAS
	// --START-PAC_IAX_CTACLIENTE.F_OBTENERPERSONAS(SSEGURO)

	private HashMap callPAC_IAX_CTACLIENTE__F_OBTENERPERSONAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CTACLIENTE.F_OBTENERPERSONAS(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CTACLIENTE__F_OBTENERPERSONAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_CTACLIENTE__F_OBTENERPERSONAS(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CTACLIENTE.F_OBTENERPERSONAS

	// --START-PAC_IAX_CTACLIENTE.F_LEE_ULT_RE(PSSEGURO)
	private HashMap callPAC_IAX_CTACLIENTE__F_LEE_ULT_RE(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CTACLIENTE.F_LEE_ULT_RE(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_CTACLIENTE__F_LEE_ULT_RE(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_CTACLIENTE__F_LEE_ULT_RE(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CTACLIENTE.F_LEE_ULT_RE

	// --START-PAC_IAX_CTACLIENTE.F_UPD_NRE(PCEMPRES, PSPERSON, PSSEGURO, PNNUMLIN,
	// PNREEMBO)
	private HashMap callPAC_IAX_CTACLIENTE__F_UPD_NRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPNREEMBO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CTACLIENTE.F_UPD_NRE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPERSON", "pPSSEGURO", "pPNNUMLIN", "pPNREEMBO" },
				new Object[] { pPCEMPRES, pPSPERSON, pPSSEGURO, pPNNUMLIN, pPNREEMBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPNNUMLIN);
		cStmt.setObject(6, pPNREEMBO);
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

	public HashMap ejecutaPAC_IAX_CTACLIENTE__F_UPD_NRE(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPNREEMBO)
			throws Exception {
		return this.callPAC_IAX_CTACLIENTE__F_UPD_NRE(pPCEMPRES, pPSPERSON, pPSSEGURO, pPNNUMLIN, pPNREEMBO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CTACLIENTE.F_UPD_NRE

	// --START-PAC_IAX_CTACLIENTE.F_TRANSFERIBLE_SPL(PSSEGURO)
	private HashMap callPAC_IAX_CTACLIENTE__F_TRANSFERIBLE_SPL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CTACLIENTE.F_TRANSFERIBLE_SPL(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_CTACLIENTE__F_TRANSFERIBLE_SPL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_CTACLIENTE__F_TRANSFERIBLE_SPL(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CTACLIENTE.F_TRANSFERIBLE_SPL

	// --START-PAC_IAX_CTACLIENTE.F_OBTENER_MOVIMIENTOS_CMOVIMI6(PSEQCAJA)
	private HashMap callPAC_IAX_CTACLIENTE__F_OBTENER_MOVIMIENTOS_CMOVIMI6(java.math.BigDecimal pPSEQCAJA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CTACLIENTE.F_OBTENER_MOVIMIENTOS_CMOVIMI6(?, ?)}";

		logCall(callQuery, new String[] { "pPSEQCAJA" }, new Object[] { pPSEQCAJA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSEQCAJA);
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

	public HashMap ejecutaPAC_IAX_CTACLIENTE__F_OBTENER_MOVIMIENTOS_CMOVIMI6(java.math.BigDecimal pPSEQCAJA)
			throws Exception {
		return this.callPAC_IAX_CTACLIENTE__F_OBTENER_MOVIMIENTOS_CMOVIMI6(pPSEQCAJA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CTACLIENTE.F_OBTENER_MOVIMIENTOS_CMOVIMI6

}
