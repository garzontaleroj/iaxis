package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_TRAMITADORES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_TRAMITADORES.class);
	private Connection conn = null;

	public PAC_IAX_TRAMITADORES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_TRAMITADORES.F_CONSULTA_LSTSINI(PNPOLIZA, PNCERTIF, PNSINIES,
	// PCESTSIN, PFILTRO, PCRAMO, PSPRODUC, PFSINIES, PCTRAMI, PCACTIVI)
	private HashMap callPAC_IAX_TRAMITADORES__F_CONSULTA_LSTSINI(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFSINIES, String pPCTRAMI, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRAMITADORES.F_CONSULTA_LSTSINI(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPCESTSIN", "pPFILTRO", "pPCRAMO", "pPSPRODUC",
						"pPFSINIES", "pPCTRAMI", "pPCACTIVI" },
				new Object[] { pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPFILTRO, pPCRAMO, pPSPRODUC, pPFSINIES,
						pPCTRAMI, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPCESTSIN);
		cStmt.setObject(6, pPFILTRO);
		cStmt.setObject(7, pPCRAMO);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPFSINIES);
		cStmt.setObject(10, pPCTRAMI);
		cStmt.setObject(11, pPCACTIVI);
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

	public HashMap ejecutaPAC_IAX_TRAMITADORES__F_CONSULTA_LSTSINI(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPNSINIES, java.math.BigDecimal pPCESTSIN,
			java.math.BigDecimal pPFILTRO, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.sql.Date pPFSINIES, String pPCTRAMI, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_TRAMITADORES__F_CONSULTA_LSTSINI(pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTSIN, pPFILTRO,
				pPCRAMO, pPSPRODUC, pPFSINIES, pPCTRAMI, pPCACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRAMITADORES.F_CONSULTA_LSTSINI

	// --START-PAC_IAX_TRAMITADORES.F_GET_TRAMITADOR(PCTRAMITAD)
	private HashMap callPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR(String pPCTRAMITAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRAMITADORES.F_GET_TRAMITADOR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTRAMITAD" }, new Object[] { pPCTRAMITAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTRAMITAD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTTRAMITAD"
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
			retVal.put("PTTRAMITAD", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTTRAMITAD", null);
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

	public HashMap ejecutaPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR(String pPCTRAMITAD) throws Exception {
		return this.callPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR(pPCTRAMITAD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRAMITADORES.F_GET_TRAMITADOR

	// --START-PAC_IAX_TRAMITADORES.F_CAMBIO_TRAMITADOR(PSINIESTROS, PCUNITRA,
	// PCTRAMITAD)
	private HashMap callPAC_IAX_TRAMITADORES__F_CAMBIO_TRAMITADOR(String pPSINIESTROS, String pPCUNITRA,
			String pPCTRAMITAD) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRAMITADORES.F_CAMBIO_TRAMITADOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINIESTROS", "pPCUNITRA", "pPCTRAMITAD" },
				new Object[] { pPSINIESTROS, pPCUNITRA, pPCTRAMITAD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSINIESTROS);
		cStmt.setObject(3, pPCUNITRA);
		cStmt.setObject(4, pPCTRAMITAD);
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

	public HashMap ejecutaPAC_IAX_TRAMITADORES__F_CAMBIO_TRAMITADOR(String pPSINIESTROS, String pPCUNITRA,
			String pPCTRAMITAD) throws Exception {
		return this.callPAC_IAX_TRAMITADORES__F_CAMBIO_TRAMITADOR(pPSINIESTROS, pPCUNITRA, pPCTRAMITAD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRAMITADORES.F_CAMBIO_TRAMITADOR

	// joan Bug 0024964
	// --START-PAC_IAX_TRAMITADORES.F_GET_TRAMITADOR_ALTA(PCEMPRES)
	private HashMap callPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR_ALTA(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_TRAMITADORES.F_GET_TRAMITADOR_ALTA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR_ALTA(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR_ALTA(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_TRAMITADORES.F_GET_TRAMITADOR_ALTA

}
