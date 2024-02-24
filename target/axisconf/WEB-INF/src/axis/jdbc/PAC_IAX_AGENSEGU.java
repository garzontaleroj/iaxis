//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_AGENSEGU extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENSEGU.class);
	private Connection conn = null;

	public PAC_IAX_AGENSEGU(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AGENSEGU.F_ANULA_APUNTE(PSSEGURO, PNLINEA)
	private HashMap callPAC_IAX_AGENSEGU__F_ANULA_APUNTE(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNLINEA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENSEGU.F_ANULA_APUNTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNLINEA" }, new Object[] { pPSSEGURO, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNLINEA);
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

	public HashMap ejecutaPAC_IAX_AGENSEGU__F_ANULA_APUNTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNLINEA) throws Exception {
		return this.callPAC_IAX_AGENSEGU__F_ANULA_APUNTE(pPSSEGURO, pPNLINEA);
	}

	// --END-PAC_IAX_AGENSEGU.F_ANULA_APUNTE
	// --START-PAC_IAX_AGENSEGU.F_GET_APUNTESPENDIENTES()
	private HashMap callPAC_IAX_AGENSEGU__F_GET_APUNTESPENDIENTES() throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENSEGU.F_GET_APUNTESPENDIENTES(?)}";

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

	public HashMap ejecutaPAC_IAX_AGENSEGU__F_GET_APUNTESPENDIENTES() throws Exception {
		return this.callPAC_IAX_AGENSEGU__F_GET_APUNTESPENDIENTES();
	}

	// --END-PAC_IAX_AGENSEGU.F_GET_APUNTESPENDIENTES
	// --START-PAC_IAX_AGENSEGU.F_GET_CONSULTAAPUNTES(PCTIPREG, PNPOLIZA, PNCERTIF,
	// PNLINEA, PCESTADO, PFAPUNTE, PCUSUARI, PSSEGURO)
	private HashMap callPAC_IAX_AGENSEGU__F_GET_CONSULTAAPUNTES(java.math.BigDecimal pPCTIPREG,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPCESTADO, java.sql.Date pPFAPUNTE, String pPCUSUARI, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENSEGU.F_GET_CONSULTAAPUNTES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPREG", "pPNPOLIZA", "pPNCERTIF", "pPNLINEA", "pPCESTADO", "pPFAPUNTE", "pPCUSUARI",
						"pPSSEGURO" },
				new Object[] { pPCTIPREG, pPNPOLIZA, pPNCERTIF, pPNLINEA, pPCESTADO, pPFAPUNTE, pPCUSUARI, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPREG);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNCERTIF);
		cStmt.setObject(5, pPNLINEA);
		cStmt.setObject(6, pPCESTADO);
		cStmt.setObject(7, pPFAPUNTE);
		cStmt.setObject(8, pPCUSUARI);
		cStmt.setObject(9, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AGENSEGU__F_GET_CONSULTAAPUNTES(java.math.BigDecimal pPCTIPREG,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPCESTADO, java.sql.Date pPFAPUNTE, String pPCUSUARI, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_AGENSEGU__F_GET_CONSULTAAPUNTES(pPCTIPREG, pPNPOLIZA, pPNCERTIF, pPNLINEA, pPCESTADO,
				pPFAPUNTE, pPCUSUARI, pPSSEGURO);
	}
	// --END-PAC_IAX_AGENSEGU.F_GET_CONSULTAAPUNTES

	// --START-PAC_IAX_AGENSEGU.F_GET_DATOSAPUNTE(PSSEGURO, PNLINEA)
	private HashMap callPAC_IAX_AGENSEGU__F_GET_DATOSAPUNTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNLINEA) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENSEGU.F_GET_DATOSAPUNTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNLINEA" }, new Object[] { pPSSEGURO, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNLINEA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGENSEGU".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AGENSEGU__F_GET_DATOSAPUNTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNLINEA) throws Exception {
		return this.callPAC_IAX_AGENSEGU__F_GET_DATOSAPUNTE(pPSSEGURO, pPNLINEA);
	}
	// --END-PAC_IAX_AGENSEGU.F_GET_DATOSAPUNTE

	// --START-PAC_IAX_AGENSEGU.F_SET_DATOSAPUNTE(PNPOLIZA, PSSEGURO, PNLINEA,
	// PTTITULO, PTTEXTOS, PCTIPREG, PCESTADO, PFAPUNTE, PFFINALI, PMODO, PMODE)
	private HashMap callPAC_IAX_AGENSEGU__F_SET_DATOSAPUNTE(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNLINEA, String pPTTITULO, String pPTTEXTOS,
			java.math.BigDecimal pPCTIPREG, java.math.BigDecimal pPCESTADO, java.sql.Date pPFAPUNTE,
			java.sql.Date pPFFINALI, java.math.BigDecimal pPMODO, String pPMODE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENSEGU.F_SET_DATOSAPUNTE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNPOLIZA", "pPSSEGURO", "pPNLINEA", "pPTTITULO", "pPTTEXTOS", "pPCTIPREG", "pPCESTADO",
						"pPFAPUNTE", "pPFFINALI", "pPMODO", "pPMODE" },
				new Object[] { pPNPOLIZA, pPSSEGURO, pPNLINEA, pPTTITULO, pPTTEXTOS, pPCTIPREG, pPCESTADO, pPFAPUNTE,
						pPFFINALI, pPMODO, pPMODE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNLINEA);
		cStmt.setObject(5, pPTTITULO);
		cStmt.setObject(6, pPTTEXTOS);
		cStmt.setObject(7, pPCTIPREG);
		cStmt.setObject(8, pPCESTADO);
		cStmt.setObject(9, pPFAPUNTE);
		cStmt.setObject(10, pPFFINALI);
		cStmt.setObject(11, pPMODO);
		cStmt.setObject(12, pPMODE);
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

	public HashMap ejecutaPAC_IAX_AGENSEGU__F_SET_DATOSAPUNTE(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNLINEA, String pPTTITULO, String pPTTEXTOS,
			java.math.BigDecimal pPCTIPREG, java.math.BigDecimal pPCESTADO, java.sql.Date pPFAPUNTE,
			java.sql.Date pPFFINALI, java.math.BigDecimal pPMODO, String pPMODE) throws Exception {
		return this.callPAC_IAX_AGENSEGU__F_SET_DATOSAPUNTE(pPNPOLIZA, pPSSEGURO, pPNLINEA, pPTTITULO, pPTTEXTOS,
				pPCTIPREG, pPCESTADO, pPFAPUNTE, pPFFINALI, pPMODO, pPMODE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENSEGU.F_SET_DATOSAPUNTE
}
