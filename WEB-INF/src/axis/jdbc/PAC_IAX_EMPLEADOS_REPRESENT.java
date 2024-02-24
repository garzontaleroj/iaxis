package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_EMPLEADOS_REPRESENT extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_EMPLEADOS_REPRESENT.class);
	private Connection conn = null;

	public PAC_IAX_EMPLEADOS_REPRESENT(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_DEL_EMPLEADO(PSPERSON)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_DEL_EMPLEADO(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_DEL_EMPLEADO(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_DEL_EMPLEADO(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_DEL_EMPLEADO(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_DEL_EMPLEADO
	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_DEL_REPRESENTANTE(PSPERSON)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_DEL_REPRESENTANTE(java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_DEL_REPRESENTANTE(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_DEL_REPRESENTANTE(java.math.BigDecimal pPSPERSON)
			throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_DEL_REPRESENTANTE(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_DEL_REPRESENTANTE
	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_EMPLEADO(PSPERSON)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADO(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_GET_EMPLEADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_EMPLEADO".toUpperCase())); // Valor de "OBEMPLEADO"
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
			retVal.put("OBEMPLEADO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OBEMPLEADO", null);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADO(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADO(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_EMPLEADO
	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_EMPLEADOS(PSPERSON, PCTIPO,
	// PCSUBTIPO, PCCARGO, PCCANAL)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADOS(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, java.math.BigDecimal pPCCARGO,
			java.math.BigDecimal pPCCANAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_GET_EMPLEADOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCTIPO", "pPCSUBTIPO", "pPCCARGO", "pPCCANAL" },
				new Object[] { pPSPERSON, pPCTIPO, pPCSUBTIPO, pPCCARGO, pPCCANAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCSUBTIPO);
		cStmt.setObject(5, pPCCARGO);
		cStmt.setObject(6, pPCCANAL);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADOS(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, java.math.BigDecimal pPCCARGO,
			java.math.BigDecimal pPCCANAL) throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADOS(pPSPERSON, pPCTIPO, pPCSUBTIPO, pPCCARGO,
				pPCCANAL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_EMPLEADOS
	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_REPRESENTANTES(PSPERSON, PCTIPO,
	// PCSUBTIPO, PTCOMPANIA, PTPUNTOVENTA)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_REPRESENTANTES(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, String pPTCOMPANIA, String pPTPUNTOVENTA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_GET_REPRESENTANTES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCTIPO", "pPCSUBTIPO", "pPTCOMPANIA", "pPTPUNTOVENTA" },
				new Object[] { pPSPERSON, pPCTIPO, pPCSUBTIPO, pPTCOMPANIA, pPTPUNTOVENTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCSUBTIPO);
		cStmt.setObject(5, pPTCOMPANIA);
		cStmt.setObject(6, pPTPUNTOVENTA);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_GET_REPRESENTANTES(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, String pPTCOMPANIA, String pPTPUNTOVENTA)
			throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_REPRESENTANTES(pPSPERSON, pPCTIPO, pPCSUBTIPO, pPTCOMPANIA,
				pPTPUNTOVENTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_REPRESENTANTES

	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_REPRESENTANTE(PSPERSON)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_REPRESENTANTE(java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_GET_REPRESENTANTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_REPRESENTANTE".toUpperCase())); // Valor de "OBREPRESENTANTE"
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
			retVal.put("OBREPRESENTANTE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OBREPRESENTANTE", null);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_GET_REPRESENTANTE(java.math.BigDecimal pPSPERSON)
			throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_GET_REPRESENTANTE(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_GET_REPRESENTANTE

	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_SET_EMPLEADO(PSPERSON, PCTIPO,
	// PCSUBTIPO, PCARGO, PCCANAL)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_SET_EMPLEADO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, java.math.BigDecimal pPCARGO,
			java.math.BigDecimal pPCCANAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_SET_EMPLEADO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCTIPO", "pPCSUBTIPO", "pPCARGO", "pPCCANAL" },
				new Object[] { pPSPERSON, pPCTIPO, pPCSUBTIPO, pPCARGO, pPCCANAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCSUBTIPO);
		cStmt.setObject(5, pPCARGO);
		cStmt.setObject(6, pPCCANAL);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_SET_EMPLEADO(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, java.math.BigDecimal pPCARGO,
			java.math.BigDecimal pPCCANAL) throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_SET_EMPLEADO(pPSPERSON, pPCTIPO, pPCSUBTIPO, pPCARGO, pPCCANAL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_SET_EMPLEADO
	// --START-PAC_IAX_EMPLEADOS_REPRESENT.F_SET_REPRESENTANTE(PSPERSON, PCTIPO,
	// PCSUBTIPO, PTCOMPANIA, PTPUNTOVENTA, PSPERCOORD)
	private HashMap callPAC_IAX_EMPLEADOS_REPRESENT__F_SET_REPRESENTANTE(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, String pPTCOMPANIA, String pPTPUNTOVENTA,
			java.math.BigDecimal pPSPERCOORD) throws Exception {
		String callQuery = "{?=call PAC_IAX_EMPLEADOS_REPRESENT.F_SET_REPRESENTANTE(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCTIPO", "pPCSUBTIPO", "pPTCOMPANIA", "pPTPUNTOVENTA", "pPSPERCOORD" },
				new Object[] { pPSPERSON, pPCTIPO, pPCSUBTIPO, pPTCOMPANIA, pPTPUNTOVENTA, pPSPERCOORD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCSUBTIPO);
		cStmt.setObject(5, pPTCOMPANIA);
		cStmt.setObject(6, pPTPUNTOVENTA);
		cStmt.setObject(7, pPSPERCOORD);
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

	public HashMap ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_SET_REPRESENTANTE(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCSUBTIPO, String pPTCOMPANIA, String pPTPUNTOVENTA,
			java.math.BigDecimal pPSPERCOORD) throws Exception {
		return this.callPAC_IAX_EMPLEADOS_REPRESENT__F_SET_REPRESENTANTE(pPSPERSON, pPCTIPO, pPCSUBTIPO, pPTCOMPANIA,
				pPTPUNTOVENTA, pPSPERCOORD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_EMPLEADOS_REPRESENT.F_SET_REPRESENTANTE

}
