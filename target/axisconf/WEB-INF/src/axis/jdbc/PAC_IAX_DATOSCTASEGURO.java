package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DATOSCTASEGURO extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_DATOSCTASEGURO.class);
	private Connection conn = null;

	public PAC_IAX_DATOSCTASEGURO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DATOSCTASEGURO.F_OBTDATECON(PSSEGURO, PNRIESGO, PFECHA)

	private HashMap callPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_OBTDATECON(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DATOSECONOMICOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(pPSSEGURO, pPNRIESGO, pPFECHA);
	}
	// --END-PAC_IAX_DATOSCTASEGURO.F_OBTDATECON

	// Bug 145498

	private HashMap callPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, String pTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_OBTDATECON(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pTABLAS" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(6, pTABLAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DATOSECONOMICOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, String pTABLAS) throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(pPSSEGURO, pPNRIESGO, pPFECHA, pTABLAS);
	}
	// Bug 145498

	// --START-PAC_IAX_DATOSCTASEGURO.F_OBTENERMOVIMIENTOS(PSSEGURO, PNRIESGO,
	// PFECHAINI, PFECHAFIN)

	private HashMap callPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHAINI, java.sql.Date pPFECHAFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_OBTENERMOVIMIENTOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHAINI", "pPFECHAFIN" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHAINI, pPFECHAFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHAINI);
		cStmt.setObject(5, pPFECHAFIN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DATOSCTASEGURO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHAINI, java.sql.Date pPFECHAFIN) throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS(pPSSEGURO, pPNRIESGO, pPFECHAINI, pPFECHAFIN);
	}
	// --END-PAC_IAX_DATOSCTASEGURO.F_OBTENERMOVIMIENTOS
	// bug 26085
	// --START-PAC_IAX_DATOSCTASEGURO.F_OBTSALDOPRORROGA(PSSEGURO, PNRIESGO, PFECHA,
	// PTABLAS, PMODE, PIPRIFINANPEN)

	private HashMap callPAC_IAX_DATOSCTASEGURO__F_OBTSALDOPRORROGA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, String pPTABLAS, String pPMODE,
			java.math.BigDecimal pPIPRIFINANPEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_OBTSALDOPRORROGA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPTABLAS", "pPMODE", "pPIPRIFINANPEN" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPTABLAS, pPMODE, pPIPRIFINANPEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPTABLAS);
		cStmt.setObject(6, pPMODE);
		cStmt.setObject(7, pPIPRIFINANPEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_SALDOPRORROGA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTSALDOPRORROGA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, String pPTABLAS, String pPMODE,
			java.math.BigDecimal pPIPRIFINANPEN) throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_OBTSALDOPRORROGA(pPSSEGURO, pPNRIESGO, pPFECHA, pPTABLAS, pPMODE,
				pPIPRIFINANPEN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DATOSCTASEGURO.F_OBTSALDOPRORROGA

	// --START-PAC_IAX_DATOSCTASEGURO.F_OBTDATCOLECT(PSSEGURO, PTABLAS, PMAXROWS)

	private HashMap callPAC_IAX_DATOSCTASEGURO__F_OBTDATCOLECT(java.math.BigDecimal pPSSEGURO, String pPTABLAS,
			java.math.BigDecimal pPMAXROWS) throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_OBTDATCOLECT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS", "pPMAXROWS" },
				new Object[] { pPSSEGURO, pPTABLAS, pPMAXROWS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(4, pPTABLAS);
		cStmt.setObject(5, pPMAXROWS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DATOSCOLECTIVO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATCOLECT(java.math.BigDecimal pPSSEGURO, String pPTABLAS,
			java.math.BigDecimal pPMAXROWS) throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_OBTDATCOLECT(pPSSEGURO, pPTABLAS, pPMAXROWS); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DATOSCTASEGURO.F_OBTDATCOLECT

	// --START-PAC_IAX_DATOSCTASEGURO.F_OBTDATCOLECT(PSSEGURO, PTABLAS)

	private HashMap callPAC_IAX_DATOSCTASEGURO__F_OBTDATCOLECT(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_OBTDATCOLECT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(4, pPTABLAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DATOSCOLECTIVO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATCOLECT(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_OBTDATCOLECT(pPSSEGURO, pPTABLAS); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DATOSCTASEGURO.F_OBTDATCOLECT

	// --START-PAC_IAX_DATOSCTASEGURO.F_SUPLEM_OBERT(PSSEGURO, PTABLAS)

	private HashMap callPAC_IAX_DATOSCTASEGURO__F_SUPLEM_OBERT(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_SUPLEM_OBERT(?, ?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_SUPLEM_OBERT(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_SUPLEM_OBERT(pPSSEGURO, pPTABLAS); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DATOSCTASEGURO.F_SUPLEM_OBERT

	// --START-PAC_IAX_DATOSCTASEGURO.F_OBTENERMOVIMIENTOS_SHW(PSSEGURO, PNRIESGO,
	// PFECHAINI, PFECHAFIN)
	private HashMap callPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS_SHW(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHAINI, java.sql.Date pPFECHAFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_DATOSCTASEGURO.F_OBTENERMOVIMIENTOS_SHW(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHAINI", "pPFECHAFIN" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHAINI, pPFECHAFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHAINI);
		cStmt.setObject(5, pPFECHAFIN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DATOSCTASEGURO_SHW".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS_SHW(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHAINI, java.sql.Date pPFECHAFIN) throws Exception {
		return this.callPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS_SHW(pPSSEGURO, pPNRIESGO, pPFECHAINI, pPFECHAFIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DATOSCTASEGURO.F_OBTENERMOVIMIENTOS_SHW

}
