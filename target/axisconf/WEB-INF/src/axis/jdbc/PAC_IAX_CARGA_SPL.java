package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CARGA_SPL extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CARGA_SPL.class);
	private Connection conn = null;

	public PAC_IAX_CARGA_SPL(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CARGA_SPL.F_GET_CAMPO_SPL(CDARCHIV)
	private HashMap callPAC_IAX_CARGA_SPL__F_GET_CAMPO_SPL(String pCDARCHIV) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_GET_CAMPO_SPL(?, ?)}";

		logCall(callQuery, new String[] { "pCDARCHIV" }, new Object[] { pCDARCHIV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCDARCHIV);
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

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_GET_CAMPO_SPL(String pCDARCHIV) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_GET_CAMPO_SPL(pCDARCHIV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_GET_CAMPO_SPL

	// --END-PAC_IAX_CARGA_SPL.F_GET_CAMPO_SPL

	// --START-PAC_IAX_CARGA_SPL.F_GET_VALIDA_SPL(CDARCHIV)
	private HashMap callPAC_IAX_CARGA_SPL__F_GET_VALIDA_SPL(String pCDARCHIV) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_GET_VALIDA_SPL(?, ?)}";

		logCall(callQuery, new String[] { "pCDARCHIV" }, new Object[] { pCDARCHIV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCDARCHIV);
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

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_GET_VALIDA_SPL(String pCDARCHIV) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_GET_VALIDA_SPL(pCDARCHIV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_GET_VALIDA_SPL

	// --START-PAC_IAX_CARGA_SPL.F_SET_CAMPO_SPL(PCDARCHI, PNORDEN, PCCAMPO,
	// PCTIPCAM, PNORDENNEW, PCCAMPONEW, PCTIPCAMNEW, PNPOSICI, PNLONGITUD, PNTIPO,
	// PNDECIMAL, PCMASK, PCMODO, PCEDIT)
	private HashMap callPAC_IAX_CARGA_SPL__F_SET_CAMPO_SPL(String pPCDARCHI, java.math.BigDecimal pPNORDEN,
			String pPCCAMPO, String pPCTIPCAM, java.math.BigDecimal pPNORDENNEW, String pPCCAMPONEW,
			String pPCTIPCAMNEW, java.math.BigDecimal pPNPOSICI, java.math.BigDecimal pPNLONGITUD,
			java.math.BigDecimal pPNTIPO, java.math.BigDecimal pPNDECIMAL, String pPCMASK, String pPCMODO,
			java.math.BigDecimal pPCEDIT) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_SET_CAMPO_SPL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDARCHI", "pPNORDEN", "pPCCAMPO", "pPCTIPCAM", "pPNORDENNEW", "pPCCAMPONEW",
						"pPCTIPCAMNEW", "pPNPOSICI", "pPNLONGITUD", "pPNTIPO", "pPNDECIMAL", "pPCMASK", "pPCMODO",
						"pPCEDIT" },
				new Object[] { pPCDARCHI, pPNORDEN, pPCCAMPO, pPCTIPCAM, pPNORDENNEW, pPCCAMPONEW, pPCTIPCAMNEW,
						pPNPOSICI, pPNLONGITUD, pPNTIPO, pPNDECIMAL, pPCMASK, pPCMODO, pPCEDIT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDARCHI);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPCCAMPO);
		cStmt.setObject(5, pPCTIPCAM);
		cStmt.setObject(6, pPNORDENNEW);
		cStmt.setObject(7, pPCCAMPONEW);
		cStmt.setObject(8, pPCTIPCAMNEW);
		cStmt.setObject(9, pPNPOSICI);
		cStmt.setObject(10, pPNLONGITUD);
		cStmt.setObject(11, pPNTIPO);
		cStmt.setObject(12, pPNDECIMAL);
		cStmt.setObject(13, pPCMASK);
		cStmt.setObject(14, pPCMODO);
		cStmt.setObject(15, pPCEDIT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(16));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_SET_CAMPO_SPL(String pPCDARCHI, java.math.BigDecimal pPNORDEN,
			String pPCCAMPO, String pPCTIPCAM, java.math.BigDecimal pPNORDENNEW, String pPCCAMPONEW,
			String pPCTIPCAMNEW, java.math.BigDecimal pPNPOSICI, java.math.BigDecimal pPNLONGITUD,
			java.math.BigDecimal pPNTIPO, java.math.BigDecimal pPNDECIMAL, String pPCMASK, String pPCMODO,
			java.math.BigDecimal pPCEDIT) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_SET_CAMPO_SPL(pPCDARCHI, pPNORDEN, pPCCAMPO, pPCTIPCAM, pPNORDENNEW,
				pPCCAMPONEW, pPCTIPCAMNEW, pPNPOSICI, pPNLONGITUD, pPNTIPO, pPNDECIMAL, pPCMASK, pPCMODO, pPCEDIT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_SET_CAMPO_SPL

	// --START-PAC_IAX_CARGA_SPL.F_DEL_CAMPO_SPL(PCDARCHI, PNORDEN, PCCAMPO,
	// PCTIPCAM)
	private HashMap callPAC_IAX_CARGA_SPL__F_DEL_CAMPO_SPL(String pPCDARCHI, java.math.BigDecimal pPNORDEN,
			String pPCCAMPO, String pPCTIPCAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_DEL_CAMPO_SPL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDARCHI", "pPNORDEN", "pPCCAMPO", "pPCTIPCAM" },
				new Object[] { pPCDARCHI, pPNORDEN, pPCCAMPO, pPCTIPCAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDARCHI);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPCCAMPO);
		cStmt.setObject(5, pPCTIPCAM);
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

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_DEL_CAMPO_SPL(String pPCDARCHI, java.math.BigDecimal pPNORDEN,
			String pPCCAMPO, String pPCTIPCAM) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_DEL_CAMPO_SPL(pPCDARCHI, pPNORDEN, pPCCAMPO, pPCTIPCAM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_DEL_CAMPO_SPL

	// --START-PAC_IAX_CARGA_SPL.F_SET_CARGA_VALIDA_SPL(PCDARCHI, PCCAMPO1,
	// PCTIPCAM1, PCCAMPO2, PCTIPCAM2, PCOPERADOR)
	private HashMap callPAC_IAX_CARGA_SPL__F_SET_CARGA_VALIDA_SPL(String pPCDARCHI, String pPCCAMPO1,
			java.math.BigDecimal pPCTIPCAM1, String pPCCAMPO2, java.math.BigDecimal pPCTIPCAM2,
			java.math.BigDecimal pPCOPERADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_SET_CARGA_VALIDA_SPL(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCDARCHI", "pPCCAMPO1", "pPCTIPCAM1", "pPCCAMPO2", "pPCTIPCAM2", "pPCOPERADOR" },
				new Object[] { pPCDARCHI, pPCCAMPO1, pPCTIPCAM1, pPCCAMPO2, pPCTIPCAM2, pPCOPERADOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDARCHI);
		cStmt.setObject(3, pPCCAMPO1);
		cStmt.setObject(4, pPCTIPCAM1);
		cStmt.setObject(5, pPCCAMPO2);
		cStmt.setObject(6, pPCTIPCAM2);
		cStmt.setObject(7, pPCOPERADOR);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_SET_CARGA_VALIDA_SPL(String pPCDARCHI, String pPCCAMPO1,
			java.math.BigDecimal pPCTIPCAM1, String pPCCAMPO2, java.math.BigDecimal pPCTIPCAM2,
			java.math.BigDecimal pPCOPERADOR) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_SET_CARGA_VALIDA_SPL(pPCDARCHI, pPCCAMPO1, pPCTIPCAM1, pPCCAMPO2,
				pPCTIPCAM2, pPCOPERADOR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_SET_CARGA_VALIDA_SPL

	// --START-PAC_IAX_CARGA_SPL.F_DEL_VALIDA_SPL(PCDARCHI)
	private HashMap callPAC_IAX_CARGA_SPL__F_DEL_VALIDA_SPL(String pPCDARCHI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_DEL_VALIDA_SPL(?, ?)}";

		logCall(callQuery, new String[] { "pPCDARCHI" }, new Object[] { pPCDARCHI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDARCHI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_DEL_VALIDA_SPL(String pPCDARCHI) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_DEL_VALIDA_SPL(pPCDARCHI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_DEL_VALIDA_SPL

	// --START-PAC_IAX_CARGA_SPL.F_GET_CABECERA_SPL(CDARCHIV)
	private HashMap callPAC_IAX_CARGA_SPL__F_GET_CABECERA_SPL(String pCDARCHIV) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_GET_CABECERA_SPL(?, ?)}";

		logCall(callQuery, new String[] { "pCDARCHIV" }, new Object[] { pCDARCHIV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCDARCHIV);
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

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_GET_CABECERA_SPL(String pCDARCHIV) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_GET_CABECERA_SPL(pCDARCHIV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_GET_CABECERA_SPL

	// --START-PAC_IAX_CARGA_SPL.F_SET_CARGA_ARCHIVO_SPL(PCDARCHI, PCARCEST,
	// PCTIPARC, PCSEPARA, PDSPROCES)
	private HashMap callPAC_IAX_CARGA_SPL__F_SET_CARGA_ARCHIVO_SPL(String pPCDARCHI, java.math.BigDecimal pPCARCEST,
			java.math.BigDecimal pPCTIPARC, String pPCSEPARA, java.math.BigDecimal pPDSPROCES) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_SET_CARGA_ARCHIVO_SPL(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDARCHI", "pPCARCEST", "pPCTIPARC", "pPCSEPARA", "pPDSPROCES" },
				new Object[] { pPCDARCHI, pPCARCEST, pPCTIPARC, pPCSEPARA, pPDSPROCES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDARCHI);
		cStmt.setObject(3, pPCARCEST);
		cStmt.setObject(4, pPCTIPARC);
		cStmt.setObject(5, pPCSEPARA);
		cStmt.setObject(6, pPDSPROCES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_SET_CARGA_ARCHIVO_SPL(String pPCDARCHI, java.math.BigDecimal pPCARCEST,
			java.math.BigDecimal pPCTIPARC, String pPCSEPARA, java.math.BigDecimal pPDSPROCES) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_SET_CARGA_ARCHIVO_SPL(pPCDARCHI, pPCARCEST, pPCTIPARC, pPCSEPARA,
				pPDSPROCES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_SET_CARGA_ARCHIVO_SPL

	// --START-PAC_IAX_CARGA_SPL.F_GET_INT_CAMPO_SPL(PCDARCHI, PNORDEN, PCCAMPO,
	// PCTIPCAM)
	private HashMap callPAC_IAX_CARGA_SPL__F_GET_INT_CAMPO_SPL(String pPCDARCHI, java.math.BigDecimal pPNORDEN,
			String pPCCAMPO, String pPCTIPCAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_CARGA_SPL.F_GET_INT_CAMPO_SPL(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCDARCHI", "pPNORDEN", "pPCCAMPO", "pPCTIPCAM" },
				new Object[] { pPCDARCHI, pPNORDEN, pPCCAMPO, pPCTIPCAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCDARCHI);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPCCAMPO);
		cStmt.setObject(5, pPCTIPCAM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CARGACAMPO_SPL".toUpperCase())); // Valor de "OBCCAMPO"
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
			retVal.put("OBCCAMPO", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("OBCCAMPO", null);
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

	public HashMap ejecutaPAC_IAX_CARGA_SPL__F_GET_INT_CAMPO_SPL(String pPCDARCHI, java.math.BigDecimal pPNORDEN,
			String pPCCAMPO, String pPCTIPCAM) throws Exception {
		return this.callPAC_IAX_CARGA_SPL__F_GET_INT_CAMPO_SPL(pPCDARCHI, pPNORDEN, pPCCAMPO, pPCTIPCAM);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CARGA_SPL.F_GET_INT_CAMPO_SPL

}
