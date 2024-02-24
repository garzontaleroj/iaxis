//Revision:# BQ5cWdCdL/iGC8XZNWxi1w== #
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

public class PAC_IAX_SUPLEMENTOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ANULACIONES.class);
	private Connection conn = null;

	public PAC_IAX_SUPLEMENTOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SUPLEMENTOS.F_GET_SUPLEMENTOS(PSPRODUC)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_SUPLEMENTOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSSEGURO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_SUPLEMENTOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPSSEGURO", "pPTABLAS" },
				new Object[] { pPSPRODUC, pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCONFIGSUPL"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.setObject(5, pPSSEGURO);
		cStmt.setObject(6, pPTABLAS);
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCURCONFIGSUPL", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCURCONFIGSUPL", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_SUPLEMENTOS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPSSEGURO, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_SUPLEMENTOS(pPSPRODUC, pPSSEGURO, pPTABLAS);
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_GET_SUPLEMENTOS

	// --START-PAC_IAX_SUPLEMENTOS.F_EDITARSUPLEMENTO(PSSEGURO, PFEFECTO, PCMOTMOV)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_EDITARSUPLEMENTO(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFEFECTO,
			java.math.BigDecimal pPCMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_EDITARSUPLEMENTO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFEFECTO", "pPCMOTMOV" },
				new Object[] { pPSSEGURO, pPFEFECTO, pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFEFECTO);
		cStmt.setObject(4, pPCMOTMOV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PESTSSEGURO"
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
			retVal.put("PESTSSEGURO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PESTSSEGURO", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_EDITARSUPLEMENTO(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFEFECTO, java.math.BigDecimal pPCMOTMOV) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_EDITARSUPLEMENTO(pPSSEGURO, pPFEFECTO, pPCMOTMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_EDITARSUPLEMENTO

	// --START-PAC_IAX_SUPLEMENTOS.F_EMITIRPROPUESTA()

	private HashMap callPAC_IAX_SUPLEMENTOS__F_EMITIRPROPUESTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_EMITIRPROPUESTA(?)}";
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_EMITIRPROPUESTA() throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_EMITIRPROPUESTA();
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_EMITIRPROPUESTA
	// --START-PAC_IAX_SUPLEMENTOS.F_GET_DETAILMOV(PSSEGURO, PNMOVIMI)

	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOV(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_DETAILMOV(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETMOVSEGURO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOV(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOV(pPSSEGURO, pPNMOVIMI);
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_GET_DETAILMOV

	// --START-PAC_IAX_SUPLEMENTOS.F_GET_DETAILMOVSUPL(PCMOTMOV)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOVSUPL(java.math.BigDecimal pPCMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_DETAILMOVSUPL(?, ?)}";

		logCall(callQuery, new String[] { "pPCMOTMOV" }, new Object[] { pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOV);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DETMOVSEGURO".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOVSUPL(java.math.BigDecimal pPCMOTMOV) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOVSUPL(pPCMOTMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_GET_DETAILMOVSUPL

	// --START-PAC_IAX_SUPLEMENTOS.F_GET_PENDIENTE_EMISION()

	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_PENDIENTE_EMISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_PENDIENTE_EMISION()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_PENDIENTE_EMISION() throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_PENDIENTE_EMISION();
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_GET_PENDIENTE_EMISION

	// --START-PAC_IAX_SUPLEMENTOS.LIMPIARTEMPORALES()

	private HashMap callPAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES() throws Exception {
		String callQuery = "{call PAC_IAX_SUPLEMENTOS.LIMPIARTEMPORALES()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES() throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES();
	}
	// --END-PAC_IAX_SUPLEMENTOS.LIMPIARTEMPORALES
	// --START-PAC_IAX_SUPLEMENTOS.F_GET_MVTRETENCION()

	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_MVTRETENCION() throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_MVTRETENCION(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLMVTRETEN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_MVTRETENCION() throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_MVTRETENCION();
	}

	// --END-PAC_IAX_SUPLEMENTOS.F_GET_MVTRETENCION
	// --START-PAC_IAX_SUPLEMENTOS.F_INICIALIZAR_SUPLEMENTO(PSSEGURO, PCMOTMOV,
	// PMODO)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_INICIALIZAR_SUPLEMENTO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_INICIALIZAR_SUPLEMENTO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMOTMOV", "pPMODO" },
				new Object[] { pPSSEGURO, pPCMOTMOV, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(6, pPMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PFEFECTO"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PMODFEFE"
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
			retVal.put("PFEFECTO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFEFECTO", null);
		}
		try {
			retVal.put("PMODFEFE", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PMODFEFE", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_INICIALIZAR_SUPLEMENTO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, String pPMODO) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_INICIALIZAR_SUPLEMENTO(pPSSEGURO, pPCMOTMOV, pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_INICIALIZAR_SUPLEMENTO

	// --START-PAC_IAX_SUPLEMENTOS.F_DIFERIRPROPUESTA(PFDIFER)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_DIFERIRPROPUESTA(String pPFDIFER) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_DIFERIRPROPUESTA(?, ?)}";

		logCall(callQuery, new String[] { "pPFDIFER" }, new Object[] { pPFDIFER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFDIFER);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_DIFERIRPROPUESTA(String pPFDIFER) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_DIFERIRPROPUESTA(pPFDIFER);
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_DIFERIRPROPUESTA

	// --START-PAC_IAX_SUPLEMENTOS.F_EVAL_DIFERIDOS_FUTURO(PSSEGURO, PFECHA)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_EVAL_DIFERIDOS_FUTURO(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_EVAL_DIFERIDOS_FUTURO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFECHA" }, new Object[] { pPSSEGURO, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFECHA);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_EVAL_DIFERIDOS_FUTURO(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_EVAL_DIFERIDOS_FUTURO(pPSSEGURO, pPFECHA);
	}

	// --END-PAC_IAX_SUPLEMENTOS.F_EVAL_DIFERIDOS_FUTURO
	// --START-PAC_IAX_SUPLEMENTOS.F_GET_DIFERIR_CMOTMOVS(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_DIFERIR_CMOTMOVS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_DIFERIR_CMOTMOVS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_LISTA_ID".toUpperCase())); // Valor de "PCMOTMOVS"
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
			retVal.put("PCMOTMOVS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCMOTMOVS", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DIFERIR_CMOTMOVS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_DIFERIR_CMOTMOVS(pPSSEGURO, pPNMOVIMI);
	}

	// --END-PAC_IAX_SUPLEMENTOS.F_GET_DIFERIR_CMOTMOVS
	// --START-PAC_IAX_SUPLEMENTOS.F_GET_FECHA_DIFERIR(PSSEGURO)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_FECHA_DIFERIR(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_FECHA_DIFERIR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PFECHAP"
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
			retVal.put("PFECHAP", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PFECHAP", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_FECHA_DIFERIR(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_FECHA_DIFERIR(pPSSEGURO);
	}

	// --END-PAC_IAX_SUPLEMENTOS.F_GET_FECHA_DIFERIR
	// --START-PAC_IAX_SUPLEMENTOS.F_HABILITA_DIFERIR(PSSEGURO)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_HABILITA_DIFERIR(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_HABILITA_DIFERIR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PMOSTRAR"
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
			retVal.put("PMOSTRAR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PMOSTRAR", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_HABILITA_DIFERIR(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_HABILITA_DIFERIR(pPSSEGURO);
	}

	// --END-PAC_IAX_SUPLEMENTOS.F_HABILITA_DIFERIR
	// --START-PAC_IAX_SUPLEMENTOS.F_MOSTRAR_DIFERIR()
	private HashMap callPAC_IAX_SUPLEMENTOS__F_MOSTRAR_DIFERIR() throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_MOSTRAR_DIFERIR(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PMOSTRAR"
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
			retVal.put("PMOSTRAR", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PMOSTRAR", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_MOSTRAR_DIFERIR() throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_MOSTRAR_DIFERIR();
	}

	// --END-PAC_IAX_SUPLEMENTOS.F_MOSTRAR_DIFERIR
	// --START-PAC_IAX_SUPLEMENTOS.F_TRATAR_DIFERIDOS_MOTMOV(PCMOTMOVS, PPOLIZA)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_TRATAR_DIFERIDOS_MOTMOV(Object pPCMOTMOVS, Object pPPOLIZA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_TRATAR_DIFERIDOS_MOTMOV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMOTMOVS", "pPPOLIZA" }, new Object[] { pPCMOTMOVS, pPPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOVS);
		cStmt.setObject(3, pPPOLIZA);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_TRATAR_DIFERIDOS_MOTMOV(Object pPCMOTMOVS, Object pPPOLIZA)
			throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_TRATAR_DIFERIDOS_MOTMOV(pPCMOTMOVS, pPPOLIZA);
	}

	// --END-PAC_IAX_SUPLEMENTOS.F_TRATAR_DIFERIDOS_MOTMOV
	// --START-PAC_IAX_SUPLEMENTOS.F_VALIDA_EMISION_DIFERIDOS(PCMOTMOVS, PPOLIZA)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_VALIDA_EMISION_DIFERIDOS(Object pPCMOTMOVS, Object pPPOLIZA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_VALIDA_EMISION_DIFERIDOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMOTMOVS", "pPPOLIZA" }, new Object[] { pPCMOTMOVS, pPPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOVS);
		cStmt.setObject(3, pPPOLIZA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTEXTO"
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
			retVal.put("PTEXTO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTEXTO", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_VALIDA_EMISION_DIFERIDOS(Object pPCMOTMOVS, Object pPPOLIZA)
			throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_VALIDA_EMISION_DIFERIDOS(pPCMOTMOVS, pPPOLIZA);
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_VALIDA_EMISION_DIFERIDOS

	// --START-PAC_IAX_SUPLEMENTOS.F_GET_MVTDIFERIDOS(PSOLICIT)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_MVTDIFERIDOS(java.math.BigDecimal pPSOLICIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_MVTDIFERIDOS(?, ?)}";

		logCall(callQuery, new String[] { "pPSOLICIT" }, new Object[] { pPSOLICIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSOLICIT);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_MVTDIFERIDOS(java.math.BigDecimal pPSOLICIT) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_MVTDIFERIDOS(pPSOLICIT);
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_GET_MVTDIFERIDOS

	// --START-PAC_IAX_SUPLEMENTOS.F_ANULAR_ABRIR_DIFERIDO(PCMOTMOV, PSSEGURO,
	// PESTADO)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_ANULAR_ABRIR_DIFERIDO(java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_ANULAR_ABRIR_DIFERIDO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMOTMOV", "pPSSEGURO", "pPESTADO" },
				new Object[] { pPCMOTMOV, pPSSEGURO, pPESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOV);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPESTADO);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_ANULAR_ABRIR_DIFERIDO(java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPESTADO) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_ANULAR_ABRIR_DIFERIDO(pPCMOTMOV, pPSSEGURO, pPESTADO);
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_ANULAR_ABRIR_DIFERIDO

	// --START-PAC_IAX_SUPLEMENTOS.F_INSDETMOVSEGURO(PSSEGURO, PCMOTMOV, PANTES,
	// PDESPUES)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_INSDETMOVSEGURO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pNMOVIMI, String pPDESPUES) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_INSDETMOVSEGURO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMOTMOV", "pNMOVIMI", "pPDESPUES" },
				new Object[] { pPSSEGURO, pPCMOTMOV, pNMOVIMI, pPDESPUES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(4, pNMOVIMI);
		cStmt.setObject(5, pPDESPUES);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_INSDETMOVSEGURO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pNMOVIMI, String pPDESPUES) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_INSDETMOVSEGURO(pPSSEGURO, pPCMOTMOV, pNMOVIMI, pPDESPUES);
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_INSDETMOVSEGURO

	// --START-PAC_IAX_SUPLEMENTOS.F_INSTEXMOVSEGURO(PSSEGURO, PNMOVIMI, PTMOVIMI)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_INSTEXMOVSEGURO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, String pPTMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_INSTEXMOVSEGURO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPTMOVIMI" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPTMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPTMOVIMI);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_INSTEXMOVSEGURO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, String pPTMOVIMI) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_INSTEXMOVSEGURO(pPSSEGURO, pPNMOVIMI, pPTMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_INSTEXMOVSEGURO

	// --START-PAC_IAX_SUPLEMENTOS.F_PREGUNTA_PROPAGA_SUPLEMENTO(PTABLAS, PSSEGURO,
	// PNMOVIMI, PCMOTMOV, PCIDIOMA)

	private HashMap callPAC_IAX_SUPLEMENTOS__F_PREGUNTA_PROPAGA_SUPLEMENTO(String pPTABLAS,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_PREGUNTA_PROPAGA_SUPLEMENTO(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTABLAS", "pPSSEGURO", "pPNMOVIMI", "pPCMOTMOV", "pPCIDIOMA" },
				new Object[] { pPTABLAS, pPSSEGURO, pPNMOVIMI, pPCMOTMOV, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPCMOTMOV);
		cStmt.setObject(6, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "OPROPAGA"
		cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "OTEXTO"
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
			retVal.put("OPROPAGA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("OPROPAGA", null);
		}
		try {
			retVal.put("OTEXTO", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("OTEXTO", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_PREGUNTA_PROPAGA_SUPLEMENTO(String pPTABLAS,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_PREGUNTA_PROPAGA_SUPLEMENTO(pPTABLAS, pPSSEGURO, pPNMOVIMI, pPCMOTMOV,
				pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_PREGUNTA_PROPAGA_SUPLEMENTO

	// --START-PAC_IAX_SUPLEMENTOS.F_SET_PROPAGA_SUPLEMENTO(PTABLAS, PSSEGURO,
	// PNMOVIMI, PCMOTMOV, PCPROPAGASUPL)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPCPROPAGASUPL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_SET_PROPAGA_SUPLEMENTO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTABLAS", "pPSSEGURO", "pPNMOVIMI", "pPCMOTMOV", "pPCPROPAGASUPL" },
				new Object[] { pPTABLAS, pPSSEGURO, pPNMOVIMI, pPCMOTMOV, pPCPROPAGASUPL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLAS);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPCMOTMOV);
		cStmt.setObject(6, pPCPROPAGASUPL);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO(String pPTABLAS, java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPCPROPAGASUPL)
			throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO(pPTABLAS, pPSSEGURO, pPNMOVIMI, pPCMOTMOV,
				pPCPROPAGASUPL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_SET_PROPAGA_SUPLEMENTO

	// --START-PAC_IAX_SUPLEMENTOS.F_INS_EST_SUSPENSION(PSSEGURO, PNMOVIMI,
	// PCMOTMOV)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_INS_EST_SUSPENSION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_INS_EST_SUSPENSION(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPCMOTMOV" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCMOTMOV);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_INS_EST_SUSPENSION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_INS_EST_SUSPENSION(pPSSEGURO, pPNMOVIMI, pPCMOTMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_SET_PROPAGA_SUPLEMENTO

	// --START-PAC_IAX_SUPLEMENTOS.F_GET_DESCMOTMOV(PCMOTMOV, PCIDIOMA)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_GET_DESCMOTMOV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMOTMOV", "pPCIDIOMA" }, new Object[] { pPCMOTMOV, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOV);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTMOTMOV"
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
			retVal.put("PTMOTMOV", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTMOTMOV", null);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_GET_DESCMOTMOV

	// IAXIS-3394 CJMR 16/04/2019
	// --START-PAC_IAX_SUPLEMENTOS.F_TRASLADA_VIGENCIA(PFEFETRASVIG)
	private HashMap callPAC_IAX_SUPLEMENTOS__F_TRASLADA_VIGENCIA(BigDecimal pPNDIAS, BigDecimal pPNMESES,
			BigDecimal pPNANOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUPLEMENTOS.F_TRASLADA_VIGENCIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNDIAS", "pPNMESES", "pPNANOS" },
				new Object[] { pPNDIAS, pPNMESES, pPNANOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNDIAS);
		cStmt.setObject(3, pPNMESES);
		cStmt.setObject(4, pPNANOS);
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

	public HashMap ejecutaPAC_IAX_SUPLEMENTOS__F_TRASLADA_VIGENCIA(BigDecimal pNDIAS, BigDecimal pNMESES,
			BigDecimal pNANOS) throws Exception {
		return this.callPAC_IAX_SUPLEMENTOS__F_TRASLADA_VIGENCIA(pNDIAS, pNMESES, pNANOS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SUPLEMENTOS.F_TRASLADA_VIGENCIA(PFEFETRASVIG)

}
