package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_OBTENERDATOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_SINIESTROS.class);
	private Connection conn = null;

	public PAC_IAX_OBTENERDATOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_OBTENERDATOS.F_LEEPROVISIONESGAR(PSSEGURO, MENSAJES)
	private HashMap callPAC_IAX_OBTENERDATOS__F_LEEPROVISIONESGAR(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEEPROVISIONESGAR(?,?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		// cStmt.setObject(3, pMENSAJES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEEPROVISIONESGAR(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEEPROVISIONESGAR(pPSSEGURO);
	}

	// --END-PAC_IAX_OBTENERDATOS.F_LEEPROVISIONESGAR
	// --START-PAC_IAX_OBTENERDATOS.F_LEEPROVISIONPOL(PSSEGURO, MENSAJES)
	private HashMap callPAC_IAX_OBTENERDATOS__F_LEEPROVISIONPOL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEEPROVISIONPOL(?,?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		// cStmt.setObject(3, pMENSAJES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DATOSECONOMICOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEEPROVISIONPOL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEEPROVISIONPOL(pPSSEGURO);
	}
	// --END-PAC_IAX_OBTENERDATOS.F_LEEPROVISIONPOL

	// --START-PAC_IAX_OBTENERDATOS.F_LEEGARANTIAS_SUPL(PNRIESGO, MENSAJES)
	private HashMap callPAC_IAX_OBTENERDATOS__F_LEEGARANTIAS_SUPL(java.math.BigDecimal pSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEEGARANTIAS_SUPL(?,?,?)}";

		logCall(callQuery, new String[] { "pSSEGURO", "pPNRIESGO" }, new Object[] { pSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEEGARANTIAS_SUPL(java.math.BigDecimal pSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEEGARANTIAS_SUPL(pSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_OBTENERDATOS.F_LEEGARANTIAS_SUPL

	// --START-PAC_IAX_OBTENERDATOS.F_LEEEVOLUPROVMATSEG(PSSEGURO, PTABLAS)
	private HashMap callPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(java.math.BigDecimal pPSSEGURO, String pPTABLAS,
			java.math.BigDecimal pPNSCENARIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEEEVOLUPROVMATSEG(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS", "pPNSCENARIO" },
				new Object[] { pPSSEGURO, pPTABLAS, pPNSCENARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
		cStmt.setObject(4, pPNSCENARIO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_EVOLUPROVMAT".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(java.math.BigDecimal pPSSEGURO, String pPTABLAS,
			java.math.BigDecimal pPNSCENARIO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(pPSSEGURO, pPTABLAS, pPNSCENARIO);
	}
	// --END-PAC_IAX_OBTENERDATOS.F_LEEEVOLUPROVMATSEG

	// --START-PAC_IAX_OBTENERDATOS.F_LEECAPITAL(PSSEGURO, PNRIESGO, PCGARANT,
	// PTABLAS)
	private HashMap callPAC_IAX_OBTENERDATOS__F_LEECAPITAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEECAPITAL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCGARANT", "pPTABLAS" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCGARANT, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEECAPITAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEECAPITAL(pPSSEGURO, pPNRIESGO, pPCGARANT, pPTABLAS);
	}
	// --END-PAC_IAX_OBTENERDATOS.F_LEECAPITAL

	// --START-PAC_IAX_OBTENERDATOS.F_LEE_PRESTCUADROSEG(PSSEGURO)
	private HashMap callPAC_IAX_OBTENERDATOS__F_LEE_PRESTCUADROSEG(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEE_PRESTCUADROSEG(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRESTCUADROSEG".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEE_PRESTCUADROSEG(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEE_PRESTCUADROSEG(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_OBTENERDATOS.F_LEE_PRESTCUADROSEG

	public HashMap callPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(java.math.BigDecimal pPSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_EVOLUPROVMATSEG_SCEN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(java.math.BigDecimal pPSSEGURO,
			String pPTABLAS) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(pPSSEGURO, pPTABLAS);
	}

	public HashMap callPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(java.math.BigDecimal pPSSEGURO,
			String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_EVOLUPROVMATSEG_MINSCEN(?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPTABLAS" }, new Object[] { pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTABLAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(java.math.BigDecimal pPSSEGURO,
			String pPTABLAS) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(pPSSEGURO, pPTABLAS);
	}

	public HashMap callPAC_IAX_OBTENERDATOS__F_GET_EXCLUSIONES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_GET_EXCLUSIONES(?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPTABLAS" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPTABLAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_EXCLUSIONES".toUpperCase()));
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase()));
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_GET_EXCLUSIONES(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_GET_EXCLUSIONES(pPSSEGURO, pPNRIESGO, pPTABLAS);
	}

	public HashMap callPAC_IAX_OBTENERDATOS__F_LEE_ENFERMEDADES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEE_ENFERMEDADES(?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ENFERMEDADES_UNDW".toUpperCase()));
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase()));
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEE_ENFERMEDADES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEE_ENFERMEDADES(pPSSEGURO);
	}

	public HashMap callPAC_IAX_OBTENERDATOS__F_LEE_PREGUNTAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEE_PREGUNTAS(?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_BASEQUESTION_UNDW".toUpperCase()));
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase()));
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEE_PREGUNTAS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEE_PREGUNTAS(pPSSEGURO);
	}

	public HashMap callPAC_IAX_OBTENERDATOS__F_LEE_ACCIONES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OBTENERDATOS.F_LEE_ACCIONES(?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ACTIONS_UNDW".toUpperCase()));
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase()));
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OBTENERDATOS__F_LEE_ACCIONES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_OBTENERDATOS__F_LEE_ACCIONES(pPSSEGURO);
	}
}
