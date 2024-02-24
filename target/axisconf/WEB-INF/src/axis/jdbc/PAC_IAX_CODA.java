package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CODA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CODA.class);
	private Connection conn = null;

	public PAC_IAX_CODA(Connection conn) {
		this.conn = conn;
	}
	// --START-PAC_IAX_CODA.F_REACTIVAR_REGISTRO(P_SPROCES, P_NNUMLIN, P_CBANCAR1,
	// P_NNUMORD)

	private HashMap callPAC_IAX_CODA__F_REACTIVAR_REGISTRO(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_NNUMLIN, String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_REACTIVAR_REGISTRO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES", "pP_NNUMLIN", "pP_CBANCAR1", "pP_NNUMORD" },
				new Object[] { pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_NNUMLIN);
		cStmt.setObject(4, pP_CBANCAR1);
		cStmt.setObject(5, pP_NNUMORD);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CODA__F_REACTIVAR_REGISTRO(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_NNUMLIN, String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD) throws Exception {
		return this.callPAC_IAX_CODA__F_REACTIVAR_REGISTRO(pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD);
	}
	// --END-PAC_IAX_CODA.F_REACTIVAR_REGISTRO

	// --START-PAC_IAX_CODA.F_GET_CODA_DETALLE(P_SPROCES, P_CBANCAR, PNNUMORD,
	// PFULTSALD, PNNUMLIN)

	private HashMap callPAC_IAX_CODA__F_GET_CODA_DETALLE(java.math.BigDecimal pP_SPROCES, String pP_CBANCAR,
			java.math.BigDecimal pPNNUMORD, java.sql.Date pPFULTSALD, java.math.BigDecimal pPNNUMLIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_GET_CODA_DETALLE(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES", "pP_CBANCAR", "pPNNUMORD", "pPFULTSALD", "pPNNUMLIN" },
				new Object[] { pP_SPROCES, pP_CBANCAR, pPNNUMORD, pPFULTSALD, pPNNUMLIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_CBANCAR);
		cStmt.setObject(4, pPNNUMORD);
		cStmt.setObject(5, pPFULTSALD);
		cStmt.setObject(6, pPNNUMLIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_GET_CODA_DETALLE(java.math.BigDecimal pP_SPROCES, String pP_CBANCAR,
			java.math.BigDecimal pPNNUMORD, java.sql.Date pPFULTSALD, java.math.BigDecimal pPNNUMLIN) throws Exception {
		return this.callPAC_IAX_CODA__F_GET_CODA_DETALLE(pP_SPROCES, pP_CBANCAR, pPNNUMORD, pPFULTSALD, pPNNUMLIN);
	}
	// --END-PAC_IAX_CODA.F_GET_CODA_DETALLE

	// --START-PAC_IAX_CODA.F_BUSCA_RECIBOS(P_SPERSON, P_CSIGNO)

	private HashMap callPAC_IAX_CODA__F_BUSCA_RECIBOS(java.math.BigDecimal pP_SPERSON, java.math.BigDecimal pP_CSIGNO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_BUSCA_RECIBOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPERSON", "pP_CSIGNO" }, new Object[] { pP_SPERSON, pP_CSIGNO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPERSON);
		cStmt.setObject(3, pP_CSIGNO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_BUSCA_RECIBOS(java.math.BigDecimal pP_SPERSON, java.math.BigDecimal pP_CSIGNO)
			throws Exception {
		return this.callPAC_IAX_CODA__F_BUSCA_RECIBOS(pP_SPERSON, pP_CSIGNO);
	}
	// --END-PAC_IAX_CODA.F_BUSCA_RECIBOS

	// --START-PAC_IAX_CODA.F_BUSCA_TOMADORES(P_TNOMBRE, P_TDESCRIP, P_NUMVIA,
	// P_CPOSTAL, P_NPOLIZA, P_NRECIBO)

	private HashMap callPAC_IAX_CODA__F_BUSCA_TOMADORES(String pP_TNOMBRE, String pP_TDESCRIP,
			java.math.BigDecimal pP_NUMVIA, String pP_CPOSTAL, java.math.BigDecimal pP_NPOLIZA,
			java.math.BigDecimal pP_NRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_BUSCA_TOMADORES(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_TNOMBRE", "pP_TDESCRIP", "pP_NUMVIA", "pP_CPOSTAL", "pP_NPOLIZA", "pP_NRECIBO" },
				new Object[] { pP_TNOMBRE, pP_TDESCRIP, pP_NUMVIA, pP_CPOSTAL, pP_NPOLIZA, pP_NRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TNOMBRE);
		cStmt.setObject(3, pP_TDESCRIP);
		cStmt.setObject(4, pP_NUMVIA);
		cStmt.setObject(5, pP_CPOSTAL);
		cStmt.setObject(6, pP_NPOLIZA);
		cStmt.setObject(7, pP_NRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_BUSCA_TOMADORES(String pP_TNOMBRE, String pP_TDESCRIP,
			java.math.BigDecimal pP_NUMVIA, String pP_CPOSTAL, java.math.BigDecimal pP_NPOLIZA,
			java.math.BigDecimal pP_NRECIBO) throws Exception {
		return this.callPAC_IAX_CODA__F_BUSCA_TOMADORES(pP_TNOMBRE, pP_TDESCRIP, pP_NUMVIA, pP_CPOSTAL, pP_NPOLIZA,
				pP_NRECIBO);
	}
	// --END-PAC_IAX_CODA.F_BUSCA_TOMADORES
	// --START-PAC_IAX_CODA.F_EXCEL_CODA(P_SPROCES, P_FECHAINI, P_FECHAFIN,
	// P_CTIPREG, P_NRECIBO, P_TNOMBRE, P_TDESCRIP, P_CBANCO)

	private HashMap callPAC_IAX_CODA__F_EXCEL_CODA(java.math.BigDecimal pP_SPROCES, java.sql.Date pP_FECHAINI,
			java.sql.Date pP_FECHAFIN, java.math.BigDecimal pP_CTIPREG, java.math.BigDecimal pP_NRECIBO,
			String pP_TNOMBRE, String pP_TDESCRIP, java.math.BigDecimal pP_CBANCO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_EXCEL_CODA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SPROCES", "pP_FECHAINI", "pP_FECHAFIN", "pP_CTIPREG", "pP_NRECIBO", "pP_TNOMBRE",
						"pP_TDESCRIP", "pP_CBANCO" },
				new Object[] { pP_SPROCES, pP_FECHAINI, pP_FECHAFIN, pP_CTIPREG, pP_NRECIBO, pP_TNOMBRE, pP_TDESCRIP,
						pP_CBANCO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_FECHAINI);
		cStmt.setObject(4, pP_FECHAFIN);
		cStmt.setObject(5, pP_CTIPREG);
		cStmt.setObject(6, pP_NRECIBO);
		cStmt.setObject(7, pP_TNOMBRE);
		cStmt.setObject(8, pP_TDESCRIP);
		cStmt.setObject(9, pP_CBANCO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "P_RUTA"
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
			retVal.put("P_RUTA", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("P_RUTA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CODA__F_EXCEL_CODA(java.math.BigDecimal pP_SPROCES, java.sql.Date pP_FECHAINI,
			java.sql.Date pP_FECHAFIN, java.math.BigDecimal pP_CTIPREG, java.math.BigDecimal pP_NRECIBO,
			String pP_TNOMBRE, String pP_TDESCRIP, java.math.BigDecimal pP_CBANCO) throws Exception {
		return this.callPAC_IAX_CODA__F_EXCEL_CODA(pP_SPROCES, pP_FECHAINI, pP_FECHAFIN, pP_CTIPREG, pP_NRECIBO,
				pP_TNOMBRE, pP_TDESCRIP, pP_CBANCO);
	}
	// --END-PAC_IAX_CODA.F_EXCEL_CODA
	// --START-PAC_IAX_CODA.F_GESTION_RECIBOS(P_SPROCES, P_NNUMLIN, P_CBANCAR1,
	// P_NNUMORD, P_NRECIBO, P_OK)

	private HashMap callPAC_IAX_CODA__F_GESTION_RECIBOS(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_NNUMLIN, String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD, String pP_NRECIBO,
			java.math.BigDecimal pP_OK) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_GESTION_RECIBOS(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SPROCES", "pP_NNUMLIN", "pP_CBANCAR1", "pP_NNUMORD", "pP_NRECIBO", "pP_OK" },
				new Object[] { pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD, pP_NRECIBO, pP_OK });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_NNUMLIN);
		cStmt.setObject(4, pP_CBANCAR1);
		cStmt.setObject(5, pP_NNUMORD);
		cStmt.setObject(6, pP_NRECIBO);
		cStmt.setObject(7, pP_OK);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "P_REDO"
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
			retVal.put("P_REDO", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_REDO", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_GESTION_RECIBOS(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_NNUMLIN, String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD, String pP_NRECIBO,
			java.math.BigDecimal pP_OK) throws Exception {
		return this.callPAC_IAX_CODA__F_GESTION_RECIBOS(pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD, pP_NRECIBO,
				pP_OK);
	}
	// --END-PAC_IAX_CODA.F_GESTION_RECIBOS

	// --START-PAC_IAX_CODA.F_GET_CODA(P_SPROCES, P_FECHAINI, P_FECHAFIN, P_CTIPREG,
	// P_NRECIBO, P_TNOMBRE, P_TDESCRIP, P_CBANCO)

	private HashMap callPAC_IAX_CODA__F_GET_CODA(java.math.BigDecimal pP_SPROCES, java.sql.Date pP_FECHAINI,
			java.sql.Date pP_FECHAFIN, java.math.BigDecimal pP_CTIPREG, java.math.BigDecimal pP_NRECIBO,
			String pP_TNOMBRE, String pP_TDESCRIP, java.math.BigDecimal pP_CBANCO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_GET_CODA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SPROCES", "pP_FECHAINI", "pP_FECHAFIN", "pP_CTIPREG", "pP_NRECIBO", "pP_TNOMBRE",
						"pP_TDESCRIP", "pP_CBANCO" },
				new Object[] { pP_SPROCES, pP_FECHAINI, pP_FECHAFIN, pP_CTIPREG, pP_NRECIBO, pP_TNOMBRE, pP_TDESCRIP,
						pP_CBANCO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_FECHAINI);
		cStmt.setObject(4, pP_FECHAFIN);
		cStmt.setObject(5, pP_CTIPREG);
		cStmt.setObject(6, pP_NRECIBO);
		cStmt.setObject(7, pP_TNOMBRE);
		cStmt.setObject(8, pP_TDESCRIP);
		cStmt.setObject(9, pP_CBANCO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.CURSOR); // Valor de "P_REFCURSOR"
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
			retVal.put("P_REFCURSOR", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("P_REFCURSOR", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CODA__F_GET_CODA(java.math.BigDecimal pP_SPROCES, java.sql.Date pP_FECHAINI,
			java.sql.Date pP_FECHAFIN, java.math.BigDecimal pP_CTIPREG, java.math.BigDecimal pP_NRECIBO,
			String pP_TNOMBRE, String pP_TDESCRIP, java.math.BigDecimal pP_CBANCO) throws Exception {
		return this.callPAC_IAX_CODA__F_GET_CODA(pP_SPROCES, pP_FECHAINI, pP_FECHAFIN, pP_CTIPREG, pP_NRECIBO,
				pP_TNOMBRE, pP_TDESCRIP, pP_CBANCO);
	}
	// --END-PAC_IAX_CODA.F_GET_CODA
	// --START-PAC_IAX_CODA.F_GET_DATOS_PROCESO(P_SPROCES)

	private HashMap callPAC_IAX_CODA__F_GET_DATOS_PROCESO(java.math.BigDecimal pP_SPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_GET_DATOS_PROCESO(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES" }, new Object[] { pP_SPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "P_TNOMFILE"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "P_FPROCES"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "P_ICOBRADO"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "P_IIMPAGO"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "P_IPENDCOB"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "P_IPENIMP"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "P_TBANCO"
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
			retVal.put("P_TNOMFILE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_TNOMFILE", null);
		}
		try {
			retVal.put("P_FPROCES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_FPROCES", null);
		}
		try {
			retVal.put("P_ICOBRADO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_ICOBRADO", null);
		}
		try {
			retVal.put("P_IIMPAGO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_IIMPAGO", null);
		}
		try {
			retVal.put("P_IPENDCOB", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_IPENDCOB", null);
		}
		try {
			retVal.put("P_IPENIMP", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_IPENIMP", null);
		}
		try {
			retVal.put("P_TBANCO", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("P_TBANCO", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_GET_DATOS_PROCESO(java.math.BigDecimal pP_SPROCES) throws Exception {
		return this.callPAC_IAX_CODA__F_GET_DATOS_PROCESO(pP_SPROCES);
	}
	// --END-PAC_IAX_CODA.F_GET_DATOS_PROCESO
	// --START-PAC_IAX_CODA.F_GET_LINE_CODA(P_SPROCES, P_NNUMLIN, P_CBANCAR1,
	// P_NNUMORD)

	private HashMap callPAC_IAX_CODA__F_GET_LINE_CODA(java.math.BigDecimal pP_SPROCES, java.math.BigDecimal pP_NNUMLIN,
			String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_GET_LINE_CODA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES", "pP_NNUMLIN", "pP_CBANCAR1", "pP_NNUMORD" },
				new Object[] { pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_NNUMLIN);
		cStmt.setObject(4, pP_CBANCAR1);
		cStmt.setObject(5, pP_NNUMORD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "P_NOMBRE"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "P_DESCRIP"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.DATE); // Valor de "P_FECHA"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "P_IMPORTE"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "P_REFERENCE"
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
			retVal.put("P_NOMBRE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_NOMBRE", null);
		}
		try {
			retVal.put("P_DESCRIP", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_DESCRIP", null);
		}
		try {
			retVal.put("P_FECHA", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_FECHA", null);
		}
		try {
			retVal.put("P_IMPORTE", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("P_IMPORTE", null);
		}
		try {
			retVal.put("P_REFERENCE", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("P_REFERENCE", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CODA__F_GET_LINE_CODA(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_NNUMLIN, String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD) throws Exception {
		return this.callPAC_IAX_CODA__F_GET_LINE_CODA(pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD);
	}
	// --END-PAC_IAX_CODA.F_GET_LINE_CODA

	// --START-PAC_IAX_CODA.F_CANCELA_REGISTRO(P_SPROCES, P_NNUMLIN, P_CBANCAR1,
	// P_NNUMORD)

	private HashMap callPAC_IAX_CODA__F_CANCELA_REGISTRO(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_NNUMLIN, String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_CANCELA_REGISTRO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES", "pP_NNUMLIN", "pP_CBANCAR1", "pP_NNUMORD" },
				new Object[] { pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_NNUMLIN);
		cStmt.setObject(4, pP_CBANCAR1);
		cStmt.setObject(5, pP_NNUMORD);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CODA__F_CANCELA_REGISTRO(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_NNUMLIN, String pP_CBANCAR1, java.math.BigDecimal pP_NNUMORD) throws Exception {
		return this.callPAC_IAX_CODA__F_CANCELA_REGISTRO(pP_SPROCES, pP_NNUMLIN, pP_CBANCAR1, pP_NNUMORD);
	}
	// --END-PAC_IAX_CODA.F_CANCELA_REGISTRO

	// --START-PAC_IAX_CODA.FF_IMPORTE_PENDIENTE(PNRECIBO, PSMOVREC)

	private HashMap callPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.FF_IMPORTE_PENDIENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPSMOVREC" }, new Object[] { pPNRECIBO, pPSMOVREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPSMOVREC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "P_IMPORTE"
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
			retVal.put("P_IMPORTE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_IMPORTE", null);
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

	public HashMap ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		return this.callPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(pPNRECIBO, pPSMOVREC);
	}
	// --END-PAC_IAX_CODA.FF_IMPORTE_PENDIENTE
	// --START-PAC_IAX_CODA.F_VALIDA_IMPORTE(PNRECIBO, PSMOVREC, PITOTALR, PIPAGO)

	private HashMap callPAC_IAX_CODA__F_VALIDA_IMPORTE(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSMOVREC,
			java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPIPAGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_VALIDA_IMPORTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPSMOVREC", "pPITOTALR", "pPIPAGO" },
				new Object[] { pPNRECIBO, pPSMOVREC, pPITOTALR, pPIPAGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPSMOVREC);
		cStmt.setObject(4, pPITOTALR);
		cStmt.setObject(5, pPIPAGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "P_IMPORTE"
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
			retVal.put("P_IMPORTE", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_IMPORTE", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_VALIDA_IMPORTE(java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPSMOVREC,
			java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPIPAGO) throws Exception {
		return this.callPAC_IAX_CODA__F_VALIDA_IMPORTE(pPNRECIBO, pPSMOVREC, pPITOTALR, pPIPAGO);
	}
	// --END-PAC_IAX_CODA.F_VALIDA_IMPORTE
	// --START-PAC_IAX_CODA.F_GET_DETMOVRECIBOS(PNRECIBO, PSMOVREC)

	private HashMap callPAC_IAX_CODA__F_GET_DETMOVRECIBOS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_GET_DETMOVRECIBOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPSMOVREC" }, new Object[] { pPNRECIBO, pPSMOVREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPSMOVREC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURDETMOVRECIBO"
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
			retVal.put("PCURDETMOVRECIBO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCURDETMOVRECIBO", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_GET_DETMOVRECIBOS(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		return this.callPAC_IAX_CODA__F_GET_DETMOVRECIBOS(pPNRECIBO, pPSMOVREC);
	}
	// --END-PAC_IAX_CODA.F_GET_DETMOVRECIBOS

	// --START-PAC_IAX_CODA.F_GET_DETMOVRECIBOSC(PNRECIBO, PSMOVREC)

	private HashMap callPAC_IAX_CODA__F_GET_DETMOVRECIBOSC(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODA.F_GET_DETMOVRECIBOSC(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPSMOVREC" }, new Object[] { pPNRECIBO, pPSMOVREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPSMOVREC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURDETMOVRECIBO"
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
			retVal.put("PCURDETMOVRECIBO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCURDETMOVRECIBO", null);
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

	public HashMap ejecutaPAC_IAX_CODA__F_GET_DETMOVRECIBOSC(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPSMOVREC) throws Exception {
		return this.callPAC_IAX_CODA__F_GET_DETMOVRECIBOSC(pPNRECIBO, pPSMOVREC);
	}
	// --END-PAC_IAX_CODA.F_GET_DETMOVRECIBOSC
}
