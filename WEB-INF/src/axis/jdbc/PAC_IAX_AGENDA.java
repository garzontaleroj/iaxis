//Revision:# UV5JXXIm6I0iXDtEfifsow== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_AGENDA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENDA.class);
	private Connection conn = null;

	public PAC_IAX_AGENDA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AGENDA.F_SET_AGENDA(PIDAPUNTE, PIDAGENDA, PCCLAGD, PTCLAGD,
	// PCCONAPU, PCESTAPU, PCGRUPO, PTGRUPO, PTTITAPU, PTAPUNTE, PCTIPAPU, PCPERAGD,
	// PCAMBITO, PCPRIORI, PCUSUARI, PFAPUNTE, PFESTAPU, PFALTA, PFRECORDATORIO,
	// PCUSUARI_ORI, PCGRUPO_ORI, PTGRUPO_ORI, PTRESP, PNTRAMIT)
	private HashMap callPAC_IAX_AGENDA__F_SET_AGENDA(java.math.BigDecimal pPIDAPUNTE, java.math.BigDecimal pPIDAGENDA,
			java.math.BigDecimal pPCCLAGD, String pPTCLAGD, java.math.BigDecimal pPCCONAPU,
			java.math.BigDecimal pPCESTAPU, String pPCGRUPO, String pPTGRUPO, String pPTTITAPU, String pPTAPUNTE,
			java.math.BigDecimal pPCTIPAPU, java.math.BigDecimal pPCPERAGD, java.math.BigDecimal pPCAMBITO,
			java.math.BigDecimal pPCPRIORI, String pPCUSUARI, java.sql.Date pPFAPUNTE, java.sql.Date pPFESTAPU,
			java.sql.Date pPFALTA, java.sql.Date pPFRECORDATORIO, String pPCUSUARI_ORI, String pPCGRUPO_ORI,
			String pPTGRUPO_ORI, String pPTRESP, java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_SET_AGENDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDAPUNTE", "pPIDAGENDA", "pPCCLAGD", "pPTCLAGD", "pPCCONAPU", "pPCESTAPU", "pPCGRUPO",
						"pPTGRUPO", "pPTTITAPU", "pPTAPUNTE", "pPCTIPAPU", "pPCPERAGD", "pPCAMBITO", "pPCPRIORI",
						"pPCUSUARI", "pPFAPUNTE", "pPFESTAPU", "pPFALTA", "pPFRECORDATORIO", "pPCUSUARI_ORI",
						"pPCGRUPO_ORI", "pPTGRUPO_ORI", "pPTRESP", "pPNTRAMIT" },
				new Object[] { pPIDAPUNTE, pPIDAGENDA, pPCCLAGD, pPTCLAGD, pPCCONAPU, pPCESTAPU, pPCGRUPO, pPTGRUPO,
						pPTTITAPU, pPTAPUNTE, pPCTIPAPU, pPCPERAGD, pPCAMBITO, pPCPRIORI, pPCUSUARI, pPFAPUNTE,
						pPFESTAPU, pPFALTA, pPFRECORDATORIO, pPCUSUARI_ORI, pPCGRUPO_ORI, pPTGRUPO_ORI, pPTRESP,
						pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDAPUNTE);
		cStmt.setObject(3, pPIDAGENDA);
		cStmt.setObject(4, pPCCLAGD);
		cStmt.setObject(5, pPTCLAGD);
		cStmt.setObject(6, pPCCONAPU);
		cStmt.setObject(7, pPCESTAPU);
		cStmt.setObject(8, pPCGRUPO);
		cStmt.setObject(9, pPTGRUPO);
		cStmt.setObject(10, pPTTITAPU);
		cStmt.setObject(11, pPTAPUNTE);
		cStmt.setObject(12, pPCTIPAPU);
		cStmt.setObject(13, pPCPERAGD);
		cStmt.setObject(14, pPCAMBITO);
		cStmt.setObject(15, pPCPRIORI);
		cStmt.setObject(16, pPCUSUARI);
		cStmt.setObject(17, pPFAPUNTE);
		cStmt.setObject(18, pPFESTAPU);
		cStmt.setObject(19, pPFALTA);
		cStmt.setObject(20, pPFRECORDATORIO);
		cStmt.setObject(21, pPCUSUARI_ORI);
		cStmt.setObject(22, pPCGRUPO_ORI);
		cStmt.setObject(23, pPTGRUPO_ORI);
		cStmt.setObject(26, pPTRESP);
		cStmt.setObject(27, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(24, java.sql.Types.VARCHAR); // Valor de "PIDAPUNTE_OUT"
		cStmt.registerOutParameter(25, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PIDAPUNTE_OUT", cStmt.getObject(24));
		} catch (SQLException e) {
			retVal.put("PIDAPUNTE_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(25));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGENDA__F_SET_AGENDA(java.math.BigDecimal pPIDAPUNTE, java.math.BigDecimal pPIDAGENDA,
			java.math.BigDecimal pPCCLAGD, String pPTCLAGD, java.math.BigDecimal pPCCONAPU,
			java.math.BigDecimal pPCESTAPU, String pPCGRUPO, String pPTGRUPO, String pPTTITAPU, String pPTAPUNTE,
			java.math.BigDecimal pPCTIPAPU, java.math.BigDecimal pPCPERAGD, java.math.BigDecimal pPCAMBITO,
			java.math.BigDecimal pPCPRIORI, String pPCUSUARI, java.sql.Date pPFAPUNTE, java.sql.Date pPFESTAPU,
			java.sql.Date pPFALTA, java.sql.Date pPFRECORDATORIO, String pPCUSUARI_ORI, String pPCGRUPO_ORI,
			String pPTGRUPO_ORI, String pPTRESP, java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_AGENDA__F_SET_AGENDA(pPIDAPUNTE, pPIDAGENDA, pPCCLAGD, pPTCLAGD, pPCCONAPU, pPCESTAPU,
				pPCGRUPO, pPTGRUPO, pPTTITAPU, pPTAPUNTE, pPCTIPAPU, pPCPERAGD, pPCAMBITO, pPCPRIORI, pPCUSUARI,
				pPFAPUNTE, pPFESTAPU, pPFALTA, pPFRECORDATORIO, pPCUSUARI_ORI, pPCGRUPO_ORI, pPTGRUPO_ORI, pPTRESP,
				pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_SET_AGENDA

	// --START-PAC_IAX_AGENDA.F_GET_LSTAPUNTES(PIDAPUNTE, PIDAGENDA, PCCLAGD,
	// PTCLAGD, PCCONAPU, PCESTAPU, PCGRUPO, PTGRUPO, PTTITAPU, PCTIPAPU, PCPERAGD,
	// PCAMBITO, PCPRIORI, PFAPUNTE, PFALTA, PFRECORDATORIO, PCUSUARI, PCAPUAGE,
	// PNTRAMIT)
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTAPUNTES(java.math.BigDecimal pPIDAPUNTE,
			java.math.BigDecimal pPIDAGENDA, java.math.BigDecimal pPCCLAGD, String pPTCLAGD,
			java.math.BigDecimal pPCCONAPU, java.math.BigDecimal pPCESTAPU, String pPCGRUPO, String pPTGRUPO,
			String pPTTITAPU, java.math.BigDecimal pPCTIPAPU, java.math.BigDecimal pPCPERAGD,
			java.math.BigDecimal pPCAMBITO, java.math.BigDecimal pPCPRIORI, java.sql.Date pPFAPUNTE,
			java.sql.Date pPFALTA, java.sql.Date pPFRECORDATORIO, String pPCUSUARI, String pPCAPUAGE,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTAPUNTES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDAPUNTE", "pPIDAGENDA", "pPCCLAGD", "pPTCLAGD", "pPCCONAPU", "pPCESTAPU", "pPCGRUPO",
						"pPTGRUPO", "pPTTITAPU", "pPCTIPAPU", "pPCPERAGD", "pPCAMBITO", "pPCPRIORI", "pPFAPUNTE",
						"pPFALTA", "pPFRECORDATORIO", "pPCUSUARI", "pPCAPUAGE", "pPNTRAMIT" },
				new Object[] { pPIDAPUNTE, pPIDAGENDA, pPCCLAGD, pPTCLAGD, pPCCONAPU, pPCESTAPU, pPCGRUPO, pPTGRUPO,
						pPTTITAPU, pPCTIPAPU, pPCPERAGD, pPCAMBITO, pPCPRIORI, pPFAPUNTE, pPFALTA, pPFRECORDATORIO,
						pPCUSUARI, pPCAPUAGE, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDAPUNTE);
		cStmt.setObject(3, pPIDAGENDA);
		cStmt.setObject(4, pPCCLAGD);
		cStmt.setObject(5, pPTCLAGD);
		cStmt.setObject(6, pPCCONAPU);
		cStmt.setObject(7, pPCESTAPU);
		cStmt.setObject(8, pPCGRUPO);
		cStmt.setObject(9, pPTGRUPO);
		cStmt.setObject(10, pPTTITAPU);
		cStmt.setObject(11, pPCTIPAPU);
		cStmt.setObject(12, pPCPERAGD);
		cStmt.setObject(13, pPCAMBITO);
		cStmt.setObject(14, pPCPRIORI);
		cStmt.setObject(15, pPFAPUNTE);
		cStmt.setObject(16, pPFALTA);
		cStmt.setObject(17, pPFRECORDATORIO);
		cStmt.setObject(18, pPCUSUARI);
		cStmt.setObject(19, pPCAPUAGE);
		cStmt.setObject(20, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(21, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLSTAGENDA"
		cStmt.registerOutParameter(22, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PLSTAGENDA", cStmt.getObject(21));
		} catch (SQLException e) {
			retVal.put("PLSTAGENDA", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(java.math.BigDecimal pPIDAPUNTE,
			java.math.BigDecimal pPIDAGENDA, java.math.BigDecimal pPCCLAGD, String pPTCLAGD,
			java.math.BigDecimal pPCCONAPU, java.math.BigDecimal pPCESTAPU, String pPCGRUPO, String pPTGRUPO,
			String pPTTITAPU, java.math.BigDecimal pPCTIPAPU, java.math.BigDecimal pPCPERAGD,
			java.math.BigDecimal pPCAMBITO, java.math.BigDecimal pPCPRIORI, java.sql.Date pPFAPUNTE,
			java.sql.Date pPFALTA, java.sql.Date pPFRECORDATORIO, String pPCUSUARI, String pPCAPUAGE,
			java.math.BigDecimal pPNTRAMIT) throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTAPUNTES(pPIDAPUNTE, pPIDAGENDA, pPCCLAGD, pPTCLAGD, pPCCONAPU,
				pPCESTAPU, pPCGRUPO, pPTGRUPO, pPTTITAPU, pPCTIPAPU, pPCPERAGD, pPCAMBITO, pPCPRIORI, pPFAPUNTE,
				pPFALTA, pPFRECORDATORIO, pPCUSUARI, pPCAPUAGE, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_GET_LSTAPUNTES

	// --START-PAC_IAX_AGENDA.F_SET_AGENDA(PIDAPUNTE, PIDAGENDA, PCCLAGD, PTCLAGD,
	// PCCONAPU, PCESTAPU, PCGRUPO, PTGRUPO, PTTITAPU, PTAPUNTE, PCTIPAPU, PCPERAGD,
	// PCAMBITO, PCPRIORI, PCUSUARI, PFAPUNTE, PFESTAPU, PFALTA, PFRECORDATORIO,
	// PCUSUARI_ORI, PCGRUPO_ORI, PTGRUPO_ORI)
	private HashMap callPAC_IAX_AGENDA__F_SET_AGENDA(java.math.BigDecimal pPIDAPUNTE, java.math.BigDecimal pPIDAGENDA,
			java.math.BigDecimal pPCCLAGD, String pPTCLAGD, java.math.BigDecimal pPCCONAPU,
			java.math.BigDecimal pPCESTAPU, String pPCGRUPO, String pPTGRUPO, String pPTTITAPU, String pPTAPUNTE,
			java.math.BigDecimal pPCTIPAPU, java.math.BigDecimal pPCPERAGD, java.math.BigDecimal pPCAMBITO,
			java.math.BigDecimal pPCPRIORI, String pPCUSUARI, java.sql.Date pPFAPUNTE, java.sql.Date pPFESTAPU,
			java.sql.Date pPFALTA, java.sql.Date pPFRECORDATORIO, String pPCUSUARI_ORI, String pPCGRUPO_ORI,
			String pPTGRUPO_ORI) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_SET_AGENDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDAPUNTE", "pPIDAGENDA", "pPCCLAGD", "pPTCLAGD", "pPCCONAPU", "pPCESTAPU", "pPCGRUPO",
						"pPTGRUPO", "pPTTITAPU", "pPTAPUNTE", "pPCTIPAPU", "pPCPERAGD", "pPCAMBITO", "pPCPRIORI",
						"pPCUSUARI", "pPFAPUNTE", "pPFESTAPU", "pPFALTA", "pPFRECORDATORIO", "pPCUSUARI_ORI",
						"pPCGRUPO_ORI", "pPTGRUPO_ORI" },
				new Object[] { pPIDAPUNTE, pPIDAGENDA, pPCCLAGD, pPTCLAGD, pPCCONAPU, pPCESTAPU, pPCGRUPO, pPTGRUPO,
						pPTTITAPU, pPTAPUNTE, pPCTIPAPU, pPCPERAGD, pPCAMBITO, pPCPRIORI, pPCUSUARI, pPFAPUNTE,
						pPFESTAPU, pPFALTA, pPFRECORDATORIO, pPCUSUARI_ORI, pPCGRUPO_ORI, pPTGRUPO_ORI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDAPUNTE);
		cStmt.setObject(3, pPIDAGENDA);
		cStmt.setObject(4, pPCCLAGD);
		cStmt.setObject(5, pPTCLAGD);
		cStmt.setObject(6, pPCCONAPU);
		cStmt.setObject(7, pPCESTAPU);
		cStmt.setObject(8, pPCGRUPO);
		cStmt.setObject(9, pPTGRUPO);
		cStmt.setObject(10, pPTTITAPU);
		cStmt.setObject(11, pPTAPUNTE);
		cStmt.setObject(12, pPCTIPAPU);
		cStmt.setObject(13, pPCPERAGD);
		cStmt.setObject(14, pPCAMBITO);
		cStmt.setObject(15, pPCPRIORI);
		cStmt.setObject(16, pPCUSUARI);
		cStmt.setObject(17, pPFAPUNTE);
		cStmt.setObject(18, pPFESTAPU);
		cStmt.setObject(19, pPFALTA);
		cStmt.setObject(20, pPFRECORDATORIO);
		cStmt.setObject(21, pPCUSUARI_ORI);
		cStmt.setObject(22, pPCGRUPO_ORI);
		cStmt.setObject(23, pPTGRUPO_ORI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(24, java.sql.Types.VARCHAR); // Valor de "PIDAPUNTE_OUT"
		cStmt.registerOutParameter(25, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PIDAPUNTE_OUT", cStmt.getObject(24));
		} catch (SQLException e) {
			retVal.put("PIDAPUNTE_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(25));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGENDA__F_SET_AGENDA(java.math.BigDecimal pPIDAPUNTE, java.math.BigDecimal pPIDAGENDA,
			java.math.BigDecimal pPCCLAGD, String pPTCLAGD, java.math.BigDecimal pPCCONAPU,
			java.math.BigDecimal pPCESTAPU, String pPCGRUPO, String pPTGRUPO, String pPTTITAPU, String pPTAPUNTE,
			java.math.BigDecimal pPCTIPAPU, java.math.BigDecimal pPCPERAGD, java.math.BigDecimal pPCAMBITO,
			java.math.BigDecimal pPCPRIORI, String pPCUSUARI, java.sql.Date pPFAPUNTE, java.sql.Date pPFESTAPU,
			java.sql.Date pPFALTA, java.sql.Date pPFRECORDATORIO, String pPCUSUARI_ORI, String pPCGRUPO_ORI,
			String pPTGRUPO_ORI) throws Exception {
		return this.callPAC_IAX_AGENDA__F_SET_AGENDA(pPIDAPUNTE, pPIDAGENDA, pPCCLAGD, pPTCLAGD, pPCCONAPU, pPCESTAPU,
				pPCGRUPO, pPTGRUPO, pPTTITAPU, pPTAPUNTE, pPCTIPAPU, pPCPERAGD, pPCAMBITO, pPCPRIORI, pPCUSUARI,
				pPFAPUNTE, pPFESTAPU, pPFALTA, pPFRECORDATORIO, pPCUSUARI_ORI, pPCGRUPO_ORI, pPTGRUPO_ORI);
	}
	// --END-PAC_IAX_AGENDA.F_SET_AGENDA

	// --START-PAC_IAX_AGENDA.F_GET_LSTAGDTAREAS(PNSINIES, PNTRAMIT)
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTAGDTAREAS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTAGDTAREAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPNTRAMIT" }, new Object[] { pPNSINIES, pPNTRAMIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLSTAGENDA"
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
			retVal.put("PLSTAGENDA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PLSTAGENDA", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDTAREAS(String pPNSINIES, java.math.BigDecimal pPNTRAMIT)
			throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTAGDTAREAS(pPNSINIES, pPNTRAMIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_GET_LSTAGDTAREAS

	// --START-PAC_IAX_AGENDA.F_GET_VALORESGRUPO(PCGRUPO, PCTODOS)
	private HashMap callPAC_IAX_AGENDA__F_GET_VALORESGRUPO(String pPCGRUPO, java.math.BigDecimal pPCTODOS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_VALORESGRUPO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCGRUPO", "pPCTODOS" }, new Object[] { pPCGRUPO, pPCTODOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGRUPO);
		cStmt.setObject(3, pPCTODOS);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(String pPCGRUPO, java.math.BigDecimal pPCTODOS)
			throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_VALORESGRUPO(pPCGRUPO, pPCTODOS);
	}
	// --END-PAC_IAX_AGENDA.F_GET_VALORESGRUPO

	// --START-PAC_IAX_AGENDA.F_GET_LSTAGDOBS(PCTIPO, PPARAMS)
	/*
	 * private HashMap callPAC_IAX_AGENDA__F_GET_LSTAGDOBS (HttpServletRequest
	 * request, java.math.BigDecimal pPCTIPO) throws Exception { String
	 * callQuery="{?=call PAC_IAX_AGENDA.F_GET_LSTAGDOBS(?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] {"pPCTIPO"}, new Object[] {pPCTIPO});
	 * CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase();
	 * 
	 * 
	 * List info = new ArrayList();
	 * 
	 * oracle.sql.ArrayDescriptor structDesc =
	 * oracle.sql.ArrayDescriptor.createDescriptor(UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_INFO".toUpperCase()), conn); info = this.getInfoOb(request);
	 * logger.debug("Return array : "+info);
	 * 
	 * oracle.sql.ARRAY pPPARAMS = new oracle.sql.ARRAY(structDesc, conn,
	 * info.toArray());
	 * 
	 * logger.debug("array creat : "+info);
	 * 
	 * 
	 * cStmt.setArray(2, pPPARAMS);
	 * 
	 * 
	 * cStmt.setObject(2, pPCTIPO); cStmt.setObject(3, pPPARAMS);
	 * cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
	 * cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de
	 * "PLSTAGENDA" cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("PLSTAGENDA",
	 * cStmt.getObject(4)); } catch (SQLException e) { retVal.put("PLSTAGENDA",
	 * null); } try { retVal.put("MENSAJES", cStmt.getObject(5)); } catch
	 * (SQLException e) { retVal.put("MENSAJES", null); } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS (HttpServletRequest
	 * request, java.math.BigDecimal pPCTIPO) throws Exception { return
	 * this.callPAC_IAX_AGENDA__F_GET_LSTAGDOBS(request,pPCTIPO); }
	 * //--END-PAC_IAX_AGENDA.F_GET_LSTAGDOBS
	 */

	// --START-PAC_IAX_AGENDA.F_GET_LSTAGDOBS(PCTIPAGD, PIDOBS, PPARAMS)
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTAGDOBS(java.math.BigDecimal pPCTIPAGD, java.math.BigDecimal pPIDOBS,
			Object pPPARAMS) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTAGDOBS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPAGD", "pPIDOBS", "pPPARAMS" },
				new Object[] { pPCTIPAGD, pPIDOBS, pPPARAMS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();

		cStmt.setObject(2, pPCTIPAGD);
		cStmt.setObject(3, pPIDOBS);
		cStmt.setObject(4, pPPARAMS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLSTAGDOBS"
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
			retVal.put("PLSTAGDOBS", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PLSTAGDOBS", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS(java.math.BigDecimal pPCTIPAGD, java.math.BigDecimal pPIDOBS,
			Object pPPARAMS) throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTAGDOBS(pPCTIPAGD, pPIDOBS, pPPARAMS);
	}
	// --END-PAC_IAX_AGENDA.F_GET_LSTAGDOBS

	// --START-PAC_IAX_AGENDA.F_GET_LSTCONCEPTOS(PCTIPAGD)
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTCONCEPTOS(java.math.BigDecimal pPCTIPAGD, String pPCMODO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTCONCEPTOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPAGD", "pPCMODO" }, new Object[] { pPCTIPAGD, pPCMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPAGD);
		cStmt.setObject(3, pPCMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLSTCONCEPTOS"
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
			retVal.put("PLSTCONCEPTOS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PLSTCONCEPTOS", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTCONCEPTOS(java.math.BigDecimal pPCTIPAGD, String pPCMODO)
			throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTCONCEPTOS(pPCTIPAGD, pPCMODO);
	}

	// --END-PAC_IAX_AGENDA.F_GET_LSTCONCEPTOS
	// --START-PAC_IAX_AGENDA.F_GET_LSTTIPOSAGENDA()
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTTIPOSAGENDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTTIPOSAGENDA(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLSTTIPOSAGENDA"
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
			retVal.put("PLSTTIPOSAGENDA", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PLSTTIPOSAGENDA", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTTIPOSAGENDA() throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTTIPOSAGENDA();
	}
	// --END-PAC_IAX_AGENDA.F_GET_LSTTIPOSAGENDA

	// --START-PAC_IAX_AGENDA.F_SET_OBS(PIDOBS, PCCONOBS, PCTIPOBS, PTTITOBS, PTOBS,
	// PFOBS, PFRECORDATORIO, PCTIPAGD, PCAMBITO, PCPRIORI, PCPRIVOBS, PPUBLICO,
	// PCESTOBS, PFESTOBS, PTTIPAGD, PDESCRIPCION, PTFILENAME, PIDDOCGEDOX)
	private HashMap callPAC_IAX_AGENDA__F_SET_OBS(java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPCCONOBS,
			java.math.BigDecimal pPCTIPOBS, String pPTTITOBS, String pPTOBS, java.sql.Date pPFOBS,
			java.sql.Date pPFRECORDATORIO, java.math.BigDecimal pPCTIPAGD, java.math.BigDecimal pPCAMBITO,
			java.math.BigDecimal pPCPRIORI, java.math.BigDecimal pPCPRIVOBS, java.math.BigDecimal pPPUBLICO,
			java.math.BigDecimal pPCESTOBS, java.sql.Date pPFESTOBS, String pPTTIPAGD, String pPDESCRIPCION,
			String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_SET_OBS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDOBS", "pPCCONOBS", "pPCTIPOBS", "pPTTITOBS", "pPTOBS", "pPFOBS", "pPFRECORDATORIO",
						"pPCTIPAGD", "pPCAMBITO", "pPCPRIORI", "pPCPRIVOBS", "pPPUBLICO", "pPCESTOBS", "pPFESTOBS",
						"pPTTIPAGD", "pPDESCRIPCION", "pPTFILENAME", "pPIDDOCGEDOX" },
				new Object[] { pPIDOBS, pPCCONOBS, pPCTIPOBS, pPTTITOBS, pPTOBS, pPFOBS, pPFRECORDATORIO, pPCTIPAGD,
						pPCAMBITO, pPCPRIORI, pPCPRIVOBS, pPPUBLICO, pPCESTOBS, pPFESTOBS, pPTTIPAGD, pPDESCRIPCION,
						pPTFILENAME, pPIDDOCGEDOX });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPCCONOBS);
		cStmt.setObject(4, pPCTIPOBS);
		cStmt.setObject(5, pPTTITOBS);
		cStmt.setObject(6, pPTOBS);
		cStmt.setObject(7, pPFOBS);
		cStmt.setObject(8, pPFRECORDATORIO);
		cStmt.setObject(9, pPCTIPAGD);
		cStmt.setObject(10, pPCAMBITO);
		cStmt.setObject(11, pPCPRIORI);
		cStmt.setObject(12, pPCPRIVOBS);
		cStmt.setObject(13, pPPUBLICO);
		cStmt.setObject(14, pPCESTOBS);
		cStmt.setObject(15, pPFESTOBS);
		cStmt.setObject(16, pPTTIPAGD);
		cStmt.setObject(18, pPDESCRIPCION);
		cStmt.setObject(19, pPTFILENAME);
		cStmt.setObject(20, pPIDDOCGEDOX);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(17, java.sql.Types.VARCHAR); // Valor de "PIDOBS_OUT"
		cStmt.registerOutParameter(21, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PIDOBS_OUT", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("PIDOBS_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(21));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGENDA__F_SET_OBS(java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPCCONOBS,
			java.math.BigDecimal pPCTIPOBS, String pPTTITOBS, String pPTOBS, java.sql.Date pPFOBS,
			java.sql.Date pPFRECORDATORIO, java.math.BigDecimal pPCTIPAGD, java.math.BigDecimal pPCAMBITO,
			java.math.BigDecimal pPCPRIORI, java.math.BigDecimal pPCPRIVOBS, java.math.BigDecimal pPPUBLICO,
			java.math.BigDecimal pPCESTOBS, java.sql.Date pPFESTOBS, String pPTTIPAGD, String pPDESCRIPCION,
			String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX) throws Exception {
		return this.callPAC_IAX_AGENDA__F_SET_OBS(pPIDOBS, pPCCONOBS, pPCTIPOBS, pPTTITOBS, pPTOBS, pPFOBS,
				pPFRECORDATORIO, pPCTIPAGD, pPCAMBITO, pPCPRIORI, pPCPRIVOBS, pPPUBLICO, pPCESTOBS, pPFESTOBS,
				pPTTIPAGD, pPDESCRIPCION, pPTFILENAME, pPIDDOCGEDOX);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_SET_OBS

	// --START-PAC_IAX_AGENDA.F_GET_LSTROLES(PCTIPAGD)
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTROLES(java.math.BigDecimal pPCTIPAGD) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTROLES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPAGD" }, new Object[] { pPCTIPAGD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPAGD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLSTROLES"
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
			retVal.put("PLSTROLES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLSTROLES", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTROLES(java.math.BigDecimal pPCTIPAGD) throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTROLES(pPCTIPAGD);
	}

	// --END-PAC_IAX_AGENDA.F_GET_LSTROLES
	// --START-PAC_IAX_AGENDA.F_GET_VISIONOBS(PIDOBS, PCTIPAGD)
	private HashMap callPAC_IAX_AGENDA__F_GET_VISIONOBS(java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPCTIPAGD)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_VISIONOBS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS", "pPCTIPAGD" }, new Object[] { pPIDOBS, pPCTIPAGD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPCTIPAGD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AGD_VISION".toUpperCase())); // Valor de "PLSTVISIONROL"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AGD_VISION".toUpperCase())); // Valor de "PLSTVISIONUSU"
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
			retVal.put("PLSTVISIONROL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PLSTVISIONROL", null);
		}
		try {
			retVal.put("PLSTVISIONUSU", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PLSTVISIONUSU", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_VISIONOBS(java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPCTIPAGD)
			throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_VISIONOBS(pPIDOBS, pPCTIPAGD);
	}
	// --END-PAC_IAX_AGENDA.F_GET_VISIONOBS

	// --START-PAC_IAX_AGENDA.F_SET_VISIONOBS_OB(PIDOBS, PPUBLICO, PCTIPVISION,
	// PTTIPVISION, PCVISIBLE)
	private HashMap callPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPPUBLICO,
			java.math.BigDecimal pPCTIPVISION, String pPTTIPVISION, java.math.BigDecimal pPCVISIBLE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_SET_VISIONOBS_OB(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS", "pPPUBLICO", "pPCTIPVISION", "pPTTIPVISION", "pPCVISIBLE" },
				new Object[] { pPIDOBS, pPPUBLICO, pPCTIPVISION, pPTTIPVISION, pPCVISIBLE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPPUBLICO);
		cStmt.setObject(4, pPCTIPVISION);
		cStmt.setObject(5, pPTTIPVISION);
		cStmt.setObject(6, pPCVISIBLE);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPPUBLICO, java.math.BigDecimal pPCTIPVISION, String pPTTIPVISION,
			java.math.BigDecimal pPCVISIBLE) throws Exception {
		return this.callPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(pPIDOBS, pPPUBLICO, pPCTIPVISION, pPTTIPVISION, pPCVISIBLE);
	}

	// --END-PAC_IAX_AGENDA.F_SET_VISIONOBS_OB
	// --START-PAC_IAX_AGENDA.F_GET_VISIONOBS_OB()
	private HashMap callPAC_IAX_AGENDA__F_GET_VISIONOBS_OB() throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_VISIONOBS_OB(?, ?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AGD_VISION".toUpperCase())); // Valor de "PLSTVISIONROL"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AGD_VISION".toUpperCase())); // Valor de "PLSTVISIONUSU"
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
			retVal.put("PLSTVISIONROL", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PLSTVISIONROL", null);
		}
		try {
			retVal.put("PLSTVISIONUSU", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLSTVISIONUSU", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_VISIONOBS_OB() throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_VISIONOBS_OB();
	}

	// --END-PAC_IAX_AGENDA.F_GET_VISIONOBS_OB
	// --START-PAC_IAX_AGENDA.F_GET_ENTIDAD(PCTIPAGD, PPARAMS)
	private HashMap callPAC_IAX_AGENDA__F_GET_ENTIDAD(java.math.BigDecimal pPCTIPAGD, Object pPPARAMS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_ENTIDAD(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPAGD", "pPPARAMS" }, new Object[] { pPCTIPAGD, pPPARAMS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPAGD);
		cStmt.setObject(3, pPPARAMS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTENTIDAD"
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
			retVal.put("PTENTIDAD", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTENTIDAD", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_ENTIDAD(java.math.BigDecimal pPCTIPAGD, Object pPPARAMS)
			throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_ENTIDAD(pPCTIPAGD, pPPARAMS);
	}
	// --END-PAC_IAX_AGENDA.F_GET_ENTIDAD

	// --START-PAC_IAX_AGENDA.F_DEL_VISIONOBS_OB(PIDOBS, PCTIPVISION, PTTIPVISION)
	private HashMap callPAC_IAX_AGENDA__F_DEL_VISIONOBS_OB(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPCTIPVISION, String pPTTIPVISION) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_DEL_VISIONOBS_OB(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS", "pPCTIPVISION", "pPTTIPVISION" },
				new Object[] { pPIDOBS, pPCTIPVISION, pPTTIPVISION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPCTIPVISION);
		cStmt.setObject(4, pPTTIPVISION);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_DEL_VISIONOBS_OB(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPCTIPVISION, String pPTTIPVISION) throws Exception {
		return this.callPAC_IAX_AGENDA__F_DEL_VISIONOBS_OB(pPIDOBS, pPCTIPVISION, pPTTIPVISION);
	}
	// --END-PAC_IAX_AGENDA.F_DEL_VISIONOBS_OB

	// --START-PAC_IAX_AGENDA.F_ACTUALIZAR_VISION_OB(PIDOBS, PPUBLICO, PCPRIVOBS)
	private HashMap callPAC_IAX_AGENDA__F_ACTUALIZAR_VISION_OB(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPPUBLICO, java.math.BigDecimal pPCPRIVOBS) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_ACTUALIZAR_VISION_OB(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS", "pPPUBLICO", "pPCPRIVOBS" },
				new Object[] { pPIDOBS, pPPUBLICO, pPCPRIVOBS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPPUBLICO);
		cStmt.setObject(4, pPCPRIVOBS);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_ACTUALIZAR_VISION_OB(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPPUBLICO, java.math.BigDecimal pPCPRIVOBS) throws Exception {
		return this.callPAC_IAX_AGENDA__F_ACTUALIZAR_VISION_OB(pPIDOBS, pPPUBLICO, pPCPRIVOBS);
	}

	// --END-PAC_IAX_AGENDA.F_ACTUALIZAR_VISION_OB
	// --START-PAC_IAX_AGENDA.F_DEL_OBSERVACION(PIDOBS)
	private HashMap callPAC_IAX_AGENDA__F_DEL_OBSERVACION(java.math.BigDecimal pPIDOBS) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_DEL_OBSERVACION(?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS" }, new Object[] { pPIDOBS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_DEL_OBSERVACION(java.math.BigDecimal pPIDOBS) throws Exception {
		return this.callPAC_IAX_AGENDA__F_DEL_OBSERVACION(pPIDOBS);
	}

	// --END-PAC_IAX_AGENDA.F_DEL_OBSERVACION
	// --START-PAC_IAX_AGENDA.F_GET_LSTCHAT(PIDAGENDA, PIDAPUNTE, PNMOVAGD,
	// PNMOVCHAT, PCUSUARI, PCGRUPO, PTGRUPO)
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTCHAT(java.math.BigDecimal pPIDAGENDA, java.math.BigDecimal pPIDAPUNTE,
			java.math.BigDecimal pPNMOVAGD, java.math.BigDecimal pPNMOVCHAT, String pPCUSUARI, String pPCGRUPO,
			String pPTGRUPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTCHAT(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDAGENDA", "pPIDAPUNTE", "pPNMOVAGD", "pPNMOVCHAT", "pPCUSUARI", "pPCGRUPO",
						"pPTGRUPO" },
				new Object[] { pPIDAGENDA, pPIDAPUNTE, pPNMOVAGD, pPNMOVCHAT, pPCUSUARI, pPCGRUPO, pPTGRUPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDAGENDA);
		cStmt.setObject(3, pPIDAPUNTE);
		cStmt.setObject(4, pPNMOVAGD);
		cStmt.setObject(5, pPNMOVCHAT);
		cStmt.setObject(6, pPCUSUARI);
		cStmt.setObject(7, pPCGRUPO);
		cStmt.setObject(8, pPTGRUPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTCHAT(java.math.BigDecimal pPIDAGENDA,
			java.math.BigDecimal pPIDAPUNTE, java.math.BigDecimal pPNMOVAGD, java.math.BigDecimal pPNMOVCHAT,
			String pPCUSUARI, String pPCGRUPO, String pPTGRUPO) throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTCHAT(pPIDAGENDA, pPIDAPUNTE, pPNMOVAGD, pPNMOVCHAT, pPCUSUARI,
				pPCGRUPO, pPTGRUPO);
	}

	// --END-PAC_IAX_AGENDA.F_GET_LSTCHAT
	// --START-PAC_IAX_AGENDA.F_SET_CHAT(PIDAGENDA, PIDAPUNTE, PNMOVAGD, PNMOVCHAT,
	// PTTEXTO, PCUSUARI, PCGRUPO, PTGRUPO, PCTIPRES)
	private HashMap callPAC_IAX_AGENDA__F_SET_CHAT(java.math.BigDecimal pPIDAGENDA, java.math.BigDecimal pPIDAPUNTE,
			java.math.BigDecimal pPNMOVAGD, java.math.BigDecimal pPNMOVCHAT, String pPTTEXTO, String pPCUSUARI,
			String pPCGRUPO, String pPTGRUPO, java.math.BigDecimal pPCTIPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_SET_CHAT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDAGENDA", "pPIDAPUNTE", "pPNMOVAGD", "pPNMOVCHAT", "pPTTEXTO", "pPCUSUARI",
						"pPCGRUPO", "pPTGRUPO", "pPCTIPRES" },
				new Object[] { pPIDAGENDA, pPIDAPUNTE, pPNMOVAGD, pPNMOVCHAT, pPTTEXTO, pPCUSUARI, pPCGRUPO, pPTGRUPO,
						pPCTIPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDAGENDA);
		cStmt.setObject(3, pPIDAPUNTE);
		cStmt.setObject(4, pPNMOVAGD);
		cStmt.setObject(5, pPNMOVCHAT);
		cStmt.setObject(6, pPTTEXTO);
		cStmt.setObject(7, pPCUSUARI);
		cStmt.setObject(8, pPCGRUPO);
		cStmt.setObject(9, pPTGRUPO);
		cStmt.setObject(10, pPCTIPRES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AGENDA__F_SET_CHAT(java.math.BigDecimal pPIDAGENDA, java.math.BigDecimal pPIDAPUNTE,
			java.math.BigDecimal pPNMOVAGD, java.math.BigDecimal pPNMOVCHAT, String pPTTEXTO, String pPCUSUARI,
			String pPCGRUPO, String pPTGRUPO, java.math.BigDecimal pPCTIPRES) throws Exception {
		return this.callPAC_IAX_AGENDA__F_SET_CHAT(pPIDAGENDA, pPIDAPUNTE, pPNMOVAGD, pPNMOVCHAT, pPTTEXTO, pPCUSUARI,
				pPCGRUPO, pPTGRUPO, pPCTIPRES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_SET_CHAT

	// --START-PAC_IAX_AGENDA.F_GET_LSTGRUPOS()
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTGRUPOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTGRUPOS(?)}";

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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTGRUPOS() throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTGRUPOS();
	}
	// --END-PAC_IAX_AGENDA.F_GET_LSTGRUPOS

	// --START-PAC_IAX_AGENDA.F_GET_LSTMOTRESPUESTA(PCCLAGD)
	private HashMap callPAC_IAX_AGENDA__F_GET_LSTMOTRESPUESTA(java.math.BigDecimal pPCCLAGD) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_LSTMOTRESPUESTA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCLAGD" }, new Object[] { pPCCLAGD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCLAGD);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_LSTMOTRESPUESTA(java.math.BigDecimal pPCCLAGD) throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_LSTMOTRESPUESTA(pPCCLAGD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_GET_LSTMOTRESPUESTA

	// --START-PAC_IAX_AGENDA.F_GET_VALORCLAGD(PCCLAGD, PTCLAGD)
	private HashMap callPAC_IAX_AGENDA__F_GET_VALORCLAGD(String pPCCLAGD, String pPTCLAGD) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_VALORCLAGD(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCLAGD", "pPTCLAGD" }, new Object[] { pPCCLAGD, pPTCLAGD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCLAGD);
		cStmt.setObject(3, pPTCLAGD);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_VALORCLAGD(String pPCCLAGD, String pPTCLAGD) throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_VALORCLAGD(pPCCLAGD, pPTCLAGD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_GET_VALORCLAGD

	// --START-PAC_IAX_AGENDA.F_TAREA_SOL_PROYECTO(PSSEGURO)
	private HashMap callPAC_IAX_AGENDA__F_TAREA_SOL_PROYECTO(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_TAREA_SOL_PROYECTO(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_AGENDA__F_TAREA_SOL_PROYECTO(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_AGENDA__F_TAREA_SOL_PROYECTO(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_TAREA_SOL_PROYECTO

	// --START-PAC_IAX_AGENDA.F_GET_AGENDA(PIDAPUNTE, PIDAGENDA)
	private HashMap callPAC_IAX_AGENDA__F_GET_AGENDA(java.math.BigDecimal pPIDAPUNTE, java.math.BigDecimal pPIDAGENDA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_GET_AGENDA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDAPUNTE", "pPIDAGENDA" }, new Object[] { pPIDAPUNTE, pPIDAGENDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDAPUNTE);
		cStmt.setObject(3, pPIDAGENDA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_AGENDA".toUpperCase())); // Valor de "POBAGENDA"
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
			retVal.put("POBAGENDA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("POBAGENDA", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_GET_AGENDA(java.math.BigDecimal pPIDAPUNTE, java.math.BigDecimal pPIDAGENDA)
			throws Exception {
		return this.callPAC_IAX_AGENDA__F_GET_AGENDA(pPIDAPUNTE, pPIDAGENDA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AGENDA.F_GET_AGENDA

	// ABJ bug 4961 validar si existe conclusiones y si no traer descripcion de
	// riesgo
	private HashMap callPAC_IAX_AGENDA__F_VALCONCLUSIONES(java.math.BigDecimal pPIDOBS, java.math.BigDecimal pPNSINIES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AGENDA.F_VALCONCLUSIONES(?, ?, ?,?)}";

		logCall(callQuery, new String[] { "pPIDOBS", "pPNSINIES" }, new Object[] { pPIDOBS, pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPNSINIES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR);
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
			retVal.put("PTOBS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTOBS", null);
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

	public HashMap ejecutaPAC_IAX_AGENDA__F_VALCONCLUSIONES(java.math.BigDecimal pPIDOBS,
			java.math.BigDecimal pPNSINIES) throws Exception {
		return this.callPAC_IAX_AGENDA__F_VALCONCLUSIONES(pPIDOBS, pPNSINIES);
	}
	// --END-PAC_IAX_AGENDA.F_VALCONCLUSIONES

}
