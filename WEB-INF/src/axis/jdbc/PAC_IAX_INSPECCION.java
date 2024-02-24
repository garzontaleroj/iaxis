package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_INSPECCION extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_INSPECCION.class);
	private Connection conn = null;

	public PAC_IAX_INSPECCION(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_INSPECCION.F_GET_ORD_INSPEC_MOD_CONSULTA(PSSEGURO, PNMOVIMI,
	// PNRIESGO)
	private HashMap callPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GET_ORD_INSPEC_MOD_CONSULTA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PNECESITAINSPECCION"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PRESULTADOINSPECCION"
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
			retVal.put("PNECESITAINSPECCION", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PNECESITAINSPECCION", null);
		}
		try {
			retVal.put("PRESULTADOINSPECCION", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PRESULTADOINSPECCION", null);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(pPSSEGURO, pPNMOVIMI, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_GET_ORD_INSPEC_MOD_CONSULTA

	// --START-PAC_IAX_INSPECCION.F_GET_ORDENES_INSPECCION(PSSEGURO, PNMOVIMI,
	// PNRIESGO, PTABLAS)
	private HashMap callPAC_IAX_INSPECCION__F_GET_ORDENES_INSPECCION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GET_ORDENES_INSPECCION(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO", "pPTABLAS" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPTABLAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNECESITAINSPECCION"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PRESULTADOINSPECCION"
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
			retVal.put("PNECESITAINSPECCION", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNECESITAINSPECCION", null);
		}
		try {
			retVal.put("PRESULTADOINSPECCION", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PRESULTADOINSPECCION", null);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GET_ORDENES_INSPECCION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GET_ORDENES_INSPECCION(pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_GET_ORDENES_INSPECCION

	// --START-PAC_IAX_INSPECCION.F_NECESITA_INSPECCION(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_INSPECCION__F_NECESITA_INSPECCION(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_NECESITA_INSPECCION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_NECESITA_INSPECCION(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_INSPECCION__F_NECESITA_INSPECCION(pPSSEGURO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_NECESITA_INSPECCION

	// --START-PAC_IAX_INSPECCION.F_DESRETENER(PSSEGURO, PNMOVIMI, PNRIESGO,
	// PTABLAS)
	private HashMap callPAC_IAX_INSPECCION__F_DESRETENER(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI,
			java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_DESRETENER(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO", "pPTABLAS" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPTABLAS);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_DESRETENER(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_DESRETENER(pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INSPECCION.F_DESRETENER
	// --START-PAC_IAX_INSPECCION.F_PERMITE_EMITIRINSPECCION(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPECCION(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_PERMITE_EMITIRINSPECCION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
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

	// --START-PAC_IAX_INSPECCION.F_PERMITE_EMITIRINSPEC_PEND(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPEC_PEND(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_PERMITE_EMITIRINSPEC_PEND(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPEC_PEND(java.math.BigDecimal pPSSEGURO,
			String pPTABLAS) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPEC_PEND(pPSSEGURO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_PERMITE_EMITIRINSPEC_PEND

	public HashMap ejecutaPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPECCION(java.math.BigDecimal pPSSEGURO,
			String pPTABLAS) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPECCION(pPSSEGURO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INSPECCION.F_PERMITE_EMITIRINSPECCION
	// --START-PAC_IAX_INSPECCION.F_AUTORIZAR_TODO_MENOS_INSPEC(PTABLAS, PSSEGURO,
	// PNMOVIMI, PNRIESGO, PCAUTREC, PNOCURRE)
	private HashMap callPAC_IAX_INSPECCION__F_AUTORIZAR_TODO_MENOS_INSPEC(String pPTABLAS,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCAUTREC, java.math.BigDecimal pPNOCURRE) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_AUTORIZAR_TODO_MENOS_INSPEC(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTABLAS", "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO", "pPCAUTREC", "pPNOCURRE" },
				new Object[] { pPTABLAS, pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPCAUTREC, pPNOCURRE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNRIESGO);
		cStmt.setObject(6, pPCAUTREC);
		cStmt.setObject(7, pPNOCURRE);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_AUTORIZAR_TODO_MENOS_INSPEC(String pPTABLAS,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCAUTREC, java.math.BigDecimal pPNOCURRE) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_AUTORIZAR_TODO_MENOS_INSPEC(pPTABLAS, pPSSEGURO, pPNMOVIMI, pPNRIESGO,
				pPCAUTREC, pPNOCURRE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_AUTORIZAR_TODO_MENOS_INSPEC

	// --START-PAC_IAX_INSPECCION.F_LANZA_SOLICITUD_INSP(PTABLAS, PSSEGURO,
	// PNMOVIMI, PNRIESGO)
	private HashMap callPAC_IAX_INSPECCION__F_LANZA_SOLICITUD_INSP(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_LANZA_SOLICITUD_INSP(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTABLAS", "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO" },
				new Object[] { pPTABLAS, pPSSEGURO, pPNMOVIMI, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_LANZA_SOLICITUD_INSP(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_LANZA_SOLICITUD_INSP(pPTABLAS, pPSSEGURO, pPNMOVIMI, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INSPECCION.F_LANZA_SOLICITUD_INSP
	// --START-PAC_IAX_INSPECCION.F_REVISAR_INSPECCION(PTABLAS, PSSEGURO, PNMOVIMI,
	// PNRIESGO)
	private HashMap callPAC_IAX_INSPECCION__F_REVISAR_INSPECCION(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_REVISAR_INSPECCION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTABLAS", "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO" },
				new Object[] { pPTABLAS, pPSSEGURO, pPNMOVIMI, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_REVISAR_INSPECCION(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_REVISAR_INSPECCION(pPTABLAS, pPSSEGURO, pPNMOVIMI, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_REVISAR_INSPECCION

	// --START-PAC_IAX_INSPECCION.F_GET_IRORDENES(PTABLAS, PCTIPMAT, PCMATRIC,
	// PSORDEN, PNINSPECCION)
	private HashMap callPAC_IAX_INSPECCION__F_GET_IRORDENES(String pPTABLAS, java.math.BigDecimal pPCTIPMAT,
			String pPCMATRIC, java.math.BigDecimal pPSORDEN, java.math.BigDecimal pPNINSPECCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GET_IRORDENES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTABLAS", "pPCTIPMAT", "pPCMATRIC", "pPSORDEN", "pPNINSPECCION" },
				new Object[] { pPTABLAS, pPCTIPMAT, pPCMATRIC, pPSORDEN, pPNINSPECCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPCTIPMAT);
		cStmt.setObject(4, pPCMATRIC);
		cStmt.setObject(5, pPSORDEN);
		cStmt.setObject(6, pPNINSPECCION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GET_IRORDENES(String pPTABLAS, java.math.BigDecimal pPCTIPMAT,
			String pPCMATRIC, java.math.BigDecimal pPSORDEN, java.math.BigDecimal pPNINSPECCION) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GET_IRORDENES(pPTABLAS, pPCTIPMAT, pPCMATRIC, pPSORDEN, pPNINSPECCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_GET_IRORDENES

	// --START-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONES(PSORDEN, PNINSPECCION)
	private HashMap callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONES(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GET_IRINSPECCIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSORDEN", "pPNINSPECCION" }, new Object[] { pPSORDEN, pPNINSPECCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSORDEN);
		cStmt.setObject(3, pPNINSPECCION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONES(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONES(pPSORDEN, pPNINSPECCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONES

	// --START-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESDVEH(PSORDEN, PNINSPECCION)
	private HashMap callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDVEH(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESDVEH(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSORDEN", "pPNINSPECCION" }, new Object[] { pPSORDEN, pPNINSPECCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSORDEN);
		cStmt.setObject(3, pPNINSPECCION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDVEH(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDVEH(pPSORDEN, pPNINSPECCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESDVEH

	// --START-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESACC(PSORDEN, PNINSPECCION)
	private HashMap callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESACC(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESACC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSORDEN", "pPNINSPECCION" }, new Object[] { pPSORDEN, pPNINSPECCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSORDEN);
		cStmt.setObject(3, pPNINSPECCION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESACC(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESACC(pPSORDEN, pPNINSPECCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESACC

	// --START-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESDOC(PSORDEN, PNINSPECCION)
	private HashMap callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDOC(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESDOC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSORDEN", "pPNINSPECCION" }, new Object[] { pPSORDEN, pPNINSPECCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSORDEN);
		cStmt.setObject(3, pPNINSPECCION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PMENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PMENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDOC(java.math.BigDecimal pPSORDEN,
			java.math.BigDecimal pPNINSPECCION) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDOC(pPSORDEN, pPNINSPECCION);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INSPECCION.F_GET_IRINSPECCIONESDOC
	// --START-PAC_IAX_INSPECCION.F_GESTION_INSPECCION(PSSEGURO, PNMOVIMI, PNRIESGO,
	// PTABLAS)
	private HashMap callPAC_IAX_INSPECCION__F_GESTION_INSPECCION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_GESTION_INSPECCION(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO", "pPTABLAS" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPTABLAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNECESITAINSPECCION"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PRESULTADOINSPECCION"
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
			retVal.put("PNECESITAINSPECCION", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNECESITAINSPECCION", null);
		}
		try {
			retVal.put("PRESULTADOINSPECCION", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PRESULTADOINSPECCION", null);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_GESTION_INSPECCION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_GESTION_INSPECCION(pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_INSPECCION.F_GESTION_INSPECCION
	// --START-PAC_IAX_INSPECCION.F_TIENE_INSPEC_VIGENTE(PSSEGURO, PNMOVIMI,
	// PNRIESGO, PCTIPMAT, PCMATRIC, PSPRODUC, PTABLAS, PMODO)
	private HashMap callPAC_IAX_INSPECCION__F_TIENE_INSPEC_VIGENTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, String pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPSPRODUC, String pPTABLAS, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_INSPECCION.F_TIENE_INSPEC_VIGENTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO", "pPCTIPMAT", "pPCMATRIC", "pPSPRODUC", "pPTABLAS",
						"pPMODO" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPCTIPMAT, pPCMATRIC, pPSPRODUC, pPTABLAS, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCTIPMAT);
		cStmt.setObject(6, pPCMATRIC);
		cStmt.setObject(7, pPSPRODUC);
		cStmt.setObject(8, pPTABLAS);
		cStmt.setObject(9, pPMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PINSPECCION_VIGENTE"
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
			retVal.put("PINSPECCION_VIGENTE", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PINSPECCION_VIGENTE", null);
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

	public HashMap ejecutaPAC_IAX_INSPECCION__F_TIENE_INSPEC_VIGENTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, String pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPSPRODUC, String pPTABLAS, String pPMODO) throws Exception {
		return this.callPAC_IAX_INSPECCION__F_TIENE_INSPEC_VIGENTE(pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPCTIPMAT,
				pPCMATRIC, pPSPRODUC, pPTABLAS, pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_INSPECCION.F_TIENE_INSPEC_VIGENTE

}
