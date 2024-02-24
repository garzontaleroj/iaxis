package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GESTION_PROCESOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_GESTION_PROCESOS.class);
	private Connection conn = null;

	public PAC_IAX_GESTION_PROCESOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_GESTION_PROCESOS.F_GET_TABLA_INTERMEDIA(PSPROCES, PCPROCESO,
	// PNLINEA)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPNLINEA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_GET_TABLA_INTERMEDIA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES", "pPCPROCESO", "pPNLINEA" },
				new Object[] { pPSPROCES, pPCPROCESO, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCPROCESO);
		cStmt.setObject(4, pPNLINEA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_TABLA_PROCESOS".toUpperCase())); // Valor de "POBTABLAPROCESO"
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
			retVal.put("POBTABLAPROCESO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("POBTABLAPROCESO", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPNLINEA) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA(pPSPROCES, pPCPROCESO, pPNLINEA);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_GET_TABLA_INTERMEDIA

	private HashMap callPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA_TEXT(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPNLINEA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_GET_TABLA_INTERMEDIA_TEXT(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES", "pPCPROCESO", "pPNLINEA" },
				new Object[] { pPSPROCES, pPCPROCESO, pPNLINEA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCPROCESO);
		cStmt.setObject(4, pPNLINEA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PTEXTO"
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
			retVal.put("PTEXTO", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PTEXTO", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA_TEXT(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPNLINEA) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA_TEXT(pPSPROCES, pPCPROCESO, pPNLINEA);
	}

	// --START-PAC_IAX_GESTION_PROCESOS.F_SET_TABLA_INTERMEDIA(PSPROCES, PCPROCESO,
	// PNLINEA, PCOLUMNA, PVALOR)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_SET_TABLA_INTERMEDIA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPNLINEA, String pPCOLUMNA, String pPVALOR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_SET_TABLA_INTERMEDIA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES", "pPCPROCESO", "pPNLINEA", "pPCOLUMNA", "pPVALOR" },
				new Object[] { pPSPROCES, pPCPROCESO, pPNLINEA, pPCOLUMNA, pPVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPCPROCESO);
		cStmt.setObject(4, pPNLINEA);
		cStmt.setObject(5, pPCOLUMNA);
		cStmt.setObject(6, pPVALOR);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_TABLA_INTERMEDIA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPNLINEA, String pPCOLUMNA, String pPVALOR)
			throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_SET_TABLA_INTERMEDIA(pPSPROCES, pPCPROCESO, pPNLINEA, pPCOLUMNA,
				pPVALOR);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_SET_TABLA_INTERMEDIA

	// --START-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_CABECERA(PSPROCES,
	// PTFICHERO, PFINI, PFFIN, PCESTADO, PCPROCESOS, PCREFEXT)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERA(java.math.BigDecimal pPSPROCES,
			String pPTFICHERO, java.sql.Date pPFINI, java.sql.Date pPFFIN, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPROCESOS, String pPCREFEXT) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_CABECERA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPTFICHERO", "pPFINI", "pPFFIN", "pPCESTADO", "pPCPROCESOS", "pPCREFEXT" },
				new Object[] { pPSPROCES, pPTFICHERO, pPFINI, pPFFIN, pPCESTADO, pPCPROCESOS, pPCREFEXT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPTFICHERO);
		cStmt.setObject(4, pPFINI);
		cStmt.setObject(5, pPFFIN);
		cStmt.setObject(6, pPCESTADO);
		cStmt.setObject(7, pPCPROCESOS);
		cStmt.setObject(8, pPCREFEXT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCARGA"
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
			retVal.put("PCURCARGA", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("PCURCARGA", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERA(java.math.BigDecimal pPSPROCES,
			String pPTFICHERO, java.sql.Date pPFINI, java.sql.Date pPFFIN, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPROCESOS, String pPCREFEXT) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERA(pPSPROCES, pPTFICHERO, pPFINI, pPFFIN,
				pPCESTADO, pPCPROCESOS, pPCREFEXT);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_CABECERA

	// --START-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_LINEA(PSPROCES, PNLINEA,
	// PCTIPO, PVALOR, PIDINT, PIDEXT, PCESTADO, PCREVISADO)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCTIPO, String pPVALOR, String pPIDINT, String pPIDEXT,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCREVISADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_LINEA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPNLINEA", "pPCTIPO", "pPVALOR", "pPIDINT", "pPIDEXT", "pPCESTADO",
						"pPCREVISADO" },
				new Object[] { pPSPROCES, pPNLINEA, pPCTIPO, pPVALOR, pPIDINT, pPIDEXT, pPCESTADO, pPCREVISADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPNLINEA);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPVALOR);
		cStmt.setObject(6, pPIDINT);
		cStmt.setObject(7, pPIDEXT);
		cStmt.setObject(8, pPCESTADO);
		cStmt.setObject(9, pPCREVISADO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCARGALINEA"
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
			retVal.put("PCURCARGALINEA", cStmt.getObject(10));
		} catch (SQLException e) {
			retVal.put("PCURCARGALINEA", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCTIPO, String pPVALOR, String pPIDINT, String pPIDEXT,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCREVISADO) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA(pPSPROCES, pPNLINEA, pPCTIPO, pPVALOR, pPIDINT,
				pPIDEXT, pPCESTADO, pPCREVISADO);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_LINEA

	// --START-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_LINEA_ERROR(PSPROCES,
	// PNLINEA, PNERROR)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA_ERROR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPNERROR) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_LINEA_ERROR(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES", "pPNLINEA", "pPNERROR" },
				new Object[] { pPSPROCES, pPNLINEA, pPNERROR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPNLINEA);
		cStmt.setObject(4, pPNERROR);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCARGALINEA_ERRS"
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
			retVal.put("PCURCARGALINEA_ERRS", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCURCARGALINEA_ERRS", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA_ERROR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPNERROR) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA_ERROR(pPSPROCES, pPNLINEA, pPNERROR);
	}

	// --END-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_CTRL_LINEA_ERROR
	// --START-PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_CABECERA(PSPROCES,
	// PTFICHERO, PFINI, PFFIN, PCESTADO, PCPROCESO, PCERROR, PTERROR)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_CABECERA(java.math.BigDecimal pPSPROCES,
			String pPTFICHERO, java.sql.Date pPFINI, java.sql.Date pPFFIN, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPCERROR, String pPTERROR) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_CABECERA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPTFICHERO", "pPFINI", "pPFFIN", "pPCESTADO", "pPCPROCESO", "pPCERROR",
						"pPTERROR" },
				new Object[] { pPSPROCES, pPTFICHERO, pPFINI, pPFFIN, pPCESTADO, pPCPROCESO, pPCERROR, pPTERROR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPTFICHERO);
		cStmt.setObject(4, pPFINI);
		cStmt.setObject(5, pPFFIN);
		cStmt.setObject(6, pPCESTADO);
		cStmt.setObject(7, pPCPROCESO);
		cStmt.setObject(8, pPCERROR);
		cStmt.setObject(9, pPTERROR);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_CABECERA(java.math.BigDecimal pPSPROCES,
			String pPTFICHERO, java.sql.Date pPFINI, java.sql.Date pPFFIN, java.math.BigDecimal pPCESTADO,
			java.math.BigDecimal pPCPROCESO, java.math.BigDecimal pPCERROR, String pPTERROR) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_CABECERA(pPSPROCES, pPTFICHERO, pPFINI, pPFFIN,
				pPCESTADO, pPCPROCESO, pPCERROR, pPTERROR);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_CABECERA

	// --START-PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_LINEA(PSPROCES, PNLINEA,
	// PCTIPO, PIDINT, PIDEXT, PCESTADO, PCVALIDADO, PSSEGURO, PNSINIES, PNTRAMIT,
	// PSPERSON, PNRECIBO)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_LINEA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCTIPO, String pPIDINT, String pPIDEXT,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCVALIDADO, java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_LINEA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPROCES", "pPNLINEA", "pPCTIPO", "pPIDINT", "pPIDEXT", "pPCESTADO", "pPCVALIDADO",
						"pPSSEGURO", "pPNSINIES", "pPNTRAMIT", "pPSPERSON", "pPNRECIBO" },
				new Object[] { pPSPROCES, pPNLINEA, pPCTIPO, pPIDINT, pPIDEXT, pPCESTADO, pPCVALIDADO, pPSSEGURO,
						pPNSINIES, pPNTRAMIT, pPSPERSON, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPNLINEA);
		cStmt.setObject(4, pPCTIPO);
		cStmt.setObject(5, pPIDINT);
		cStmt.setObject(6, pPIDEXT);
		cStmt.setObject(7, pPCESTADO);
		cStmt.setObject(8, pPCVALIDADO);
		cStmt.setObject(9, pPSSEGURO);
		cStmt.setObject(10, pPNSINIES);
		cStmt.setObject(11, pPNTRAMIT);
		cStmt.setObject(12, pPSPERSON);
		cStmt.setObject(13, pPNRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(14));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_LINEA(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCTIPO, String pPIDINT, String pPIDEXT,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCVALIDADO, java.math.BigDecimal pPSSEGURO,
			String pPNSINIES, java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_LINEA(pPSPROCES, pPNLINEA, pPCTIPO, pPIDINT, pPIDEXT,
				pPCESTADO, pPCVALIDADO, pPSSEGURO, pPNSINIES, pPNTRAMIT, pPSPERSON, pPNRECIBO);
	}

	// --END-PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_LINEA
	// --START-PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_LINEA_ERROR(PSPROCES,
	// PNLINEA, PNERROR, PCTIPO, PCERROR, PTMENSAJE)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_LINEA_ERROR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPNERROR, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCERROR, String pPTMENSAJE) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_LINEA_ERROR(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES", "pPNLINEA", "pPNERROR", "pPCTIPO", "pPCERROR", "pPTMENSAJE" },
				new Object[] { pPSPROCES, pPNLINEA, pPNERROR, pPCTIPO, pPCERROR, pPTMENSAJE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPNLINEA);
		cStmt.setObject(4, pPNERROR);
		cStmt.setObject(5, pPCTIPO);
		cStmt.setObject(6, pPCERROR);
		cStmt.setObject(7, pPTMENSAJE);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_LINEA_ERROR(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPNERROR, java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCERROR, String pPTMENSAJE) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_SET_CARGA_CTRL_LINEA_ERROR(pPSPROCES, pPNLINEA, pPNERROR, pPCTIPO,
				pPCERROR, pPTMENSAJE);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_SET_CARGA_CTRL_LINEA_ERROR

	// --START-PAC_IAX_GESTION_PROCESOS.F_SET_CESTADO_LINEAPROCESO(PSPROCES,
	// PNLINEA, PCESTADO)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_SET_CESTADO_LINEAPROCESO(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_SET_CESTADO_LINEAPROCESO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPROCES", "pPNLINEA", "pPCESTADO" },
				new Object[] { pPSPROCES, pPNLINEA, pPCESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPROCES);
		cStmt.setObject(3, pPNLINEA);
		cStmt.setObject(4, pPCESTADO);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_CESTADO_LINEAPROCESO(java.math.BigDecimal pPSPROCES,
			java.math.BigDecimal pPNLINEA, java.math.BigDecimal pPCESTADO) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_SET_CESTADO_LINEAPROCESO(pPSPROCES, pPNLINEA, pPCESTADO);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_SET_CESTADO_LINEAPROCESO

	// --START-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_FICHERO(PCTIPO, PCCOMPANI,
	// PSSEGURO, PNSINIES, PNRECIBO)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_FICHERO(java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSSEGURO, String pPNSINIES,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_FICHERO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPO", "pPCCOMPANI", "pPSSEGURO", "pPNSINIES", "pPNRECIBO" },
				new Object[] { pPCTIPO, pPCCOMPANI, pPSSEGURO, pPNSINIES, pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPO);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPNSINIES);
		cStmt.setObject(6, pPNRECIBO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCURCARGA"
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
			retVal.put("PCURCARGA", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PCURCARGA", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_FICHERO(java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSSEGURO, String pPNSINIES,
			java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_FICHERO(pPCTIPO, pPCCOMPANI, pPSSEGURO, pPNSINIES,
				pPNRECIBO);
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_GET_CARGA_FICHERO

	// --START-PAC_IAX_GESTION_PROCESOS.F_GET_FICHEROS(PCEMPRES, PSPROCES,
	// PCPROCESO)
	private HashMap callPAC_IAX_GESTION_PROCESOS__F_GET_FICHEROS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCPROCESO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GESTION_PROCESOS.F_GET_FICHEROS(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSPROCES", "pPCPROCESO" },
				new Object[] { pPCEMPRES, pPSPROCES, pPCPROCESO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSPROCES);
		cStmt.setObject(4, pPCPROCESO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_IMPRESION".toUpperCase())); // Valor de "VTIMP"
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
			retVal.put("VTIMP", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("VTIMP", null);
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

	public HashMap ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_FICHEROS(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCPROCESO) throws Exception {
		return this.callPAC_IAX_GESTION_PROCESOS__F_GET_FICHEROS(pPCEMPRES, pPSPROCES, pPCPROCESO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GESTION_PROCESOS.F_GET_FICHEROS

}
