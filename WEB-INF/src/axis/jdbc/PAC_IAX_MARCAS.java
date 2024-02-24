package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.TIaxMarcas;
import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;
import oracle.jdbc.OracleTypes;

public class PAC_IAX_MARCAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENDA.class);
	private Connection conn = null;

	public PAC_IAX_MARCAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES(PFECHA, PCAGENTE)
	private HashMap callPAC_IAX_MARCAS__F_GET_MARCAS_PER(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MARCAS.F_GET_MARCAS_PER(?, ?, ?)}";
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 1");
		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPERSON" }, new Object[] { pPCEMPRES, pPSPERSON });
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 2");
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPERSON);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 3");
		cStmt.execute();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 4");
		HashMap retVal = new HashMap();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 5");
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

	public HashMap ejecutaPAC_IAX_MARCAS__F_GET_MARCAS_PER(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPERSON) throws Exception {
		System.out.println("EN PAC_IAX_MARCAS.ejecutaPAC_IAX_MARCAS__F_GET_MARCAS_PER");
		return this.callPAC_IAX_MARCAS__F_GET_MARCAS_PER(pPCEMPRES, pPSPERSON);
	}
	// --END-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES

	// --START-01/12/2020 FCG IAXIS-5378
	private HashMap callPAC_IAX_MARCAS__F_GET_MARCAS(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_MARCAS.F_GET_MARCAS(?, ?)}";
		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_MARCAS__F_GET_MARCAS(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_MARCAS__F_GET_MARCAS(pPCEMPRES);
	}
	// --END-01/12/2020 FCG IAXIS-5378

	// --START-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES(PFECHA, PCAGENTE)
	private HashMap callPAC_IAX_MARCAS__F_GET_MARCAS_POLIZAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_MARCAS.F_GET_MARCAS_POLIZA(?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPSSEGURO", "pPTABLAS" },
				new Object[] { pPCEMPRES, pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPTABLAS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 3");
		cStmt.execute();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 4");
		HashMap retVal = new HashMap();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 5");
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

	public HashMap ejecutaPAC_IAX_MARCAS__F_GET_MARCAS_POLIZAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, String pPTABLAS) throws Exception {
		System.out.println("EN PAC_IAX_MARCAS.ejecutaPAC_IAX_MARCAS__F_GET_MARCAS_PER");
		return this.callPAC_IAX_MARCAS__F_GET_MARCAS_POLIZAS(pPCEMPRES, pPSSEGURO, pPTABLAS);
	}
	// --END-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES

	// --START-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES(PFECHA, PCAGENTE)
	private HashMap callPAC_IAX_MARCAS__F_GET_ACCION_POLIZA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_MARCAS.F_GET_ACCION_POLIZA(?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPSSEGURO", "pPTABLAS" },
				new Object[] { pPCEMPRES, pPSSEGURO, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPTABLAS);
		cStmt.registerOutParameter(1, OracleTypes.NUMERIC); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_MARCAS__F_GET_ACCION_POLIZA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_MARCAS__F_GET_ACCION_POLIZA(pPCEMPRES, pPSSEGURO, pPTABLAS);
	}
	// --END-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES

	// --START-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES(PFECHA, PCAGENTE)
	private HashMap callPAC_IAX_MARCAS__F_OBTIENE_MARCAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPERSON)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MARCAS.F_OBTIENE_MARCAS(?, ?, ?)}";
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_OBTIENE_MARCAS PASO 1");
		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPERSON" }, new Object[] { pPCEMPRES, pPSPERSON });
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 2");
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPERSON);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MARCAS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 3");
		cStmt.execute();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 4");
		HashMap retVal = new HashMap();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 5");
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

	public HashMap ejecutaPAC_IAX_MARCAS__F_OBTIENE_MARCAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPERSON) throws Exception {
		System.out.println("EN PAC_IAX_MARCAS.ejecutaPAC_IAX_MARCAS__F_OBTIENE_MARCAS");
		return this.callPAC_IAX_MARCAS__F_OBTIENE_MARCAS(pPCEMPRES, pPSPERSON);
	}

	// --START-PAC_IAX_AGE_SINIESTROS.F_GET_ACTORES(PFECHA, PCAGENTE)
	private HashMap callPAC_IAX_MARCAS__F_MARCAS_HISTORICO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPERSON, String pPCMARCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MARCAS.F_GET_MARCAS_PERHISTORICO(?, ?, ?, ?)}";
		System.out.println("EN callPAC_IAX_MARCAS__F_MARCAS_HISTORICO PASO 1");
		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPERSON" }, new Object[] { pPCEMPRES, pPSPERSON });
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 2");
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPCMARCA);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 3");
		cStmt.execute();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 4");
		HashMap retVal = new HashMap();
		System.out.println("EN PAC_IAX_MARCAS.callPAC_IAX_MARCAS__F_GET_MARCAS_PER PASO 5");
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

	public HashMap ejecutaPAC_IAX_MARCAS__F_MARCAS_HISTORICO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPERSON, String pPCMARCA) throws Exception {
		System.out.println("EN PAC_IAX_MARCAS.ejecutaPAC_IAX_MARCAS__F_MARCAS_HISTORICO");
		return this.callPAC_IAX_MARCAS__F_MARCAS_HISTORICO(pPCEMPRES, pPSPERSON, pPCMARCA);
	}

	// --START-PAC_IAX_COMCONVENIOS.F_ALTA_CONVENIO_WEB(PCMODO, PSCOMCONV,
	// PTCONVENIO, PCAGENTE, PFINIVIG, PFFINVIG, PFANUL, PIIMPORTE, PLISTAPRODS,
	// PLISTACOMIS)
	private HashMap callPAC_IAX_MARCAS__F_SET_MARCAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPERSON,
			TIaxMarcas pPMARCAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_MARCAS.F_SET_MARCAS_PER(?, ?, ?,?)}";

		// HANS logCall(callQuery, new String[] {"pPCMODO", "pPSCOMCONV", "pPTCONVENIO",
		// "pPCAGENTE", "pPFINIVIG", "pPFFINVIG", "pPFANUL", "pPIIMPORTE",
		// "pPLISTAPRODS", "pPLISTACOMIS"}, new Object[] {pPCMODO, pPSCOMCONV,
		// pPTCONVENIO, pPCAGENTE, pPFINIVIG, pPFFINVIG, pPFANUL, pPIIMPORTE,
		// pPLISTAPRODS, pPLISTACOMIS});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPMARCAS);
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

	public HashMap ejecutaPAC_IAX_MARCAS__F_SET_MARCAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPERSON,
			TIaxMarcas pPMARCAS) throws Exception {
		return this.callPAC_IAX_MARCAS__F_SET_MARCAS(pPCEMPRES, pPSPERSON, pPMARCAS);
	}
	// --END-PAC_IAX_PERSONA.F_SET_REGIMENFISCAL

}
