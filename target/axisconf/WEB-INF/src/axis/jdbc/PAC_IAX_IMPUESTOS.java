package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_IMPUESTOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_IMPUESTOS.class);
	private Connection conn = null;

	public PAC_IAX_IMPUESTOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_IMPUESTOS.F_DEL_IMPEMPRES(PCEMPRES, PCCONCEP)
	private HashMap callPAC_IAX_IMPUESTOS__F_DEL_IMPEMPRES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCONCEP) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_DEL_IMPEMPRES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCONCEP" }, new Object[] { pPCEMPRES, pPCCONCEP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCONCEP);
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

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_DEL_IMPEMPRES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCONCEP) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_DEL_IMPEMPRES(pPCEMPRES, pPCCONCEP);
	}
	// --END-PAC_IAX_IMPUESTOS.F_DEL_IMPEMPRES

	// --START-PAC_IAX_IMPUESTOS.F_GET_CCONCEP()
	private HashMap callPAC_IAX_IMPUESTOS__F_GET_CCONCEP() throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_GET_CCONCEP(?)}";

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

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_GET_CCONCEP() throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_GET_CCONCEP();
	}
	// --END-PAC_IAX_IMPUESTOS.F_GET_CCONCEP

	// --START-PAC_IAX_IMPUESTOS.F_GET_CCONCEP_EMP(PCEMPRES)
	private HashMap callPAC_IAX_IMPUESTOS__F_GET_CCONCEP_EMP(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_GET_CCONCEP_EMP(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_GET_CCONCEP_EMP(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_GET_CCONCEP_EMP(pPCEMPRES);
	}
	// --END-PAC_IAX_IMPUESTOS.F_GET_CCONCEP_EMP

	// --START-PAC_IAX_IMPUESTOS.F_GET_CFORPAG(PSPRODUC)
	private HashMap callPAC_IAX_IMPUESTOS__F_GET_CFORPAG(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_GET_CFORPAG(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_GET_CFORPAG(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_GET_CFORPAG(pPSPRODUC);
	}
	// --END-PAC_IAX_IMPUESTOS.F_GET_CFORPAG

	// --START-PAC_IAX_IMPUESTOS.F_GET_IMPEMPRES(PCEMPRES)
	private HashMap callPAC_IAX_IMPUESTOS__F_GET_IMPEMPRES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_GET_IMPEMPRES(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_GET_IMPEMPRES(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_GET_IMPEMPRES(pPCEMPRES);
	}
	// --END-PAC_IAX_IMPUESTOS.F_GET_IMPEMPRES

	// --START-PAC_IAX_IMPUESTOS.F_GET_IMPREC(PCEMPRES, PCCONCEP, PNCONCEP,
	// PCFORPAG, PSPRODUC, PCRAMO, PCACTIVI, PCGARANT, PFINIVIG, PFFINVIG)
	private HashMap callPAC_IAX_IMPUESTOS__F_GET_IMPREC(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPNCONCEP, java.math.BigDecimal pPCFORPAG, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_GET_IMPREC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCONCEP", "pPNCONCEP", "pPCFORPAG", "pPSPRODUC", "pPCRAMO", "pPCACTIVI",
						"pPCGARANT", "pPFINIVIG", "pPFFINVIG" },
				new Object[] { pPCEMPRES, pPCCONCEP, pPNCONCEP, pPCFORPAG, pPSPRODUC, pPCRAMO, pPCACTIVI, pPCGARANT,
						pPFINIVIG, pPFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCONCEP);
		cStmt.setObject(4, pPNCONCEP);
		cStmt.setObject(5, pPCFORPAG);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPCRAMO);
		cStmt.setObject(8, pPCACTIVI);
		cStmt.setObject(9, pPCGARANT);
		cStmt.setObject(10, pPFINIVIG);
		cStmt.setObject(11, pPFFINVIG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_GET_IMPREC(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPNCONCEP, java.math.BigDecimal pPCFORPAG,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_GET_IMPREC(pPCEMPRES, pPCCONCEP, pPNCONCEP, pPCFORPAG, pPSPRODUC, pPCRAMO,
				pPCACTIVI, pPCGARANT, pPFINIVIG, pPFFINVIG);
	}
	// --END-PAC_IAX_IMPUESTOS.F_GET_IMPREC

	// --START-PAC_IAX_IMPUESTOS.F_SET_IMPEMPRES(PCEMPRES, PCCONCEP)
	private HashMap callPAC_IAX_IMPUESTOS__F_SET_IMPEMPRES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCONCEP) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_SET_IMPEMPRES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCONCEP" }, new Object[] { pPCEMPRES, pPCCONCEP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCONCEP);
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

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_SET_IMPEMPRES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCONCEP) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_SET_IMPEMPRES(pPCEMPRES, pPCCONCEP);
	}
	// --END-PAC_IAX_IMPUESTOS.F_SET_IMPEMPRES

	// --START-PAC_IAX_IMPUESTOS.F_SET_IMPREC(PCCONCEP, PCEMPRES, PNCONCEP,
	// PCFORPAG, PCRAMO, PSPRODUC, PCACTIVI, PCGARANT, PFINIVIG, PCTIPCON, PNVALCON,
	// PCFRACCI, PCBONIFI, PCRECFRA)
	private HashMap callPAC_IAX_IMPUESTOS__F_SET_IMPREC(java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNCONCEP, java.math.BigDecimal pPCFORPAG, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.sql.Date pPFINIVIG, java.math.BigDecimal pPCTIPCON, java.math.BigDecimal pPNVALCON,
			java.math.BigDecimal pPCFRACCI, java.math.BigDecimal pPCBONIFI, java.math.BigDecimal pPCRECFRA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_SET_IMPREC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCONCEP", "pPCEMPRES", "pPNCONCEP", "pPCFORPAG", "pPCRAMO", "pPSPRODUC", "pPCACTIVI",
						"pPCGARANT", "pPFINIVIG", "pPCTIPCON", "pPNVALCON", "pPCFRACCI", "pPCBONIFI", "pPCRECFRA" },
				new Object[] { pPCCONCEP, pPCEMPRES, pPNCONCEP, pPCFORPAG, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT,
						pPFINIVIG, pPCTIPCON, pPNVALCON, pPCFRACCI, pPCBONIFI, pPCRECFRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPNCONCEP);
		cStmt.setObject(5, pPCFORPAG);
		cStmt.setObject(6, pPCRAMO);
		cStmt.setObject(7, pPSPRODUC);
		cStmt.setObject(8, pPCACTIVI);
		cStmt.setObject(9, pPCGARANT);
		cStmt.setObject(10, pPFINIVIG);
		cStmt.setObject(11, pPCTIPCON);
		cStmt.setObject(12, pPNVALCON);
		cStmt.setObject(13, pPCFRACCI);
		cStmt.setObject(14, pPCBONIFI);
		cStmt.setObject(15, pPCRECFRA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_SET_IMPREC(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNCONCEP, java.math.BigDecimal pPCFORPAG,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPCGARANT, java.sql.Date pPFINIVIG, java.math.BigDecimal pPCTIPCON,
			java.math.BigDecimal pPNVALCON, java.math.BigDecimal pPCFRACCI, java.math.BigDecimal pPCBONIFI,
			java.math.BigDecimal pPCRECFRA) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_SET_IMPREC(pPCCONCEP, pPCEMPRES, pPNCONCEP, pPCFORPAG, pPCRAMO, pPSPRODUC,
				pPCACTIVI, pPCGARANT, pPFINIVIG, pPCTIPCON, pPNVALCON, pPCFRACCI, pPCBONIFI, pPCRECFRA);
	}
	// --END-PAC_IAX_IMPUESTOS.F_SET_IMPREC

	// --START-PAC_IAX_IMPUESTOS.F_DEL_IMPREC(PCCONCEP, PCEMPRES, PNCONCEP,
	// PCFORPAG, PFINIVIG)
	private HashMap callPAC_IAX_IMPUESTOS__F_DEL_IMPREC(java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNCONCEP, java.math.BigDecimal pPCFORPAG, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_DEL_IMPREC(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCONCEP", "pPCEMPRES", "pPNCONCEP", "pPCFORPAG", "pPFINIVIG" },
				new Object[] { pPCCONCEP, pPCEMPRES, pPNCONCEP, pPCFORPAG, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPNCONCEP);
		cStmt.setObject(5, pPCFORPAG);
		cStmt.setObject(6, pPFINIVIG);
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

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_DEL_IMPREC(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNCONCEP, java.math.BigDecimal pPCFORPAG,
			java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_DEL_IMPREC(pPCCONCEP, pPCEMPRES, pPNCONCEP, pPCFORPAG, pPFINIVIG);
	}
	// --END-PAC_IAX_IMPUESTOS.F_DEL_IMPREC

	// --START-PAC_IAX_IMPUESTOS.F_GET_RECARGO(PCCONCEP, PCEMPRES, PNCONCEP,
	// PFINIVIG)
	private HashMap callPAC_IAX_IMPUESTOS__F_GET_RECARGO(java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNCONCEP, java.sql.Date pPFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPUESTOS.F_GET_RECARGO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCONCEP", "pPCEMPRES", "pPNCONCEP", "pPFINIVIG" },
				new Object[] { pPCCONCEP, pPCEMPRES, pPNCONCEP, pPFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPNCONCEP);
		cStmt.setObject(5, pPFINIVIG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCTIPCON"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PNVALCON"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PCBONIFI"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PCFRACCI"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PCRECFRA"
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
			retVal.put("PCTIPCON", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCTIPCON", null);
		}
		try {
			retVal.put("PNVALCON", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PNVALCON", null);
		}
		try {
			retVal.put("PCBONIFI", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCBONIFI", null);
		}
		try {
			retVal.put("PCFRACCI", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCFRACCI", null);
		}
		try {
			retVal.put("PCRECFRA", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCRECFRA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_IMPUESTOS__F_GET_RECARGO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNCONCEP, java.sql.Date pPFINIVIG) throws Exception {
		return this.callPAC_IAX_IMPUESTOS__F_GET_RECARGO(pPCCONCEP, pPCEMPRES, pPNCONCEP, pPFINIVIG);
	}
	// --END-PAC_IAX_IMPUESTOS.F_GET_RECARGO

}
