package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CARGA_PREGUNTAB extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CARGA_PREGUNTAB.class);
	private Connection conn = null;

	public PAC_IAX_CARGA_PREGUNTAB(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CARGA_PREGUNTAB.F_GET_PREGUNTAB_RIE(PTABLAS, PSSEGURO,
	// PNRIESGO, PCPREGUN, PCGARANT, PNMOVIMI, PCNIVEL, PSPRODUC)
	private HashMap callPAC_IAX_CARGA_PREGUNTAB__F_GET_PREGUNTAB_RIE(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVIMI, String pPCNIVEL, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_PREGUNTAB.F_GET_PREGUNTAB_RIE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPTABLAS", "pPSSEGURO", "pPNRIESGO", "pPCPREGUN", "pPCGARANT", "pPNMOVIMI", "pPCNIVEL",
						"pPSPRODUC" },
				new Object[] { pPTABLAS, pPSSEGURO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPNMOVIMI, pPCNIVEL, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCPREGUN);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPNMOVIMI);
		cStmt.setObject(8, pPCNIVEL);
		cStmt.setObject(9, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTASTAB".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PSPROCES_OUT"
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
			retVal.put("PSPROCES_OUT", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PSPROCES_OUT", null);
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

	public HashMap ejecutaPAC_IAX_CARGA_PREGUNTAB__F_GET_PREGUNTAB_RIE(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVIMI, String pPCNIVEL, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_CARGA_PREGUNTAB__F_GET_PREGUNTAB_RIE(pPTABLAS, pPSSEGURO, pPNRIESGO, pPCPREGUN,
				pPCGARANT, pPNMOVIMI, pPCNIVEL, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_PREGUNTAB.F_GET_PREGUNTAB_RIE

	// --START-PAC_IAX_CARGA_PREGUNTAB.F_EJECUTAR_CARGA_PREGUNTAB(P_NOMBRE, P_PATH,
	// P_CPROCES, P_SSEGURO, P_NRIESGO, P_CGARANT, P_CPREGUN, P_NMOVIMI, PTABLAS)
	private HashMap callPAC_IAX_CARGA_PREGUNTAB__F_EJECUTAR_CARGA_PREGUNTAB(String pP_NOMBRE, String pP_PATH,
			java.math.BigDecimal pP_CPROCES, java.math.BigDecimal pP_SSEGURO, java.math.BigDecimal pP_NRIESGO,
			java.math.BigDecimal pP_CGARANT, java.math.BigDecimal pP_CPREGUN, java.math.BigDecimal pP_NMOVIMI,
			String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_PREGUNTAB.F_EJECUTAR_CARGA_PREGUNTAB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_NOMBRE", "pP_PATH", "pP_CPROCES", "pP_SSEGURO", "pP_NRIESGO", "pP_CGARANT",
						"pP_CPREGUN", "pP_NMOVIMI", "pPTABLAS" },
				new Object[] { pP_NOMBRE, pP_PATH, pP_CPROCES, pP_SSEGURO, pP_NRIESGO, pP_CGARANT, pP_CPREGUN,
						pP_NMOVIMI, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NOMBRE);
		cStmt.setObject(3, pP_PATH);
		cStmt.setObject(4, pP_CPROCES);
		cStmt.setObject(5, pP_SSEGURO);
		cStmt.setObject(6, pP_NRIESGO);
		cStmt.setObject(7, pP_CGARANT);
		cStmt.setObject(8, pP_CPREGUN);
		cStmt.setObject(9, pP_NMOVIMI);
		cStmt.setObject(10, pPTABLAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
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
			retVal.put("PSPROCES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_CARGA_PREGUNTAB__F_EJECUTAR_CARGA_PREGUNTAB(String pP_NOMBRE, String pP_PATH,
			java.math.BigDecimal pP_CPROCES, java.math.BigDecimal pP_SSEGURO, java.math.BigDecimal pP_NRIESGO,
			java.math.BigDecimal pP_CGARANT, java.math.BigDecimal pP_CPREGUN, java.math.BigDecimal pP_NMOVIMI,
			String pPTABLAS) throws Exception {
		return this.callPAC_IAX_CARGA_PREGUNTAB__F_EJECUTAR_CARGA_PREGUNTAB(pP_NOMBRE, pP_PATH, pP_CPROCES, pP_SSEGURO,
				pP_NRIESGO, pP_CGARANT, pP_CPREGUN, pP_NMOVIMI, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_PREGUNTAB.F_EJECUTAR_CARGA_PREGUNTAB

	// --START-PAC_IAX_CARGA_PREGUNTAB.F_BORRAR_CARGA(PSSEGURO, PCPREGUN, PNRIESGO,
	// PCGARANT, PNMOVIMI, PCNIVEL)
	private HashMap callPAC_IAX_CARGA_PREGUNTAB__F_BORRAR_CARGA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVIMI, String pPCNIVEL) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_PREGUNTAB.F_BORRAR_CARGA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCPREGUN", "pPNRIESGO", "pPCGARANT", "pPNMOVIMI", "pPCNIVEL" },
				new Object[] { pPSSEGURO, pPCPREGUN, pPNRIESGO, pPCGARANT, pPNMOVIMI, pPCNIVEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCPREGUN);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNMOVIMI);
		cStmt.setObject(7, pPCNIVEL);
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

	public HashMap ejecutaPAC_IAX_CARGA_PREGUNTAB__F_BORRAR_CARGA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVIMI, String pPCNIVEL) throws Exception {
		return this.callPAC_IAX_CARGA_PREGUNTAB__F_BORRAR_CARGA(pPSSEGURO, pPCPREGUN, pPNRIESGO, pPCGARANT, pPNMOVIMI,
				pPCNIVEL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_PREGUNTAB.F_BORRAR_CARGA

	// --START-PAC_IAX_CARGA_PREGUNTAB.F_VALIDAR_CARGA(PSPROCES, PSSEGURO, PNRIESGO,
	// PCGARANT, PCPREGUN, PNMOVIMI)
	private HashMap callPAC_IAX_CARGA_PREGUNTAB__F_VALIDAR_CARGA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_PREGUNTAB.F_VALIDAR_CARGA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPSSEGURO", "pPNRIESGO", "pPCGARANT", "pPCPREGUN", "pPNMOVIMI" },
				new Object[] { pPSPROCES, pPSSEGURO, pPNRIESGO, pPCGARANT, pPCPREGUN, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPCPREGUN);
		cStmt.setObject(7, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_CARGA_PREGUNTAB__F_VALIDAR_CARGA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_CARGA_PREGUNTAB__F_VALIDAR_CARGA(pPSPROCES, pPSSEGURO, pPNRIESGO, pPCGARANT, pPCPREGUN,
				pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_PREGUNTAB.F_VALIDAR_CARGA

	// --START-PAC_IAX_CARGA_PREGUNTAB.F_CARGAS_VALIDADAS(PSSEGURO)
	private HashMap callPAC_IAX_CARGA_PREGUNTAB__F_CARGAS_VALIDADAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_PREGUNTAB.F_CARGAS_VALIDADAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PEMITIR"
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
			retVal.put("PEMITIR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PEMITIR", null);
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

	public HashMap ejecutaPAC_IAX_CARGA_PREGUNTAB__F_CARGAS_VALIDADAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_CARGA_PREGUNTAB__F_CARGAS_VALIDADAS(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_PREGUNTAB.F_CARGAS_VALIDADAS

}