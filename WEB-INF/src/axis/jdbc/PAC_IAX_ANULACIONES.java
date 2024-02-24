package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;
import oracle.jdbc.OracleTypes;

public class PAC_IAX_ANULACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ANULACIONES.class);
	private Connection conn = null;

	public PAC_IAX_ANULACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ANULACIONES.F_ANULACION(PSSEGURO, PCTIPANUL, PFANULAC,
	// PCCAUANUL, PMOTANULA, PRECEXTRN, PANULA_REC, PRECIBOS, PAPLICA_PENALI,
	// PIMPEXTORSION)
	private HashMap callPAC_IAX_ANULACIONES__F_ANULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPANUL, java.sql.Date pPFANULAC, java.math.BigDecimal pPCCAUANUL,
			String pPMOTANULA, java.math.BigDecimal pPRECEXTRN, java.math.BigDecimal pPANULA_REC, String pPRECIBOS,
			java.math.BigDecimal pPAPLICA_PENALI, java.math.BigDecimal pPIMPEXTORSION) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_ANULACION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPCTIPANUL", "pPFANULAC", "pPCCAUANUL", "pPMOTANULA", "pPRECEXTRN",
						"pPANULA_REC", "pPRECIBOS", "pPAPLICA_PENALI", "pPIMPEXTORSION" },
				new Object[] { pPSSEGURO, pPCTIPANUL, pPFANULAC, pPCCAUANUL, pPMOTANULA, pPRECEXTRN, pPANULA_REC,
						pPRECIBOS, pPAPLICA_PENALI, pPIMPEXTORSION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCTIPANUL);
		cStmt.setObject(4, pPFANULAC);
		cStmt.setObject(5, pPCCAUANUL);
		cStmt.setObject(6, pPMOTANULA);
		cStmt.setObject(7, pPRECEXTRN);
		cStmt.setObject(8, pPANULA_REC);
		cStmt.setObject(9, pPRECIBOS);
		cStmt.setObject(10, pPAPLICA_PENALI);
		cStmt.setObject(12, pPIMPEXTORSION);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_ANULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPANUL, java.sql.Date pPFANULAC, java.math.BigDecimal pPCCAUANUL,
			String pPMOTANULA, java.math.BigDecimal pPRECEXTRN, java.math.BigDecimal pPANULA_REC, String pPRECIBOS,
			java.math.BigDecimal pPAPLICA_PENALI, java.math.BigDecimal pPIMPEXTORSION) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_ANULACION(pPSSEGURO, pPCTIPANUL, pPFANULAC, pPCCAUANUL, pPMOTANULA,
				pPRECEXTRN, pPANULA_REC, pPRECIBOS, pPAPLICA_PENALI, pPIMPEXTORSION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ANULACIONES.F_ANULACION

	// --START-PAC_IAX_ANULACIONES.F_GET_DATPOLIZA(PSSEGURO)
	private HashMap callPAC_IAX_ANULACIONES__F_GET_DATPOLIZA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_GET_DATPOLIZA(?,?,?,?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "ONPOLIZA"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ONCERTIF"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "OFEFECTO"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.DATE); // Valor de "OFVENCIM"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.DATE); // Valor de "OFRENOVAC"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "OSPRODUC"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "OTPRODUC"
		cStmt.registerOutParameter(10, java.sql.Types.VARCHAR); // Valor de "OTSITUAC"
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
			retVal.put("ONPOLIZA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("ONPOLIZA", null);
		}
		try {
			retVal.put("ONCERTIF", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("ONCERTIF", null);
		}
		try {
			retVal.put("OFEFECTO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("OFEFECTO", null);
		}
		try {
			retVal.put("OFVENCIM", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("OFVENCIM", null);
		}
		try {
			retVal.put("OFRENOVAC", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("OFRENOVAC", null);
		}
		try {
			retVal.put("OSPRODUC", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("OSPRODUC", null);
		}
		try {
			retVal.put("OTPRODUC", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("OTPRODUC", null);
		}
		try {
			retVal.put("OTSITUAC", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("OTSITUAC", null);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_GET_DATPOLIZA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_GET_DATPOLIZA(pPSSEGURO);
	}

	// --END-PAC_IAX_ANULACIONES.F_GET_DATPOLIZA
	// --START-PAC_IAX_ANULACIONES.F_GET_RECIBOS(PSSEGURO)
	private HashMap callPAC_IAX_ANULACIONES__F_GET_RECIBOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_GET_RECIBOS(?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_GET_RECIBOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_GET_RECIBOS(pPSSEGURO);
	}

	// --END-PAC_IAX_ANULACIONES.F_GET_RECIBOS
	// --START-PAC_IAX_ANULACIONES.F_GET_SINIESTROS(PSSEGURO)
	private HashMap callPAC_IAX_ANULACIONES__F_GET_SINIESTROS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_GET_SINIESTROS(?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_GET_SINIESTROS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_GET_SINIESTROS(pPSSEGURO);
	}

	// --END-PAC_IAX_ANULACIONES.F_GET_SINIESTROS
	// --START-PAC_IAX_ANULACIONES.F_GET_TOMADORES(PSSEGURO)
	private HashMap callPAC_IAX_ANULACIONES__F_GET_TOMADORES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_GET_TOMADORES(?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TOMADORES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_GET_TOMADORES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_GET_TOMADORES(pPSSEGURO);
	}

	// --END-PAC_IAX_ANULACIONES.F_GET_TOMADORES
	// --START-PAC_IAX_ANULACIONES.F_SET_TIPANULACION(PSSEGURO, PCTIPANUL)
	private HashMap callPAC_IAX_ANULACIONES__F_SET_TIPANULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPANUL) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_SET_TIPANULACION(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPCTIPANUL" }, new Object[] { pPSSEGURO, pPCTIPANUL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCTIPANUL);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DATE); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_SET_TIPANULACION(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPANUL) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_SET_TIPANULACION(pPSSEGURO, pPCTIPANUL);
	}
	// --END-PAC_IAX_ANULACIONES.F_SET_TIPANULACION

	// --START-PAC_IAX_ANULACIONES.F_SET_OBJANULREC
	private HashMap callPAC_IAX_ANULACIONES__F_SET_OBJANULREC(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFMOVINI,
			java.sql.Date pPFEFECTO, java.sql.Date pPFVENCIM, java.math.BigDecimal pPMARCADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_SET_OBJANULREC(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPNRECIBO", "pPFMOVINI", "pPFEFECTO", "pPFVENCIM", "pPMARCADO" },
				new Object[] { pPNRECIBO, pPFMOVINI, pPFEFECTO, pPFVENCIM, pPMARCADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
		cStmt.setObject(3, pPFMOVINI);
		cStmt.setObject(4, pPFEFECTO);
		cStmt.setObject(5, pPFVENCIM);
		cStmt.setObject(6, pPMARCADO);
		cStmt.registerOutParameter(1, OracleTypes.NUMBER); // Valor de "RETURN"
		cStmt.registerOutParameter(7, OracleTypes.ARRAY,
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_SET_OBJANULREC(java.math.BigDecimal pPNRECIBO, java.sql.Date pPFMOVINI,
			java.sql.Date pPFEFECTO, java.sql.Date pPFVENCIM, java.math.BigDecimal pPMARCADO) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_SET_OBJANULREC(pPNRECIBO, pPFMOVINI, pPFEFECTO, pPFVENCIM, pPMARCADO);
	}

	// --END-PAC_IAX_ANULACIONES.F_SET_OBJANULREC
	// --START-PAC_IAX_ANULACIONES.F_GET_RECCOBRADOS
	private HashMap callPAC_IAX_ANULACIONES__F_GET_RECCOBRADOS(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFANULAC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_GET_RECCOBRADOS(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPFANULAC" }, new Object[] { pPSSEGURO, pPFANULAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFANULAC);
		cStmt.registerOutParameter(1, OracleTypes.NUMBER);
		cStmt.registerOutParameter(4, OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(5, OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(4));
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_GET_RECCOBRADOS(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFANULAC) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_GET_RECCOBRADOS(pPSSEGURO, pPFANULAC);
	}
	// --END-PAC_IAX_ANULACIONES.F_GET_RECCOBRADOS

	// --START-PAC_IAX_ANULACIONES.F_GET_RECPENDIENTES
	private HashMap callPAC_IAX_ANULACIONES__F_GET_RECPENDIENTES(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFANULAC) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_GET_RECPENDIENTES(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPFANULAC" }, new Object[] { pPSSEGURO, pPFANULAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFANULAC);
		cStmt.registerOutParameter(1, OracleTypes.NUMBER);
		cStmt.registerOutParameter(4, OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(5, OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(4));
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_GET_RECPENDIENTES(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFANULAC) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_GET_RECPENDIENTES(pPSSEGURO, pPFANULAC);
	}
	// --END-PAC_IAX_ANULACIONES.F_GET_RECPENDIENTES

	// --START-PAC_IAX_ANULACIONES.F_VALIDA_PERMITE_ANULAR_POLIZA(PSSEGURO,
	// PFANULAC, PVALPARCIAL)
	private HashMap callPAC_IAX_ANULACIONES__F_VAL_FANULAC(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFANULAC,
			java.math.BigDecimal pPVALPARCIAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_VAL_FANULAC(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFANULAC", "pPVALPARCIAL" },
				new Object[] { pPSSEGURO, pPFANULAC, pPVALPARCIAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFANULAC);
		cStmt.setObject(4, pPVALPARCIAL);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_VAL_FANULAC(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFANULAC,
			java.math.BigDecimal pPVALPARCIAL) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_VAL_FANULAC(pPSSEGURO, pPFANULAC, pPVALPARCIAL);
	}
	// --END-PAC_IAX_ANULACIONES.F_VALIDA_PERMITE_ANULAR_POLIZA

	// --START-PAC_IAX_ANULACIONES.F_DESANULA_POLIZA_VTO(PSSEGURO, PFANULAC,
	// PNSUPLEM, MENSAJES)
	private HashMap callPAC_IAX_ANULACIONES__F_DESANULA_POLIZA_VTO(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFANULAC, java.math.BigDecimal pPNSUPLEM) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_DESANULA_POLIZA_VTO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFANULAC", "pPNSUPLEM" },
				new Object[] { pPSSEGURO, pPFANULAC, pPNSUPLEM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFANULAC);
		cStmt.setObject(4, pPNSUPLEM);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_DESANULA_POLIZA_VTO(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFANULAC, java.math.BigDecimal pPNSUPLEM) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_DESANULA_POLIZA_VTO(pPSSEGURO, pPFANULAC, pPNSUPLEM);
	}

	// --END-PAC_IAX_ANULACIONES.F_DESANULA_POLIZA_VTO
	// --START-PAC_IAX_ANULACIONES.F_ES_DESANULABLE(PSSEGURO, MENSAJES)
	private HashMap callPAC_IAX_ANULACIONES__F_ES_DESANULABLE(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_ES_DESANULABLE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OESTADO"
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
			retVal.put("OESTADO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OESTADO", null);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_ES_DESANULABLE(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_ES_DESANULABLE(pPSSEGURO);
	}
	// --END-PAC_IAX_ANULACIONES.F_ES_DESANULABLE

	// --START-PAC_IAX_ANULACIONES.F_SET_SOLANULAC(PSSEGURO, PCTIPANUL, PNRIESGO,
	// PFANULAC, PTOBSERV, PTVALORD, PCMOTMOV)
	private HashMap callPAC_IAX_ANULACIONES__F_SET_SOLANULAC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPANUL, java.math.BigDecimal pPNRIESGO, java.sql.Date pPFANULAC, String pPTOBSERV,
			String pPTVALORD, java.math.BigDecimal pPCMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_SET_SOLANULAC(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPCTIPANUL", "pPNRIESGO", "pPFANULAC", "pPTOBSERV", "pPTVALORD",
						"pPCMOTMOV" },
				new Object[] { pPSSEGURO, pPCTIPANUL, pPNRIESGO, pPFANULAC, pPTOBSERV, pPTVALORD, pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCTIPANUL);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPFANULAC);
		cStmt.setObject(6, pPTOBSERV);
		cStmt.setObject(7, pPTVALORD);
		cStmt.setObject(8, pPCMOTMOV);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_SET_SOLANULAC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPANUL, java.math.BigDecimal pPNRIESGO, java.sql.Date pPFANULAC, String pPTOBSERV,
			String pPTVALORD, java.math.BigDecimal pPCMOTMOV) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_SET_SOLANULAC(pPSSEGURO, pPCTIPANUL, pPNRIESGO, pPFANULAC, pPTOBSERV,
				pPTVALORD, pPCMOTMOV);
	}
	// --END-PAC_IAX_ANULACIONES.F_SET_SOLANULAC

	// --START-PAC_IAX_ANULACIONES.F_APLICA_PENALI_VISIBLE(PSPRODUC, PCMOTMOV)
	private HashMap callPAC_IAX_ANULACIONES__F_APLICA_PENALI_VISIBLE(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ANULACIONES.F_APLICA_PENALI_VISIBLE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCMOTMOV", "pPSSEGURO" },
				new Object[] { pPSPRODUC, pPCMOTMOV, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCMOTMOV);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCVISIBLE"
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
			retVal.put("PCVISIBLE", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCVISIBLE", null);
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

	public HashMap ejecutaPAC_IAX_ANULACIONES__F_APLICA_PENALI_VISIBLE(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCMOTMOV, java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ANULACIONES__F_APLICA_PENALI_VISIBLE(pPSPRODUC, pPCMOTMOV, pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ANULACIONES.F_APLICA_PENALI_VISIBLE
}
