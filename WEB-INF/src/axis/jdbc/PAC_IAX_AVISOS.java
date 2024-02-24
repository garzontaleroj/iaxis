//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_AVISOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AVISOS.class);
	private Connection conn = null;

	public PAC_IAX_AVISOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_AVISOS.F_GET_AVISOS(PCFORM, PCMODO, PCRAMO, PSPRODUC,
	// PPARAMS)
	private HashMap callPAC_IAX_AVISOS__F_GET_AVISOS(String pPCFORM, String pPCMODO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, String pPPARAMS) throws Exception {
		String callQuery = "{?=call PAC_IAX_AVISOS.F_GET_AVISOS(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCFORM", "pPCMODO", "pPCRAMO", "pPSPRODUC", "pPPARAMS" },
				new Object[] { pPCFORM, pPCMODO, pPCRAMO, pPSPRODUC, pPPARAMS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCFORM);
		cStmt.setObject(3, pPCMODO);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPPARAMS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_AVISO".toUpperCase())); // Valor de "PLSTAVISOS"
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
			retVal.put("PLSTAVISOS", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PLSTAVISOS", null);
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

	public HashMap ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(String pPCFORM, String pPCMODO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, String pPPARAMS) throws Exception {
		return this.callPAC_IAX_AVISOS__F_GET_AVISOS(pPCFORM, pPCMODO, pPCRAMO, pPSPRODUC, pPPARAMS);
	}
	// --END-PAC_IAX_AVISOS.F_GET_AVISOS

	// --START-PAC_IAX_AVISOS.F_AVISO_PAGO_TERCERO(PNSINIES, PCTIPDES, PSPERSON,
	// PCCONPAG, PCIDIOMA)
	private HashMap callPAC_IAX_AVISOS__F_AVISO_PAGO_TERCERO(String pPNSINIES, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_AVISOS.F_AVISO_PAGO_TERCERO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES", "pPCTIPDES", "pPSPERSON", "pPCCONPAG", "pPCIDIOMA" },
				new Object[] { pPNSINIES, pPCTIPDES, pPSPERSON, pPCCONPAG, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPCTIPDES);
		cStmt.setObject(4, pPSPERSON);
		cStmt.setObject(5, pPCCONPAG);
		cStmt.setObject(6, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.VARCHAR); // Valor de "PTMENSAJE"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PTMENSAJE", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PTMENSAJE", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_AVISOS__F_AVISO_PAGO_TERCERO(String pPNSINIES, java.math.BigDecimal pPCTIPDES,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCONPAG, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		return this.callPAC_IAX_AVISOS__F_AVISO_PAGO_TERCERO(pPNSINIES, pPCTIPDES, pPSPERSON, pPCCONPAG, pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_AVISOS.F_AVISO_PAGO_TERCERO

}
