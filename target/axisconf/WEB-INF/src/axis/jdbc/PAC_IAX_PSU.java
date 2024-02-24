//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #

package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PSU extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PSU.class);
	private Connection conn = null;

	public PAC_IAX_PSU(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PSU.F_GET_LSTNIVELES()
	private HashMap callPAC_IAX_PSU__F_GET_LSTNIVELES() throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_GET_LSTNIVELES(?)}";

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

	public HashMap ejecutaPAC_IAX_PSU__F_GET_LSTNIVELES() throws Exception {
		return this.callPAC_IAX_PSU__F_GET_LSTNIVELES();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_GET_LSTNIVELES

	// --START-PAC_IAX_PSU.F_NIVEL_USUARIO(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_PSU__F_NIVEL_USUARIO(java.math.BigDecimal pPSSEGURO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_NIVEL_USUARIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "P_NIVEL"
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
			retVal.put("P_NIVEL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("P_NIVEL", null);
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

	public HashMap ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_PSU__F_NIVEL_USUARIO(pPSSEGURO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_NIVEL_USUARIO

	// --START-PAC_IAX_PSU.F_GESTION_CONTROL(P_SSEGURO, P_NRIESGO, P_NMOVIMI,
	// P_CGARANT, P_CCONTROL, P_TOBSERV, P_CAUTREC, P_NVALORTOPE, P_NOCURRE,
	// P_NVALOR, P_NVALORINF, P_NVALORSUPER, P_NIVELR, P_ESTABLOQUEA, P_AUTMANUAL,
	// P_TABLAS, P_MODO, P_NUMRIESGO)
	private HashMap callPAC_IAX_PSU__F_GESTION_CONTROL(java.math.BigDecimal pP_SSEGURO, java.math.BigDecimal pP_NRIESGO,
			java.math.BigDecimal pP_NMOVIMI, java.math.BigDecimal pP_CGARANT, java.math.BigDecimal pP_CCONTROL,
			String pP_TOBSERV, java.math.BigDecimal pP_CAUTREC, java.math.BigDecimal pP_NVALORTOPE,
			java.math.BigDecimal pP_NOCURRE, java.math.BigDecimal pP_NVALOR, java.math.BigDecimal pP_NVALORINF,
			java.math.BigDecimal pP_NVALORSUPER, java.math.BigDecimal pP_NIVELR, java.math.BigDecimal pP_ESTABLOQUEA,
			java.math.BigDecimal pP_AUTMANUAL, String pP_TABLAS, java.math.BigDecimal pP_MODO, String pP_NUMRIESGO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_GESTION_CONTROL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SSEGURO", "pP_NRIESGO", "pP_NMOVIMI", "pP_CGARANT", "pP_CCONTROL", "pP_TOBSERV",
						"pP_CAUTREC", "pP_NVALORTOPE", "pP_NOCURRE", "pP_NVALOR", "pP_NVALORINF", "pP_NVALORSUPER",
						"pP_NIVELR", "pP_ESTABLOQUEA", "pP_AUTMANUAL", "pP_TABLAS", "pP_MODO", "pP_NUMRIESGO" },
				new Object[] { pP_SSEGURO, pP_NRIESGO, pP_NMOVIMI, pP_CGARANT, pP_CCONTROL, pP_TOBSERV, pP_CAUTREC,
						pP_NVALORTOPE, pP_NOCURRE, pP_NVALOR, pP_NVALORINF, pP_NVALORSUPER, pP_NIVELR, pP_ESTABLOQUEA,
						pP_AUTMANUAL, pP_TABLAS, pP_MODO, pP_NUMRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NRIESGO);
		cStmt.setObject(4, pP_NMOVIMI);
		cStmt.setObject(5, pP_CGARANT);
		cStmt.setObject(6, pP_CCONTROL);
		cStmt.setObject(7, pP_TOBSERV);
		cStmt.setObject(8, pP_CAUTREC);
		cStmt.setObject(9, pP_NVALORTOPE);
		cStmt.setObject(10, pP_NOCURRE);
		cStmt.setObject(11, pP_NVALOR);
		cStmt.setObject(12, pP_NVALORINF);
		cStmt.setObject(13, pP_NVALORSUPER);
		cStmt.setObject(14, pP_NIVELR);
		cStmt.setObject(15, pP_ESTABLOQUEA);
		cStmt.setObject(16, pP_AUTMANUAL);
		cStmt.setObject(17, pP_TABLAS);
		cStmt.setObject(18, pP_MODO);
		cStmt.setObject(19, pP_NUMRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(20, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PSU__F_GESTION_CONTROL(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_NMOVIMI, java.math.BigDecimal pP_CGARANT,
			java.math.BigDecimal pP_CCONTROL, String pP_TOBSERV, java.math.BigDecimal pP_CAUTREC,
			java.math.BigDecimal pP_NVALORTOPE, java.math.BigDecimal pP_NOCURRE, java.math.BigDecimal pP_NVALOR,
			java.math.BigDecimal pP_NVALORINF, java.math.BigDecimal pP_NVALORSUPER, java.math.BigDecimal pP_NIVELR,
			java.math.BigDecimal pP_ESTABLOQUEA, java.math.BigDecimal pP_AUTMANUAL, String pP_TABLAS,
			java.math.BigDecimal pP_MODO, String pP_NUMRIESGO) throws Exception {
		return this.callPAC_IAX_PSU__F_GESTION_CONTROL(pP_SSEGURO, pP_NRIESGO, pP_NMOVIMI, pP_CGARANT, pP_CCONTROL,
				pP_TOBSERV, pP_CAUTREC, pP_NVALORTOPE, pP_NOCURRE, pP_NVALOR, pP_NVALORINF, pP_NVALORSUPER, pP_NIVELR,
				pP_ESTABLOQUEA, pP_AUTMANUAL, pP_TABLAS, pP_MODO, pP_NUMRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_GESTION_CONTROL

	// --START-PAC_IAX_PSU.F_GET_COLEC_PSU(P_SSEGURO, P_NMOVIMI, P_NRIESGO,
	// P_TABLAS)
	private HashMap callPAC_IAX_PSU__F_GET_COLEC_PSU(java.math.BigDecimal pP_SSEGURO, java.math.BigDecimal pP_NMOVIMI,
			java.math.BigDecimal pP_NRIESGO, String pP_TABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_GET_COLEC_PSU(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO", "pP_NMOVIMI", "pP_NRIESGO", "pP_TABLAS" },
				new Object[] { pP_SSEGURO, pP_NMOVIMI, pP_NRIESGO, pP_TABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NMOVIMI);
		cStmt.setObject(4, pP_NRIESGO);
		cStmt.setObject(5, pP_TABLAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "P_TESTPOL"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "P_CESTPOL"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "P_CNIVELBPM"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "P_TNIVELBPM"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PSU_RETENIDAS".toUpperCase())); // Valor de "POBPSU_RETENIDAS"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PSU".toUpperCase())); // Valor de "P_TPSUS"
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
			retVal.put("P_TESTPOL", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_TESTPOL", null);
		}
		try {
			retVal.put("P_CESTPOL", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_CESTPOL", null);
		}
		try {
			retVal.put("P_CNIVELBPM", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_CNIVELBPM", null);
		}
		try {
			retVal.put("P_TNIVELBPM", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("P_TNIVELBPM", null);
		}
		try {
			retVal.put("POBPSU_RETENIDAS", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("POBPSU_RETENIDAS", null);
		}
		try {
			retVal.put("P_TPSUS", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("P_TPSUS", null);
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

	public HashMap ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(java.math.BigDecimal pP_SSEGURO, java.math.BigDecimal pP_NMOVIMI,
			java.math.BigDecimal pP_NRIESGO, String pP_TABLAS) throws Exception {
		return this.callPAC_IAX_PSU__F_GET_COLEC_PSU(pP_SSEGURO, pP_NMOVIMI, pP_NRIESGO, pP_TABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_GET_COLEC_PSU

	// --START-PAC_IAX_PSU.F_GET_CONSULTA(P_SPRODUC, P_NPOLIZA, P_NSOLICI,
	// P_CAUTREC)
	private HashMap callPAC_IAX_PSU__F_GET_CONSULTA(java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_NPOLIZA,
			java.math.BigDecimal pP_NSOLICI, java.math.BigDecimal pP_CAUTREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_GET_CONSULTA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPRODUC", "pP_NPOLIZA", "pP_NSOLICI", "pP_CAUTREC" },
				new Object[] { pP_SPRODUC, pP_NPOLIZA, pP_NSOLICI, pP_CAUTREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPRODUC);
		cStmt.setObject(3, pP_NPOLIZA);
		cStmt.setObject(4, pP_NSOLICI);
		cStmt.setObject(5, pP_CAUTREC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "P_MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PSU__F_GET_CONSULTA(java.math.BigDecimal pP_SPRODUC, java.math.BigDecimal pP_NPOLIZA,
			java.math.BigDecimal pP_NSOLICI, java.math.BigDecimal pP_CAUTREC) throws Exception {
		return this.callPAC_IAX_PSU__F_GET_CONSULTA(pP_SPRODUC, pP_NPOLIZA, pP_NSOLICI, pP_CAUTREC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PSU.F_GET_CONSULTA
	// --START-PAC_IAX_PSU.F_GET_DET_PSU(P_SSEGURO, P_NMOVIMI, P_NRIESGO, P_CGARANT,
	// P_CCONTROL, P_TABLAS)
	private HashMap callPAC_IAX_PSU__F_GET_DET_PSU(java.math.BigDecimal pP_SSEGURO, java.math.BigDecimal pP_NMOVIMI,
			java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_CGARANT, java.math.BigDecimal pP_CCONTROL,
			String pP_TABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_GET_DET_PSU(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SSEGURO", "pP_NMOVIMI", "pP_NRIESGO", "pP_CGARANT", "pP_CCONTROL", "pP_TABLAS" },
				new Object[] { pP_SSEGURO, pP_NMOVIMI, pP_NRIESGO, pP_CGARANT, pP_CCONTROL, pP_TABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NMOVIMI);
		cStmt.setObject(4, pP_NRIESGO);
		cStmt.setObject(5, pP_CGARANT);
		cStmt.setObject(6, pP_CCONTROL);
		cStmt.setObject(7, pP_TABLAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PSU".toUpperCase())); // Valor de "P_TPSUS"
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
			retVal.put("P_TPSUS", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("P_TPSUS", null);
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

	public HashMap ejecutaPAC_IAX_PSU__F_GET_DET_PSU(java.math.BigDecimal pP_SSEGURO, java.math.BigDecimal pP_NMOVIMI,
			java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_CGARANT, java.math.BigDecimal pP_CCONTROL,
			String pP_TABLAS) throws Exception {
		return this.callPAC_IAX_PSU__F_GET_DET_PSU(pP_SSEGURO, pP_NMOVIMI, pP_NRIESGO, pP_CGARANT, pP_CCONTROL,
				pP_TABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_GET_DET_PSU

	// --START-PAC_IAX_PSU.F_GRABAOBSERVACIONES(P_SSEGURO, P_NRIESGO, P_CGARANT,
	// P_CCONTROL, P_TOBSERV)
	private HashMap callPAC_IAX_PSU__F_GRABAOBSERVACIONES(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_CGARANT, java.math.BigDecimal pP_CCONTROL,
			String pP_TOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_GRABAOBSERVACIONES(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO", "pP_NRIESGO", "pP_CGARANT", "pP_CCONTROL", "pP_TOBSERV" },
				new Object[] { pP_SSEGURO, pP_NRIESGO, pP_CGARANT, pP_CCONTROL, pP_TOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NRIESGO);
		cStmt.setObject(4, pP_CGARANT);
		cStmt.setObject(5, pP_CCONTROL);
		cStmt.setObject(6, pP_TOBSERV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "P_MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_MENSAJES", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PSU__F_GRABAOBSERVACIONES(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_CGARANT, java.math.BigDecimal pP_CCONTROL,
			String pP_TOBSERV) throws Exception {
		return this.callPAC_IAX_PSU__F_GRABAOBSERVACIONES(pP_SSEGURO, pP_NRIESGO, pP_CGARANT, pP_CCONTROL, pP_TOBSERV);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PSU.F_GRABAOBSERVACIONES
	// --START-PAC_IAX_PSU.F_LEE_CONTROLES(P_SSEGURO)
	private HashMap callPAC_IAX_PSU__F_LEE_CONTROLES(java.math.BigDecimal pP_SSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_LEE_CONTROLES(?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO" }, new Object[] { pP_SSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "P_MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("P_MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PSU__F_LEE_CONTROLES(java.math.BigDecimal pP_SSEGURO) throws Exception {
		return this.callPAC_IAX_PSU__F_LEE_CONTROLES(pP_SSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PSU.F_LEE_CONTROLES
	// --START-PAC_IAX_PSU.F_HAY_CONTROLES_MANUALES(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_PSU__F_HAY_CONTROLES_MANUALES(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_HAY_CONTROLES_MANUALES(?, ?, ?)}";

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

	public HashMap ejecutaPAC_IAX_PSU__F_HAY_CONTROLES_MANUALES(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_PSU__F_HAY_CONTROLES_MANUALES(pPSSEGURO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_HAY_CONTROLES_MANUALES

	// --START-PAC_IAX_PSU.F_INICIA_PSU(P_TABLAS, P_SSEGURO, P_ACCION)
	private HashMap callPAC_IAX_PSU__F_INICIA_PSU(String pP_TABLAS, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_ACCION) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_INICIA_PSU(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_TABLAS", "pP_SSEGURO", "pP_ACCION" },
				new Object[] { pP_TABLAS, pP_SSEGURO, pP_ACCION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TABLAS);
		cStmt.setObject(3, pP_SSEGURO);
		cStmt.setObject(4, pP_ACCION);
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

	public HashMap ejecutaPAC_IAX_PSU__F_INICIA_PSU(String pP_TABLAS, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_ACCION) throws Exception {
		return this.callPAC_IAX_PSU__F_INICIA_PSU(pP_TABLAS, pP_SSEGURO, pP_ACCION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_INICIA_PSU

	// --START-PAC_IAX_PSU.F_LEE_HIS_PSU_RETENIDAS(P_SSEGURO, P_NVERSION,
	// P_NRIESGO, P_NMOVIMI)
	private HashMap callPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_NMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_LEE_HIS_PSU_RETENIDAS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO", "pP_NVERSION", "pP_NRIESGO", "pP_NMOVIMI" },
				new Object[] { pP_SSEGURO, pP_NVERSION, pP_NRIESGO, pP_NMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NVERSION);
		cStmt.setObject(4, pP_NRIESGO);
		cStmt.setObject(5, pP_NMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
																// "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PSU_RETENIDAS".toUpperCase())); // Valor
																						// de
																						// "P_THIS_PSU_RETENIDAS"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("P_THIS_PSU_RETENIDAS", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_THIS_PSU_RETENIDAS", null);
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

	public HashMap ejecutaPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_NMOVIMI)
			throws Exception {
		return this.callPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(pP_SSEGURO, pP_NVERSION, pP_NRIESGO, pP_NMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_LEE_HIS_PSU_RETENIDAS

	// --START-PAC_IAX_PSU.F_LEE_HIS_PSUCONTROLSEG(P_SSEGURO, P_NVERSION, P_NRIESGO,
	// P_NMOVIMI, P_CCONTROL)
	private HashMap callPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_NMOVIMI,
			java.math.BigDecimal pP_CCONTROL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_LEE_HIS_PSUCONTROLSEG(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO", "pP_NVERSION", "pP_NRIESGO", "pP_NMOVIMI", "pP_CCONTROL" },
				new Object[] { pP_SSEGURO, pP_NVERSION, pP_NRIESGO, pP_NMOVIMI, pP_CCONTROL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NVERSION);
		cStmt.setObject(4, pP_NRIESGO);
		cStmt.setObject(5, pP_NMOVIMI);
		cStmt.setObject(6, pP_CCONTROL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PSU".toUpperCase())); // Valor de "P_THIS_PSUCONTROLSEG"
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
			retVal.put("P_THIS_PSUCONTROLSEG", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("P_THIS_PSUCONTROLSEG", null);
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

	public HashMap ejecutaPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_NMOVIMI,
			java.math.BigDecimal pP_CCONTROL) throws Exception {
		return this.callPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(pP_SSEGURO, pP_NVERSION, pP_NRIESGO, pP_NMOVIMI,
				pP_CCONTROL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_LEE_HIS_PSUCONTROLSEG

	// --START-PAC_IAX_PSU.F_LEE_PSU_SUBESTADOSPROP(P_SSEGURO, P_NVERSION,
	// P_NVERSIONSUBEST, P_NMOVIMI)
	private HashMap callPAC_IAX_PSU__F_LEE_PSU_SUBESTADOSPROP(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NVERSIONSUBEST, java.math.BigDecimal pP_NMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_LEE_PSU_SUBESTADOSPROP(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO", "pP_NVERSION", "pP_NVERSIONSUBEST", "pP_NMOVIMI" },
				new Object[] { pP_SSEGURO, pP_NVERSION, pP_NVERSIONSUBEST, pP_NMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NVERSION);
		cStmt.setObject(4, pP_NVERSIONSUBEST);
		cStmt.setObject(5, pP_NMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PSU_SUBESTADOSPROP".toUpperCase())); // Valor de
																							// "P_TPSU_SUBESTADOSPROP"
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
			retVal.put("P_TPSU_SUBESTADOSPROP", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("P_TPSU_SUBESTADOSPROP", null);
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

	public HashMap ejecutaPAC_IAX_PSU__F_LEE_PSU_SUBESTADOSPROP(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NVERSIONSUBEST, java.math.BigDecimal pP_NMOVIMI)
			throws Exception {
		return this.callPAC_IAX_PSU__F_LEE_PSU_SUBESTADOSPROP(pP_SSEGURO, pP_NVERSION, pP_NVERSIONSUBEST, pP_NMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_LEE_PSU_SUBESTADOSPROP

	// --START-PAC_IAX_PSU.F_INS_PSU_SUBESTADOSPROP(P_SSEGURO, P_NVERSION,
	// P_NMOVIMI, P_CSUBESTADO, P_COBSERVACIONES)
	private HashMap callPAC_IAX_PSU__F_INS_PSU_SUBESTADOSPROP(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NMOVIMI, java.math.BigDecimal pP_CSUBESTADO,
			String pP_COBSERVACIONES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PSU.F_INS_PSU_SUBESTADOSPROP(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pP_SSEGURO", "pP_NVERSION", "pP_NMOVIMI", "pP_CSUBESTADO", "pP_COBSERVACIONES" },
				new Object[] { pP_SSEGURO, pP_NVERSION, pP_NMOVIMI, pP_CSUBESTADO, pP_COBSERVACIONES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_NVERSION);
		cStmt.setObject(4, pP_NMOVIMI);
		cStmt.setObject(5, pP_CSUBESTADO);
		cStmt.setObject(6, pP_COBSERVACIONES);
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

	public HashMap ejecutaPAC_IAX_PSU__F_INS_PSU_SUBESTADOSPROP(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_NVERSION, java.math.BigDecimal pP_NMOVIMI, java.math.BigDecimal pP_CSUBESTADO,
			String pP_COBSERVACIONES) throws Exception {
		return this.callPAC_IAX_PSU__F_INS_PSU_SUBESTADOSPROP(pP_SSEGURO, pP_NVERSION, pP_NMOVIMI, pP_CSUBESTADO,
				pP_COBSERVACIONES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PSU.F_INS_PSU_SUBESTADOSPROP

}
