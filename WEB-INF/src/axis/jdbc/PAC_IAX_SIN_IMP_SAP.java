package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_IMP_SAP extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ADM.class);
	private Connection conn = null;

	public PAC_IAX_SIN_IMP_SAP(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_IMP_SAP.F_DEL_IMPUESTO_PROF(PSPROFES, PCTIPIND)
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_DEL_IMPUESTO_PROF(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCTIPIND) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_DEL_IMPUESTO_PROF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES", "pPCTIPIND" }, new Object[] { pPSPROFES, pPCTIPIND });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPCTIPIND);
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

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_DEL_IMPUESTO_PROF(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCTIPIND) throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_DEL_IMPUESTO_PROF(pPSPROFES, pPCTIPIND);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_IMP_SAP.F_DEL_IMPUESTO_PROF
	// --START-PAC_IAX_SIN_IMP_SAP.F_GET_INDICADOR_PROF(PCCONPAG, PSPROFES,
	// PCCODIMP, PFORDPAG, PNSINIES, PNTRAMIT, PNLOCALI)
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(java.math.BigDecimal pPCCONPAG,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCCODIMP, java.sql.Date pPFORDPAG, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_GET_INDICADOR_PROF(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCONPAG", "pPSPROFES", "pPCCODIMP", "pPFORDPAG", "pPNSINIES", "pPNTRAMIT",
						"pPNLOCALI" },
				new Object[] { pPCCONPAG, pPSPROFES, pPCCODIMP, pPFORDPAG, pPNSINIES, pPNTRAMIT, pPNLOCALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONPAG);
		cStmt.setObject(3, pPSPROFES);
		cStmt.setObject(4, pPCCODIMP);
		cStmt.setObject(5, pPFORDPAG);
		cStmt.setObject(6, pPNSINIES);
		cStmt.setObject(7, pPNTRAMIT);
		cStmt.setObject(8, pPNLOCALI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(java.math.BigDecimal pPCCONPAG,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCCODIMP, java.sql.Date pPFORDPAG, String pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNLOCALI) throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(pPCCONPAG, pPSPROFES, pPCCODIMP, pPFORDPAG, pPNSINIES,
				pPNTRAMIT, pPNLOCALI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMP_SAP.F_GET_INDICADOR_PROF

	// --START-PAC_IAX_SIN_IMP_SAP.F_GET_LSTIMPUESTOS()
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_GET_LSTIMPUESTOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_GET_LSTIMPUESTOS(?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_LSTIMPUESTOS() throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_GET_LSTIMPUESTOS();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_IMP_SAP.F_GET_LSTIMPUESTOS
	// --IAXIS 7655 CONCEPTOS DE PAGO AABC
	// START-PAC_IAX_SIN_IMP_SAP.F_GET_CONCEP_PAGO()
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_GET_CONCEP_PAGO() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_GET_CONCEP_PAGO(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_CONCEP_PAGO() throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_GET_CONCEP_PAGO();// AXIS-WLS1SERVER-Ready
	}
	// --IAXIS 7655 CONCEPTOS DE PAGO AABC END
	// PAC_IAX_SIN_IMP_SAP.F_GET_CONCEP_PAGO()

	// inicio Bartolo Herrera
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(java.math.BigDecimal pPCCODIMP,
			java.math.BigDecimal pPCAREA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_GET_TIPOS_INDICADOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIMP" }, new Object[] { pPCCODIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIMP);
		cStmt.setObject(3, pPCAREA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready CCODVIN
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(java.math.BigDecimal pPCCODIMP,
			java.math.BigDecimal pPCAREA) throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(pPCCODIMP, pPCAREA);// AXIS-WLS1SERVER-Ready
	}
	// fin Bartolo Herrera

	// --START-PAC_IAX_SIN_IMP_SAP.F_GET_TIPOS_INDICADOR(PCCODIMP)
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(java.math.BigDecimal pPCCODIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_GET_TIPOS_INDICADOR(?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIMP" }, new Object[] { pPCCODIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIMP);
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

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(java.math.BigDecimal pPCCODIMP) throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(pPCCODIMP);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_IMP_SAP.F_GET_TIPOS_INDICADOR
	// --START-PAC_IAX_SIN_IMP_SAP.F_SET_IMPUESTO_PROF(PSPROFES, PCCODIMP, PCTIPIND)
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PROF(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCCODIMP, java.math.BigDecimal pPCTIPIND) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_SET_IMPUESTO_PROF(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES", "pPCCODIMP", "pPCTIPIND" },
				new Object[] { pPSPROFES, pPCCODIMP, pPCTIPIND });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPCCODIMP);
		cStmt.setObject(4, pPCTIPIND);
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

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PROF(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPCCODIMP, java.math.BigDecimal pPCTIPIND) throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PROF(pPSPROFES, pPCCODIMP, pPCTIPIND);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIN_IMP_SAP.F_SET_IMPUESTO_PROF
	// --INI--WAJ
	private HashMap callPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PER(java.math.BigDecimal pPCCODVIN,
			java.math.BigDecimal pPCCODAGEN, java.math.BigDecimal pPCTIPIND, java.math.BigDecimal pSPERSON)
			throws Exception {
		/* Cambio para IAXIS-14685 : start */
		String callQuery = "{?=call PAC_IAX_SIN_IMP_SAP.F_SET_IMPUESTO_PER(?, ?, ?, ?, ?, ?)}";
		/* Cambio para IAXIS-14685 : end */
		logCall(callQuery, new String[] { "pPCCODVIN", "pPCCODAGEN", "pPCTIPIND", "pSPERSON" },
				new Object[] { pPCCODVIN, pPCCODAGEN, pPCTIPIND, pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODVIN);
		cStmt.setObject(3, pPCCODAGEN);
		cStmt.setObject(4, pPCTIPIND);
		cStmt.setObject(5, pSPERSON);
		/* Cambio para IAXIS-14685 : start */
		cStmt.setBigDecimal(7, java.math.BigDecimal.ZERO);
		/* Cambio para IAXIS-14685 : end */
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
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PER(java.math.BigDecimal pPCCODVIN,
			java.math.BigDecimal pPCCODAGEN, java.math.BigDecimal pPCTIPIND, java.math.BigDecimal pSPERSON)
			throws Exception {
		return this.callPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PER(pPCCODVIN, pPCCODAGEN, pPCTIPIND, pSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --FIN--WAJ

}
