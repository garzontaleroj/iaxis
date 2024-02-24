package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PROYPROVIS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES.class);
	private Connection conn = null;

	public PAC_IAX_PROYPROVIS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PROYPROVIS.F_CALCULO_PROYPROVIS(PSPROCES, PPERIODICIDAD,
	// PNMES, PNAYO, PSPRODUC, PNPOLIZA, PNCERTIF, PMODO)
	private HashMap callPAC_IAX_PROYPROVIS__F_CALCULO_PROYPROVIS(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPPERIODICIDAD, java.math.BigDecimal pPNMES, java.math.BigDecimal pPNAYO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROYPROVIS.F_CALCULO_PROYPROVIS(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPPERIODICIDAD", "pPNMES", "pPNAYO", "pPSPRODUC", "pPNPOLIZA", "pPNCERTIF",
						"pPMODO" },
				new Object[] { pPSPROCES, pPPERIODICIDAD, pPNMES, pPNAYO, pPSPRODUC, pPNPOLIZA, pPNCERTIF, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPPERIODICIDAD);
		cStmt.setObject(4, pPNMES);
		cStmt.setObject(5, pPNAYO);
		cStmt.setObject(6, pPSPRODUC);
		cStmt.setObject(7, pPNPOLIZA);
		cStmt.setObject(8, pPNCERTIF);
		cStmt.setObject(9, pPMODO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_PROYPROVIS__F_CALCULO_PROYPROVIS(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPPERIODICIDAD, java.math.BigDecimal pPNMES, java.math.BigDecimal pPNAYO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF,
			String pPMODO) throws Exception {
		return this.callPAC_IAX_PROYPROVIS__F_CALCULO_PROYPROVIS(pPSPROCES, pPPERIODICIDAD, pPNMES, pPNAYO, pPSPRODUC,
				pPNPOLIZA, pPNCERTIF, pPMODO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROYPROVIS.F_CALCULO_PROYPROVIS

	// --START-PAC_IAX_PROYPROVIS.F_INICIALIZA_PROCESO(PMES, PANYO, PCEMPRES,
	// PFINICIO)
	private HashMap callPAC_IAX_PROYPROVIS__F_INICIALIZA_PROCESO(java.math.BigDecimal pPMES,
			java.math.BigDecimal pPANYO, java.math.BigDecimal pPCEMPRES, java.sql.Date pPFINICIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROYPROVIS.F_INICIALIZA_PROCESO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPMES", "pPANYO", "pPCEMPRES", "pPFINICIO" },
				new Object[] { pPMES, pPANYO, pPCEMPRES, pPFINICIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMES);
		cStmt.setObject(3, pPANYO);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPFINICIO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PNPROCESO"
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
			retVal.put("PNPROCESO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PNPROCESO", null);
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

	public HashMap ejecutaPAC_IAX_PROYPROVIS__F_INICIALIZA_PROCESO(java.math.BigDecimal pPMES,
			java.math.BigDecimal pPANYO, java.math.BigDecimal pPCEMPRES, java.sql.Date pPFINICIO) throws Exception {
		return this.callPAC_IAX_PROYPROVIS__F_INICIALIZA_PROCESO(pPMES, pPANYO, pPCEMPRES, pPFINICIO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PROYPROVIS.F_INICIALIZA_PROCESO
	// --START-PAC_IAX_PROYPROVIS.F_CONSUL_PARAM_MTO_POS(PSPRODUC)
	private HashMap callPAC_IAX_PROYPROVIS__F_CONSUL_PARAM_MTO_POS(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_PROYPROVIS.F_CONSUL_PARAM_MTO_POS(?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_PROYPROVIS__F_CONSUL_PARAM_MTO_POS(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_PROYPROVIS__F_CONSUL_PARAM_MTO_POS(pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PROYPROVIS.F_CONSUL_PARAM_MTO_POS

}
