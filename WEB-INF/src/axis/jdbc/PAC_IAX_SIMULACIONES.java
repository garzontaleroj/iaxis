package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIMULACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ANULACIONES.class);
	private Connection conn = null;

	public PAC_IAX_SIMULACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIMULACIONES.F_INSERTTOMADORES(PSPERSON)
	private HashMap callPAC_IAX_SIMULACIONES__F_INSERTTOMADORES(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_INSERTTOMADORES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PPREGUN"
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
		try {
			retVal.put("PPREGUN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PPREGUN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_INSERTTOMADORES(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_INSERTTOMADORES(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_INSERTTOMADORES

	// --START-PAC_IAX_SIMULACIONES.F_ACTMODTOM(PSPERSON, PSPRODUC)
	private HashMap callPAC_IAX_SIMULACIONES__F_ACTMODTOM(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_ACTMODTOM(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPSPRODUC" }, new Object[] { pPSPERSON, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PFICTI"
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
			retVal.put("PFICTI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFICTI", null);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_ACTMODTOM(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_ACTMODTOM(pPSPERSON, pPSPRODUC);
	}
	// --END-PAC_IAX_SIMULACIONES.F_ACTMODTOM

	// --START-PAC_IAX_SIMULACIONES.F_CONSULTASIMUL(PSPRODUC, PSOLICIT, PTRIESGO,
	// P_CRAMO, P_FILTROPROD, PNNUMIDE, PBUSCAR, PFCOTIZA, PNPOLIZA)
	private HashMap callPAC_IAX_SIMULACIONES__F_CONSULTASIMUL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSOLICIT, String pPTRIESGO, java.math.BigDecimal pP_CRAMO, String pP_FILTROPROD,
			String pPNNUMIDE, String pPBUSCAR, java.sql.Date pPFCOTIZA, java.math.BigDecimal pPNPOLIZA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_CONSULTASIMUL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPSOLICIT", "pPTRIESGO", "pP_CRAMO", "pP_FILTROPROD", "pPNNUMIDE",
						"pPBUSCAR", "pPFCOTIZA", "pPNPOLIZA" },
				new Object[] { pPSPRODUC, pPSOLICIT, pPTRIESGO, pP_CRAMO, pP_FILTROPROD, pPNNUMIDE, pPBUSCAR, pPFCOTIZA,
						pPNPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPSOLICIT);
		cStmt.setObject(4, pPTRIESGO);
		cStmt.setObject(5, pP_CRAMO);
		cStmt.setObject(6, pP_FILTROPROD);
		cStmt.setObject(8, pPNNUMIDE);
		cStmt.setObject(9, pPBUSCAR);
		cStmt.setObject(10, pPFCOTIZA);
		cStmt.setObject(11, pPNPOLIZA);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_CONSULTASIMUL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSOLICIT, String pPTRIESGO, java.math.BigDecimal pP_CRAMO, String pP_FILTROPROD,
			String pPNNUMIDE, String pPBUSCAR, java.sql.Date pPFCOTIZA, java.math.BigDecimal pPNPOLIZA)
			throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_CONSULTASIMUL(pPSPRODUC, pPSOLICIT, pPTRIESGO, pP_CRAMO, pP_FILTROPROD,
				pPNNUMIDE, pPBUSCAR, pPFCOTIZA, pPNPOLIZA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_CONSULTASIMUL

	// --START-PAC_IAX_SIMULACIONES.F_ELIMINARIESGO(PNRIESGO)
	private HashMap callPAC_IAX_SIMULACIONES__F_ELIMINARIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_ELIMINARIESGO(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_ELIMINARIESGO(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_ELIMINARIESGO(pPNRIESGO);
	}

	// --END-PAC_IAX_SIMULACIONES.F_ELIMINARIESGO
	// --START-PAC_IAX_SIMULACIONES.F_EMISIONSIMULACION(RESPUESTA, PCSITUAC)
	private HashMap callPAC_IAX_SIMULACIONES__F_EMISIONSIMULACION(java.math.BigDecimal pRESPUESTA,
			java.math.BigDecimal pPCSITUAC) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_EMISIONSIMULACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pRESPUESTA", "pPCSITUAC" }, new Object[] { pRESPUESTA, pPCSITUAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pRESPUESTA);
		cStmt.setObject(3, pPCSITUAC);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_EMISIONSIMULACION(java.math.BigDecimal pRESPUESTA,
			java.math.BigDecimal pPCSITUAC) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_EMISIONSIMULACION(pRESPUESTA, pPCSITUAC);
	}
	// --END-PAC_IAX_SIMULACIONES.F_EMISIONSIMULACION

	// --START-PAC_IAX_SIMULACIONES.F_ELIMINAASEG(PSPERSON)
	private HashMap callPAC_IAX_SIMULACIONES__F_ELIMINAASEG(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_ELIMINAASEG(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_ELIMINAASEG(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_ELIMINAASEG(pPSPERSON);
	}
	// --END-PAC_IAX_SIMULACIONES.F_ELIMINAASEG

	// --START-PAC_IAX_SIMULACIONES.F_GET_ASEGURADO(PNRIESGO, PSPERSON)
	private HashMap callPAC_IAX_SIMULACIONES__F_GET_ASEGURADO(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GET_ASEGURADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPSPERSON" }, new Object[] { pPNRIESGO, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GET_ASEGURADO(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GET_ASEGURADO(pPNRIESGO, pPSPERSON);
	}
	// --END-PAC_IAX_SIMULACIONES.F_GET_ASEGURADO

	// --START-PAC_IAX_SIMULACIONES.F_GET_ASEGURADOPRIMERRIESGO()
	private HashMap callPAC_IAX_SIMULACIONES__F_GET_ASEGURADOPRIMERRIESGO() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GET_ASEGURADOPRIMERRIESGO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GET_ASEGURADOPRIMERRIESGO() throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GET_ASEGURADOPRIMERRIESGO();
	}

	// --END-PAC_IAX_SIMULACIONES.F_GET_ASEGURADOPRIMERRIESGO
	// --START-PAC_IAX_SIMULACIONES.F_GET_CODIGOSIMUL()
	private HashMap callPAC_IAX_SIMULACIONES__F_GET_CODIGOSIMUL() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GET_CODIGOSIMUL(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GET_CODIGOSIMUL() throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GET_CODIGOSIMUL();
	}

	// --END-PAC_IAX_SIMULACIONES.F_GET_CODIGOSIMUL
	// --START-PAC_IAX_SIMULACIONES.F_GET_PREGASGESTOM()
	private HashMap callPAC_IAX_SIMULACIONES__F_GET_PREGASGESTOM() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GET_PREGASGESTOM(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "PREGUNTAS"
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
			retVal.put("PREGUNTAS", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PREGUNTAS", null);
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

	// --START-PAC_IAX_SIMULACIONES.F_GRABACONDUCTORES(PNRIESGO, PNORDEN, PSPERSON,
	// PCSEXPER, PFNACIMI, PNNUMNIF, PTNOMBRE, PTNOMBRE1, PTNOMBRE2, PTAPELLI1,
	// PTAPELLI2, PCTIPIDE, PCTIPPER, PCPRINCIPAL, PCDOMICI, PCPAIS, PCPROVIN,
	// PCPOBLAC, PCOCUPACION, PEXPER_MANUAL, PEXPER_CEXPER, PEXPER_SINIE,
	// PEXPER_SINIE_MANUAL, PNPUNTOS, PFCARNET)
	private HashMap callPAC_IAX_SIMULACIONES__F_GRABACONDUCTORES(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCSEXPER,
			java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE, String pPTNOMBRE1, String pPTNOMBRE2,
			String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCTIPPER,
			java.math.BigDecimal pPCPRINCIPAL, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCOCUPACION,
			java.math.BigDecimal pPEXPER_MANUAL, java.math.BigDecimal pPEXPER_CEXPER,
			java.math.BigDecimal pPEXPER_SINIE, java.math.BigDecimal pPEXPER_SINIE_MANUAL,
			java.math.BigDecimal pPNPUNTOS, java.sql.Date pPFCARNET) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GRABACONDUCTORES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN", "pPSPERSON", "pPCSEXPER", "pPFNACIMI", "pPNNUMNIF",
				"pPTNOMBRE", "pPTNOMBRE1", "pPTNOMBRE2", "pPTAPELLI1", "pPTAPELLI2", "pPCTIPIDE", "pPCTIPPER",
				"pPCPRINCIPAL", "pPCDOMICI", "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPCOCUPACION", "pPEXPER_MANUAL",
				"pPEXPER_CEXPER", "pPEXPER_SINIE", "pPEXPER_SINIE_MANUAL", "pPNPUNTOS", "pPFCARNET" },
				new Object[] { pPNRIESGO, pPNORDEN, pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTNOMBRE1,
						pPTNOMBRE2, pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER, pPCPRINCIPAL, pPCDOMICI, pPCPAIS,
						pPCPROVIN, pPCPOBLAC, pPCOCUPACION, pPEXPER_MANUAL, pPEXPER_CEXPER, pPEXPER_SINIE,
						pPEXPER_SINIE_MANUAL, pPNPUNTOS, pPFCARNET });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPCSEXPER);
		cStmt.setObject(6, pPFNACIMI);
		cStmt.setObject(7, pPNNUMNIF);
		cStmt.setObject(8, pPTNOMBRE);
		cStmt.setObject(9, pPTNOMBRE1);
		cStmt.setObject(10, pPTNOMBRE2);
		cStmt.setObject(11, pPTAPELLI1);
		cStmt.setObject(12, pPTAPELLI2);
		cStmt.setObject(13, pPCTIPIDE);
		cStmt.setObject(14, pPCTIPPER);
		cStmt.setObject(15, pPCPRINCIPAL);
		cStmt.setObject(16, pPCDOMICI);
		cStmt.setObject(17, pPCPAIS);
		cStmt.setObject(18, pPCPROVIN);
		cStmt.setObject(19, pPCPOBLAC);
		cStmt.setObject(20, pPCOCUPACION);
		cStmt.setObject(21, pPEXPER_MANUAL);
		cStmt.setObject(22, pPEXPER_CEXPER);
		cStmt.setObject(23, pPEXPER_SINIE);
		cStmt.setObject(24, pPEXPER_SINIE_MANUAL);
		cStmt.setObject(25, pPNPUNTOS);
		cStmt.setObject(26, pPFCARNET);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(27, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(27));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GRABACONDUCTORES(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCSEXPER,
			java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE, String pPTNOMBRE1, String pPTNOMBRE2,
			String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCTIPPER,
			java.math.BigDecimal pPCPRINCIPAL, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCOCUPACION,
			java.math.BigDecimal pPEXPER_MANUAL, java.math.BigDecimal pPEXPER_CEXPER,
			java.math.BigDecimal pPEXPER_SINIE, java.math.BigDecimal pPEXPER_SINIE_MANUAL,
			java.math.BigDecimal pPNPUNTOS, java.sql.Date pPFCARNET) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GRABACONDUCTORES(pPNRIESGO, pPNORDEN, pPSPERSON, pPCSEXPER, pPFNACIMI,
				pPNNUMNIF, pPTNOMBRE, pPTNOMBRE1, pPTNOMBRE2, pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER,
				pPCPRINCIPAL, pPCDOMICI, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCOCUPACION, pPEXPER_MANUAL, pPEXPER_CEXPER,
				pPEXPER_SINIE, pPEXPER_SINIE_MANUAL, pPNPUNTOS, pPFCARNET);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_GRABACONDUCTORES

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GET_PREGASGESTOM() throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GET_PREGASGESTOM();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_GET_PREGASGESTOM

	// --START-PAC_IAX_SIMULACIONES.F_GRABAASEGURADOS(PSPERSON, PCSEXPER, PFNACIMI,
	// PNNUMNIF, PTNOMBRE, PTNOMBRE1, PTNOMBRE2, PTAPELLI1, PTAPELLI2, PCTIPIDE,
	// PCTIPPER, PCESTCIV)
	private HashMap callPAC_IAX_SIMULACIONES__F_GRABAASEGURADOS(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE,
			String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE,
			java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCESTCIV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GRABAASEGURADOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCSEXPER", "pPFNACIMI", "pPNNUMNIF", "pPTNOMBRE", "pPTNOMBRE1",
						"pPTNOMBRE2", "pPTAPELLI1", "pPTAPELLI2", "pPCTIPIDE", "pPCTIPPER", "pPCESTCIV" },
				new Object[] { pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTNOMBRE1, pPTNOMBRE2,
						pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER, pPCESTCIV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCSEXPER);
		cStmt.setObject(4, pPFNACIMI);
		cStmt.setObject(5, pPNNUMNIF);
		cStmt.setObject(6, pPTNOMBRE);
		cStmt.setObject(7, pPTNOMBRE1);
		cStmt.setObject(8, pPTNOMBRE2);
		cStmt.setObject(9, pPTAPELLI1);
		cStmt.setObject(10, pPTAPELLI2);
		cStmt.setObject(11, pPCTIPIDE);
		cStmt.setObject(12, pPCTIPPER);
		cStmt.setObject(13, pPCESTCIV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GRABAASEGURADOS(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE,
			String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE,
			java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCESTCIV) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GRABAASEGURADOS(pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE,
				pPTNOMBRE1, pPTNOMBRE2, pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER, pPCESTCIV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_GRABAASEGURADOS

	// --START-PAC_IAX_SIMULACIONES.F_GRABATOMADORES(PSPERSON, PCSEXPER, PFNACIMI,
	// PNNUMNIF, PTNOMBRE, PTNOMBRE1, PTNOMBRE2, PTAPELLI1, PTAPELLI2, PCTIPIDE,
	// PCTIPPER, PCDOMICI, PCPOBLAC, PCPROVIN, PCPAIS, PCOCUPACION, PCESTCIV)
	private HashMap callPAC_IAX_SIMULACIONES__F_GRABATOMADORES(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE,
			String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE,
			java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCOCUPACION,
			java.math.BigDecimal pPCESTCIV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GRABATOMADORES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCSEXPER", "pPFNACIMI", "pPNNUMNIF", "pPTNOMBRE", "pPTNOMBRE1",
						"pPTNOMBRE2", "pPTAPELLI1", "pPTAPELLI2", "pPCTIPIDE", "pPCTIPPER", "pPCDOMICI", "pPCPOBLAC",
						"pPCPROVIN", "pPCPAIS", "pPCOCUPACION", "pPCESTCIV" },
				new Object[] { pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTNOMBRE1, pPTNOMBRE2,
						pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER, pPCDOMICI, pPCPOBLAC, pPCPROVIN, pPCPAIS,
						pPCOCUPACION, pPCESTCIV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCSEXPER);
		cStmt.setObject(4, pPFNACIMI);
		cStmt.setObject(5, pPNNUMNIF);
		cStmt.setObject(6, pPTNOMBRE);
		cStmt.setObject(7, pPTNOMBRE1);
		cStmt.setObject(8, pPTNOMBRE2);
		cStmt.setObject(9, pPTAPELLI1);
		cStmt.setObject(10, pPTAPELLI2);
		cStmt.setObject(11, pPCTIPIDE);
		cStmt.setObject(12, pPCTIPPER);
		cStmt.setObject(13, pPCDOMICI);
		cStmt.setObject(14, pPCPOBLAC);
		cStmt.setObject(15, pPCPROVIN);
		cStmt.setObject(16, pPCPAIS);
		cStmt.setObject(17, pPCOCUPACION);
		cStmt.setObject(18, pPCESTCIV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	private HashMap callPAC_IAX_SIMULACIONES__F_TESTTOMADORES(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE,
			String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE,
			java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCOCUPACION,
			java.math.BigDecimal pPCESTCIV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_TESTTOMADORES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCSEXPER", "pPFNACIMI", "pPNNUMNIF", "pPTNOMBRE", "pPTNOMBRE1",
						"pPTNOMBRE2", "pPTAPELLI1", "pPTAPELLI2", "pPCTIPIDE", "pPCTIPPER", "pPCDOMICI", "pPCPOBLAC",
						"pPCPROVIN", "pPCPAIS", "pPCOCUPACION", "pPCESTCIV" },
				new Object[] { pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTNOMBRE1, pPTNOMBRE2,
						pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER, pPCDOMICI, pPCPOBLAC, pPCPROVIN, pPCPAIS,
						pPCOCUPACION, pPCESTCIV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCSEXPER);
		cStmt.setObject(4, pPFNACIMI);
		cStmt.setObject(5, pPNNUMNIF);
		cStmt.setObject(6, pPTNOMBRE);
		cStmt.setObject(7, pPTNOMBRE1);
		cStmt.setObject(8, pPTNOMBRE2);
		cStmt.setObject(9, pPTAPELLI1);
		cStmt.setObject(10, pPTAPELLI2);
		cStmt.setObject(11, pPCTIPIDE);
		cStmt.setObject(12, pPCTIPPER);
		cStmt.setObject(13, pPCDOMICI);
		cStmt.setObject(14, pPCPOBLAC);
		cStmt.setObject(15, pPCPROVIN);
		cStmt.setObject(16, pPCPAIS);
		cStmt.setObject(17, pPCOCUPACION);
		cStmt.setObject(18, pPCESTCIV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_TESTTOMADORES(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE,
			String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE,
			java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCOCUPACION,
			java.math.BigDecimal pPCESTCIV) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_TESTTOMADORES(pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE,
				pPTNOMBRE1, pPTNOMBRE2, pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER, pPCDOMICI, pPCPOBLAC, pPCPROVIN,
				pPCPAIS, pPCOCUPACION, pPCESTCIV);// AXIS-WLS1SERVER-Ready
	}

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GRABATOMADORES(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF, String pPTNOMBRE,
			String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2, java.math.BigDecimal pPCTIPIDE,
			java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPOBLAC,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCOCUPACION,
			java.math.BigDecimal pPCESTCIV) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GRABATOMADORES(pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE,
				pPTNOMBRE1, pPTNOMBRE2, pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER, pPCDOMICI, pPCPOBLAC, pPCPROVIN,
				pPCPAIS, pPCOCUPACION, pPCESTCIV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_GRABATOMADORES

	// --START-PAC_IAX_SIMULACIONES.F_GRABARSIMULACION()
	private HashMap callPAC_IAX_SIMULACIONES__F_GRABARSIMULACION() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GRABARSIMULACION(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GRABARSIMULACION() throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GRABARSIMULACION();
	}

	// --END-PAC_IAX_SIMULACIONES.F_GRABARSIMULACION
	// --START-PAC_IAX_SIMULACIONES.F_RECUPERASIMUL(PSOLICIT)
	private HashMap callPAC_IAX_SIMULACIONES__F_RECUPERASIMUL(java.math.BigDecimal pPSOLICIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_RECUPERASIMUL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSOLICIT" }, new Object[] { pPSOLICIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSOLICIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OSPRODUC"
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
			retVal.put("OSPRODUC", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OSPRODUC", null);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_RECUPERASIMUL(java.math.BigDecimal pPSOLICIT) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_RECUPERASIMUL(pPSOLICIT);
	}

	// --END-PAC_IAX_SIMULACIONES.F_RECUPERASIMUL
	// --START-PAC_IAX_SIMULACIONES.F_VALIDACIONES(PTIPO)
	private HashMap callPAC_IAX_SIMULACIONES__F_VALIDACIONES(String pPTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_VALIDACIONES(?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO" }, new Object[] { pPTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_VALIDACIONES(String pPTIPO) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_VALIDACIONES(pPTIPO);
	}

	// --END-PAC_IAX_SIMULACIONES.F_VALIDACIONES
	// --START-PAC_IAX_SIMULACIONES.LIMPIARTEMPORALES()
	private HashMap callPAC_IAX_SIMULACIONES__LIMPIARTEMPORALES() throws Exception {
		String callQuery = "{call PAC_IAX_SIMULACIONES.LIMPIARTEMPORALES()}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIMULACIONES__LIMPIARTEMPORALES() throws Exception {
		return this.callPAC_IAX_SIMULACIONES__LIMPIARTEMPORALES();
	}
	// --END-PAC_IAX_SIMULACIONES.LIMPIARTEMPORALES

	private HashMap callPAC_IAX_SIMULACIONES__F_ELIMINATOMADOR(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_ELIMINATOMADOR(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_ELIMINATOMADOR(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_ELIMINATOMADOR(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIMULACIONES.F_ELIMINATOMADOR
	// --START-PAC_IAX_SIMULACIONES.F_GRABABENEFICIARIOS(PNRIESGO, PSPERSON,
	// PCSEXPER, PFNACIMI, PNNUMNIF, PTNOMBRE, PTNOMBRE1, PTNOMBRE2, PTAPELLI1,
	// PTAPELLI2, PCTIPIDE, PCTIPPER)
	private HashMap callPAC_IAX_SIMULACIONES__F_GRABABENEFICIARIOS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF,
			String pPTNOMBRE, String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2,
			java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCTIPPER) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GRABABENEFICIARIOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRIESGO", "pPSPERSON", "pPCSEXPER", "pPFNACIMI", "pPNNUMNIF", "pPTNOMBRE",
						"pPTNOMBRE1", "pPTNOMBRE2", "pPTAPELLI1", "pPTAPELLI2", "pPCTIPIDE", "pPCTIPPER" },
				new Object[] { pPNRIESGO, pPSPERSON, pPCSEXPER, pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTNOMBRE1, pPTNOMBRE2,
						pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPCSEXPER);
		cStmt.setObject(5, pPFNACIMI);
		cStmt.setObject(6, pPNNUMNIF);
		cStmt.setObject(7, pPTNOMBRE);
		cStmt.setObject(8, pPTNOMBRE1);
		cStmt.setObject(9, pPTNOMBRE2);
		cStmt.setObject(10, pPTAPELLI1);
		cStmt.setObject(11, pPTAPELLI2);
		cStmt.setObject(12, pPCTIPIDE);
		cStmt.setObject(13, pPCTIPPER);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PNORDEN"
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
			retVal.put("PNORDEN", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PNORDEN", null);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GRABABENEFICIARIOS(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPNNUMNIF,
			String pPTNOMBRE, String pPTNOMBRE1, String pPTNOMBRE2, String pPTAPELLI1, String pPTAPELLI2,
			java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCTIPPER) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GRABABENEFICIARIOS(pPNRIESGO, pPSPERSON, pPCSEXPER, pPFNACIMI,
				pPNNUMNIF, pPTNOMBRE, pPTNOMBRE1, pPTNOMBRE2, pPTAPELLI1, pPTAPELLI2, pPCTIPIDE, pPCTIPPER);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_SIMULACIONES.F_GRABABENEFICIARIOS
	// --START-PAC_IAX_SIMULACIONES.F_INICIA_PSU(P_TABLAS, P_SSEGURO, P_ACCION,
	// P_CAMPO)
	private HashMap callPAC_IAX_SIMULACIONES__F_INICIA_PSU(String pP_TABLAS, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_ACCION, String pP_CAMPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_INICIA_PSU(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_TABLAS", "pP_SSEGURO", "pP_ACCION", "pP_CAMPO" },
				new Object[] { pP_TABLAS, pP_SSEGURO, pP_ACCION, pP_CAMPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TABLAS);
		cStmt.setObject(3, pP_SSEGURO);
		cStmt.setObject(4, pP_ACCION);
		cStmt.setObject(5, pP_CAMPO);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_INICIA_PSU(String pP_TABLAS, java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_ACCION, String pP_CAMPO) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_INICIA_PSU(pP_TABLAS, pP_SSEGURO, pP_ACCION, pP_CAMPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_INICIA_PSU

	// --START-PAC_IAX_SIMULACIONES.F_ELIMINACONDUCTOR(PSPERSON)
	private HashMap callPAC_IAX_SIMULACIONES__F_ELIMINACONDUCTOR(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_ELIMINACONDUCTOR(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_ELIMINACONDUCTOR(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_ELIMINACONDUCTOR(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_ELIMINACONDUCTOR

	// --START-PAC_IAX_SIMULACIONES.F_RECHAZAR_SIMUL(PSSEGURO)
	private HashMap callPAC_IAX_SIMULACIONES__F_RECHAZAR_SIMUL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_RECHAZAR_SIMUL(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_RECHAZAR_SIMUL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_RECHAZAR_SIMUL(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_RECHAZAR_SIMUL

	// --START-PAC_IAX_SIMULACIONES.F_GET_SITUACION_SIMUL(PSSEGURO)
	private HashMap callPAC_IAX_SIMULACIONES__F_GET_SITUACION_SIMUL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIMULACIONES.F_GET_SITUACION_SIMUL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTSITSIMUL"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCSITSIMUL"
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
			retVal.put("PTSITSIMUL", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTSITSIMUL", null);
		}
		try {
			retVal.put("PCSITSIMUL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCSITSIMUL", null);
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

	public HashMap ejecutaPAC_IAX_SIMULACIONES__F_GET_SITUACION_SIMUL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SIMULACIONES__F_GET_SITUACION_SIMUL(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIMULACIONES.F_GET_SITUACION_SIMUL

}
