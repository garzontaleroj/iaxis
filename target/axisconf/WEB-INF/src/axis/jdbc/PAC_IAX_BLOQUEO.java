package axis.jdbc; //WLS-Ready

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_BLOQUEO extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_BLOQUEO.class);
	private Connection conn = null;

	public PAC_IAX_BLOQUEO(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_BLOQUEO.F_GET_CMOTMOV(TMOTMOV)

	private HashMap callPAC_IAX_BLOQUEO__F_GET_CMOTMOV(String pTMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_GET_CMOTMOV(?, ?)}";

		logCall(callQuery, new String[] { "pTMOTMOV" }, new Object[] { pTMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pTMOTMOV);
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_GET_CMOTMOV(String pTMOTMOV) throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_GET_CMOTMOV(pTMOTMOV);
	}
	// --END-PAC_IAX_BLOQUEO.F_GET_CMOTMOV
	// --START-PAC_IAX_BLOQUEO.F_GET_MOV(PSSEGURO, PTMOTMOV)

	private HashMap callPAC_IAX_BLOQUEO__F_GET_MOV(BigDecimal pPSSEGURO, String pPTMOTMOV, BigDecimal pPNMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_GET_MOV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTMOTMOV", "pPNMOVIMI" },
				new Object[] { pPSSEGURO, pPTMOTMOV, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
		// bug_27766 a�ado nuevos campos
		cStmt.setObject(4, pPNMOVIMI);
		// Fin Bug 27766
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_GET_MOV(BigDecimal pPSSEGURO, String pPTMOTMOV, BigDecimal pPNMOVIMI)
			throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_GET_MOV(pPSSEGURO, pPTMOTMOV, pPNMOVIMI);
	}
	// --END-PAC_IAX_BLOQUEO.F_GET_MOV

	// bug_27766 a�ado nueva funci�n
	// --START-PAC_IAX_BLOQUEO.F_GET_PIGNORADORES(pPSSEGURO,pPCMOTMOV)
	private HashMap callPAC_IAX_BLOQUEO__F_GET_PIGNORADORES(BigDecimal pPSSEGURO, BigDecimal pPCMOTMOV, String pPMODO,
			BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_GET_PIGNORADORES(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMOTMOV", "pPMODO", "pPNMOVIMI" },
				new Object[] { pPSSEGURO, pPCMOTMOV, pPMODO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(4, pPMODO);
		cStmt.setObject(5, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_GET_PIGNORADORES(BigDecimal pPSSEGURO, BigDecimal pPCMOTMOV, String pPMODO,
			BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_GET_PIGNORADORES(pPSSEGURO, pPCMOTMOV, pPMODO, pPNMOVIMI);
	}

	// --END-PAC_IAX_BLOQUEO.F_GET_PIGNORADORES
	// --START-PAC_IAX_BLOQUEO.F_GET_TEXTDESBLOQ(PSSEGURO, PTMOTMOV, PNBLOQUEO)

	private HashMap callPAC_IAX_BLOQUEO__F_GET_TEXTDESBLOQ(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.math.BigDecimal pPNBLOQUEO) throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_GET_TEXTDESBLOQ(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTMOTMOV", "pPNBLOQUEO" },
				new Object[] { pPSSEGURO, pPTMOTMOV, pPNBLOQUEO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
		cStmt.setObject(4, pPNBLOQUEO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_GET_TEXTDESBLOQ(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.math.BigDecimal pPNBLOQUEO) throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_GET_TEXTDESBLOQ(pPSSEGURO, pPTMOTMOV, pPNBLOQUEO);
	}
	// --END-PAC_IAX_BLOQUEO.F_GET_TEXTDESBLOQ

	// --START-PAC_IAX_BLOQUEO.F_SET_MOV(PSSEGURO, PTMOTMOV, PFMOVINI, PFMOVFIN,
	// PTTEXTO, PTTEXTO2, PIMPORTE, PSPERSON, PCOPCIONAL, PNRANGO, PNCOLATER,
	// PNMOVIMI, PMODO, PCAUSA)
	private HashMap callPAC_IAX_BLOQUEO__F_SET_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.sql.Date pPFMOVINI, java.sql.Date pPFMOVFIN, String pPTTEXTO, String pPTTEXTO2,
			java.math.BigDecimal pPIMPORTE, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCOPCIONAL,
			java.math.BigDecimal pPNRANGO, java.math.BigDecimal pPNCOLATER, java.math.BigDecimal pPNMOVIMI,
			String pPMODO, java.math.BigDecimal pPCAUSA) throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_SET_MOV(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPTMOTMOV", "pPFMOVINI", "pPFMOVFIN", "pPTTEXTO", "pPTTEXTO2", "pPIMPORTE",
						"pPSPERSON", "pPCOPCIONAL", "pPNRANGO", "pPNCOLATER", "pPNMOVIMI", "pPMODO", "pPCAUSA" },
				new Object[] { pPSSEGURO, pPTMOTMOV, pPFMOVINI, pPFMOVFIN, pPTTEXTO, pPTTEXTO2, pPIMPORTE, pPSPERSON,
						pPCOPCIONAL, pPNRANGO, pPNCOLATER, pPNMOVIMI, pPMODO, pPCAUSA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
		cStmt.setObject(4, pPFMOVINI);
		cStmt.setObject(5, pPFMOVFIN);
		cStmt.setObject(6, pPTTEXTO);
		cStmt.setObject(7, pPTTEXTO2);
		cStmt.setObject(8, pPIMPORTE);
		cStmt.setObject(9, pPSPERSON);
		cStmt.setObject(10, pPCOPCIONAL);
		cStmt.setObject(11, pPNRANGO);
		cStmt.setObject(12, pPNCOLATER);
		cStmt.setObject(13, pPNMOVIMI);
		cStmt.setObject(14, pPMODO);
		cStmt.setObject(15, pPCAUSA);
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_SET_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.sql.Date pPFMOVINI, java.sql.Date pPFMOVFIN, String pPTTEXTO, String pPTTEXTO2,
			java.math.BigDecimal pPIMPORTE, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCOPCIONAL,
			java.math.BigDecimal pPNRANGO, java.math.BigDecimal pPNCOLATER, java.math.BigDecimal pPNMOVIMI,
			String pPMODO, java.math.BigDecimal pPCAUSA) throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_SET_MOV(pPSSEGURO, pPTMOTMOV, pPFMOVINI, pPFMOVFIN, pPTTEXTO, pPTTEXTO2,
				pPIMPORTE, pPSPERSON, pPCOPCIONAL, pPNRANGO, pPNCOLATER, pPNMOVIMI, pPMODO, pPCAUSA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_BLOQUEO.F_SET_MOV

	// --START-PAC_IAX_BLOQUEO.F_GET_BLOQUEOS(PSSEGURO)
	private HashMap callPAC_IAX_BLOQUEO__F_GET_BLOQUEOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_GET_BLOQUEOS(?, ?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);// Valor de "RETURN"
		// cStmt.registerOutParameter(1, java.sql.Types.NUMERIC);
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_GET_BLOQUEOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_GET_BLOQUEOS(pPSSEGURO);
	}
	// --END-PAC_IAX_BLOQUEO.F_GET_BLOQUEOS

	// --START-PAC_IAX_BLOQUEO.F_VALIDA_CREA_MOV(PSSEGURO, PTMOTMOV)

	private HashMap callPAC_IAX_BLOQUEO__F_VALIDA_CREA_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_VALIDA_CREA_MOV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTMOTMOV" }, new Object[] { pPSSEGURO, pPTMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_VALIDA_CREA_MOV(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV)
			throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_VALIDA_CREA_MOV(pPSSEGURO, pPTMOTMOV);
	}

	// --END-PAC_IAX_BLOQUEO.F_VALIDA_CREA_MOV
	// --START-PAC_IAX_BLOQUEO.F_UPDATE_PLEDGED(PSSEGURO, PTMOTMOV, PNMOVIMI,
	// PTTEXTO_ANT, PSPERSON_ANT, PNRANGO_ANT, PNCOLATER_ANT, PFMOVINI_ANT,
	// PTTEXTO_UPD, PSPERSON_UPD, PNRANGO_UPD, PNCOLATER_UPD, PFMOVINI_UPD)
	private HashMap callPAC_IAX_BLOQUEO__F_UPDATE_PLEDGED(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.math.BigDecimal pPNMOVIMI, String pPTTEXTO_ANT, java.math.BigDecimal pPSPERSON_ANT,
			java.math.BigDecimal pPNRANGO_ANT, java.math.BigDecimal pPNCOLATER_ANT, java.sql.Date pPFMOVINI_ANT,
			String pPTTEXTO_UPD, java.math.BigDecimal pPSPERSON_UPD, java.math.BigDecimal pPNRANGO_UPD,
			java.math.BigDecimal pPNCOLATER_UPD, java.sql.Date pPFMOVINI_UPD) throws Exception {
		String callQuery = "{?=call PAC_IAX_BLOQUEO.F_UPDATE_PLEDGED(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPTMOTMOV", "pPNMOVIMI", "pPTTEXTO_ANT", "pPSPERSON_ANT", "pPNRANGO_ANT",
						"pPNCOLATER_ANT", "pPFMOVINI_ANT", "pPTTEXTO_UPD", "pPSPERSON_UPD", "pPNRANGO_UPD",
						"pPNCOLATER_UPD", "pPFMOVINI_UPD" },
				new Object[] { pPSSEGURO, pPTMOTMOV, pPNMOVIMI, pPTTEXTO_ANT, pPSPERSON_ANT, pPNRANGO_ANT,
						pPNCOLATER_ANT, pPFMOVINI_ANT, pPTTEXTO_UPD, pPSPERSON_UPD, pPNRANGO_UPD, pPNCOLATER_UPD,
						pPFMOVINI_UPD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTMOTMOV);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPTTEXTO_ANT);
		cStmt.setObject(6, pPSPERSON_ANT);
		cStmt.setObject(7, pPNRANGO_ANT);
		cStmt.setObject(8, pPNCOLATER_ANT);
		cStmt.setObject(9, pPFMOVINI_ANT);
		cStmt.setObject(10, pPTTEXTO_UPD);
		cStmt.setObject(11, pPSPERSON_UPD);
		cStmt.setObject(12, pPNRANGO_UPD);
		cStmt.setObject(13, pPNCOLATER_UPD);
		cStmt.setObject(14, pPFMOVINI_UPD);
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

	public HashMap ejecutaPAC_IAX_BLOQUEO__F_UPDATE_PLEDGED(java.math.BigDecimal pPSSEGURO, String pPTMOTMOV,
			java.math.BigDecimal pPNMOVIMI, String pPTTEXTO_ANT, java.math.BigDecimal pPSPERSON_ANT,
			java.math.BigDecimal pPNRANGO_ANT, java.math.BigDecimal pPNCOLATER_ANT, java.sql.Date pPFMOVINI_ANT,
			String pPTTEXTO_UPD, java.math.BigDecimal pPSPERSON_UPD, java.math.BigDecimal pPNRANGO_UPD,
			java.math.BigDecimal pPNCOLATER_UPD, java.sql.Date pPFMOVINI_UPD) throws Exception {
		return this.callPAC_IAX_BLOQUEO__F_UPDATE_PLEDGED(pPSSEGURO, pPTMOTMOV, pPNMOVIMI, pPTTEXTO_ANT, pPSPERSON_ANT,
				pPNRANGO_ANT, pPNCOLATER_ANT, pPFMOVINI_ANT, pPTTEXTO_UPD, pPSPERSON_UPD, pPNRANGO_UPD, pPNCOLATER_UPD,
				pPFMOVINI_UPD);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_BLOQUEO.F_UPDATE_PLEDGED

}
