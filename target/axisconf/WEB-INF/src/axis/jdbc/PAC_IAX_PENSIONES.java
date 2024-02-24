package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

//WLS-Ready

public class PAC_IAX_PENSIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ACTIVIDADES.class);
	private Connection conn = null;

	public PAC_IAX_PENSIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PENSIONES.F_GET_FONPENSION(CCODFON)
	private HashMap callPAC_IAX_PENSIONES__F_GET_FONPENSION(java.math.BigDecimal pCCODFON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_FONPENSION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODFON" }, new Object[] { pCCODFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODFON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_FONPENSIONES".toUpperCase())); // Valor de "FONPENSION"
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
			retVal.put("FONPENSION", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("FONPENSION", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_FONPENSION(java.math.BigDecimal pCCODFON) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_FONPENSION(pCCODFON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PENSIONES.F_GET_FONPENSION

	// --START-PAC_IAX_PENSIONES.F_DEL_CODGESTORAS(CCODGES)

	private HashMap callPAC_IAX_PENSIONES__F_DEL_CODGESTORAS(java.math.BigDecimal pCCODGES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_DEL_CODGESTORAS(?, ?)}";

		logCall(callQuery, new String[] { "pCCODGES" }, new Object[] { pCCODGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODGES);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_DEL_CODGESTORAS(java.math.BigDecimal pCCODGES) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_DEL_CODGESTORAS(pCCODGES);
	}
	// --END-PAC_IAX_PENSIONES.F_DEL_CODGESTORAS
	// --START-PAC_IAX_PENSIONES.F_DEL_FONPENSIONES(CCODFON)

	private HashMap callPAC_IAX_PENSIONES__F_DEL_FONPENSIONES(java.math.BigDecimal pCCODFON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_DEL_FONPENSIONES(?, ?)}";

		logCall(callQuery, new String[] { "pCCODFON" }, new Object[] { pCCODFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODFON);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_DEL_FONPENSIONES(java.math.BigDecimal pCCODFON) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_DEL_FONPENSIONES(pCCODFON);
	}
	// --END-PAC_IAX_PENSIONES.F_DEL_FONPENSIONES
	// --START-PAC_IAX_PENSIONES.F_DEL_PDEPOSITARIAS(PCCODASEG, PCCODFON, PCCODDEP)

	private HashMap callPAC_IAX_PENSIONES__F_DEL_PDEPOSITARIAS(java.math.BigDecimal pPCCODASEG,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCCODDEP) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_DEL_PDEPOSITARIAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODASEG", "pPCCODFON", "pPCCODDEP" },
				new Object[] { pPCCODASEG, pPCCODFON, pPCCODDEP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODASEG);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPCCODDEP);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_DEL_PDEPOSITARIAS(java.math.BigDecimal pPCCODASEG,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCCODDEP) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_DEL_PDEPOSITARIAS(pPCCODASEG, pPCCODFON, pPCCODDEP);
	}
	// --END-PAC_IAX_PENSIONES.F_DEL_PDEPOSITARIAS
	// --START-PAC_IAX_PENSIONES.F_DEL_PLANPENSIONES(CCODPLA)

	private HashMap callPAC_IAX_PENSIONES__F_DEL_PLANPENSIONES(java.math.BigDecimal pCCODPLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_DEL_PLANPENSIONES(?, ?)}";

		logCall(callQuery, new String[] { "pCCODPLA" }, new Object[] { pCCODPLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODPLA);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_DEL_PLANPENSIONES(java.math.BigDecimal pCCODPLA) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_DEL_PLANPENSIONES(pCCODPLA);
	}
	// --END-PAC_IAX_PENSIONES.F_DEL_PLANPENSIONES
	// --START-PAC_IAX_PENSIONES.F_DEL_PROMOTORES(CCODPLA, SPERSON)

	private HashMap callPAC_IAX_PENSIONES__F_DEL_PROMOTORES(java.math.BigDecimal pCCODPLA,
			java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_DEL_PROMOTORES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODPLA", "pSPERSON" }, new Object[] { pCCODPLA, pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODPLA);
		cStmt.setObject(3, pSPERSON);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_DEL_PROMOTORES(java.math.BigDecimal pCCODPLA,
			java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_DEL_PROMOTORES(pCCODPLA, pSPERSON);
	}
	// --END-PAC_IAX_PENSIONES.F_DEL_PROMOTORES
	// --START-PAC_IAX_PENSIONES.F_GET_CCODFON(PCCODFON_DGS)

	private HashMap callPAC_IAX_PENSIONES__F_GET_CCODFON(String pPCCODFON_DGS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_CCODFON(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODFON_DGS" }, new Object[] { pPCCODFON_DGS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODFON_DGS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCCODFON"
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
			retVal.put("PCCODFON", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCCODFON", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_CCODFON(String pPCCODFON_DGS) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_CCODFON(pPCCODFON_DGS);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_CCODFON
	// --START-PAC_IAX_PENSIONES.F_GET_CCODGES(PCCODGES_DGS)

	private HashMap callPAC_IAX_PENSIONES__F_GET_CCODGES(String pPCCODGES_DGS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_CCODGES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODGES_DGS" }, new Object[] { pPCCODGES_DGS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODGES_DGS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCCODGES"
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
			retVal.put("PCCODGES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCCODGES", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_CCODGES(String pPCCODGES_DGS) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_CCODGES(pPCCODGES_DGS);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_CCODGES
	// --START-PAC_IAX_PENSIONES.F_GET_CODGESTORAS(CCODGES, CTIPIDE, NNUMIDE,
	// NNOMGES)

	private HashMap callPAC_IAX_PENSIONES__F_GET_CODGESTORAS(java.math.BigDecimal pCCODGES,
			java.math.BigDecimal pCTIPIDE, String pNNUMIDE, String pNNOMGES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_CODGESTORAS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODGES", "pCTIPIDE", "pNNUMIDE", "pNNOMGES" },
				new Object[] { pCCODGES, pCTIPIDE, pNNUMIDE, pNNOMGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODGES);
		cStmt.setObject(3, pCTIPIDE);
		cStmt.setObject(4, pNNUMIDE);
		cStmt.setObject(5, pNNOMGES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GESTORAS".toUpperCase())); // Valor de "CODGESTORAS"
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
			retVal.put("CODGESTORAS", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("CODGESTORAS", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_CODGESTORAS(java.math.BigDecimal pCCODGES,
			java.math.BigDecimal pCTIPIDE, String pNNUMIDE, String pNNOMGES) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_CODGESTORAS(pCCODGES, pCTIPIDE, pNNUMIDE, pNNOMGES);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_CODGESTORAS
	// --START-PAC_IAX_PENSIONES.F_GET_FONPENSIONES(CCODFON, CCODGES, CCODDEP,
	// CTIPIDE, NNUMIDE, NNOMFON)

	private HashMap callPAC_IAX_PENSIONES__F_GET_FONPENSIONES(java.math.BigDecimal pCCODFON,
			java.math.BigDecimal pCCODGES, java.math.BigDecimal pCCODDEP, java.math.BigDecimal pCTIPIDE,
			String pNNUMIDE, String pNNOMFON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_FONPENSIONES(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODFON", "pCCODGES", "pCCODDEP", "pCTIPIDE", "pNNUMIDE", "pNNOMFON" },
				new Object[] { pCCODFON, pCCODGES, pCCODDEP, pCTIPIDE, pNNUMIDE, pNNOMFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODFON);
		cStmt.setObject(3, pCCODGES);
		cStmt.setObject(4, pCCODDEP);
		cStmt.setObject(5, pCTIPIDE);
		cStmt.setObject(6, pNNUMIDE);
		cStmt.setObject(7, pNNOMFON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_FONPENSIONES".toUpperCase())); // Valor de "FONPENSIONES"
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
			retVal.put("FONPENSIONES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("FONPENSIONES", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_FONPENSIONES(java.math.BigDecimal pCCODFON,
			java.math.BigDecimal pCCODGES, java.math.BigDecimal pCCODDEP, java.math.BigDecimal pCTIPIDE,
			String pNNUMIDE, String pNNOMFON) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_FONPENSIONES(pCCODFON, pCCODGES, pCCODDEP, pCTIPIDE, pNNUMIDE,
				pNNOMFON);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_FONPENSIONES
	// --START-PAC_IAX_PENSIONES.F_GET_OB_CODGESTORAS(CCODGES)

	private HashMap callPAC_IAX_PENSIONES__F_GET_OB_CODGESTORAS(java.math.BigDecimal pCCODGES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_OB_CODGESTORAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODGES" }, new Object[] { pCCODGES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODGES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GESTORAS".toUpperCase())); // Valor de "CODGESTORAS"
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
			retVal.put("CODGESTORAS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("CODGESTORAS", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_OB_CODGESTORAS(java.math.BigDecimal pCCODGES) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_OB_CODGESTORAS(pCCODGES);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_OB_CODGESTORAS
	// --START-PAC_IAX_PENSIONES.F_GET_OB_FONPENSIONES(CCODFON)

	private HashMap callPAC_IAX_PENSIONES__F_GET_OB_FONPENSIONES(java.math.BigDecimal pCCODFON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_OB_FONPENSIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODFON" }, new Object[] { pCCODFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODFON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_FONPENSIONES".toUpperCase())); // Valor de "FONPENSIONES"
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
			retVal.put("FONPENSIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("FONPENSIONES", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_OB_FONPENSIONES(java.math.BigDecimal pCCODFON) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_OB_FONPENSIONES(pCCODFON);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_OB_FONPENSIONES
	// --START-PAC_IAX_PENSIONES.F_GET_OB_PDEPOSITARIAS(CCODDEP)

	private HashMap callPAC_IAX_PENSIONES__F_GET_OB_PDEPOSITARIAS(java.math.BigDecimal pCCODDEP) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_OB_PDEPOSITARIAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODDEP" }, new Object[] { pCCODDEP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODDEP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PDEPOSITARIAS".toUpperCase())); // Valor de "PDEPOSITARIAS"
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
			retVal.put("PDEPOSITARIAS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDEPOSITARIAS", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_OB_PDEPOSITARIAS(java.math.BigDecimal pCCODDEP) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_OB_PDEPOSITARIAS(pCCODDEP);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_OB_PDEPOSITARIAS
	// --START-PAC_IAX_PENSIONES.F_GET_OB_PLANPENSIONES(CCODPLA)

	private HashMap callPAC_IAX_PENSIONES__F_GET_OB_PLANPENSIONES(java.math.BigDecimal pCCODPLA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_OB_PLANPENSIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODPLA" }, new Object[] { pCCODPLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODPLA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PLANPENSIONES".toUpperCase())); // Valor de "PLANPENSIONES"
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
			retVal.put("PLANPENSIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLANPENSIONES", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_OB_PLANPENSIONES(java.math.BigDecimal pCCODPLA) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_OB_PLANPENSIONES(pCCODPLA);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_OB_PLANPENSIONES
	// --START-PAC_IAX_PENSIONES.F_GET_OB_PROMOTORES(CCODPLA, SPERSON)

	private HashMap callPAC_IAX_PENSIONES__F_GET_OB_PROMOTORES(java.math.BigDecimal pCCODPLA,
			java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_OB_PROMOTORES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODPLA", "pSPERSON" }, new Object[] { pCCODPLA, pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODPLA);
		cStmt.setObject(3, pSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PROMOTORES".toUpperCase())); // Valor de "PROMOTORES"
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
			retVal.put("PROMOTORES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PROMOTORES", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_OB_PROMOTORES(java.math.BigDecimal pCCODPLA,
			java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_OB_PROMOTORES(pCCODPLA, pSPERSON);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_OB_PROMOTORES
	// --START-PAC_IAX_PENSIONES.F_GET_PDEPOSITARIAS(CCODFON, CCODASEG, CCODDEP,
	// CTIPIDE, NNUMIDE, NNOMDEP)

	private HashMap callPAC_IAX_PENSIONES__F_GET_PDEPOSITARIAS(java.math.BigDecimal pCCODFON,
			java.math.BigDecimal pCCODASEG, java.math.BigDecimal pCCODDEP, java.math.BigDecimal pCTIPIDE,
			String pNNUMIDE, String pNNOMDEP) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_PDEPOSITARIAS(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCODFON", "pCCODASEG", "pCCODDEP", "pCTIPIDE", "pNNUMIDE", "pNNOMDEP" },
				new Object[] { pCCODFON, pCCODASEG, pCCODDEP, pCTIPIDE, pNNUMIDE, pNNOMDEP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCODFON);
		cStmt.setObject(3, pCCODASEG);
		cStmt.setObject(4, pCCODDEP);
		cStmt.setObject(5, pCTIPIDE);
		cStmt.setObject(6, pNNUMIDE);
		cStmt.setObject(7, pNNOMDEP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PDEPOSITARIAS".toUpperCase())); // Valor de "PDEPOSITARIAS"
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
			retVal.put("PDEPOSITARIAS", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PDEPOSITARIAS", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_PDEPOSITARIAS(java.math.BigDecimal pCCODFON,
			java.math.BigDecimal pCCODASEG, java.math.BigDecimal pCCODDEP, java.math.BigDecimal pCTIPIDE,
			String pNNUMIDE, String pNNOMDEP) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_PDEPOSITARIAS(pCCODFON, pCCODASEG, pCCODDEP, pCTIPIDE, pNNUMIDE,
				pNNOMDEP);
	}

	// --END-PAC_IAX_PENSIONES.F_GET_PDEPOSITARIAS
	// --START-PAC_IAX_PENSIONES.F_GET_PLANPENSIONES(CODDGS, FON_CODDGS, CTIPIDE,
	// NNUMIDE, NNOMPLA, CCODPLA)
	private HashMap callPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(String pCODDGS, String pFON_CODDGS,
			java.math.BigDecimal pCTIPIDE, String pNNUMIDE, String pNNOMPLA, java.math.BigDecimal pCCODPLA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_PLANPENSIONES(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCODDGS", "pFON_CODDGS", "pCTIPIDE", "pNNUMIDE", "pNNOMPLA", "pCCODPLA" },
				new Object[] { pCODDGS, pFON_CODDGS, pCTIPIDE, pNNUMIDE, pNNOMPLA, pCCODPLA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCODDGS);
		cStmt.setObject(3, pFON_CODDGS);
		cStmt.setObject(4, pCTIPIDE);
		cStmt.setObject(5, pNNUMIDE);
		cStmt.setObject(6, pNNOMPLA);
		cStmt.setObject(7, pCCODPLA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PLANPENSIONES".toUpperCase())); // Valor de "PLANPENSIONES"
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
			retVal.put("PLANPENSIONES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PLANPENSIONES", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(String pCODDGS, String pFON_CODDGS,
			java.math.BigDecimal pCTIPIDE, String pNNUMIDE, String pNNOMPLA, java.math.BigDecimal pCCODPLA)
			throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(pCODDGS, pFON_CODDGS, pCTIPIDE, pNNUMIDE, pNNOMPLA,
				pCCODPLA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PENSIONES.F_GET_PLANPENSIONES

	// --START-PAC_IAX_PENSIONES.F_GET_PROMOTORES(CRAMO, SPRODUC, NPOLIZA, CCODPLA,
	// CTIPIDE, NNUMIDE, SPERSON)

	private HashMap callPAC_IAX_PENSIONES__F_GET_PROMOTORES(java.math.BigDecimal pCRAMO, java.math.BigDecimal pSPRODUC,
			java.math.BigDecimal pNPOLIZA, java.math.BigDecimal pCCODPLA, java.math.BigDecimal pCTIPIDE,
			String pNNUMIDE, java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_GET_PROMOTORES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pCRAMO", "pSPRODUC", "pNPOLIZA", "pCCODPLA", "pCTIPIDE", "pNNUMIDE", "pSPERSON" },
				new Object[] { pCRAMO, pSPRODUC, pNPOLIZA, pCCODPLA, pCTIPIDE, pNNUMIDE, pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCRAMO);
		cStmt.setObject(3, pSPRODUC);
		cStmt.setObject(4, pNPOLIZA);
		cStmt.setObject(5, pCCODPLA);
		cStmt.setObject(6, pCTIPIDE);
		cStmt.setObject(7, pNNUMIDE);
		cStmt.setObject(8, pSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROMOTORES".toUpperCase())); // Valor de "PROMOTORES"
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
			retVal.put("PROMOTORES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PROMOTORES", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_GET_PROMOTORES(java.math.BigDecimal pCRAMO,
			java.math.BigDecimal pSPRODUC, java.math.BigDecimal pNPOLIZA, java.math.BigDecimal pCCODPLA,
			java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_GET_PROMOTORES(pCRAMO, pSPRODUC, pNPOLIZA, pCCODPLA, pCTIPIDE, pNNUMIDE,
				pSPERSON);
	}
	// --END-PAC_IAX_PENSIONES.F_GET_PROMOTORES

	// --START-PAC_IAX_PENSIONES.F_SET_CODGESTORAS(PCCODGES, PFALTA, PFBAJA,
	// PCBANCO, PCOFICIN, PCDC, PNCUENTA, PSPERSON, PSPERTIT, PCODDGS)
	private HashMap callPAC_IAX_PENSIONES__F_SET_CODGESTORAS(java.math.BigDecimal pPCCODGES, java.sql.Date pPFALTA,
			java.sql.Date pPFBAJA, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCOFICIN,
			java.math.BigDecimal pPCDC, String pPNCUENTA, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSPERTIT, String pPCODDGS, String pTIMECLOSE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_SET_CODGESTORAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )}";

		logCall(callQuery,
				new String[] { "pPCCODGES", "pPFALTA", "pPFBAJA", "pPCBANCO", "pPCOFICIN", "pPCDC", "pPNCUENTA",
						"pPSPERSON", "pPSPERTIT", "pPCODDGS", "pTIMECLOSE" },
				new Object[] { pPCCODGES, pPFALTA, pPFBAJA, pPCBANCO, pPCOFICIN, pPCDC, pPNCUENTA, pPSPERSON, pPSPERTIT,
						pPCODDGS, pTIMECLOSE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODGES);
		cStmt.setObject(3, pPFALTA);
		cStmt.setObject(4, pPFBAJA);
		cStmt.setObject(5, pPCBANCO);
		cStmt.setObject(6, pPCOFICIN);
		cStmt.setObject(7, pPCDC);
		cStmt.setObject(8, pPNCUENTA);
		cStmt.setObject(9, pPSPERSON);
		cStmt.setObject(10, pPSPERTIT);
		cStmt.setObject(11, pPCODDGS);
		cStmt.setObject(12, pTIMECLOSE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, java.sql.Types.NUMERIC); // Valor de "PCCODGES_OUT"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCCODGES_OUT", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PCCODGES_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PENSIONES__F_SET_CODGESTORAS(java.math.BigDecimal pPCCODGES, java.sql.Date pPFALTA,
			java.sql.Date pPFBAJA, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCOFICIN,
			java.math.BigDecimal pPCDC, String pPNCUENTA, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSPERTIT, String pPCODDGS, String pTIMECLOSE) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_SET_CODGESTORAS(pPCCODGES, pPFALTA, pPFBAJA, pPCBANCO, pPCOFICIN, pPCDC,
				pPNCUENTA, pPSPERSON, pPSPERTIT, pPCODDGS, pTIMECLOSE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PENSIONES.F_SET_CODGESTORAS

	// --START-PAC_IAX_PENSIONES.F_SET_FONPENSIONES(PCCODFON, PFALTARE, PSPERSON,
	// PSPERTIT, PFBAJARE, PCCOMERC, PCCODGES, PCLAFON, PCDIVISA, PCODDGS, PCBANCAR,
	// PCTIPBAN)
	private HashMap callPAC_IAX_PENSIONES__F_SET_FONPENSIONES(java.math.BigDecimal pPCCODFON, java.sql.Date pPFALTARE,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPERTIT, java.sql.Date pPFBAJARE, String pPCCOMERC,
			java.math.BigDecimal pPCCODGES, java.math.BigDecimal pPCLAFON, java.math.BigDecimal pPCDIVISA,
			String pPCODDGS, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_SET_FONPENSIONES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODFON", "pPFALTARE", "pPSPERSON", "pPSPERTIT", "pPFBAJARE", "pPCCOMERC",
						"pPCCODGES", "pPCLAFON", "pPCDIVISA", "pPCODDGS", "pPCBANCAR", "pPCTIPBAN" },
				new Object[] { pPCCODFON, pPFALTARE, pPSPERSON, pPSPERTIT, pPFBAJARE, pPCCOMERC, pPCCODGES, pPCLAFON,
						pPCDIVISA, pPCODDGS, pPCBANCAR, pPCTIPBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODFON);
		cStmt.setObject(3, pPFALTARE);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPSPERTIT);
		cStmt.setObject(6, pPFBAJARE);
		cStmt.setObject(7, pPCCOMERC);
		cStmt.setObject(8, pPCCODGES);
		cStmt.setObject(9, pPCLAFON);
		cStmt.setObject(10, pPCDIVISA);
		cStmt.setObject(11, pPCODDGS);
		cStmt.setObject(12, pPCBANCAR);
		cStmt.setObject(13, pPCTIPBAN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PCCODFON_OUT"
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
			retVal.put("PCCODFON_OUT", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PCCODFON_OUT", null);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_SET_FONPENSIONES(java.math.BigDecimal pPCCODFON, java.sql.Date pPFALTARE,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPERTIT, java.sql.Date pPFBAJARE, String pPCCOMERC,
			java.math.BigDecimal pPCCODGES, java.math.BigDecimal pPCLAFON, java.math.BigDecimal pPCDIVISA,
			String pPCODDGS, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_SET_FONPENSIONES(pPCCODFON, pPFALTARE, pPSPERSON, pPSPERTIT, pPFBAJARE,
				pPCCOMERC, pPCCODGES, pPCLAFON, pPCDIVISA, pPCODDGS, pPCBANCAR, pPCTIPBAN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PENSIONES.F_SET_FONPENSIONES

	// --START-PAC_IAX_PENSIONES.F_SET_PDEPOSITARIAS(PCCODASEG, PCCODFON, PCCODDEP,
	// PFALTA, PFBAJA, PSPERSON, PCCTIPBAN, PCCBANCAR, PCCTRASP, PCBANCO, MODO)

	private HashMap callPAC_IAX_PENSIONES__F_SET_PDEPOSITARIAS(java.math.BigDecimal pPCCODASEG,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCCODDEP, java.sql.Date pPFALTA,
			java.sql.Date pPFBAJA, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCTIPBAN, String pPCCBANCAR,
			java.math.BigDecimal pPCCTRASP, java.math.BigDecimal pPCBANCO, String pMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_SET_PDEPOSITARIAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODASEG", "pPCCODFON", "pPCCODDEP", "pPFALTA", "pPFBAJA", "pPSPERSON", "pPCCTIPBAN",
						"pPCCBANCAR", "pPCCTRASP", "pPCBANCO", "pMODO" },
				new Object[] { pPCCODASEG, pPCCODFON, pPCCODDEP, pPFALTA, pPFBAJA, pPSPERSON, pPCCTIPBAN, pPCCBANCAR,
						pPCCTRASP, pPCBANCO, pMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODASEG);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPCCODDEP);
		cStmt.setObject(5, pPFALTA);
		cStmt.setObject(6, pPFBAJA);
		cStmt.setObject(7, pPSPERSON);
		cStmt.setObject(8, pPCCTIPBAN);
		cStmt.setObject(9, pPCCBANCAR);
		cStmt.setObject(10, pPCCTRASP);
		cStmt.setObject(11, pPCBANCO);
		cStmt.setObject(12, pMODO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PENSIONES__F_SET_PDEPOSITARIAS(java.math.BigDecimal pPCCODASEG,
			java.math.BigDecimal pPCCODFON, java.math.BigDecimal pPCCODDEP, java.sql.Date pPFALTA,
			java.sql.Date pPFBAJA, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCTIPBAN, String pPCCBANCAR,
			java.math.BigDecimal pPCCTRASP, java.math.BigDecimal pPCBANCO, String pMODO) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_SET_PDEPOSITARIAS(pPCCODASEG, pPCCODFON, pPCCODDEP, pPFALTA, pPFBAJA,
				pPSPERSON, pPCCTIPBAN, pPCCBANCAR, pPCCTRASP, pPCBANCO, pMODO);
	}
	// --END-PAC_IAX_PENSIONES.F_SET_PDEPOSITARIAS
	// //--START-PAC_IAX_PENSIONES.F_SET_PLANPENSIONES(PCCODPLA, PTNOMPLA, PFALTARE,
	// PFADMISI, PCMODALI, PCSISTEM, PCCODFON, PCCOMERC, PICOMDEP, PICOMGES,
	// PCMESPAG, PCTIPREN, PCPERIOD, PIVALORL, PCLAPLA, PNPARTOT, PCODDGS, PFBAJARE,
	// PCLISTBLANC)

	// --START-PAC_IAX_PENSIONES.F_SET_PLANPENSIONES(PCCODPLA, PTNOMPLA, PFALTARE,
	// PFADMISI, PCMODALI, PCSISTEM, PCCODFON, PCCOMERC, PICOMDEP, PICOMGES,
	// PCMESPAG, PCTIPREN, PCPERIOD, PIVALORL, PCLAPLA, PNPARTOT, PCODDGS, PFBAJARE,
	// PCLISTBLANC)
	private HashMap callPAC_IAX_PENSIONES__F_SET_PLANPENSIONES(java.math.BigDecimal pPCCODPLA, String pPTNOMPLA,
			java.sql.Date pPFALTARE, java.sql.Date pPFADMISI, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCSISTEM, java.math.BigDecimal pPCCODFON, String pPCCOMERC,
			java.math.BigDecimal pPICOMDEP, java.math.BigDecimal pPICOMGES, java.math.BigDecimal pPCMESPAG,
			java.math.BigDecimal pPCTIPREN, java.math.BigDecimal pPCPERIOD, java.math.BigDecimal pPIVALORL,
			java.math.BigDecimal pPCLAPLA, java.math.BigDecimal pPNPARTOT, String pPCODDGS, java.sql.Date pPFBAJARE,
			java.math.BigDecimal pPCLISTBLANC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_SET_PLANPENSIONES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODPLA", "pPTNOMPLA", "pPFALTARE", "pPFADMISI", "pPCMODALI", "pPCSISTEM",
						"pPCCODFON", "pPCCOMERC", "pPICOMDEP", "pPICOMGES", "pPCMESPAG", "pPCTIPREN", "pPCPERIOD",
						"pPIVALORL", "pPCLAPLA", "pPNPARTOT", "pPCODDGS", "pPFBAJARE", "pPCLISTBLANC" },
				new Object[] { pPCCODPLA, pPTNOMPLA, pPFALTARE, pPFADMISI, pPCMODALI, pPCSISTEM, pPCCODFON, pPCCOMERC,
						pPICOMDEP, pPICOMGES, pPCMESPAG, pPCTIPREN, pPCPERIOD, pPIVALORL, pPCLAPLA, pPNPARTOT, pPCODDGS,
						pPFBAJARE, pPCLISTBLANC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODPLA);
		cStmt.setObject(3, pPTNOMPLA);
		cStmt.setObject(4, pPFALTARE);
		cStmt.setObject(5, pPFADMISI);
		cStmt.setObject(6, pPCMODALI);
		cStmt.setObject(7, pPCSISTEM);
		cStmt.setObject(8, pPCCODFON);
		cStmt.setObject(9, pPCCOMERC);
		cStmt.setObject(10, pPICOMDEP);
		cStmt.setObject(11, pPICOMGES);
		cStmt.setObject(12, pPCMESPAG);
		cStmt.setObject(13, pPCTIPREN);
		cStmt.setObject(14, pPCPERIOD);
		cStmt.setObject(15, pPIVALORL);
		cStmt.setObject(16, pPCLAPLA);
		cStmt.setObject(17, pPNPARTOT);
		cStmt.setObject(18, pPCODDGS);
		cStmt.setObject(19, pPFBAJARE);
		cStmt.setObject(20, pPCLISTBLANC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(21, java.sql.Types.NUMERIC); // Valor de "PCCODPLA_OUT"
		cStmt.registerOutParameter(22, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCCODPLA_OUT", cStmt.getObject(21));
		} catch (SQLException e) {
			retVal.put("PCCODPLA_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PENSIONES__F_SET_PLANPENSIONES(java.math.BigDecimal pPCCODPLA, String pPTNOMPLA,
			java.sql.Date pPFALTARE, java.sql.Date pPFADMISI, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCSISTEM, java.math.BigDecimal pPCCODFON, String pPCCOMERC,
			java.math.BigDecimal pPICOMDEP, java.math.BigDecimal pPICOMGES, java.math.BigDecimal pPCMESPAG,
			java.math.BigDecimal pPCTIPREN, java.math.BigDecimal pPCPERIOD, java.math.BigDecimal pPIVALORL,
			java.math.BigDecimal pPCLAPLA, java.math.BigDecimal pPNPARTOT, String pPCODDGS, java.sql.Date pPFBAJARE,
			java.math.BigDecimal pPCLISTBLANC) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_SET_PLANPENSIONES(pPCCODPLA, pPTNOMPLA, pPFALTARE, pPFADMISI, pPCMODALI,
				pPCSISTEM, pPCCODFON, pPCCOMERC, pPICOMDEP, pPICOMGES, pPCMESPAG, pPCTIPREN, pPCPERIOD, pPIVALORL,
				pPCLAPLA, pPNPARTOT, pPCODDGS, pPFBAJARE, pPCLISTBLANC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PENSIONES.F_SET_PLANPENSIONES

	// --START-PAC_IAX_PENSIONES.F_SET_PROMOTORES(PCCODPLA, PSPERSON, PNPOLIZA,
	// PCBANCAR, PNVALPARSP, PCTIPBAN)

	private HashMap callPAC_IAX_PENSIONES__F_SET_PROMOTORES(java.math.BigDecimal pPCCODPLA,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNPOLIZA, String pPCBANCAR,
			java.math.BigDecimal pPNVALPARSP, java.math.BigDecimal pPCTIPBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PENSIONES.F_SET_PROMOTORES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODPLA", "pPSPERSON", "pPNPOLIZA", "pPCBANCAR", "pPNVALPARSP", "pPCTIPBAN" },
				new Object[] { pPCCODPLA, pPSPERSON, pPNPOLIZA, pPCBANCAR, pPNVALPARSP, pPCTIPBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODPLA);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPCBANCAR);
		cStmt.setObject(6, pPNVALPARSP);
		cStmt.setObject(7, pPCTIPBAN);
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

	public HashMap ejecutaPAC_IAX_PENSIONES__F_SET_PROMOTORES(java.math.BigDecimal pPCCODPLA,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNPOLIZA, String pPCBANCAR,
			java.math.BigDecimal pPNVALPARSP, java.math.BigDecimal pPCTIPBAN) throws Exception {
		return this.callPAC_IAX_PENSIONES__F_SET_PROMOTORES(pPCCODPLA, pPSPERSON, pPNPOLIZA, pPCBANCAR, pPNVALPARSP,
				pPCTIPBAN);
	}
	// --END-PAC_IAX_PENSIONES.F_SET_PROMOTORES

}
