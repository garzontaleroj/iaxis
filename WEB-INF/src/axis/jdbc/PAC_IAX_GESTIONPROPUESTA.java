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

public class PAC_IAX_GESTIONPROPUESTA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_GESTIONPROPUESTA.class);
	private Connection conn = null;

	public PAC_IAX_GESTIONPROPUESTA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_GESTIONPROPUESTA.F_ACEPTARPROPUESTA(PSSEGURO, PNMOVIMI,
	// PFEFECTO, PTOBSERV)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFEFECTO, String pPTOBSERV) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_ACEPTARPROPUESTA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPFEFECTO", "pPTOBSERV" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPFEFECTO, pPTOBSERV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPFEFECTO);
		cStmt.setObject(5, pPTOBSERV);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFEFECTO, String pPTOBSERV) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA(pPSSEGURO, pPNMOVIMI, pPFEFECTO, pPTOBSERV);
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_ACEPTARPROPUESTA

	// --START-PAC_IAX_GESTIONPROPUESTA.F_ACEPTARPROPUESTA_MASIVO(pPCAUTREC,
	// pPNPOLIZA, pPTOBSERV, pPCONTROLS)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA_MASIVO(java.math.BigDecimal pPCAUTREC,
			java.math.BigDecimal pPNPOLIZA, String pPTOBSERV, String pPCONTROLS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_ACEPTARPROPUESTA_MASIVO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAUTREC", "pPNPOLIZA", "pPTOBSERV", "pPCONTROLS" },
				new Object[] { pPCAUTREC, pPNPOLIZA, pPTOBSERV, pPCONTROLS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAUTREC);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPTOBSERV);
		cStmt.setObject(5, pPCONTROLS);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA_MASIVO(java.math.BigDecimal pPCAUTREC,
			java.math.BigDecimal pPNPOLIZA, String pPTOBSERV, String pPCONTROLS) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA_MASIVO(pPCAUTREC, pPNPOLIZA, pPTOBSERV,
				pPCONTROLS);
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_ACEPTARPROPUESTA_MASIVO

	// --START-PAC_IAX_GESTIONPROPUESTA.F_CAMBIO_FCANCEL(PSSEGURO, PNMOVIMI,
	// PFCANCELNUEVA)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_CAMBIO_FCANCEL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFCANCELNUEVA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_CAMBIO_FCANCEL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPFCANCELNUEVA" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPFCANCELNUEVA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPFCANCELNUEVA);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_CAMBIO_FCANCEL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.sql.Date pPFCANCELNUEVA) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_CAMBIO_FCANCEL(pPSSEGURO, pPNMOVIMI, pPFCANCELNUEVA);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_CAMBIO_FCANCEL
	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_FECHACANCEL(PSSEGURO, PSPRODUC)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_FECHACANCEL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_FECHACANCEL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSPRODUC" }, new Object[] { pPSSEGURO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.DATE); // Valor de "PFCANCEL"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "PFCANCELNUEVA"
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
			retVal.put("PFCANCEL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFCANCEL", null);
		}
		try {
			retVal.put("PFCANCELNUEVA", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFCANCELNUEVA", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_FECHACANCEL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_FECHACANCEL(pPSSEGURO, pPSPRODUC);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_GET_FECHACANCEL
	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_FEFECTO(PSSEGURO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_FEFECTO(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_FEFECTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.DATE); // Valor de "PFEFECTO"
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
			retVal.put("PFEFECTO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PFEFECTO", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_FEFECTO(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_FEFECTO(pPSSEGURO);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_GET_FEFECTO
	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_INFOPROPRETEN(PSSEGURO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_INFOPROPRETEN(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_INFOPROPRETEN(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.DATE); // Valor de "PFEFECTO"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "POBSERV"
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
			retVal.put("PFEFECTO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PFEFECTO", null);
		}
		try {
			retVal.put("POBSERV", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("POBSERV", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_INFOPROPRETEN(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_INFOPROPRETEN(pPSSEGURO);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_GET_INFOPROPRETEN
	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_MOTRETENMOV(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_MOTRETENMOV(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_MOTRETENMOV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLMVTRETEN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_MOTRETENMOV(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_MOTRETENMOV(pPSSEGURO, pPNMOVIMI);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_GET_MOTRETENMOV
	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_NPOLIZAENEMISION()
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_NPOLIZAENEMISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_NPOLIZAENEMISION(?)}";

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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_NPOLIZAENEMISION() throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_NPOLIZAENEMISION();
	}

	// --START-PAC_IAX_GESTIONPROPUESTA.F_GRABAR_ALTA_POLIZA(PSSEGURO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GRABAR_ALTA_POLIZA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GRABAR_ALTA_POLIZA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GRABAR_ALTA_POLIZA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GRABAR_ALTA_POLIZA(pPSSEGURO);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_GRABAR_ALTA_POLIZA
	// --START-PAC_IAX_GESTIONPROPUESTA.F_INICIALIZAR_MODIFICACION(PSSEGURO, PCMODO,
	// PCFORM, PCCAMPO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(java.math.BigDecimal pPSSEGURO,
			String pPCMODO, String pPCFORM, String pPCCAMPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_INICIALIZAR_MODIFICACION(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMODO", "pPCFORM", "pPCCAMPO" },
				new Object[] { pPSSEGURO, pPCMODO, pPCFORM, pPCCAMPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMODO);
		cStmt.setObject(4, pPCFORM);
		cStmt.setObject(5, pPCCAMPO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "OESTSSEGURO"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "ONMOVIMI"
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
			retVal.put("OESTSSEGURO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("OESTSSEGURO", null);
		}
		try {
			retVal.put("ONMOVIMI", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("ONMOVIMI", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(java.math.BigDecimal pPSSEGURO,
			String pPCMODO, String pPCFORM, String pPCCAMPO) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(pPSSEGURO, pPCMODO, pPCFORM, pPCCAMPO);
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_INICIALIZAR_MODIFICACION

	// --START-PAC_IAX_GESTIONPROPUESTA.F_RECHAZARPROPUESTA(PSSEGURO, PNMOVIMI,
	// PCMOTMOV, PNSUPLEM, PTOBSERVA, PTPOSTPPER, PCPERPOST)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPNSUPLEM,
			String pPTOBSERVA, String pPTPOSTPPER, java.math.BigDecimal pPCPERPOST) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_RECHAZARPROPUESTA(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNMOVIMI", "pPCMOTMOV", "pPNSUPLEM", "pPTOBSERVA", "pPTPOSTPPER",
						"pPCPERPOST" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPCMOTMOV, pPNSUPLEM, pPTOBSERVA, pPTPOSTPPER, pPCPERPOST });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPCMOTMOV);
		cStmt.setObject(5, pPNSUPLEM);
		cStmt.setObject(6, pPTOBSERVA);
		cStmt.setObject(7, pPTPOSTPPER);
		cStmt.setObject(8, pPCPERPOST);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPNSUPLEM,
			String pPTOBSERVA, String pPTPOSTPPER, java.math.BigDecimal pPCPERPOST) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA(pPSSEGURO, pPNMOVIMI, pPCMOTMOV, pPNSUPLEM,
				pPTOBSERVA, pPTPOSTPPER, pPCPERPOST);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_RECHAZARPROPUESTA

	// --START-PAC_IAX_GESTIONPROPUESTA.F_RECHAZARPROPUESTA_MASIVO(pNPOLIZA,
	// pPCMOTMOV, pPTOBSERV, pPCONTROLS)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA_MASIVO(java.math.BigDecimal pNPOLIZA,
			java.math.BigDecimal pPCMOTMOV, String pPTOBSERV, String pPCONTROLS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_RECHAZARPROPUESTA_MASIVO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNPOLIZA", "pPCMOTMOV", "pPTOBSERV", "pPCONTROLS" },
				new Object[] { pNPOLIZA, pPCMOTMOV, pPTOBSERV, pPCONTROLS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNPOLIZA);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(4, pPTOBSERV);
		cStmt.setObject(5, pPCONTROLS);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA_MASIVO(java.math.BigDecimal pNPOLIZA,
			java.math.BigDecimal pPCMOTMOV, String pPTOBSERV, String pPCONTROLS) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA_MASIVO(pNPOLIZA, pPCMOTMOV, pPTOBSERV,
				pPCONTROLS);
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_RECHAZARPROPUESTA_MASIVO

	// --START-PAC_IAX_GESTIONPROPUESTA.F_VALIDA_FEFECTO(PSSEGURO, PFEFECTO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_VALIDA_FEFECTO(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_VALIDA_FEFECTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFEFECTO" }, new Object[] { pPSSEGURO, pPFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFEFECTO);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_VALIDA_FEFECTO(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFEFECTO) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_VALIDA_FEFECTO(pPSSEGURO, pPFEFECTO);
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_VALIDA_FEFECTO
	// --START-PAC_IAX_GESTIONPROPUESTA.LIMPIARTEMPORALES(PSSEGURO)
	/*
	 * Es comenta ja que s'ha eliminat de la base de dades BUG axis11557 XPL
	 * 28/10/2009 private HashMap callPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES
	 * (java.math.BigDecimal pPSSEGURO) throws Exception { String
	 * callQuery="{call PAC_IAX_GESTIONPROPUESTA.LIMPIARTEMPORALES(?)}";
	 * 
	 * logCall(callQuery, new String[] {"pPSSEGURO"}, new Object[] {pPSSEGURO});
	 * CallableStatement cStmt=conn.prepareCall(callQuery); String
	 * USERNAME=conn.getMetaData().getUserName().toUpperCase(); cStmt.setObject(1,
	 * pPSSEGURO); cStmt.execute(); HashMap retVal=new HashMap(); retVal=new
	 * ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
	 * cStmt.close();//AXIS-WLS1SERVER-Ready
	 * 
	 * return retVal; }
	 * 
	 * public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES
	 * (java.math.BigDecimal pPSSEGURO) throws Exception { return
	 * this.callPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES(pPSSEGURO); }
	 */
	// --END-PAC_IAX_GESTIONPROPUESTA.LIMPIARTEMPORALES

	// --START-PAC_IAX_GESTIONPROPUESTA.F_PERMITE_CAMBIO_FEFECTO(PSSEGURO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_PERMITE_CAMBIO_FEFECTO(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_PERMITE_CAMBIO_FEFECTO(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_PERMITE_CAMBIO_FEFECTO(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_PERMITE_CAMBIO_FEFECTO(pPSSEGURO);
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_PERMITE_CAMBIO_FEFECTO

	// --START-PAC_IAX_GESTIONPROPUESTA.F_ACT_ESTADOGESTION(PSSEGURO, PNRIESGO,
	// PNMOVIMI, PCMOTRET, PNMOTRET, PCESTGEST, PTODOS)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_ACT_ESTADOGESTION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTRET,
			java.math.BigDecimal pPNMOTRET, java.math.BigDecimal pPCESTGEST, java.math.BigDecimal pPTODOS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_ACT_ESTADOGESTION(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPNMOVIMI", "pPCMOTRET", "pPNMOTRET", "pPCESTGEST",
						"pPTODOS" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPCMOTRET, pPNMOTRET, pPCESTGEST, pPTODOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPCMOTRET);
		cStmt.setObject(6, pPNMOTRET);
		cStmt.setObject(7, pPCESTGEST);
		cStmt.setObject(8, pPTODOS);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACT_ESTADOGESTION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPCMOTRET,
			java.math.BigDecimal pPNMOTRET, java.math.BigDecimal pPCESTGEST, java.math.BigDecimal pPTODOS)
			throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_ACT_ESTADOGESTION(pPSSEGURO, pPNRIESGO, pPNMOVIMI, pPCMOTRET,
				pPNMOTRET, pPCESTGEST, pPTODOS);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_ACT_ESTADOGESTION
	// --START-PAC_IAX_GESTIONPROPUESTA.F_ACTUALIZAR_SOL_SUPLEMENTO(PSSEGURO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_ACTUALIZAR_SOL_SUPLEMENTO(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_ACTUALIZAR_SOL_SUPLEMENTO(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACTUALIZAR_SOL_SUPLEMENTO(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_ACTUALIZAR_SOL_SUPLEMENTO(pPSSEGURO);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_ACTUALIZAR_SOL_SUPLEMENTO
	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_SOLICITUDSUPLEMENTOS(PSSEGURO,
	// PNMOVIMI, PNRIESGO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_SOLICITUDSUPLEMENTOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_SOLICITUDSUPLEMENTOS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PSOLICITUDES"
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
			retVal.put("PSOLICITUDES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PSOLICITUDES", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_SOLICITUDSUPLEMENTOS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_SOLICITUDSUPLEMENTOS(pPSSEGURO, pPNMOVIMI, pPNRIESGO);
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_GET_SOLICITUDSUPLEMENTOS

	// --START-PAC_IAX_GESTIONPROPUESTA.F_SET_ACTUALIZARESTADO_SUPL(PSSEGURO,
	// PNMOVIMI, PNRIESGO, PCMOTMOV, PCGARANT, PCPREGUN, PCESTADO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_SET_ACTUALIZARESTADO_SUPL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCESTADO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_SET_ACTUALIZARESTADO_SUPL(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNMOVIMI", "pPNRIESGO", "pPCMOTMOV", "pPCGARANT", "pPCPREGUN",
						"pPCESTADO" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPNRIESGO, pPCMOTMOV, pPCGARANT, pPCPREGUN, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCMOTMOV);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPCPREGUN);
		cStmt.setObject(8, pPCESTADO);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_SET_ACTUALIZARESTADO_SUPL(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCMOTMOV,
			java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCPREGUN, java.math.BigDecimal pPCESTADO)
			throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_SET_ACTUALIZARESTADO_SUPL(pPSSEGURO, pPNMOVIMI, pPNRIESGO,
				pPCMOTMOV, pPCGARANT, pPCPREGUN, pPCESTADO);
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_SET_ACTUALIZARESTADO_SUPL
	// --START-PAC_IAX_GESTIONPROPUESTA.F_EMISION_MASIVA(PSPROCES)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA(java.math.BigDecimal pPSPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_EMISION_MASIVA(?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES" }, new Object[] { pPSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA(java.math.BigDecimal pPSPROCES) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA(pPSPROCES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GESTIONPROPUESTA.F_EMISION_MASIVA
	// --START-PAC_IAX_GESTIONPROPUESTA.F_EMISION_MASIVA_MARCAR(PPOLIZAS, PCESTADO,
	// PSPROCES_IN)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA_MARCAR(Object pPPOLIZAS,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSPROCES_IN) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_EMISION_MASIVA_MARCAR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPOLIZAS", "pPCESTADO", "pPSPROCES_IN" },
				new Object[] { pPPOLIZAS, pPCESTADO, pPSPROCES_IN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPOLIZAS);
		cStmt.setObject(3, pPCESTADO);
		cStmt.setObject(4, pPSPROCES_IN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PSPROCES_OUT"
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
			retVal.put("PSPROCES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA_MARCAR(Object pPPOLIZAS,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSPROCES_IN) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA_MARCAR(pPPOLIZAS, pPCESTADO, pPSPROCES_IN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_EMISION_MASIVA_MARCAR

	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_POLIZASRETEN(PSPRODUC, PNPOLIZA,
	// PNSOLICI, PFCANCEL, PNUMIDE, PNOMBRE, PSNIP, PCMOTRET, PCESTGEST, PCRAMO,
	// PCAGENTE, PCTIPO, PCMATRIC, PCPOSTAL, PTNATRIE, PTDOMICI, PCNIVELBPM,
	// PCSUCURSAL, PCADM, PCMOTOR, PCCHASIS, PNBASTID, PMODO, PCCONTROL, PCPOLCIA,
	// PFRETEND, PFRETENH)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_POLIZASRETEN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNSOLICI, java.sql.Date pPFCANCEL, String pPNUMIDE,
			String pPNOMBRE, String pPSNIP, java.math.BigDecimal pPCMOTRET, java.math.BigDecimal pPCESTGEST,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCAGENTE, String pPCTIPO, String pPCMATRIC,
			String pPCPOSTAL, String pPTNATRIE, String pPTDOMICI, java.math.BigDecimal pPCNIVELBPM,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, String pPMODO, java.math.BigDecimal pPCCONTROL, String pPCPOLCIA, java.sql.Date pPFRETEND,
			java.sql.Date pPFRETENH, java.math.BigDecimal pPCACTIVI, String pPNUMIDEASE, String pPNOMBREASE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_POLIZASRETEN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPRODUC", "pPNPOLIZA", "pPNSOLICI", "pPFCANCEL", "pPNUMIDE", "pPNOMBRE", "pPSNIP",
						"pPCMOTRET", "pPCESTGEST", "pPCRAMO", "pPCAGENTE", "pPCTIPO", "pPCMATRIC", "pPCPOSTAL",
						"pPTNATRIE", "pPTDOMICI", "pPCNIVELBPM", "pPCSUCURSAL", "pPCADM", "pPCMOTOR", "pPCCHASIS",
						"pPNBASTID", "pPMODO", "pPCCONTROL", "pPCPOLCIA", "pPFRETEND", "pPFRETENH", "pPCACTIVI",
						"pPNUMIDEASE", "pPNOMBREASE" },
				new Object[] { pPSPRODUC, pPNPOLIZA, pPNSOLICI, pPFCANCEL, pPNUMIDE, pPNOMBRE, pPSNIP, pPCMOTRET,
						pPCESTGEST, pPCRAMO, pPCAGENTE, pPCTIPO, pPCMATRIC, pPCPOSTAL, pPTNATRIE, pPTDOMICI,
						pPCNIVELBPM, pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPMODO, pPCCONTROL, pPCPOLCIA,
						pPFRETEND, pPFRETENH, pPCACTIVI, pPNUMIDEASE, pPNOMBREASE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.setObject(4, pPNSOLICI);
		cStmt.setObject(5, pPFCANCEL);
		cStmt.setObject(6, pPNUMIDE);
		cStmt.setObject(7, pPNOMBRE);
		cStmt.setObject(8, pPSNIP);
		cStmt.setObject(9, pPCMOTRET);
		cStmt.setObject(10, pPCESTGEST);
		cStmt.setObject(11, pPCRAMO);
		cStmt.setObject(12, pPCAGENTE);
		cStmt.setObject(13, pPCTIPO);
		cStmt.setObject(14, pPCMATRIC);
		cStmt.setObject(15, pPCPOSTAL);
		cStmt.setObject(16, pPTNATRIE);
		cStmt.setObject(17, pPTDOMICI);
		cStmt.setObject(18, pPCNIVELBPM);
		cStmt.setObject(20, pPCSUCURSAL);
		cStmt.setObject(21, pPCADM);
		cStmt.setObject(22, pPCMOTOR);
		cStmt.setObject(23, pPCCHASIS);
		cStmt.setObject(24, pPNBASTID);
		cStmt.setObject(25, pPMODO);
		cStmt.setObject(26, pPCCONTROL);
		cStmt.setObject(27, pPCPOLCIA);
		cStmt.setObject(28, pPFRETEND);
		cStmt.setObject(29, pPFRETENH);
		// INI IAXIS-3160 CJMR 20/03/2019
		cStmt.setObject(30, pPCACTIVI);
		cStmt.setObject(31, pPNUMIDEASE);
		cStmt.setObject(32, pPNOMBREASE);
		// FIN IAXIS-3160 CJMR 20/03/2019
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLIZASRETEN".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.registerOutParameter(33, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_POLRETENPSU".toUpperCase())); // Valor de "PPOLRETPSU"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		try {
			retVal.put("PPOLRETPSU", cStmt.getObject(30));
		} catch (SQLException e) {
			retVal.put("PPOLRETPSU", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_POLIZASRETEN(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNSOLICI, java.sql.Date pPFCANCEL, String pPNUMIDE,
			String pPNOMBRE, String pPSNIP, java.math.BigDecimal pPCMOTRET, java.math.BigDecimal pPCESTGEST,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCAGENTE, String pPCTIPO, String pPCMATRIC,
			String pPCPOSTAL, String pPTNATRIE, String pPTDOMICI, java.math.BigDecimal pPCNIVELBPM,
			java.math.BigDecimal pPCSUCURSAL, java.math.BigDecimal pPCADM, String pPCMOTOR, String pPCCHASIS,
			String pPNBASTID, String pPMODO, java.math.BigDecimal pPCCONTROL, String pPCPOLCIA, java.sql.Date pPFRETEND,
			java.sql.Date pPFRETENH, java.math.BigDecimal pPCACTIVI, String pPNUMIDEASE, String pPNOMBREASE)
			throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_POLIZASRETEN(pPSPRODUC, pPNPOLIZA, pPNSOLICI, pPFCANCEL,
				pPNUMIDE, pPNOMBRE, pPSNIP, pPCMOTRET, pPCESTGEST, pPCRAMO, pPCAGENTE, pPCTIPO, pPCMATRIC, pPCPOSTAL,
				pPTNATRIE, pPTDOMICI, pPCNIVELBPM, pPCSUCURSAL, pPCADM, pPCMOTOR, pPCCHASIS, pPNBASTID, pPMODO,
				pPCCONTROL, pPCPOLCIA, pPFRETEND, pPFRETENH, pPCACTIVI, pPNUMIDEASE, pPNOMBREASE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_GET_POLIZASRETEN

	// --START-PAC_IAX_GESTIONPROPUESTA.LIMPIARTEMPORALES(PSSEGURO)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{call PAC_IAX_GESTIONPROPUESTA.LIMPIARTEMPORALES(?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSSEGURO);
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.LIMPIARTEMPORALES

	// --START-PAC_IAX_GESTIONPROPUESTA.F_GET_REI_NMOVIMI(PSSEGURO, PCMOTMOV)
	private HashMap callPAC_IAX_GESTIONPROPUESTA__F_GET_REI_NMOVIMI(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTIONPROPUESTA.F_GET_REI_NMOVIMI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCMOTMOV" }, new Object[] { pPSSEGURO, pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "OUTNMOVIMI"
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
			retVal.put("OUTNMOVIMI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("OUTNMOVIMI", null);
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

	public HashMap ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_REI_NMOVIMI(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCMOTMOV) throws Exception {
		return this.callPAC_IAX_GESTIONPROPUESTA__F_GET_REI_NMOVIMI(pPSSEGURO, pPCMOTMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTIONPROPUESTA.F_GET_REI_NMOVIMI

}
