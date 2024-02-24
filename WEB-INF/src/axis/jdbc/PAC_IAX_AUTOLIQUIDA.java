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

public class PAC_IAX_AUTOLIQUIDA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AUTOLIQUIDA.class);
	private Connection conn = null;

	public PAC_IAX_AUTOLIQUIDA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AUTOLIQUIDA.F_DEL_COBROS(PNLIQMEN, PCEMPRES, PCAGENTE)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_DEL_COBROS(java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_DEL_COBROS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNLIQMEN", "pPCEMPRES", "pPCAGENTE" },
				new Object[] { pPNLIQMEN, pPCEMPRES, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNLIQMEN);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_DEL_COBROS(java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_DEL_COBROS(pPNLIQMEN, pPCEMPRES, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_DEL_COBROS
	// --START-PAC_IAX_AUTOLIQUIDA.F_DEL_RECIBOS(PNLIQMEN, PCEMPRES, PCAGENTE)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_DEL_RECIBOS(java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_DEL_RECIBOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNLIQMEN", "pPCEMPRES", "pPCAGENTE" },
				new Object[] { pPNLIQMEN, pPCEMPRES, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNLIQMEN);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_DEL_RECIBOS(java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_DEL_RECIBOS(pPNLIQMEN, pPCEMPRES, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_DEL_RECIBOS
	// --START-PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDAAGE(PSPROLIQ, PCEMPRES,
	// PCAGECLAVE)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGECLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDAAGE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROLIQ", "pPCEMPRES", "pPCAGECLAVE" },
				new Object[] { pPSPROLIQ, pPCEMPRES, pPCAGECLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROLIQ);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGECLAVE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AUTOLIQUIDAAGE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGECLAVE) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(pPSPROLIQ, pPCEMPRES, pPCAGECLAVE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDAAGE
	// --START-PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDACION(PSPROLIQ, PCEMPRES,
	// PCAGENTE)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACION(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDACION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROLIQ", "pPCEMPRES", "pPCAGENTE" },
				new Object[] { pPSPROLIQ, pPCEMPRES, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROLIQ);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCAB"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURDOCCOB"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURRECPEN"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURAPUNT"
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
			retVal.put("PCURCAB", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURCAB", null);
		}
		try {
			retVal.put("PCURDOCCOB", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCURDOCCOB", null);
		}
		try {
			retVal.put("PCURRECPEN", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCURRECPEN", null);
		}
		try {
			retVal.put("PCURAPUNT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCURAPUNT", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACION(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACION(pPSPROLIQ, pPCEMPRES, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDACION
	// --START-PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDACIONES(PSPROLIQ, PCEMPRES,
	// PFLIQUIDA, PIIMPORTE, PCAGENTE, PCUSUARIO, PCESTADO, PFCOBRO)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACIONES(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFLIQUIDA, java.math.BigDecimal pPIIMPORTE,
			java.math.BigDecimal pPCAGENTE, String pPCUSUARIO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFCOBRO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDACIONES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROLIQ", "pPCEMPRES", "pPFLIQUIDA", "pPIIMPORTE", "pPCAGENTE", "pPCUSUARIO",
						"pPCESTADO", "pPFCOBRO" },
				new Object[] { pPSPROLIQ, pPCEMPRES, pPFLIQUIDA, pPIIMPORTE, pPCAGENTE, pPCUSUARIO, pPCESTADO,
						pPFCOBRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROLIQ);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPFLIQUIDA);
		cStmt.setObject(5, pPIIMPORTE);
		cStmt.setObject(6, pPCAGENTE);
		cStmt.setObject(7, pPCUSUARIO);
		cStmt.setObject(8, pPCESTADO);
		cStmt.setObject(9, pPFCOBRO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURLIQUIDA"
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
			retVal.put("PCURLIQUIDA", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCURLIQUIDA", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACIONES(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFLIQUIDA, java.math.BigDecimal pPIIMPORTE,
			java.math.BigDecimal pPCAGENTE, String pPCUSUARIO, java.math.BigDecimal pPCESTADO, java.sql.Date pPFCOBRO)
			throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACIONES(pPSPROLIQ, pPCEMPRES, pPFLIQUIDA, pPIIMPORTE,
				pPCAGENTE, pPCUSUARIO, pPCESTADO, pPFCOBRO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_GET_AUTOLIQUIDACIONES
	// --START-PAC_IAX_AUTOLIQUIDA.F_GET_CTAS(PSPROLIQ, PCEMPRES, PCAGENTE)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_GET_CTAS(java.math.BigDecimal pPSPROLIQ, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_GET_CTAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROLIQ", "pPCEMPRES", "pPCAGENTE" },
				new Object[] { pPSPROLIQ, pPCEMPRES, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROLIQ);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCTAS"
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
			retVal.put("PCURCTAS", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURCTAS", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_CTAS(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_GET_CTAS(pPSPROLIQ, pPCEMPRES, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_GET_CTAS
	// --START-PAC_IAX_AUTOLIQUIDA.F_GET_NEW_CTAS(PNLIQMEN, PCEMPRES, PCAGENTE)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_GET_NEW_CTAS(java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_GET_NEW_CTAS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNLIQMEN", "pPCEMPRES", "pPCAGENTE" },
				new Object[] { pPNLIQMEN, pPCEMPRES, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNLIQMEN);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCTAS"
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
			retVal.put("PCURCTAS", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURCTAS", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_NEW_CTAS(java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_GET_NEW_CTAS(pPNLIQMEN, pPCEMPRES, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_GET_NEW_CTAS
	// --START-PAC_IAX_AUTOLIQUIDA.F_GET_NEW_RECIBOS(PSPROLIQ, PCEMPRES, PCAGENTE,
	// PCTOMADOR, PNRECIBO)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_GET_NEW_RECIBOS(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTOMADOR,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_GET_NEW_RECIBOS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROLIQ", "pPCEMPRES", "pPCAGENTE", "pPCTOMADOR", "pPNRECIBO" },
				new Object[] { pPSPROLIQ, pPCEMPRES, pPCAGENTE, pPCTOMADOR, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROLIQ);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPCTOMADOR);
		cStmt.setObject(6, pPNRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCCURREC"
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
			retVal.put("PCCURREC", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCCURREC", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_NEW_RECIBOS(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTOMADOR,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_GET_NEW_RECIBOS(pPSPROLIQ, pPCEMPRES, pPCAGENTE, pPCTOMADOR, pPNRECIBO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_GET_NEW_RECIBOS
	// --START-PAC_IAX_AUTOLIQUIDA.F_GET_RECIBO(PNRECIBO, PCAGENTE, PCTOMADOR)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_GET_RECIBO(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTOMADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_GET_RECIBO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO", "pPCAGENTE", "pPCTOMADOR" },
				new Object[] { pPNRECIBO, pPCAGENTE, pPCTOMADOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCTOMADOR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURRECIBO"
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
			retVal.put("PCURRECIBO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURRECIBO", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_RECIBO(java.math.BigDecimal pPNRECIBO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTOMADOR) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_GET_RECIBO(pPNRECIBO, pPCAGENTE, pPCTOMADOR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_GET_RECIBO
	// --START-PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDAAGE(PCAGENTE, PNLIQMEN,
	// PCESTAUTOLIQ, PIIMPORTE, PCUSUARI, PFCOBRO, PCMARCADO, PIDIFGLOBAL,
	// PFLIQUIDA, PCEMPRES, PCAGECLAVE, PSPROLIQ)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDAAGE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNLIQMEN, java.math.BigDecimal pPCESTAUTOLIQ, java.math.BigDecimal pPIIMPORTE,
			String pPCUSUARI, java.sql.Date pPFCOBRO, java.math.BigDecimal pPCMARCADO,
			java.math.BigDecimal pPIDIFGLOBAL, java.sql.Date pPFLIQUIDA, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGECLAVE, java.math.BigDecimal pPSPROLIQ) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDAAGE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCAGENTE", "pPNLIQMEN", "pPCESTAUTOLIQ", "pPIIMPORTE", "pPCUSUARI", "pPFCOBRO",
						"pPCMARCADO", "pPIDIFGLOBAL", "pPFLIQUIDA", "pPCEMPRES", "pPCAGECLAVE", "pPSPROLIQ" },
				new Object[] { pPCAGENTE, pPNLIQMEN, pPCESTAUTOLIQ, pPIIMPORTE, pPCUSUARI, pPFCOBRO, pPCMARCADO,
						pPIDIFGLOBAL, pPFLIQUIDA, pPCEMPRES, pPCAGECLAVE, pPSPROLIQ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pPNLIQMEN);
		cStmt.setObject(4, pPCESTAUTOLIQ);
		cStmt.setObject(5, pPIIMPORTE);
		cStmt.setObject(6, pPCUSUARI);
		cStmt.setObject(7, pPFCOBRO);
		cStmt.setObject(8, pPCMARCADO);
		cStmt.setObject(9, pPIDIFGLOBAL);
		cStmt.setObject(10, pPFLIQUIDA);
		cStmt.setObject(11, pPCEMPRES);
		cStmt.setObject(12, pPCAGECLAVE);
		cStmt.setObject(13, pPSPROLIQ);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "OPSPROLIQ"
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
			retVal.put("OPSPROLIQ", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("OPSPROLIQ", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDAAGE(java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPNLIQMEN, java.math.BigDecimal pPCESTAUTOLIQ, java.math.BigDecimal pPIIMPORTE,
			String pPCUSUARI, java.sql.Date pPFCOBRO, java.math.BigDecimal pPCMARCADO,
			java.math.BigDecimal pPIDIFGLOBAL, java.sql.Date pPFLIQUIDA, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGECLAVE, java.math.BigDecimal pPSPROLIQ) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDAAGE(pPCAGENTE, pPNLIQMEN, pPCESTAUTOLIQ, pPIIMPORTE,
				pPCUSUARI, pPFCOBRO, pPCMARCADO, pPIDIFGLOBAL, pPFLIQUIDA, pPCEMPRES, pPCAGECLAVE, pPSPROLIQ);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDAAGE
	// --START-PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDACAB(PCMODO, PNLIQMEN, PCEMPRES,
	// PCAGENTE, PCESTADO, PFLIQUIDA, PFCOBRO, PCTOMADOR, PCUSUARIO, PIIMPORTE,
	// PSPROLIQ, PIDIFGLOBAL)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACAB(String pPCMODO, java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCESTADO,
			java.sql.Date pPFLIQUIDA, java.sql.Date pPFCOBRO, java.math.BigDecimal pPCTOMADOR, String pPCUSUARIO,
			java.math.BigDecimal pPIIMPORTE, java.math.BigDecimal pPSPROLIQ, java.math.BigDecimal pPIDIFGLOBAL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDACAB(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMODO", "pPNLIQMEN", "pPCEMPRES", "pPCAGENTE", "pPCESTADO", "pPFLIQUIDA", "pPFCOBRO",
						"pPCTOMADOR", "pPCUSUARIO", "pPIIMPORTE", "pPSPROLIQ", "pPIDIFGLOBAL" },
				new Object[] { pPCMODO, pPNLIQMEN, pPCEMPRES, pPCAGENTE, pPCESTADO, pPFLIQUIDA, pPFCOBRO, pPCTOMADOR,
						pPCUSUARIO, pPIIMPORTE, pPSPROLIQ, pPIDIFGLOBAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPNLIQMEN);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPCESTADO);
		cStmt.setObject(7, pPFLIQUIDA);
		cStmt.setObject(8, pPFCOBRO);
		cStmt.setObject(9, pPCTOMADOR);
		cStmt.setObject(10, pPCUSUARIO);
		cStmt.setObject(11, pPIIMPORTE);
		cStmt.setObject(12, pPSPROLIQ);
		cStmt.setObject(13, pPIDIFGLOBAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, java.sql.Types.NUMERIC); // Valor de "PCPROCES"
		cStmt.registerOutParameter(15, java.sql.Types.NUMERIC); // Valor de "PONLIQMEN"
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
			retVal.put("PCPROCES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("PCPROCES", null);
		}
		try {
			retVal.put("PONLIQMEN", cStmt.getObject(15));
		} catch (SQLException e) {
			retVal.put("PONLIQMEN", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACAB(String pPCMODO, java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCESTADO,
			java.sql.Date pPFLIQUIDA, java.sql.Date pPFCOBRO, java.math.BigDecimal pPCTOMADOR, String pPCUSUARIO,
			java.math.BigDecimal pPIIMPORTE, java.math.BigDecimal pPSPROLIQ, java.math.BigDecimal pPIDIFGLOBAL)
			throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACAB(pPCMODO, pPNLIQMEN, pPCEMPRES, pPCAGENTE, pPCESTADO,
				pPFLIQUIDA, pPFCOBRO, pPCTOMADOR, pPCUSUARIO, pPIIMPORTE, pPSPROLIQ, pPIDIFGLOBAL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDACAB
	// --START-PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDACION(PCMODO, PNLIQMEN, PCEMPRES,
	// PCAGENTE, PSPROCES)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACION(String pPCMODO, java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPROCES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDACION(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMODO", "pPNLIQMEN", "pPCEMPRES", "pPCAGENTE", "pPSPROCES" },
				new Object[] { pPCMODO, pPNLIQMEN, pPCEMPRES, pPCAGENTE, pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPNLIQMEN);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPSPROCES);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "POCESTADO"
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
			retVal.put("POCESTADO", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("POCESTADO", null);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACION(String pPCMODO, java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPROCES)
			throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACION(pPCMODO, pPNLIQMEN, pPCEMPRES, pPCAGENTE, pPSPROCES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_SET_AUTOLIQUIDACION
	// --START-PAC_IAX_AUTOLIQUIDA.F_SET_COBROS(PIDCOBOR, PCAGENTE, PCEMPRES,
	// PSPROLIQ, PNCOBRO, PNCDOCU, PFDOCU, PNCBAN, PIIMPORTE, PTOBSERVA)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(java.math.BigDecimal pPIDCOBRO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPNCOBRO, String pPNCDOCU, java.sql.Date pPFDOCU, java.math.BigDecimal pPNCBAN,
			java.math.BigDecimal pPIIMPORTE, String pPTOBSERVA) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_SET_COBROS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pIDCOBRO", "pPCAGENTE", "pPCEMPRES", "pPSPROLIQ", "pPNCOBRO", "pPNCDOCU", "pPFDOCU",
						"pPNCBAN", "pPIIMPORTE", "pPTOBSERVA" },
				new Object[] { pPIDCOBRO, pPCAGENTE, pPCEMPRES, pPSPROLIQ, pPNCOBRO, pPNCDOCU, pPFDOCU, pPNCBAN,
						pPIIMPORTE, pPTOBSERVA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDCOBRO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPSPROLIQ);
		cStmt.setObject(6, pPNCOBRO);
		cStmt.setObject(7, pPNCDOCU);
		cStmt.setObject(8, pPFDOCU);
		cStmt.setObject(9, pPNCBAN);
		cStmt.setObject(10, pPIIMPORTE);
		cStmt.setObject(11, pPTOBSERVA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(java.math.BigDecimal pIDCOBRO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPNCOBRO, String pPNCDOCU, java.sql.Date pPFDOCU, java.math.BigDecimal pPNCBAN,
			java.math.BigDecimal pPIIMPORTE, String pPTOBSERVA) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(pIDCOBRO, pPCAGENTE, pPCEMPRES, pPSPROLIQ, pPNCOBRO, pPNCDOCU,
				pPFDOCU, pPNCBAN, pPIIMPORTE, pPTOBSERVA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_SET_COBROS
	// --START-PAC_IAX_AUTOLIQUIDA.F_SET_CTAS(PCMODO, PCAGENTE, PCEMPRES, PNNUMLIN,
	// PCPROCES)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_SET_CTAS(String pPCMODO, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCPROCES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_SET_CTAS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMODO", "pPCAGENTE", "pPCEMPRES", "pPNNUMLIN", "pPCPROCES" },
				new Object[] { pPCMODO, pPCAGENTE, pPCEMPRES, pPNNUMLIN, pPCPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPNNUMLIN);
		cStmt.setObject(6, pPCPROCES);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_CTAS(String pPCMODO, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCPROCES)
			throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_SET_CTAS(pPCMODO, pPCAGENTE, pPCEMPRES, pPNNUMLIN, pPCPROCES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_SET_CTAS
	// --START-PAC_IAX_AUTOLIQUIDA.F_SET_RECIBOS(PCMODO, PNLIQMEN, PCEMPRES,
	// PCAGENTE, PNLIQLIN, PNRECIBO, PCTIPREC, PNFRAFEC, PFEFECTO, PITOTALR,
	// PICOMISI, PIRETENCOM, PIDIFERENCIA, PSPROCES, PPL, PIDIFERPYG)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_SET_RECIBOS(String pPCMODO, java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNLIQLIN,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCTIPREC, java.math.BigDecimal pPNFRAFEC,
			java.sql.Date pPFEFECTO, java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPICOMISI,
			java.math.BigDecimal pPIRETENCOM, java.math.BigDecimal pPIDIFERENCIA, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPPL, java.math.BigDecimal pPIDIFERPYG, java.math.BigDecimal pPIMPPEND,
			java.math.BigDecimal pPVABONO, java.sql.Date pPFABONO, java.math.BigDecimal pPDOCREAU,
			java.math.BigDecimal pPCORTEPROD) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_SET_RECIBOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMODO", "pPNLIQMEN", "pPCEMPRES", "pPCAGENTE", "pPNLIQLIN", "pPNRECIBO", "pPCTIPREC",
						"pPNFRAFEC", "pPFEFECTO", "pPITOTALR", "pPICOMISI", "pPIRETENCOM", "pPIDIFERENCIA", "pPSPROCES",
						"pPPL", "pPIDIFERPYG", "pPIMPPEND", "pPVABONO", "pPFABONO", "pPDOCREAU", "pPCORTEPROD" },
				new Object[] { pPCMODO, pPNLIQMEN, pPCEMPRES, pPCAGENTE, pPNLIQLIN, pPNRECIBO, pPCTIPREC, pPNFRAFEC,
						pPFEFECTO, pPITOTALR, pPICOMISI, pPIRETENCOM, pPIDIFERENCIA, pPSPROCES, pPPL, pPIDIFERPYG,
						pPIMPPEND, pPVABONO, pPFABONO, pPDOCREAU, pPCORTEPROD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPNLIQMEN);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPNLIQLIN);
		cStmt.setObject(7, pPNRECIBO);
		cStmt.setObject(8, pPCTIPREC);
		cStmt.setObject(9, pPNFRAFEC);
		cStmt.setObject(10, pPFEFECTO);
		cStmt.setObject(11, pPITOTALR);
		cStmt.setObject(12, pPICOMISI);
		cStmt.setObject(13, pPIRETENCOM);
		cStmt.setObject(14, pPIDIFERENCIA);
		cStmt.setObject(15, pPSPROCES);
		cStmt.setObject(16, pPPL);
		cStmt.setObject(17, pPIDIFERPYG);
		cStmt.setObject(18, pPIMPPEND);
		cStmt.setObject(19, pPVABONO);
		cStmt.setObject(20, pPFABONO);
		cStmt.setObject(21, pPDOCREAU);
		cStmt.setObject(22, pPCORTEPROD);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(23, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_RECIBOS(String pPCMODO, java.math.BigDecimal pPNLIQMEN,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNLIQLIN,
			java.math.BigDecimal pPNRECIBO, java.math.BigDecimal pPCTIPREC, java.math.BigDecimal pPNFRAFEC,
			java.sql.Date pPFEFECTO, java.math.BigDecimal pPITOTALR, java.math.BigDecimal pPICOMISI,
			java.math.BigDecimal pPIRETENCOM, java.math.BigDecimal pPIDIFERENCIA, java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPPL, java.math.BigDecimal pPIDIFERPYG, java.math.BigDecimal pPIMPPEND,
			java.math.BigDecimal pPVABONO, java.sql.Date pPFABONO, java.math.BigDecimal pPDOCREAU,
			java.math.BigDecimal pPCORTEPROD) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_SET_RECIBOS(pPCMODO, pPNLIQMEN, pPCEMPRES, pPCAGENTE, pPNLIQLIN,
				pPNRECIBO, pPCTIPREC, pPNFRAFEC, pPFEFECTO, pPITOTALR, pPICOMISI, pPIRETENCOM, pPIDIFERENCIA, pPSPROCES,
				pPPL, pPIDIFERPYG, pPIMPPEND, pPVABONO, pPFABONO, pPDOCREAU, pPCORTEPROD);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_AUTOLIQUIDA.F_SET_RECIBOS
	// --START-PAC_IAX_AUTOLIQUIDA.F_DEL_LIQUIDACION(PSPROLIQ, PCEMPRES, PCAGENTE,
	// PNLIQMEN)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_DEL_LIQUIDACION(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNLIQMEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_DEL_LIQUIDACION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROLIQ", "pPCEMPRES", "pPCAGENTE", "pPNLIQMEN" },
				new Object[] { pPSPROLIQ, pPCEMPRES, pPCAGENTE, pPNLIQMEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROLIQ);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPNLIQMEN);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_DEL_LIQUIDACION(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNLIQMEN)
			throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_DEL_LIQUIDACION(pPSPROLIQ, pPCEMPRES, pPCAGENTE, pPNLIQMEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AUTOLIQUIDA.F_DEL_LIQUIDACION

	// --START-PAC_IAX_AUTOLIQUIDA.F_DEL_AGENTECLAVE(PSPROLIQ, PCEMPRES, PCAGENTE)
	private HashMap callPAC_IAX_AUTOLIQUIDA__F_DEL_AGENTECLAVE(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_AUTOLIQUIDA.F_DEL_AGENTECLAVE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROLIQ", "pPCEMPRES", "pPCAGENTE" },
				new Object[] { pPSPROLIQ, pPCEMPRES, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROLIQ);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_AUTOLIQUIDA__F_DEL_AGENTECLAVE(java.math.BigDecimal pPSPROLIQ,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_AUTOLIQUIDA__F_DEL_AGENTECLAVE(pPSPROLIQ, pPCEMPRES, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AUTOLIQUIDA.F_DEL_AGENTECLAVE

}
