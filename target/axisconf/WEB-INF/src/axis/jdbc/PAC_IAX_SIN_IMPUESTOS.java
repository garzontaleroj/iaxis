package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_SIN_IMPUESTOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_ADM.class);
	private Connection conn = null;

	public PAC_IAX_SIN_IMPUESTOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_SIN_IMPUESTOS.F_GET_IMPUESTOS(PCCONCEP, PCCODIMP)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTOS(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_GET_IMPUESTOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCONCEP", "pPCCODIMP" }, new Object[] { pPCCONCEP, pPCCODIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCCODIMP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTOS(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTOS(pPCCONCEP, pPCCODIMP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_GET_IMPUESTOS

	// --START-PAC_IAX_SIN_IMPUESTOS.F_SET_IMPUESTO(PCCONCEP, PCCODIMP, PFDESDE,
	// PCTIPPER, PCREGFISCAL, PCTIPCAL, PIFIJO, PCBASECAL, PCBASEMIN, PCBASEMAX,
	// PNPORCENT, PIMIN, PIMAX, PNORDIMP, PCSUBTAB)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_SET_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP, java.sql.Date pPFDESDE, java.math.BigDecimal pPCTIPPER,
			java.math.BigDecimal pPCREGFISCAL, java.math.BigDecimal pPCTIPCAL, java.math.BigDecimal pPIFIJO,
			java.math.BigDecimal pPCBASECAL, java.math.BigDecimal pPCBASEMIN, java.math.BigDecimal pPCBASEMAX,
			java.math.BigDecimal pPNPORCENT, java.math.BigDecimal pPIMIN, java.math.BigDecimal pPIMAX,
			java.math.BigDecimal pPNORDIMP, java.math.BigDecimal pPCSUBTAB) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_SET_IMPUESTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCONCEP", "pPCCODIMP", "pPFDESDE", "pPCTIPPER", "pPCREGFISCAL", "pPCTIPCAL",
						"pPIFIJO", "pPCBASECAL", "pPCBASEMIN", "pPCBASEMAX", "pPNPORCENT", "pPIMIN", "pPIMAX",
						"pPNORDIMP", "pPCSUBTAB" },
				new Object[] { pPCCONCEP, pPCCODIMP, pPFDESDE, pPCTIPPER, pPCREGFISCAL, pPCTIPCAL, pPIFIJO, pPCBASECAL,
						pPCBASEMIN, pPCBASEMAX, pPNPORCENT, pPIMIN, pPIMAX, pPNORDIMP, pPCSUBTAB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCCODIMP);
		cStmt.setObject(4, pPFDESDE);
		cStmt.setObject(5, pPCTIPPER);
		cStmt.setObject(6, pPCREGFISCAL);
		cStmt.setObject(7, pPCTIPCAL);
		cStmt.setObject(8, pPIFIJO);
		cStmt.setObject(9, pPCBASECAL);
		cStmt.setObject(10, pPCBASEMIN);
		cStmt.setObject(11, pPCBASEMAX);
		cStmt.setObject(12, pPNPORCENT);
		cStmt.setObject(13, pPIMIN);
		cStmt.setObject(14, pPIMAX);
		cStmt.setObject(15, pPNORDIMP);
		cStmt.setObject(16, pPCSUBTAB);
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_SET_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP, java.sql.Date pPFDESDE, java.math.BigDecimal pPCTIPPER,
			java.math.BigDecimal pPCREGFISCAL, java.math.BigDecimal pPCTIPCAL, java.math.BigDecimal pPIFIJO,
			java.math.BigDecimal pPCBASECAL, java.math.BigDecimal pPCBASEMIN, java.math.BigDecimal pPCBASEMAX,
			java.math.BigDecimal pPNPORCENT, java.math.BigDecimal pPIMIN, java.math.BigDecimal pPIMAX,
			java.math.BigDecimal pPNORDIMP, java.math.BigDecimal pPCSUBTAB) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_SET_IMPUESTO(pPCCONCEP, pPCCODIMP, pPFDESDE, pPCTIPPER, pPCREGFISCAL,
				pPCTIPCAL, pPIFIJO, pPCBASECAL, pPCBASEMIN, pPCBASEMAX, pPNPORCENT, pPIMIN, pPIMAX, pPNORDIMP,
				pPCSUBTAB);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_SET_IMPUESTO

	// --START-PAC_IAX_SIN_IMPUESTOS.F_DEL_IMPUESTO(PCCONCEP, PCCODIMP, PNORDIMP)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_DEL_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP, java.math.BigDecimal pPNORDIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_DEL_IMPUESTO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCONCEP", "pPCCODIMP", "pPNORDIMP" },
				new Object[] { pPCCONCEP, pPCCODIMP, pPNORDIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCCODIMP);
		cStmt.setObject(4, pPNORDIMP);
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_DEL_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP, java.math.BigDecimal pPNORDIMP) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_DEL_IMPUESTO(pPCCONCEP, pPCCODIMP, pPNORDIMP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_DEL_IMPUESTO

	// --START-PAC_IAX_SIN_IMPUESTOS.F_GET_IMPUESTO(PCCONCEP, PCCODIMP, PNORDIMP)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP, java.math.BigDecimal pPNORDIMP) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_GET_IMPUESTO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCONCEP", "pPCCODIMP", "pPNORDIMP" },
				new Object[] { pPCCONCEP, pPCCODIMP, pPNORDIMP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCCODIMP);
		cStmt.setObject(4, pPNORDIMP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCODIMP, java.math.BigDecimal pPNORDIMP) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTO(pPCCONCEP, pPCCODIMP, pPNORDIMP);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_GET_IMPUESTO

	// --START-PAC_IAX_SIN_IMPUESTOS.F_GET_LSTIMPUESTOS()
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_GET_LSTIMPUESTOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_GET_LSTIMPUESTOS(?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTIMPUESTOS() throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_GET_LSTIMPUESTOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_GET_LSTIMPUESTOS

	// --START-PAC_IAX_SIN_IMPUESTOS.F_GET_TDESCRI_SUBTAB(PCSUBTAB)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_GET_TDESCRI_SUBTAB(java.math.BigDecimal pPCSUBTAB) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_GET_TDESCRI_SUBTAB(?, ?)}";

		logCall(callQuery, new String[] { "pPCSUBTAB" }, new Object[] { pPCSUBTAB });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCSUBTAB);
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_TDESCRI_SUBTAB(java.math.BigDecimal pPCSUBTAB) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_GET_TDESCRI_SUBTAB(pPCSUBTAB);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_GET_TDESCRI_SUBTAB

	// --START-PAC_IAX_SIN_IMPUESTOS.F_COPIA_IMPUESTO(PCCONCEP, PCCONCEP_ANT)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_COPIA_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCONCEP_ANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_COPIA_IMPUESTO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCONCEP", "pPCCONCEP_ANT" }, new Object[] { pPCCONCEP, pPCCONCEP_ANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEP);
		cStmt.setObject(3, pPCCONCEP_ANT);
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_COPIA_IMPUESTO(java.math.BigDecimal pPCCONCEP,
			java.math.BigDecimal pPCCONCEP_ANT) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_COPIA_IMPUESTO(pPCCONCEP, pPCCONCEP_ANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_COPIA_IMPUESTO

	// --START-PAC_IAX_SIN_IMPUESTOS.F_GET_LSTCONCEPTOS()
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_GET_LSTCONCEPTOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_GET_LSTCONCEPTOS(?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTCONCEPTOS() throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_GET_LSTCONCEPTOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_GET_LSTCONCEPTOS

	// --START-PAC_IAX_SIN_IMPUESTOS.F_GET_DEFINICIONES_RETEICA(PCPAIS, PCPROVIN,
	// PCPOBLAC)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_GET_DEFINICIONES_RETEICA(java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_GET_DEFINICIONES_RETEICA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPAIS", "pPCPROVIN", "pPCPOBLAC" },
				new Object[] { pPCPAIS, pPCPROVIN, pPCPOBLAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPAIS);
		cStmt.setObject(3, pPCPROVIN);
		cStmt.setObject(4, pPCPOBLAC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_DEFINICIONES_RETEICA(java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_GET_DEFINICIONES_RETEICA(pPCPAIS, pPCPROVIN, pPCPOBLAC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_GET_DEFINICIONES_RETEICA

	// --START-PAC_IAX_SIN_IMPUESTOS.F_SET_VALORES_RETEICA(PCPAIS, PCPROVIN,
	// PCPOBLAC, PFDESDE, PVALORES_RETEICA)
	private HashMap callPAC_IAX_SIN_IMPUESTOS__F_SET_VALORES_RETEICA(java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.sql.Date pPFDESDE,
			String pPVALORES_RETEICA) throws Exception {
		String callQuery = "{?=call PAC_IAX_SIN_IMPUESTOS.F_SET_VALORES_RETEICA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPFDESDE", "pPVALORES_RETEICA" },
				new Object[] { pPCPAIS, pPCPROVIN, pPCPOBLAC, pPFDESDE, pPVALORES_RETEICA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPAIS);
		cStmt.setObject(3, pPCPROVIN);
		cStmt.setObject(4, pPCPOBLAC);
		cStmt.setObject(5, pPFDESDE);
		cStmt.setObject(6, pPVALORES_RETEICA);
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

	public HashMap ejecutaPAC_IAX_SIN_IMPUESTOS__F_SET_VALORES_RETEICA(java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.sql.Date pPFDESDE,
			String pPVALORES_RETEICA) throws Exception {
		return this.callPAC_IAX_SIN_IMPUESTOS__F_SET_VALORES_RETEICA(pPCPAIS, pPCPROVIN, pPCPOBLAC, pPFDESDE,
				pPVALORES_RETEICA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_SIN_IMPUESTOS.F_SET_VALORES_RETEICA

}
