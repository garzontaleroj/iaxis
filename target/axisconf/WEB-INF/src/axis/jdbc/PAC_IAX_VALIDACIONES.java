package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_VALIDACIONES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_VALIDACIONES.class);
	private Connection conn = null;

	public PAC_IAX_VALIDACIONES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_VALIDACIONES.F_VALIDAASEGURADOS()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAASEGURADOS(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAASEGURADOS
	// --START-PAC_IAX_VALIDACIONES.F_VALIDACION_CAPITAL(SELGAR, NRIESGO, CGARANT,
	// MENSAJES)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDACION_CAPITAL(java.math.BigDecimal pSELGAR,
			java.math.BigDecimal pNRIESGO, java.math.BigDecimal pCGARANT, Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDACION_CAPITAL(?,?,?,?)}";
		logCall(callQuery, new String[] { "pSELGAR", "pNRIESGO", "pCGARANT", "pMENSAJES" },
				new Object[] { pSELGAR, pNRIESGO, pCGARANT, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSELGAR);
		cStmt.setObject(3, pNRIESGO);
		cStmt.setObject(4, pCGARANT);
		cStmt.setObject(5, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDACION_CAPITAL(java.math.BigDecimal pSELGAR,
			java.math.BigDecimal pNRIESGO, java.math.BigDecimal pCGARANT, Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDACION_CAPITAL(pSELGAR, pNRIESGO, pCGARANT, pMENSAJES);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDACION_CAPITAL
	// --START-PAC_IAX_VALIDACIONES.F_VALIDACION_COBLIGA(SELGAR, NRIESGO, CGARANT,
	// MENSAJES)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDACION_COBLIGA(java.math.BigDecimal pSELGAR,
			java.math.BigDecimal pNRIESGO, java.math.BigDecimal pCGARANT, Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDACION_COBLIGA(?,?,?,?)}";
		logCall(callQuery, new String[] { "pSELGAR", "pNRIESGO", "pCGARANT", "pMENSAJES" },
				new Object[] { pSELGAR, pNRIESGO, pCGARANT, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSELGAR);
		cStmt.setObject(3, pNRIESGO);
		cStmt.setObject(4, pCGARANT);
		cStmt.setObject(5, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDACION_COBLIGA(java.math.BigDecimal pSELGAR,
			java.math.BigDecimal pNRIESGO, java.math.BigDecimal pCGARANT, Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDACION_COBLIGA(pSELGAR, pNRIESGO, pCGARANT, pMENSAJES);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDACION_COBLIGA
	// --START-PAC_IAX_VALIDACIONES.F_VALIDACLAUSULAS()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDACLAUSULAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDACLAUSULAS(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDACLAUSULAS() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDACLAUSULAS();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDACLAUSULAS
	// --START-PAC_IAX_VALIDACIONES.F_VALIDADATOSGESTION()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDADATOSGESTION() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDADATOSGESTION(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGESTION() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDADATOSGESTION();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDADATOSGESTION
	// --START-PAC_IAX_VALIDACIONES.F_VALIDADATOSGSTPREGPOL()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDADATOSGSTPREGPOL(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDADATOSGSTPREGPOL
	// --START-PAC_IAX_VALIDACIONES.F_VALIDADPREGGARANT()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANT() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDADPREGGARANT(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANT() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANT();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDADPREGGARANT
	// --START-PAC_IAX_VALIDACIONES.F_VALIDADPREGGARANTRIESGO(PNRIESGO)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANTRIESGO(java.math.BigDecimal pPNRIESGO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDADPREGGARANTRIESGO(?,?)}";
		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANTRIESGO(java.math.BigDecimal pPNRIESGO)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANTRIESGO(pPNRIESGO);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDADPREGGARANTRIESGO
	// --START-PAC_IAX_VALIDACIONES.F_VALIDAGARANTIAS()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAGARANTIAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAGARANTIAS(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAGARANTIAS() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAGARANTIAS();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAGARANTIAS
	// --START-PAC_IAX_VALIDACIONES.F_VALIDAGESTIONRIESGOS()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAGESTIONRIESGOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAGESTIONRIESGOS(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAGESTIONRIESGOS() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAGESTIONRIESGOS();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAGESTIONRIESGOS

	// --START-PAC_IAX_VALIDACIONES.F_VALIDAPREGUNTAS(PSSEGURO, PACTIVI, PNRIESGO,
	// PCGARANT, PNMOVIMI, PNMOVIMA, PTABLAS, PREGUNTAS, NIVELPREG)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAPREGUNTAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPACTIVI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNMOVIMA, String pPTABLAS, Object pPREGUNTAS,
			String pNIVELPREG) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAPREGUNTAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPACTIVI", "pPNRIESGO", "pPCGARANT", "pPNMOVIMI", "pPNMOVIMA", "pPTABLAS",
						"pPREGUNTAS", "pNIVELPREG" },
				new Object[] { pPSSEGURO, pPACTIVI, pPNRIESGO, pPCGARANT, pPNMOVIMI, pPNMOVIMA, pPTABLAS, pPREGUNTAS,
						pNIVELPREG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPACTIVI);
		cStmt.setObject(4, pPNRIESGO);
		cStmt.setObject(5, pPCGARANT);
		cStmt.setObject(6, pPNMOVIMI);
		cStmt.setObject(7, pPNMOVIMA);
		cStmt.setObject(8, pPTABLAS);
		cStmt.setObject(9, pPREGUNTAS);
		cStmt.setObject(10, pNIVELPREG);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAPREGUNTAS(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPACTIVI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNMOVIMA, String pPTABLAS, Object pPREGUNTAS,
			String pNIVELPREG) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAPREGUNTAS(pPSSEGURO, pPACTIVI, pPNRIESGO, pPCGARANT, pPNMOVIMI,
				pPNMOVIMA, pPTABLAS, pPREGUNTAS, pNIVELPREG);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAPREGUNTAS

	// --START-PAC_IAX_VALIDACIONES.F_VALIDAR_GARANTIAS_AL_TARIFAR(PSOLICIT,
	// PNRIESGO, PNMOVIMI, PSPRODUC, PCACTIVI, MENSAJES)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAR_GARANTIAS_AL_TARIFAR(java.math.BigDecimal pPSOLICIT,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAR_GARANTIAS_AL_TARIFAR(?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pPSOLICIT", "pPNRIESGO", "pPNMOVIMI", "pPSPRODUC", "pPCACTIVI", "pMENSAJES" },
				new Object[] { pPSOLICIT, pPNRIESGO, pPNMOVIMI, pPSPRODUC, pPCACTIVI, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSOLICIT);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.setObject(7, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAR_GARANTIAS_AL_TARIFAR(java.math.BigDecimal pPSOLICIT,
			java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAR_GARANTIAS_AL_TARIFAR(pPSOLICIT, pPNRIESGO, pPNMOVIMI, pPSPRODUC,
				pPCACTIVI, pMENSAJES);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAR_GARANTIAS_AL_TARIFAR
	// --START-PAC_IAX_VALIDACIONES.F_VALIDATOMADORES()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDATOMADORES() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDATOMADORES(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDATOMADORES() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDATOMADORES();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDATOMADORES

	// --START-PAC_IAX_VALIDACIONES.F_VALIDARIESGOS()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDARIESGOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDARIESGOS(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDARIESGOS() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDARIESGOS();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDARIESGOS

	// --START-PAC_IAX_VALIDACIONES.F_VALIDADATOSASEGURADOS()

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDADATOSASEGURADOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDADATOSASEGURADOS(?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSASEGURADOS() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDADATOSASEGURADOS();
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDADATOSASEGURADOS

	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_CUEST_SALUD(PPULSADO, PMODO, PSSEGURO,
	// PNRIESGO)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_CUEST_SALUD(java.math.BigDecimal pPPULSADO, String pPMODO,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_CUEST_SALUD(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPULSADO", "pPMODO", "pPSSEGURO", "pPNRIESGO" },
				new Object[] { pPPULSADO, pPMODO, pPSSEGURO, pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPULSADO);
		cStmt.setObject(3, pPMODO);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPNRIESGO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CUEST_SALUD(java.math.BigDecimal pPPULSADO, String pPMODO,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_CUEST_SALUD(pPPULSADO, pPMODO, pPSSEGURO, pPNRIESGO);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_CUEST_SALUD

	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_CONDUCTORINNOMINADO(PNRIESGO, PNORDEN,
	// PFNACIMI, PFCARNET, PSEXO, PNPUNTOS)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_CONDUCTORINNOMINADO(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.sql.Date pPFNACIMI, java.sql.Date pPFCARNET,
			java.math.BigDecimal pPSEXO, java.math.BigDecimal pPNPUNTOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_CONDUCTORINNOMINADO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPNORDEN", "pPFNACIMI", "pPFCARNET", "pPSEXO", "pPNPUNTOS" },
				new Object[] { pPNRIESGO, pPNORDEN, pPFNACIMI, pPFCARNET, pPSEXO, pPNPUNTOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPFNACIMI);
		cStmt.setObject(5, pPFCARNET);
		cStmt.setObject(6, pPSEXO);
		cStmt.setObject(7, pPNPUNTOS);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CONDUCTORINNOMINADO(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPNORDEN, java.sql.Date pPFNACIMI, java.sql.Date pPFCARNET,
			java.math.BigDecimal pPSEXO, java.math.BigDecimal pPNPUNTOS) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_CONDUCTORINNOMINADO(pPNRIESGO, pPNORDEN, pPFNACIMI, pPFCARNET,
				pPSEXO, pPNPUNTOS);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_CONDUCTORINNOMINADO

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_PRODUCTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_PRODUCTO(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_PRODUCTO() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_PRODUCTO();
	}
	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_SALDOSDEUTORS(PNRIESGO)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_SALDOSDEUTORS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_SALDOSDEUTORS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SALDODEUTORSEG".toUpperCase())); // Valor de "PSALDO"
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
			retVal.put("PSALDO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PSALDO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_SALDOSDEUTORS(java.math.BigDecimal pPNRIESGO)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_SALDOSDEUTORS(pPNRIESGO);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_SALDOSDEUTORS

	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_PRESTAMOSEG(PNRIESGO)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_PRESTAMOSEG(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_PRESTAMOSEG(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PRESTAMOSEG".toUpperCase())); // Valor de "PPRESTAMO"
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
			retVal.put("PPRESTAMO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PPRESTAMO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_PRESTAMOSEG(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_PRESTAMOSEG(pPNRIESGO);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_PRESTAMOSEG

	// --START-PAC_IAX_VALIDACIONES.F_VALIDAGARANTIA(PNRIESGO, PCGARANT)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAGARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAGARANTIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO", "pPCGARANT" }, new Object[] { pPNRIESGO, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.setObject(3, pPCGARANT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAGARANTIA(java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAGARANTIA(pPNRIESGO, pPCGARANT);
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAGARANTIA
	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_REEMPLAZO(PSSEGURO, PSPRODUC)

	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_REEMPLAZO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_REEMPLAZO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPSPRODUC" }, new Object[] { pPSSEGURO, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPSPRODUC);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_REEMPLAZO(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_REEMPLAZO(pPSSEGURO, pPSPRODUC); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_REEMPLAZO

	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_CORRETAJE()
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_CORRETAJE() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_CORRETAJE(?)}";

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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CORRETAJE() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_CORRETAJE();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_CORRETAJE

	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_INQUIAVAL()
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_INQUIAVAL() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_INQUIAVAL(?)}";

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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_INQUIAVAL() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_INQUIAVAL();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_INQUIAVAL

	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_RETORNO()
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_RETORNO() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_RETORNO(?)}";

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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_RETORNO() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_RETORNO();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_RETORNO

	// --START-PAC_IAX_VALIDACIONES.F_VALIDACONDUCTORES()
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDACONDUCTORES() throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDACONDUCTORES(?)}";

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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDACONDUCTORES() throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDACONDUCTORES();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDACONDUCTORES

	// --START-PAC_IAX_VALIDACIONES.F_VALIDAASEGURADOS_NOMODIFCAR(PSPERSON)
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS_NOMODIFCAR(java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAASEGURADOS_NOMODIFCAR(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS_NOMODIFCAR(java.math.BigDecimal pPSPERSON)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS_NOMODIFCAR(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAASEGURADOS_NOMODIFCAR

	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_CAMPO(PCEMPRES, PCIDCAMPO, PCAMPO)
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_CAMPO(java.math.BigDecimal pPCEMPRES, String pPCIDCAMPO,
			String pPCAMPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_CAMPO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCIDCAMPO", "pPCAMPO" },
				new Object[] { pPCEMPRES, pPCIDCAMPO, pPCAMPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCIDCAMPO);
		cStmt.setObject(4, pPCAMPO);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CAMPO(java.math.BigDecimal pPCEMPRES, String pPCIDCAMPO,
			String pPCAMPO) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_CAMPO(pPCEMPRES, pPCIDCAMPO, pPCAMPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_CAMPO

	// Bug 27305 20140121 MMS
	// --START-PAC_IAX_VALIDACIONES.F_VALIDA_ESCLAUSULACERTIF0(PNORDCLA, PTCLAESP)
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDA_ESCLAUSULACERTIF0(java.math.BigDecimal pPNORDCLA,
			String pPTCLAESP) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDA_ESCLAUSULACERTIF0(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNORDCLA", "pPTCLAESP" }, new Object[] { pPNORDCLA, pPTCLAESP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNORDCLA);
		cStmt.setObject(3, pPTCLAESP);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_ESCLAUSULACERTIF0(java.math.BigDecimal pPNORDCLA,
			String pPTCLAESP) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDA_ESCLAUSULACERTIF0(pPNORDCLA, pPTCLAESP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDA_ESCLAUSULACERTIF0

	// --START-PAC_IAX_VALIDACIONES.F_VALIDAMODI_PLAN(PNRIESGO)
	private HashMap callPAC_IAX_VALIDACIONES__F_VALIDAMODI_PLAN(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_VALIDAMODI_PLAN(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
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

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_VALIDAMODI_PLAN(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_VALIDAMODI_PLAN(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_VALIDACIONES.F_VALIDAMODI_PLAN

	// Guilherme El Kadri - Task 4207 - inicio
	// --START-PAC_IAX_VALIDACIONES.F_AGENTES_BLOCK(CAGENTE)
	private HashMap callPAC_IAX_VALIDACIONES__F_AGENTE_BLOCK(java.math.BigDecimal pCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_AGENTE_BLOCK(?, ?)}";
		// String callQuery="{?=call F_AGENTE_BLOCK(?, ?)}";
		logCall(callQuery, new String[] { "pCAGENTE" }, new Object[] { pCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCAGENTE);
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
	// --END-PAC_IAX_VALIDACIONES.F_AGENTES_BLOCK

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_AGENTE_BLOCK(java.math.BigDecimal pCAGENTE) throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_AGENTE_BLOCK(pCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// Guilherme El Kadri - Task 4207 - fim

	// INI IAXIS-14419 -- 08/10/2020 BJHB
	// --START-PAC_IAX_VALIDACIONES.F_CONSULTA_FACTURA(SSEGURO)
	private HashMap callPAC_IAX_VALIDACIONES__F_CONSULTA_FACTURA(java.math.BigDecimal pSSEGURO, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_VALIDACIONES.F_CONSULTA_FACTURA(?, ?, ?)}";
		// String callQuery="{?=call F_AGENTE_BLOCK(?, ?)}";
		logCall(callQuery, new String[] { "pSSEGURO", "pPTABLAS" }, new Object[] { pSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSSEGURO);
		cStmt.setObject(3, pPTABLAS);
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
	// --END-PAC_IAX_VALIDACIONES.F_CONSULTA_FACTURA

	public HashMap ejecutaPAC_IAX_VALIDACIONES__F_CONSULTA_FACTURA(java.math.BigDecimal pSSEGURO, String pPTABLAS)
			throws Exception {
		return this.callPAC_IAX_VALIDACIONES__F_CONSULTA_FACTURA(pSSEGURO, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// FIN IAXIS-14419 -- 08/10/2020 BJHB

}
