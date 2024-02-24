
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MNTPREGUNPROD extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MNTPREGUNPROD.class);
	private Connection conn = null;

	public PAC_IAX_MNTPREGUNPROD(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MNTPREGUNPROD.F_GET_PREGUNTAS(PTPREGUN, PCIDIOMA)
	private HashMap callPAC_IAX_MNTPREGUNPROD__F_GET_PREGUNTAS(String pPTPREGUN, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPREGUNPROD.F_GET_PREGUNTAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTPREGUN", "pPCIDIOMA" }, new Object[] { pPTPREGUN, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTPREGUN);
		cStmt.setObject(3, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_PREGUNTAS(String pPTPREGUN, java.math.BigDecimal pPCIDIOMA)
			throws Exception {
		return this.callPAC_IAX_MNTPREGUNPROD__F_GET_PREGUNTAS(pPTPREGUN, pPCIDIOMA);
	}
	// --END-PAC_IAX_MNTPREGUNPROD.F_GET_PREGUNTAS

	// --START-PAC_IAX_MNTPREGUNPROD.F_GET_DESCPREGUN(PCPREGUN, PTABLA, PSPRODUC,
	// PCACTIVI, PCGARANT, PCIDIOMA)
	private HashMap callPAC_IAX_MNTPREGUNPROD__F_GET_DESCPREGUN(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPREGUNPROD.F_GET_DESCPREGUN(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPREGUN", "pPTABLA", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCIDIOMA" },
				new Object[] { pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.setObject(3, pPTABLA);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(8, java.sql.Types.NUMERIC); // Valor de "PCTIPPRE"
		cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "PDESCPREG"
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
			retVal.put("PCTIPPRE", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PCTIPPRE", null);
		}
		try {
			retVal.put("PDESCPREG", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PDESCPREG", null);
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

	public HashMap ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_DESCPREGUN(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_MNTPREGUNPROD__F_GET_DESCPREGUN(pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT,
				pPCIDIOMA);
	}
	// --END-PAC_IAX_MNTPREGUNPROD.F_GET_DESCPREGUN

	// --START-PAC_IAX_MNTPREGUNPROD.F_GET_LISTRESPUE(PCPREGUN, PCTIPPRE, PCIDIOMA)
	private HashMap callPAC_IAX_MNTPREGUNPROD__F_GET_LISTRESPUE(java.math.BigDecimal pPCPREGUN,
			java.math.BigDecimal pPCTIPPRE, java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPREGUNPROD.F_GET_LISTRESPUE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPREGUN", "pPCTIPPRE", "pPCIDIOMA" },
				new Object[] { pPCPREGUN, pPCTIPPRE, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.setObject(3, pPCTIPPRE);
		cStmt.setObject(4, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_LISTRESPUE(java.math.BigDecimal pPCPREGUN,
			java.math.BigDecimal pPCTIPPRE, java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_MNTPREGUNPROD__F_GET_LISTRESPUE(pPCPREGUN, pPCTIPPRE, pPCIDIOMA);
	}
	// --END-PAC_IAX_MNTPREGUNPROD.F_GET_LISTRESPUE

	// --START-PAC_IAX_MNTPREGUNPROD.F_SET_PREGUNTA(PCPREGUN, PTABLA, PSPRODUC,
	// PCACTIVI, PCGARANT, PCPRETIP, PNPREORD, PTPREFOR, PCPREOBL, PNPREIMP,
	// PCRESDEF, PCOFERSN, PTVALFOR, PCMODO, PCNIVEL, PCTARPOL, PCVISIBLE,
	// PCESCCERO, PCVISIBLECOL, PCVISIBLECERT, PCRECARG)
	private HashMap callPAC_IAX_MNTPREGUNPROD__F_SET_PREGUNTA(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCPRETIP, java.math.BigDecimal pPNPREORD, String pPTPREFOR,
			java.math.BigDecimal pPCPREOBL, java.math.BigDecimal pPNPREIMP, java.math.BigDecimal pPCRESDEF,
			java.math.BigDecimal pPCOFERSN, String pPTVALFOR, java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCNIVEL, java.math.BigDecimal pPCTARPOL, java.math.BigDecimal pPCVISIBLE,
			java.math.BigDecimal pPCESCCERO, java.math.BigDecimal pPCVISIBLECOL, java.math.BigDecimal pPCVISIBLECERT,
			java.math.BigDecimal pPCRECARG) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPREGUNPROD.F_SET_PREGUNTA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPREGUN", "pPTABLA", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCPRETIP",
				"pPNPREORD", "pPTPREFOR", "pPCPREOBL", "pPNPREIMP", "pPCRESDEF", "pPCOFERSN", "pPTVALFOR", "pPCMODO",
				"pPCNIVEL", "pPCTARPOL", "pPCVISIBLE", "pPCESCCERO", "pPCVISIBLECOL", "pPCVISIBLECERT", "pPCRECARG" },
				new Object[] { pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCPRETIP, pPNPREORD, pPTPREFOR,
						pPCPREOBL, pPNPREIMP, pPCRESDEF, pPCOFERSN, pPTVALFOR, pPCMODO, pPCNIVEL, pPCTARPOL, pPCVISIBLE,
						pPCESCCERO, pPCVISIBLECOL, pPCVISIBLECERT, pPCRECARG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.setObject(3, pPTABLA);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPCGARANT);
		cStmt.setObject(7, pPCPRETIP);
		cStmt.setObject(8, pPNPREORD);
		cStmt.setObject(9, pPTPREFOR);
		cStmt.setObject(10, pPCPREOBL);
		cStmt.setObject(11, pPNPREIMP);
		cStmt.setObject(12, pPCRESDEF);
		cStmt.setObject(13, pPCOFERSN);
		cStmt.setObject(14, pPTVALFOR);
		cStmt.setObject(15, pPCMODO);
		cStmt.setObject(16, pPCNIVEL);
		cStmt.setObject(17, pPCTARPOL);
		cStmt.setObject(18, pPCVISIBLE);
		cStmt.setObject(19, pPCESCCERO);
		cStmt.setObject(20, pPCVISIBLECOL);
		cStmt.setObject(21, pPCVISIBLECERT);
		cStmt.setObject(22, pPCRECARG);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(23, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_MNTPREGUNPROD__F_SET_PREGUNTA(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCPRETIP, java.math.BigDecimal pPNPREORD, String pPTPREFOR,
			java.math.BigDecimal pPCPREOBL, java.math.BigDecimal pPNPREIMP, java.math.BigDecimal pPCRESDEF,
			java.math.BigDecimal pPCOFERSN, String pPTVALFOR, java.math.BigDecimal pPCMODO,
			java.math.BigDecimal pPCNIVEL, java.math.BigDecimal pPCTARPOL, java.math.BigDecimal pPCVISIBLE,
			java.math.BigDecimal pPCESCCERO, java.math.BigDecimal pPCVISIBLECOL, java.math.BigDecimal pPCVISIBLECERT,
			java.math.BigDecimal pPCRECARG) throws Exception {
		return this.callPAC_IAX_MNTPREGUNPROD__F_SET_PREGUNTA(pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT,
				pPCPRETIP, pPNPREORD, pPTPREFOR, pPCPREOBL, pPNPREIMP, pPCRESDEF, pPCOFERSN, pPTVALFOR, pPCMODO,
				pPCNIVEL, pPCTARPOL, pPCVISIBLE, pPCESCCERO, pPCVISIBLECOL, pPCVISIBLECERT, pPCRECARG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPREGUNPROD.F_SET_PREGUNTA

	// --START-PAC_IAX_MNTPREGUNPROD.F_GET_PREGUNTA(PCPREGUN, PTABLA, PSPRODUC,
	// PCACTIVI, PCGARANT)
	private HashMap callPAC_IAX_MNTPREGUNPROD__F_GET_PREGUNTA(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPREGUNPROD.F_GET_PREGUNTA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPREGUN", "pPTABLA", "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.setObject(3, pPTABLA);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODPREGUNTAS".toUpperCase())); // Valor de "PROPREGUNTAS"
		cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODPREGUNACTI".toUpperCase())); // Valor de "PACTPREGUNTAS"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_PRODPREGUNPROGARAN".toUpperCase())); // Valor de "PGARPREGUNTAS"
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
			retVal.put("PROPREGUNTAS", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PROPREGUNTAS", null);
		}
		try {
			retVal.put("PACTPREGUNTAS", cStmt.getObject(8));
		} catch (SQLException e) {
			retVal.put("PACTPREGUNTAS", null);
		}
		try {
			retVal.put("PGARPREGUNTAS", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PGARPREGUNTAS", null);
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

	public HashMap ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_PREGUNTA(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAX_MNTPREGUNPROD__F_GET_PREGUNTA(pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTPREGUNPROD.F_GET_PREGUNTA

	// --START-PAC_IAX_MNTPREGUNPROD.F_DEL_PREGUNTA(PCPREGUN, PTABLA, PSPRODUC,
	// PCACTIVI, PCGARANT)
	private HashMap callPAC_IAX_MNTPREGUNPROD__F_DEL_PREGUNTA(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTPREGUNPROD.F_DEL_PREGUNTA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPREGUN", "pPTABLA", "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.setObject(3, pPTABLA);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.setObject(6, pPCGARANT);
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

	public HashMap ejecutaPAC_IAX_MNTPREGUNPROD__F_DEL_PREGUNTA(java.math.BigDecimal pPCPREGUN, String pPTABLA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAX_MNTPREGUNPROD__F_DEL_PREGUNTA(pPCPREGUN, pPTABLA, pPSPRODUC, pPCACTIVI, pPCGARANT);
	}
	// --END-PAC_IAX_MNTPREGUNPROD.F_DEL_PREGUNTA

}
