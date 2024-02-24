package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GESTIONBPM extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_GESTIONBPM.class);
	private Connection conn = null;

	public PAC_IAX_GESTIONBPM(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_GESTIONBPM.F_GET_CASOS(PNCASO_BPM, PNSOLICI_BPM,
	// PCUSUASIGNADO, PCESTADO, PCTIPMOV_BPM, PCRAMO, PSPRODUC, PNPOLIZA, PNCERTIF,
	// PNNUMIDE, PTNOMCOM)
	private HashMap callPAC_IAX_GESTIONBPM__F_GET_CASOS(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM, String pPCUSUASIGNADO, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCTIPMOV_BPM, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPTNOMCOM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_GET_CASOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNCASO_BPM", "pPNSOLICI_BPM", "pPCUSUASIGNADO", "pPCESTADO", "pPCTIPMOV_BPM",
						"pPCRAMO", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPNNUMIDE", "pPTNOMCOM" },
				new Object[] { pPNCASO_BPM, pPNSOLICI_BPM, pPCUSUASIGNADO, pPCESTADO, pPCTIPMOV_BPM, pPCRAMO, pPSPRODUC,
						pPNPOLIZA, pPNCERTIF, pPNNUMIDE, pPTNOMCOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCASO_BPM);
		cStmt.setObject(3, pPNSOLICI_BPM);
		cStmt.setObject(4, pPCUSUASIGNADO);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPCTIPMOV_BPM);
		cStmt.setObject(7, pPCRAMO);
		cStmt.setObject(8, pPSPRODUC);
		cStmt.setObject(9, pPNPOLIZA);
		cStmt.setObject(10, pPNCERTIF);
		cStmt.setObject(11, pPNNUMIDE);
		cStmt.setObject(12, pPTNOMCOM);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_GET_CASOS(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM, String pPCUSUASIGNADO, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCTIPMOV_BPM, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, String pPNNUMIDE, String pPTNOMCOM)
			throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_GET_CASOS(pPNCASO_BPM, pPNSOLICI_BPM, pPCUSUASIGNADO, pPCESTADO,
				pPCTIPMOV_BPM, pPCRAMO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPNNUMIDE, pPTNOMCOM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_GET_CASOS

	// --START-PAC_IAX_GESTIONBPM.F_GET_TOMCASO(PNNUMCASO, PNCASO_BPM, PNSOLICI_BPM)
	private HashMap callPAC_IAX_GESTIONBPM__F_GET_TOMCASO(java.math.BigDecimal pPNNUMCASO,
			java.math.BigDecimal pPNCASO_BPM, java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_GET_TOMCASO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNNUMCASO", "pPNCASO_BPM", "pPNSOLICI_BPM" },
				new Object[] { pPNNUMCASO, pPNCASO_BPM, pPNSOLICI_BPM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMCASO);
		cStmt.setObject(3, pPNCASO_BPM);
		cStmt.setObject(4, pPNSOLICI_BPM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PTNOMCOM"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNNUMCASO_OUT"
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
			retVal.put("PTNOMCOM", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PTNOMCOM", null);
		}
		try {
			retVal.put("PNNUMCASO_OUT", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNNUMCASO_OUT", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_GET_TOMCASO(java.math.BigDecimal pPNNUMCASO,
			java.math.BigDecimal pPNCASO_BPM, java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_GET_TOMCASO(pPNNUMCASO, pPNCASO_BPM, pPNSOLICI_BPM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_GET_TOMCASO

	// --START-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPM(PMODO)
	private HashMap callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPM(String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPM(?, ?)}";

		logCall(callQuery, new String[] { "pPMODO" }, new Object[] { pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMODO);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPM(String pPMODO) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPM(pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPM

	// --START-PAC_IAX_GESTIONBPM.F_VALIDA_TOMADORBPM()
	private HashMap callPAC_IAX_GESTIONBPM__F_VALIDA_TOMADORBPM() throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_VALIDA_TOMADORBPM(?)}";

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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_TOMADORBPM() throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_VALIDA_TOMADORBPM();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_VALIDA_TOMADORBPM

	// --START-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMCERTIF(PNCASO_BPM, PNSOLICI_BPM)
	private HashMap callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCERTIF(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMCERTIF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNCASO_BPM", "pPNSOLICI_BPM" },
				new Object[] { pPNCASO_BPM, pPNSOLICI_BPM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCASO_BPM);
		cStmt.setObject(3, pPNSOLICI_BPM);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCERTIF(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCERTIF(pPNCASO_BPM, pPNSOLICI_BPM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMCERTIF

	// --START-PAC_IAX_GESTIONBPM.F_GET_CASOSUPL(PNPOLIZA, PNCERTIF)
	private HashMap callPAC_IAX_GESTIONBPM__F_GET_CASOSUPL(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_GET_CASOSUPL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNCERTIF" }, new Object[] { pPNPOLIZA, pPNCERTIF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BPM".toUpperCase())); // Valor de "PCASOBPM"
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
			retVal.put("PCASOBPM", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCASOBPM", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_GET_CASOSUPL(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_GET_CASOSUPL(pPNPOLIZA, pPNCERTIF);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_GET_CASOSUPL

	// --START-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMSUPLE(PNCASO_BPM, PNSOLICI_BPM)
	private HashMap callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMSUPLE(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMSUPLE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNCASO_BPM", "pPNSOLICI_BPM" },
				new Object[] { pPNCASO_BPM, pPNSOLICI_BPM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCASO_BPM);
		cStmt.setObject(3, pPNSOLICI_BPM);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMSUPLE(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMSUPLE(pPNCASO_BPM, pPNSOLICI_BPM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMSUPLE

	// --START-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMCARGA(PNCASO_BPM, PNNUMCASO,
	// PFICHERO)
	private HashMap callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCARGA(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNNUMCASO, String pPFICHERO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMCARGA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNCASO_BPM", "pPNNUMCASO", "pPFICHERO" },
				new Object[] { pPNCASO_BPM, pPNNUMCASO, pPFICHERO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCASO_BPM);
		cStmt.setObject(3, pPNNUMCASO);
		cStmt.setObject(4, pPFICHERO);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCARGA(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNNUMCASO, String pPFICHERO) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCARGA(pPNCASO_BPM, pPNNUMCASO, pPFICHERO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_VALIDA_DATOSBPMCARGA

	// --START-PAC_IAX_GESTIONBPM.F_GET_CASO_BPM(PNPOLIZA, PNCERTIF, POPERACION)
	private HashMap callPAC_IAX_GESTIONBPM__F_GET_CASO_BPM(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPOPERACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_GET_CASO_BPM(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNCERTIF", "pPOPERACION" },
				new Object[] { pPNPOLIZA, pPNCERTIF, pPOPERACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNCERTIF);
		cStmt.setObject(4, pPOPERACION);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BPM".toUpperCase())); // Valor de "PCASOBPM"
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
			retVal.put("PCASOBPM", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCASOBPM", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_GET_CASO_BPM(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPOPERACION) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_GET_CASO_BPM(pPNPOLIZA, pPNCERTIF, pPOPERACION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_GET_CASO_BPM

	// --START-PAC_IAX_GESTIONBPM.F2_GET_CASO_BPM(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_GESTIONBPM__F2_GET_CASO_BPM(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F2_GET_CASO_BPM(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_BPM".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PMOSTRAR"
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
			retVal.put("PMOSTRAR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PMOSTRAR", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F2_GET_CASO_BPM(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F2_GET_CASO_BPM(pPSSEGURO, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F2_GET_CASO_BPM

	// --START-PAC_IAX_GESTIONBPM.F2_VALIDA_DATOSBPM(PNCASO_BPM, PNSOLICI_BPM,
	// PSPRODUC, PNPOLIZA, PNCERTIF, POPERACION)
	private HashMap callPAC_IAX_GESTIONBPM__F2_VALIDA_DATOSBPM(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPOPERACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F2_VALIDA_DATOSBPM(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNCASO_BPM", "pPNSOLICI_BPM", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPOPERACION" },
				new Object[] { pPNCASO_BPM, pPNSOLICI_BPM, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPOPERACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCASO_BPM);
		cStmt.setObject(3, pPNSOLICI_BPM);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNCERTIF);
		cStmt.setObject(7, pPOPERACION);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F2_VALIDA_DATOSBPM(java.math.BigDecimal pPNCASO_BPM,
			java.math.BigDecimal pPNSOLICI_BPM, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, String pPOPERACION) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F2_VALIDA_DATOSBPM(pPNCASO_BPM, pPNSOLICI_BPM, pPSPRODUC, pPNPOLIZA,
				pPNCERTIF, pPOPERACION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F2_VALIDA_DATOSBPM

	// --START-PAC_IAX_GESTIONBPM.F_TRATA_MOVPOLIZA(PSSEGURO, PNMOVIMI, PNCASO_BPM,
	// PNSOLICI_BPM, PNNUMCASO)
	private HashMap callPAC_IAX_GESTIONBPM__F_TRATA_MOVPOLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNCASO_BPM, java.math.BigDecimal pPNSOLICI_BPM,
			java.math.BigDecimal pPNNUMCASO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONBPM.F_TRATA_MOVPOLIZA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNCASO_BPM", "pPNSOLICI_BPM", "pPNNUMCASO" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNCASO_BPM, pPNSOLICI_BPM, pPNNUMCASO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNCASO_BPM);
		cStmt.setObject(5, pPNSOLICI_BPM);
		cStmt.setObject(6, pPNNUMCASO);
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

	public HashMap ejecutaPAC_IAX_GESTIONBPM__F_TRATA_MOVPOLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNCASO_BPM, java.math.BigDecimal pPNSOLICI_BPM,
			java.math.BigDecimal pPNNUMCASO) throws Exception {
		return this.callPAC_IAX_GESTIONBPM__F_TRATA_MOVPOLIZA(pPSSEGURO, pPNMOVIMI, pPNCASO_BPM, pPNSOLICI_BPM,
				pPNNUMCASO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONBPM.F_TRATA_MOVPOLIZA
}
