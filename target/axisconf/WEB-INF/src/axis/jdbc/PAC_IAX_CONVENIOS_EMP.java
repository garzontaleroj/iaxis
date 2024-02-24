package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CONVENIOS_EMP extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CONTABILIDAD.class);
	private Connection conn = null;

	public PAC_IAX_CONVENIOS_EMP(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CONVENIOS_EMP.F_DATOS_SUP_REGUL(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_DATOS_SUP_REGUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_DATOS_SUP_REGUL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_DATOS_SUP_REGUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_DATOS_SUP_REGUL(pPSSEGURO, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONVENIOS_EMP.F_DATOS_SUP_REGUL
	// --START-PAC_IAX_CONVENIOS_EMP.F_GET_GRABARCONVEMPVERS(PVERSION)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_GET_GRABARCONVEMPVERS(Object pPVERSION) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_GET_GRABARCONVEMPVERS(?, ?)}";

		logCall(callQuery, new String[] { "pPVERSION" }, new Object[] { pPVERSION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPVERSION);
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_GRABARCONVEMPVERS(Object pPVERSION) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_GET_GRABARCONVEMPVERS(pPVERSION);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONVENIOS_EMP.F_GET_GRABARCONVEMPVERS
	// --START-PAC_IAX_CONVENIOS_EMP.F_GET_LSTAMBITOS(PSPRODUC, PDESCRI)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_GET_LSTAMBITOS(java.math.BigDecimal pPSPRODUC, String pPDESCRI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_GET_LSTAMBITOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPDESCRI" }, new Object[] { pPSPRODUC, pPDESCRI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPDESCRI);
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_LSTAMBITOS(java.math.BigDecimal pPSPRODUC, String pPDESCRI)
			throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_GET_LSTAMBITOS(pPSPRODUC, pPDESCRI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONVENIOS_EMP.F_GET_LSTAMBITOS
	// --START-PAC_IAX_CONVENIOS_EMP.F_GET_LSTCONVEMPVERS(PSPRODUC, PPROVIN,
	// PDESCRI, PTCODCONV)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMPVERS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPPROVIN, String pPDESCRI, String pPTCODCONV) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_GET_LSTCONVEMPVERS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPPROVIN", "pPDESCRI", "pPTCODCONV" },
				new Object[] { pPSPRODUC, pPPROVIN, pPDESCRI, pPTCODCONV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPPROVIN);
		cStmt.setObject(4, pPDESCRI);
		cStmt.setObject(5, pPTCODCONV);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CONVEMPVERS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMPVERS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPPROVIN, String pPDESCRI, String pPTCODCONV) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMPVERS(pPSPRODUC, pPPROVIN, pPDESCRI, pPTCODCONV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONVENIOS_EMP.F_GET_LSTCONVEMPVERS

	// --START-PAC_IAX_CONVENIOS_EMP.F_GET_LSTCONVEMP(PSPRODUC, PPROVIN, PDESCRI,
	// PTCODCONV)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMP(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPPROVIN, String pPDESCRI, String pPTCODCONV) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_GET_LSTCONVEMP(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPPROVIN", "pPDESCRI", "pPTCODCONV" },
				new Object[] { pPSPRODUC, pPPROVIN, pPDESCRI, pPTCODCONV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPPROVIN);
		cStmt.setObject(4, pPDESCRI);
		cStmt.setObject(5, pPTCODCONV);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CONVEMPVERS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMP(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPPROVIN, String pPDESCRI, String pPTCODCONV) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMP(pPSPRODUC, pPPROVIN, pPDESCRI, pPTCODCONV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONVENIOS_EMP.F_GET_LSTCONVEMP

	// --START-PAC_IAX_CONVENIOS_EMP.F_GET_TRAMOSREGUL(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_GET_TRAMOSREGUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_GET_TRAMOSREGUL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_TRAMOSREGUL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_GET_TRAMOSREGUL(pPSSEGURO, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONVENIOS_EMP.F_GET_TRAMOSREGUL

	// --START-PAC_IAX_CONVENIOS_EMP.F_SET_GRABARCONVEMPVERS(PIDVERSION, PIDCONV,
	// PTCODCONV, PCESTADO, PCPERFIL, PTDESCRI, PCORGANISMO, PCVIDA, PNVERSION,
	// PCESTADOVERS, PNVERSION_ANT, PTESTADO, PTPERFIL, PTORGANISMO, PTESTADOVERS,
	// PTVIDA, PTOBSERV)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_SET_GRABARCONVEMPVERS(java.math.BigDecimal pPIDVERSION,
			java.math.BigDecimal pPIDCONV, String pPTCODCONV, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPERFIL, String pPTDESCRI, java.math.BigDecimal pPCORGANISMO,
			java.math.BigDecimal pPCVIDA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCESTADOVERS,
			java.math.BigDecimal pPNVERSION_ANT, String pPTESTADO, String pPTPERFIL, String pPTORGANISMO,
			String pPTESTADOVERS, String pPTVIDA, String pPTOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_SET_GRABARCONVEMPVERS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDVERSION", "pPIDCONV", "pPTCODCONV", "pPCESTADO", "pPCPERFIL", "pPTDESCRI",
						"pPCORGANISMO", "pPCVIDA", "pPNVERSION", "pPCESTADOVERS", "pPNVERSION_ANT", "pPTESTADO",
						"pPTPERFIL", "pPTORGANISMO", "pPTESTADOVERS", "pPTVIDA", "pPTOBSERV" },
				new Object[] { pPIDVERSION, pPIDCONV, pPTCODCONV, pPCESTADO, pPCPERFIL, pPTDESCRI, pPCORGANISMO,
						pPCVIDA, pPNVERSION, pPCESTADOVERS, pPNVERSION_ANT, pPTESTADO, pPTPERFIL, pPTORGANISMO,
						pPTESTADOVERS, pPTVIDA, pPTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDVERSION);
		cStmt.setObject(3, pPIDCONV);
		cStmt.setObject(4, pPTCODCONV);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPCPERFIL);
		cStmt.setObject(7, pPTDESCRI);
		cStmt.setObject(8, pPCORGANISMO);
		cStmt.setObject(9, pPCVIDA);
		cStmt.setObject(10, pPNVERSION);
		cStmt.setObject(11, pPCESTADOVERS);
		cStmt.setObject(12, pPNVERSION_ANT);
		cStmt.setObject(13, pPTESTADO);
		cStmt.setObject(14, pPTPERFIL);
		cStmt.setObject(15, pPTORGANISMO);
		cStmt.setObject(16, pPTESTADOVERS);
		cStmt.setObject(17, pPTVIDA);
		cStmt.setObject(18, pPTOBSERV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_SET_GRABARCONVEMPVERS(java.math.BigDecimal pPIDVERSION,
			java.math.BigDecimal pPIDCONV, String pPTCODCONV, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPERFIL, String pPTDESCRI, java.math.BigDecimal pPCORGANISMO,
			java.math.BigDecimal pPCVIDA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCESTADOVERS,
			java.math.BigDecimal pPNVERSION_ANT, String pPTESTADO, String pPTPERFIL, String pPTORGANISMO,
			String pPTESTADOVERS, String pPTVIDA, String pPTOBSERV) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_SET_GRABARCONVEMPVERS(pPIDVERSION, pPIDCONV, pPTCODCONV, pPCESTADO,
				pPCPERFIL, pPTDESCRI, pPCORGANISMO, pPCVIDA, pPNVERSION, pPCESTADOVERS, pPNVERSION_ANT, pPTESTADO,
				pPTPERFIL, pPTORGANISMO, pPTESTADOVERS, pPTVIDA, pPTOBSERV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONVENIOS_EMP.F_SET_GRABARCONVEMPVERS

	// --START-PAC_IAX_CONVENIOS_EMP.F_PROCESO_CAMB_VERSCON(PTCODCONV, PCIDIOMA)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_PROCESO_CAMB_VERSCON(String pPTCODCONV, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_PROCESO_CAMB_VERSCON(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTCODCONV", "pPCIDIOMA" }, new Object[] { pPTCODCONV, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTCODCONV);
		cStmt.setObject(3, pPCIDIOMA);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
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
			retVal.put("PSPROCES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_PROCESO_CAMB_VERSCON(String pPTCODCONV,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_PROCESO_CAMB_VERSCON(pPTCODCONV, pPCIDIOMA);// AXIS-WLS1SERVER-Ready

	}
	// --END-PAC_IAX_CONVENIOS_EMP.F_PROCESO_CAMB_VERSCON

	// --START-PAC_IAX_CONVENIOS_EMP.F_PROCESO_ANUL_VERSCON(PTCODCONV, PCIDIOMA)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_PROCESO_ANUL_VERSCON(String pPTCODCONV, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_PROCESO_ANUL_VERSCON(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTCODCONV", "pPCIDIOMA" }, new Object[] { pPTCODCONV, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTCODCONV);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
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
			retVal.put("PSPROCES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_PROCESO_ANUL_VERSCON(String pPTCODCONV,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_PROCESO_ANUL_VERSCON(pPTCODCONV, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONVENIOS_EMP.F_PROCESO_ANUL_VERSCON

	// --START-PAC_IAX_CONVENIOS_EMP.F_GET_ASEGURADOS_INNOM(PSSEGURO, PNRIESGO,
	// PNOMBRE, PNMOVIMI, PFECHA)
	private HashMap callPAC_IAX_CONVENIOS_EMP__F_GET_ASEGURADOS_INNOM(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNOMBRE, java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFECHA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONVENIOS_EMP.F_GET_ASEGURADOS_INNOM(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPNOMBRE", "pPNMOVIMI", "pPFECHA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNOMBRE, pPNMOVIMI, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNOMBRE);
		cStmt.setObject(5, pPNMOVIMI);
		cStmt.setObject(6, pPFECHA);
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

	public HashMap ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_ASEGURADOS_INNOM(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNOMBRE, java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFECHA)
			throws Exception {
		return this.callPAC_IAX_CONVENIOS_EMP__F_GET_ASEGURADOS_INNOM(pPSSEGURO, pPNRIESGO, pPNOMBRE, pPNMOVIMI,
				pPFECHA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONVENIOS_EMP.F_GET_ASEGURADOS_INNOM

}
