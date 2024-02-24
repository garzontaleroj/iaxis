package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PRODUCCION_AUT extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRODUCCION_AUT.class);
	private Connection conn = null;

	public PAC_IAX_PRODUCCION_AUT(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PRODUCCION_AUT.F_ELIMINA_CONDUCTOR(PNRIESGO, PSPERSON,
	// PNORDEN)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_ELIMINA_CONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_ELIMINA_CONDUCTOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPSPERSON", "pPNORDEN" },
				new Object[] { pPNRIESGO, pPSPERSON, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_ELIMINA_CONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_ELIMINA_CONDUCTOR(pPNRIESGO, pPSPERSON, pPNORDEN);
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_ELIMINA_CONDUCTOR
	// --START-PAC_IAX_PRODUCCION_AUT.F_EXIST_PROPIETARIOCONDUCTOR(PNRIESGO,
	// PNORDEN)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_EXIST_PROPIETARIOCONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_EXIST_PROPIETARIOCONDUCTOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN" }, new Object[] { pPNRIESGO, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(4, pPNORDEN);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_EXIST_PROPIETARIOCONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_EXIST_PROPIETARIOCONDUCTOR(pPNRIESGO, pPNORDEN);
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_EXIST_PROPIETARIOCONDUCTOR

	// --START-PAC_IAX_PRODUCCION_AUT.F_GRABACONDUCTORES(PNRIESGO, PSPERSON,
	// PNPUNTOS, PFCARNET, PCDOMICI, PCPRINCIPAL, PEXPER_MANUAL, PEXPER_CEXPER,
	// PEXPER_SINIE, PEXPER_SINIE_MANUAL, PNORDEN)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_GRABACONDUCTORES(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNPUNTOS, java.sql.Date pPFCARNET,
			java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPRINCIPAL, java.math.BigDecimal pPEXPER_MANUAL,
			java.math.BigDecimal pPEXPER_CEXPER, java.math.BigDecimal pPEXPER_SINIE,
			java.math.BigDecimal pPEXPER_SINIE_MANUAL, java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_GRABACONDUCTORES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPSPERSON", "pPNPUNTOS", "pPFCARNET", "pPCDOMICI", "pPCPRINCIPAL",
						"pPEXPER_MANUAL", "pPEXPER_CEXPER", "pPEXPER_SINIE", "pPEXPER_SINIE_MANUAL", "pPNORDEN" },
				new Object[] { pPNRIESGO, pPSPERSON, pPNPUNTOS, pPFCARNET, pPCDOMICI, pPCPRINCIPAL, pPEXPER_MANUAL,
						pPEXPER_CEXPER, pPEXPER_SINIE, pPEXPER_SINIE_MANUAL, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPNPUNTOS);
		cStmt.setObject(5, pPFCARNET);
		cStmt.setObject(6, pPCDOMICI);
		cStmt.setObject(7, pPCPRINCIPAL);
		cStmt.setObject(8, pPEXPER_MANUAL);
		cStmt.setObject(9, pPEXPER_CEXPER);
		cStmt.setObject(10, pPEXPER_SINIE);
		cStmt.setObject(11, pPEXPER_SINIE_MANUAL);
		cStmt.setObject(12, pPNORDEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_GRABACONDUCTORES(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNPUNTOS, java.sql.Date pPFCARNET,
			java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPRINCIPAL, java.math.BigDecimal pPEXPER_MANUAL,
			java.math.BigDecimal pPEXPER_CEXPER, java.math.BigDecimal pPEXPER_SINIE,
			java.math.BigDecimal pPEXPER_SINIE_MANUAL, java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_GRABACONDUCTORES(pPNRIESGO, pPSPERSON, pPNPUNTOS, pPFCARNET,
				pPCDOMICI, pPCPRINCIPAL, pPEXPER_MANUAL, pPEXPER_CEXPER, pPEXPER_SINIE, pPEXPER_SINIE_MANUAL, pPNORDEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_GRABACONDUCTORES

	// --START-PAC_IAX_PRODUCCION_AUT.F_LEE_CONDUCTOR(PNRIESGO, PNORDEN)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEE_CONDUCTOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN" }, new Object[] { pPNRIESGO, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(4, pPNORDEN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AUTCONDUCTORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTOR(pPNRIESGO, pPNORDEN);
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_LEE_CONDUCTOR
	// --START-PAC_IAX_PRODUCCION_AUT.F_LEE_CONDUCTORES(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEE_CONDUCTORES(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AUTCONDUCTORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(pPNRIESGO);
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_LEE_CONDUCTORES
	// --START-PAC_IAX_PRODUCCION_AUT.F_LEE_RIESAUTO(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEE_RIESAUTO(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AUTRIESGOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_LEE_RIESAUTO

	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_ACCESORIOSNOSERIE(PNRIESGO, PCVERSION,
	// PCACCESORIO, PTDESCRIPCION, PIVALACC, PCTIPACC, PCVEHB7, PCMARCADO,
	// PCASEGURABLE)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_ACCESORIOSNOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCACCESORIO, String pPTDESCRIPCION, java.math.BigDecimal pPIVALACC,
			java.math.BigDecimal pPCTIPACC, java.math.BigDecimal pPCVEHB7, java.math.BigDecimal pPCMARCADO,
			java.math.BigDecimal pPCASEGURABLE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_ACCESORIOSNOSERIE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPCVERSION", "pPCACCESORIO", "pPTDESCRIPCION", "pPIVALACC", "pPCTIPACC",
						"pPCVEHB7", "pPCMARCADO", "pPCASEGURABLE" },
				new Object[] { pPNRIESGO, pPCVERSION, pPCACCESORIO, pPTDESCRIPCION, pPIVALACC, pPCTIPACC, pPCVEHB7,
						pPCMARCADO, pPCASEGURABLE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCVERSION);
		cStmt.setObject(4, pPCACCESORIO);
		cStmt.setObject(5, pPTDESCRIPCION);
		cStmt.setObject(6, pPIVALACC);
		cStmt.setObject(7, pPCTIPACC);
		cStmt.setObject(8, pPCVEHB7);
		cStmt.setObject(9, pPCMARCADO);
		cStmt.setObject(10, pPCASEGURABLE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, java.sql.Types.VARCHAR); // Valor de "PCACCESORIO_OUT"
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
			retVal.put("PCACCESORIO_OUT", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PCACCESORIO_OUT", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_ACCESORIOSNOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCACCESORIO, String pPTDESCRIPCION, java.math.BigDecimal pPIVALACC,
			java.math.BigDecimal pPCTIPACC, java.math.BigDecimal pPCVEHB7, java.math.BigDecimal pPCMARCADO,
			java.math.BigDecimal pPCASEGURABLE) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_ACCESORIOSNOSERIE(pPNRIESGO, pPCVERSION, pPCACCESORIO,
				pPTDESCRIPCION, pPIVALACC, pPCTIPACC, pPCVEHB7, pPCMARCADO, pPCASEGURABLE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_ACCESORIOSNOSERIE

	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_CONDUCTOR(PNRIESGO, PNORDEN, PSPERSON,
	// PFNACIMI, PNPUNTOS, PFCARNET, PCSEXO, PCDOMICI, PCPRINCIPAL, PEXPER_MANUAL,
	// PEXPER_CEXPER, PEXPER_SINIE, PEXPER_SINIE_MANUAL)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON, java.sql.Date pPFNACIMI,
			java.math.BigDecimal pPNPUNTOS, java.sql.Date pPFCARNET, java.math.BigDecimal pPCSEXO,
			java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPRINCIPAL, java.math.BigDecimal pPEXPER_MANUAL,
			java.math.BigDecimal pPEXPER_CEXPER, java.math.BigDecimal pPEXPER_SINIE,
			java.math.BigDecimal pPEXPER_SINIE_MANUAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_CONDUCTOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPNORDEN", "pPSPERSON", "pPFNACIMI", "pPNPUNTOS", "pPFCARNET", "pPCSEXO",
						"pPCDOMICI", "pPCPRINCIPAL", "pPEXPER_MANUAL", "pPEXPER_CEXPER", "pPEXPER_SINIE",
						"pPEXPER_SINIE_MANUAL" },
				new Object[] { pPNRIESGO, pPNORDEN, pPSPERSON, pPFNACIMI, pPNPUNTOS, pPFCARNET, pPCSEXO, pPCDOMICI,
						pPCPRINCIPAL, pPEXPER_MANUAL, pPEXPER_CEXPER, pPEXPER_SINIE, pPEXPER_SINIE_MANUAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPFNACIMI);
		cStmt.setObject(6, pPNPUNTOS);
		cStmt.setObject(7, pPFCARNET);
		cStmt.setObject(8, pPCSEXO);
		cStmt.setObject(9, pPCDOMICI);
		cStmt.setObject(10, pPCPRINCIPAL);
		cStmt.setObject(11, pPEXPER_MANUAL);
		cStmt.setObject(12, pPEXPER_CEXPER);
		cStmt.setObject(13, pPEXPER_SINIE);
		cStmt.setObject(14, pPEXPER_SINIE_MANUAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON, java.sql.Date pPFNACIMI,
			java.math.BigDecimal pPNPUNTOS, java.sql.Date pPFCARNET, java.math.BigDecimal pPCSEXO,
			java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPRINCIPAL, java.math.BigDecimal pPEXPER_MANUAL,
			java.math.BigDecimal pPEXPER_CEXPER, java.math.BigDecimal pPEXPER_SINIE,
			java.math.BigDecimal pPEXPER_SINIE_MANUAL) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR(pPNRIESGO, pPNORDEN, pPSPERSON, pPFNACIMI, pPNPUNTOS,
				pPFCARNET, pPCSEXO, pPCDOMICI, pPCPRINCIPAL, pPEXPER_MANUAL, pPEXPER_CEXPER, pPEXPER_SINIE,
				pPEXPER_SINIE_MANUAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_CONDUCTOR

	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_DETAUTRIESGOS(PNRIESGO, PNMOVIMI,
	// PCVERSION, PCACCESORIO, PCTIPACC, PFINI, PIVALACC, PTDESACC)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_DETAUTRIESGOS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNMOVIMI, String pPCVERSION, String pPCACCESORIO, String pPCTIPACC,
			java.sql.Date pPFINI, java.math.BigDecimal pPIVALACC, String pPTDESACC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_DETAUTRIESGOS(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPNMOVIMI", "pPCVERSION", "pPCACCESORIO", "pPCTIPACC", "pPFINI",
						"pPIVALACC", "pPTDESACC" },
				new Object[] { pPNRIESGO, pPNMOVIMI, pPCVERSION, pPCACCESORIO, pPCTIPACC, pPFINI, pPIVALACC,
						pPTDESACC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCVERSION);
		cStmt.setObject(5, pPCACCESORIO);
		cStmt.setObject(6, pPCTIPACC);
		cStmt.setObject(7, pPFINI);
		cStmt.setObject(8, pPIVALACC);
		cStmt.setObject(9, pPTDESACC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_DETAUTRIESGOS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNMOVIMI, String pPCVERSION, String pPCACCESORIO, String pPCTIPACC,
			java.sql.Date pPFINI, java.math.BigDecimal pPIVALACC, String pPTDESACC) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_DETAUTRIESGOS(pPNRIESGO, pPNMOVIMI, pPCVERSION, pPCACCESORIO,
				pPCTIPACC, pPFINI, pPIVALACC, pPTDESACC);
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_DETAUTRIESGOS

	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_RIESAUTO(PSSEGURO, PNRIESGO, PCVERSION,
	// PCMODELO, PCMARCA, PCTIPVEH, PCCLAVEH, PCMATRIC, PCTIPMAT, PCUSO, PCSUBUSO,
	// PFMATRIC, PNKILOMETROS, PIVEHICU, PNPMA, PNTARA, PNPUERTAS, PNPLAZAS,
	// PCMOTOR, PCGARAJE, PCVEHB7, PCUSOREM, PCREMOLQUE, PCCOLOR, PCVEHNUE,
	// PNBASTID, PTRIESGO, PCPAISORIGEN, PCODMOTOR, PCCHASIS, PIVEHINUE,
	// PNKILOMETRAJE, PCCILINDRAJE, PCPINTURA, PCCAJA, PCCAMPERO, PCTIPCARROCERIA,
	// PCSERVICIO, PCORIGEN, PCTRANSPORTE, PIVEHICUFASECOLDA, PIVEHICUFASECOLDANUE,
	// PANYO, PFFINCIANT, PCIAANT, PCPESO, PCTRANSMISION)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_RIESAUTO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCVERSION, String pPCMODELO, String pPCMARCA, String pPCTIPVEH,
			String pPCCLAVEH, String pPCMATRIC, java.math.BigDecimal pPCTIPMAT, String pPCUSO, String pPCSUBUSO,
			java.sql.Date pPFMATRIC, java.math.BigDecimal pPNKILOMETROS, java.math.BigDecimal pPIVEHICU,
			java.math.BigDecimal pPNPMA, java.math.BigDecimal pPNTARA, java.math.BigDecimal pPNPUERTAS,
			java.math.BigDecimal pPNPLAZAS, java.math.BigDecimal pPCMOTOR, java.math.BigDecimal pPCGARAJE,
			java.math.BigDecimal pPCVEHB7, java.math.BigDecimal pPCUSOREM, java.math.BigDecimal pPCREMOLQUE,
			java.math.BigDecimal pPCCOLOR, java.math.BigDecimal pPCVEHNUE, String pPNBASTID, String pPTRIESGO,
			java.math.BigDecimal pPCPAISORIGEN, String pPCODMOTOR, String pPCCHASIS, java.math.BigDecimal pPIVEHINUE,
			java.math.BigDecimal pPNKILOMETRAJE, String pPCCILINDRAJE, java.math.BigDecimal pPCPINTURA,
			java.math.BigDecimal pPCCAJA, java.math.BigDecimal pPCCAMPERO, java.math.BigDecimal pPCTIPCARROCERIA,
			java.math.BigDecimal pPCSERVICIO, java.math.BigDecimal pPCORIGEN, java.math.BigDecimal pPCTRANSPORTE,
			java.math.BigDecimal pPIVEHICUFASECOLDA, java.math.BigDecimal pPIVEHICUFASECOLDANUE,
			java.math.BigDecimal pPANYO, java.sql.Date pPFFINCIANT, java.math.BigDecimal pPCIAANT,
			java.math.BigDecimal pPCPESO, java.math.BigDecimal pPCTRANSMISION) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_RIESAUTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCVERSION", "pPCMODELO", "pPCMARCA", "pPCTIPVEH",
				"pPCCLAVEH", "pPCMATRIC", "pPCTIPMAT", "pPCUSO", "pPCSUBUSO", "pPFMATRIC", "pPNKILOMETROS", "pPIVEHICU",
				"pPNPMA", "pPNTARA", "pPNPUERTAS", "pPNPLAZAS", "pPCMOTOR", "pPCGARAJE", "pPCVEHB7", "pPCUSOREM",
				"pPCREMOLQUE", "pPCCOLOR", "pPCVEHNUE", "pPNBASTID", "pPTRIESGO", "pPCPAISORIGEN", "pPCODMOTOR",
				"pPCCHASIS", "pPIVEHINUE", "pPNKILOMETRAJE", "pPCCILINDRAJE", "pPCPINTURA", "pPCCAJA", "pPCCAMPERO",
				"pPCTIPCARROCERIA", "pPCSERVICIO", "pPCORIGEN", "pPCTRANSPORTE", "pPIVEHICUFASECOLDA",
				"pPIVEHICUFASECOLDANUE", "pPANYO", "pPFFINCIANT", "pPCIAANT", "pPCPESO", "pPCTRANSMISION" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCVERSION, pPCMODELO, pPCMARCA, pPCTIPVEH, pPCCLAVEH, pPCMATRIC,
						pPCTIPMAT, pPCUSO, pPCSUBUSO, pPFMATRIC, pPNKILOMETROS, pPIVEHICU, pPNPMA, pPNTARA, pPNPUERTAS,
						pPNPLAZAS, pPCMOTOR, pPCGARAJE, pPCVEHB7, pPCUSOREM, pPCREMOLQUE, pPCCOLOR, pPCVEHNUE,
						pPNBASTID, pPTRIESGO, pPCPAISORIGEN, pPCODMOTOR, pPCCHASIS, pPIVEHINUE, pPNKILOMETRAJE,
						pPCCILINDRAJE, pPCPINTURA, pPCCAJA, pPCCAMPERO, pPCTIPCARROCERIA, pPCSERVICIO, pPCORIGEN,
						pPCTRANSPORTE, pPIVEHICUFASECOLDA, pPIVEHICUFASECOLDANUE, pPANYO, pPFFINCIANT, pPCIAANT,
						pPCPESO, pPCTRANSMISION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCVERSION);
		cStmt.setObject(5, pPCMODELO);
		cStmt.setObject(6, pPCMARCA);
		cStmt.setObject(7, pPCTIPVEH);
		cStmt.setObject(8, pPCCLAVEH);
		cStmt.setObject(9, pPCMATRIC);
		cStmt.setObject(10, pPCTIPMAT);
		cStmt.setObject(11, pPCUSO);
		cStmt.setObject(12, pPCSUBUSO);
		cStmt.setObject(13, pPFMATRIC);
		cStmt.setObject(14, pPNKILOMETROS);
		cStmt.setObject(15, pPIVEHICU);
		cStmt.setObject(16, pPNPMA);
		cStmt.setObject(17, pPNTARA);
		cStmt.setObject(18, pPNPUERTAS);
		cStmt.setObject(19, pPNPLAZAS);
		cStmt.setObject(20, pPCMOTOR);
		cStmt.setObject(21, pPCGARAJE);
		cStmt.setObject(22, pPCVEHB7);
		cStmt.setObject(23, pPCUSOREM);
		cStmt.setObject(24, pPCREMOLQUE);
		cStmt.setObject(25, pPCCOLOR);
		cStmt.setObject(26, pPCVEHNUE);
		cStmt.setObject(27, pPNBASTID);
		cStmt.setObject(28, pPTRIESGO);
		cStmt.setObject(29, pPCPAISORIGEN);
		cStmt.setObject(30, pPCODMOTOR);
		cStmt.setObject(31, pPCCHASIS);
		cStmt.setObject(32, pPIVEHINUE);
		cStmt.setObject(33, pPNKILOMETRAJE);
		cStmt.setObject(34, pPCCILINDRAJE);
		cStmt.setObject(35, pPCPINTURA);
		cStmt.setObject(36, pPCCAJA);
		cStmt.setObject(37, pPCCAMPERO);
		cStmt.setObject(38, pPCTIPCARROCERIA);
		cStmt.setObject(39, pPCSERVICIO);
		cStmt.setObject(40, pPCORIGEN);
		cStmt.setObject(41, pPCTRANSPORTE);
		cStmt.setObject(42, pPIVEHICUFASECOLDA);
		cStmt.setObject(43, pPIVEHICUFASECOLDANUE);
		cStmt.setObject(44, pPANYO);
		cStmt.setObject(47, pPFFINCIANT);
		cStmt.setObject(48, pPCIAANT);
		cStmt.setObject(49, pPCPESO);
		cStmt.setObject(50, pPCTRANSMISION);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(45, java.sql.Types.NUMERIC); // Valor de "PNRIESGO_OUT"
		cStmt.registerOutParameter(46, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PNRIESGO_OUT", cStmt.getObject(45));
		} catch (SQLException e) {
			retVal.put("PNRIESGO_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(46));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_RIESAUTO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCVERSION, String pPCMODELO, String pPCMARCA, String pPCTIPVEH,
			String pPCCLAVEH, String pPCMATRIC, java.math.BigDecimal pPCTIPMAT, String pPCUSO, String pPCSUBUSO,
			java.sql.Date pPFMATRIC, java.math.BigDecimal pPNKILOMETROS, java.math.BigDecimal pPIVEHICU,
			java.math.BigDecimal pPNPMA, java.math.BigDecimal pPNTARA, java.math.BigDecimal pPNPUERTAS,
			java.math.BigDecimal pPNPLAZAS, java.math.BigDecimal pPCMOTOR, java.math.BigDecimal pPCGARAJE,
			java.math.BigDecimal pPCVEHB7, java.math.BigDecimal pPCUSOREM, java.math.BigDecimal pPCREMOLQUE,
			java.math.BigDecimal pPCCOLOR, java.math.BigDecimal pPCVEHNUE, String pPNBASTID, String pPTRIESGO,
			java.math.BigDecimal pPCPAISORIGEN, String pPCODMOTOR, String pPCCHASIS, java.math.BigDecimal pPIVEHINUE,
			java.math.BigDecimal pPNKILOMETRAJE, String pPCCILINDRAJE, java.math.BigDecimal pPCPINTURA,
			java.math.BigDecimal pPCCAJA, java.math.BigDecimal pPCCAMPERO, java.math.BigDecimal pPCTIPCARROCERIA,
			java.math.BigDecimal pPCSERVICIO, java.math.BigDecimal pPCORIGEN, java.math.BigDecimal pPCTRANSPORTE,
			java.math.BigDecimal pPIVEHICUFASECOLDA, java.math.BigDecimal pPIVEHICUFASECOLDANUE,
			java.math.BigDecimal pPANYO, java.sql.Date pPFFINCIANT, java.math.BigDecimal pPCIAANT,
			java.math.BigDecimal pPCPESO, java.math.BigDecimal pPCTRANSMISION) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_RIESAUTO(pPSSEGURO, pPNRIESGO, pPCVERSION, pPCMODELO, pPCMARCA,
				pPCTIPVEH, pPCCLAVEH, pPCMATRIC, pPCTIPMAT, pPCUSO, pPCSUBUSO, pPFMATRIC, pPNKILOMETROS, pPIVEHICU,
				pPNPMA, pPNTARA, pPNPUERTAS, pPNPLAZAS, pPCMOTOR, pPCGARAJE, pPCVEHB7, pPCUSOREM, pPCREMOLQUE, pPCCOLOR,
				pPCVEHNUE, pPNBASTID, pPTRIESGO, pPCPAISORIGEN, pPCODMOTOR, pPCCHASIS, pPIVEHINUE, pPNKILOMETRAJE,
				pPCCILINDRAJE, pPCPINTURA, pPCCAJA, pPCCAMPERO, pPCTIPCARROCERIA, pPCSERVICIO, pPCORIGEN, pPCTRANSPORTE,
				pPIVEHICUFASECOLDA, pPIVEHICUFASECOLDANUE, pPANYO, pPFFINCIANT, pPCIAANT, pPCPESO, pPCTRANSMISION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_RIESAUTO

	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_VERSION(PCMARCA, PCMODELO, PCTIPVEH,
	// PCCLAVEH, PCVERSION, PTVERSION, PNPUERTA, PFLANZAM, PNTARA, PNPMA, PCMOTOR,
	// PNCILIND, PNPOTECV, PNPOTEKW, PNPLAZAS, PCVEHB7)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_VERSION(String pPCMARCA, String pPCMODELO, String pPCTIPVEH,
			String pPCCLAVEH, String pPCVERSION, String pPTVERSION, java.math.BigDecimal pPNPUERTA,
			java.sql.Date pPFLANZAM, java.math.BigDecimal pPNTARA, java.math.BigDecimal pPNPMA, String pPCMOTOR,
			java.math.BigDecimal pPNCILIND, java.math.BigDecimal pPNPOTECV, java.math.BigDecimal pPNPOTEKW,
			java.math.BigDecimal pPNPLAZAS, java.math.BigDecimal pPCVEHB7) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_VERSION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMARCA", "pPCMODELO", "pPCTIPVEH", "pPCCLAVEH", "pPCVERSION", "pPTVERSION",
						"pPNPUERTA", "pPFLANZAM", "pPNTARA", "pPNPMA", "pPCMOTOR", "pPNCILIND", "pPNPOTECV",
						"pPNPOTEKW", "pPNPLAZAS", "pPCVEHB7" },
				new Object[] { pPCMARCA, pPCMODELO, pPCTIPVEH, pPCCLAVEH, pPCVERSION, pPTVERSION, pPNPUERTA, pPFLANZAM,
						pPNTARA, pPNPMA, pPCMOTOR, pPNCILIND, pPNPOTECV, pPNPOTEKW, pPNPLAZAS, pPCVEHB7 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
		cStmt.setObject(3, pPCMODELO);
		cStmt.setObject(4, pPCTIPVEH);
		cStmt.setObject(5, pPCCLAVEH);
		cStmt.setObject(6, pPCVERSION);
		cStmt.setObject(7, pPTVERSION);
		cStmt.setObject(8, pPNPUERTA);
		cStmt.setObject(9, pPFLANZAM);
		cStmt.setObject(10, pPNTARA);
		cStmt.setObject(11, pPNPMA);
		cStmt.setObject(12, pPCMOTOR);
		cStmt.setObject(13, pPNCILIND);
		cStmt.setObject(14, pPNPOTECV);
		cStmt.setObject(15, pPNPOTEKW);
		cStmt.setObject(16, pPNPLAZAS);
		cStmt.setObject(17, pPCVEHB7);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(18, java.sql.Types.VARCHAR); // Valor de "PCVERSION_OUT"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCVERSION_OUT", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PCVERSION_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_VERSION(String pPCMARCA, String pPCMODELO, String pPCTIPVEH,
			String pPCCLAVEH, String pPCVERSION, String pPTVERSION, java.math.BigDecimal pPNPUERTA,
			java.sql.Date pPFLANZAM, java.math.BigDecimal pPNTARA, java.math.BigDecimal pPNPMA, String pPCMOTOR,
			java.math.BigDecimal pPNCILIND, java.math.BigDecimal pPNPOTECV, java.math.BigDecimal pPNPOTEKW,
			java.math.BigDecimal pPNPLAZAS, java.math.BigDecimal pPCVEHB7) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_VERSION(pPCMARCA, pPCMODELO, pPCTIPVEH, pPCCLAVEH, pPCVERSION,
				pPTVERSION, pPNPUERTA, pPFLANZAM, pPNTARA, pPNPMA, pPCMOTOR, pPNCILIND, pPNPOTECV, pPNPOTEKW, pPNPLAZAS,
				pPCVEHB7);
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_VERSION

	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_GARANMODALIDAD(P_NRIESGO, P_CMODALIDAD)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_GARANMODALIDAD(java.math.BigDecimal pP_NRIESGO,
			java.math.BigDecimal pP_CMODALIDAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_GARANMODALIDAD(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NRIESGO", "pP_CMODALIDAD" }, new Object[] { pP_NRIESGO, pP_CMODALIDAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NRIESGO);
		cStmt.setObject(3, pP_CMODALIDAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GARANTIAS".toUpperCase())); // Valor de "GARANTIAS"
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
			retVal.put("GARANTIAS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("GARANTIAS", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_GARANMODALIDAD(java.math.BigDecimal pP_NRIESGO,
			java.math.BigDecimal pP_CMODALIDAD) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_GARANMODALIDAD(pP_NRIESGO, pP_CMODALIDAD);
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_GARANMODALIDAD

	// --START-PAC_IAX_PRODUCCION_AUT.F_GET_GARANMODALIDAD(P_NRIESGO, P_CMODALIDAD)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_GET_GARANMODALIDAD(java.math.BigDecimal pP_NRIESGO,
			java.math.BigDecimal pP_CMODALIDAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_GET_GARANMODALIDAD(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NRIESGO", "pP_CMODALIDAD" }, new Object[] { pP_NRIESGO, pP_CMODALIDAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NRIESGO);
		cStmt.setObject(3, pP_CMODALIDAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GARANTIAS".toUpperCase())); // Valor de "GARANTIAS"
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
			retVal.put("GARANTIAS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("GARANTIAS", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_GET_GARANMODALIDAD(java.math.BigDecimal pP_NRIESGO,
			java.math.BigDecimal pP_CMODALIDAD) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_GET_GARANMODALIDAD(pP_NRIESGO, pP_CMODALIDAD);
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_GET_GARANMODALIDAD

	// --START-PAC_IAX_PRODUCCION_AUT.F_LEE_ACCESORIOS(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEE_ACCESORIOS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AUTACCESORIOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOS(pPNRIESGO);
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_LEE_ACCESORIOS
	// --START-PAC_IAX_PRODUCCION_AUT.F_LEE_ACCESORIOSNOSERIE(PCVERSION)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOSNOSERIE(String pPCVERSION) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEE_ACCESORIOSNOSERIE(?, ?)}";

		logCall(callQuery, new String[] { "pPCVERSION" }, new Object[] { pPCVERSION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCVERSION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AUTACCESORIOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOSNOSERIE(String pPCVERSION) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOSNOSERIE(pPCVERSION);
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_LEE_ACCESORIOSNOSERIE

	// --START-PAC_IAX_PRODUCCION_AUT.F_DEL_ACCESORIOSNOSERIE(PNRIESGO, PCVERSION,
	// PCACCESORIO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_DEL_ACCESORIOSNOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCACCESORIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_DEL_ACCESORIOSNOSERIE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCVERSION", "pPCACCESORIO" },
				new Object[] { pPNRIESGO, pPCVERSION, pPCACCESORIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCVERSION);
		cStmt.setObject(4, pPCACCESORIO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_DEL_ACCESORIOSNOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCACCESORIO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_DEL_ACCESORIOSNOSERIE(pPNRIESGO, pPCVERSION, pPCACCESORIO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_DEL_ACCESORIOSNOSERIE
	// --START-PAC_IAX_PRODUCCION_AUT.F_DEL_DISPOSITIVOSNOSERIE(PNRIESGO, PCVERSION,
	// PCDISPOSITIVO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_DEL_DISPOSITIVOSNOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCDISPOSITIVO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_DEL_DISPOSITIVOSNOSERIE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCVERSION", "pPCDISPOSITIVO" },
				new Object[] { pPNRIESGO, pPCVERSION, pPCDISPOSITIVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCVERSION);
		cStmt.setObject(4, pPCDISPOSITIVO);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_DEL_DISPOSITIVOSNOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCDISPOSITIVO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_DEL_DISPOSITIVOSNOSERIE(pPNRIESGO, pPCVERSION, pPCDISPOSITIVO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_DEL_DISPOSITIVOSNOSERIE
	// --START-PAC_IAX_PRODUCCION_AUT.F_LEE_DISPOSITIVOS(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEE_DISPOSITIVOS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AUTDISPOSITIVOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOS(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_LEE_DISPOSITIVOS
	// --START-PAC_IAX_PRODUCCION_AUT.F_LEE_DISPOSITIVOSNOSERIE(PCVERSION)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOSNOSERIE(String pPCVERSION) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEE_DISPOSITIVOSNOSERIE(?, ?)}";

		logCall(callQuery, new String[] { "pPCVERSION" }, new Object[] { pPCVERSION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCVERSION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AUTDISPOSITIVOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOSNOSERIE(String pPCVERSION) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOSNOSERIE(pPCVERSION);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_LEE_DISPOSITIVOSNOSERIE
	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_DISPOSITIVONOSERIE(PNRIESGO, PCVERSION,
	// PCDISPOSITIVO, PCPROPDISP, PIVALDISP, PFINICONTRATO, PFFINCONTRATO,
	// PCMARCADO, PNCONTRATO, PTDESCDISP)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_DISPOSITIVONOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCDISPOSITIVO, String pPCPROPDISP, java.math.BigDecimal pPIVALDISP,
			java.sql.Date pPFINICONTRATO, java.sql.Date pPFFINCONTRATO, java.math.BigDecimal pPCMARCADO,
			java.math.BigDecimal pPNCONTRATO, String pPTDESCDISP) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_DISPOSITIVONOSERIE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPCVERSION", "pPCDISPOSITIVO", "pPCPROPDISP", "pPIVALDISP",
						"pPFINICONTRATO", "pPFFINCONTRATO", "pPCMARCADO", "pPNCONTRATO", "pPTDESCDISP" },
				new Object[] { pPNRIESGO, pPCVERSION, pPCDISPOSITIVO, pPCPROPDISP, pPIVALDISP, pPFINICONTRATO,
						pPFFINCONTRATO, pPCMARCADO, pPNCONTRATO, pPTDESCDISP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCVERSION);
		cStmt.setObject(4, pPCDISPOSITIVO);
		cStmt.setObject(5, pPCPROPDISP);
		cStmt.setObject(6, pPIVALDISP);
		cStmt.setObject(7, pPFINICONTRATO);
		cStmt.setObject(8, pPFFINCONTRATO);
		cStmt.setObject(9, pPCMARCADO);
		cStmt.setObject(10, pPNCONTRATO);
		cStmt.setObject(11, pPTDESCDISP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(12, java.sql.Types.VARCHAR); // Valor de "PCDISPOSITIVO_OUT"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCDISPOSITIVO_OUT", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PCDISPOSITIVO_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_DISPOSITIVONOSERIE(java.math.BigDecimal pPNRIESGO,
			String pPCVERSION, String pPCDISPOSITIVO, String pPCPROPDISP, java.math.BigDecimal pPIVALDISP,
			java.sql.Date pPFINICONTRATO, java.sql.Date pPFFINCONTRATO, java.math.BigDecimal pPCMARCADO,
			java.math.BigDecimal pPNCONTRATO, String pPTDESCDISP) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_DISPOSITIVONOSERIE(pPNRIESGO, pPCVERSION, pPCDISPOSITIVO,
				pPCPROPDISP, pPIVALDISP, pPFINICONTRATO, pPFFINCONTRATO, pPCMARCADO, pPNCONTRATO, pPTDESCDISP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_DISPOSITIVONOSERIE

	// --START-PAC_IAX_PRODUCCION_AUT.F_GET_AUTO_MATRIC(PCTIPMAT, PCMATRIC,
	// PSPRODUC, PCACTIVI, PCMODO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_GET_AUTO_MATRIC(java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, String pPCMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_GET_AUTO_MATRIC(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPMAT", "pPCMATRIC", "pPSPRODUC", "pPCACTIVI", "pPCMODO" },
				new Object[] { pPCTIPMAT, pPCMATRIC, pPSPRODUC, pPCACTIVI, pPCMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPMAT);
		cStmt.setObject(3, pPCMATRIC);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPCMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AUTRIESGOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_GET_AUTO_MATRIC(java.math.BigDecimal pPCTIPMAT, String pPCMATRIC,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, String pPCMODO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_GET_AUTO_MATRIC(pPCTIPMAT, pPCMATRIC, pPSPRODUC, pPCACTIVI, pPCMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_GET_AUTO_MATRIC

	// --START-PAC_IAX_PRODUCCION_AUT.F_HAY_HOMOLOGACION(PCVERSION, PSSEGURO,
	// PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_HAY_HOMOLOGACION(String pPCVERSION, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_HAY_HOMOLOGACION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCVERSION", "pPSSEGURO", "pPNRIESGO" },
				new Object[] { pPCVERSION, pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCVERSION);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PVALORCOMERCIAL"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PVALORCOMERCIAL_NUEVO"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PHOMOLOGADO"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "PMENSAJEMOSTRAR"
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
			retVal.put("PVALORCOMERCIAL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PVALORCOMERCIAL", null);
		}
		try {
			retVal.put("PVALORCOMERCIAL_NUEVO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PVALORCOMERCIAL_NUEVO", null);
		}
		try {
			retVal.put("PHOMOLOGADO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PHOMOLOGADO", null);
		}
		try {
			retVal.put("PMENSAJEMOSTRAR", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PMENSAJEMOSTRAR", null);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_HAY_HOMOLOGACION(String pPCVERSION, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_HAY_HOMOLOGACION(pPCVERSION, pPSSEGURO, pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PRODUCCION_AUT.F_HAY_HOMOLOGACION
	// --START-PAC_IAX_PRODUCCION_AUT.F_CONTROLDUPLICIDAD(PSSEGURO, PCMATRIC,
	// PNBASTID, PCCHASIS, PCODMOTOR, PSPRODUC)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_CONTROLDUPLICIDAD(java.math.BigDecimal pPSSEGURO, String pPCMATRIC,
			String pPNBASTID, String pPCCHASIS, String pPCODMOTOR, java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_CONTROLDUPLICIDAD(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPCMATRIC", "pPNBASTID", "pPCCHASIS", "pPCODMOTOR", "pPSPRODUC" },
				new Object[] { pPSSEGURO, pPCMATRIC, pPNBASTID, pPCCHASIS, pPCODMOTOR, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMATRIC);
		cStmt.setObject(4, pPNBASTID);
		cStmt.setObject(5, pPCCHASIS);
		cStmt.setObject(6, pPCODMOTOR);
		cStmt.setObject(7, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_CONTROLDUPLICIDAD(java.math.BigDecimal pPSSEGURO, String pPCMATRIC,
			String pPNBASTID, String pPCCHASIS, String pPCODMOTOR, java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_CONTROLDUPLICIDAD(pPSSEGURO, pPCMATRIC, pPNBASTID, pPCCHASIS,
				pPCODMOTOR, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_CONTROLDUPLICIDAD

	// --START-PAC_IAX_PRODUCCION_AUT.F_SET_CONDUCTOR_TOMADOR(PNRIESGO, PNORDEN,
	// PSPERSON, PSPRODUC)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR_TOMADOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_SET_CONDUCTOR_TOMADOR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN", "pPSPERSON", "pPSPRODUC" },
				new Object[] { pPNRIESGO, pPNORDEN, pPSPERSON, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR_TOMADOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR_TOMADOR(pPNRIESGO, pPNORDEN, pPSPERSON, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_SET_CONDUCTOR_TOMADOR

	/**
	 * TODO - To be deprecated Esto debe ir en PAC_IAX_PRODUCCION.java, cuando est�
	 * libre.
	 * 
	 * @param pPNRIESGO
	 * @return
	 * @throws Exception
	 */
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADONOTOMADOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNTOMADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEEASEGURADONOTOMADOR(?, ?, ?)}";

		Object sIN[] = new String[] { "pPNRIESGO", "pPNTOMADOR" };
		Object pIN[] = new Object[] { pPNRIESGO, pPNTOMADOR };
		StringBuffer sB = new StringBuffer();
		sB.append("callQuery:").append(callQuery).append(", parametros:");
		for (int i = 0; i < sIN.length; i++) {
			sB.append(sIN[i]).append("=").append(pIN[i]);
			if (i < sIN.length - 1)
				sB.append(", ");
		}
		logger.debug(sB.toString());

		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNTOMADOR);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // ecg20110914 AXIS-WLS1SERVER . mover
																	// convertOracleObjects antes del close
		cStmt.close();
		return retVal;
	}

	/**
	 * TODO - To be deprecated Esto debe ir en PAC_IAX_PRODUCCION.java, cuando est�
	 * libre.
	 * 
	 * @param conn
	 * @param pPNRIESGO
	 * @return
	 * @throws Exception
	 */
	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADONOTOMADOR(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNTOMADOR) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADONOTOMADOR(pPNRIESGO, pPNTOMADOR);
	}

	// --START-PAC_IAX_PRODUCCION_AUT.F_LEEASEGURADOS(PNRIESGO)
	private HashMap callPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION_AUT.F_LEEASEGURADOS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADOS(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADOS(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRODUCCION_AUT.F_LEEASEGURADOS

}
