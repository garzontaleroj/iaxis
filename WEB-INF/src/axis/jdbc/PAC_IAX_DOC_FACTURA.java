package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DOC_FACTURA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DOC_FACTURA.class);
	private Connection conn = null;

	public PAC_IAX_DOC_FACTURA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DOC_FACTURA.F_ANULA_FACTURA(PDOCFACTURA, PNSINIES)
	private HashMap callPAC_IAX_DOC_FACTURA__F_ANULA_FACTURA(java.math.BigDecimal pPDOCFACTURA,
			java.math.BigDecimal pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOC_FACTURA.F_ANULA_FACTURA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPDOCFACTURA", "pPNSINIES" }, new Object[] { pPDOCFACTURA, pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPDOCFACTURA);
		cStmt.setObject(3, pPNSINIES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_DOC_FACTURA__F_ANULA_FACTURA(java.math.BigDecimal pPDOCFACTURA,
			java.math.BigDecimal pPNSINIES) throws Exception {
		return this.callPAC_IAX_DOC_FACTURA__F_ANULA_FACTURA(pPDOCFACTURA, pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOC_FACTURA.F_ANULA_FACTURA

	// --START-PAC_IAX_DOC_FACTURA.F_GET_FACTURA(PUSUARIO)
	private HashMap callPAC_IAX_DOC_FACTURA__F_GET_FACTURA(String pPUSUARIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOC_FACTURA.F_GET_FACTURA(?, ?)}";

		logCall(callQuery, new String[] { "pPUSUARIO" }, new Object[] { pPUSUARIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSUARIO);
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

	public HashMap ejecutaPAC_IAX_DOC_FACTURA__F_GET_FACTURA(String pPUSUARIO) throws Exception {
		return this.callPAC_IAX_DOC_FACTURA__F_GET_FACTURA(pPUSUARIO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOC_FACTURA.F_GET_FACTURA

	// --START-PAC_IAX_DOC_FACTURA.F_SET_FACTURA(PDOCFACTURA, PNSINIES, PNDOCUMENTO,
	// PDESCRIPCION, PFRECLAMACION, PFRECEPCION, PIDDOC_IMP, PEANULACION, PCUSUALT)
	private HashMap callPAC_IAX_DOC_FACTURA__F_SET_FACTURA(java.math.BigDecimal pPDOCFACTURA,
			java.math.BigDecimal pPNSINIES, String pPNDOCUMENTO, String pPDESCRIPCION, java.sql.Date pPFRECLAMACION,
			java.sql.Date pPFRECEPCION, java.math.BigDecimal pPIDDOC_IMP, java.math.BigDecimal pPEANULACION,
			String pPCUSUALT) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOC_FACTURA.F_SET_FACTURA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPDOCFACTURA", "pPNSINIES", "pPNDOCUMENTO", "pPDESCRIPCION", "pPFRECLAMACION",
						"pPFRECEPCION", "pPIDDOC_IMP", "pPEANULACION", "pPCUSUALT" },
				new Object[] { pPDOCFACTURA, pPNSINIES, pPNDOCUMENTO, pPDESCRIPCION, pPFRECLAMACION, pPFRECEPCION,
						pPIDDOC_IMP, pPEANULACION, pPCUSUALT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPDOCFACTURA);
		cStmt.setObject(3, pPNSINIES);
		cStmt.setObject(4, pPNDOCUMENTO);
		cStmt.setObject(5, pPDESCRIPCION);
		cStmt.setObject(6, pPFRECLAMACION);
		cStmt.setObject(7, pPFRECEPCION);
		cStmt.setObject(8, pPIDDOC_IMP);
		cStmt.setObject(9, pPEANULACION);
		cStmt.setObject(10, pPCUSUALT);
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

	public HashMap ejecutaPAC_IAX_DOC_FACTURA__F_SET_FACTURA(java.math.BigDecimal pPDOCFACTURA,
			java.math.BigDecimal pPNSINIES, String pPNDOCUMENTO, String pPDESCRIPCION, java.sql.Date pPFRECLAMACION,
			java.sql.Date pPFRECEPCION, java.math.BigDecimal pPIDDOC_IMP, java.math.BigDecimal pPEANULACION,
			String pPCUSUALT) throws Exception {
		return this.callPAC_IAX_DOC_FACTURA__F_SET_FACTURA(pPDOCFACTURA, pPNSINIES, pPNDOCUMENTO, pPDESCRIPCION,
				pPFRECLAMACION, pPFRECEPCION, pPIDDOC_IMP, pPEANULACION, pPCUSUALT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOC_FACTURA.F_SET_FACTURA

	// --START-PAC_IAX_DOC_FACTURA.F_VALIDA_FACTURA(FINICIO, FFIN, VCAGENTE)
	private HashMap callPAC_IAX_DOC_FACTURA__F_VALIDA_FACTURA(java.sql.Date pFINICIO, java.sql.Date pFFIN,
			java.math.BigDecimal pVCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_DOC_FACTURA.F_VALIDA_FACTURA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pFINICIO", "pFFIN", "pVCAGENTE" },
				new Object[] { pFINICIO, pFFIN, pVCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pFINICIO);
		cStmt.setObject(3, pFFIN);
		cStmt.setObject(4, pVCAGENTE);
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

	public HashMap ejecutaPAC_IAX_DOC_FACTURA__F_VALIDA_FACTURA(java.sql.Date pFINICIO, java.sql.Date pFFIN,
			java.math.BigDecimal pVCAGENTE) throws Exception {
		return this.callPAC_IAX_DOC_FACTURA__F_VALIDA_FACTURA(pFINICIO, pFFIN, pVCAGENTE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DOC_FACTURA.F_VALIDA_FACTURA

}
