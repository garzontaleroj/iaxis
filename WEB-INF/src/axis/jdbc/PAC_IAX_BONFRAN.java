package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_BONFRAN extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_BONFRAN.class);
	private Connection conn = null;

	public PAC_IAX_BONFRAN(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_BONFRAN.F_SET_DEDUCIBLE(PCGRUP, PCSUBGRUP, PCVERSION,
	// PCNIVEL, PCVALOR1, PIMPVALOR1, PCIMPMIN, PIMPMIN, PCIMPMAX, PIMPMAX)
	private HashMap callPAC_IAX_BONFRAN__F_SET_DEDUCIBLE(java.math.BigDecimal pPCGRUP, java.math.BigDecimal pPCSUBGRUP,
			java.math.BigDecimal pPCVERSION, java.math.BigDecimal pPCNIVEL, java.math.BigDecimal pPCVALOR1,
			java.math.BigDecimal pPIMPVALOR1, java.math.BigDecimal pPCIMPMIN, java.math.BigDecimal pPIMPMIN,
			java.math.BigDecimal pPCIMPMAX, java.math.BigDecimal pPIMPMAX) throws Exception {
		String callQuery = "{?=call PAC_IAX_BONFRAN.F_SET_DEDUCIBLE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCGRUP", "pPCSUBGRUP", "pPCVERSION", "pPCNIVEL", "pPCVALOR1", "pPIMPVALOR1",
						"pPCIMPMIN", "pPIMPMIN", "pPCIMPMAX", "pPIMPMAX" },
				new Object[] { pPCGRUP, pPCSUBGRUP, pPCVERSION, pPCNIVEL, pPCVALOR1, pPIMPVALOR1, pPCIMPMIN, pPIMPMIN,
						pPCIMPMAX, pPIMPMAX });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGRUP);
		cStmt.setObject(3, pPCSUBGRUP);
		cStmt.setObject(4, pPCVERSION);
		cStmt.setObject(5, pPCNIVEL);
		cStmt.setObject(6, pPCVALOR1);
		cStmt.setObject(7, pPIMPVALOR1);
		cStmt.setObject(8, pPCIMPMIN);
		cStmt.setObject(9, pPIMPMIN);
		cStmt.setObject(10, pPCIMPMAX);
		cStmt.setObject(11, pPIMPMAX);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_BONFRAN__F_SET_DEDUCIBLE(java.math.BigDecimal pPCGRUP,
			java.math.BigDecimal pPCSUBGRUP, java.math.BigDecimal pPCVERSION, java.math.BigDecimal pPCNIVEL,
			java.math.BigDecimal pPCVALOR1, java.math.BigDecimal pPIMPVALOR1, java.math.BigDecimal pPCIMPMIN,
			java.math.BigDecimal pPIMPMIN, java.math.BigDecimal pPCIMPMAX, java.math.BigDecimal pPIMPMAX)
			throws Exception {
		return this.callPAC_IAX_BONFRAN__F_SET_DEDUCIBLE(pPCGRUP, pPCSUBGRUP, pPCVERSION, pPCNIVEL, pPCVALOR1,
				pPIMPVALOR1, pPCIMPMIN, pPIMPMIN, pPCIMPMAX, pPIMPMAX);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_BONFRAN.F_SET_DEDUCIBLE
	// --START-PAC_IAX_BONFRAN.F_VALIDAR_DEDUCIBLE_MANUAL(PCGRUP, PCSUBGRUP,
	// PCVERSION, PCNIVEL)
	private HashMap callPAC_IAX_BONFRAN__F_VALIDAR_DEDUCIBLE_MANUAL(java.math.BigDecimal pPCGRUP,
			java.math.BigDecimal pPCSUBGRUP, java.math.BigDecimal pPCVERSION, java.math.BigDecimal pPCNIVEL)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_BONFRAN.F_VALIDAR_DEDUCIBLE_MANUAL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCGRUP", "pPCSUBGRUP", "pPCVERSION", "pPCNIVEL" },
				new Object[] { pPCGRUP, pPCSUBGRUP, pPCVERSION, pPCNIVEL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGRUP);
		cStmt.setObject(3, pPCSUBGRUP);
		cStmt.setObject(4, pPCVERSION);
		cStmt.setObject(5, pPCNIVEL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCVALOR1"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PIMPVALOR1"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PCIMPMIN"
		cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PIMPMIN"
		cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PCIMPMAX"
		cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "PIMPMAX"
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
			retVal.put("PCVALOR1", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCVALOR1", null);
		}
		try {
			retVal.put("PIMPVALOR1", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PIMPVALOR1", null);
		}
		try {
			retVal.put("PCIMPMIN", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCIMPMIN", null);
		}
		try {
			retVal.put("PIMPMIN", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PIMPMIN", null);
		}
		try {
			retVal.put("PCIMPMAX", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCIMPMAX", null);
		}
		try {
			retVal.put("PIMPMAX", cStmt.getObject(11));
		} catch (SQLException e) {
			retVal.put("PIMPMAX", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_BONFRAN__F_VALIDAR_DEDUCIBLE_MANUAL(java.math.BigDecimal pPCGRUP,
			java.math.BigDecimal pPCSUBGRUP, java.math.BigDecimal pPCVERSION, java.math.BigDecimal pPCNIVEL)
			throws Exception {
		return this.callPAC_IAX_BONFRAN__F_VALIDAR_DEDUCIBLE_MANUAL(pPCGRUP, pPCSUBGRUP, pPCVERSION, pPCNIVEL);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_BONFRAN.F_VALIDAR_DEDUCIBLE_MANUAL

}
