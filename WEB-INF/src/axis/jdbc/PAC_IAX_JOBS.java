package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_JOBS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CODA.class);
	private Connection conn = null;

	public PAC_IAX_JOBS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_JOBS.F_EJECUTAR(PNUMJOB)
	private HashMap callPAC_IAX_JOBS__F_EJECUTAR(java.math.BigDecimal pPNUMJOB) throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_EJECUTAR(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMJOB" }, new Object[] { pPNUMJOB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMJOB);
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

	public HashMap ejecutaPAC_IAX_JOBS__F_EJECUTAR(java.math.BigDecimal pPNUMJOB) throws Exception {
		return this.callPAC_IAX_JOBS__F_EJECUTAR(pPNUMJOB);
	}

	// --END-PAC_IAX_JOBS.F_EJECUTAR
	// --START-PAC_IAX_JOBS.F_ELIMINAR(PNUMJOB)
	private HashMap callPAC_IAX_JOBS__F_ELIMINAR(java.math.BigDecimal pPNUMJOB) throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_ELIMINAR(?, ?)}";

		logCall(callQuery, new String[] { "pPNUMJOB" }, new Object[] { pPNUMJOB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMJOB);
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

	public HashMap ejecutaPAC_IAX_JOBS__F_ELIMINAR(java.math.BigDecimal pPNUMJOB) throws Exception {
		return this.callPAC_IAX_JOBS__F_ELIMINAR(pPNUMJOB);
	}

	// --END-PAC_IAX_JOBS.F_ELIMINAR
	// --START-PAC_IAX_JOBS.F_GET_INTERVALOS()
	private HashMap callPAC_IAX_JOBS__F_GET_INTERVALOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_GET_INTERVALOS(?)}";

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

	public HashMap ejecutaPAC_IAX_JOBS__F_GET_INTERVALOS() throws Exception {
		return this.callPAC_IAX_JOBS__F_GET_INTERVALOS();
	}
	// --END-PAC_IAX_JOBS.F_GET_INTERVALOS

	// --START-PAC_IAX_JOBS.F_GET_PROCESOS(PNUMJOB, PFECHADESDE, PFECHAHASTA,
	// PBLOQUEADO, PFUNCION)
	private HashMap callPAC_IAX_JOBS__F_GET_PROCESOS(java.math.BigDecimal pPNUMJOB, java.sql.Date pPFECHADESDE,
			java.sql.Date pPFECHAHASTA, String pPBLOQUEADO, String pPFUNCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_GET_PROCESOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNUMJOB", "pPFECHADESDE", "pPFECHAHASTA", "pPBLOQUEADO", "pPFUNCION" },
				new Object[] { pPNUMJOB, pPFECHADESDE, pPFECHAHASTA, pPBLOQUEADO, pPFUNCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMJOB);
		cStmt.setObject(3, pPFECHADESDE);
		cStmt.setObject(4, pPFECHAHASTA);
		cStmt.setObject(5, pPBLOQUEADO);
		cStmt.setObject(6, pPFUNCION);
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

	public HashMap ejecutaPAC_IAX_JOBS__F_GET_PROCESOS(java.math.BigDecimal pPNUMJOB, java.sql.Date pPFECHADESDE,
			java.sql.Date pPFECHAHASTA, String pPBLOQUEADO, String pPFUNCION) throws Exception {
		return this.callPAC_IAX_JOBS__F_GET_PROCESOS(pPNUMJOB, pPFECHADESDE, pPFECHAHASTA, pPBLOQUEADO, pPFUNCION);
	}
	// --END-PAC_IAX_JOBS.F_GET_PROCESOS

	// --START-PAC_IAX_JOBS.F_SET_ALTAPROCESO(PFUNCION, PROXIMAFECHA, PCINTERVALO,
	// PBLOQUEADO)
	private HashMap callPAC_IAX_JOBS__F_SET_ALTAPROCESO(String pPFUNCION, String pPROXIMAFECHA, String pPCINTERVALO,
			java.math.BigDecimal pPBLOQUEADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_SET_ALTAPROCESO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFUNCION", "pPROXIMAFECHA", "pPCINTERVALO", "pPBLOQUEADO" },
				new Object[] { pPFUNCION, pPROXIMAFECHA, pPCINTERVALO, pPBLOQUEADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFUNCION);
		cStmt.setObject(3, pPROXIMAFECHA);
		cStmt.setObject(4, pPCINTERVALO);
		cStmt.setObject(5, pPBLOQUEADO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNUMJOB"
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
			retVal.put("PNUMJOB", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNUMJOB", null);
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

	public HashMap ejecutaPAC_IAX_JOBS__F_SET_ALTAPROCESO(String pPFUNCION, String pPROXIMAFECHA, String pPCINTERVALO,
			java.math.BigDecimal pPBLOQUEADO) throws Exception {
		return this.callPAC_IAX_JOBS__F_SET_ALTAPROCESO(pPFUNCION, pPROXIMAFECHA, pPCINTERVALO, pPBLOQUEADO);
	}
	// --END-PAC_IAX_JOBS.F_SET_ALTAPROCESO

	// --START-PAC_IAX_JOBS.F_SET_MODBLOQUEO(PNUMJOB, PBLOQUEADO, PROXIMAFECHA)
	private HashMap callPAC_IAX_JOBS__F_SET_MODBLOQUEO(java.math.BigDecimal pPNUMJOB, Object pPBLOQUEADO,
			java.sql.Date pPROXIMAFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_SET_MODBLOQUEO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNUMJOB", "pPBLOQUEADO", "pPROXIMAFECHA" },
				new Object[] { pPNUMJOB, pPBLOQUEADO, pPROXIMAFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMJOB);
		cStmt.setObject(3, pPBLOQUEADO);
		cStmt.setObject(4, pPROXIMAFECHA);
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

	public HashMap ejecutaPAC_IAX_JOBS__F_SET_MODBLOQUEO(java.math.BigDecimal pPNUMJOB, Object pPBLOQUEADO,
			java.sql.Date pPROXIMAFECHA) throws Exception {
		return this.callPAC_IAX_JOBS__F_SET_MODBLOQUEO(pPNUMJOB, pPBLOQUEADO, pPROXIMAFECHA);
	}
	// --END-PAC_IAX_JOBS.F_SET_MODBLOQUEO

	// --START-PAC_IAX_JOBS.F_SET_MODPROCESO(PNUMJOB, PFUNCION, PROXIMAFECHA,
	// PCINTERVALO, PBLOQUEADO)
	private HashMap callPAC_IAX_JOBS__F_SET_MODPROCESO(java.math.BigDecimal pPNUMJOB, String pPFUNCION,
			String pPROXIMAFECHA, String pPCINTERVALO, java.math.BigDecimal pPBLOQUEADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_SET_MODPROCESO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNUMJOB", "pPFUNCION", "pPROXIMAFECHA", "pPCINTERVALO", "pPBLOQUEADO" },
				new Object[] { pPNUMJOB, pPFUNCION, pPROXIMAFECHA, pPCINTERVALO, pPBLOQUEADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMJOB);
		cStmt.setObject(3, pPFUNCION);
		cStmt.setObject(4, pPROXIMAFECHA);
		cStmt.setObject(5, pPCINTERVALO);
		cStmt.setObject(6, pPBLOQUEADO);
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

	public HashMap ejecutaPAC_IAX_JOBS__F_SET_MODPROCESO(java.math.BigDecimal pPNUMJOB, String pPFUNCION,
			String pPROXIMAFECHA, String pPCINTERVALO, java.math.BigDecimal pPBLOQUEADO) throws Exception {
		return this.callPAC_IAX_JOBS__F_SET_MODPROCESO(pPNUMJOB, pPFUNCION, pPROXIMAFECHA, pPCINTERVALO, pPBLOQUEADO);
	}
	// --END-PAC_IAX_JOBS.F_SET_MODPROCESO

	// --START-PAC_IAX_JOBS.F_GET_PROCESO(PNUMJOB)
	private HashMap callPAC_IAX_JOBS__F_GET_PROCESO(java.math.BigDecimal pPNUMJOB) throws Exception {
		String callQuery = "{?=call PAC_IAX_JOBS.F_GET_PROCESO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNUMJOB" }, new Object[] { pPNUMJOB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMJOB);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PWHAT"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PNEXTDATE"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PINTERVAL"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PBROKEN"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PHORA"
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
			retVal.put("PWHAT", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PWHAT", null);
		}
		try {
			retVal.put("PNEXTDATE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNEXTDATE", null);
		}
		try {
			retVal.put("PINTERVAL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PINTERVAL", null);
		}
		try {
			retVal.put("PBROKEN", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PBROKEN", null);
		}
		try {
			retVal.put("PHORA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PHORA", null);
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

	public HashMap ejecutaPAC_IAX_JOBS__F_GET_PROCESO(java.math.BigDecimal pPNUMJOB) throws Exception {
		return this.callPAC_IAX_JOBS__F_GET_PROCESO(pPNUMJOB);
	}
	// --END-PAC_IAX_JOBS.F_GET_PROCESO

}
