package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class SINPAQUETE extends AccesoPL {
	static Log logger = LogFactory.getLog(SINPAQUETE.class);
	private Connection conn = null;

	public SINPAQUETE(Connection conn) {
		this.conn = conn;
	}

	// --START-F_AXIS_LITERALES(PNUMLIT, PIDIOMA)

	private HashMap callF_AXIS_LITERALES(java.math.BigDecimal pPNUMLIT, java.math.BigDecimal pPIDIOMA)
			throws Exception {
		String callQuery = "{?=call F_AXIS_LITERALES(?,?)}";
		logCall(callQuery, new String[] { "pPNUMLIT", "pPIDIOMA" }, new Object[] { pPNUMLIT, pPIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMLIT);
		cStmt.setObject(3, pPIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_AXIS_LITERALES(java.math.BigDecimal pPNUMLIT, java.math.BigDecimal pPIDIOMA)
			throws Exception {
		return this.callF_AXIS_LITERALES(pPNUMLIT, pPIDIOMA);
	}
	// --END-F_AXIS_LITERALES
	// --START-F_DETPARPRODUCTOS(PSPRODUC, PCPARAM, PCVALOR)

	private HashMap callF_DETPARPRODUCTOS(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALOR) throws Exception {
		String callQuery = "{?=call F_DETPARPRODUCTOS(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARAM", "pPCVALOR" },
				new Object[] { pPSPRODUC, pPCPARAM, pPCVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARAM);
		cStmt.setObject(4, pPCVALOR);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_DETPARPRODUCTOS(java.math.BigDecimal pPSPRODUC, String pPCPARAM,
			java.math.BigDecimal pPCVALOR) throws Exception {
		return this.callF_DETPARPRODUCTOS(pPSPRODUC, pPCPARAM, pPCVALOR);
	}
	// --END-F_DETPARPRODUCTOS
	// --START-F_FORMATOCCC(PTCUENTA, PCTIPBAN)

	private HashMap callF_FORMATOCCC(String pPTCUENTA, java.math.BigDecimal pPCTIPBAN) throws Exception {
		String callQuery = "{?=call F_FORMATOCCC(?,?,?)}";
		logCall(callQuery, new String[] { "pPTCUENTA", "pPCTIPBAN" }, new Object[] { pPTCUENTA, pPCTIPBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTCUENTA);
		cStmt.setObject(4, pPCTIPBAN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTSALIDA"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PTSALIDA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTSALIDA", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_FORMATOCCC(String pPTCUENTA, java.math.BigDecimal pPCTIPBAN) throws Exception {
		return this.callF_FORMATOCCC(pPTCUENTA, pPCTIPBAN);
	}
	// --END-F_FORMATOCCC

	// --START-F_IAX_OWNEROBJ()

	private HashMap callF_IAX_OWNEROBJ() throws Exception {
		String callQuery = "{?=call F_IAX_OWNEROBJ()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_IAX_OWNEROBJ() throws Exception {
		return this.callF_IAX_OWNEROBJ();
	}
	// --END-F_IAX_OWNEROBJ
	// --START-F_PARCONEXION(PCPARAME)

	private HashMap callF_PARCONEXION(String pPCPARAME) throws Exception {
		String callQuery = "{?=call F_PARCONEXION(?)}";
		logCall(callQuery, new String[] { "pPCPARAME" }, new Object[] { pPCPARAME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAME);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARCONEXION(String pPCPARAME) throws Exception {
		return this.callF_PARCONEXION(pPCPARAME);
	}
	// --END-F_PARCONEXION
	// --START-F_PARGARANPRO(PCRAMO, PCMODALI, PCTIPSEG, PCCOLECT, PCACTIVI,
	// PCGARANT, PCPARGAR)

	private HashMap callF_PARGARANPRO(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, String pPCPARGAR) throws Exception {
		String callQuery = "{?=call F_PARGARANPRO(?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPCACTIVI", "pPCGARANT",
						"pPCPARGAR" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCPARGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPCPARGAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PCVALPAR"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCVALPAR", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCVALPAR", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARGARANPRO(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, String pPCPARGAR) throws Exception {
		return this.callF_PARGARANPRO(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCPARGAR);
	}
	// --END-F_PARGARANPRO
	// --START-F_PARGARANPRO_V(PCRAMO, PCMODALI, PCTIPSEG, PCCOLECT, PCACTIVI,
	// PCGARANT, PCPARGAR)

	private HashMap callF_PARGARANPRO_V(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, String pPCPARGAR) throws Exception {
		String callQuery = "{?=call F_PARGARANPRO_V(?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPCACTIVI", "pPCGARANT",
						"pPCPARGAR" },
				new Object[] { pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCPARGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCMODALI);
		cStmt.setObject(4, pPCTIPSEG);
		cStmt.setObject(5, pPCCOLECT);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.setObject(7, pPCGARANT);
		cStmt.setObject(8, pPCPARGAR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARGARANPRO_V(java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI,
			java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, String pPCPARGAR) throws Exception {
		return this.callF_PARGARANPRO_V(pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCPARGAR);
	}
	// --END-F_PARGARANPRO_V
	// --START-F_PARINSTALACION_F(PCPARAME)

	private HashMap callF_PARINSTALACION_F(String pPCPARAME) throws Exception {
		String callQuery = "{?=call F_PARINSTALACION_F(?)}";
		logCall(callQuery, new String[] { "pPCPARAME" }, new Object[] { pPCPARAME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAME);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARINSTALACION_F(String pPCPARAME) throws Exception {
		return this.callF_PARINSTALACION_F(pPCPARAME);
	}
	// --END-F_PARINSTALACION_F
	// --START-F_PARINSTALACION_N(PCPARAME)

	private HashMap callF_PARINSTALACION_N(String pPCPARAME) throws Exception {
		String callQuery = "{?=call F_PARINSTALACION_N(?)}";
		logCall(callQuery, new String[] { "pPCPARAME" }, new Object[] { pPCPARAME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAME);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARINSTALACION_N(String pPCPARAME) throws Exception {
		return this.callF_PARINSTALACION_N(pPCPARAME);
	}
	// --END-F_PARINSTALACION_N
	// --START-F_PARINSTALACION_T(PCPARAME)

	private HashMap callF_PARINSTALACION_T(String pPCPARAME) throws Exception {
		String callQuery = "{?=call F_PARINSTALACION_T(?)}";
		logCall(callQuery, new String[] { "pPCPARAME" }, new Object[] { pPCPARAME });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPARAME);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARINSTALACION_T(String pPCPARAME) throws Exception {
		return this.callF_PARINSTALACION_T(pPCPARAME);
	}
	// --END-F_PARINSTALACION_T
	// --START-F_PARMOTMOV(PCMOTMOV, PCPARMOT, PSPRODUC)

	private HashMap callF_PARMOTMOV(java.math.BigDecimal pPCMOTMOV, String pPCPARMOT, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call F_PARMOTMOV(?,?,?)}";
		logCall(callQuery, new String[] { "pPCMOTMOV", "pPCPARMOT", "pPSPRODUC" },
				new Object[] { pPCMOTMOV, pPCPARMOT, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOV);
		cStmt.setObject(3, pPCPARMOT);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARMOTMOV(java.math.BigDecimal pPCMOTMOV, String pPCPARMOT, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callF_PARMOTMOV(pPCMOTMOV, pPCPARMOT, pPSPRODUC);
	}
	// --END-F_PARMOTMOV
	// --START-F_PARPRODUCTOS(PSPRODUC, PCPARPRO)

	private HashMap callF_PARPRODUCTOS(java.math.BigDecimal pPSPRODUC, String pPCPARPRO) throws Exception {
		String callQuery = "{?=call F_PARPRODUCTOS(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARPRO" }, new Object[] { pPSPRODUC, pPCPARPRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARPRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCVALPAR"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCVALPAR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCVALPAR", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARPRODUCTOS(java.math.BigDecimal pPSPRODUC, String pPCPARPRO) throws Exception {
		return this.callF_PARPRODUCTOS(pPSPRODUC, pPCPARPRO);
	}
	// --END-F_PARPRODUCTOS
	// --START-F_PARPRODUCTOS_V(PSPRODUC, PCPARPRO)

	private HashMap callF_PARPRODUCTOS_V(java.math.BigDecimal pPSPRODUC, String pPCPARPRO) throws Exception {
		String callQuery = "{?=call F_PARPRODUCTOS_V(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCPARPRO" }, new Object[] { pPSPRODUC, pPCPARPRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCPARPRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PARPRODUCTOS_V(java.math.BigDecimal pPSPRODUC, String pPCPARPRO) throws Exception {
		return this.callF_PARPRODUCTOS_V(pPSPRODUC, pPCPARPRO);
	}
	// --END-F_PARPRODUCTOS_V
	// --START-PINTAERRORS(MSJ, OIM)

	private HashMap callPINTAERRORS(Object pMSJ, Object pOIM) throws Exception {
		String callQuery = "{?=call PINTAERRORS(?,?)}";
		logCall(callQuery, new String[] { "pMSJ", "pOIM" }, new Object[] { pMSJ, pOIM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pMSJ);
		cStmt.setObject(3, pOIM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPINTAERRORS(Object pMSJ, Object pOIM) throws Exception {
		return this.callPINTAERRORS(pMSJ, pOIM);
	}
	// --END-PINTAERRORS
	// --START-RETORNERRORS()

	private HashMap callRETORNERRORS() throws Exception {
		String callQuery = "{?=call RETORNERRORS()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaRETORNERRORS() throws Exception {
		return this.callRETORNERRORS();
	}
	// --END-RETORNERRORS

	// --START-F_DESEMPRESA(PCEMPRES, PNPOLIZA, PTEMPRES)

	private HashMap callF_DESEMPRESA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNPOLIZA, String pPTEMPRES)
			throws Exception {
		String callQuery = "{?=call F_DESEMPRESA(?,?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPNPOLIZA", "pPTEMPRES" },
				new Object[] { pPCEMPRES, pPNPOLIZA, pPTEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPTEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTEMPRES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PTEMPRES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTEMPRES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_DESEMPRESA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNPOLIZA, String pPTEMPRES)
			throws Exception {
		return this.callF_DESEMPRESA(pPCEMPRES, pPNPOLIZA, pPTEMPRES);
	}
	// --END-F_DESEMPRESA

	// --START-FF_BUSCASSEGURO(NPOLIZA, NCERTIF)

	private HashMap callFF_BUSCASSEGURO(java.math.BigDecimal NPOLIZA, java.math.BigDecimal NCERTIF) throws Exception {
		String callQuery = "{?=call FF_BUSCASSEGURO(?,?)}";
		logCall(callQuery, new String[] { "NPOLIZA", "NCERTIF" }, new Object[] { NPOLIZA, NCERTIF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, NPOLIZA);
		cStmt.setObject(3, NCERTIF);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaFF_BUSCASSEGURO(java.math.BigDecimal NPOLIZA, java.math.BigDecimal NCERTIF) throws Exception {
		return this.callFF_BUSCASSEGURO(NPOLIZA, NCERTIF);
	}
	// --END-F_DESEMPRESA

	// --START-F_PAREMPRESA_T(PCPARAME, PCEMPRES)

	private HashMap callF_PAREMPRESA_T(String PCPARAME, java.math.BigDecimal PCEMPRES) throws Exception {
		String callQuery = "{?=call F_PAREMPRESA_T(?,?)}";
		logCall(callQuery, new String[] { "PCPARAME", "PCEMPRES" }, new Object[] { PCPARAME, PCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, PCPARAME);
		cStmt.setObject(3, PCEMPRES);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaF_PAREMPRESA_T(String PCPARAME, java.math.BigDecimal PCEMPRES) throws Exception {
		return this.callF_PAREMPRESA_T(PCPARAME, PCEMPRES);
	}
	// --END-F_PAREMPRESA_T
}
