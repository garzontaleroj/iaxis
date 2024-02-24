package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_COMMON extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COMMON.class);
	private Connection conn = null;

	public PAC_IAX_COMMON(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COMMON.F_FORMATCCC(CTIPBAN, CBANCAR)

	private HashMap callPAC_IAX_COMMON__F_FORMATCCC(java.math.BigDecimal pCTIPBAN, String pCBANCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_FORMATCCC(?,?)}";
		logCall(callQuery, new String[] { "pCTIPBAN", "pCBANCAR" }, new Object[] { pCTIPBAN, pCBANCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCTIPBAN);
		cStmt.setObject(3, pCBANCAR);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_FORMATCCC(java.math.BigDecimal pCTIPBAN, String pCBANCAR) throws Exception {
		return this.callPAC_IAX_COMMON__F_FORMATCCC(pCTIPBAN, pCBANCAR);
	}
	// --END-PAC_IAX_COMMON.F_FORMATCCC
	// --START-PAC_IAX_COMMON.F_GET_CONTEXTPARAM(CLAVE, MENSAJES)

	private HashMap callPAC_IAX_COMMON__F_GET_CONTEXTPARAM(String pCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_CONTEXTPARAM(?,?)}";
		logCall(callQuery, new String[] { "pCLAVE" }, new Object[] { pCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_CONTEXTPARAM(String pCLAVE) throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_CONTEXTPARAM(pCLAVE);
	}
	// --END-PAC_IAX_COMMON.F_GET_CONTEXTPARAM
	// --START-PAC_IAX_COMMON.F_GET_CXTAGENTE()

	private HashMap callPAC_IAX_COMMON__F_GET_CXTAGENTE() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_CXTAGENTE()}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE() throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_CXTAGENTE();
	}
	// --END-PAC_IAX_COMMON.F_GET_CXTAGENTE
	// --START-PAC_IAX_COMMON.F_GET_CXTEMPRESA()

	private HashMap callPAC_IAX_COMMON__F_GET_CXTEMPRESA() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_CXTEMPRESA()}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_CXTEMPRESA() throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_CXTEMPRESA();
	}
	// --END-PAC_IAX_COMMON.F_GET_CXTEMPRESA
	// --START-PAC_IAX_COMMON.F_GET_CXTIDIOMA()

	private HashMap callPAC_IAX_COMMON__F_GET_CXTIDIOMA() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_CXTIDIOMA()}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_CXTIDIOMA() throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_CXTIDIOMA();
	}
	// --END-PAC_IAX_COMMON.F_GET_CXTIDIOMA
	// --START-PAC_IAX_COMMON.F_GET_CXTUSUARIO()

	private HashMap callPAC_IAX_COMMON__F_GET_CXTUSUARIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_CXTUSUARIO()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_CXTUSUARIO() throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_CXTUSUARIO();
	}
	// --END-PAC_IAX_COMMON.F_GET_CXTUSUARIO
	// --START-PAC_IAX_COMMON.F_GET_NPOLIZA(PSSEGURO, PMODE, )

	private HashMap callPAC_IAX_COMMON__F_GET_NPOLIZA(java.math.BigDecimal pPSSEGURO, String pPMODE) throws Exception {
		String callQuery = "{call PAC_IAX_COMMON.F_GET_NPOLIZA(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPMODE", }, new Object[] { pPSSEGURO, pPMODE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSSEGURO);
		cStmt.setObject(2, pPMODE);
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "ONPOLIZA"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "ONCERTIF"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
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
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_NPOLIZA(java.math.BigDecimal pPSSEGURO, String pPMODE)
			throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_NPOLIZA(pPSSEGURO, pPMODE);
	}
	// --END-PAC_IAX_COMMON.F_GET_NPOLIZA
	// --START-PAC_IAX_COMMON.F_GET_POLRAMO(PNPOLIZA, MENSAJES)

	private HashMap callPAC_IAX_COMMON__F_GET_POLRAMO(java.math.BigDecimal pPNPOLIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_POLRAMO(?,?)}";
		logCall(callQuery, new String[] { "pPNPOLIZA" }, new Object[] { pPNPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
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

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_POLRAMO(java.math.BigDecimal pPNPOLIZA) throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_POLRAMO(pPNPOLIZA);
	}
	// --END-PAC_IAX_COMMON.F_GET_POLRAMO
	// --START-PAC_IAX_COMMON.F_PERMITECAGENTE()

	private HashMap callPAC_IAX_COMMON__F_PERMITECAGENTE() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_PERMITECAGENTE()}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_PERMITECAGENTE() throws Exception {
		return this.callPAC_IAX_COMMON__F_PERMITECAGENTE();
	}
	// --END-PAC_IAX_COMMON.F_PERMITECAGENTE
	// --START-PAC_IAX_COMMON.F_PERMITIRNUEVAPERSONA()

	private HashMap callPAC_IAX_COMMON__F_PERMITIRNUEVAPERSONA() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_PERMITIRNUEVAPERSONA()}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_PERMITIRNUEVAPERSONA() throws Exception {
		return this.callPAC_IAX_COMMON__F_PERMITIRNUEVAPERSONA();
	}
	// --END-PAC_IAX_COMMON.F_PERMITIRNUEVAPERSONA
	// --START-PAC_IAX_COMMON.F_PERMITIRSIP()

	private HashMap callPAC_IAX_COMMON__F_PERMITIRSIP() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_PERMITIRSIP()}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_PERMITIRSIP() throws Exception {
		return this.callPAC_IAX_COMMON__F_PERMITIRSIP();
	}
	// --END-PAC_IAX_COMMON.F_PERMITIRSIP

	// --START-PAC_IAX_COMMON.F_GET_ENTORNO()

	private HashMap callPAC_IAX_COMMON__F_GET_ENTORNO() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_ENTORNO(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_ENTORNO() throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_ENTORNO();
	}
	// --END-PAC_IAX_COMMON.F_GET_ENTORNO

	// --START-PAC_IAX_COMMON.F_EXTRAE_NPOLIZA(PNCONTINTER)

	private HashMap callPAC_IAX_COMMON__F_EXTRAE_NPOLIZA(String pPNCONTINTER) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_EXTRAE_NPOLIZA(?)}";

		logCall(callQuery, new String[] { "pPNCONTINTER" }, new Object[] { pPNCONTINTER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNCONTINTER);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_EXTRAE_NPOLIZA(String pPNCONTINTER) throws Exception {
		return this.callPAC_IAX_COMMON__F_EXTRAE_NPOLIZA(pPNCONTINTER);
	}
	// --END-PAC_IAX_COMMON.F_EXTRAE_NPOLIZA

	// --START-PAC_IAX_COMMON.F_GET_CXTAGENTEPROD()

	private HashMap callPAC_IAX_COMMON__F_GET_CXTAGENTEPROD() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_GET_CXTAGENTEPROD()}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTEPROD() throws Exception {
		return this.callPAC_IAX_COMMON__F_GET_CXTAGENTEPROD(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMMON.F_GET_CXTAGENTEPROD
	// --START-PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA()

	private HashMap callPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA(?)}";

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

	public HashMap ejecutaPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA() throws Exception {
		return this.callPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA
	// --START-PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA1(PMONEDA)

	private HashMap callPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA1(String pPMONEDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA1(?, ?)}";

		logCall(callQuery, new String[] { "pPMONEDA" }, new Object[] { pPMONEDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMONEDA);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA1(String pPMONEDA) throws Exception {
		return this.callPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA1(pPMONEDA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA1
	// --START-PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA2(PMONEDA)

	private HashMap callPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA2(java.math.BigDecimal pPMONEDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA2(?, ?)}";

		logCall(callQuery, new String[] { "pPMONEDA" }, new Object[] { pPMONEDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMONEDA);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA2(java.math.BigDecimal pPMONEDA) throws Exception {
		return this.callPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA2(pPMONEDA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMMON.F_OBTENER_FORMATOS_MONEDA2

}
