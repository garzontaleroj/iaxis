//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DOCREQUERIDA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_AGENDA.class);
	private Connection conn = null;

	public PAC_IAX_DOCREQUERIDA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DOCREQUERIDA.F_GET_DIRECTORIO()
	private HashMap callPAC_IAX_DOCREQUERIDA__F_GET_DIRECTORIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_DOCREQUERIDA.F_GET_DIRECTORIO(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DIRECTORIO() throws Exception {
		return this.callPAC_IAX_DOCREQUERIDA__F_GET_DIRECTORIO();
	}
	// --END-PAC_IAX_DOCREQUERIDA.F_GET_DIRECTORIO

//--START-PAC_IAX_DOCREQUERIDA.F_AVISO_DOCREQ_PENDIENTE(PSSEGURO,  PNMOVIMI,  PSPRODUC,  PCACTIVI)
	private HashMap callPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DOCREQUERIDA.F_AVISO_DOCREQ_PENDIENTE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		return this.callPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE(pPSSEGURO, pPNMOVIMI, pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_DOCREQUERIDA.F_AVISO_DOCREQ_PENDIENTE

	// --START-PAC_IAX_DOCREQUERIDA.F_DOCREQ_PENDIENTE(PSSEGURO, PNMOVIMI, PSPRODUC,
	// PCACTIVI)
	private HashMap callPAC_IAX_DOCREQUERIDA__F_DOCREQ_PENDIENTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DOCREQUERIDA.F_DOCREQ_PENDIENTE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI", "pPSPRODUC", "pPCACTIVI" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOCREQUERIDA__F_DOCREQ_PENDIENTE(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI)
			throws Exception {
		return this.callPAC_IAX_DOCREQUERIDA__F_DOCREQ_PENDIENTE(pPSSEGURO, pPNMOVIMI, pPSPRODUC, pPCACTIVI);
	}
	// --END-PAC_IAX_DOCREQUERIDA.F_DOCREQ_PENDIENTE

	// --START-PAC_IAX_DOCREQUERIDA.F_GET_DOCUREQUERIDA(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOCREQUERIDA.F_GET_DOCUREQUERIDA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DOCREQUERIDA".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(pPSSEGURO, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOCREQUERIDA.F_GET_DOCUREQUERIDA

	// --START-PAC_IAX_DOCREQUERIDA.F_GRABARDOCREQUERIDAPOL(PSEQDOCU, PSPRODUC,
	// PSSEGURO, PCACTIVI, PNMOVIMI, PNRIESGO, PNINQAVAL, PCDOCUME, PCTIPDOC,
	// PCCLASE, PNORDEN, PTDESCRIP, PTFILENAME, PADJUNTADO, PCRECIBIDO)
	private HashMap callPAC_IAX_DOCREQUERIDA__F_GRABARDOCREQUERIDAPOL(java.math.BigDecimal pPSEQDOCU,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNINQAVAL,
			java.math.BigDecimal pPCDOCUME, java.math.BigDecimal pPCTIPDOC, java.math.BigDecimal pPCCLASE,
			java.math.BigDecimal pPNORDEN, String pPTDESCRIP, String pPTFILENAME, java.math.BigDecimal pPADJUNTADO,
			java.math.BigDecimal pPCRECIBIDO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOCREQUERIDA.F_GRABARDOCREQUERIDAPOL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSEQDOCU", "pPSPRODUC", "pPSSEGURO", "pPCACTIVI", "pPNMOVIMI", "pPNRIESGO",
						"pPNINQAVAL", "pPCDOCUME", "pPCTIPDOC", "pPCCLASE", "pPNORDEN", "pPTDESCRIP", "pPTFILENAME",
						"pPADJUNTADO", "pPCRECIBIDO" },
				new Object[] { pPSEQDOCU, pPSPRODUC, pPSSEGURO, pPCACTIVI, pPNMOVIMI, pPNRIESGO, pPNINQAVAL, pPCDOCUME,
						pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO, pPCRECIBIDO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSEQDOCU);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPNMOVIMI);
		cStmt.setObject(7, pPNRIESGO);
		cStmt.setObject(8, pPNINQAVAL);
		cStmt.setObject(9, pPCDOCUME);
		cStmt.setObject(10, pPCTIPDOC);
		cStmt.setObject(11, pPCCLASE);
		cStmt.setObject(12, pPNORDEN);
		cStmt.setObject(13, pPTDESCRIP);
		cStmt.setObject(14, pPTFILENAME);
		cStmt.setObject(15, pPADJUNTADO);
		cStmt.setObject(16, pPCRECIBIDO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(17));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOCREQUERIDA__F_GRABARDOCREQUERIDAPOL(java.math.BigDecimal pPSEQDOCU,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCACTIVI,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPNRIESGO, java.math.BigDecimal pPNINQAVAL,
			java.math.BigDecimal pPCDOCUME, java.math.BigDecimal pPCTIPDOC, java.math.BigDecimal pPCCLASE,
			java.math.BigDecimal pPNORDEN, String pPTDESCRIP, String pPTFILENAME, java.math.BigDecimal pPADJUNTADO,
			java.math.BigDecimal pPCRECIBIDO) throws Exception {
		return this.callPAC_IAX_DOCREQUERIDA__F_GRABARDOCREQUERIDAPOL(pPSEQDOCU, pPSPRODUC, pPSSEGURO, pPCACTIVI,
				pPNMOVIMI, pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME,
				pPADJUNTADO, pPCRECIBIDO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOCREQUERIDA.F_GRABARDOCREQUERIDAPOL

}
