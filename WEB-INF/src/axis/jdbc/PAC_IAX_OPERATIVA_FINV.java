package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

//WLS-Ready

public class PAC_IAX_OPERATIVA_FINV extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES.class);
	private Connection conn = null;

	public PAC_IAX_OPERATIVA_FINV(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_OPERATIVA_FINV.F_ASIGNARFINV(PFVALOR, PCEMPRES)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_ASIGNARFINV(java.sql.Date pPFVALOR, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_ASIGNARFINV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFVALOR", "pPCEMPRES" }, new Object[] { pPFVALOR, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFVALOR);
		cStmt.setObject(3, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_ASIGNARFINV(java.sql.Date pPFVALOR, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_ASIGNARFINV(pPFVALOR, pPCEMPRES);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_ASIGNARFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_CAMBIO_ESTADO(PCEMPRES, PFVALOR, PAESTADO)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_CAMBIO_ESTADO(java.math.BigDecimal pPCEMPRES, java.sql.Date pPFVALOR,
			String pPAESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_CAMBIO_ESTADO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFVALOR", "pPAESTADO" },
				new Object[] { pPCEMPRES, pPFVALOR, pPAESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFVALOR);
		cStmt.setObject(4, pPAESTADO);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_CAMBIO_ESTADO(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR, String pPAESTADO) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_CAMBIO_ESTADO(pPCEMPRES, pPFVALOR, pPAESTADO);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_CAMBIO_ESTADO
	// --START-PAC_IAX_OPERATIVA_FINV.F_CONTROL_VALORPART(PCEMPRES, PCCODFON,
	// PFVALOR, PIUNIACT)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_CONTROL_VALORPART(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON, java.sql.Date pPFVALOR, java.math.BigDecimal pPIUNIACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_CONTROL_VALORPART(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCODFON", "pPFVALOR", "pPIUNIACT" },
				new Object[] { pPCEMPRES, pPCCODFON, pPFVALOR, pPIUNIACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPFVALOR);
		cStmt.setObject(5, pPIUNIACT);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_CONTROL_VALORPART(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON, java.sql.Date pPFVALOR, java.math.BigDecimal pPIUNIACT) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_CONTROL_VALORPART(pPCEMPRES, pPCCODFON, pPFVALOR, pPIUNIACT);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_CONTROL_VALORPART
	// --START-PAC_IAX_OPERATIVA_FINV.F_ESTADO_A_MODIFICAR(PCEMPRES, PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_ESTADO_A_MODIFICAR(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_ESTADO_A_MODIFICAR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFVALOR" }, new Object[] { pPCEMPRES, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFVALOR);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PAESTADO"
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
			retVal.put("PAESTADO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PAESTADO", null);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_ESTADO_A_MODIFICAR(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_ESTADO_A_MODIFICAR(pPCEMPRES, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_ESTADO_A_MODIFICAR
	// --START-PAC_IAX_OPERATIVA_FINV.F_EXECFILEENTRADASSALIDASFINV(PCEMPRES,
	// PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_EXECFILEENTRADASSALIDASFINV(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_EXECFILEENTRADASSALIDASFINV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFVALOR" }, new Object[] { pPCEMPRES, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFVALOR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PFICHERO_OUT"
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
			retVal.put("PFICHERO_OUT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFICHERO_OUT", null);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_EXECFILEENTRADASSALIDASFINV(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_EXECFILEENTRADASSALIDASFINV(pPCEMPRES, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_EXECFILEENTRADASSALIDASFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_GETENTRADASSALIDASFINV(PCEMPRES, PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GETENTRADASSALIDASFINV(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GETENTRADASSALIDASFINV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFVALOR" }, new Object[] { pPCEMPRES, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFVALOR);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ENTRADASALIDA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GETENTRADASSALIDASFINV(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GETENTRADASSALIDASFINV(pPCEMPRES, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GETENTRADASSALIDASFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_GETENTSAL_AMPLIADO(PCEMPRES, PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GETENTSAL_AMPLIADO(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GETENTSAL_AMPLIADO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFVALOR" }, new Object[] { pPCEMPRES, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFVALOR);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_ENTRADASALIDA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GETENTSAL_AMPLIADO(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GETENTSAL_AMPLIADO(pPCEMPRES, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GETENTSAL_AMPLIADO
	// --START-PAC_IAX_OPERATIVA_FINV.F_GETESTADOFONDOSFINV(PCEMPRES, PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GETESTADOFONDOSFINV(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GETESTADOFONDOSFINV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPFVALOR" }, new Object[] { pPCEMPRES, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPFVALOR);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GETESTADOFONDOSFINV(java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GETESTADOFONDOSFINV(pPCEMPRES, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GETESTADOFONDOSFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_GETFONDOSOPERAFINV(PCEMPRES, PCCODFON,
	// PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GETFONDOSOPERAFINV(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON, java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GETFONDOSOPERAFINV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCODFON", "pPFVALOR" },
				new Object[] { pPCEMPRES, pPCCODFON, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPFVALOR);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GETFONDOSOPERAFINV(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON, java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GETFONDOSOPERAFINV(pPCEMPRES, pPCCODFON, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GETFONDOSOPERAFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_GET_DIRECTORIO()

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GET_DIRECTORIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GET_DIRECTORIO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.VARCHAR); // Valor de "PPATH"
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
			retVal.put("PPATH", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PPATH", null);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_DIRECTORIO() throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GET_DIRECTORIO();
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GET_DIRECTORIO
	// --START-PAC_IAX_OPERATIVA_FINV.F_GET_TABVALCES(PCEMPRES, PCCESTA, PCIDIOMA)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GET_TABVALCES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCESTA, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GET_TABVALCES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCESTA", "pPCIDIOMA" },
				new Object[] { pPCEMPRES, pPCCESTA, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCESTA);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TABVALCES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_TABVALCES(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCESTA, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GET_TABVALCES(pPCEMPRES, pPCCESTA, pPCIDIOMA);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GET_TABVALCES
	// --START-PAC_IAX_OPERATIVA_FINV.F_GRABAROPERACIONFILEFINV(PRUTA, PCEMPRES,
	// PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFILEFINV(String pPRUTA, java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GRABAROPERACIONFILEFINV(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPRUTA", "pPCEMPRES", "pPFVALOR" },
				new Object[] { pPRUTA, pPCEMPRES, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPRUTA);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPFVALOR);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFILEFINV(String pPRUTA,
			java.math.BigDecimal pPCEMPRES, java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFILEFINV(pPRUTA, pPCEMPRES, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GRABAROPERACIONFILEFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_GRABAROPERACIONFINV(PCEMPRES, PCCODFON,
	// PFVALOR, PIIMPCMP, PNUNICMP, PIIMPVNT, PNUNIVNT, PIUNIACT, PIVALACT,
	// PPATRIMONIO)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFINV(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON, java.sql.Date pPFVALOR, java.math.BigDecimal pPIIMPCMP,
			java.math.BigDecimal pPNUNICMP, java.math.BigDecimal pPIIMPVNT, java.math.BigDecimal pPNUNIVNT,
			java.math.BigDecimal pPIUNIACT, java.math.BigDecimal pPIVALACT, java.math.BigDecimal pPPATRIMONIO,
			java.math.BigDecimal pIUNIACTCMP, java.math.BigDecimal pIUNIACTVTASHW, java.math.BigDecimal pIUNIACTCMPSHW)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GRABAROPERACIONFINV(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCODFON", "pPFVALOR", "pPIIMPCMP", "pPNUNICMP", "pPIIMPVNT", "pPNUNIVNT",
						"pPIUNIACT", "pPIVALACT", "pPPATRIMONIO", "pPIUNIACTCMP", "pPIUNIACTVTASHW",
						"pPIUNIACTCMPSHW" },
				new Object[] { pPCEMPRES, pPCCODFON, pPFVALOR, pPIIMPCMP, pPNUNICMP, pPIIMPVNT, pPNUNIVNT, pPIUNIACT,
						pPIVALACT, pPPATRIMONIO, pIUNIACTCMP, pIUNIACTVTASHW, pIUNIACTCMPSHW });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
		cStmt.setObject(4, pPFVALOR);
		cStmt.setObject(5, pPIIMPCMP);
		cStmt.setObject(6, pPNUNICMP);
		cStmt.setObject(7, pPIIMPVNT);
		cStmt.setObject(8, pPNUNIVNT);
		cStmt.setObject(9, pPIUNIACT);
		cStmt.setObject(10, pPIVALACT);
		cStmt.setObject(11, pPPATRIMONIO);
		cStmt.setObject(12, pIUNIACTCMP);
		cStmt.setObject(13, pIUNIACTVTASHW);
		cStmt.setObject(14, pIUNIACTCMPSHW);
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
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFINV(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON, java.sql.Date pPFVALOR, java.math.BigDecimal pPIIMPCMP,
			java.math.BigDecimal pPNUNICMP, java.math.BigDecimal pPIIMPVNT, java.math.BigDecimal pPNUNIVNT,
			java.math.BigDecimal pPIUNIACT, java.math.BigDecimal pPIVALACT, java.math.BigDecimal pPPATRIMONIO,
			java.math.BigDecimal IUNIACTCMP, java.math.BigDecimal IUNIACTVTASHW, java.math.BigDecimal IUNIACTCMPSHW)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFINV(pPCEMPRES, pPCCODFON, pPFVALOR, pPIIMPCMP,
				pPNUNICMP, pPIIMPVNT, pPNUNIVNT, pPIUNIACT, pPIVALACT, pPPATRIMONIO, IUNIACTCMP, IUNIACTVTASHW,
				IUNIACTCMPSHW);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GRABAROPERACIONFINV

	// --END-PAC_IAX_OPERATIVA_FINV.F_GRABAROPERACIONFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_LEEDISTRIBUCIONFINV(PSSEGURO)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_LEEDISTRIBUCIONFINV(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_LEEDISTRIBUCIONFINV(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODULKMODELOSINV".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_LEEDISTRIBUCIONFINV(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_LEEDISTRIBUCIONFINV(pPSSEGURO);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_LEEDISTRIBUCIONFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_SINCCALCULAROPERACIONFINV(PICOMPRA_IN,
	// PNCOMPRA_IN, PIVENTA_IN, PNVENTA_IN, PIUNIACT_IN)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_SINCCALCULAROPERACIONFINV(java.math.BigDecimal pPICOMPRA_IN,
			java.math.BigDecimal pPNCOMPRA_IN, java.math.BigDecimal pPIVENTA_IN, java.math.BigDecimal pPNVENTA_IN,
			java.math.BigDecimal pPIUNIACT_IN) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_SINCCALCULAROPERACIONFINV(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPICOMPRA_IN", "pPNCOMPRA_IN", "pPIVENTA_IN", "pPNVENTA_IN", "pPIUNIACT_IN" },
				new Object[] { pPICOMPRA_IN, pPNCOMPRA_IN, pPIVENTA_IN, pPNVENTA_IN, pPIUNIACT_IN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPICOMPRA_IN);
		cStmt.setObject(3, pPNCOMPRA_IN);
		cStmt.setObject(4, pPIVENTA_IN);
		cStmt.setObject(5, pPNVENTA_IN);
		cStmt.setObject(6, pPIUNIACT_IN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PICOMPRA_OUT"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PNCOMPRA_OUT"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PIVENTA_OUT"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PNVENTA_OUT"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "PIVALACT_OUT"
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
			retVal.put("PICOMPRA_OUT", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PICOMPRA_OUT", null);
		}
		try {
			retVal.put("PNCOMPRA_OUT", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PNCOMPRA_OUT", null);
		}
		try {
			retVal.put("PIVENTA_OUT", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PIVENTA_OUT", null);
		}
		try {
			retVal.put("PNVENTA_OUT", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PNVENTA_OUT", null);
		}
		try {
			retVal.put("PIVALACT_OUT", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PIVALACT_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_SINCCALCULAROPERACIONFINV(java.math.BigDecimal pPICOMPRA_IN,
			java.math.BigDecimal pPNCOMPRA_IN, java.math.BigDecimal pPIVENTA_IN, java.math.BigDecimal pPNVENTA_IN,
			java.math.BigDecimal pPIUNIACT_IN) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_SINCCALCULAROPERACIONFINV(pPICOMPRA_IN, pPNCOMPRA_IN, pPIVENTA_IN,
				pPNVENTA_IN, pPIUNIACT_IN);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_SINCCALCULAROPERACIONFINV
	// --START-PAC_IAX_OPERATIVA_FINV.F_VALORARFINV(PFVALOR, PCEMPRES)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_VALORARFINV(java.sql.Date pPFVALOR, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_VALORARFINV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPFVALOR", "pPCEMPRES" }, new Object[] { pPFVALOR, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPFVALOR);
		cStmt.setObject(3, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_VALORARFINV(java.sql.Date pPFVALOR, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_VALORARFINV(pPFVALOR, pPCEMPRES);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_VALORARFINV

	// --START-PAC_IAX_OPERATIVA_FINV.F_FILECOTIZACIONES(PRUTA, PCEMPRES, PFVALOR)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_FILECOTIZACIONES(String pPRUTA, java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_FILECOTIZACIONES(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPRUTA", "pPCEMPRES", "pPFVALOR" },
				new Object[] { pPRUTA, pPCEMPRES, pPFVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPRUTA);
		cStmt.setObject(3, pPCEMPRES);
		cStmt.setObject(4, pPFVALOR);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_FILECOTIZACIONES(String pPRUTA, java.math.BigDecimal pPCEMPRES,
			java.sql.Date pPFVALOR) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_FILECOTIZACIONES(pPRUTA, pPCEMPRES, pPFVALOR);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_FILECOTIZACIONES
	// --START-PAC_IAX_OPERATIVA_FINV.F_GETCOTIZACIONES(PCMONORI, PCMONDES,
	// MENSAJES)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GETCOTIZACIONES(String pPCMONORI, String pPCMONDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GETCOTIZACIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMONORI", "pPCMONDES" }, new Object[] { pPCMONORI, pPCMONDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMONORI);
		cStmt.setObject(3, pPCMONDES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GETCOTIZACIONES(String pPCMONORI, String pPCMONDES)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GETCOTIZACIONES(pPCMONORI, pPCMONDES);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GETCOTIZACIONES

	// --START-PAC_IAX_OPERATIVA_FINV.F_MONEDAS()

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_MONEDAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_MONEDAS(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS() throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_MONEDAS

	// --START-PAC_IAX_OPERATIVA_FINV.F_GETHISTCOTIZACIONES(PCMONORI, PCMONDES,
	// MENSAJES)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GETHISTCOTIZACIONES(String pPCMONORI, String pPCMONDES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GETHISTCOTIZACIONES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMONORI", "pPCMONDES" }, new Object[] { pPCMONORI, pPCMONDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMONORI);
		cStmt.setObject(3, pPCMONDES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GETHISTCOTIZACIONES(String pPCMONORI, String pPCMONDES)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GETHISTCOTIZACIONES(pPCMONORI, pPCMONDES);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GETHISTCOTIZACIONES

	// --START-PAC_IAX_OPERATIVA_FINV.F_NEWCOTIZACION(PCMONORI, PCMONDES, MENSAJES)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_NEWCOTIZACION(String pPCMONORI, String pPCMONDES) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_NEWCOTIZACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMONORI", "pPCMONDES" }, new Object[] { pPCMONORI, pPCMONDES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMONORI);
		cStmt.setObject(3, pPCMONDES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_NEWCOTIZACION(String pPCMONORI, String pPCMONDES) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_NEWCOTIZACION(pPCMONORI, pPCMONDES);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_NEWCOTIZACION

	// --START-PAC_IAX_OPERATIVA_FINV.F_CREACOTIZACION(PCMONORI, PCMONDES, PFVALOR,
	// PTASA)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_CREACOTIZACION(String pPCMONORI, String pPCMONDES,
			java.sql.Date pPFVALOR, java.math.BigDecimal pPTASA) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_CREACOTIZACION(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMONORI", "pPCMONDES", "pPFVALOR", "pPTASA" },
				new Object[] { pPCMONORI, pPCMONDES, pPFVALOR, pPTASA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMONORI);
		cStmt.setObject(3, pPCMONDES);
		cStmt.setObject(4, pPFVALOR);
		cStmt.setObject(5, pPTASA);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_CREACOTIZACION(String pPCMONORI, String pPCMONDES,
			java.sql.Date pPFVALOR, java.math.BigDecimal pPTASA) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_CREACOTIZACION(pPCMONORI, pPCMONDES, pPFVALOR, pPTASA);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_CREACOTIZACION

	// --START-PAC_IAX_OPERATIVA_FINV.F_GET_FONGASTOS(PCEMPRES, PCCODFON)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GET_FONGASTOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCODFON" }, new Object[] { pPCEMPRES, pPCCODFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS(pPCEMPRES, pPCCODFON);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GET_FONGASTOS

	// --START-PAC_IAX_OPERATIVA_FINV.F_GET_FONGASTOS_HIST(PCCODFON)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS_HIST(java.math.BigDecimal pPCCODFON) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GET_FONGASTOS_HIST(?, ?)}";

		logCall(callQuery, new String[] { "pPCCODFON" }, new Object[] { pPCCODFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODFON);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS_HIST(java.math.BigDecimal pPCCODFON)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS_HIST(pPCCODFON);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GET_FONGASTOS_HIST

	// --START-PAC_IAX_OPERATIVA_FINV.F_SET_REGGASTOS(PCCODFON, PFINICIO, PFFIN,
	// PIIMPMIN, PIIMPMAX, PCDIVISA, PPGASTOS, PIIMPFIJ, PCOLUMN9, PCTIPCOM,
	// PCCONCEP, PCTIPOCALCUL, PCLAVE)

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_SET_REGGASTOS(java.math.BigDecimal pPCCODFON, java.sql.Date pPFINICIO,
			java.sql.Date pPFFIN, java.math.BigDecimal pPIIMPMIN, java.math.BigDecimal pPIIMPMAX,
			java.math.BigDecimal pPCDIVISA, java.math.BigDecimal pPPGASTOS, java.math.BigDecimal pPIIMPFIJ,
			java.math.BigDecimal pPCOLUMN9, java.math.BigDecimal pPCTIPCOM, java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCTIPOCALCUL, java.math.BigDecimal pPCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_SET_REGGASTOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODFON", "pPFINICIO", "pPFFIN", "pPIIMPMIN", "pPIIMPMAX", "pPCDIVISA", "pPPGASTOS",
						"pPIIMPFIJ", "pPCOLUMN9", "pPCTIPCOM", "pPCCONCEP", "pPCTIPOCALCUL", "pPCLAVE" },
				new Object[] { pPCCODFON, pPFINICIO, pPFFIN, pPIIMPMIN, pPIIMPMAX, pPCDIVISA, pPPGASTOS, pPIIMPFIJ,
						pPCOLUMN9, pPCTIPCOM, pPCCONCEP, pPCTIPOCALCUL, pPCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODFON);
		cStmt.setObject(3, pPFINICIO);
		cStmt.setObject(4, pPFFIN);
		cStmt.setObject(5, pPIIMPMIN);
		cStmt.setObject(6, pPIIMPMAX);
		cStmt.setObject(7, pPCDIVISA);
		cStmt.setObject(8, pPPGASTOS);
		cStmt.setObject(9, pPIIMPFIJ);
		cStmt.setObject(10, pPCOLUMN9);
		cStmt.setObject(11, pPCTIPCOM);
		cStmt.setObject(12, pPCCONCEP);
		cStmt.setObject(13, pPCTIPOCALCUL);
		cStmt.setObject(14, pPCLAVE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_SET_REGGASTOS(java.math.BigDecimal pPCCODFON,
			java.sql.Date pPFINICIO, java.sql.Date pPFFIN, java.math.BigDecimal pPIIMPMIN,
			java.math.BigDecimal pPIIMPMAX, java.math.BigDecimal pPCDIVISA, java.math.BigDecimal pPPGASTOS,
			java.math.BigDecimal pPIIMPFIJ, java.math.BigDecimal pPCOLUMN9, java.math.BigDecimal pPCTIPCOM,
			java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCTIPOCALCUL, java.math.BigDecimal pPCLAVE)
			throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_SET_REGGASTOS(pPCCODFON, pPFINICIO, pPFFIN, pPIIMPMIN, pPIIMPMAX,
				pPCDIVISA, pPPGASTOS, pPIIMPFIJ, pPCOLUMN9, pPCTIPCOM, pPCCONCEP, pPCTIPOCALCUL, pPCLAVE);
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_SET_REGGASTOS

	// --START-PAC_IAX_OPERATIVA_FINV.F_OP_PDTES_VALORAR(PCEMPRES, PSSEGURO,
	// PCIDIOMA)
	private HashMap callPAC_IAX_OPERATIVA_FINV__F_OP_PDTES_VALORAR(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_OP_PDTES_VALORAR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSSEGURO", "pPCIDIOMA" },
				new Object[] { pPCEMPRES, pPSSEGURO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PLITERAL"
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
			retVal.put("PLITERAL", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PLITERAL", null);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_OP_PDTES_VALORAR(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_OP_PDTES_VALORAR(pPCEMPRES, pPSSEGURO, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_OPERATIVA_FINV.F_OP_PDTES_VALORAR
	// --START-PAC_IAX_OPERATIVA_FINV.F_GET_DATOS_RESCATE(PSSEGURO, PCTIPCAL)
	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GET_DATOS_RESCATE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPCAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GET_DATOS_RESCATE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCTIPCAL" }, new Object[] { pPSSEGURO, pPCTIPCAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCTIPCAL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DATOS_FND".toUpperCase())); // Valor de "PFONDOS"
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
			retVal.put("PFONDOS", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PFONDOS", null);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_DATOS_RESCATE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCTIPCAL) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GET_DATOS_RESCATE(pPSSEGURO, pPCTIPCAL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_GET_DATOS_RESCATE

	// --START-PAC_IAX_OPERATIVA_FINV.F_SWITCH_IMPORTE(PSSEGURO, PFECHA, PLSTFONDOS)
	private HashMap callPAC_IAX_OPERATIVA_FINV__F_SWITCH_IMPORTE(java.math.BigDecimal pPSSEGURO, java.sql.Date pPFECHA,
			Object pPLSTFONDOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_SWITCH_IMPORTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPFECHA", "pPLSTFONDOS" },
				new Object[] { pPSSEGURO, pPFECHA, pPLSTFONDOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPFECHA);
		cStmt.setObject(4, pPLSTFONDOS);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_SWITCH_IMPORTE(java.math.BigDecimal pPSSEGURO,
			java.sql.Date pPFECHA, Object pPLSTFONDOS) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_SWITCH_IMPORTE(pPSSEGURO, pPFECHA, pPLSTFONDOS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_OPERATIVA_FINV.F_SWITCH_IMPORTE

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GETCTIPFONFINV(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GETCTIPFONFINV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCCODFON" }, new Object[] { pPCEMPRES, pPCCODFON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCODFON);
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

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GETCTIPFONFINV(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCODFON) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GETCTIPFONFINV(pPCEMPRES, pPCCODFON);
	}

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_GET_LSTFONDOSSEG(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_GET_LSTFONDOSSEG(?, ?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPRODUC", "pPFECHA" },
				new Object[] { pPCEMPRES, pPSSEGURO, pPFECHA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPFECHA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC);
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PLISTFONDOS", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PLISTFONDOS", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_LSTFONDOSSEG(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSSEGURO, java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_GET_LSTFONDOSSEG(pPCEMPRES, pPSSEGURO, pPFECHA);
	}

	private HashMap callPAC_IAX_OPERATIVA_FINV__F_SWITCH_FONDOS(java.math.BigDecimal pCORIGEN,
			java.math.BigDecimal pCDESTINO, java.math.BigDecimal pPSSEGURO, java.sql.Date pPFECHA) throws Exception {
		String callQuery = "{?=call PAC_IAX_OPERATIVA_FINV.F_SWITCH_FONDOS(?, ?, ?, ?, ?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCORIGEN);
		cStmt.setObject(3, pCDESTINO);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPFECHA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_OPERATIVA_FINV__F_SWITCH_FONDOS(java.math.BigDecimal pCORIGEN,
			java.math.BigDecimal pCDESTINO, java.math.BigDecimal pPSSEGURO, java.sql.Date pPFECHA) throws Exception {
		return this.callPAC_IAX_OPERATIVA_FINV__F_SWITCH_FONDOS(pCORIGEN, pCDESTINO, pPSSEGURO, pPFECHA);
	}
}
