package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DESCARGAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DESCARGAS.class);
	private Connection conn = null;

	public PAC_IAX_DESCARGAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DESCARGAS.F_GET_CIAS()
	private HashMap callPAC_IAX_DESCARGAS__F_GET_CIAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCARGAS.F_GET_CIAS(?)}";

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

	public HashMap ejecutaPAC_IAX_DESCARGAS__F_GET_CIAS() throws Exception {
		return this.callPAC_IAX_DESCARGAS__F_GET_CIAS();
	}
	// --END-PAC_IAX_DESCARGAS.F_GET_CIAS

	// --START-PAC_IAX_DESCARGAS.F_GET_DESCARGAS(PCCOMPANI, PCTIPPET, PSSEQDWL,
	// PCTIPFCH)
	private HashMap callPAC_IAX_DESCARGAS__F_GET_DESCARGAS(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPPET, java.math.BigDecimal pPSSEQDWL, java.math.BigDecimal pPCTIPFCH)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCARGAS.F_GET_DESCARGAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPCTIPPET", "pPSSEQDWL", "pPCTIPFCH" },
				new Object[] { pPCCOMPANI, pPCTIPPET, pPSSEQDWL, pPCTIPFCH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPCTIPPET);
		cStmt.setObject(4, pPSSEQDWL);
		cStmt.setObject(5, pPCTIPFCH);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DESCARGAS__F_GET_DESCARGAS(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPPET, java.math.BigDecimal pPSSEQDWL, java.math.BigDecimal pPCTIPFCH)
			throws Exception {
		return this.callPAC_IAX_DESCARGAS__F_GET_DESCARGAS(pPCCOMPANI, pPCTIPPET, pPSSEQDWL, pPCTIPFCH);
	}
	// --END-PAC_IAX_DESCARGAS.F_GET_DESCARGAS

	// --START-PAC_IAX_DESCARGAS.F_GET_FICHEROS(PSSEQDWL)
	private HashMap callPAC_IAX_DESCARGAS__F_GET_FICHEROS(java.math.BigDecimal pPSSEQDWL) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCARGAS.F_GET_FICHEROS(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEQDWL" }, new Object[] { pPSSEQDWL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEQDWL);
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

	public HashMap ejecutaPAC_IAX_DESCARGAS__F_GET_FICHEROS(java.math.BigDecimal pPSSEQDWL) throws Exception {
		return this.callPAC_IAX_DESCARGAS__F_GET_FICHEROS(pPSSEQDWL);
	}
	// --END-PAC_IAX_DESCARGAS.F_GET_FICHEROS

	// --START-PAC_IAX_DESCARGAS.F_SET_PETICION(PSSEQDWL, PNNUMFIL)
	private HashMap callPAC_IAX_DESCARGAS__F_SET_PETICION(java.math.BigDecimal pPSSEQDWL,
			java.math.BigDecimal pPNNUMFIL) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCARGAS.F_SET_PETICION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEQDWL", "pPNNUMFIL" }, new Object[] { pPSSEQDWL, pPNNUMFIL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEQDWL);
		cStmt.setObject(3, pPNNUMFIL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSSEQOUT"
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
			retVal.put("PSSEQOUT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSSEQOUT", null);
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

	public HashMap ejecutaPAC_IAX_DESCARGAS__F_SET_PETICION(java.math.BigDecimal pPSSEQDWL,
			java.math.BigDecimal pPNNUMFIL) throws Exception {
		return this.callPAC_IAX_DESCARGAS__F_SET_PETICION(pPSSEQDWL, pPNNUMFIL);
	}
	// --END-PAC_IAX_DESCARGAS.F_SET_PETICION

	// --START-PAC_IAX_DESCARGAS.F_SET_PETICION_LST_FILES(PCCOMPANI, PCTIPFCH)
	private HashMap callPAC_IAX_DESCARGAS__F_SET_PETICION_LST_FILES(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPFCH) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCARGAS.F_SET_PETICION_LST_FILES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPCTIPFCH" }, new Object[] { pPCCOMPANI, pPCTIPFCH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPCTIPFCH);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSSEQOUT"
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
			retVal.put("PSSEQOUT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSSEQOUT", null);
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

	public HashMap ejecutaPAC_IAX_DESCARGAS__F_SET_PETICION_LST_FILES(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPFCH) throws Exception {
		return this.callPAC_IAX_DESCARGAS__F_SET_PETICION_LST_FILES(pPCCOMPANI, pPCTIPFCH);
	}
	// --END-PAC_IAX_DESCARGAS.F_SET_PETICION_LST_FILES

}
