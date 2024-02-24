//Revision:# Iecs12xt9rOclNFzoAYo0Q== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CUMULOS_CONF extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CUMULOS_CONF.class);
	private Connection conn = null;

	public PAC_IAX_CUMULOS_CONF(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR(PFCORTE, PTCUMULO, PNNUMIDE,
	// MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPTCUMULO", "pPNNUMIDE" },
				new Object[] { pPFCORTE, pPTCUMULO, pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPTCUMULO);
		cStmt.setObject(4, pPNNUMIDE);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR(pPFCORTE, pPTCUMULO, pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_CUM_CONSORCIO(PFCORTE, PTCUMULO, PNNUMIDE,
	// MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_CUM_CONSORCIO(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_CUM_CONSORCIO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPTCUMULO", "pPNNUMIDE" },
				new Object[] { pPFCORTE, pPTCUMULO, pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPTCUMULO);
		cStmt.setObject(4, pPNNUMIDE);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_CONSORCIO(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_CUM_CONSORCIO(pPFCORTE, pPTCUMULO, pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_CUM_CONSORCIO
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_TIPCUM()
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_TIPCUM() throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_TIPCUM(?)}";

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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_TIPCUM() throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_TIPCUM();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_TIPCUM
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_TOMADOR()
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_TOMADOR() throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_TOMADOR(?)}";

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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_TOMADOR() throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_TOMADOR();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_TOMADOR
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_COM_FUTUROS(PFCORTE, PNNUMIDE, PTIPCOMP,
	// PSPERSON, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_COM_FUTUROS(java.sql.Date pPFCORTE, String pPNNUMIDE,
			java.math.BigDecimal pPTIPCOMP, java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_COM_FUTUROS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPNNUMIDE", "pPTIPCOMP", "pPSPERSON" },
				new Object[] { pPFCORTE, pPNNUMIDE, pPTIPCOMP, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPNNUMIDE);
		cStmt.setObject(4, pPTIPCOMP);
		cStmt.setObject(5, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_COM_FUTUROS(java.sql.Date pPFCORTE, String pPNNUMIDE,
			java.math.BigDecimal pPTIPCOMP, java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_COM_FUTUROS(pPFCORTE, pPNNUMIDE, pPTIPCOMP, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_COM_FUTUROS
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_DETCOM_FUTUROS(PSSEGURO, PTIPCOMP,
	// PFCORTE, PSPERSON, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_DETCOM_FUTUROS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPTIPCOMP, java.sql.Date pPFCORTE, java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_DETCOM_FUTUROS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPTIPCOMP", "pPFCORTE", "pPSPERSON" },
				new Object[] { pPSSEGURO, pPTIPCOMP, pPFCORTE, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPTIPCOMP);
		cStmt.setObject(4, pPFCORTE);
		cStmt.setObject(5, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_DETCOM_FUTUROS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPTIPCOMP, java.sql.Date pPFCORTE, java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_DETCOM_FUTUROS(pPSSEGURO, pPTIPCOMP, pPFCORTE, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_DETCOM_FUTUROS
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_PINTA_CONTRATOS(PFCORTE, PTCUMULO,
	// PNNUMIDE, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_PINTA_CONTRATOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPTCUMULO", "pPNNUMIDE" },
				new Object[] { pPFCORTE, pPTCUMULO, pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPTCUMULO);
		cStmt.setObject(4, pPNNUMIDE);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(pPFCORTE, pPTCUMULO, pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_PINTA_CONTRATOS
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR_SERIE(PFCORTE, PTCUMULO,
	// PNNUMIDE, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_SERIE(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR_SERIE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPTCUMULO", "pPNNUMIDE" },
				new Object[] { pPFCORTE, pPTCUMULO, pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPTCUMULO);
		cStmt.setObject(4, pPNNUMIDE);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_SERIE(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_SERIE(pPFCORTE, pPTCUMULO, pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR_SERIE
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR_POL(PFCORTE, PTCUMULO,
	// PNNUMIDE, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_POL(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR_POL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPTCUMULO", "pPNNUMIDE" },
				new Object[] { pPFCORTE, pPTCUMULO, pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPTCUMULO);
		cStmt.setObject(4, pPNNUMIDE);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_POL(java.sql.Date pPFCORTE, String pPTCUMULO,
			String pPNNUMIDE) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_POL(pPFCORTE, pPTCUMULO, pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_CUM_TOMADOR_POL
	// --START-PAC_IAX_CUMULOS_CONF.F_SET_DEPURACION_MANUAL(PSSEGURO, PCGENERA,
	// PCGARANT, PINDICAD, PVALOR, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_SET_DEPURACION_MANUAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGENERA, java.math.BigDecimal pPCGARANT, String pPINDICAD,
			java.math.BigDecimal pPVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_SET_DEPURACION_MANUAL(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCGENERA", "pPCGARANT", "pPINDICAD", "pPVALOR" },
				new Object[] { pPSSEGURO, pPCGENERA, pPCGARANT, pPINDICAD, pPVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCGENERA);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPINDICAD);
		cStmt.setObject(6, pPVALOR);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_SET_DEPURACION_MANUAL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGENERA, java.math.BigDecimal pPCGARANT, String pPINDICAD,
			java.math.BigDecimal pPVALOR) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_SET_DEPURACION_MANUAL(pPSSEGURO, pPCGENERA, pPCGARANT, pPINDICAD,
				pPVALOR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_SET_DEPURACION_MANUAL
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_DEPURACION_MANUAL(PFCORTE, PNNUMIDE,
	// PSPERSON, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL(java.sql.Date pPFCORTE, String pPNNUMIDE,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_DEPURACION_MANUAL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPNNUMIDE", "pPSPERSON" },
				new Object[] { pPFCORTE, pPNNUMIDE, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPNNUMIDE);
		cStmt.setObject(4, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL(java.sql.Date pPFCORTE, String pPNNUMIDE,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL(pPFCORTE, pPNNUMIDE, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CUMULOS_CONF.F_GET_DEPURACION_MANUAL
	// --START-PAC_IAX_CUMULOS_CONF.F_GET_DEPURACION_MANUAL_SERIE(PFCORTE, PNNUMIDE,
	// PSERIE, PSPERSON, MENSAJES)
	private HashMap callPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL_SERIE(java.sql.Date pPFCORTE, String pPNNUMIDE,
			java.math.BigDecimal pPSERIE, java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CUMULOS_CONF.F_GET_DEPURACION_MANUAL_SERIE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFCORTE", "pPNNUMIDE", "pPSERIE", "pPSPERSON" },
				new Object[] { pPFCORTE, pPNNUMIDE, pPSERIE, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFCORTE);
		cStmt.setObject(3, pPNNUMIDE);
		cStmt.setObject(4, pPSERIE);
		cStmt.setObject(5, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL_SERIE(java.sql.Date pPFCORTE, String pPNNUMIDE,
			java.math.BigDecimal pPSERIE, java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL_SERIE(pPFCORTE, pPNNUMIDE, pPSERIE, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CUMULOS_CONF.F_GET_DEPURACION_MANUAL_SERIE

}