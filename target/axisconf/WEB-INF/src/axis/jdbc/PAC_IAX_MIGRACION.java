package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.util.ConversionUtil;

public class PAC_IAX_MIGRACION extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MIGRACION.class);
	private Connection conn = null;

	public PAC_IAX_MIGRACION(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MIGRACION.F_CONSULTA_POLIZA(PNPOLIZA, PSUCURSAL)
	private HashMap callPAC_IAX_MIGRACION__F_CONSULTA_POLIZA(String pNPOLIZA, java.math.BigDecimal pSUCURSAL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MIGRACION.F_CONSULTA_POLIZA(?, ?)}";

		logCall(callQuery, new String[] { "pNPOLIZA", "pSUCURSAL" }, new Object[] { pNPOLIZA, pSUCURSAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNPOLIZA);
		cStmt.setObject(3, pSUCURSAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	private HashMap callPAC_IAX_MIGRACION_UNI__F_MIGRA_POLIZA(String pNPOLIZA, java.math.BigDecimal pSUCURSAL)
			throws Exception {
		String callQuery = "{?=call PAC_MIGRACION_UNI.F_MIGRA_POLIZA(?, ?,?)}";

		logCall(callQuery, new String[] { "pNPOLIZA", "pSUCURSAL" }, new Object[] { pNPOLIZA, pSUCURSAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNPOLIZA);
		cStmt.setObject(3, pSUCURSAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC);
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
			retVal.put("SEGURO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MIGRACION__F_CONSULTA_POLIZA(String pNPOLIZA, java.math.BigDecimal pSUCURSAL)
			throws Exception {
		return this.callPAC_IAX_MIGRACION__F_CONSULTA_POLIZA(pNPOLIZA, pSUCURSAL);// AXIS-WLS1SERVER-Ready
	}

	public HashMap ejecutaPAC_IAX_MIGRACION_UNI__F_MIGRA_POLIZA(String pNPOLIZA, java.math.BigDecimal pSUCURSAL)
			throws Exception {
		return this.callPAC_IAX_MIGRACION_UNI__F_MIGRA_POLIZA(pNPOLIZA, pSUCURSAL);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_MIGRACION__F_CONSULTA(String PNPOLIZA, java.math.BigDecimal PCSUCURSAL, String PNNUMIDE,
			String PNSINIES) throws Exception {
		String callQuery = "{?=call PAC_MIGRACION_UNI.F_CONSULTA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "PNPOLIZA", "PCSUCURSAL", "PNNUMIDE", "PNSINIES" },
				new Object[] { PNPOLIZA, PCSUCURSAL, PNNUMIDE, PNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, PNPOLIZA);
		cStmt.setObject(3, PCSUCURSAL);
		cStmt.setObject(4, PNNUMIDE);
		cStmt.setObject(5, PNSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MIGRACION_F_CONSULTA(String PNPOLIZA, java.math.BigDecimal PCSUCURSAL,
			String PNNUMIDE, String PNSINIES) throws Exception {
		return this.callPAC_IAX_MIGRACION__F_CONSULTA(PNPOLIZA, PCSUCURSAL, PNNUMIDE, PNSINIES);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_MIGRACION_UNI_F_MIGRA(String PNPOLIZA, java.math.BigDecimal PCSUCURSAL, String PNNUMIDE,
			String PNSINIES) throws Exception {
		String callQuery = "{?=call PAC_MIGRACION_UNI.F_MIGRA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "PNPOLIZA", "PCSUCURSAL", "PNNUMIDE", "PNSINIES" },
				new Object[] { PNPOLIZA, PCSUCURSAL, PNNUMIDE, PNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, PNPOLIZA);
		cStmt.setObject(3, PCSUCURSAL);
		cStmt.setObject(4, PNNUMIDE);
		cStmt.setObject(5, PNSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR);// 7782-81 TIPO CORRECTO DE RESPUESTA
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
			retVal.put("RESULTADO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MIGRACION_UNI_F_MIGRA(String PNPOLIZA, java.math.BigDecimal PCSUCURSAL,
			String PNNUMIDE, String PNSINIES) throws Exception {
		return this.callPAC_IAX_MIGRACION_UNI_F_MIGRA(PNPOLIZA, PCSUCURSAL, PNNUMIDE, PNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MIGRACION.F_CONSULTA_POLIZA

}