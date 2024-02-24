package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CAJA_CHEQUE extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ADM.class);
	private Connection conn = null;

	public PAC_IAX_CAJA_CHEQUE(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CAJA_CHEQUE.F_LEE_CHEQUES(SPERSON, NCHEQUE, PSEQCAJA)
	private HashMap callPAC_IAX_CAJA_CHEQUE__F_LEE_CHEQUES(java.math.BigDecimal pSPERSON, String pNCHEQUE,
			java.math.BigDecimal pPSEQCAJA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA_CHEQUE.F_LEE_CHEQUES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON", "pNCHEQUE", "pPSEQCAJA" },
				new Object[] { pSPERSON, pNCHEQUE, pPSEQCAJA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.setObject(3, pNCHEQUE);
		cStmt.setObject(4, pPSEQCAJA);
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

	public HashMap ejecutaPAC_IAX_CAJA_CHEQUE__F_LEE_CHEQUES(java.math.BigDecimal pSPERSON, String pNCHEQUE,
			java.math.BigDecimal pPSEQCAJA) throws Exception {
		return this.callPAC_IAX_CAJA_CHEQUE__F_LEE_CHEQUES(pSPERSON, pNCHEQUE, pPSEQCAJA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA_CHEQUE.F_LEE_CHEQUES

	// --START-PAC_IAX_CAJA_CHEQUE.F_SET_ESTADOCHEQUES(PSCAJA, PESTADO, PFECHA)
	private HashMap callPAC_IAX_CAJA_CHEQUE__F_SET_ESTADOCHEQUES(java.math.BigDecimal pPSCAJA,
			java.math.BigDecimal pPESTADO, java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA_CHEQUE.F_SET_ESTADOCHEQUES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCAJA", "pPESTADO", "pPFECHA" },
				new Object[] { pPSCAJA, pPESTADO, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAJA);
		cStmt.setObject(3, pPESTADO);
		cStmt.setObject(4, pPFECHA);
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

	public HashMap ejecutaPAC_IAX_CAJA_CHEQUE__F_SET_ESTADOCHEQUES(java.math.BigDecimal pPSCAJA,
			java.math.BigDecimal pPESTADO, java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_CAJA_CHEQUE__F_SET_ESTADOCHEQUES(pPSCAJA, pPESTADO, pPFECHA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA_CHEQUE.F_SET_ESTADOCHEQUES

	// --START-PAC_IAX_CAJA_CHEQUE.F_PROTESTADO(PSCAJA)
	private HashMap callPAC_IAX_CAJA_CHEQUE__F_PROTESTADO(java.math.BigDecimal pPSCAJA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA_CHEQUE.F_PROTESTADO(?, ?)}";

		logCall(callQuery, new String[] { "pPSCAJA" }, new Object[] { pPSCAJA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCAJA);

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

	public HashMap ejecutaPAC_IAX_CAJA_CHEQUE__F_PROTESTADO(java.math.BigDecimal pPSCAJA) throws Exception {
		return this.callPAC_IAX_CAJA_CHEQUE__F_PROTESTADO(pPSCAJA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAJA_CHEQUE.F_PROTESTADO
	// --START-PAC_IAX_CAJA_CHEQUE.F_INSERT_HISTORICO(SEQCAJA, NCHEQUE, CSTCHQ,
	// CSTCHQ_ANT, FESTADO)
	private HashMap callPAC_IAX_CAJA_CHEQUE__F_INSERT_HISTORICO(java.math.BigDecimal pSEQCAJA, String pNCHEQUE,
			java.math.BigDecimal pCSTCHQ, java.math.BigDecimal pCSTCHQ_ANT, java.sql.Date pFESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA_CHEQUE.F_INSERT_HISTORICO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSEQCAJA", "pNCHEQUE", "pCSTCHQ", "pCSTCHQ_ANT", "pFESTADO" },
				new Object[] { pSEQCAJA, pNCHEQUE, pCSTCHQ, pCSTCHQ_ANT, pFESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSEQCAJA);
		cStmt.setObject(3, pNCHEQUE);
		cStmt.setObject(4, pCSTCHQ);
		cStmt.setObject(5, pCSTCHQ_ANT);
		cStmt.setObject(6, pFESTADO);
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

	public HashMap ejecutaPAC_IAX_CAJA_CHEQUE__F_INSERT_HISTORICO(java.math.BigDecimal pSEQCAJA, String pNCHEQUE,
			java.math.BigDecimal pCSTCHQ, java.math.BigDecimal pCSTCHQ_ANT, java.sql.Date pFESTADO) throws Exception {
		return this.callPAC_IAX_CAJA_CHEQUE__F_INSERT_HISTORICO(pSEQCAJA, pNCHEQUE, pCSTCHQ, pCSTCHQ_ANT, pFESTADO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA_CHEQUE.F_INSERT_HISTORICO

	// --START-PAC_IAX_CAJA_CHEQUE.F_GENERA_ARCHIVO_CHEQUE(FINI, FFIN, PCREGENERA)
	private HashMap callPAC_IAX_CAJA_CHEQUE__F_GENERA_ARCHIVO_CHEQUE(java.sql.Date pFINI, java.sql.Date pFFIN,
			java.math.BigDecimal pPCREGENERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAJA_CHEQUE.F_GENERA_ARCHIVO_CHEQUE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pFINI", "pFFIN", "pPCREGENERA" },
				new Object[] { pFINI, pFFIN, pPCREGENERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pFINI);
		cStmt.setObject(3, pFFIN);
		cStmt.setObject(4, pPCREGENERA);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CAJA_CHEQUE__F_GENERA_ARCHIVO_CHEQUE(java.sql.Date pFINI, java.sql.Date pFFIN,
			java.math.BigDecimal pPCREGENERA) throws Exception {
		return this.callPAC_IAX_CAJA_CHEQUE__F_GENERA_ARCHIVO_CHEQUE(pFINI, pFFIN, pPCREGENERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAJA_CHEQUE.F_GENERA_ARCHIVO_CHEQUE

}
