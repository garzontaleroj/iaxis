package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FACTURAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_FACTURAS.class);
	private Connection conn = null;

	public PAC_IAX_FACTURAS(Connection conn) {
		this.conn = conn;
	}
	// --START-PAC_IAX_FACTURAS.F_ANULAR_FACTURA(PCEMPRES, PNFACT, PCAGENTE)

	private HashMap callPAC_IAX_FACTURAS__F_ANULAR_FACTURA(java.math.BigDecimal pPCEMPRES, String pPNFACT,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_ANULAR_FACTURA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPNFACT", "pPCAGENTE" },
				new Object[] { pPCEMPRES, pPNFACT, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNFACT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FACTURAS__F_ANULAR_FACTURA(java.math.BigDecimal pPCEMPRES, String pPNFACT,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_ANULAR_FACTURA(pPCEMPRES, pPNFACT, pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_ANULAR_FACTURA
	// --START-PAC_IAX_FACTURAS.F_DEL_OBJ_DETFACTURA(PNFACT, PNORDEN)

	private HashMap callPAC_IAX_FACTURAS__F_DEL_OBJ_DETFACTURA(String pPNFACT, java.math.BigDecimal pPNORDEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_DEL_OBJ_DETFACTURA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNFACT", "pPNORDEN" }, new Object[] { pPNFACT, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNFACT);
		cStmt.setObject(3, pPNORDEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PIIMPNETO_TOTAL"
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
			retVal.put("PIIMPNETO_TOTAL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PIIMPNETO_TOTAL", null);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_DEL_OBJ_DETFACTURA(String pPNFACT, java.math.BigDecimal pPNORDEN)
			throws Exception {
		return this.callPAC_IAX_FACTURAS__F_DEL_OBJ_DETFACTURA(pPNFACT, pPNORDEN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_DEL_OBJ_DETFACTURA
	// --START-PAC_IAX_FACTURAS.F_EMITIR_FACTURA(PCEMPRES, PNFACT, PCAGENTE)

	private HashMap callPAC_IAX_FACTURAS__F_EMITIR_FACTURA(java.math.BigDecimal pPCEMPRES, String pPNFACT,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_EMITIR_FACTURA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPNFACT", "pPCAGENTE" },
				new Object[] { pPCEMPRES, pPNFACT, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNFACT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FACTURAS__F_EMITIR_FACTURA(java.math.BigDecimal pPCEMPRES, String pPNFACT,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_EMITIR_FACTURA(pPCEMPRES, pPNFACT, pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_EMITIR_FACTURA
	// --START-PAC_IAX_FACTURAS.F_GET_FACTURA(PNFACT)

	private HashMap callPAC_IAX_FACTURAS__F_GET_FACTURA(String pPNFACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_GET_FACTURA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNFACT" }, new Object[] { pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNFACT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_FACTURAS".toUpperCase())); // Valor de "POFACTURAS"
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
			retVal.put("POFACTURAS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("POFACTURAS", null);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_GET_FACTURA(String pPNFACT) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_GET_FACTURA(pPNFACT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_GET_FACTURA
	// --START-PAC_IAX_FACTURAS.F_GET_FACTURAS(PCEMPRES, PCAGENTE, PNNUMIDE, PNFACT,
	// PFFACT_INI, PFFACT_FIN, PCESTADO, PCTIPFACT)

	private HashMap callPAC_IAX_FACTURAS__F_GET_FACTURAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			String pPNNUMIDE, String pPNFACT, java.sql.Date pPFFACT_INI, java.sql.Date pPFFACT_FIN,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPFACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_GET_FACTURAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCAGENTE", "pPNNUMIDE", "pPNFACT", "pPFFACT_INI", "pPFFACT_FIN",
						"pPCESTADO", "pPCTIPFACT" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPNNUMIDE, pPNFACT, pPFFACT_INI, pPFFACT_FIN, pPCESTADO,
						pPCTIPFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPNNUMIDE);
		cStmt.setObject(5, pPNFACT);
		cStmt.setObject(6, pPFFACT_INI);
		cStmt.setObject(7, pPFFACT_FIN);
		cStmt.setObject(8, pPCESTADO);
		cStmt.setObject(9, pPCTIPFACT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_FACTURAS".toUpperCase())); // Valor de "PTFACTURAS"
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
			retVal.put("PTFACTURAS", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PTFACTURAS", null);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_GET_FACTURAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, String pPNNUMIDE, String pPNFACT, java.sql.Date pPFFACT_INI,
			java.sql.Date pPFFACT_FIN, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPFACT)
			throws Exception {
		return this.callPAC_IAX_FACTURAS__F_GET_FACTURAS(pPCEMPRES, pPCAGENTE, pPNNUMIDE, pPNFACT, pPFFACT_INI,
				pPFFACT_FIN, pPCESTADO, pPCTIPFACT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_GET_FACTURAS
	// --START-PAC_IAX_FACTURAS.F_INICIALIZAFACTURA(PNFACT, PCAGENTE)

	private HashMap callPAC_IAX_FACTURAS__F_INICIALIZAFACTURA(String pPNFACT, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_INICIALIZAFACTURA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNFACT", "pPCAGENTE" }, new Object[] { pPNFACT, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNFACT);
		cStmt.setObject(3, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_INICIALIZAFACTURA(String pPNFACT, java.math.BigDecimal pPCAGENTE)
			throws Exception {
		return this.callPAC_IAX_FACTURAS__F_INICIALIZAFACTURA(pPNFACT, pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_INICIALIZAFACTURA
	// --START-PAC_IAX_FACTURAS.F_INSERT_OBJ_DETFACTURA(PNFACT)

	private HashMap callPAC_IAX_FACTURAS__F_INSERT_OBJ_DETFACTURA(String pPNFACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_INSERT_OBJ_DETFACTURA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNFACT" }, new Object[] { pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNFACT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNORDEN"
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
			retVal.put("PNORDEN", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNORDEN", null);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_INSERT_OBJ_DETFACTURA(String pPNFACT) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_INSERT_OBJ_DETFACTURA(pPNFACT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_INSERT_OBJ_DETFACTURA
	// --START-PAC_IAX_FACTURAS.F_SET_DETFACTURA(PNFACT)

	private HashMap callPAC_IAX_FACTURAS__F_SET_DETFACTURA(String pPNFACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_SET_DETFACTURA(?, ?)}";

		logCall(callQuery, new String[] { "pPNFACT" }, new Object[] { pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNFACT);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_SET_DETFACTURA(String pPNFACT) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_SET_DETFACTURA(pPNFACT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_SET_DETFACTURA
	// --START-PAC_IAX_FACTURAS.F_SET_FACTURA(PCEMPRES, PCAGENTE, PFFACT, PCESTADO,
	// PCTIPFACT, PCTIPIVA, PNFACT)

	private HashMap callPAC_IAX_FACTURAS__F_SET_FACTURA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFFACT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPFACT,
			java.math.BigDecimal pPCTIPIVA, String pPNFACT) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_SET_FACTURA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCAGENTE", "pPFFACT", "pPCESTADO", "pPCTIPFACT", "pPCTIPIVA", "pPNFACT" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPFFACT, pPCESTADO, pPCTIPFACT, pPCTIPIVA, pPNFACT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPFFACT);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPCTIPFACT);
		cStmt.setObject(7, pPCTIPIVA);
		cStmt.setObject(8, pPNFACT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "ONFACT"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("ONFACT", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("ONFACT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FACTURAS__F_SET_FACTURA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFFACT, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCTIPFACT, java.math.BigDecimal pPCTIPIVA, String pPNFACT) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_SET_FACTURA(pPCEMPRES, pPCAGENTE, pPFFACT, pPCESTADO, pPCTIPFACT, pPCTIPIVA,
				pPNFACT); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_SET_FACTURA
	// --START-PAC_IAX_FACTURAS.F_SET_OBJ_DETFACTURA(PNFACT, PNORDEN, PCCONCEPTO,
	// PIIMPORTE)

	private HashMap callPAC_IAX_FACTURAS__F_SET_OBJ_DETFACTURA(String pPNFACT, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPCCONCEPTO, java.math.BigDecimal pPIIMPORTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_SET_OBJ_DETFACTURA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNFACT", "pPNORDEN", "pPCCONCEPTO", "pPIIMPORTE" },
				new Object[] { pPNFACT, pPNORDEN, pPCCONCEPTO, pPIIMPORTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNFACT);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPCCONCEPTO);
		cStmt.setObject(5, pPIIMPORTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PIIRPF"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PIIMPCTA"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PIIMPNETO"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PIIMPNETO_TOTAL"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PIIRPF", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PIIRPF", null);
		}
		try {
			retVal.put("PIIMPCTA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PIIMPCTA", null);
		}
		try {
			retVal.put("PIIMPNETO", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PIIMPNETO", null);
		}
		try {
			retVal.put("PIIMPNETO_TOTAL", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PIIMPNETO_TOTAL", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FACTURAS__F_SET_OBJ_DETFACTURA(String pPNFACT, java.math.BigDecimal pPNORDEN,
			java.math.BigDecimal pPCCONCEPTO, java.math.BigDecimal pPIIMPORTE) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_SET_OBJ_DETFACTURA(pPNFACT, pPNORDEN, pPCCONCEPTO, pPIIMPORTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_SET_OBJ_DETFACTURA

	// --START-PAC_IAX_FACTURAS.F_GET_LISTNLIQMEN(PCAGENTE)

	private HashMap callPAC_IAX_FACTURAS__F_GET_LISTNLIQMEN(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_GET_LISTNLIQMEN(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_GET_LISTNLIQMEN(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_GET_LISTNLIQMEN(pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_GET_LISTNLIQMEN

	// --START-PAC_IAX_FACTURAS.F_SET_FACTURA(PCEMPRES, PCAGENTE, PFFACT, PCESTADO,
	// PCTIPFACT, PCTIPIVA, PNFACT, PCTIPDOC, PIDDOCGEDOX, PNLIQMEN)

	private HashMap callPAC_IAX_FACTURAS__F_SET_FACTURA(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			java.sql.Date pPFFACT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPFACT,
			java.math.BigDecimal pPCTIPIVA, String pPNFACT, java.math.BigDecimal pPCTIPDOC,
			java.math.BigDecimal pPIDDOCGEDOX, java.math.BigDecimal pPNLIQMEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_SET_FACTURA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCAGENTE", "pPFFACT", "pPCESTADO", "pPCTIPFACT", "pPCTIPIVA", "pPNFACT",
						"pPCTIPDOC", "pPIDDOCGEDOX", "pPNLIQMEN" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPFFACT, pPCESTADO, pPCTIPFACT, pPCTIPIVA, pPNFACT, pPCTIPDOC,
						pPIDDOCGEDOX, pPNLIQMEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPFFACT);
		cStmt.setObject(5, pPCESTADO);
		cStmt.setObject(6, pPCTIPFACT);
		cStmt.setObject(7, pPCTIPIVA);
		cStmt.setObject(8, pPNFACT);
		cStmt.setObject(11, pPCTIPDOC);
		cStmt.setObject(12, pPIDDOCGEDOX);
		cStmt.setObject(13, pPNLIQMEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "ONFACT"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("ONFACT", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("ONFACT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_FACTURAS__F_SET_FACTURA(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, java.sql.Date pPFFACT, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCTIPFACT, java.math.BigDecimal pPCTIPIVA, String pPNFACT,
			java.math.BigDecimal pPCTIPDOC, java.math.BigDecimal pPIDDOCGEDOX, java.math.BigDecimal pPNLIQMEN)
			throws Exception {
		return this.callPAC_IAX_FACTURAS__F_SET_FACTURA(pPCEMPRES, pPCAGENTE, pPFFACT, pPCESTADO, pPCTIPFACT, pPCTIPIVA,
				pPNFACT, pPCTIPDOC, pPIDDOCGEDOX, pPNLIQMEN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_SET_FACTURA

	// --START-PAC_IAX_FACTURAS.F_SEL_CARPETA(PCCARPETA)

	private HashMap callPAC_IAX_FACTURAS__F_SEL_CARPETA(String pPCCARPETA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_SEL_CARPETA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCARPETA" }, new Object[] { pPCCARPETA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCARPETA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_FACTURACARPETA".toUpperCase())); // Valor de "POBFACTURACARPETA"
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
			retVal.put("POBFACTURACARPETA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("POBFACTURACARPETA", null);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_SEL_CARPETA(String pPCCARPETA) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_SEL_CARPETA(pPCCARPETA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_SEL_CARPETA
	// --START-PAC_IAX_FACTURAS.F_ASIGNA_CARPETA(POBFACTURACARPETA)

	private HashMap callPAC_IAX_FACTURAS__F_ASIGNA_CARPETA(Object pPOBFACTURACARPETA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_ASIGNA_CARPETA(?, ?)}";

		logCall(callQuery, new String[] { "pPOBFACTURACARPETA" }, new Object[] { pPOBFACTURACARPETA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPOBFACTURACARPETA);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_ASIGNA_CARPETA(Object pPOBFACTURACARPETA) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_ASIGNA_CARPETA(pPOBFACTURACARPETA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_ASIGNA_CARPETA
	// --START-PAC_IAX_FACTURAS.F_GENERA_CARPETA(PCCARPETA)

	private HashMap callPAC_IAX_FACTURAS__F_GENERA_CARPETA(String pPCCARPETA) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_GENERA_CARPETA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCARPETA" }, new Object[] { pPCCARPETA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCARPETA);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_GENERA_CARPETA(String pPCCARPETA) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_GENERA_CARPETA(pPCCARPETA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_GENERA_CARPETA
	// --START-PAC_IAX_FACTURAS.F_GET_FACTURAS(PCEMPRES, PCAGENTE, PNNUMIDE, PNFACT,
	// PFFACT_INI, PFFACT_FIN, PCESTADO, PCTIPFACT, PCAUTORIZADA)

	private HashMap callPAC_IAX_FACTURAS__F_GET_FACTURAS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCAGENTE,
			String pPNNUMIDE, String pPNFACT, java.sql.Date pPFFACT_INI, java.sql.Date pPFFACT_FIN,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPFACT, java.math.BigDecimal pPCAUTORIZADA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_GET_FACTURAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCAGENTE", "pPNNUMIDE", "pPNFACT", "pPFFACT_INI", "pPFFACT_FIN",
						"pPCESTADO", "pPCTIPFACT", "pPCAUTORIZADA" },
				new Object[] { pPCEMPRES, pPCAGENTE, pPNNUMIDE, pPNFACT, pPFFACT_INI, pPFFACT_FIN, pPCESTADO,
						pPCTIPFACT, pPCAUTORIZADA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPNNUMIDE);
		cStmt.setObject(5, pPNFACT);
		cStmt.setObject(6, pPFFACT_INI);
		cStmt.setObject(7, pPFFACT_FIN);
		cStmt.setObject(8, pPCESTADO);
		cStmt.setObject(9, pPCTIPFACT);
		cStmt.setObject(10, pPCAUTORIZADA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_FACTURAS".toUpperCase())); // Valor de "PTFACTURAS"
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
			retVal.put("PTFACTURAS", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PTFACTURAS", null);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_GET_FACTURAS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGENTE, String pPNNUMIDE, String pPNFACT, java.sql.Date pPFFACT_INI,
			java.sql.Date pPFFACT_FIN, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCTIPFACT,
			java.math.BigDecimal pPCAUTORIZADA) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_GET_FACTURAS(pPCEMPRES, pPCAGENTE, pPNNUMIDE, pPNFACT, pPFFACT_INI,
				pPFFACT_FIN, pPCESTADO, pPCTIPFACT, pPCAUTORIZADA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_GET_FACTURAS

	// --START-PAC_IAX_FACTURAS.F_AUTORIZA_FACTURA(PCEMPRES, PNFACT, PCAGENTE)
	private HashMap callPAC_IAX_FACTURAS__F_AUTORIZA_FACTURA(java.math.BigDecimal pPCEMPRES, String pPNFACT,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FACTURAS.F_AUTORIZA_FACTURA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPNFACT", "pPCAGENTE" },
				new Object[] { pPCEMPRES, pPNFACT, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPNFACT);
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

	public HashMap ejecutaPAC_IAX_FACTURAS__F_AUTORIZA_FACTURA(java.math.BigDecimal pPCEMPRES, String pPNFACT,
			java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_FACTURAS__F_AUTORIZA_FACTURA(pPCEMPRES, pPNFACT, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FACTURAS.F_AUTORIZA_FACTURA

}
