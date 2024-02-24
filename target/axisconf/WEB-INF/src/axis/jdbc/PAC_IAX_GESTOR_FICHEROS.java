package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GESTOR_FICHEROS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRENOTIFICACIONES.class);
	private Connection conn = null;

	public PAC_IAX_GESTOR_FICHEROS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PRENOTIFICACIONES.F_DOMICILIAR(PCEMPRES, PFEFECTO, PFFECCOB,
	// PCRAMO, PSPRODUC, PSPRODOM, PCCOBBAN, PCBANCO, PCTIPCTA, PFVTOTAR, PCREFEREN,
	// PDFEFECTO)
	private HashMap callPAC_IAX_GESTOR_FICHEROS__F_GENERAR_FICHEROS(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPTGESTOR, String pPTFORMATO, java.math.BigDecimal pPNANIO,
			String /* java.math.BigDecimal */ pPNMES, java.math.BigDecimal pPNDIA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTOR_FICHEROS.F_GENERAR_FICHEROS(?, ?, ?, ?, ?, ?, ?, ?)}";

		// logCall(callQuery, new String[] {"pPSPROCES", "pPCEMPRES", "pPFEFECTO",
		// "pPFFECCOB", "pPCRAMO", "pPSPRODUC", "pPSPRODOM", "pPCCOBBAN", "pPCBANCO",
		// "pPCTIPCTA", "pPFVTOTAR", "pPCREFEREN", "pPDFEFECTO"}, new Object[]
		// {pPSPROCES, pPCEMPRES, pPFEFECTO, pPFFECCOB, pPCRAMO, pPSPRODUC, pPSPRODOM,
		// pPCCOBBAN, pPCBANCO, pPCTIPCTA, pPFVTOTAR, pPCREFEREN, pPDFEFECTO});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPEMPRESA);
		cStmt.setObject(3, pPTGESTOR);
		cStmt.setObject(4, pPTFORMATO);
		cStmt.setObject(5, pPNANIO);
		cStmt.setObject(6, pPNMES);
		cStmt.setObject(7, pPNDIA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "SPROCES"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();

		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("SPROCES", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("SPROCES", null);
		}

		try {
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTOR_FICHEROS__F_GENERAR_FICHEROS(java.math.BigDecimal pPEMPRESA,
			java.math.BigDecimal pPTGESTOR, String pPTFORMATO, java.math.BigDecimal pPNANIO,
			String/* java.math.BigDecimal */ pPNMES, java.math.BigDecimal pPNDIA) throws Exception {

		return this.callPAC_IAX_GESTOR_FICHEROS__F_GENERAR_FICHEROS(pPEMPRESA, pPTGESTOR, pPTFORMATO, pPNANIO, pPNMES,
				pPNDIA);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_GESTOR_FICHEROS__F_GET_PROCESO() throws Exception {
		String callQuery = "{?=call PAC_IAX_PRENOTIFICACIONES.F_GET_PROCESO(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PSPROCES"
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
			retVal.put("PSPROCES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_GESTOR_FICHEROS__F_GET_PROCESO() throws Exception {
		return this.callPAC_IAX_GESTOR_FICHEROS__F_GET_PROCESO();// AXIS-WLS1SERVER-Ready
	}
}
