package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.ConversionUtil;

public class PAC_IAX_PRODUCCION_207 extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRODUCCION_207.class);
	private Connection conn = null;

	public PAC_IAX_PRODUCCION_207(Connection conn) {
		this.conn = conn;
	}

//--START-PAC_IAX_PRODUCCION.F_GET_CABECERA_PREGUNTAB(PCPREGUN)
	private HashMap callPAC_IAX_PRODUCCION__F_GET_CABECERA_PREGUNTAB(java.math.BigDecimal pPCPREGUN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_CABECERA_PREGUNTAB(?, ?)}";

		logCall(callQuery, new String[] { "pPCPREGUN" }, new Object[] { pPCPREGUN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_CABECERA_PREGUNTAB(java.math.BigDecimal pPCPREGUN)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_CABECERA_PREGUNTAB(pPCPREGUN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_CABECERA_PREGUNTAB

	// --START-PAC_IAX_PRODUCCION.F_GET_PREGUNTAB(PTIPO, PNRIESGO, PCGARANT,
	// PCPREGUN)
	private HashMap callPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCPREGUN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GET_PREGUNTAB(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPNRIESGO", "pPCGARANT", "pPCPREGUN" },
				new Object[] { pPTIPO, pPNRIESGO, pPCGARANT, pPCPREGUN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPCPREGUN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTASTAB".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCPREGUN) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(pPTIPO, pPNRIESGO, pPCGARANT, pPCPREGUN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GET_PREGUNTAB

	// --START-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB(PTIPO, PNRIESGO, PCPREGUN,
	// PCGARANT, PTCOLUMNAS)
	private HashMap callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, Object pPTCOLUMNAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPNRIESGO", "pPCPREGUN", "pPCGARANT", "pPTCOLUMNAS" },
				new Object[] { pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPTCOLUMNAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		List info = new ArrayList();

		oracle.sql.ArrayDescriptor structDesc = oracle.sql.ArrayDescriptor
				.createDescriptor(UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO".toUpperCase()), conn);
		ArrayList<HashMap> T_IAX_INFO = (ArrayList<HashMap>) pPTCOLUMNAS;

		if (!AxisBaseService.isEmpty(T_IAX_INFO) && T_IAX_INFO.size() > 0) {
			for (HashMap OB_IAX_INFO : T_IAX_INFO) {
				oracle.sql.StructDescriptor structDesc2 = oracle.sql.StructDescriptor.createDescriptor("OB_IAX_INFO",
						conn);
				oracle.sql.STRUCT object = new oracle.sql.STRUCT(structDesc2, conn, OB_IAX_INFO);
				info.add(object);
			}
		}

		oracle.sql.ARRAY pPPARAMS = new oracle.sql.ARRAY(structDesc, conn, info.toArray());
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCPREGUN);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setArray(6, pPPARAMS);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, Object pPTCOLUMNAS) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB(pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPTCOLUMNAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_GRABARPREGUNTASTAB

	// --START-PAC_IAX_PRODUCCION.F_DEL_PREGUNTASTAB(PTIPO, PNRIESGO, PCPREGUN,
	// PCGARANT, PNLINEA)
	private HashMap callPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNLINEA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_DEL_PREGUNTASTAB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPNRIESGO", "pPCPREGUN", "pPCGARANT", "pPNLINEA" },
				new Object[] { pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCPREGUN);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNLINEA);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(String pPTIPO, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNLINEA)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(pPTIPO, pPNRIESGO, pPCPREGUN, pPCGARANT, pPNLINEA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_DEL_PREGUNTASTAB

	// --START-PAC_IAX_PRODUCCION.F_ACT_CAP_RECOMEND(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_ACT_CAP_RECOMEND(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION.F_ACT_CAP_RECOMEND

}
