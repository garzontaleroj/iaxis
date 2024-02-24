package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PORCEN_PMD extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ACTIVIDADES.class);
	private Connection conn = null;

	public PAC_IAX_PORCEN_PMD(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PORCEN_PMD.F_COPIAR_CONFIG_PRODUCTO(PCRAMO, PSPRODUC)
	private HashMap callPAC_IAX_PORCEN_PMD__F_COPIAR_CONFIG_PRODUCTO(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_COPIAR_CONFIG_PRODUCTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPSPRODUC" }, new Object[] { pPCRAMO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_COPIAR_CONFIG_PRODUCTO(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_COPIAR_CONFIG_PRODUCTO(pPCRAMO, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PORCEN_PMD.F_COPIAR_CONFIG_PRODUCTO
	// --START-PAC_IAX_PORCEN_PMD.F_DEL_CTTO_TRAMO_PRODUCTO(PID)
	private HashMap callPAC_IAX_PORCEN_PMD__F_DEL_CTTO_TRAMO_PRODUCTO(java.math.BigDecimal pPID) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_DEL_CTTO_TRAMO_PRODUCTO(?, ?)}";

		logCall(callQuery, new String[] { "pPID" }, new Object[] { pPID });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPID);
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_DEL_CTTO_TRAMO_PRODUCTO(java.math.BigDecimal pPID) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_DEL_CTTO_TRAMO_PRODUCTO(pPID);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PORCEN_PMD.F_DEL_CTTO_TRAMO_PRODUCTO
	// --START-PAC_IAX_PORCEN_PMD.F_DEL_PORCEN_TRAMO_CTTO(PIDCABECERA, PID)
	private HashMap callPAC_IAX_PORCEN_PMD__F_DEL_PORCEN_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA,
			java.math.BigDecimal pPID) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_DEL_PORCEN_TRAMO_CTTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCABECERA", "pPID" }, new Object[] { pPIDCABECERA, pPID });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCABECERA);
		cStmt.setObject(3, pPID);
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_DEL_PORCEN_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA,
			java.math.BigDecimal pPID) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_DEL_PORCEN_TRAMO_CTTO(pPIDCABECERA, pPID);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PORCEN_PMD.F_DEL_PORCEN_TRAMO_CTTO

	// --START-PAC_IAX_PORCEN_PMD.F_GET_CTTOSTRAMOSPRODUCTOS(PSCONTRA, PNVERSIO,
	// PNRAMO, PNTRAMO, PNPRODUC)
	private HashMap callPAC_IAX_PORCEN_PMD__F_GET_CTTOSTRAMOSPRODUCTOS(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPNRAMO, java.math.BigDecimal pPNTRAMO,
			java.math.BigDecimal pPNPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_GET_CTTOSTRAMOSPRODUCTOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO", "pPNRAMO", "pPNTRAMO", "pPNPRODUC" },
				new Object[] { pPSCONTRA, pPNVERSIO, pPNRAMO, pPNTRAMO, pPNPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTRA);
		cStmt.setObject(3, pPNVERSIO);
		cStmt.setObject(4, pPNRAMO);
		cStmt.setObject(5, pPNTRAMO);
		cStmt.setObject(6, pPNPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CTTO_TRAMO_PRODUCTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_GET_CTTOSTRAMOSPRODUCTOS(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPNRAMO, java.math.BigDecimal pPNTRAMO,
			java.math.BigDecimal pPNPRODUC) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_GET_CTTOSTRAMOSPRODUCTOS(pPSCONTRA, pPNVERSIO, pPNRAMO, pPNTRAMO,
				pPNPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PORCEN_PMD.F_GET_CTTOSTRAMOSPRODUCTOS

	// --START-PAC_IAX_PORCEN_PMD.F_GET_CTTO_TRAMO_PRODUCTO(PID, PSCONTRA)
	private HashMap callPAC_IAX_PORCEN_PMD__F_GET_CTTO_TRAMO_PRODUCTO(java.math.BigDecimal pPID,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_GET_CTTO_TRAMO_PRODUCTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPID", "pPSCONTRA" }, new Object[] { pPID, pPSCONTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPID);
		cStmt.setObject(3, pPSCONTRA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CTTO_TRAMO_PRODUCTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_GET_CTTO_TRAMO_PRODUCTO(java.math.BigDecimal pPID,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_GET_CTTO_TRAMO_PRODUCTO(pPID, pPSCONTRA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PORCEN_PMD.F_GET_CTTO_TRAMO_PRODUCTO
	// --START-PAC_IAX_PORCEN_PMD.F_GET_PORCENTAJES_TRAMO_CTTO(PIDCABECERA)
	private HashMap callPAC_IAX_PORCEN_PMD__F_GET_PORCENTAJES_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_GET_PORCENTAJES_TRAMO_CTTO(?, ?)}";

		logCall(callQuery, new String[] { "pPIDCABECERA" }, new Object[] { pPIDCABECERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCABECERA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PORCEN_TRAMO_CTTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_GET_PORCENTAJES_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA)
			throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_GET_PORCENTAJES_TRAMO_CTTO(pPIDCABECERA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PORCEN_PMD.F_GET_PORCENTAJES_TRAMO_CTTO
	// --START-PAC_IAX_PORCEN_PMD.F_GET_PORCEN_TRAMO_CTTO(PIDCABECERA, PID)
	private HashMap callPAC_IAX_PORCEN_PMD__F_GET_PORCEN_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA,
			java.math.BigDecimal pPID) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_GET_PORCEN_TRAMO_CTTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCABECERA", "pPID" }, new Object[] { pPIDCABECERA, pPID });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCABECERA);
		cStmt.setObject(3, pPID);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PORCEN_TRAMO_CTTO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_GET_PORCEN_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA,
			java.math.BigDecimal pPID) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_GET_PORCEN_TRAMO_CTTO(pPIDCABECERA, pPID);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PORCEN_PMD.F_GET_PORCEN_TRAMO_CTTO
	// --START-PAC_IAX_PORCEN_PMD.F_REPLICAR_CUOTAS(PSCONTRA, PCTRAMO, PCRAMO,
	// PSPRODUC)
	private HashMap callPAC_IAX_PORCEN_PMD__F_REPLICAR_CUOTAS(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_REPLICAR_CUOTAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTRA", "pPCTRAMO", "pPCRAMO", "pPSPRODUC" },
				new Object[] { pPSCONTRA, pPCTRAMO, pPCRAMO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTRA);
		cStmt.setObject(3, pPCTRAMO);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_REPLICAR_CUOTAS(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_REPLICAR_CUOTAS(pPSCONTRA, pPCTRAMO, pPCRAMO, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PORCEN_PMD.F_REPLICAR_CUOTAS
	// --START-PAC_IAX_PORCEN_PMD.F_SET_CTTO_TRAMO_PRODUCTO(PSCONTRA, PNVERSIO,
	// PCTRAMO, PCRAMO, PSPRODUC)
	private HashMap callPAC_IAX_PORCEN_PMD__F_SET_CTTO_TRAMO_PRODUCTO(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_SET_CTTO_TRAMO_PRODUCTO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPCRAMO", "pPSPRODUC" },
				new Object[] { pPSCONTRA, pPNVERSIO, pPCTRAMO, pPCRAMO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTRA);
		cStmt.setObject(3, pPNVERSIO);
		cStmt.setObject(4, pPCTRAMO);
		cStmt.setObject(5, pPCRAMO);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PCTTO_TRAMO_PRODUCTO_NEW"
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
			retVal.put("PCTTO_TRAMO_PRODUCTO_NEW", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCTTO_TRAMO_PRODUCTO_NEW", null);
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_SET_CTTO_TRAMO_PRODUCTO(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_SET_CTTO_TRAMO_PRODUCTO(pPSCONTRA, pPNVERSIO, pPCTRAMO, pPCRAMO,
				pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PORCEN_PMD.F_SET_CTTO_TRAMO_PRODUCTO
	// --START-PAC_IAX_PORCEN_PMD.F_SET_PORCEN_TRAMO_CTTO(PIDCABECERA, PID, PPORCEN,
	// PFPAGO)
	private HashMap callPAC_IAX_PORCEN_PMD__F_SET_PORCEN_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA,
			java.math.BigDecimal pPID, java.math.BigDecimal pPPORCEN, java.sql.Date pPFPAGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PORCEN_PMD.F_SET_PORCEN_TRAMO_CTTO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDCABECERA", "pPID", "pPPORCEN", "pPFPAGO" },
				new Object[] { pPIDCABECERA, pPID, pPPORCEN, pPFPAGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCABECERA);
		cStmt.setObject(3, pPID);
		cStmt.setObject(4, pPPORCEN);
		cStmt.setObject(5, pPFPAGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PPORCEN_TRAMO_CTTO_NEW"
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
			retVal.put("PPORCEN_TRAMO_CTTO_NEW", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PPORCEN_TRAMO_CTTO_NEW", null);
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

	public HashMap ejecutaPAC_IAX_PORCEN_PMD__F_SET_PORCEN_TRAMO_CTTO(java.math.BigDecimal pPIDCABECERA,
			java.math.BigDecimal pPID, java.math.BigDecimal pPPORCEN, java.sql.Date pPFPAGO) throws Exception {
		return this.callPAC_IAX_PORCEN_PMD__F_SET_PORCEN_TRAMO_CTTO(pPIDCABECERA, pPID, pPPORCEN, pPFPAGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PORCEN_PMD.F_SET_PORCEN_TRAMO_CTTO

}
