package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CODIGOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CODIGOS.class);
	private Connection conn = null;

	public PAC_IAX_CODIGOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CODIGOS.F_GET_CODIGOS(PPARAMS)
	private HashMap callPAC_IAX_CODIGOS__F_GET_CODIGOS(String pPPARAMS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_GET_CODIGOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPARAMS" }, new Object[] { pPPARAMS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPARAMS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PCODIGO"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO".toUpperCase())); // Valor de "PTINFO"
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
			retVal.put("PCODIGO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCODIGO", null);
		}
		try {
			retVal.put("PTINFO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTINFO", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_GET_CODIGOS(String pPPARAMS) throws Exception {
		return this.callPAC_IAX_CODIGOS__F_GET_CODIGOS(pPPARAMS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_GET_CODIGOS
	// --START-PAC_IAX_CODIGOS.F_GET_TIPCODIGOS()
	private HashMap callPAC_IAX_CODIGOS__F_GET_TIPCODIGOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_GET_TIPCODIGOS(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURTIPCODIGOS"
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
			retVal.put("PCURTIPCODIGOS", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCURTIPCODIGOS", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_GET_TIPCODIGOS() throws Exception {
		return this.callPAC_IAX_CODIGOS__F_GET_TIPCODIGOS();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_GET_TIPCODIGOS
	// --START-PAC_IAX_CODIGOS.F_SET_CODACTIVI(PCRAMO, PCEMPRES, PCIDIOMA)
	private HashMap callPAC_IAX_CODIGOS__F_SET_CODACTIVI(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_SET_CODACTIVI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCEMPRES", "pPCIDIOMA" },
				new Object[] { pPCRAMO, pPCEMPRES, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PCODIGO"
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
			retVal.put("PCODIGO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCODIGO", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_SET_CODACTIVI(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_CODIGOS__F_SET_CODACTIVI(pPCRAMO, pPCEMPRES, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_SET_CODACTIVI
	// --START-PAC_IAX_CODIGOS.F_SET_CODCGARANT(PCEMPRES, PCIDIOMA)
	private HashMap callPAC_IAX_CODIGOS__F_SET_CODCGARANT(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_SET_CODCGARANT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDIOMA" }, new Object[] { pPCEMPRES, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PCODIGO"
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
			retVal.put("PCODIGO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCODIGO", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_SET_CODCGARANT(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_CODIGOS__F_SET_CODCGARANT(pPCEMPRES, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_SET_CODCGARANT
	// --START-PAC_IAX_CODIGOS.F_SET_CODLITERALES(PTLITERA_1, PTLITERA_2,
	// PTLITERA_3, PTLITERA_4, PTLITERA_5, PTLITERA_6, PTLITERA_7, PTLITERA_8,
	// PTLITERA_9, PTLITERA_10, PCEMPRES, PCIDIOMA)
	private HashMap callPAC_IAX_CODIGOS__F_SET_CODLITERALES(String pPTLITERA_1, String pPTLITERA_2, String pPTLITERA_3,
			String pPTLITERA_4, String pPTLITERA_5, String pPTLITERA_6, String pPTLITERA_7, String pPTLITERA_8,
			String pPTLITERA_9, String pPTLITERA_10, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_SET_CODLITERALES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPTLITERA_1", "pPTLITERA_2", "pPTLITERA_3", "pPTLITERA_4", "pPTLITERA_5", "pPTLITERA_6",
						"pPTLITERA_7", "pPTLITERA_8", "pPTLITERA_9", "pPTLITERA_10", "pPCEMPRES", "pPCIDIOMA" },
				new Object[] { pPTLITERA_1, pPTLITERA_2, pPTLITERA_3, pPTLITERA_4, pPTLITERA_5, pPTLITERA_6,
						pPTLITERA_7, pPTLITERA_8, pPTLITERA_9, pPTLITERA_10, pPCEMPRES, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTLITERA_1);
		cStmt.setObject(3, pPTLITERA_2);
		cStmt.setObject(4, pPTLITERA_3);
		cStmt.setObject(5, pPTLITERA_4);
		cStmt.setObject(6, pPTLITERA_5);
		cStmt.setObject(7, pPTLITERA_6);
		cStmt.setObject(8, pPTLITERA_7);
		cStmt.setObject(9, pPTLITERA_8);
		cStmt.setObject(10, pPTLITERA_9);
		cStmt.setObject(11, pPTLITERA_10);
		cStmt.setObject(12, pPCEMPRES);
		cStmt.setObject(13, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.VARCHAR); // Valor de "PCODIGO"
		cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCODIGO", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PCODIGO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CODIGOS__F_SET_CODLITERALES(String pPTLITERA_1, String pPTLITERA_2,
			String pPTLITERA_3, String pPTLITERA_4, String pPTLITERA_5, String pPTLITERA_6, String pPTLITERA_7,
			String pPTLITERA_8, String pPTLITERA_9, String pPTLITERA_10, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_CODIGOS__F_SET_CODLITERALES(pPTLITERA_1, pPTLITERA_2, pPTLITERA_3, pPTLITERA_4,
				pPTLITERA_5, pPTLITERA_6, pPTLITERA_7, pPTLITERA_8, pPTLITERA_9, pPTLITERA_10, pPCEMPRES, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_SET_CODLITERALES
	// --START-PAC_IAX_CODIGOS.F_SET_CODPREGUN(PCEMPRES, PCIDIOMA)
	private HashMap callPAC_IAX_CODIGOS__F_SET_CODPREGUN(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_SET_CODPREGUN(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDIOMA" }, new Object[] { pPCEMPRES, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PCODIGO"
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
			retVal.put("PCODIGO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCODIGO", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_SET_CODPREGUN(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_CODIGOS__F_SET_CODPREGUN(pPCEMPRES, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_SET_CODPREGUN
	// --START-PAC_IAX_CODIGOS.F_SET_CODRAMO(PCEMPRES, PCIDIOMA)
	private HashMap callPAC_IAX_CODIGOS__F_SET_CODRAMO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_SET_CODRAMO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDIOMA" }, new Object[] { pPCEMPRES, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PCODIGO"
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
			retVal.put("PCODIGO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCODIGO", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_SET_CODRAMO(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		return this.callPAC_IAX_CODIGOS__F_SET_CODRAMO(pPCEMPRES, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_SET_CODRAMO
	// --START-PAC_IAX_CODIGOS.F_SET_CODSPRODUC(PCEMPRES, PCIDIOMA, PCRAMO,
	// PCMODALI, PCCOLECT, PCTIPSEG)
	private HashMap callPAC_IAX_CODIGOS__F_SET_CODSPRODUC(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG) throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_SET_CODSPRODUC(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDIOMA", "pPCRAMO", "pPCMODALI", "pPCCOLECT", "pPCTIPSEG" },
				new Object[] { pPCEMPRES, pPCIDIOMA, pPCRAMO, pPCMODALI, pPCCOLECT, pPCTIPSEG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPCMODALI);
		cStmt.setObject(6, pPCCOLECT);
		cStmt.setObject(7, pPCTIPSEG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "PCODIGO"
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
			retVal.put("PCODIGO", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCODIGO", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_SET_CODSPRODUC(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG) throws Exception {
		return this.callPAC_IAX_CODIGOS__F_SET_CODSPRODUC(pPCEMPRES, pPCIDIOMA, pPCRAMO, pPCMODALI, pPCCOLECT,
				pPCTIPSEG);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CODIGOS.F_SET_CODSPRODUC
	// --START-PAC_IAX_CODIGOS.F_GET_IDIOMAS_ACTIVOS()
	private HashMap callPAC_IAX_CODIGOS__F_GET_IDIOMAS_ACTIVOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_CODIGOS.F_GET_IDIOMAS_ACTIVOS(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURIDIOMAS"
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
			retVal.put("PCURIDIOMAS", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCURIDIOMAS", null);
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

	public HashMap ejecutaPAC_IAX_CODIGOS__F_GET_IDIOMAS_ACTIVOS() throws Exception {
		return this.callPAC_IAX_CODIGOS__F_GET_IDIOMAS_ACTIVOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CODIGOS.F_GET_IDIOMAS_ACTIVOS

}
