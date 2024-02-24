//Revision:# z+9Sv1FmvPL4JXGiJS25lw== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_IMPRESION extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRODUCCION.class);
	private Connection conn = null;

	public PAC_IAX_IMPRESION(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_IMPRESION.F_GEDOX_VERDOC(PIDDOC)

	private HashMap callPAC_IAX_IMPRESION__F_GEDOX_VERDOC(java.math.BigDecimal pPIDDOC) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GEDOX_VERDOC(?,?,?)}";
		logCall(callQuery, new String[] { "pPIDDOC" }, new Object[] { pPIDDOC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDDOC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "OPTPATH"
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
			retVal.put("OPTPATH", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OPTPATH", null);
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GEDOX_VERDOC(java.math.BigDecimal pPIDDOC) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GEDOX_VERDOC(pPIDDOC);
	}
	// --END-PAC_IAX_IMPRESION.F_GEDOX_VERDOC
	// --START-PAC_IAX_IMPRESION.F_GET_DOCUMPROD(PSSEGURO, PCIDIOMA)

	private HashMap callPAC_IAX_IMPRESION__F_GET_DOCUMPROD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_DOCUMPROD(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPCIDIOMA" }, new Object[] { pPSSEGURO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_DOCUMPROD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_DOCUMPROD(pPSSEGURO, pPCIDIOMA);
	}
	// --END-PAC_IAX_IMPRESION.F_GET_DOCUMPROD

	// --START-PAC_IAX_IMPRESION.F_GET_DOCUMPROD_TIPO(PSSEGURO, PCTIPO, PCIDIOMA)

	private HashMap callPAC_IAX_IMPRESION__F_GET_DOCUMPROD_TIPO(java.math.BigDecimal pPSSEGURO, String pPCTIPO,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_DOCUMPROD_TIPO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPCTIPO", "pPCIDIOMA" },
				new Object[] { pPSSEGURO, pPCTIPO, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPCTIPO);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_DOCUMPROD_TIPO(java.math.BigDecimal pPSSEGURO, String pPCTIPO,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_DOCUMPROD_TIPO(pPSSEGURO, pPCTIPO, pPCIDIOMA);
	}
	// --END-PAC_IAX_IMPRESION.F_GET_DOCUMPROD_TIPO

	// -- INI - TCS_324B - JLTS - 08/02/2019. Se adiciona la opción de idioma
	// p_P_CIDIOMAREP
	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_SPERSON(P_SPERSON, P_TIPO, P_CIDIOMAREP)
	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_SPERSON(java.math.BigDecimal pP_SPERSON, String pP_TIPO,
			java.math.BigDecimal pP_CIDIOMAREP) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_SPERSON(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPERSON", "pP_TIPO", "p_P_CIDIOMAREP" },
				new Object[] { pP_SPERSON, pP_TIPO, pP_CIDIOMAREP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPERSON);
		cStmt.setObject(3, pP_TIPO);
		cStmt.setObject(4, pP_CIDIOMAREP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SPERSON(java.math.BigDecimal pP_SPERSON, String pP_TIPO,
			java.math.BigDecimal p_P_CIDIOMAREP) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_SPERSON(pP_SPERSON, pP_TIPO, p_P_CIDIOMAREP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_SPERSON
	// -- FIN - TCS_324B - JLTS - 08/02/2019.

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_FACTURA(P_NREEMB, P_NFACT, P_NRIESGO)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_FACTURA(java.math.BigDecimal pP_NREEMB,
			java.math.BigDecimal pP_NFACT, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_SSEGURO,
			String pPCTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_FACTURA(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pP_NREEMB", "pP_NFACT", "pP_NRIESGO", "pP_SSEGURO", "pPCTIPO" },
				new Object[] { pP_NREEMB, pP_NFACT, pP_NRIESGO, pP_SSEGURO, pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NREEMB);
		cStmt.setObject(3, pP_NFACT);
		cStmt.setObject(4, pP_NRIESGO);
		cStmt.setObject(5, pP_SSEGURO);
		cStmt.setObject(6, pPCTIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_FACTURA(java.math.BigDecimal pP_NREEMB,
			java.math.BigDecimal pP_NFACT, java.math.BigDecimal pP_NRIESGO, java.math.BigDecimal pP_SSEGURO,
			String pPCTIPO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_FACTURA(pP_NREEMB, pP_NFACT, pP_NRIESGO, pP_SSEGURO, pPCTIPO);
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_FACTURA

	// --START-PAC_IAX_IMPRESION.F_GET_DOCPRODUCTO_TIPO(PSPRODUC, PNRIESGO, PCTIPO,
	// PNOMFITXER)

	private HashMap callPAC_IAX_IMPRESION__F_GET_DOCPRODUCTO_TIPO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNRIESGO, String pPCTIPO, String pPNOMFITXER) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_DOCPRODUCTO_TIPO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPNRIESGO", "pPCTIPO", "pPNOMFITXER" },
				new Object[] { pPSPRODUC, pPNRIESGO, pPCTIPO, pPNOMFITXER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPNOMFITXER);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_DOCPRODUCTO_TIPO(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPNRIESGO, String pPCTIPO, String pPNOMFITXER) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_DOCPRODUCTO_TIPO(pPSPRODUC, pPNRIESGO, pPCTIPO, pPNOMFITXER);
	}
	// --END-PAC_IAX_IMPRESION.F_GET_DOCPRODUCTO_TIPO

	// --START-PAC_IAX_IMPRESION.F_GET_QUESTSALUD(PSSEGURO, PNRIESGO, PNOMFITXER,
	// PMODO)

	private HashMap callPAC_IAX_IMPRESION__F_GET_QUESTSALUD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNOMFITXER, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_QUESTSALUD(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPNOMFITXER", "pPMODO" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPNOMFITXER, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPNOMFITXER);
		cStmt.setObject(5, pPMODO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_QUESTSALUD(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, String pPNOMFITXER, String pPMODO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_QUESTSALUD(pPSSEGURO, pPNRIESGO, pPNOMFITXER, pPMODO);
	}
	// --END-PAC_IAX_IMPRESION.F_GET_QUESTSALUD

	// bug 0022030
	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_CARTA(P_SGESCARTA, P_SDEVOLU)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_CARTA(java.math.BigDecimal pP_SGESCARTA,
			java.math.BigDecimal pP_SDEVOLU) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_CARTA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SGESCARTA", "pP_SDEVOLU" }, new Object[] { pP_SGESCARTA, pP_SDEVOLU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SGESCARTA);
		cStmt.setObject(3, pP_SDEVOLU);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_CARTA(java.math.BigDecimal pP_SGESCARTA,
			java.math.BigDecimal pP_SDEVOLU) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_CARTA(pP_SGESCARTA, pP_SDEVOLU); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_CARTA

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_RECIBOS(P_SPROIMP)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBOS(java.math.BigDecimal pP_SPROIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_RECIBOS(?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROIMP" }, new Object[] { pP_SPROIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROIMP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBOS(java.math.BigDecimal pP_SPROIMP) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBOS(pP_SPROIMP);
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_RECIBOS
	// --START-PAC_IAX_IMPRESION.F_GET_LISTCOMI(PCEMPRES, PCPROCES, PCAGENTE,
	// PNOMFITXER)

	private HashMap callPAC_IAX_IMPRESION__F_GET_LISTCOMI(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCPROCES, java.math.BigDecimal pPCAGENTE, String pPNOMFITXER) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_LISTCOMI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCPROCES", "pPCAGENTE", "pPNOMFITXER" },
				new Object[] { pPCEMPRES, pPCPROCES, pPCAGENTE, pPNOMFITXER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCPROCES);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPNOMFITXER);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_LISTCOMI(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCPROCES, java.math.BigDecimal pPCAGENTE, String pPNOMFITXER) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_LISTCOMI(pPCEMPRES, pPCPROCES, pPCAGENTE, pPNOMFITXER);
	}
	// --END-PAC_IAX_IMPRESION.F_GET_LISTCOMI

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_RECIBO(P_NRECIBO, P_NDOCUME, P_SSEGURO,
	// P_TIPO)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBO(java.math.BigDecimal pP_NRECIBO,
			java.math.BigDecimal pP_NDOCUME, java.math.BigDecimal pP_SSEGURO, String pP_TIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_RECIBO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NRECIBO", "pP_NDOCUME", "pP_SSEGURO", "pP_TIPO" },
				new Object[] { pP_NRECIBO, pP_NDOCUME, pP_SSEGURO, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NRECIBO);
		cStmt.setObject(3, pP_NDOCUME);
		cStmt.setObject(4, pP_SSEGURO);
		cStmt.setObject(5, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBO(java.math.BigDecimal pP_NRECIBO,
			java.math.BigDecimal pP_NDOCUME, java.math.BigDecimal pP_SSEGURO, String pP_TIPO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBO(pP_NRECIBO, pP_NDOCUME, pP_SSEGURO, pP_TIPO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_RECIBO
	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_TRASPAS(P_STRAS, P_SSEGURO, P_TIPO)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_TRASPAS(java.math.BigDecimal pP_STRAS,
			java.math.BigDecimal pP_SSEGURO, String pP_TIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_TRASPAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_STRAS", "pP_SSEGURO", "pP_TIPO" },
				new Object[] { pP_STRAS, pP_SSEGURO, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_STRAS);
		cStmt.setObject(3, pP_SSEGURO);
		cStmt.setObject(4, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_TRASPAS(java.math.BigDecimal pP_STRAS,
			java.math.BigDecimal pP_SSEGURO, String pP_TIPO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_TRASPAS(pP_STRAS, pP_SSEGURO, pP_TIPO);
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_TRASPAS

	// *******************************************ETM INI
	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_PAGO(P_SSEGURO, P_SIDEPAG, P_TIPO,
	// P_CCAUSIN, P_CMOTSIN)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_PAGO(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_SIDEPAG, String pP_TIPO, java.math.BigDecimal pP_CCAUSIN,
			java.math.BigDecimal pP_CMOTSIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_PAGO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO", "pP_SIDEPAG", "pP_TIPO", "pP_CCAUSIN", "pP_CMOTSIN" },
				new Object[] { pP_SSEGURO, pP_SIDEPAG, pP_TIPO, pP_CCAUSIN, pP_CMOTSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.setObject(3, pP_SIDEPAG);
		cStmt.setObject(4, pP_TIPO);
		cStmt.setObject(5, pP_CCAUSIN);
		cStmt.setObject(6, pP_CMOTSIN);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_PAGO(java.math.BigDecimal pP_SSEGURO,
			java.math.BigDecimal pP_SIDEPAG, String pP_TIPO, java.math.BigDecimal pP_CCAUSIN,
			java.math.BigDecimal pP_CMOTSIN) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_PAGO(pP_SSEGURO, pP_SIDEPAG, pP_TIPO, pP_CCAUSIN, pP_CMOTSIN);
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_PAGO
	// ETM FIN
	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_TRAMI(P_NSINIES, P_NTRAMIT, P_CESTADO,
	// P_TIPO)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_TRAMI(String pP_NSINIES, java.math.BigDecimal pP_NTRAMIT,
			java.math.BigDecimal pP_CESTADO, String pP_TIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_TRAMI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_NSINIES", "pP_NTRAMIT", "pP_CESTADO", "pP_TIPO" },
				new Object[] { pP_NSINIES, pP_NTRAMIT, pP_CESTADO, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_NSINIES);
		cStmt.setObject(3, pP_NTRAMIT);
		cStmt.setObject(4, pP_CESTADO);
		cStmt.setObject(5, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_TRAMI(String pP_NSINIES, java.math.BigDecimal pP_NTRAMIT,
			java.math.BigDecimal pP_CESTADO, String pP_TIPO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_TRAMI(pP_NSINIES, pP_NTRAMIT, pP_CESTADO, pP_TIPO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_TRAMI

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_CARTASPREAVISOS(P_SPROCES, P_TIPO)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_CARTASPREAVISOS(java.math.BigDecimal pP_SPROCES, String pP_TIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_CARTASPREAVISOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES", "pP_TIPO" }, new Object[] { pP_SPROCES, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_CARTASPREAVISOS(java.math.BigDecimal pP_SPROCES, String pP_TIPO)
			throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_CARTASPREAVISOS(pP_SPROCES, pP_TIPO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_CARTASPREAVISOS

	// --START-PAC_IAX_IMPRESION.F_FIRMAR_DOC(P_IDDOC, P_FICHERO, P_FIRMAB64,
	// P_CONFFIRMA, P_CCODPLAN)

	private HashMap callPAC_IAX_IMPRESION__F_FIRMAR_DOC(String pP_IDDOC, String pP_FICHERO, String pP_FIRMAB64,
			String pP_CONFFIRMA, String pP_CCODPLAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_FIRMAR_DOC(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_IDDOC", "pP_FICHERO", "pP_FIRMAB64", "pP_CONFFIRMA", "pP_CCODPLAN" },
				new Object[] { pP_IDDOC, pP_FICHERO, pP_FIRMAB64, pP_CONFFIRMA, pP_CCODPLAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_IDDOC);
		cStmt.setObject(3, pP_FICHERO);
		cStmt.setObject(4, pP_FIRMAB64);
		cStmt.setObject(5, pP_CONFFIRMA);
		cStmt.setObject(6, pP_CCODPLAN);
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_FIRMAR_DOC(String pP_IDDOC, String pP_FICHERO, String pP_FIRMAB64,
			String pP_CONFFIRMA, String pP_CCODPLAN) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_FIRMAR_DOC(pP_IDDOC, pP_FICHERO, pP_FIRMAB64, pP_CONFFIRMA, pP_CCODPLAN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_FIRMAR_DOC

	// --START-PAC_IAX_IMPRESION.F_GET_CATEGORIAS()

	private HashMap callPAC_IAX_IMPRESION__F_GET_CATEGORIAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_CATEGORIAS(?)}";

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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS() throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_CATEGORIAS(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_GET_CATEGORIAS
	// --START-PAC_IAX_IMPRESION.F_GET_IMPAGRUP()

	private HashMap callPAC_IAX_IMPRESION__F_GET_IMPAGRUP() throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_IMPAGRUP(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCAT"
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
			retVal.put("PCURCAT", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCURCAT", null);
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_IMPAGRUP() throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_IMPAGRUP(); // AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_IMPRESION.F_GET_IMPAGRUP
	// --START-PAC_IAX_IMPRESION.F_GET_IMPDET(PDEFAULT, PCCATEGORIA, PCTIPO, PTFICH,
	// PFSOLICI, PUSER, PFULT, PUSULT, PCESTADO, PSPROCES, PNPOLIZA, PNCERTIF,
	// PCAGENTE, PSPRODUC)
	private HashMap callPAC_IAX_IMPRESION__F_GET_IMPDET(java.math.BigDecimal pPDEFAULT,
			java.math.BigDecimal pPCCATEGORIA, java.math.BigDecimal pPCTIPO, String pPTFICH, java.sql.Date pPFSOLICI,
			String pPUSER, java.sql.Date pPFULT, String pPUSULT, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCRAMO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_IMPDET(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPDEFAULT", "pPCCATEGORIA", "pPCTIPO", "pPTFICH", "pPFSOLICI", "pPUSER", "pPFULT",
						"pPUSULT", "pPCESTADO", "pPSPROCES", "pPNPOLIZA", "pPNCERTIF", "pPCAGENTE", "pPSPRODUC",
						"pPCRAMO" },
				new Object[] { pPDEFAULT, pPCCATEGORIA, pPCTIPO, pPTFICH, pPFSOLICI, pPUSER, pPFULT, pPUSULT, pPCESTADO,
						pPSPROCES, pPNPOLIZA, pPNCERTIF, pPCAGENTE, pPSPRODUC, pPCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPDEFAULT);
		cStmt.setObject(3, pPCCATEGORIA);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPTFICH);
		cStmt.setObject(6, pPFSOLICI);
		cStmt.setObject(7, pPUSER);
		cStmt.setObject(8, pPFULT);
		cStmt.setObject(9, pPUSULT);
		cStmt.setObject(10, pPCESTADO);
		cStmt.setObject(11, pPSPROCES);
		cStmt.setObject(12, pPNPOLIZA);
		cStmt.setObject(13, pPNCERTIF);
		cStmt.setObject(14, pPCAGENTE);
		cStmt.setObject(15, pPSPRODUC);
		cStmt.setObject(16, pPCRAMO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURDOCS"
		cStmt.registerOutParameter(18, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "PLISTZIPS"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCURDOCS", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("PCURDOCS", null);
		}
		try {
			retVal.put("PLISTZIPS", cStmt.getObject(18));
		} catch (SQLException e) {
			retVal.put("PLISTZIPS", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_IMPDET(java.math.BigDecimal pPDEFAULT,
			java.math.BigDecimal pPCCATEGORIA, java.math.BigDecimal pPCTIPO, String pPTFICH, java.sql.Date pPFSOLICI,
			String pPUSER, java.sql.Date pPFULT, String pPUSULT, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCRAMO)
			throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_IMPDET(pPDEFAULT, pPCCATEGORIA, pPCTIPO, pPTFICH, pPFSOLICI, pPUSER,
				pPFULT, pPUSULT, pPCESTADO, pPSPROCES, pPNPOLIZA, pPNCERTIF, pPCAGENTE, pPSPRODUC, pPCRAMO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_GET_IMPDET

	// --START-PAC_IAX_IMPRESION.F_GET_IMPRESORAS()

	private HashMap callPAC_IAX_IMPRESION__F_GET_IMPRESORAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_GET_IMPRESORAS(?)}";

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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_GET_IMPRESORAS() throws Exception {
		return this.callPAC_IAX_IMPRESION__F_GET_IMPRESORAS(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_GET_IMPRESORAS
	// --START-PAC_IAX_IMPRESION.F_ENVIA_IMPRESORA(PLISTCATEGORIAS, PLISTDOCS,
	// PIDIMPRESORA)

	private HashMap callPAC_IAX_IMPRESION__F_ENVIA_IMPRESORA(String pPLISTCATEGORIAS, String pPLISTDOCS,
			java.math.BigDecimal pPIDIMPRESORA) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_ENVIA_IMPRESORA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPLISTCATEGORIAS", "pPLISTDOCS", "pPIDIMPRESORA" },
				new Object[] { pPLISTCATEGORIAS, pPLISTDOCS, pPIDIMPRESORA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPLISTCATEGORIAS);
		cStmt.setObject(3, pPLISTDOCS);
		cStmt.setObject(4, pPIDIMPRESORA);
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_ENVIA_IMPRESORA(String pPLISTCATEGORIAS, String pPLISTDOCS,
			java.math.BigDecimal pPIDIMPRESORA) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_ENVIA_IMPRESORA(pPLISTCATEGORIAS, pPLISTDOCS, pPIDIMPRESORA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_ENVIA_IMPRESORA
	// --START-PAC_IAX_IMPRESION.F_INS_DOC(PIDDOCGEDOX, PTDESC, PTFICH, PCTIPO,
	// PCDIFERIDO, PCCATEGORIA)

	private HashMap callPAC_IAX_IMPRESION__F_INS_DOC(java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC, String pPTFICH,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCDIFERIDO, java.math.BigDecimal pPCCATEGORIA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_INS_DOC(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPIDDOCGEDOX", "pPTDESC", "pPTFICH", "pPCTIPO", "pPCDIFERIDO", "pPCCATEGORIA" },
				new Object[] { pPIDDOCGEDOX, pPTDESC, pPTFICH, pPCTIPO, pPCDIFERIDO, pPCCATEGORIA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDDOCGEDOX);
		cStmt.setObject(3, pPTDESC);
		cStmt.setObject(4, pPTFICH);
		cStmt.setObject(5, pPCTIPO);
		cStmt.setObject(6, pPCDIFERIDO);
		cStmt.setObject(7, pPCCATEGORIA);
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_INS_DOC(java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC,
			String pPTFICH, java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCDIFERIDO,
			java.math.BigDecimal pPCCATEGORIA) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_INS_DOC(pPIDDOCGEDOX, pPTDESC, pPTFICH, pPCTIPO, pPCDIFERIDO,
				pPCCATEGORIA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_INS_DOC

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_SPROCES(P_SPROCES, P_TIPO)

	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES(java.math.BigDecimal pP_SPROCES, String pP_TIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_SPROCES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES", "pP_TIPO" }, new Object[] { pP_SPROCES, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES(java.math.BigDecimal pP_SPROCES, String pP_TIPO)
			throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES(pP_SPROCES, pP_TIPO); // AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_SPROCES
	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_VIA_CORREO(PMODO, PTEVENTO, PCIDIOMA,
	// PDIRECTORIO, PDOCUMENTOS, PMIMESTYPES, PDESTINATARIOS, PSPRODUC, PSSEGURO)
	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_VIA_CORREO(String pPMODO, String pPTEVENTO,
			java.math.BigDecimal pPCIDIOMA, String pPDIRECTORIO, String pPDOCUMENTOS, String pPMIMESTYPES,
			String pPDESTINATARIOS, String pPSPRODUC, java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_VIA_CORREO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPMODO", "pPTEVENTO", "pPCIDIOMA", "pPDIRECTORIO", "pPDOCUMENTOS", "pPMIMESTYPES",
						"pPDESTINATARIOS", "pPSPRODUC", "pPSSEGURO" },
				new Object[] { pPMODO, pPTEVENTO, pPCIDIOMA, pPDIRECTORIO, pPDOCUMENTOS, pPMIMESTYPES, pPDESTINATARIOS,
						pPSPRODUC, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMODO);
		cStmt.setObject(3, pPTEVENTO);
		cStmt.setObject(4, pPCIDIOMA);
		cStmt.setObject(5, pPDIRECTORIO);
		cStmt.setObject(6, pPDOCUMENTOS);
		cStmt.setObject(7, pPMIMESTYPES);
		cStmt.setObject(8, pPDESTINATARIOS);
		cStmt.setObject(9, pPSPRODUC);
		cStmt.setObject(10, pPSSEGURO);
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_VIA_CORREO(String pPMODO, String pPTEVENTO,
			java.math.BigDecimal pPCIDIOMA, String pPDIRECTORIO, String pPDOCUMENTOS, String pPMIMESTYPES,
			String pPDESTINATARIOS, String pPSPRODUC, java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_VIA_CORREO(pPMODO, pPTEVENTO, pPCIDIOMA, pPDIRECTORIO,
				pPDOCUMENTOS, pPMIMESTYPES, pPDESTINATARIOS, pPSPRODUC, pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_VIA_CORREO

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_RENOVCERO(P_SSEGURO)
	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_RENOVCERO(java.math.BigDecimal pP_SSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_RENOVCERO(?, ?)}";

		logCall(callQuery, new String[] { "pP_SSEGURO" }, new Object[] { pP_SSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_RENOVCERO(java.math.BigDecimal pP_SSEGURO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_RENOVCERO(pP_SSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_RENOVCERO

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_SPROCES_CCOMPANI(P_SPROCES, P_CCOMPANI,
	// P_TIPO)
	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES_CCOMPANI(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_CCOMPANI, String pP_TIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_SPROCES_CCOMPANI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SPROCES", "pP_CCOMPANI", "pP_TIPO" },
				new Object[] { pP_SPROCES, pP_CCOMPANI, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPROCES);
		cStmt.setObject(3, pP_CCOMPANI);
		cStmt.setObject(4, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES_CCOMPANI(java.math.BigDecimal pP_SPROCES,
			java.math.BigDecimal pP_CCOMPANI, String pP_TIPO) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES_CCOMPANI(pP_SPROCES, pP_CCOMPANI, pP_TIPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_SPROCES_CCOMPANI

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_CASHDESK(P_REFDEPOSITO, P_TIPO)
	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_CASHDESK(java.math.BigDecimal pP_REFDEPOSITO, String pP_TIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_CASHDESK(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_REFDEPOSITO", "pP_TIPO" }, new Object[] { pP_REFDEPOSITO, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_REFDEPOSITO);
		cStmt.setObject(3, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_CASHDESK(java.math.BigDecimal pP_REFDEPOSITO, String pP_TIPO)
			throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_CASHDESK(pP_REFDEPOSITO, pP_TIPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_CASHDESK

	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_SINIES_SOLDOC(PCTIPO, PSSEGURO,
	// PNSINIES, PNTRAMIT, PSIDEPAG)
	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_SINIES_SOLDOC(java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPSSEGURO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_SINIES_SOLDOC(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPO", "pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPSIDEPAG" },
				new Object[] { pPCTIPO, pPSSEGURO, pPNSINIES, pPNTRAMIT, pPSIDEPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPO);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNSINIES);
		cStmt.setObject(5, pPNTRAMIT);
		cStmt.setObject(6, pPSIDEPAG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SINIES_SOLDOC(java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPSSEGURO, String pPNSINIES, java.math.BigDecimal pPNTRAMIT,
			java.math.BigDecimal pPSIDEPAG) throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_SINIES_SOLDOC(pPCTIPO, pPSSEGURO, pPNSINIES, pPNTRAMIT,
				pPSIDEPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_SINIES_SOLDOC

	// Ini TCS_19 - ACL - 11/03/2019.
	// --START-PAC_IAX_IMPRESION.F_IMPRIMIR_SCONTGAR(P_SCONTGAR, P_TIPO)
	private HashMap callPAC_IAX_IMPRESION__F_IMPRIMIR_SCONTGAR(java.math.BigDecimal pP_SCONTGAR, String pP_TIPO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_IMPRESION.F_IMPRIMIR_SCONTGAR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_SCONTGAR", "pP_TIPO" }, new Object[] { pP_SCONTGAR, pP_TIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SCONTGAR);
		cStmt.setObject(3, pP_TIPO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SCONTGAR(java.math.BigDecimal pP_SCONTGAR, String pP_TIPO)
			throws Exception {
		return this.callPAC_IAX_IMPRESION__F_IMPRIMIR_SCONTGAR(pP_SCONTGAR, pP_TIPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_IMPRESION.F_IMPRIMIR_SCONTGAR

}
