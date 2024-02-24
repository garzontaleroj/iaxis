package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PRESTAMOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRESTAMOS.class);
	private Connection conn = null;

	public PAC_IAX_PRESTAMOS(Connection conn) {
		this.conn = conn;
	}
	// --START-PAC_IAX_PRESTAMOS.F_ANULA_PRESTAMO(PCTAPRES)

	private HashMap callPAC_IAX_PRESTAMOS__F_ANULA_PRESTAMO(String pPCTAPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_ANULA_PRESTAMO(?, ?)}";

		logCall(callQuery, new String[] { "pPCTAPRES" }, new Object[] { pPCTAPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTAPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_ANULA_PRESTAMO(String pPCTAPRES) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_ANULA_PRESTAMO(pPCTAPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_ANULA_PRESTAMO
	// --START-PAC_IAX_PRESTAMOS.F_CONSULTA_LSTPRST(PSSEGURO, PNRIESGO, PCTAPRES)

	private HashMap callPAC_IAX_PRESTAMOS__F_CONSULTA_LSTPRST(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_CONSULTA_LSTPRST(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCTAPRES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCTAPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCTAPRES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_CONSULTA_LSTPRST(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_CONSULTA_LSTPRST(pPSSEGURO, pPNRIESGO, pPCTAPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_CONSULTA_LSTPRST
	// --START-PAC_IAX_PRESTAMOS.F_CONSULTA_PRESTA(PCRAMO, PSPRODUC, PNPOLIZA,
	// PNCERTIF, PCTAPRES, PNNUMIDE, PSNIP, PBUSCAR, PTIPOPER, PCACTIVI, PFILTRO)

	private HashMap callPAC_IAX_PRESTAMOS__F_CONSULTA_PRESTA(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPCTAPRES, String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPTIPOPER,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPFILTRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_CONSULTA_PRESTA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPCTAPRES", "pPNNUMIDE", "pPSNIP",
						"pPBUSCAR", "pPTIPOPER", "pPCACTIVI", "pPFILTRO" },
				new Object[] { pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPCTAPRES, pPNNUMIDE, pPSNIP, pPBUSCAR,
						pPTIPOPER, pPCACTIVI, pPFILTRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPNPOLIZA);
		cStmt.setObject(5, pPNCERTIF);
		cStmt.setObject(6, pPCTAPRES);
		cStmt.setObject(7, pPNNUMIDE);
		cStmt.setObject(8, pPSNIP);
		cStmt.setObject(9, pPBUSCAR);
		cStmt.setObject(10, pPTIPOPER);
		cStmt.setObject(11, pPCACTIVI);
		cStmt.setObject(12, pPFILTRO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_CONSULTA_PRESTA(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPCTAPRES, String pPNNUMIDE, String pPSNIP, String pPBUSCAR, java.math.BigDecimal pPTIPOPER,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPFILTRO) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_CONSULTA_PRESTA(pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPCTAPRES,
				pPNNUMIDE, pPSNIP, pPBUSCAR, pPTIPOPER, pPCACTIVI, pPFILTRO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_CONSULTA_PRESTA
	// --START-PAC_IAX_PRESTAMOS.F_GET_DETPRESTAMO(PSSEGURO, PNRIESGO, PCTAPRES)

	private HashMap callPAC_IAX_PRESTAMOS__F_GET_DETPRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_GET_DETPRESTAMO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCTAPRES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCTAPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCTAPRES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRESTAMO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	private HashMap callPAC_IAX_PRESTAMOS__F_GET_DETPRESTAMO_cuota(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES, java.math.BigDecimal pCUOTADESC,
			java.math.BigDecimal pHASTAHOY) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_GET_DETPRESTAMO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCTAPRES", "pCUOTADESC", "pHASTAHOY" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCTAPRES, pCUOTADESC, pHASTAHOY });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCTAPRES);
		cStmt.setObject(6, pCUOTADESC);
		cStmt.setObject(7, pHASTAHOY);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRESTAMO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_GET_DETPRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_GET_DETPRESTAMO(pPSSEGURO, pPNRIESGO, pPCTAPRES); // AXIS-WLS1SERVER-Ready
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_GET_DETPRESTAMO_cuota(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES, java.math.BigDecimal pCUOTADESC,
			java.math.BigDecimal pHASTAHOY) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_GET_DETPRESTAMO_cuota(pPSSEGURO, pPNRIESGO, pPCTAPRES, pCUOTADESC,
				pHASTAHOY); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_GET_DETPRESTAMO
	// --START-PAC_IAX_PRESTAMOS.F_GET_LSTPRESTAMOS(PSSEGURO, PNRIESGO)

	private HashMap callPAC_IAX_PRESTAMOS__F_GET_LSTPRESTAMOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_GET_LSTPRESTAMOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO" }, new Object[] { pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_GET_LSTPRESTAMOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_GET_LSTPRESTAMOS(pPSSEGURO, pPNRIESGO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_GET_LSTPRESTAMOS
	// --START-PAC_IAX_PRESTAMOS.F_GET_PRESTAMO()

	private HashMap callPAC_IAX_PRESTAMOS__F_GET_PRESTAMO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_GET_PRESTAMO(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRESTAMO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_GET_PRESTAMO() throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_GET_PRESTAMO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_GET_PRESTAMO
	// --START-PAC_IAX_PRESTAMOS.F_INICIALIZA_PRESTAMO(PSSEGURO, PNRIESGO, PCTAPRES)

	private HashMap callPAC_IAX_PRESTAMOS__F_INICIALIZA_PRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_INICIALIZA_PRESTAMO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPCTAPRES" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPCTAPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCTAPRES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRESTAMO".toUpperCase())); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_INICIALIZA_PRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPCTAPRES) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_INICIALIZA_PRESTAMO(pPSSEGURO, pPNRIESGO, pPCTAPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_INICIALIZA_PRESTAMO
	// --START-PAC_IAX_PRESTAMOS.F_INSERTAR_PRESTAMO(PSSEGURO, PNRIESGO, PNMOVIMI,
	// PCTAPRES, PFINIPREST, PFFINPREST, PFFECPAG, PICAPITAL, PCMONEDA, PPORCEN,
	// PCTIPO, PCTIPBAN, PCBANCAR, PF1CUOTA)

	private HashMap callPAC_IAX_PRESTAMOS__F_INSERTAR_PRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPCTAPRES, java.sql.Date pPFINIPREST,
			java.sql.Date pPFFINPREST, java.sql.Date pPFFECPAG, java.math.BigDecimal pPICAPITAL, String pPCMONEDA,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.sql.Date pPF1CUOTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_INSERTAR_PRESTAMO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPNMOVIMI", "pPCTAPRES", "pPFINIPREST", "pPFFINPREST",
						"pPFFECPAG", "pPICAPITAL", "pPCMONEDA", "pPPORCEN", "pPCTIPO", "pPCTIPBAN", "pPCBANCAR",
						"pPF1CUOTA" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPCTAPRES, pPFINIPREST, pPFFINPREST, pPFFECPAG,
						pPICAPITAL, pPCMONEDA, pPPORCEN, pPCTIPO, pPCTIPBAN, pPCBANCAR, pPF1CUOTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPCTAPRES);
		cStmt.setObject(6, pPFINIPREST);
		cStmt.setObject(7, pPFFINPREST);
		cStmt.setObject(8, pPFFECPAG);
		cStmt.setObject(9, pPICAPITAL);
		cStmt.setObject(10, pPCMONEDA);
		cStmt.setObject(11, pPPORCEN);
		cStmt.setObject(12, pPCTIPO);
		cStmt.setObject(13, pPCTIPBAN);
		cStmt.setObject(14, pPCBANCAR);
		cStmt.setObject(15, pPF1CUOTA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_INSERTAR_PRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPCTAPRES, java.sql.Date pPFINIPREST,
			java.sql.Date pPFFINPREST, java.sql.Date pPFFECPAG, java.math.BigDecimal pPICAPITAL, String pPCMONEDA,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.sql.Date pPF1CUOTA) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_INSERTAR_PRESTAMO(pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPCTAPRES, pPFINIPREST,
				pPFFINPREST, pPFFECPAG, pPICAPITAL, pPCMONEDA, pPPORCEN, pPCTIPO, pPCTIPBAN, pPCBANCAR, pPF1CUOTA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_INSERTAR_PRESTAMO

	// --START-PAC_IAX_PRESTAMOS.F_INSERTAR_PRESTAMO(PSSEGURO, PNRIESGO, PNMOVIMI,
	// PCTAPRES, PFINIPREST, PFFINPREST, PFFECPAG, PICAPITAL, PCMONEDA, PPORCEN,
	// PCTIPO, PCTIPBAN, PCBANCAR, PF1CUOTA, CFORPAG)

	private HashMap callPAC_IAX_PRESTAMOS__F_INSERTAR_PRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPCTAPRES, java.sql.Date pPFINIPREST,
			java.sql.Date pPFFINPREST, java.sql.Date pPFFECPAG, java.math.BigDecimal pPICAPITAL, String pPCMONEDA,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.sql.Date pPF1CUOTA, java.math.BigDecimal pCFORPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_INSERTAR_PRESTAMO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPNMOVIMI", "pPCTAPRES", "pPFINIPREST", "pPFFINPREST",
						"pPFFECPAG", "pPICAPITAL", "pPCMONEDA", "pPPORCEN", "pPCTIPO", "pPCTIPBAN", "pPCBANCAR",
						"pPF1CUOTA", "pCFORPAG" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPCTAPRES, pPFINIPREST, pPFFINPREST, pPFFECPAG,
						pPICAPITAL, pPCMONEDA, pPPORCEN, pPCTIPO, pPCTIPBAN, pPCBANCAR, pPF1CUOTA, pCFORPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPCTAPRES);
		cStmt.setObject(6, pPFINIPREST);
		cStmt.setObject(7, pPFFINPREST);
		cStmt.setObject(8, pPFFECPAG);
		cStmt.setObject(9, pPICAPITAL);
		cStmt.setObject(10, pPCMONEDA);
		cStmt.setObject(11, pPPORCEN);
		cStmt.setObject(12, pPCTIPO);
		cStmt.setObject(13, pPCTIPBAN);
		cStmt.setObject(14, pPCBANCAR);
		cStmt.setObject(15, pPF1CUOTA);
		cStmt.setObject(16, pCFORPAG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_INSERTAR_PRESTAMO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, String pPCTAPRES, java.sql.Date pPFINIPREST,
			java.sql.Date pPFFINPREST, java.sql.Date pPFFECPAG, java.math.BigDecimal pPICAPITAL, String pPCMONEDA,
			java.math.BigDecimal pPPORCEN, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCTIPBAN,
			String pPCBANCAR, java.sql.Date pPF1CUOTA, java.math.BigDecimal pCFORPAG) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_INSERTAR_PRESTAMO(pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPCTAPRES, pPFINIPREST,
				pPFFINPREST, pPFFECPAG, pPICAPITAL, pPCMONEDA, pPPORCEN, pPCTIPO, pPCTIPBAN, pPCBANCAR, pPF1CUOTA,
				pCFORPAG); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_INSERTAR_PRESTAMO

	// --START-PAC_IAX_PRESTAMOS.F_AUTORIZAR(PCTAPRES, PFALTA, PFAUTORIZA, PNMOVIMI,
	// PFFECPAG, PICAPITAL)

	private HashMap callPAC_IAX_PRESTAMOS__F_AUTORIZAR(String pPCTAPRES, java.sql.Date pPFALTA,
			java.sql.Date pPFAUTORIZA, java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFFECPAG,
			java.math.BigDecimal pPICAPITAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_AUTORIZAR(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTAPRES", "pPFALTA", "pPFAUTORIZA", "pPNMOVIMI", "pPFFECPAG", "pPICAPITAL" },
				new Object[] { pPCTAPRES, pPFALTA, pPFAUTORIZA, pPNMOVIMI, pPFFECPAG, pPICAPITAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTAPRES);
		cStmt.setObject(3, pPFALTA);
		cStmt.setObject(4, pPFAUTORIZA);
		cStmt.setObject(5, pPNMOVIMI);
		cStmt.setObject(6, pPFFECPAG);
		cStmt.setObject(7, pPICAPITAL);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_AUTORIZAR(String pPCTAPRES, java.sql.Date pPFALTA,
			java.sql.Date pPFAUTORIZA, java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFFECPAG,
			java.math.BigDecimal pPICAPITAL) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_AUTORIZAR(pPCTAPRES, pPFALTA, pPFAUTORIZA, pPNMOVIMI, pPFFECPAG,
				pPICAPITAL); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_AUTORIZAR

	// --START-PAC_IAX_PRESTAMOS.F_REVERSAR_PRESTAMO(PCTAPRES, PFALTA, PFRECHAZA,
	// PNMOVIMI)
	private HashMap callPAC_IAX_PRESTAMOS__F_REVERSAR_PRESTAMO(String pPCTAPRES, java.sql.Date pPFALTA,
			java.sql.Date pPFRECHAZA, java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_REVERSAR_PRESTAMO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTAPRES", "pPFALTA", "pPFRECHAZA", "pPNMOVIMI" },
				new Object[] { pPCTAPRES, pPFALTA, pPFRECHAZA, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTAPRES);
		cStmt.setObject(3, pPFALTA);
		cStmt.setObject(4, pPFRECHAZA);
		cStmt.setObject(5, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_REVERSAR_PRESTAMO(String pPCTAPRES, java.sql.Date pPFALTA,
			java.sql.Date pPFRECHAZA, java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_REVERSAR_PRESTAMO(pPCTAPRES, pPFALTA, pPFRECHAZA, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_REVERSAR_PRESTAMO

	// --START-PAC_IAX_PRESTAMOS.F_PERMITE_REVERSAR(PCTAPRES)
	private HashMap callPAC_IAX_PRESTAMOS__F_PERMITE_REVERSAR(String pPCTAPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PRESTAMOS.F_PERMITE_REVERSAR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTAPRES" }, new Object[] { pPCTAPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTAPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PSEPERMITE"
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
			retVal.put("PSEPERMITE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PSEPERMITE", null);
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

	public HashMap ejecutaPAC_IAX_PRESTAMOS__F_PERMITE_REVERSAR(String pPCTAPRES) throws Exception {
		return this.callPAC_IAX_PRESTAMOS__F_PERMITE_REVERSAR(pPCTAPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PRESTAMOS.F_PERMITE_REVERSAR

}
