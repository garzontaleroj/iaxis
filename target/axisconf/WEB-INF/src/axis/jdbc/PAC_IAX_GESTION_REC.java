//Revision:# S+S0k2yK4TI3cdRVryk/fQ== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GESTION_REC extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_GESTION_REC.class);
	private Connection conn = null;

	public PAC_IAX_GESTION_REC(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_GESTION_REC.F_TRANSFERIR(PNRECIBO_ORIGEN, PNRECIBO_DESTINO,
	// PISALDO)
	/*
	 * private HashMap callPAC_IAX_GESTION_REC__F_TRANSFERIR (java.math.BigDecimal
	 * pPNRECIBO_ORIGEN, java.math.BigDecimal pPNRECIBO_DESTINO,
	 * java.math.BigDecimal pPISALDO) throws Exception { String
	 * callQuery="{?=call PAC_IAX_GESTION_REC.F_TRANSFERIR(?, ?, ?, ?)}";
	 * 
	 * logCall(callQuery, new String[] {"pPNRECIBO_ORIGEN", "pPNRECIBO_DESTINO",
	 * "pPISALDO"}, new Object[] {pPNRECIBO_ORIGEN, pPNRECIBO_DESTINO, pPISALDO});
	 * CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(2,
	 * pPNRECIBO_ORIGEN); cStmt.setObject(3, pPNRECIBO_DESTINO); cStmt.setObject(4,
	 * pPISALDO); cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
	 * "RETURN" cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
	 * UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de
	 * "MENSAJES" cStmt.execute(); HashMap retVal=new HashMap(); try {
	 * retVal.put("RETURN", cStmt.getObject(1)); } catch (SQLException e) {
	 * retVal.put("RETURN", null); } try { retVal.put("MENSAJES",
	 * cStmt.getObject(5)); } catch (SQLException e) { retVal.put("MENSAJES", null);
	 * } retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_GESTION_REC__F_TRANSFERIR (java.math.BigDecimal
	 * pPNRECIBO_ORIGEN, java.math.BigDecimal pPNRECIBO_DESTINO,
	 * java.math.BigDecimal pPISALDO) throws Exception { return
	 * this.callPAC_IAX_GESTION_REC__F_TRANSFERIR(pPNRECIBO_ORIGEN,
	 * pPNRECIBO_DESTINO, pPISALDO); }
	 */
	// --END-PAC_IAX_GESTION_REC.F_TRANSFERIR

	// --START-PAC_IAX_GESTION_REC.F_TRANSFERIR(PNRECIBO_ORIGEN, PNRECIBO_DESTINO,
	// PISALDO, PTDESCRIP)
	private HashMap callPAC_IAX_GESTION_REC__F_TRANSFERIR(java.math.BigDecimal pPNRECIBO_ORIGEN,
			java.math.BigDecimal pPNRECIBO_DESTINO, java.math.BigDecimal pPISALDO, String pPTDESCRIP) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_TRANSFERIR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO_ORIGEN", "pPNRECIBO_DESTINO", "pPISALDO", "pPTDESCRIP" },
				new Object[] { pPNRECIBO_ORIGEN, pPNRECIBO_DESTINO, pPISALDO, pPTDESCRIP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO_ORIGEN);
		cStmt.setObject(3, pPNRECIBO_DESTINO);
		cStmt.setObject(4, pPISALDO);
		cStmt.setObject(5, pPTDESCRIP);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_TRANSFERIR(java.math.BigDecimal pPNRECIBO_ORIGEN,
			java.math.BigDecimal pPNRECIBO_DESTINO, java.math.BigDecimal pPISALDO, String pPTDESCRIP) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_TRANSFERIR(pPNRECIBO_ORIGEN, pPNRECIBO_DESTINO, pPISALDO, pPTDESCRIP);
	}
	// --END-PAC_IAX_GESTION_REC.F_TRANSFERIR

	// --START-PAC_IAX_GESTION_REC.F_GET_SALDO_INICIAL(PNRECIBO)
	private HashMap callPAC_IAX_GESTION_REC__F_GET_SALDO_INICIAL(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_SALDO_INICIAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PISALDO"
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
			retVal.put("PISALDO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PISALDO", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_SALDO_INICIAL(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_SALDO_INICIAL(pPNRECIBO);
	}
	// --END-PAC_IAX_GESTION_REC.F_GET_SALDO_INICIAL

	// --START-PAC_IAX_GESTION_REC.F_ANULACION_PENDIENTE(PNRECIBO)
	private HashMap callPAC_IAX_GESTION_REC__F_ANULACION_PENDIENTE(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_ANULACION_PENDIENTE(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_ANULACION_PENDIENTE(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_ANULACION_PENDIENTE(pPNRECIBO);
	}

	// --END-PAC_IAX_GESTION_REC.F_ANULACION_PENDIENTE
	// --START-PAC_IAX_GESTION_REC.F_ANULA_RECIBO(PNRECIBO, PFANULAC, PCMOTANU)
	private HashMap callPAC_IAX_GESTION_REC__F_ANULA_RECIBO(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFANULAC,
			java.math.BigDecimal pPCMOTANU) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_ANULA_RECIBO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPFANULAC", "pPCMOTANU" },
				new Object[] { pPNRECIBO, pPFANULAC, pPCMOTANU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPFANULAC);
		cStmt.setObject(4, pPCMOTANU);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_ANULA_RECIBO(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFANULAC,
			java.math.BigDecimal pPCMOTANU) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_ANULA_RECIBO(pPNRECIBO, pPFANULAC, pPCMOTANU);
	}

	// --END-PAC_IAX_GESTION_REC.F_ANULA_RECIBO
	// --START-PAC_IAX_GESTION_REC.F_CANCEL_IMPRESION_MAN(PSPROIMP)
	private HashMap callPAC_IAX_GESTION_REC__F_CANCEL_IMPRESION_MAN(java.math.BigDecimal pPSPROIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_CANCEL_IMPRESION_MAN(?, ?)}";

		logCall(callQuery, new String[] { "pPSPROIMP" }, new Object[] { pPSPROIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROIMP);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_CANCEL_IMPRESION_MAN(java.math.BigDecimal pPSPROIMP) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_CANCEL_IMPRESION_MAN(pPSPROIMP);
	}

	// --END-PAC_IAX_GESTION_REC.F_CANCEL_IMPRESION_MAN
	// --START-PAC_IAX_GESTION_REC.F_COBRO_RECIBO(PCEMPRES, PNRECIBO, PFMOVINI,
	// PCCOBBAN, PDELEGA, PHOST, PCTIPCOB)
	private HashMap callPAC_IAX_GESTION_REC__F_COBRO_RECIBO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFMOVINI, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPDELEGA, java.math.BigDecimal pPHOST, java.math.BigDecimal pPCTIPCOB)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_COBRO_RECIBO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPNRECIBO", "pPFMOVINI", "pPCCOBBAN", "pPDELEGA", "pPHOST", "pPCTIPCOB" },
				new Object[] { pPCEMPRES, pPNRECIBO, pPFMOVINI, pPCCOBBAN, pPDELEGA, pPHOST, pPCTIPCOB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPFMOVINI);
		cStmt.setObject(5, pPCCOBBAN);
		cStmt.setObject(6, pPDELEGA);
		cStmt.setObject(7, pPHOST);
		cStmt.setObject(8, pPCTIPCOB);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_COBRO_RECIBO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFMOVINI, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPDELEGA, java.math.BigDecimal pPHOST, java.math.BigDecimal pPCTIPCOB)
			throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_COBRO_RECIBO(pPCEMPRES, pPNRECIBO, pPFMOVINI, pPCCOBBAN, pPDELEGA,
				pPHOST, pPCTIPCOB);
	}

	// --END-PAC_IAX_GESTION_REC.F_COBRO_RECIBO
	// --START-PAC_IAX_GESTION_REC.F_DESSELEC_TODOS_RECIBOS(PSPROIMP)
	private HashMap callPAC_IAX_GESTION_REC__F_DESSELEC_TODOS_RECIBOS(java.math.BigDecimal pPSPROIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_DESSELEC_TODOS_RECIBOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROIMP" }, new Object[] { pPSPROIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROIMP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PITOTALR"
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
			retVal.put("PITOTALR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PITOTALR", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_DESSELEC_TODOS_RECIBOS(java.math.BigDecimal pPSPROIMP)
			throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_DESSELEC_TODOS_RECIBOS(pPSPROIMP);
	}
	// --END-PAC_IAX_GESTION_REC.F_DESSELEC_TODOS_RECIBOS

	// --START-PAC_IAX_GESTION_REC.F_GET_ACCIONES(PNRECIBO, PAVISOS)
	private HashMap callPAC_IAX_GESTION_REC__F_GET_ACCIONES(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPAVISOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_ACCIONES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPAVISOS" }, new Object[] { pPNRECIBO, pPAVISOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(4, pPAVISOS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PSALTAR"
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
			retVal.put("PSALTAR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PSALTAR", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_ACCIONES(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPAVISOS) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_ACCIONES(pPNRECIBO, pPAVISOS);
	}
	// --END-PAC_IAX_GESTION_REC.F_GET_ACCIONES

	// --START-PAC_IAX_GESTION_REC.F_GET_ANULA_PEND(PNRECIBO)
	private HashMap callPAC_IAX_GESTION_REC__F_GET_ANULA_PEND(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_ANULA_PEND(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_ANULA_PEND(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_ANULA_PEND(pPNRECIBO);
	}

	// --END-PAC_IAX_GESTION_REC.F_GET_ANULA_PEND
	// --START-PAC_IAX_GESTION_REC.F_GET_IMPR_PENDIENTE_MAN(PSPROIMP, PCIDIOMA)
	private HashMap callPAC_IAX_GESTION_REC__F_GET_IMPR_PENDIENTE_MAN(java.math.BigDecimal pPSPROIMP,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_IMPR_PENDIENTE_MAN(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROIMP", "pPCIDIOMA" }, new Object[] { pPSPROIMP, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROIMP);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PITOTALR"
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
			retVal.put("PITOTALR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PITOTALR", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_IMPR_PENDIENTE_MAN(java.math.BigDecimal pPSPROIMP,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_IMPR_PENDIENTE_MAN(pPSPROIMP, pPCIDIOMA);
	}
	// --END-PAC_IAX_GESTION_REC.F_GET_IMPR_PENDIENTE_MAN

	// --START-PAC_IAX_GESTION_REC.F_IMPAGO_RECIBO(PNRECIBO, PFECHA, PCCOBBAN,
	// PCMOTIVO, PCRECIMP, PNPOLIZA)
	private HashMap callPAC_IAX_GESTION_REC__F_IMPAGO_RECIBO(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFECHA,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCRECIMP,
			java.math.BigDecimal pPNPOLIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_IMPAGO_RECIBO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPFECHA", "pPCCOBBAN", "pPCMOTIVO", "pPCRECIMP", "pPNPOLIZA" },
				new Object[] { pPNRECIBO, pPFECHA, pPCCOBBAN, pPCMOTIVO, pPCRECIMP, pPNPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPFECHA);
		cStmt.setObject(4, pPCCOBBAN);
		cStmt.setObject(5, pPCMOTIVO);
		cStmt.setObject(6, pPCRECIMP);
		cStmt.setObject(8, pPNPOLIZA);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_IMPAGO_RECIBO(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFECHA,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCMOTIVO, java.math.BigDecimal pPCRECIMP,
			java.math.BigDecimal pPNPOLIZA) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_IMPAGO_RECIBO(pPNRECIBO, pPFECHA, pPCCOBBAN, pPCMOTIVO, pPCRECIMP,
				pPNPOLIZA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_REC.F_IMPAGO_RECIBO

	// --START-PAC_IAX_GESTION_REC.F_IMPRESION_RECIBOS_MAN(PSPROIMP, PCIDIOMA)
	private HashMap callPAC_IAX_GESTION_REC__F_IMPRESION_RECIBOS_MAN(java.math.BigDecimal pPSPROIMP,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_IMPRESION_RECIBOS_MAN(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROIMP", "pPCIDIOMA" }, new Object[] { pPSPROIMP, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROIMP);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PFICHERO"
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
			retVal.put("PFICHERO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_IMPRESION_RECIBOS_MAN(java.math.BigDecimal pPSPROIMP,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_IMPRESION_RECIBOS_MAN(pPSPROIMP, pPCIDIOMA);
	}

	// --END-PAC_IAX_GESTION_REC.F_IMPRESION_RECIBOS_MAN
	// --START-PAC_IAX_GESTION_REC.F_IMPRESION_REGISTRO_MAN(PCAGENTE, PDATAINI,
	// PDATAFIN, PCIDIOMA)
	private HashMap callPAC_IAX_GESTION_REC__F_IMPRESION_REGISTRO_MAN(java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPDATAINI, java.sql.Date pPDATAFIN, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_IMPRESION_REGISTRO_MAN(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pPDATAINI", "pPDATAFIN", "pPCIDIOMA" },
				new Object[] { pPCAGENTE, pPDATAINI, pPDATAFIN, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPDATAINI);
		cStmt.setObject(4, pPDATAFIN);
		cStmt.setObject(5, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PFICHERO1"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PFICHERO2"
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
			retVal.put("PFICHERO1", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PFICHERO1", null);
		}
		try {
			retVal.put("PFICHERO2", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PFICHERO2", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_IMPRESION_REGISTRO_MAN(java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPDATAINI, java.sql.Date pPDATAFIN, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_IMPRESION_REGISTRO_MAN(pPCAGENTE, pPDATAINI, pPDATAFIN, pPCIDIOMA);
	}
	// --END-PAC_IAX_GESTION_REC.F_IMPRESION_REGISTRO_MAN

	// --START-PAC_IAX_GESTION_REC.F_IMPR_PENDIENTE_MAN(PSPRODUC, PCAGENTE,
	// PSPROCES, PNPOLIZA, PNRECIBO, PDATAINI, PDATAFIN, PCREIMP, PSPROIMP,
	// PCRECCIA)
	private HashMap callPAC_IAX_GESTION_REC__F_IMPR_PENDIENTE_MAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPDATAINI, java.sql.Date pPDATAFIN,
			java.math.BigDecimal pPCREIMP, java.math.BigDecimal pPSPROIMP, String pPCRECCIA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_IMPR_PENDIENTE_MAN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPCAGENTE", "pPSPROCES", "pPNPOLIZA", "pPNRECIBO", "pPDATAINI",
						"pPDATAFIN", "pPCREIMP", "pPSPROIMP", "pPCRECCIA" },
				new Object[] { pPSPRODUC, pPCAGENTE, pPSPROCES, pPNPOLIZA, pPNRECIBO, pPDATAINI, pPDATAFIN, pPCREIMP,
						pPSPROIMP, pPCRECCIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPSPROCES);
		cStmt.setObject(5, pPNPOLIZA);
		cStmt.setObject(6, pPNRECIBO);
		cStmt.setObject(7, pPDATAINI);
		cStmt.setObject(8, pPDATAFIN);
		cStmt.setObject(9, pPCREIMP);
		cStmt.setObject(10, pPSPROIMP);
		cStmt.setObject(11, pPCRECCIA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(12, java.sql.Types.NUMERIC); // Valor de "PSPROIMP2"
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
			retVal.put("PSPROIMP2", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("PSPROIMP2", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_IMPR_PENDIENTE_MAN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPDATAINI, java.sql.Date pPDATAFIN,
			java.math.BigDecimal pPCREIMP, java.math.BigDecimal pPSPROIMP, String pPCRECCIA) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_IMPR_PENDIENTE_MAN(pPSPRODUC, pPCAGENTE, pPSPROCES, pPNPOLIZA, pPNRECIBO,
				pPDATAINI, pPDATAFIN, pPCREIMP, pPSPROIMP, pPCRECCIA);
	}
	// --END-PAC_IAX_GESTION_REC.F_IMPR_PENDIENTE_MAN

	// bug 20761
	// --START-PAC_IAX_GESTION_REC.F_MODIFICA_RECIBO(PNRECIBO, PCTIPBAN, PCBANCAR,
	// PCGESCOB, PCESTIMP, PCCOBBAN, PNCUOTAR, PCACCPRE, PCACCRET, PTOBSERV,
	// PCTIPCOB)
	// AAC_INI-CONF_OUTSOURCING-20160906
	private HashMap callPAC_IAX_GESTION_REC__F_MODIFICA_RECIBO(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, java.math.BigDecimal pPCGESCOB,
			java.math.BigDecimal pPCESTIMP, java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPNCUOTAR,
			java.math.BigDecimal pPCACCPRE, java.math.BigDecimal pPCACCRET, String pPTOBSERV,
			java.math.BigDecimal pPCTIPCOB, java.math.BigDecimal pCGESCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_MODIFICA_RECIBO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRECIBO", "pPCTIPBAN", "pPCBANCAR", "pPCGESCOB", "pPCESTIMP", "pPCCOBBAN",
						"pPNCUOTAR", "pPCACCPRE", "pPCACCRET", "pPTOBSERV", "pPCTIPCOB", "pCGESCAR" },
				new Object[] { pPNRECIBO, pPCTIPBAN, pPCBANCAR, pPCGESCOB, pPCESTIMP, pPCCOBBAN, pPNCUOTAR, pPCACCPRE,
						pPCACCRET, pPTOBSERV, pPCTIPCOB, pCGESCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCTIPBAN);
		cStmt.setObject(4, pPCBANCAR);
		cStmt.setObject(5, pPCGESCOB);
		cStmt.setObject(6, pPCESTIMP);
		cStmt.setObject(7, pPCCOBBAN);
		cStmt.setObject(8, pPNCUOTAR);
		cStmt.setObject(9, pPCACCPRE);
		cStmt.setObject(10, pPCACCRET);
		cStmt.setObject(11, pPTOBSERV);
		cStmt.setObject(12, pPCTIPCOB);
		cStmt.setObject(13, pCGESCAR);
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
			retVal.put("MENSAJES", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_MODIFICA_RECIBO(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, java.math.BigDecimal pPCGESCOB,
			java.math.BigDecimal pPCESTIMP, java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPNCUOTAR,
			java.math.BigDecimal pPCACCPRE, java.math.BigDecimal pPCACCRET, String pPTOBSERV,
			java.math.BigDecimal pPCTIPCOB, java.math.BigDecimal pCGESCAR) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_MODIFICA_RECIBO(pPNRECIBO, pPCTIPBAN, pPCBANCAR, pPCGESCOB, pPCESTIMP,
				pPCCOBBAN, pPNCUOTAR, pPCACCPRE, pPCACCRET, pPTOBSERV, pPCTIPCOB, pCGESCAR);// AXIS-WLS1SERVER-Ready
	}
	// --AAC_FI-CONF_OUTSOURCING-20160906
	// --END-PAC_IAX_GESTION_REC.F_MODIFICA_RECIBO

	// --START-PAC_IAX_GESTION_REC.F_SELEC_TODOS_RECIBOS(PSPROIMP)
	private HashMap callPAC_IAX_GESTION_REC__F_SELEC_TODOS_RECIBOS(java.math.BigDecimal pPSPROIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_SELEC_TODOS_RECIBOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROIMP" }, new Object[] { pPSPROIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROIMP);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PITOTALR"
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
			retVal.put("PITOTALR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PITOTALR", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_SELEC_TODOS_RECIBOS(java.math.BigDecimal pPSPROIMP) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_SELEC_TODOS_RECIBOS(pPSPROIMP);
	}

	// --END-PAC_IAX_GESTION_REC.F_SELEC_TODOS_RECIBOS
	// --START-PAC_IAX_GESTION_REC.F_SET_IMPR_PENDIENTE_MAN(PSPROIMP, PNRECIBO,
	// PCESTADO)
	private HashMap callPAC_IAX_GESTION_REC__F_SET_IMPR_PENDIENTE_MAN(java.math.BigDecimal pPSPROIMP,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_SET_IMPR_PENDIENTE_MAN(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROIMP", "pPNRECIBO", "pPCESTADO" },
				new Object[] { pPSPROIMP, pPNRECIBO, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROIMP);
		cStmt.setObject(3, pPNRECIBO);
		cStmt.setObject(4, pPCESTADO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PITOTALR"
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
			retVal.put("PITOTALR", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PITOTALR", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_SET_IMPR_PENDIENTE_MAN(java.math.BigDecimal pPSPROIMP,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_SET_IMPR_PENDIENTE_MAN(pPSPROIMP, pPNRECIBO, pPCESTADO);
	}

	// --END-PAC_IAX_GESTION_REC.F_SET_IMPR_PENDIENTE_MAN
	// --START-PAC_IAX_GESTION_REC.F_VALIDA_COBRO(PEMPRESA, PNRECIBO)
	private HashMap callPAC_IAX_GESTION_REC__F_VALIDA_COBRO(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_VALIDA_COBRO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPEMPRESA", "pPNRECIBO" }, new Object[] { pPEMPRESA, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_VALIDA_COBRO(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_VALIDA_COBRO(pPEMPRESA, pPNRECIBO);
	}
	// --END-PAC_IAX_GESTION_REC.F_VALIDA_COBRO

	// --START-PAC_IAX_GESTION_REC.F_GET_REBTOM(PSPERSON)
	private HashMap callPAC_IAX_GESTION_REC__F_GET_REBTOM(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_REBTOM(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PIPAGADO"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PIPENDIENTE"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PIMPAGADO"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PISALDO"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PRECIBOS"
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
			retVal.put("PIPAGADO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PIPAGADO", null);
		}
		try {
			retVal.put("PIPENDIENTE", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PIPENDIENTE", null);
		}
		try {
			retVal.put("PIMPAGADO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PIMPAGADO", null);
		}
		try {
			retVal.put("PISALDO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PISALDO", null);
		}
		try {
			retVal.put("PRECIBOS", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PRECIBOS", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_REBTOM(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_REBTOM(pPSPERSON);
	}
	// --END-PAC_IAX_GESTION_REC.F_GET_REBTOM

	// --START-PAC_IAX_GESTION_REC.F_REHABILITA_REC(PNRECIBO, PFREHABI)
	private HashMap callPAC_IAX_GESTION_REC__F_REHABILITA_REC(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFREHABI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_REHABILITA_REC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPFREHABI" }, new Object[] { pPNRECIBO, pPFREHABI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPFREHABI);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_REHABILITA_REC(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFREHABI)
			throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_REHABILITA_REC(pPNRECIBO, pPFREHABI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_REC.F_REHABILITA_REC

	// --START-PAC_IAX_GESTION_REC.F_SINCRONIZA_SAP(PNRECIBO)
	private HashMap callPAC_IAX_GESTION_REC__F_SINCRONIZA_SAP(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_SINCRONIZA_SAP(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_SINCRONIZA_SAP(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_SINCRONIZA_SAP(pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_REC.F_SINCRONIZA_SAP

	// --START-PAC_IAX_GESTION_REC.F_MODIFICA_ACCPRECONOCIDA(PNRECIBO, PCACCPRE)
	private HashMap callPAC_IAX_GESTION_REC__F_MODIFICA_ACCPRECONOCIDA(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCACCPRE) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_MODIFICA_ACCPRECONOCIDA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPCACCPRE" }, new Object[] { pPNRECIBO, pPCACCPRE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCACCPRE);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_MODIFICA_ACCPRECONOCIDA(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCACCPRE) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_MODIFICA_ACCPRECONOCIDA(pPNRECIBO, pPCACCPRE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_REC.F_MODIFICA_ACCPRECONOCIDA

	// --START-PAC_IAX_GESTION_REC.F_RECMAN_PENS(PSSEGURO, PNMOVIMI, PCTIPREC,
	// PIMPORTE, PCTIPCOB)
	private HashMap callPAC_IAX_GESTION_REC__F_RECMAN_PENS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCTIPREC, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCTIPCOB) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_RECMAN_PENS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPCTIPREC", "pPIMPORTE", "pPCTIPCOB" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPCTIPREC, pPIMPORTE, pPCTIPCOB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCTIPREC);
		cStmt.setObject(5, pPIMPORTE);
		cStmt.setObject(6, pPCTIPCOB);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_RECMAN_PENS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCTIPREC, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCTIPCOB) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_RECMAN_PENS(pPSSEGURO, pPNMOVIMI, pPCTIPREC, pPIMPORTE, pPCTIPCOB);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_REC.F_RECMAN_PENS

	private HashMap callPAC_IAX_GESTION_REC__F_GET_FORMULAS(java.math.BigDecimal pCAGENTE,
			java.math.BigDecimal pSPRODUC) throws Exception {

		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_LISTA_DIAS_GRACIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCAGENTE", "pSPRODUC" }, new Object[] { pCAGENTE, pSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();

		cStmt.setObject(2, pCAGENTE);
		cStmt.setObject(3, pSPRODUC);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_FORMULAS(java.math.BigDecimal pCAGENTE,
			java.math.BigDecimal pSPRODUC) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_FORMULAS(pCAGENTE, pSPRODUC);
	}

	private HashMap callPAC_IAX_GESTION_REC__F_SET_FORMULAS(java.math.BigDecimal pCAGENTE,
			java.math.BigDecimal pSPRODUC, java.sql.Date pFINICIO, java.math.BigDecimal pDIAS) throws Exception {

		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_SET_DIAS_GRACIA_AGENTE_PROD(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCAGENTE", "pSPRODUC", "pfini", "pDIAS" },
				new Object[] { pCAGENTE, pSPRODUC, pFINICIO, pDIAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();

		cStmt.setObject(2, pCAGENTE);
		cStmt.setObject(3, pSPRODUC);
		cStmt.setObject(4, pFINICIO);
		cStmt.setObject(5, pDIAS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		logger.debug(cStmt.toString());
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_SET_FORMULAS(java.math.BigDecimal pCAGENTE,
			java.math.BigDecimal pSPRODUC, java.sql.Date pFINICIO, java.math.BigDecimal pDIAS) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_SET_FORMULAS(pCAGENTE, pSPRODUC, pFINICIO, pDIAS);
	}

	private HashMap callPAC_IAX_GESTION_REC__F_DEL_FORMULAS(java.math.BigDecimal pCAGENTE,
			java.math.BigDecimal pSPRODUC, java.sql.Date pFINICIO) throws Exception {

		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_DEL_DIAS_GRACIA_AGENTE_PROD(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCAGENTE", "pSPRODUC", "pfini" },
				new Object[] { pCAGENTE, pSPRODUC, pFINICIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();

		cStmt.setObject(2, pCAGENTE);
		cStmt.setObject(3, pSPRODUC);
		cStmt.setObject(4, pFINICIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		logger.debug(cStmt.toString());
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_DEL_FORMULAS(java.math.BigDecimal pCAGENTE,
			java.math.BigDecimal pSPRODUC, java.sql.Date pFINICIO) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_DEL_FORMULAS(pCAGENTE, pSPRODUC, pFINICIO);
	}

	// --START-PAC_IAX_GESTION_REC.F_GET_ANULA_X_NO_PAGO(PCEMPRES, PCRAMO, PSPRODUC,
	// PCAGENTE, PNPOLIZA, PNCERTIF, PSUCUR, PNRECIBO, PIDTOMADOR, PNTOMADOR,
	// pABRECIBO, pSOFERTA, pPCMODIF, pPPDLEGAL, pPPJUDI, pPPGUNICA, pPPESTATAL)
	private HashMap callPAC_IAX_GESTION_REC__F_GET_ANULA_X_NO_PAGO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSUCUR,
			java.math.BigDecimal pPNRECIBO, String pPIDTOMADOR, String pPNTOMADOR, java.math.BigDecimal pABRECIBO,
			java.math.BigDecimal pSOFERTA, java.math.BigDecimal pPCMODIF, java.math.BigDecimal pPPDLEGAL,
			java.math.BigDecimal pPPJUDI, java.math.BigDecimal pPPGUNICA, java.math.BigDecimal pPPESTATAL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_ANULA_X_NO_PAGO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPCAGENTE", "pPNPOLIZA", "pPNCERTIF", "pPSUCUR",
						"pPNRECIBO", "pPIDTOMADOR", "pPNTOMADOR", "pABRECIBO", "pSOFERTA", "pPCMODIF", "pPPDLEGAL",
						"pPPJUDI", "pPPGUNICA", "pPPESTATAL" },
				new Object[] { pPCEMPRES, pPCRAMO, pPSPRODUC, pPCAGENTE, pPNPOLIZA, pPNCERTIF, pPSUCUR, pPNRECIBO,
						pPIDTOMADOR, pPNTOMADOR, pABRECIBO, pSOFERTA, pPCMODIF, pPPDLEGAL, pPPJUDI, pPPGUNICA,
						pPPESTATAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPNPOLIZA);
		cStmt.setObject(7, pPNCERTIF);
		cStmt.setObject(8, pPSUCUR);
		cStmt.setObject(9, pPNRECIBO);
		cStmt.setObject(10, pPIDTOMADOR);
		cStmt.setObject(11, pPNTOMADOR);
		cStmt.setObject(12, pABRECIBO);
		cStmt.setObject(13, pSOFERTA);
		cStmt.setObject(14, pPCMODIF);
		cStmt.setObject(15, pPPDLEGAL);
		cStmt.setObject(16, pPPJUDI);
		cStmt.setObject(17, pPPGUNICA);
		cStmt.setObject(18, pPPESTATAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.CURSOR); // Valor de "CUR"
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
			retVal.put("CUR", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("CUR", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_ANULA_X_NO_PAGO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSUCUR,
			java.math.BigDecimal pPNRECIBO, String pPIDTOMADOR, String pPNTOMADOR, java.math.BigDecimal pABRECIBO,
			java.math.BigDecimal pSOFERTA, java.math.BigDecimal pPCMODIF, java.math.BigDecimal pPPDLEGAL,
			java.math.BigDecimal pPPJUDI, java.math.BigDecimal pPPGUNICA, java.math.BigDecimal pPPESTATAL)
			throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_ANULA_X_NO_PAGO(pPCEMPRES, pPCRAMO, pPSPRODUC, pPCAGENTE, pPNPOLIZA,
				pPNCERTIF, pPSUCUR, pPNRECIBO, pPIDTOMADOR, pPNTOMADOR, pABRECIBO, pSOFERTA, pPCMODIF, pPPDLEGAL,
				pPPJUDI, pPPGUNICA, pPPESTATAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_REC.F_GET_ANULA_X_NO_PAGO

	// --START-PAC_IAX_GESTION_REC.F_SET_ANULA_X_NO_PAGO(PNRECIBO, PCCHECK)
	private HashMap callPAC_IAX_GESTION_REC__F_SET_ANULA_X_NO_PAGO(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCCHECK) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_SET_ANULA_X_NO_PAGO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPCCHECK" }, new Object[] { pPNRECIBO, pPCCHECK });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCCHECK);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_SET_ANULA_X_NO_PAGO(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCCHECK) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_SET_ANULA_X_NO_PAGO(pPNRECIBO, pPCCHECK);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_REC.F_SET_ANULA_X_NO_PAGO

	// Inicio IAXIS-3651 09/07/2019
	// --START-PAC_IAX_GESTION_REC.F_GET_LIQUIDACION(PNRECIBO,PCAGENTE_TEXT,
	// PNUMIDE,PCESTGES,PDESDE,PHASTA,CTIPOPER)
	private HashMap callPAC_IAX_GESTION_REC__F_GET_LIQUIDACION(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCAGENTE, String pPNUMIDE, java.math.BigDecimal pPCESTGES, java.sql.Date pPDESDE,
			java.sql.Date pPHASTA, java.math.BigDecimal pCTIPOPER) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_REC.F_GET_LIQUIDACION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNRECIBO", "pPCAGENTE_TEXT", "pPCESTGES", "pPNUMIDE", "pPDESDE", "pPHASTA",
						"pCTIPOPER" },
				new Object[] { pPNRECIBO, pPCAGENTE, pPCESTGES, pPNUMIDE, pPDESDE, pPHASTA, pCTIPOPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNUMIDE);
		cStmt.setObject(3, pPCESTGES);
		cStmt.setObject(4, pPDESDE);
		cStmt.setObject(5, pPHASTA);
		cStmt.setObject(6, pPCAGENTE);
		cStmt.setObject(7, pPNRECIBO);
		cStmt.setObject(8, pCTIPOPER);
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

	public HashMap ejecutaPAC_IAX_GESTION_REC__F_GET_LIQUIDACION(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCAGENTE_TEXT, String pPNUMIDE, java.math.BigDecimal pPCESTGES, java.sql.Date pPDESDE,
			java.sql.Date pPHASTA, java.math.BigDecimal pCTIPOPER) throws Exception {
		return this.callPAC_IAX_GESTION_REC__F_GET_LIQUIDACION(pPNRECIBO, pPCAGENTE_TEXT, pPNUMIDE, pPCESTGES, pPDESDE,
				pPHASTA, pCTIPOPER);
	}
	// Fin IAXIS-3651 09/07/2019
}
