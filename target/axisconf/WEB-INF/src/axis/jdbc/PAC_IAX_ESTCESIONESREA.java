//Revision:# eEY4zjdfePz6HdMI8Zox6w== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_ESTCESIONESREA extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_ESTCESIONESREA.class);
	private Connection conn = null;

	public PAC_IAX_ESTCESIONESREA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREA(PSSEGURO)

	// --START-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREA(PSSEGURO, PCGENERA)
	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGENERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCGENERA" }, new Object[] { pPSSEGURO, pPCGENERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCGENERA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ESTCESIONESREA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCGENERA) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREA(pPSSEGURO, pPCGENERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREA
	// --START-PAC_IAX_ESTCESIONESREA.F_GET_TOTALESESTCESIONREA(PSSEGURO)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_TOTALESESTCESIONREA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_TOTALESESTCESIONREA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PTOTPORCESION"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PTOTCAPITAL"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PTOTCESION"
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
			retVal.put("PTOTPORCESION", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTOTPORCESION", null);
		}
		try {
			retVal.put("PTOTCAPITAL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTOTCAPITAL", null);
		}
		try {
			retVal.put("PTOTCESION", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PTOTCESION", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_TOTALESESTCESIONREA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_TOTALESESTCESIONREA(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_GET_TOTALESESTCESIONREA

	// --START-PAC_IAX_ESTCESIONESREA.UPDCAPITALTRAMO(PPORCESION, PTOTCAPITAL,
	// PSSEGPOL, PSCESREA)

	private HashMap callPAC_IAX_ESTCESIONESREA__UPDCAPITALTRAMO(java.math.BigDecimal pPPORCESION,
			java.math.BigDecimal pPTOTCAPITAL, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.UPDCAPITALTRAMO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPORCESION", "pPTOTCAPITAL", "pPSSEGPOL", "pPSCESREA" },
				new Object[] { pPPORCESION, pPTOTCAPITAL, pPSSEGPOL, pPSCESREA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPORCESION);
		cStmt.setObject(3, pPTOTCAPITAL);
		cStmt.setObject(4, pPSSEGPOL);
		cStmt.setObject(5, pPSCESREA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCALCULO"
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
			retVal.put("PCALCULO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCALCULO", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__UPDCAPITALTRAMO(java.math.BigDecimal pPPORCESION,
			java.math.BigDecimal pPTOTCAPITAL, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__UPDCAPITALTRAMO(pPPORCESION, pPTOTCAPITAL, pPSSEGPOL, pPSCESREA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.UPDCAPITALTRAMO
	// --START-PAC_IAX_ESTCESIONESREA.UPDCESIONTRAMO(PPORCESION, PTOTCESION,
	// PSSEGPOL, PSCESREA)

	private HashMap callPAC_IAX_ESTCESIONESREA__UPDCESIONTRAMO(java.math.BigDecimal pPPORCESION,
			java.math.BigDecimal pPTOTCESION, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.UPDCESIONTRAMO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPPORCESION", "pPTOTCESION", "pPSSEGPOL", "pPSCESREA" },
				new Object[] { pPPORCESION, pPTOTCESION, pPSSEGPOL, pPSCESREA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPORCESION);
		cStmt.setObject(3, pPTOTCESION);
		cStmt.setObject(4, pPSSEGPOL);
		cStmt.setObject(5, pPSCESREA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCALCULO"
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
			retVal.put("PCALCULO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCALCULO", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__UPDCESIONTRAMO(java.math.BigDecimal pPPORCESION,
			java.math.BigDecimal pPTOTCESION, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__UPDCESIONTRAMO(pPPORCESION, pPTOTCESION, pPSSEGPOL, pPSCESREA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.UPDCESIONTRAMO
	// --START-PAC_IAX_ESTCESIONESREA.UPDPORCESION_CAPITAL(PCAPITAL, PTOTCAPITAL,
	// PSSEGPOL, PSCESREA)

	private HashMap callPAC_IAX_ESTCESIONESREA__UPDPORCESION_CAPITAL(java.math.BigDecimal pPCAPITAL,
			java.math.BigDecimal pPTOTCAPITAL, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.UPDPORCESION_CAPITAL(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAPITAL", "pPTOTCAPITAL", "pPSSEGPOL", "pPSCESREA" },
				new Object[] { pPCAPITAL, pPTOTCAPITAL, pPSSEGPOL, pPSCESREA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAPITAL);
		cStmt.setObject(3, pPTOTCAPITAL);
		cStmt.setObject(4, pPSSEGPOL);
		cStmt.setObject(5, pPSCESREA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCALCULO"
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
			retVal.put("PCALCULO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCALCULO", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__UPDPORCESION_CAPITAL(java.math.BigDecimal pPCAPITAL,
			java.math.BigDecimal pPTOTCAPITAL, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__UPDPORCESION_CAPITAL(pPCAPITAL, pPTOTCAPITAL, pPSSEGPOL, pPSCESREA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.UPDPORCESION_CAPITAL
	// --START-PAC_IAX_ESTCESIONESREA.UPDPORCESION_ICESION(PICESION, PTCESION,
	// PSSEGPOL, PSCESREA)

	private HashMap callPAC_IAX_ESTCESIONESREA__UPDPORCESION_ICESION(java.math.BigDecimal pPICESION,
			java.math.BigDecimal pPTCESION, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.UPDPORCESION_ICESION(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPICESION", "pPTCESION", "pPSSEGPOL", "pPSCESREA" },
				new Object[] { pPICESION, pPTCESION, pPSSEGPOL, pPSCESREA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPICESION);
		cStmt.setObject(3, pPTCESION);
		cStmt.setObject(4, pPSSEGPOL);
		cStmt.setObject(5, pPSCESREA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCALCULO"
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
			retVal.put("PCALCULO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCALCULO", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__UPDPORCESION_ICESION(java.math.BigDecimal pPICESION,
			java.math.BigDecimal pPTCESION, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSCESREA)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__UPDPORCESION_ICESION(pPICESION, pPTCESION, pPSSEGPOL, pPSCESREA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.UPDPORCESION_ICESION

	// --START-PAC_IAX_ESTCESIONESREA.VALIDAFECHAS(PSCESREA, PSSEGPOL, PCGARANT,
	// PFEFECTO, PFVENCIMIENTO)

	private HashMap callPAC_IAX_ESTCESIONESREA__VALIDAFECHAS(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPCGARANT, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIMIENTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.VALIDAFECHAS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCESREA", "pPSSEGPOL", "pPCGARANT", "pPFEFECTO", "pPFVENCIMIENTO" },
				new Object[] { pPSCESREA, pPSSEGPOL, pPCGARANT, pPFEFECTO, pPFVENCIMIENTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCESREA);
		cStmt.setObject(3, pPSSEGPOL);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPFEFECTO);
		cStmt.setObject(6, pPFVENCIMIENTO);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__VALIDAFECHAS(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPCGARANT, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIMIENTO) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__VALIDAFECHAS(pPSCESREA, pPSSEGPOL, pPCGARANT, pPFEFECTO,
				pPFVENCIMIENTO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.VALIDAFECHAS
	// --START-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREASINIE(PNSINIES)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREASINIE(java.math.BigDecimal pPNSINIES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREASINIES(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ESTCESIONESREA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREASINIE(java.math.BigDecimal pPNSINIES)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREASINIE(pPNSINIES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREASINIE

	// --START-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREACUM(PSCUMULO, PCGENERA)
	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREACUM(java.math.BigDecimal pPSCUMULO,
			java.math.BigDecimal pPCGENERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREACUM(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCUMULO", "pPCGENERA" }, new Object[] { pPSCUMULO, pPCGENERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCUMULO);
		cStmt.setObject(3, pPCGENERA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ESTCESIONESREA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREACUM(java.math.BigDecimal pPSCUMULO,
			java.math.BigDecimal pPCGENERA) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREACUM(pPSCUMULO, pPCGENERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREACUM

	private HashMap callPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_PROPORCIONAL(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.SIMULACION_CIERRE_PROPORCIONAL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCERROR"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "PFPROCES"
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
			retVal.put("PCERROR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCERROR", null);
		}
		try {
			retVal.put("PSPROCES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
		}
		try {
			retVal.put("PFPROCES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFPROCES", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_PROPORCIONAL(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_PROPORCIONAL(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.SIMULACION_CIERRE_PROPORCIONAL

	// --START-PAC_IAX_ESTCESIONESREA.SIMULACION_CIERRE_XL(PSSEGURO)

	private HashMap callPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_XL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.SIMULACION_CIERRE_XL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCERROR"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "PFPROCES"
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
			retVal.put("PCERROR", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCERROR", null);
		}
		try {
			retVal.put("PSPROCES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
		}
		try {
			retVal.put("PFPROCES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFPROCES", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_XL(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_XL(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.SIMULACION_CIERRE_XL

	// --START-PAC_IAX_ESTCESIONESREA.TRASPASO_INF_ESTTOCESIONESREA(PSSEGURO,
	// PSPROCES)

	private HashMap callPAC_IAX_ESTCESIONESREA__TRASPASO_INF_ESTTOCESIONESREA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.TRASPASO_INF_ESTTOCESIONESREA(?, ?)}";

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
			retVal.put("MENSAJES", cStmt.getObject(3)); // Inicio (22872 - 39214) - AMC - 10/02/2016
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__TRASPASO_INF_ESTTOCESIONESREA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__TRASPASO_INF_ESTTOCESIONESREA(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.TRASPASO_INF_ESTTOCESIONESREA

	// --START-PAC_IAX_ESTCESIONESREA.TRASPASO_INF_CESIONESREATOEST(PSSEGPOL,
	// PNSINIES, PCGENERA)
	private HashMap callPAC_IAX_ESTCESIONESREA__TRASPASO_INF_CESIONESREATOEST(java.math.BigDecimal pPSSEGPOL,
			java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCGENERA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.TRASPASO_INF_CESIONESREATOEST(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGPOL", "pPNSINIES", "pPCGENERA" },
				new Object[] { pPSSEGPOL, pPNSINIES, pPCGENERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGPOL);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPCGENERA);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__TRASPASO_INF_CESIONESREATOEST(java.math.BigDecimal pPSSEGPOL,
			java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCGENERA) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__TRASPASO_INF_CESIONESREATOEST(pPSSEGPOL, pPNSINIES, pPCGENERA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.TRASPASO_INF_CESIONESREATOEST

	// --START-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREAPOLIZAS(PNPOLIZA,
	// PCGENERA)
	// INI - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREAPOLIZAS(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPCGENERA, java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREAPOLIZAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPCGENERA" }, new Object[] { pPNPOLIZA, pPCGENERA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPCGENERA);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ESTCESIONESREA".toUpperCase())); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}
	// FIN - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO

	// INI - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREAPOLIZAS(java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPCGENERA, java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREAPOLIZAS(pPNPOLIZA, pPCGENERA, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// FIN - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
	// --END-PAC_IAX_ESTCESIONESREA.F_GET_ESTCESIONESREAPOLIZAS

	private HashMap callPAC_IAX_ESTCESIONESREA__F_SET_ESTCESIONESREA(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPNCESION, java.math.BigDecimal pPICESION, java.math.BigDecimal pPICAPCES,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPICOMISI, java.math.BigDecimal pPSCUMULO, java.math.BigDecimal pPGARANT,
			java.math.BigDecimal pPSPLENO, java.math.BigDecimal pPNSINIES, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIM, java.sql.Date pPFCONTAB, java.math.BigDecimal pPPCESION,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCGENERA, java.sql.Date pPFGENERA,
			java.sql.Date pPFREGULA, java.sql.Date pPFANULAC, java.math.BigDecimal pPNMOVIMI,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPIPRITARREA, java.math.BigDecimal pPPSOBREPRIMA,
			java.math.BigDecimal pPCDETCES, java.math.BigDecimal pPIPLENO, java.math.BigDecimal pPICAPACI,
			java.math.BigDecimal pNMOVIGEN, java.math.BigDecimal pPIEXTRAP, java.math.BigDecimal pIEXTREA,
			java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPITARIFREA, java.math.BigDecimal pPICOMEXT) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_SET_ESTCESIONESREA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCESREA", "pPNCESION", "pPICESION", "pPICAPCES", "pPSSEGURO", "pPSSEGPOL",
				"pPNPOLIZA", "pPNCERTIF", "pPNVERSIO", "pPSCONTRA", "pPCTRAMO", "pPSFACULT", "pPNRIESGO", "pPICOMISI",
				"pPSCUMULO", "pPGARANT", "pPSPLENO", "pPNSINIES", "pPFEFECTO", "pPFVENCIM", "pPFCONTAB", "pPPCESION",
				"pPSPROCES", "pPCGENERA", "pPFGENERA", "pPFREGULA", "pPFANULAC", "pPNMOVIMI", "pPSIDEPAG",
				"pPIPRITARREA", "pPPSOBREPRIMA", "pPCDETCES", "pPIPLENO", "pPICAPACI", "pNMOVIGEN", "pPIEXTRAP",
				"pIEXTREA", "pPNREEMB", "pPNFACT", "pPNLINEA", "pPITARIFREA", "pPICOMEXT" },
				new Object[] { pPSCESREA, pPNCESION, pPICESION, pPICAPCES, pPSSEGURO, pPSSEGPOL, pPNPOLIZA, pPNCERTIF,
						pPNVERSIO, pPSCONTRA, pPCTRAMO, pPSFACULT, pPNRIESGO, pPICOMISI, pPSCUMULO, pPGARANT, pPSPLENO,
						pPNSINIES, pPFEFECTO, pPFVENCIM, pPFCONTAB, pPPCESION, pPSPROCES, pPCGENERA, pPFGENERA,
						pPFREGULA, pPFANULAC, pPNMOVIMI, pPSIDEPAG, pPIPRITARREA, pPPSOBREPRIMA, pPCDETCES, pPIPLENO,
						pPICAPACI, pNMOVIGEN, pPIEXTRAP, pIEXTREA, pPNREEMB, pPNFACT, pPNLINEA, pPITARIFREA,
						pPICOMEXT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCESREA);
		cStmt.setObject(3, pPNCESION);
		cStmt.setObject(4, pPICESION);
		cStmt.setObject(5, pPICAPCES);
		cStmt.setObject(6, pPSSEGURO);
		cStmt.setObject(7, pPSSEGPOL);
		cStmt.setObject(8, pPNPOLIZA);
		cStmt.setObject(9, pPNCERTIF);
		cStmt.setObject(10, pPNVERSIO);
		cStmt.setObject(11, pPSCONTRA);
		cStmt.setObject(12, pPCTRAMO);
		cStmt.setObject(13, pPSFACULT);
		cStmt.setObject(14, pPNRIESGO);
		cStmt.setObject(15, pPICOMISI);
		cStmt.setObject(16, pPSCUMULO);
		cStmt.setObject(17, pPGARANT);
		cStmt.setObject(18, pPSPLENO);
		cStmt.setObject(19, pPNSINIES);
		cStmt.setObject(20, pPFEFECTO);
		cStmt.setObject(21, pPFVENCIM);
		cStmt.setObject(22, pPFCONTAB);
		cStmt.setObject(23, pPPCESION);
		cStmt.setObject(24, pPSPROCES);
		cStmt.setObject(25, pPCGENERA);
		cStmt.setObject(26, pPFGENERA);
		cStmt.setObject(27, pPFREGULA);
		cStmt.setObject(28, pPFANULAC);
		cStmt.setObject(29, pPNMOVIMI);
		cStmt.setObject(30, pPSIDEPAG);
		cStmt.setObject(31, pPIPRITARREA);
		cStmt.setObject(32, pPPSOBREPRIMA);
		cStmt.setObject(33, pPCDETCES);
		cStmt.setObject(34, pPIPLENO);
		cStmt.setObject(35, pPICAPACI);
		cStmt.setObject(36, pNMOVIGEN);
		cStmt.setObject(37, pPIEXTRAP);
		cStmt.setObject(38, pIEXTREA);
		cStmt.setObject(39, pPNREEMB);
		cStmt.setObject(40, pPNFACT);
		cStmt.setObject(41, pPNLINEA);
		cStmt.setObject(42, pPITARIFREA);
		cStmt.setObject(43, pPICOMEXT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(44, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(44));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_SET_ESTCESIONESREA(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPNCESION, java.math.BigDecimal pPICESION, java.math.BigDecimal pPICAPCES,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPNPOLIZA,
			java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPNRIESGO,
			java.math.BigDecimal pPICOMISI, java.math.BigDecimal pPSCUMULO, java.math.BigDecimal pPGARANT,
			java.math.BigDecimal pPSPLENO, java.math.BigDecimal pPNSINIES, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIM, java.sql.Date pPFCONTAB, java.math.BigDecimal pPPCESION,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCGENERA, java.sql.Date pPFGENERA,
			java.sql.Date pPFREGULA, java.sql.Date pPFANULAC, java.math.BigDecimal pPNMOVIMI,
			java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPIPRITARREA, java.math.BigDecimal pPPSOBREPRIMA,
			java.math.BigDecimal pPCDETCES, java.math.BigDecimal pPIPLENO, java.math.BigDecimal pPICAPACI,
			java.math.BigDecimal pNMOVIGEN, java.math.BigDecimal pPIEXTRAP, java.math.BigDecimal pIEXTREA,
			java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPNFACT, java.math.BigDecimal pPNLINEA,
			java.math.BigDecimal pPITARIFREA, java.math.BigDecimal pPICOMEXT) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_SET_ESTCESIONESREA(pPSCESREA, pPNCESION, pPICESION, pPICAPCES,
				pPSSEGURO, pPSSEGPOL, pPNPOLIZA, pPNCERTIF, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPSFACULT, pPNRIESGO,
				pPICOMISI, pPSCUMULO, pPGARANT, pPSPLENO, pPNSINIES, pPFEFECTO, pPFVENCIM, pPFCONTAB, pPPCESION,
				pPSPROCES, pPCGENERA, pPFGENERA, pPFREGULA, pPFANULAC, pPNMOVIMI, pPSIDEPAG, pPIPRITARREA,
				pPPSOBREPRIMA, pPCDETCES, pPIPLENO, pPICAPACI, pNMOVIGEN, pPIEXTRAP, pIEXTREA, pPNREEMB, pPNFACT,
				pPNLINEA, pPITARIFREA, pPICOMEXT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_SET_ESTCESIONESREA

	// --START-PAC_IAX_ESTCESIONESREA.COMPRUEBAPORCENTAJES(PSSEGPOL, PCGARANT)

	private HashMap callPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENTAJES(java.math.BigDecimal pPSSEGPOL,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.COMPRUEBAPORCENTAJES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGPOL", "pPCGARANT" }, new Object[] { pPSSEGPOL, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGPOL);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENTAJES(java.math.BigDecimal pPSSEGPOL,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENTAJES(pPSSEGPOL, pPCGARANT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.COMPRUEBAPORCENTAJES

	// --START-PAC_IAX_ESTCESIONESREA.F_GET_GARANT_EST(PSSEGPOL)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_GARANT_EST(java.math.BigDecimal pPSSEGPOL) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_GARANT_EST(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGPOL" }, new Object[] { pPSSEGPOL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGPOL);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_GARANT_EST(java.math.BigDecimal pPSSEGPOL) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_GARANT_EST(pPSSEGPOL); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_GET_GARANT_EST

	// --START-PAC_IAX_ESTCESIONESREA.F_GET_SIM_ESTCESIONESREA(PSSEGURO)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_SIM_ESTCESIONESREA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_SIM_ESTCESIONESREA(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_SIM_ESTCESIONESREA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_SIM_ESTCESIONESREA(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_SIM_ESTCESIONESREA(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}

	// --START-PAC_IAX_ESTCESIONESREA1.COMPRUEBAPORCENFACULTATIVO(PSCESREA, PCESION)

	private HashMap callPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENFACULTATIVO(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPCESION) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.COMPRUEBAPORCENFACULTATIVO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCESREA", "pPCESION" }, new Object[] { pPSCESREA, pPCESION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCESREA);
		cStmt.setObject(3, pPCESION);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENFACULTATIVO(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPCESION) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENFACULTATIVO(pPSCESREA, pPCESION); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA1.COMPRUEBAPORCENFACULTATIVO

	// --START-PAC_IAX_ESTCESIONESREA.F_CONSULTA_CES_MAN(PNPOLIZA, PNSINIES,
	// PNRECIBO, PFINIEFE, PFFINEFE)
	private HashMap callPAC_IAX_ESTCESIONESREA__F_CONSULTA_CES_MAN(java.math.BigDecimal pPNPOLIZA, String pPNSINIES,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFINIEFE, java.sql.Date pPFFINEFE) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_CONSULTA_CES_MAN(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA", "pPNSINIES", "pPNRECIBO", "pPFINIEFE", "pPFFINEFE" },
				new Object[] { pPNPOLIZA, pPNSINIES, pPNRECIBO, pPFINIEFE, pPFFINEFE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNRECIBO);
		cStmt.setObject(5, pPFINIEFE);
		cStmt.setObject(6, pPFFINEFE);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_CONSULTA_CES_MAN(java.math.BigDecimal pPNPOLIZA, String pPNSINIES,
			java.math.BigDecimal pPNRECIBO, java.sql.Date pPFINIEFE, java.sql.Date pPFFINEFE) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_CONSULTA_CES_MAN(pPNPOLIZA, pPNSINIES, pPNRECIBO, pPFINIEFE,
				pPFFINEFE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_CONSULTA_CES_MAN

	// --START-PAC_IAX_ESTCESIONESREA.F_DEL_ESTCESIONESREA(PSCESREA, PSSEGPOL,
	// PSSEGURO)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_DEL_ESTCESIONESREA(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_DEL_ESTCESIONESREA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCESREA", "pPSSEGPOL", "pPSSEGURO" },
				new Object[] { pPSCESREA, pPSSEGPOL, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCESREA);
		cStmt.setObject(3, pPSSEGPOL);
		cStmt.setObject(4, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_DEL_ESTCESIONESREA(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_DEL_ESTCESIONESREA(pPSCESREA, pPSSEGPOL, pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_DEL_ESTCESIONESREA

	// --START-PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA(PSCESREA, PSSEGPOL,
	// PICESION, PICAPCES, PPCESION)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPICESION, java.math.BigDecimal pPICAPCES,
			java.math.BigDecimal pPPCESION) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCESREA", "pPSSEGPOL", "pPICESION", "pPICAPCES", "pPPCESION" },
				new Object[] { pPSCESREA, pPSSEGPOL, pPICESION, pPICAPCES, pPPCESION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCESREA);
		cStmt.setObject(3, pPSSEGPOL);
		cStmt.setObject(4, pPICESION);
		cStmt.setObject(5, pPICAPCES);
		cStmt.setObject(6, pPPCESION);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPICESION, java.math.BigDecimal pPICAPCES,
			java.math.BigDecimal pPPCESION) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA(pPSCESREA, pPSSEGPOL, pPICESION, pPICAPCES,
				pPPCESION); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA

	// --START-PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA_FECHAS(PSCESREA,
	// PSSEGPOL, PCGARANT, PFEFECTO, PFVENCIMIENTO)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_FECHAS(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPCGARANT, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIMIENTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA_FECHAS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCESREA", "pPSSEGPOL", "pPCGARANT", "pPFEFECTO", "pPFVENCIMIENTO" },
				new Object[] { pPSCESREA, pPSSEGPOL, pPCGARANT, pPFEFECTO, pPFVENCIMIENTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCESREA);
		cStmt.setObject(3, pPSSEGPOL);
		cStmt.setObject(4, pPCGARANT);
		cStmt.setObject(5, pPFEFECTO);
		cStmt.setObject(6, pPFVENCIMIENTO);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_FECHAS(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPSSEGPOL, java.math.BigDecimal pPCGARANT, java.sql.Date pPFEFECTO,
			java.sql.Date pPFVENCIMIENTO) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_FECHAS(pPSCESREA, pPSSEGPOL, pPCGARANT,
				pPFEFECTO, pPFVENCIMIENTO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA_FECHAS
	// --START-PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA_TRAMO(PSCESREA,
	// PCTRAMO)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_TRAMO(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPCTRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA_TRAMO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCESREA", "pPCTRAMO" }, new Object[] { pPSCESREA, pPCTRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCESREA);
		cStmt.setObject(3, pPCTRAMO);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_TRAMO(java.math.BigDecimal pPSCESREA,
			java.math.BigDecimal pPCTRAMO) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_TRAMO(pPSCESREA, pPCTRAMO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_UPDATE_ESTCESIONESREA_TRAMO
	// --START-PAC_IAX_ESTCESIONESREA.F_ESTADO_DE_POLIZA(PSSEGURO, PNPOLIZA)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_ESTADO_DE_POLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNPOLIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_ESTADO_DE_POLIZA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNPOLIZA" }, new Object[] { pPSSEGURO, pPNPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNPOLIZA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PESTADO"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.DATE); // Valor de "PFESTADO"
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
			retVal.put("PESTADO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PESTADO", null);
		}
		try {
			retVal.put("PFESTADO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PFESTADO", null);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_ESTADO_DE_POLIZA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNPOLIZA) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_ESTADO_DE_POLIZA(pPSSEGURO, pPNPOLIZA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_ESTADO_DE_POLIZA
	// --START-PAC_IAX_ESTCESIONESREA.F_GET_REASEGURO_XL(PSSEGURO)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_GET_REASEGURO_XL(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_GET_REASEGURO_XL(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_GET_REASEGURO_XL(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_GET_REASEGURO_XL(pPSSEGURO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_GET_REASEGURO_XL

	// --START-PAC_IAX_ESTCESIONESREA.F_CABFACUL(PSSEGPOL)

	private HashMap callPAC_IAX_ESTCESIONESREA__F_CABFACUL(java.math.BigDecimal pPSSEGPOL) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_CABFACUL(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGPOL" }, new Object[] { pPSSEGPOL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGPOL);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_CABFACUL(java.math.BigDecimal pPSSEGPOL) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_CABFACUL(pPSSEGPOL); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_CABFACUL

	// --START-PAC_IAX_ESTCESIONESREA.F_DETVALORES_TRAMOS(PSSEGURO)
	private HashMap callPAC_IAX_ESTCESIONESREA__F_DETVALORES_TRAMOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_DETVALORES_TRAMOS(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_DETVALORES_TRAMOS(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_DETVALORES_TRAMOS(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_DETVALORES_TRAMOS

	// --START-PAC_IAX_ESTCESIONESREA.F_VALIDA_TRAMOS(PSSEGPOL)
	private HashMap callPAC_IAX_ESTCESIONESREA__F_VALIDA_TRAMOS(java.math.BigDecimal pPSSEGPOL) throws Exception {
		String callQuery = "{?=call PAC_IAX_ESTCESIONESREA.F_VALIDA_TRAMOS(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGPOL" }, new Object[] { pPSSEGPOL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGPOL);
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

	public HashMap ejecutaPAC_IAX_ESTCESIONESREA__F_VALIDA_TRAMOS(java.math.BigDecimal pPSSEGPOL) throws Exception {
		return this.callPAC_IAX_ESTCESIONESREA__F_VALIDA_TRAMOS(pPSSEGPOL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_ESTCESIONESREA.F_VALIDA_TRAMOS

}
