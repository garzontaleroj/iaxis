//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PROVISIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PROVISIONES.class);
	private Connection conn = null;

	public PAC_IAX_PROVISIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PROVISIONES.F_GET_DESPROVISIONES(PPROVIS)

	private HashMap callPAC_IAX_PROVISIONES__F_GET_DESPROVISIONES(java.math.BigDecimal pPPROVIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_DESPROVISIONES(?, ?)}";

		logCall(callQuery, new String[] { "pPPROVIS" }, new Object[] { pPPROVIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPROVIS);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_DESPROVISIONES(java.math.BigDecimal pPPROVIS) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_DESPROVISIONES(pPPROVIS);
	}
	// --END-PAC_IAX_PROVISIONES.F_GET_DESPROVISIONES
	// --START-PAC_IAX_PROVISIONES.F_GET_PROVISIONES()

	private HashMap callPAC_IAX_PROVISIONES__F_GET_PROVISIONES() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_PROVISIONES(?)}";

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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES() throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_PROVISIONES();
	}
	// --END-PAC_IAX_PROVISIONES.F_GET_PROVISIONES
	// --START-PAC_IAX_PROVISIONES.F_GET_PROVISIONES_EMP(PEMPRESA)

	private HashMap callPAC_IAX_PROVISIONES__F_GET_PROVISIONES_EMP(java.math.BigDecimal pPEMPRESA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_PROVISIONES_EMP(?, ?)}";

		logCall(callQuery, new String[] { "pPEMPRESA" }, new Object[] { pPEMPRESA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES_EMP(java.math.BigDecimal pPEMPRESA) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_PROVISIONES_EMP(pPEMPRESA);
	}
	// --END-PAC_IAX_PROVISIONES.F_GET_PROVISIONES_EMP
	// --START-PAC_IAX_PROVISIONES.F_GET_PROVISIONES_NUEVA()

	private HashMap callPAC_IAX_PROVISIONES__F_GET_PROVISIONES_NUEVA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_PROVISIONES_NUEVA(?)}";

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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES_NUEVA() throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_PROVISIONES_NUEVA();
	}
	// --END-PAC_IAX_PROVISIONES.F_GET_PROVISIONES_NUEVA
	// --START-PAC_IAX_PROVISIONES.F_GET_PROVISIONES_TIPO(PPROVIS)

	private HashMap callPAC_IAX_PROVISIONES__F_GET_PROVISIONES_TIPO(java.math.BigDecimal pPPROVIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_PROVISIONES_TIPO(?, ?)}";

		logCall(callQuery, new String[] { "pPPROVIS" }, new Object[] { pPPROVIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPROVIS);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES_TIPO(java.math.BigDecimal pPPROVIS) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_PROVISIONES_TIPO(pPPROVIS);
	}
	// --END-PAC_IAX_PROVISIONES.F_GET_PROVISIONES_TIPO
	// --START-PAC_IAX_PROVISIONES.F_GET_REPORT_PROVISION(PEMPRESA, PPREVIO,
	// PPROVIS, PMES, PANYO, PCAGENTE, PSUBAGENTE)

	private HashMap callPAC_IAX_PROVISIONES__F_GET_REPORT_PROVISION(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPPREVIO, java.math.BigDecimal pPPROVIS, java.math.BigDecimal pPMES,
			java.math.BigDecimal pPANYO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSUBAGENTE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_REPORT_PROVISION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPEMPRESA", "pPPREVIO", "pPPROVIS", "pPMES", "pPANYO", "pPCAGENTE", "pPSUBAGENTE" },
				new Object[] { pPEMPRESA, pPPREVIO, pPPROVIS, pPMES, pPANYO, pPCAGENTE, pPSUBAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPPREVIO);
		cStmt.setObject(4, pPPROVIS);
		cStmt.setObject(5, pPMES);
		cStmt.setObject(6, pPANYO);
		cStmt.setObject(7, pPCAGENTE);
		cStmt.setObject(8, pPSUBAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_REPORT_PROVISION(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPPREVIO, java.math.BigDecimal pPPROVIS, java.math.BigDecimal pPMES,
			java.math.BigDecimal pPANYO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSUBAGENTE)
			throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_REPORT_PROVISION(pPEMPRESA, pPPREVIO, pPPROVIS, pPMES, pPANYO,
				pPCAGENTE, pPSUBAGENTE);
	}
	// --END-PAC_IAX_PROVISIONES.F_GET_REPORT_PROVISION
	// --START-PAC_IAX_PROVISIONES.F_GRABAR_DESPROVISIONES(PPROVIS, PCIDIOMA,
	// PTCPROVIS, PTLPROVIS)

	private HashMap callPAC_IAX_PROVISIONES__F_GRABAR_DESPROVISIONES(java.math.BigDecimal pPPROVIS,
			java.math.BigDecimal pPCIDIOMA, String pPTCPROVIS, String pPTLPROVIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GRABAR_DESPROVISIONES(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPROVIS", "pPCIDIOMA", "pPTCPROVIS", "pPTLPROVIS" },
				new Object[] { pPPROVIS, pPCIDIOMA, pPTCPROVIS, pPTLPROVIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPROVIS);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.setObject(4, pPTCPROVIS);
		cStmt.setObject(5, pPTLPROVIS);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GRABAR_DESPROVISIONES(java.math.BigDecimal pPPROVIS,
			java.math.BigDecimal pPCIDIOMA, String pPTCPROVIS, String pPTLPROVIS) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GRABAR_DESPROVISIONES(pPPROVIS, pPCIDIOMA, pPTCPROVIS, pPTLPROVIS);
	}
	// --END-PAC_IAX_PROVISIONES.F_GRABAR_DESPROVISIONES
	// --START-PAC_IAX_PROVISIONES.F_GRABAR_PROVISIONES(PEMPRESA, PPROVIS, PFBAJA,
	// PTIPOPROV, PCREPORT)

	private HashMap callPAC_IAX_PROVISIONES__F_GRABAR_PROVISIONES(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPPROVIS, java.sql.Date pPFBAJA, java.math.BigDecimal pPTIPOPROV, String pPCREPORT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GRABAR_PROVISIONES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPEMPRESA", "pPPROVIS", "pPFBAJA", "pPTIPOPROV", "pPCREPORT" },
				new Object[] { pPEMPRESA, pPPROVIS, pPFBAJA, pPTIPOPROV, pPCREPORT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPPROVIS);
		cStmt.setObject(4, pPFBAJA);
		cStmt.setObject(5, pPTIPOPROV);
		cStmt.setObject(6, pPCREPORT);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GRABAR_PROVISIONES(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPPROVIS, java.sql.Date pPFBAJA, java.math.BigDecimal pPTIPOPROV, String pPCREPORT)
			throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GRABAR_PROVISIONES(pPEMPRESA, pPPROVIS, pPFBAJA, pPTIPOPROV, pPCREPORT);
	}
	// --END-PAC_IAX_PROVISIONES.F_GRABAR_PROVISIONES
	// --START-PAC_IAX_PROVISIONES.F_VALIDAR_PROVISION(PPROVIS)

	private HashMap callPAC_IAX_PROVISIONES__F_VALIDAR_PROVISION(java.math.BigDecimal pPPROVIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_VALIDAR_PROVISION(?, ?)}";

		logCall(callQuery, new String[] { "pPPROVIS" }, new Object[] { pPPROVIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPROVIS);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_VALIDAR_PROVISION(java.math.BigDecimal pPPROVIS) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_VALIDAR_PROVISION(pPPROVIS);
	}

	// --END-PAC_IAX_PROVISIONES.F_VALIDAR_PROVISION
	// --START-PAC_IAX_PROVISIONES.F_LLAMA_MULTIMAP_PROVIS(CMAPS, PFECHA, PCEMPRES)
	private HashMap callPAC_IAX_PROVISIONES__F_LLAMA_MULTIMAP_PROVIS(String pCMAPS, String pPFECHA,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_LLAMA_MULTIMAP_PROVIS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCMAPS", "pPFECHA", "pPCEMPRES" },
				new Object[] { pCMAPS, pPFECHA, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCMAPS);
		cStmt.setObject(3, pPFECHA);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "FICHERO"
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
			retVal.put("FICHERO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("FICHERO", null);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_LLAMA_MULTIMAP_PROVIS(String pCMAPS, String pPFECHA,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_LLAMA_MULTIMAP_PROVIS(pCMAPS, pPFECHA, pPCEMPRES);
	}
	// --END-PAC_IAX_PROVISIONES.F_LLAMA_MULTIMAP_PROVIS

	// --START-PAC_IAX_PROVISIONES.F_DETALLE_PU(PSSEGURO, PNRIESGO, PCGARANT,
	// PNMOVIMI, PFECHA)
	private HashMap callPAC_IAX_PROVISIONES__F_DETALLE_PU(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNMOVIMI,
			java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_DETALLE_PU(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCGARANT", "pPNMOVIMI", "pPFECHA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCGARANT, pPNMOVIMI, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_DETALLE_PU(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNMOVIMI,
			java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_DETALLE_PU(pPSSEGURO, pPNRIESGO, pPCGARANT, pPNMOVIMI, pPFECHA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROVISIONES.F_DETALLE_PU
	// --START-PAC_IAX_PROVISIONES.F_GET_EXCLUSIONES(PCSUCURSAL, PFDESDE, PFHASTA,
	// PNPOLIZA, PNRECIBO, PNIT, PNNUMIDE, PCAGENTE, MENSAJES)
	private HashMap callPAC_IAX_PROVISIONES__F_GET_EXCLUSIONES(java.math.BigDecimal pPCSUCURSAL, java.sql.Date pPFDESDE,
			java.sql.Date pPFHASTA, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPNIT, String pPNNUMIDE, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_EXCLUSIONES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCSUCURSAL", "pPFDESDE", "pPFHASTA", "pPNPOLIZA", "pPNRECIBO", "pPNIT", "pPNNUMIDE",
						"pPCAGENTE" },
				new Object[] { pPCSUCURSAL, pPFDESDE, pPFHASTA, pPNPOLIZA, pPNRECIBO, pPNIT, pPNNUMIDE, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCSUCURSAL);
		cStmt.setObject(3, pPFDESDE);
		cStmt.setObject(4, pPFHASTA);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNRECIBO);
		cStmt.setObject(7, pPNIT);
		cStmt.setObject(8, pPNNUMIDE);
		cStmt.setObject(9, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_EXCLUSIONES(java.math.BigDecimal pPCSUCURSAL,
			java.sql.Date pPFDESDE, java.sql.Date pPFHASTA, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPNIT, String pPNNUMIDE,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_EXCLUSIONES(pPCSUCURSAL, pPFDESDE, pPFHASTA, pPNPOLIZA, pPNRECIBO,
				pPNIT, pPNNUMIDE, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROVISIONES.F_GET_EXCLUSIONES
	// --START-PAC_IAX_PROVISIONES.F_GRABAR_EXCLUSIONES(PNPOLIZA, PNRECIBO,
	// PCOBSERVEXC, PCPROVISI, PCOBSERVP, PCNPROVISI, PCOBSERVNP, PFALTA, PFBAJA,
	// MENSAJES)
	private HashMap callPAC_IAX_PROVISIONES__F_GRABAR_EXCLUSIONES(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO, String pPCOBSERVEXC, java.math.BigDecimal pPCPROVISI, String pPCOBSERVP,
			java.math.BigDecimal pPCNPROVISI, String pPCOBSERVNP, java.sql.Date pPFALTA, java.sql.Date pPFBAJA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GRABAR_EXCLUSIONES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNPOLIZA", "pPNRECIBO", "pPCOBSERVEXC", "pPCPROVISI", "pPCOBSERVP", "pPCNPROVISI",
						"pPCOBSERVNP", "pPFALTA", "pPFBAJA" },
				new Object[] { pPNPOLIZA, pPNRECIBO, pPCOBSERVEXC, pPCPROVISI, pPCOBSERVP, pPCNPROVISI, pPCOBSERVNP,
						pPFALTA, pPFBAJA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPCOBSERVEXC);
		cStmt.setObject(5, pPCPROVISI);
		cStmt.setObject(6, pPCOBSERVP);
		cStmt.setObject(7, pPCNPROVISI);
		cStmt.setObject(8, pPCOBSERVNP);
		cStmt.setObject(9, pPFALTA);
		cStmt.setObject(10, pPFBAJA);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GRABAR_EXCLUSIONES(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO, String pPCOBSERVEXC, java.math.BigDecimal pPCPROVISI, String pPCOBSERVP,
			java.math.BigDecimal pPCNPROVISI, String pPCOBSERVNP, java.sql.Date pPFALTA, java.sql.Date pPFBAJA)
			throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GRABAR_EXCLUSIONES(pPNPOLIZA, pPNRECIBO, pPCOBSERVEXC, pPCPROVISI,
				pPCOBSERVP, pPCNPROVISI, pPCOBSERVNP, pPFALTA, pPFBAJA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROVISIONES.F_GRABAR_EXCLUSIONES
	// --START-PAC_IAX_PROVISIONES.F_DEL_EXCLUSIONES(PNPOLIZA, PNRECIBO, MENSAJES)
	private HashMap callPAC_IAX_PROVISIONES__F_DEL_EXCLUSIONES(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_DEL_EXCLUSIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNRECIBO" }, new Object[] { pPNPOLIZA, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_DEL_EXCLUSIONES(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_DEL_EXCLUSIONES(pPNPOLIZA, pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROVISIONES.F_DEL_EXCLUSIONES
	// --START-PAC_IAX_PROVISIONES.F_GET_EXCLUSIONESBYPK(PNPOLIZA, PNRECIBO,
	// MENSAJES)
	private HashMap callPAC_IAX_PROVISIONES__F_GET_EXCLUSIONESBYPK(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_EXCLUSIONESBYPK(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNRECIBO" }, new Object[] { pPNPOLIZA, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_EXCLUSIONESBYPK(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_EXCLUSIONESBYPK(pPNPOLIZA, pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROVISIONES.F_GET_EXCLUSIONESBYPK
	// --START-PAC_IAX_PROVISIONES.F_GET_EXISTEPOLIZARECIBO(PNPOLIZA, PNRECIBO,
	// MENSAJES)
	private HashMap callPAC_IAX_PROVISIONES__F_GET_EXISTEPOLIZARECIBO(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROVISIONES.F_GET_EXISTEPOLIZARECIBO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNRECIBO" }, new Object[] { pPNPOLIZA, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_PROVISIONES__F_GET_EXISTEPOLIZARECIBO(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_PROVISIONES__F_GET_EXISTEPOLIZARECIBO(pPNPOLIZA, pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROVISIONES.F_GET_EXISTEPOLIZARECIBO
}
