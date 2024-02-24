package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_FIC_FORMATOS extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_FIC_FORMATOS.class);
	private Connection conn = null;

	public PAC_IAX_FIC_FORMATOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_FIC_FORMATOS.F_GENERA_FORMATOS(PCEMPRES, PTGESTOR, PTFORMAT,
	// PANIO, PMES, PMES_DIA, PCHK_GENERA, PCHKESCRIBE)
	private HashMap callPAC_IAX_FIC_FORMATOS__F_GENERA_FORMATOS(java.math.BigDecimal pPCEMPRES, String pPTGESTOR,
			String pPTFORMAT, java.math.BigDecimal pPANIO, String pPMES, String pPMES_DIA, String pPCHK_GENERA,
			String pPCHKESCRIBE) throws Exception {
		String callQuery = "{?=call PAC_IAX_FIC_FORMATOS.F_GENERA_FORMATOS(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPTGESTOR", "pPTFORMAT", "pPANIO", "pPMES", "pPMES_DIA", "pPCHK_GENERA",
						"pPCHKESCRIBE" },
				new Object[] { pPCEMPRES, pPTGESTOR, pPTFORMAT, pPANIO, pPMES, pPMES_DIA, pPCHK_GENERA, pPCHKESCRIBE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPTGESTOR);
		cStmt.setObject(4, pPTFORMAT);
		cStmt.setObject(5, pPANIO);
		cStmt.setObject(6, pPMES);
		cStmt.setObject(7, pPMES_DIA);
		cStmt.setObject(8, pPCHK_GENERA);
		cStmt.setObject(9, pPCHKESCRIBE);
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

	public HashMap ejecutaPAC_IAX_FIC_FORMATOS__F_GENERA_FORMATOS(java.math.BigDecimal pPCEMPRES, String pPTGESTOR,
			String pPTFORMAT, java.math.BigDecimal pPANIO, String pPMES, String pPMES_DIA, String pPCHK_GENERA,
			String pPCHKESCRIBE) throws Exception {
		return this.callPAC_IAX_FIC_FORMATOS__F_GENERA_FORMATOS(pPCEMPRES, pPTGESTOR, pPTFORMAT, pPANIO, pPMES,
				pPMES_DIA, pPCHK_GENERA, pPCHKESCRIBE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_FIC_FORMATOS.F_GENERA_FORMATOS

}
