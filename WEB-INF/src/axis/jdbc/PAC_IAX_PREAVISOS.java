package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_PREAVISOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PREAVISOS.class);
	private Connection conn = null;

	public PAC_IAX_PREAVISOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_PREAVISOS.F_BUSCARECIBOS(PCEMPRES, PCRAMO, PSPRODUC,
	// PDOMICILIADOS, PMEDIADOR, PPFINANCIERO, PPCOMERCIAL, PTOMADOR, PFINICI,
	// PFINAL)
	private HashMap callPAC_IAX_PREAVISOS__F_BUSCARECIBOS(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPDOMICILIADOS, java.math.BigDecimal pPMEDIADOR,
			java.math.BigDecimal pPPFINANCIERO, java.math.BigDecimal pPPCOMERCIAL, java.math.BigDecimal pPTOMADOR,
			java.sql.Date pPFINICI, java.sql.Date pPFINAL) throws Exception {
		String callQuery = "{?=call PAC_IAX_PREAVISOS.F_BUSCARECIBOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPDOMICILIADOS", "pPMEDIADOR", "pPPFINANCIERO",
						"pPPCOMERCIAL", "pPTOMADOR", "pPFINICI", "pPFINAL" },
				new Object[] { pPCEMPRES, pPCRAMO, pPSPRODUC, pPDOMICILIADOS, pPMEDIADOR, pPPFINANCIERO, pPPCOMERCIAL,
						pPTOMADOR, pPFINICI, pPFINAL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPDOMICILIADOS);
		cStmt.setObject(6, pPMEDIADOR);
		cStmt.setObject(7, pPPFINANCIERO);
		cStmt.setObject(8, pPPCOMERCIAL);
		cStmt.setObject(9, pPTOMADOR);
		cStmt.setObject(10, pPFINICI);
		cStmt.setObject(11, pPFINAL);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_PREAVISOS__F_BUSCARECIBOS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPDOMICILIADOS,
			java.math.BigDecimal pPMEDIADOR, java.math.BigDecimal pPPFINANCIERO, java.math.BigDecimal pPPCOMERCIAL,
			java.math.BigDecimal pPTOMADOR, java.sql.Date pPFINICI, java.sql.Date pPFINAL) throws Exception {
		return this.callPAC_IAX_PREAVISOS__F_BUSCARECIBOS(pPCEMPRES, pPCRAMO, pPSPRODUC, pPDOMICILIADOS, pPMEDIADOR,
				pPPFINANCIERO, pPPCOMERCIAL, pPTOMADOR, pPFINICI, pPFINAL);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PREAVISOS.F_BUSCARECIBOS
	// --START-PAC_IAX_PREAVISOS.F_COMPRUEBAMEDIADOR(PMEDIADOR)
	private HashMap callPAC_IAX_PREAVISOS__F_COMPRUEBAMEDIADOR(java.math.BigDecimal pPMEDIADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_PREAVISOS.F_COMPRUEBAMEDIADOR(?, ?)}";

		logCall(callQuery, new String[] { "pPMEDIADOR" }, new Object[] { pPMEDIADOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPMEDIADOR);
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

	public HashMap ejecutaPAC_IAX_PREAVISOS__F_COMPRUEBAMEDIADOR(java.math.BigDecimal pPMEDIADOR) throws Exception {
		return this.callPAC_IAX_PREAVISOS__F_COMPRUEBAMEDIADOR(pPMEDIADOR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_PREAVISOS.F_COMPRUEBAMEDIADOR
	// --START-PAC_IAX_PREAVISOS.F_REALIZAPREAVISO(PLISTRECIBOS)
	private HashMap callPAC_IAX_PREAVISOS__F_REALIZAPREAVISO(String pPLISTRECIBOS) throws Exception {
		String callQuery = "{?=call PAC_IAX_PREAVISOS.F_REALIZAPREAVISO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPLISTRECIBOS" }, new Object[] { pPLISTRECIBOS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPLISTRECIBOS);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "OSPROCES"
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
			retVal.put("OSPROCES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OSPROCES", null);
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

	public HashMap ejecutaPAC_IAX_PREAVISOS__F_REALIZAPREAVISO(String pPLISTRECIBOS) throws Exception {
		return this.callPAC_IAX_PREAVISOS__F_REALIZAPREAVISO(pPLISTRECIBOS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_PREAVISOS.F_REALIZAPREAVISO
}