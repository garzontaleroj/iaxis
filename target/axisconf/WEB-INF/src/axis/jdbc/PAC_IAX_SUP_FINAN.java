package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SUP_FINAN extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_SUP_FINAN.class);
	private Connection conn = null;

	public PAC_IAX_SUP_FINAN(Connection conn) {
		this.conn = conn;
	}

	// M�TODOS DE LA CLASE - FUNCIONES PL

	// --START-PAC_IAX_SUP_FINAN.F_APORTACION_EXTRAORDINARIA(PSSEGURO, PNRIESGO,
	// PFECHA, PIMPORTE, PCTIPBAN, PCBANCAR, PCGARANT, PCTIPAPOR, PSPERAPOR)
	private HashMap callPAC_IAX_SUP_FINAN__F_APORTACION_EXTRAORDINARIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTIPAPOR, java.math.BigDecimal pPSPERAPOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUP_FINAN.F_APORTACION_EXTRAORDINARIA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPIMPORTE", "pPCTIPBAN", "pPCBANCAR", "pPCGARANT",
						"pPCTIPAPOR", "pPSPERAPOR" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPCTIPBAN, pPCBANCAR, pPCGARANT, pPCTIPAPOR,
						pPSPERAPOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPIMPORTE);
		cStmt.setObject(6, pPCTIPBAN);
		cStmt.setObject(7, pPCBANCAR);
		cStmt.setObject(8, pPCGARANT);
		cStmt.setObject(11, pPCTIPAPOR);
		cStmt.setObject(12, pPSPERAPOR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PNMOVIMI"
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
			retVal.put("PNMOVIMI", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PNMOVIMI", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SUP_FINAN__F_APORTACION_EXTRAORDINARIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCTIPBAN, String pPCBANCAR, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCTIPAPOR, java.math.BigDecimal pPSPERAPOR) throws Exception {
		return this.callPAC_IAX_SUP_FINAN__F_APORTACION_EXTRAORDINARIA(pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE,
				pPCTIPBAN, pPCBANCAR, pPCGARANT, pPCTIPAPOR, pPSPERAPOR);
	}
	// --END-PAC_IAX_SUP_FINAN.F_APORTACION_EXTRAORDINARIA

	// --START-PAC_IAX_SUP_FINAN.F_TARIF_APORT_EXTRAORDINARIA(PSSEGURO, PNRIESGO,
	// PFECHA, PIMPORTE, PCGARANT)
	private HashMap callPAC_IAX_SUP_FINAN__F_TARIF_APORT_EXTRAORDINARIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUP_FINAN.F_TARIF_APORT_EXTRAORDINARIA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNRIESGO", "pPFECHA", "pPIMPORTE", "pPCGARANT" },
				new Object[] { pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNRIESGO);
		cStmt.setObject(4, pPFECHA);
		cStmt.setObject(5, pPIMPORTE);
		cStmt.setObject(6, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "CAPITALGARAN"
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
			retVal.put("CAPITALGARAN", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("CAPITALGARAN", null);
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

	public HashMap ejecutaPAC_IAX_SUP_FINAN__F_TARIF_APORT_EXTRAORDINARIA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNRIESGO, java.sql.Date pPFECHA, java.math.BigDecimal pPIMPORTE,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_SUP_FINAN__F_TARIF_APORT_EXTRAORDINARIA(pPSSEGURO, pPNRIESGO, pPFECHA, pPIMPORTE,
				pPCGARANT);
	}
	// --END-PAC_IAX_SUP_FINAN.F_TARIF_APORT_EXTRAORDINARIA

	// --START-PAC_IAX_SUP_FINAN.F_GET_APORTANTES(PSSEGURO)
	private HashMap callPAC_IAX_SUP_FINAN__F_GET_APORTANTES(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUP_FINAN.F_GET_APORTANTES(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_SUP_FINAN__F_GET_APORTANTES(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SUP_FINAN__F_GET_APORTANTES(pPSSEGURO);
	}
	// --END-PAC_IAX_SUP_FINAN.F_GET_APORTANTES

	// --START-PAC_IAX_SUP_FINAN.F_GET_INFOAPORTANTE(PCTIPAPOR, PSSEGURO)
	private HashMap callPAC_IAX_SUP_FINAN__F_GET_INFOAPORTANTE(java.math.BigDecimal pPCTIPAPOR,
			java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_SUP_FINAN.F_GET_INFOAPORTANTE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPAPOR", "pPSSEGURO" }, new Object[] { pPCTIPAPOR, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPAPOR);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPERAPOR"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCAGENTE"
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
			retVal.put("PSPERAPOR", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PSPERAPOR", null);
		}
		try {
			retVal.put("PCAGENTE", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCAGENTE", null);
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

	public HashMap ejecutaPAC_IAX_SUP_FINAN__F_GET_INFOAPORTANTE(java.math.BigDecimal pPCTIPAPOR,
			java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_SUP_FINAN__F_GET_INFOAPORTANTE(pPCTIPAPOR, pPSSEGURO);
	}
	// --END-PAC_IAX_SUP_FINAN.F_GET_INFOAPORTANTE

}
