//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PROF extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ADM.class);
	private Connection conn = null;

	public PAC_IAX_PROF(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PROF.F_SET_CCC(PSPROFES, PCRAMO, PSPRODUC, PCACTIVI,
	// PCNORDBAN)
	private HashMap callPAC_IAX_PROF__F_SET_CCC(java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCNORDBAN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_CCC(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCNORDBAN" },
				new Object[] { pPSPROFES, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCNORDBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPCNORDBAN);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_CCC(java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCNORDBAN)
			throws Exception {
		return this.callPAC_IAX_PROF__F_SET_CCC(pPSPROFES, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCNORDBAN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_CCC

	// --START-PAC_IAX_PROF.F_GET_LSTCCC(PSPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_LSTCCC(java.math.BigDecimal pPSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_LSTCCC(?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES" }, new Object[] { pPSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_LSTCCC(java.math.BigDecimal pPSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_LSTCCC(pPSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_LSTCCC

	public HashMap ejecutaPAC_IAX_PROF__F_GET_DADES_PROFESIONAL(java.math.BigDecimal pCodiProf) {
		HashMap retVal = new HashMap();
		return retVal;
	}

	// --START-PAC_IAX_PROF.F_GET_CCC(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_CCC(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CCC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_CCC".toUpperCase())); // Valor de "T_CCC"
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
			retVal.put("T_CCC", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_CCC", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CCC(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CCC(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CCC

	// --START-PAC_IAX_PROF.F_SET_ESTADO(SPROFES, CESTPRF, FESTADO, CMOTBAJA,
	// TOBSERVACIONES)
	private HashMap callPAC_IAX_PROF__F_SET_ESTADO(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCESTPRF,
			java.sql.Date pFESTADO, java.math.BigDecimal pCMOTBAJA, String pTOBSERVACIONES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_ESTADO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCESTPRF", "pFESTADO", "pCMOTBAJA", "pTOBSERVACIONES" },
				new Object[] { pSPROFES, pCESTPRF, pFESTADO, pCMOTBAJA, pTOBSERVACIONES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCESTPRF);
		cStmt.setObject(4, pFESTADO);
		cStmt.setObject(5, pCMOTBAJA);
		cStmt.setObject(6, pTOBSERVACIONES);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_ESTADO(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCESTPRF,
			java.sql.Date pFESTADO, java.math.BigDecimal pCMOTBAJA, String pTOBSERVACIONES) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_ESTADO(pSPROFES, pCESTPRF, pFESTADO, pCMOTBAJA, pTOBSERVACIONES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_ESTADO

	// --START-PAC_IAX_PROF.F_GET_ESTADOS(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_ESTADOS(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_ESTADOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_ESTADOS".toUpperCase())); // Valor de "T_ESTADOS"
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
			retVal.put("T_ESTADOS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_ESTADOS", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_ESTADOS(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_ESTADOS(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_ESTADOS

	// --START-PAC_IAX_PROF.F_DEL_ESTADO(SPROFES, FESTADO)
	private HashMap callPAC_IAX_PROF__F_DEL_ESTADO(java.math.BigDecimal pSPROFES, java.sql.Date pFESTADO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_DEL_ESTADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pFESTADO" }, new Object[] { pSPROFES, pFESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pFESTADO);
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

	public HashMap ejecutaPAC_IAX_PROF__F_DEL_ESTADO(java.math.BigDecimal pSPROFES, java.sql.Date pFESTADO)
			throws Exception {
		return this.callPAC_IAX_PROF__F_DEL_ESTADO(pSPROFES, pFESTADO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_DEL_ESTADO

	// --START-PAC_IAX_PROF.F_DEL_CCC(SPROFES, CNORDEN)
	private HashMap callPAC_IAX_PROF__F_DEL_CCC(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCNORDEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_DEL_CCC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCNORDEN" }, new Object[] { pSPROFES, pCNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCNORDEN);
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

	public HashMap ejecutaPAC_IAX_PROF__F_DEL_CCC(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCNORDEN)
			throws Exception {
		return this.callPAC_IAX_PROF__F_DEL_CCC(pSPROFES, pCNORDEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_DEL_CCC

	// --START-PAC_IAX_PROF.F_SET_ZONA(PSPROFES, PCTPZONA, PCPAIS, PCPROVIN,
	// PCPOBLAC, PCPOSINI, PCPOSFIN, PFDESDE, PFHASTA)
	private HashMap callPAC_IAX_PROF__F_SET_ZONA(java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCTPZONA,
			java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC,
			String pPCPOSINI, String pPCPOSFIN, java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_ZONA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROFES", "pPCTPZONA", "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPCPOSINI", "pPCPOSFIN",
						"pPFDESDE", "pPFHASTA" },
				new Object[] { pPSPROFES, pPCTPZONA, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSINI, pPCPOSFIN, pPFDESDE,
						pPFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPCTPZONA);
		cStmt.setObject(4, pPCPAIS);
		cStmt.setObject(5, pPCPROVIN);
		cStmt.setObject(6, pPCPOBLAC);
		cStmt.setObject(7, pPCPOSINI);
		cStmt.setObject(8, pPCPOSFIN);
		cStmt.setObject(9, pPFDESDE);
		cStmt.setObject(10, pPFHASTA);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_ZONA(java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCTPZONA,
			java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC,
			String pPCPOSINI, String pPCPOSFIN, java.sql.Date pPFDESDE, java.sql.Date pPFHASTA) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_ZONA(pPSPROFES, pPCTPZONA, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSINI,
				pPCPOSFIN, pPFDESDE, pPFHASTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_ZONA

	// --START-PAC_IAX_PROF.F_GET_ZONAS(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_ZONAS(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_ZONAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_ZONAS".toUpperCase())); // Valor de "T_ZONAS"
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
			retVal.put("T_ZONAS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_ZONAS", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_ZONAS(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_ZONAS(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_ZONAS

	// --START-PAC_IAX_PROF.F_MOD_ZONA(PSPROFES, PCNORDZN, PFHASTA)
	private HashMap callPAC_IAX_PROF__F_MOD_ZONA(java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCNORDZN,
			java.sql.Date pPFHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_MOD_ZONA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES", "pPCNORDZN", "pPFHASTA" },
				new Object[] { pPSPROFES, pPCNORDZN, pPFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPCNORDZN);
		cStmt.setObject(4, pPFHASTA);
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

	public HashMap ejecutaPAC_IAX_PROF__F_MOD_ZONA(java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCNORDZN,
			java.sql.Date pPFHASTA) throws Exception {
		return this.callPAC_IAX_PROF__F_MOD_ZONA(pPSPROFES, pPCNORDZN, pPFHASTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_MOD_ZONA

	// --START-PAC_IAX_PROF.F_SET_CONTACTO_PER(SPROFES, CTIPDOC, NNUMNIF, TNOMBRE,
	// TMOVIL, TEMAIL, TCARGO, TDIRECC)
	private HashMap callPAC_IAX_PROF__F_SET_CONTACTO_PER(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPDOC,
			String pNNUMNIF, String pTNOMBRE, String pTMOVIL, String pTEMAIL, String pTCARGO, String pTDIRECC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_CONTACTO_PER(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSPROFES", "pCTIPDOC", "pNNUMNIF", "pTNOMBRE", "pTMOVIL", "pTEMAIL", "pTCARGO",
						"pTDIRECC" },
				new Object[] { pSPROFES, pCTIPDOC, pNNUMNIF, pTNOMBRE, pTMOVIL, pTEMAIL, pTCARGO, pTDIRECC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPDOC);
		cStmt.setObject(4, pNNUMNIF);
		cStmt.setObject(5, pTNOMBRE);
		cStmt.setObject(6, pTMOVIL);
		cStmt.setObject(7, pTEMAIL);
		cStmt.setObject(8, pTCARGO);
		cStmt.setObject(9, pTDIRECC);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_CONTACTO_PER(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPDOC,
			String pNNUMNIF, String pTNOMBRE, String pTMOVIL, String pTEMAIL, String pTCARGO, String pTDIRECC)
			throws Exception {
		return this.callPAC_IAX_PROF__F_SET_CONTACTO_PER(pSPROFES, pCTIPDOC, pNNUMNIF, pTNOMBRE, pTMOVIL, pTEMAIL,
				pTCARGO, pTDIRECC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_CONTACTO_PER

	// --START-PAC_IAX_PROF.F_GET_CONTACTOS_PER(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_CONTACTOS_PER(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CONTACTOS_PER(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_CONTACTOS_PER".toUpperCase())); // Valor de "T_CONTACTOS_PER"
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
			retVal.put("T_CONTACTOS_PER", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_CONTACTOS_PER", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CONTACTOS_PER(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CONTACTOS_PER(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CONTACTOS_PER

	// --START-PAC_IAX_PROF.F_GET_CTIPPROF(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_CTIPPROF(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CTIPPROF(?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CTIPPROF(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CTIPPROF(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CTIPPROF

	// --START-PAC_IAX_PROF.F_GET_CSUBPROF(SPROFES, CTIPPROF)
	private HashMap callPAC_IAX_PROF__F_GET_CSUBPROF(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPROF)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CSUBPROF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPROF" }, new Object[] { pSPROFES, pCTIPPROF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPROF);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CSUBPROF(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPROF)
			throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CSUBPROF(pSPROFES, pCTIPPROF);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CSUBPROF

	// --START-PAC_IAX_PROF.F_SET_CARGA(SPROFES, CTIPPRO, CSUBPRO, NCARDIA, NCARSEM,
	// FDESDE)
	private HashMap callPAC_IAX_PROF__F_SET_CARGA(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pNCARDIA, java.math.BigDecimal pNCARSEM,
			java.sql.Date pFDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_CARGA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO", "pNCARDIA", "pNCARSEM", "pFDESDE" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO, pNCARDIA, pNCARSEM, pFDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
		cStmt.setObject(5, pNCARDIA);
		cStmt.setObject(6, pNCARSEM);
		cStmt.setObject(7, pFDESDE);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_CARGA(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pNCARDIA, java.math.BigDecimal pNCARSEM,
			java.sql.Date pFDESDE) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_CARGA(pSPROFES, pCTIPPRO, pCSUBPRO, pNCARDIA, pNCARSEM, pFDESDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_CARGA

	// --START-PAC_IAX_PROF.F_GET_CARGA(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_CARGA(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CARGA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_CARGA_PERMITIDA".toUpperCase())); // Valor de "T_CARGA"
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
			retVal.put("T_CARGA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_CARGA", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CARGA(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CARGA(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CARGA

	// --START-PAC_IAX_PROF.F_DEL_CARGA(SPROFES, CTIPPRO, CSUBPRO, FDESDE)
	private HashMap callPAC_IAX_PROF__F_DEL_CARGA(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.sql.Date pFDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_DEL_CARGA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO", "pFDESDE" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO, pFDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
		cStmt.setObject(5, pFDESDE);
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

	public HashMap ejecutaPAC_IAX_PROF__F_DEL_CARGA(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.sql.Date pFDESDE) throws Exception {
		return this.callPAC_IAX_PROF__F_DEL_CARGA(pSPROFES, pCTIPPRO, pCSUBPRO, pFDESDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_DEL_CARGA

	// --START-PAC_IAX_PROF.F_DEL_CONTACTO_PER(SPROFES, NORDCTO)
	private HashMap callPAC_IAX_PROF__F_DEL_CONTACTO_PER(java.math.BigDecimal pSPROFES, java.math.BigDecimal pNORDCTO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_DEL_CONTACTO_PER(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pNORDCTO" }, new Object[] { pSPROFES, pNORDCTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pNORDCTO);
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

	public HashMap ejecutaPAC_IAX_PROF__F_DEL_CONTACTO_PER(java.math.BigDecimal pSPROFES, java.math.BigDecimal pNORDCTO)
			throws Exception {
		return this.callPAC_IAX_PROF__F_DEL_CONTACTO_PER(pSPROFES, pNORDCTO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_DEL_CONTACTO_PER

	// --START-PAC_IAX_PROF.F_MOD_CONTACTO_PER(SPROFES, CNORDCTO, CTIPDOC, NNUMNIF,
	// TNOMBRE, TMOVIL, TEMAIL, TCARGO, TDIRECC)
	private HashMap callPAC_IAX_PROF__F_MOD_CONTACTO_PER(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCNORDCTO,
			java.math.BigDecimal pCTIPDOC, String pNNUMNIF, String pTNOMBRE, String pTMOVIL, String pTEMAIL,
			String pTCARGO, String pTDIRECC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_MOD_CONTACTO_PER(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSPROFES", "pCNORDCTO", "pCTIPDOC", "pNNUMNIF", "pTNOMBRE", "pTMOVIL", "pTEMAIL",
						"pTCARGO", "pTDIRECC" },
				new Object[] { pSPROFES, pCNORDCTO, pCTIPDOC, pNNUMNIF, pTNOMBRE, pTMOVIL, pTEMAIL, pTCARGO,
						pTDIRECC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCNORDCTO);
		cStmt.setObject(4, pCTIPDOC);
		cStmt.setObject(5, pNNUMNIF);
		cStmt.setObject(6, pTNOMBRE);
		cStmt.setObject(7, pTMOVIL);
		cStmt.setObject(8, pTEMAIL);
		cStmt.setObject(9, pTCARGO);
		cStmt.setObject(10, pTDIRECC);
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

	public HashMap ejecutaPAC_IAX_PROF__F_MOD_CONTACTO_PER(java.math.BigDecimal pSPROFES,
			java.math.BigDecimal pCNORDCTO, java.math.BigDecimal pCTIPDOC, String pNNUMNIF, String pTNOMBRE,
			String pTMOVIL, String pTEMAIL, String pTCARGO, String pTDIRECC) throws Exception {
		return this.callPAC_IAX_PROF__F_MOD_CONTACTO_PER(pSPROFES, pCNORDCTO, pCTIPDOC, pNNUMNIF, pTNOMBRE, pTMOVIL,
				pTEMAIL, pTCARGO, pTDIRECC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_MOD_CONTACTO_PER

	// --START-PAC_IAX_PROF.F_CALC_CARGA(SPROFES, CTIPPRO, CSUBPRO, NCAPACI, FDESDE)
	private HashMap callPAC_IAX_PROF__F_CALC_CARGA(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pNCAPACI, java.sql.Date pFDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_CALC_CARGA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO", "pNCAPACI", "pFDESDE" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO, pNCAPACI, pFDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
		cStmt.setObject(5, pNCAPACI);
		cStmt.setObject(6, pFDESDE);
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

	public HashMap ejecutaPAC_IAX_PROF__F_CALC_CARGA(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pNCAPACI, java.sql.Date pFDESDE) throws Exception {
		return this.callPAC_IAX_PROF__F_CALC_CARGA(pSPROFES, pCTIPPRO, pCSUBPRO, pNCAPACI, pFDESDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_CALC_CARGA

	// --START-PAC_IAX_PROF.F_SET_CARGA_REAL(SPROFES, CTIPPRO, CSUBPRO, NCAPACI,
	// NCARDIA, NCARSEM, FDESDE)
	private HashMap callPAC_IAX_PROF__F_SET_CARGA_REAL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pNCAPACI, java.math.BigDecimal pNCARDIA,
			java.math.BigDecimal pNCARSEM, java.sql.Date pFDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_CARGA_REAL(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO", "pNCAPACI", "pNCARDIA", "pNCARSEM", "pFDESDE" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO, pNCAPACI, pNCARDIA, pNCARSEM, pFDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
		cStmt.setObject(5, pNCAPACI);
		cStmt.setObject(6, pNCARDIA);
		cStmt.setObject(7, pNCARSEM);
		cStmt.setObject(8, pFDESDE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_CARGA_REAL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pNCAPACI, java.math.BigDecimal pNCARDIA,
			java.math.BigDecimal pNCARSEM, java.sql.Date pFDESDE) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_CARGA_REAL(pSPROFES, pCTIPPRO, pCSUBPRO, pNCAPACI, pNCARDIA, pNCARSEM,
				pFDESDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_CARGA_REAL

	// --START-PAC_IAX_PROF.F_GET_CARGA_REAL(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_CARGA_REAL(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CARGA_REAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_CARGA_REAL".toUpperCase())); // Valor de "T_CARGA_REAL"
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
			retVal.put("T_CARGA_REAL", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_CARGA_REAL", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CARGA_REAL(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CARGA_REAL(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CARGA_REAL

	// --START-PAC_IAX_PROF.F_DEL_CARGA_REAL(SPROFES, CTIPPRO, CSUBPRO, FDESDE)
	private HashMap callPAC_IAX_PROF__F_DEL_CARGA_REAL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.sql.Date pFDESDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_DEL_CARGA_REAL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO", "pFDESDE" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO, pFDESDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
		cStmt.setObject(5, pFDESDE);
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

	public HashMap ejecutaPAC_IAX_PROF__F_DEL_CARGA_REAL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.sql.Date pFDESDE) throws Exception {
		return this.callPAC_IAX_PROF__F_DEL_CARGA_REAL(pSPROFES, pCTIPPRO, pCSUBPRO, pFDESDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_DEL_CARGA_REAL

	// --START-PAC_IAX_PROF.F_SET_DESCARTADO(SPROFES, CTIPPRO, CSUBPRO, SPRODUC,
	// CCAUSIN, FDESDE, FHASTA)
	private HashMap callPAC_IAX_PROF__F_SET_DESCARTADO(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pSPRODUC, java.math.BigDecimal pCCAUSIN,
			java.sql.Date pFDESDE, java.sql.Date pFHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_DESCARTADO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO", "pSPRODUC", "pCCAUSIN", "pFDESDE", "pFHASTA" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO, pSPRODUC, pCCAUSIN, pFDESDE, pFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
		cStmt.setObject(5, pSPRODUC);
		cStmt.setObject(6, pCCAUSIN);
		cStmt.setObject(7, pFDESDE);
		cStmt.setObject(8, pFHASTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_DESCARTADO(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pSPRODUC, java.math.BigDecimal pCCAUSIN,
			java.sql.Date pFDESDE, java.sql.Date pFHASTA) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_DESCARTADO(pSPROFES, pCTIPPRO, pCSUBPRO, pSPRODUC, pCCAUSIN, pFDESDE,
				pFHASTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_DESCARTADO

	// --START-PAC_IAX_PROF.F_GET_DESCARTADOS(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_DESCARTADOS(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_DESCARTADOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_DESCARTADOS".toUpperCase())); // Valor de "T_DESCARTADOS"
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
			retVal.put("T_DESCARTADOS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_DESCARTADOS", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_DESCARTADOS(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_DESCARTADOS(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_DESCARTADOS

	// --START-PAC_IAX_PROF.F_MOD_DESCARTADOS(SPROFES, CTIPPRO, CSUBPRO, SPRODUC,
	// CCAUSIN, FDESDE, FHASTA)
	private HashMap callPAC_IAX_PROF__F_MOD_DESCARTADOS(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pSPRODUC, java.math.BigDecimal pCCAUSIN,
			java.sql.Date pFDESDE, java.sql.Date pFHASTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_MOD_DESCARTADOS(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO", "pSPRODUC", "pCCAUSIN", "pFDESDE", "pFHASTA" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO, pSPRODUC, pCCAUSIN, pFDESDE, pFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
		cStmt.setObject(5, pSPRODUC);
		cStmt.setObject(6, pCCAUSIN);
		cStmt.setObject(7, pFDESDE);
		cStmt.setObject(8, pFHASTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PROF__F_MOD_DESCARTADOS(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO, java.math.BigDecimal pSPRODUC, java.math.BigDecimal pCCAUSIN,
			java.sql.Date pFDESDE, java.sql.Date pFHASTA) throws Exception {
		return this.callPAC_IAX_PROF__F_MOD_DESCARTADOS(pSPROFES, pCTIPPRO, pCSUBPRO, pSPRODUC, pCCAUSIN, pFDESDE,
				pFHASTA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_MOD_DESCARTADOS

	// --START-PAC_IAX_PROF.F_SET_OBSERVACIONES(SPROFES, TOBSERV)
	private HashMap callPAC_IAX_PROF__F_SET_OBSERVACIONES(java.math.BigDecimal pSPROFES, String pTOBSERV)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_OBSERVACIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pTOBSERV" }, new Object[] { pSPROFES, pTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pTOBSERV);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_OBSERVACIONES(java.math.BigDecimal pSPROFES, String pTOBSERV)
			throws Exception {
		return this.callPAC_IAX_PROF__F_SET_OBSERVACIONES(pSPROFES, pTOBSERV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_OBSERVACIONES

	// --START-PAC_IAX_PROF.F_GET_OBSERVACIONES(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_OBSERVACIONES(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_OBSERVACIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_OBSERVACIONES".toUpperCase())); // Valor de "T_OBSERVACIONES"
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
			retVal.put("T_OBSERVACIONES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_OBSERVACIONES", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_OBSERVACIONES(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_OBSERVACIONES(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_OBSERVACIONES

	// --START-PAC_IAX_PROF.F_SET_ROL(SPROFES, CTIPPRO, CSUBPRO)
	private HashMap callPAC_IAX_PROF__F_SET_ROL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_ROL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_ROL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_ROL(pSPROFES, pCTIPPRO, pCSUBPRO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_ROL

	// --START-PAC_IAX_PROF.F_GET_ROLES(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_ROLES(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_ROLES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_ROLES".toUpperCase())); // Valor de "T_ROLES"
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
			retVal.put("T_ROLES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_ROLES", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_ROLES(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_ROLES(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_ROLES

	// --START-PAC_IAX_PROF.F_SET_SEGUIMIENTO(SPROFES, TOBSERV, CCALIFIC)
	private HashMap callPAC_IAX_PROF__F_SET_SEGUIMIENTO(java.math.BigDecimal pSPROFES, String pTOBSERV,
			java.math.BigDecimal pCCALIFIC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_SEGUIMIENTO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pTOBSERV", "pCCALIFIC" },
				new Object[] { pSPROFES, pTOBSERV, pCCALIFIC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pTOBSERV);
		cStmt.setObject(4, pCCALIFIC);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_SEGUIMIENTO(java.math.BigDecimal pSPROFES, String pTOBSERV,
			java.math.BigDecimal pCCALIFIC) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_SEGUIMIENTO(pSPROFES, pTOBSERV, pCCALIFIC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_SEGUIMIENTO

	// --START-PAC_IAX_PROF.F_GET_SEGUIMIENTO(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_SEGUIMIENTO(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_SEGUIMIENTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_SEGUIMIENTO".toUpperCase())); // Valor de "T_SEGUIMIENTO"
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
			retVal.put("T_SEGUIMIENTO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_SEGUIMIENTO", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_SEGUIMIENTO(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_SEGUIMIENTO(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_SEGUIMIENTO

	// --START-PAC_IAX_PROF.F_GET_SPROFES()
	private HashMap callPAC_IAX_PROF__F_GET_SPROFES() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_SPROFES(?)}";

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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_SPROFES() throws Exception {
		return this.callPAC_IAX_PROF__F_GET_SPROFES();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_SPROFES

	// --START-PAC_IAX_PROF.F_GET_LSTTELEFONOS(SPERSON)
	private HashMap callPAC_IAX_PROF__F_GET_LSTTELEFONOS(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_LSTTELEFONOS(?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_LSTTELEFONOS(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_LSTTELEFONOS(pSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_LSTTELEFONOS

	// --START-PAC_IAX_PROF.F_SET_PROFESIONAL(SPROFES, SPERSON, TNOMBRE, NREGMER,
	// FREGMER, CDOMICI, CMODCON, CTELCLI, NLIMITE, CNOASIS, PCMODO)
	private HashMap callPAC_IAX_PROF__F_SET_PROFESIONAL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pSPERSON,
			String pTNOMBRE, String pNREGMER, java.sql.Date pFREGMER, java.math.BigDecimal pCDOMICI,
			java.math.BigDecimal pCMODCON, java.math.BigDecimal pCTELCLI, java.math.BigDecimal pNLIMITE,
			java.math.BigDecimal pCNOASIS, java.math.BigDecimal pPCMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_PROFESIONAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSPROFES", "pSPERSON", "pTNOMBRE", "pNREGMER", "pFREGMER", "pCDOMICI", "pCMODCON",
						"pCTELCLI", "pNLIMITE", "pCNOASIS", "pPCMODO" },
				new Object[] { pSPROFES, pSPERSON, pTNOMBRE, pNREGMER, pFREGMER, pCDOMICI, pCMODCON, pCTELCLI, pNLIMITE,
						pCNOASIS, pPCMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pSPERSON);
		cStmt.setObject(4, pTNOMBRE);
		cStmt.setObject(5, pNREGMER);
		cStmt.setObject(6, pFREGMER);
		cStmt.setObject(7, pCDOMICI);
		cStmt.setObject(8, pCMODCON);
		cStmt.setObject(9, pCTELCLI);
		cStmt.setObject(10, pNLIMITE);
		cStmt.setObject(11, pCNOASIS);
		cStmt.setObject(12, pPCMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, java.sql.Types.VARCHAR); // Valor de "PTEXTO"
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
			retVal.put("PTEXTO", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PTEXTO", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_PROFESIONAL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pSPERSON,
			String pTNOMBRE, String pNREGMER, java.sql.Date pFREGMER, java.math.BigDecimal pCDOMICI,
			java.math.BigDecimal pCMODCON, java.math.BigDecimal pCTELCLI, java.math.BigDecimal pNLIMITE,
			java.math.BigDecimal pCNOASIS, java.math.BigDecimal pPCMODO) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_PROFESIONAL(pSPROFES, pSPERSON, pTNOMBRE, pNREGMER, pFREGMER, pCDOMICI,
				pCMODCON, pCTELCLI, pNLIMITE, pCNOASIS, pPCMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_PROFESIONAL

	// --START-PAC_IAX_PROF.F_GET_PROFESIONALES(PCTIPIDE, PNNUMIDE, PTNOMBRE,
	// PCTIPPRO, PCSUBPRO, PSPROFES, PCPROVIN, PCPOBLAC)
	private HashMap callPAC_IAX_PROF__F_GET_PROFESIONALES(java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE,
			String pPTNOMBRE, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_PROFESIONALES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPIDE", "pPNNUMIDE", "pPTNOMBRE", "pPCTIPPRO", "pPCSUBPRO", "pPSPROFES",
						"pPCPROVIN", "pPCPOBLAC" },
				new Object[] { pPCTIPIDE, pPNNUMIDE, pPTNOMBRE, pPCTIPPRO, pPCSUBPRO, pPSPROFES, pPCPROVIN,
						pPCPOBLAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPIDE);
		cStmt.setObject(3, pPNNUMIDE);
		cStmt.setObject(4, pPTNOMBRE);
		cStmt.setObject(5, pPCTIPPRO);
		cStmt.setObject(6, pPCSUBPRO);
		cStmt.setObject(7, pPSPROFES);
		cStmt.setObject(8, pPCPROVIN);
		cStmt.setObject(9, pPCPOBLAC);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_PROFESIONALES(java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE,
			String pPTNOMBRE, java.math.BigDecimal pPCTIPPRO, java.math.BigDecimal pPCSUBPRO,
			java.math.BigDecimal pPSPROFES, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC)
			throws Exception {
		return this.callPAC_IAX_PROF__F_GET_PROFESIONALES(pPCTIPIDE, pPNNUMIDE, pPTNOMBRE, pPCTIPPRO, pPCSUBPRO,
				pPSPROFES, pPCPROVIN, pPCPOBLAC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_PROFESIONALES

	// --START-PAC_IAX_PROF.F_GET_PROFESIONAL(PSPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_PROFESIONAL(java.math.BigDecimal pPSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_PROFESIONAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES" }, new Object[] { pPSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PROFESIONAL".toUpperCase())); // Valor de "OBPROFESIONAL"
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
			retVal.put("OBPROFESIONAL", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OBPROFESIONAL", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_PROFESIONAL(java.math.BigDecimal pPSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_PROFESIONAL(pPSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_PROFESIONAL

	// --START-PAC_IAX_PROF.F_GET_CTIPPROF_CARGA_REAL(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_CTIPPROF_CARGA_REAL(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CTIPPROF_CARGA_REAL(?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CTIPPROF_CARGA_REAL(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CTIPPROF_CARGA_REAL(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CTIPPROF_CARGA_REAL

	// --START-PAC_IAX_PROF.F_GET_CSUBPROF_CARGA_REAL(SPROFES, CTIPPROF)
	private HashMap callPAC_IAX_PROF__F_GET_CSUBPROF_CARGA_REAL(java.math.BigDecimal pSPROFES,
			java.math.BigDecimal pCTIPPROF) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CSUBPROF_CARGA_REAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPROF" }, new Object[] { pSPROFES, pCTIPPROF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPROF);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CSUBPROF_CARGA_REAL(java.math.BigDecimal pSPROFES,
			java.math.BigDecimal pCTIPPROF) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CSUBPROF_CARGA_REAL(pSPROFES, pCTIPPROF);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CSUBPROF_CARGA_REAL

	// --START-PAC_IAX_PROF.F_DEL_ROL(SPROFES, CTIPPRO, CSUBPRO)
	private HashMap callPAC_IAX_PROF__F_DEL_ROL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_DEL_ROL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCTIPPRO", "pCSUBPRO" },
				new Object[] { pSPROFES, pCTIPPRO, pCSUBPRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCTIPPRO);
		cStmt.setObject(4, pCSUBPRO);
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

	public HashMap ejecutaPAC_IAX_PROF__F_DEL_ROL(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCTIPPRO,
			java.math.BigDecimal pCSUBPRO) throws Exception {
		return this.callPAC_IAX_PROF__F_DEL_ROL(pSPROFES, pCTIPPRO, pCSUBPRO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_DEL_ROL

	// --START-PAC_IAX_PROF.F_SET_CONTACTO_PREF(SPROFES, CMODCON)
	private HashMap callPAC_IAX_PROF__F_SET_CONTACTO_PREF(java.math.BigDecimal pSPROFES, java.math.BigDecimal pCMODCON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_CONTACTO_PREF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pCMODCON" }, new Object[] { pSPROFES, pCMODCON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pCMODCON);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_CONTACTO_PREF(java.math.BigDecimal pSPROFES,
			java.math.BigDecimal pCMODCON) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_CONTACTO_PREF(pSPROFES, pCMODCON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_CONTACTO_PREF

	// --START-PAC_IAX_PROF.F_SET_OBJETO_PROFDOCUMENTO(PSPROFES, PNDOCUME, PCDOCUME,
	// PIDDOC, PFRECLAMA, PFRECIBE, PFCADUCA, PCOBLIGA)
	private HashMap callPAC_IAX_PROF__F_SET_OBJETO_PROFDOCUMENTO(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPNDOCUME, java.math.BigDecimal pPCDOCUME, java.math.BigDecimal pPIDDOC,
			java.sql.Date pPFRECLAMA, java.sql.Date pPFRECIBE, java.sql.Date pPFCADUCA, java.math.BigDecimal pPCOBLIGA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_OBJETO_PROFDOCUMENTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROFES", "pPNDOCUME", "pPCDOCUME", "pPIDDOC", "pPFRECLAMA", "pPFRECIBE", "pPFCADUCA",
						"pPCOBLIGA" },
				new Object[] { pPSPROFES, pPNDOCUME, pPCDOCUME, pPIDDOC, pPFRECLAMA, pPFRECIBE, pPFCADUCA, pPCOBLIGA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPNDOCUME);
		cStmt.setObject(4, pPCDOCUME);
		cStmt.setObject(5, pPIDDOC);
		cStmt.setObject(6, pPFRECLAMA);
		cStmt.setObject(7, pPFRECIBE);
		cStmt.setObject(8, pPFCADUCA);
		cStmt.setObject(9, pPCOBLIGA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PNDOCUME_OUT"
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
			retVal.put("PNDOCUME_OUT", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PNDOCUME_OUT", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_OBJETO_PROFDOCUMENTO(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPNDOCUME, java.math.BigDecimal pPCDOCUME, java.math.BigDecimal pPIDDOC,
			java.sql.Date pPFRECLAMA, java.sql.Date pPFRECIBE, java.sql.Date pPFCADUCA, java.math.BigDecimal pPCOBLIGA)
			throws Exception {
		return this.callPAC_IAX_PROF__F_SET_OBJETO_PROFDOCUMENTO(pPSPROFES, pPNDOCUME, pPCDOCUME, pPIDDOC, pPFRECLAMA,
				pPFRECIBE, pPFCADUCA, pPCOBLIGA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_OBJETO_PROFDOCUMENTO

	// --START-PAC_IAX_PROF.F_GET_PERS_SEDES(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_PERS_SEDES(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_PERS_SEDES(?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_PERS_SEDES(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_PERS_SEDES(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_PERS_SEDES

	// --START-PAC_IAX_PROF.F_SET_SEDE(SPROFES, SPERSED, THORARI, TPERCTO, CDOMICI)
	private HashMap callPAC_IAX_PROF__F_SET_SEDE(java.math.BigDecimal pSPROFES, java.math.BigDecimal pSPERSED,
			String pTHORARI, String pTPERCTO, java.math.BigDecimal pCDOMICI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_SEDE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pSPERSED", "pTHORARI", "pTPERCTO", "pCDOMICI" },
				new Object[] { pSPROFES, pSPERSED, pTHORARI, pTPERCTO, pCDOMICI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pSPERSED);
		cStmt.setObject(4, pTHORARI);
		cStmt.setObject(5, pTPERCTO);
		cStmt.setObject(6, pCDOMICI);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_SEDE(java.math.BigDecimal pSPROFES, java.math.BigDecimal pSPERSED,
			String pTHORARI, String pTPERCTO, java.math.BigDecimal pCDOMICI) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_SEDE(pSPROFES, pSPERSED, pTHORARI, pTPERCTO, pCDOMICI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_SEDE

	// --START-PAC_IAX_PROF.F_GET_LSTEMAIL(SPERSON)
	private HashMap callPAC_IAX_PROF__F_GET_LSTEMAIL(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_LSTEMAIL(?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_LSTEMAIL(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_LSTEMAIL(pSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_LSTEMAIL

	// --START-PAC_IAX_PROF.F_SET_REPRESENTANTE(SPROFES, SPERSON, NMOVIL, TEMAIL,
	// TCARGO)
	private HashMap callPAC_IAX_PROF__F_SET_REPRESENTANTE(java.math.BigDecimal pSPROFES, java.math.BigDecimal pSPERSON,
			java.math.BigDecimal pNMOVIL, java.math.BigDecimal pTEMAIL, String pTCARGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_REPRESENTANTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES", "pSPERSON", "pNMOVIL", "pTEMAIL", "pTCARGO" },
				new Object[] { pSPROFES, pSPERSON, pNMOVIL, pTEMAIL, pTCARGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.setObject(3, pSPERSON);
		cStmt.setObject(4, pNMOVIL);
		cStmt.setObject(5, pTEMAIL);
		cStmt.setObject(6, pTCARGO);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_REPRESENTANTE(java.math.BigDecimal pSPROFES,
			java.math.BigDecimal pSPERSON, java.math.BigDecimal pNMOVIL, java.math.BigDecimal pTEMAIL, String pTCARGO)
			throws Exception {
		return this.callPAC_IAX_PROF__F_SET_REPRESENTANTE(pSPROFES, pSPERSON, pNMOVIL, pTEMAIL, pTCARGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_REPRESENTANTE

	// --START-PAC_IAX_PROF.F_GET_SERVICIOS(STARIFA, SSERVIC, TDESCRI)
	private HashMap callPAC_IAX_PROF__F_GET_SERVICIOS(java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSSERVIC,
			String pTDESCRI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_SERVICIOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSTARIFA", "pSSERVIC", "pTDESCRI" },
				new Object[] { pSTARIFA, pSSERVIC, pTDESCRI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA);
		cStmt.setObject(3, pSSERVIC);
		cStmt.setObject(4, pTDESCRI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PROF__F_GET_SERVICIOS(java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSSERVIC,
			String pTDESCRI) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_SERVICIOS(pSTARIFA, pSSERVIC, pTDESCRI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_SERVICIOS

	// --START-PAC_IAX_PROF.F_GET_LSTCUPS()
	private HashMap callPAC_IAX_PROF__F_GET_LSTCUPS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_LSTCUPS(?)}";

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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_LSTCUPS() throws Exception {
		return this.callPAC_IAX_PROF__F_GET_LSTCUPS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_LSTCUPS

	// --START-PAC_IAX_PROF.F_GET_SSERVIC()
	private HashMap callPAC_IAX_PROF__F_GET_SSERVIC() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_SSERVIC(?)}";

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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_SSERVIC() throws Exception {
		return this.callPAC_IAX_PROF__F_GET_SSERVIC();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_SSERVIC

	// --START-PAC_IAX_PROF.F_SET_SERVICIO(STARIFA, SSERVIC, CCODCUP, TDESCRI,
	// CUNIMED, IPRECIO, CTIPCAL, CMAGNIT, IMINIMO, CSELECC, CTIPSER, FINIVIG,
	// FFINVIG)
	private HashMap callPAC_IAX_PROF__F_SET_SERVICIO(java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSSERVIC,
			String pCCODCUP, String pTDESCRI, java.math.BigDecimal pCUNIMED, java.math.BigDecimal pIPRECIO,
			java.math.BigDecimal pCTIPCAL, java.math.BigDecimal pCMAGNIT, java.math.BigDecimal pIMINIMO,
			java.math.BigDecimal pCSELECC, java.math.BigDecimal pCTIPSER, java.sql.Date pFINIVIG,
			java.sql.Date pFFINVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_SERVICIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSTARIFA", "pSSERVIC", "pCCODCUP", "pTDESCRI", "pCUNIMED", "pIPRECIO", "pCTIPCAL",
						"pCMAGNIT", "pIMINIMO", "pCSELECC", "pCTIPSER", "pFINIVIG", "pFFINVIG" },
				new Object[] { pSTARIFA, pSSERVIC, pCCODCUP, pTDESCRI, pCUNIMED, pIPRECIO, pCTIPCAL, pCMAGNIT, pIMINIMO,
						pCSELECC, pCTIPSER, pFINIVIG, pFFINVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA);
		cStmt.setObject(3, pSSERVIC);
		cStmt.setObject(4, pCCODCUP);
		cStmt.setObject(5, pTDESCRI);
		cStmt.setObject(6, pCUNIMED);
		cStmt.setObject(7, pIPRECIO);
		cStmt.setObject(8, pCTIPCAL);
		cStmt.setObject(9, pCMAGNIT);
		cStmt.setObject(10, pIMINIMO);
		cStmt.setObject(11, pCSELECC);
		cStmt.setObject(12, pCTIPSER);
		cStmt.setObject(13, pFINIVIG);
		cStmt.setObject(14, pFFINVIG);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_SERVICIO(java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSSERVIC,
			String pCCODCUP, String pTDESCRI, java.math.BigDecimal pCUNIMED, java.math.BigDecimal pIPRECIO,
			java.math.BigDecimal pCTIPCAL, java.math.BigDecimal pCMAGNIT, java.math.BigDecimal pIMINIMO,
			java.math.BigDecimal pCSELECC, java.math.BigDecimal pCTIPSER, java.sql.Date pFINIVIG,
			java.sql.Date pFFINVIG) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_SERVICIO(pSTARIFA, pSSERVIC, pCCODCUP, pTDESCRI, pCUNIMED, pIPRECIO,
				pCTIPCAL, pCMAGNIT, pIMINIMO, pCSELECC, pCTIPSER, pFINIVIG, pFFINVIG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_SERVICIO

	// --START-PAC_IAX_PROF.F_GET_SERVICIO(STARIFA, SSERVIC)
	private HashMap callPAC_IAX_PROF__F_GET_SERVICIO(java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSSERVIC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_SERVICIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSTARIFA", "pSSERVIC" }, new Object[] { pSTARIFA, pSSERVIC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA);
		cStmt.setObject(3, pSSERVIC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PROF_SERVI".toUpperCase())); // Valor de "SERVICIO"
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
			retVal.put("SERVICIO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("SERVICIO", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_SERVICIO(java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSSERVIC)
			throws Exception {
		return this.callPAC_IAX_PROF__F_GET_SERVICIO(pSTARIFA, pSSERVIC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_SERVICIO

	// --START-PAC_IAX_PROF.F_GET_TARIFAS(PSTARIFA, PTDESCRI)
	private HashMap callPAC_IAX_PROF__F_GET_TARIFAS(java.math.BigDecimal pPSTARIFA, String pPTDESCRI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_TARIFAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSTARIFA", "pPTDESCRI" }, new Object[] { pPSTARIFA, pPTDESCRI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTARIFA);
		cStmt.setObject(3, pPTDESCRI);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_TARIFAS(java.math.BigDecimal pPSTARIFA, String pPTDESCRI)
			throws Exception {
		return this.callPAC_IAX_PROF__F_GET_TARIFAS(pPSTARIFA, pPTDESCRI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_TARIFAS

	// --START-PAC_IAX_PROF.F_GET_STARIFA()
	private HashMap callPAC_IAX_PROF__F_GET_STARIFA() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_STARIFA(?)}";

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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_STARIFA() throws Exception {
		return this.callPAC_IAX_PROF__F_GET_STARIFA();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_STARIFA

	// --START-PAC_IAX_PROF.F_SET_TARIFA(STARIFA, TDESCRI)
	private HashMap callPAC_IAX_PROF__F_SET_TARIFA(java.math.BigDecimal pSTARIFA, String pTDESCRI) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_TARIFA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSTARIFA", "pTDESCRI" }, new Object[] { pSTARIFA, pTDESCRI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA);
		cStmt.setObject(3, pTDESCRI);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_TARIFA(java.math.BigDecimal pSTARIFA, String pTDESCRI) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_TARIFA(pSTARIFA, pTDESCRI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_TARIFA

	// --START-PAC_IAX_PROF.F_GET_CONVENIOS(SPROFES)
	private HashMap callPAC_IAX_PROF__F_GET_CONVENIOS(java.math.BigDecimal pSPROFES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CONVENIOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPROFES" }, new Object[] { pSPROFES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPROFES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PROF_CONVE".toUpperCase())); // Valor de "T_CONVENIOS"
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
			retVal.put("T_CONVENIOS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("T_CONVENIOS", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CONVENIOS(java.math.BigDecimal pSPROFES) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CONVENIOS(pSPROFES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CONVENIOS

	// --START-PAC_IAX_PROF.F_GET_ESTADOS_CONVENIO(PSCONVEN)
	private HashMap callPAC_IAX_PROF__F_GET_ESTADOS_CONVENIO(java.math.BigDecimal pPSCONVEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_ESTADOS_CONVENIO(?, ?)}";

		logCall(callQuery, new String[] { "pPSCONVEN" }, new Object[] { pPSCONVEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONVEN);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_ESTADOS_CONVENIO(java.math.BigDecimal pPSCONVEN) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_ESTADOS_CONVENIO(pPSCONVEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_ESTADOS_CONVENIO

	// --START-PAC_IAX_PROF.F_SET_ESTADO_CONVENIO(SCONVEN, CESTADO, FESTADO,
	// TOBSERVACIONES)
	private HashMap callPAC_IAX_PROF__F_SET_ESTADO_CONVENIO(java.math.BigDecimal pSCONVEN,
			java.math.BigDecimal pCESTADO, java.sql.Date pFESTADO, String pTOBSERVACIONES) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_ESTADO_CONVENIO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSCONVEN", "pCESTADO", "pFESTADO", "pTOBSERVACIONES" },
				new Object[] { pSCONVEN, pCESTADO, pFESTADO, pTOBSERVACIONES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCONVEN);
		cStmt.setObject(3, pCESTADO);
		cStmt.setObject(4, pFESTADO);
		cStmt.setObject(5, pTOBSERVACIONES);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_ESTADO_CONVENIO(java.math.BigDecimal pSCONVEN,
			java.math.BigDecimal pCESTADO, java.sql.Date pFESTADO, String pTOBSERVACIONES) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_ESTADO_CONVENIO(pSCONVEN, pCESTADO, pFESTADO, pTOBSERVACIONES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_ESTADO_CONVENIO

	// --START-PAC_IAX_PROF.F_DEL_ESTADO_CONVENIO(SCONVEN, CESTADO, FESTADO)
	private HashMap callPAC_IAX_PROF__F_DEL_ESTADO_CONVENIO(java.math.BigDecimal pSCONVEN,
			java.math.BigDecimal pCESTADO, java.sql.Date pFESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_DEL_ESTADO_CONVENIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSCONVEN", "pCESTADO", "pFESTADO" },
				new Object[] { pSCONVEN, pCESTADO, pFESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCONVEN);
		cStmt.setObject(3, pCESTADO);
		cStmt.setObject(4, pFESTADO);
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

	public HashMap ejecutaPAC_IAX_PROF__F_DEL_ESTADO_CONVENIO(java.math.BigDecimal pSCONVEN,
			java.math.BigDecimal pCESTADO, java.sql.Date pFESTADO) throws Exception {
		return this.callPAC_IAX_PROF__F_DEL_ESTADO_CONVENIO(pSCONVEN, pCESTADO, pFESTADO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_DEL_ESTADO_CONVENIO

	// --START-PAC_IAX_PROF.F_SET_CONVENIO(SCONVEN, SPROFES, STARIFA, SPERSED,
	// NCOMPLE, NPRIORM, TDESCRI, PCVALOR, PCTIPO, PNIMPORTE, PNPORCENT, PTERMINO)
	private HashMap callPAC_IAX_PROF__F_SET_CONVENIO(java.math.BigDecimal pSCONVEN, java.math.BigDecimal pSPROFES,
			java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSPERSED, java.math.BigDecimal pNCOMPLE,
			java.math.BigDecimal pNPRIORM, String pTDESCRI, java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPNIMPORTE, java.math.BigDecimal pPNPORCENT, String pPTERMINO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_CONVENIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pSCONVEN", "pSPROFES", "pSTARIFA", "pSPERSED", "pNCOMPLE", "pNPRIORM", "pTDESCRI",
						"pPCVALOR", "pPCTIPO", "pPNIMPORTE", "pPNPORCENT", "pPTERMINO" },
				new Object[] { pSCONVEN, pSPROFES, pSTARIFA, pSPERSED, pNCOMPLE, pNPRIORM, pTDESCRI, pPCVALOR, pPCTIPO,
						pPNIMPORTE, pPNPORCENT, pPTERMINO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCONVEN);
		cStmt.setObject(3, pSPROFES);
		cStmt.setObject(4, pSTARIFA);
		cStmt.setObject(5, pSPERSED);
		cStmt.setObject(6, pNCOMPLE);
		cStmt.setObject(7, pNPRIORM);
		cStmt.setObject(8, pTDESCRI);
		cStmt.setObject(9, pPCVALOR);
		cStmt.setObject(10, pPCTIPO);
		cStmt.setObject(11, pPNIMPORTE);
		cStmt.setObject(12, pPNPORCENT);
		cStmt.setObject(13, pPTERMINO);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_CONVENIO(java.math.BigDecimal pSCONVEN, java.math.BigDecimal pSPROFES,
			java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSPERSED, java.math.BigDecimal pNCOMPLE,
			java.math.BigDecimal pNPRIORM, String pTDESCRI, java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPNIMPORTE, java.math.BigDecimal pPNPORCENT, String pPTERMINO) throws Exception {
		return this.callPAC_IAX_PROF__F_SET_CONVENIO(pSCONVEN, pSPROFES, pSTARIFA, pSPERSED, pNCOMPLE, pNPRIORM,
				pTDESCRI, pPCVALOR, pPCTIPO, pPNIMPORTE, pPNPORCENT, pPTERMINO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_CONVENIO

	// --START-PAC_IAX_PROF.F_GET_TARIFA(STARIFA)
	private HashMap callPAC_IAX_PROF__F_GET_TARIFA(java.math.BigDecimal pSTARIFA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_TARIFA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSTARIFA" }, new Object[] { pSTARIFA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PROF_TARIFA".toUpperCase())); // Valor de "TARIFA"
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
			retVal.put("TARIFA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("TARIFA", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_TARIFA(java.math.BigDecimal pSTARIFA) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_TARIFA(pSTARIFA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_TARIFA

	// --START-PAC_IAX_PROF.F_GET_CONVENIO(SCONVEN)
	private HashMap callPAC_IAX_PROF__F_GET_CONVENIO(java.math.BigDecimal pSCONVEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_CONVENIO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSCONVEN" }, new Object[] { pSCONVEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCONVEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PROF_CONVE".toUpperCase())); // Valor de "CONVENIO"
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
			retVal.put("CONVENIO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("CONVENIO", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_CONVENIO(java.math.BigDecimal pSCONVEN) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_CONVENIO(pSCONVEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_CONVENIO

	// --START-PAC_IAX_PROF.F_ACTUALIZA_SERVICIO(STARIFA, SSERVIC, IPRECIO, IMINIMO,
	// FINIVIG)
	private HashMap callPAC_IAX_PROF__F_ACTUALIZA_SERVICIO(java.math.BigDecimal pSTARIFA, java.math.BigDecimal pSSERVIC,
			java.math.BigDecimal pIPRECIO, java.math.BigDecimal pIMINIMO, java.sql.Date pFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_ACTUALIZA_SERVICIO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSTARIFA", "pSSERVIC", "pIPRECIO", "pIMINIMO", "pFINIVIG" },
				new Object[] { pSTARIFA, pSSERVIC, pIPRECIO, pIMINIMO, pFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA);
		cStmt.setObject(3, pSSERVIC);
		cStmt.setObject(4, pIPRECIO);
		cStmt.setObject(5, pIMINIMO);
		cStmt.setObject(6, pFINIVIG);
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

	public HashMap ejecutaPAC_IAX_PROF__F_ACTUALIZA_SERVICIO(java.math.BigDecimal pSTARIFA,
			java.math.BigDecimal pSSERVIC, java.math.BigDecimal pIPRECIO, java.math.BigDecimal pIMINIMO,
			java.sql.Date pFINIVIG) throws Exception {
		return this.callPAC_IAX_PROF__F_ACTUALIZA_SERVICIO(pSTARIFA, pSSERVIC, pIPRECIO, pIMINIMO, pFINIVIG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_ACTUALIZA_SERVICIO

	// --START-PAC_IAX_PROF.F_COPIAR_TARIFA(STARIFA_NEW, STARIFA_SEL)
	private HashMap callPAC_IAX_PROF__F_COPIAR_TARIFA(java.math.BigDecimal pSTARIFA_NEW,
			java.math.BigDecimal pSTARIFA_SEL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_COPIAR_TARIFA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSTARIFA_NEW", "pSTARIFA_SEL" },
				new Object[] { pSTARIFA_NEW, pSTARIFA_SEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA_NEW);
		cStmt.setObject(3, pSTARIFA_SEL);
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

	public HashMap ejecutaPAC_IAX_PROF__F_COPIAR_TARIFA(java.math.BigDecimal pSTARIFA_NEW,
			java.math.BigDecimal pSTARIFA_SEL) throws Exception {
		return this.callPAC_IAX_PROF__F_COPIAR_TARIFA(pSTARIFA_NEW, pSTARIFA_SEL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_COPIAR_TARIFA

	// --START-PAC_IAX_PROF.F_ACTUALIZA_SERVICIOS(STARIFA, SERVICIOS, CVALOR, CTIPO,
	// NIMPORTE, NPORCENT)
	private HashMap callPAC_IAX_PROF__F_ACTUALIZA_SERVICIOS(java.math.BigDecimal pSTARIFA, String pSERVICIOS,
			java.math.BigDecimal pCVALOR, java.math.BigDecimal pCTIPO, java.math.BigDecimal pNIMPORTE,
			java.math.BigDecimal pNPORCENT) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_ACTUALIZA_SERVICIOS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pSTARIFA", "pSERVICIOS", "pCVALOR", "pCTIPO", "pNIMPORTE", "pNPORCENT" },
				new Object[] { pSTARIFA, pSERVICIOS, pCVALOR, pCTIPO, pNIMPORTE, pNPORCENT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSTARIFA);
		cStmt.setObject(3, pSERVICIOS);
		cStmt.setObject(4, pCVALOR);
		cStmt.setObject(5, pCTIPO);
		cStmt.setObject(6, pNIMPORTE);
		cStmt.setObject(7, pNPORCENT);
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

	public HashMap ejecutaPAC_IAX_PROF__F_ACTUALIZA_SERVICIOS(java.math.BigDecimal pSTARIFA, String pSERVICIOS,
			java.math.BigDecimal pCVALOR, java.math.BigDecimal pCTIPO, java.math.BigDecimal pNIMPORTE,
			java.math.BigDecimal pNPORCENT) throws Exception {
		return this.callPAC_IAX_PROF__F_ACTUALIZA_SERVICIOS(pSTARIFA, pSERVICIOS, pCVALOR, pCTIPO, pNIMPORTE,
				pNPORCENT);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROF.F_ACTUALIZA_SERVICIOS
	// --START-PAC_IAX_PROF.F_GET_TIPOS_PROFESIONAL()
	private HashMap callPAC_IAX_PROF__F_GET_TIPOS_PROFESIONAL() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_TIPOS_PROFESIONAL(?)}";

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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_TIPOS_PROFESIONAL() throws Exception {
		return this.callPAC_IAX_PROF__F_GET_TIPOS_PROFESIONAL();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROF.F_GET_TIPOS_PROFESIONAL
	// --START-PAC_IAX_PROF.F_GET_SUBTIPOS_PROFESIONAL(PCTIPPROF)
	private HashMap callPAC_IAX_PROF__F_GET_SUBTIPOS_PROFESIONAL(java.math.BigDecimal pPCTIPPROF) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_SUBTIPOS_PROFESIONAL(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPROF" }, new Object[] { pPCTIPPROF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPROF);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_SUBTIPOS_PROFESIONAL(java.math.BigDecimal pPCTIPPROF) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_SUBTIPOS_PROFESIONAL(pPCTIPPROF);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_SUBTIPOS_PROFESIONAL

	public Map ejecutaPAC_IAX_PROF__F_GET_DOCUMENTOS(BigDecimal psprofes, BigDecimal piddocgedox) {
		return null;
	}

	// --START-PAC_IAX_PROF.F_SET_DOCUMENTACION(PSPROFES, PSPERSON, PCAGENTE,
	// PFCADUCA, PTOBSERVA, PTFILENAME, PIDDOCGEDOX, PTDESC, PIDCAT)
	private HashMap callPAC_IAX_PROF__F_SET_DOCUMENTACION(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA, String pPTOBSERVA,
			String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC, java.math.BigDecimal pPIDCAT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_DOCUMENTACION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROFES", "pPSPERSON", "pPCAGENTE", "pPFCADUCA", "pPTOBSERVA", "pPTFILENAME",
						"pPIDDOCGEDOX", "pPTDESC", "pPIDCAT" },
				new Object[] { pPSPROFES, pPSPERSON, pPCAGENTE, pPFCADUCA, pPTOBSERVA, pPTFILENAME, pPIDDOCGEDOX,
						pPTDESC, pPIDCAT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPFCADUCA);
		cStmt.setObject(6, pPTOBSERVA);
		cStmt.setObject(7, pPTFILENAME);
		cStmt.setObject(8, pPIDDOCGEDOX);
		cStmt.setObject(9, pPTDESC);
		cStmt.setObject(10, pPIDCAT);
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

	public HashMap ejecutaPAC_IAX_PROF__F_SET_DOCUMENTACION(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA, String pPTOBSERVA,
			String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC, java.math.BigDecimal pPIDCAT)
			throws Exception {
		return this.callPAC_IAX_PROF__F_SET_DOCUMENTACION(pPSPROFES, pPSPERSON, pPCAGENTE, pPFCADUCA, pPTOBSERVA,
				pPTFILENAME, pPIDDOCGEDOX, pPTDESC, pPIDCAT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_DOCUMENTACION

	// --START-PAC_IAX_PROF.F_GET_TDESCRI_TARIFA(PSTARIFA)
	private HashMap callPAC_IAX_PROF__F_GET_TDESCRI_TARIFA(java.math.BigDecimal pPSTARIFA) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_TDESCRI_TARIFA(?, ?)}";

		logCall(callQuery, new String[] { "pPSTARIFA" }, new Object[] { pPSTARIFA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSTARIFA);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_TDESCRI_TARIFA(java.math.BigDecimal pPSTARIFA) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_TDESCRI_TARIFA(pPSTARIFA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_TDESCRI_TARIFA

	// --START-PAC_IAX_PROF.F_GET_TARIFA_PROFESIONAL(PSPROFES, PSCONVEN)
	private HashMap callPAC_IAX_PROF__F_GET_TARIFA_PROFESIONAL(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPSCONVEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_GET_TARIFA_PROFESIONAL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROFES", "pPSCONVEN" }, new Object[] { pPSPROFES, pPSCONVEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROFES);
		cStmt.setObject(3, pPSCONVEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSTARIFA"
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
			retVal.put("PSTARIFA", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSTARIFA", null);
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

	public HashMap ejecutaPAC_IAX_PROF__F_GET_TARIFA_PROFESIONAL(java.math.BigDecimal pPSPROFES,
			java.math.BigDecimal pPSCONVEN) throws Exception {
		return this.callPAC_IAX_PROF__F_GET_TARIFA_PROFESIONAL(pPSPROFES, pPSCONVEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_GET_TARIFA_PROFESIONAL

	// --START-PAC_IAX_PROF.F_LSTMAGNITUD(PCTIPCAL)
	private HashMap callPAC_IAX_PROF__F_LSTMAGNITUD(java.math.BigDecimal pPCTIPCAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_LSTMAGNITUD(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPCAL" }, new Object[] { pPCTIPCAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPCAL);
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

	public HashMap ejecutaPAC_IAX_PROF__F_LSTMAGNITUD(java.math.BigDecimal pPCTIPCAL) throws Exception {
		return this.callPAC_IAX_PROF__F_LSTMAGNITUD(pPCTIPCAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_LSTMAGNITUD

	// --START-PAC_IAX_PROF.F_LSTTERMINOS()
	private HashMap callPAC_IAX_PROF__F_LSTTERMINOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_LSTTERMINOS(?)}";

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

	public HashMap ejecutaPAC_IAX_PROF__F_LSTTERMINOS() throws Exception {
		return this.callPAC_IAX_PROF__F_LSTTERMINOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_LSTTERMINOS

	// --START-PAC_IAX_PROF.F_SET_CONVENIO_TEMPORAL(PNSINIES, PNTRAMIT, PSPERSON,
	// PNLOCALI, PCTIPPRO, PCSUBPRO, PSTARIFA, PNNUMIDE, PTNOMBRE, PCVALOR, PCTIPO,
	// PNIMPORTE, PNPORCENT, PTERMINO, PTEMAIL, PCAGENTE)
	private HashMap callPAC_IAX_PROF__F_SET_CONVENIO_TEMPORAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPCTIPPRO,
			java.math.BigDecimal pPCSUBPRO, java.math.BigDecimal pPSTARIFA, String pPNNUMIDE, String pPTNOMBRE,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPNIMPORTE,
			java.math.BigDecimal pPNPORCENT, String pPTERMINO, String pPTEMAIL, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PROF.F_SET_CONVENIO_TEMPORAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPSPERSON", "pPNLOCALI", "pPCTIPPRO", "pPCSUBPRO",
						"pPSTARIFA", "pPNNUMIDE", "pPTNOMBRE", "pPCVALOR", "pPCTIPO", "pPNIMPORTE", "pPNPORCENT",
						"pPTERMINO", "pPTEMAIL", "pPCAGENTE" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPSPERSON, pPNLOCALI, pPCTIPPRO, pPCSUBPRO, pPSTARIFA, pPNNUMIDE,
						pPTNOMBRE, pPCVALOR, pPCTIPO, pPNIMPORTE, pPNPORCENT, pPTERMINO, pPTEMAIL, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPNLOCALI);
		cStmt.setObject(6, pPCTIPPRO);
		cStmt.setObject(7, pPCSUBPRO);
		cStmt.setObject(8, pPSTARIFA);
		cStmt.setObject(9, pPNNUMIDE);
		cStmt.setObject(10, pPTNOMBRE);
		cStmt.setObject(11, pPCVALOR);
		cStmt.setObject(12, pPCTIPO);
		cStmt.setObject(13, pPNIMPORTE);
		cStmt.setObject(14, pPNPORCENT);
		cStmt.setObject(15, pPTERMINO);
		cStmt.setObject(16, pPTEMAIL);
		cStmt.setObject(17, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(18, java.sql.Types.NUMERIC); // Valor de "PSPROFES"
		cStmt.registerOutParameter(19, java.sql.Types.NUMERIC); // Valor de "PSCONVEN"
		cStmt.registerOutParameter(20, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSPROFES", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PSPROFES", null);
		}
		try {
			retVal.put("PSCONVEN", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("PSCONVEN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PROF__F_SET_CONVENIO_TEMPORAL(String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNLOCALI, java.math.BigDecimal pPCTIPPRO,
			java.math.BigDecimal pPCSUBPRO, java.math.BigDecimal pPSTARIFA, String pPNNUMIDE, String pPTNOMBRE,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPNIMPORTE,
			java.math.BigDecimal pPNPORCENT, String pPTERMINO, String pPTEMAIL, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		return this.callPAC_IAX_PROF__F_SET_CONVENIO_TEMPORAL(pPNSINIES, pPNTRAMIT, pPSPERSON, pPNLOCALI, pPCTIPPRO,
				pPCSUBPRO, pPSTARIFA, pPNNUMIDE, pPTNOMBRE, pPCVALOR, pPCTIPO, pPNIMPORTE, pPNPORCENT, pPTERMINO,
				pPTEMAIL, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROF.F_SET_CONVENIO_TEMPORAL

}
