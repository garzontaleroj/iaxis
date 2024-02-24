//Revision:# 8Zf/S/CeFu1gg4r2QozZag== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GEDOX extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRODUCCION.class);
	private Connection conn = null;

	public PAC_IAX_GEDOX(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_GEDOX.F_GET_DOCUMMOV(PSSEGURO, PNMOVIMI)

	private HashMap callPAC_IAX_GEDOX__F_GET_DOCUMMOV(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GET_DOCUMMOV(?,?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_GET_DOCUMMOV(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI)
			throws Exception {
		return this.callPAC_IAX_GEDOX__F_GET_DOCUMMOV(pPSSEGURO, pPNMOVIMI);
	}
	// --END-PAC_IAX_GEDOX.F_GET_DOCUMMOV

	// --START-PAC_IAX_GEDOX.F_GET_DOCUMMOV_EXC(PSSEGURO, PNMOVIMI)
	private HashMap callPAC_IAX_GEDOX__F_GET_DOCUMMOV_EXC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GET_DOCUMMOV_EXC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_GEDOX__F_GET_DOCUMMOV_EXC(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_GEDOX__F_GET_DOCUMMOV_EXC(pPSSEGURO, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GEDOX.F_GET_DOCUMMOV_EXC

	// --START-PAC_IAX_GEDOX.F_GET_IDFICHERO()

	private HashMap callPAC_IAX_GEDOX__F_GET_IDFICHERO() throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GET_IDFICHERO(?,?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PID"
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
			retVal.put("PID", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PID", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_GET_IDFICHERO() throws Exception {
		return this.callPAC_IAX_GEDOX__F_GET_IDFICHERO();
	}
	// --END-PAC_IAX_GEDOX.F_GET_IDFICHERO

	// --START-PAC_IAX_GEDOX.F_GET_DIRECTORIO()

	private HashMap callPAC_IAX_GEDOX__F_GET_DIRECTORIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GET_DIRECTORIO(?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_GET_DIRECTORIO() throws Exception {
		return this.callPAC_IAX_GEDOX__F_GET_DIRECTORIO();
	}
	// --END-PAC_IAX_GEDOX.F_GET_DIRECTORIO

	// --START-PAC_IAX_GEDOX.F_SET_DOCUMMOVSEGGEDOX(PSSEGURO, PNMOVIMI, PTFILENAME,
	// PIDFICHERO, PTDESC, PIDCAT, PORIGEN)

	private HashMap callPAC_IAX_GEDOX__F_SET_DOCUMMOVSEGGEDOX(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, String pPTFILENAME, java.math.BigDecimal pPIDFICHERO, String pPTDESC,
			java.math.BigDecimal pPIDCAT, java.math.BigDecimal pPORIGEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_SET_DOCUMMOVSEGGEDOX(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSSEGURO", "pPNMOVIMI", "pPTFILENAME", "pPIDFICHERO", "pPTDESC", "pPIDCAT",
						"pPORIGEN" },
				new Object[] { pPSSEGURO, pPNMOVIMI, pPTFILENAME, pPIDFICHERO, pPTDESC, pPIDCAT, pPORIGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPTFILENAME);
		cStmt.setObject(5, pPIDFICHERO);
		cStmt.setObject(6, pPTDESC);
		cStmt.setObject(7, pPIDCAT);
		cStmt.setObject(8, pPORIGEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_SET_DOCUMMOVSEGGEDOX(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI, String pPTFILENAME, java.math.BigDecimal pPIDFICHERO, String pPTDESC,
			java.math.BigDecimal pPIDCAT, java.math.BigDecimal pPORIGEN) throws Exception {
		return this.callPAC_IAX_GEDOX__F_SET_DOCUMMOVSEGGEDOX(pPSSEGURO, pPNMOVIMI, pPTFILENAME, pPIDFICHERO, pPTDESC,
				pPIDCAT, pPORIGEN);
	}
	// --END-PAC_IAX_GEDOX.F_SET_DOCUMMOVSEGGEDOX
	// --START-PAC_IAX_GEDOX.F_SET_DOCUMSINISTRESGEDOX(PNSINIES, PNTRAMIT, PNDOCUME,
	// PTFILENAME, PIDFICHERO, PTDESC, PIDCAT, PORIGEN)

	private HashMap callPAC_IAX_GEDOX__F_SET_DOCUMSINISTRESGEDOX(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDOCUME, String pPTFILENAME,
			java.math.BigDecimal pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT, String pPORIGEN)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_SET_DOCUMSINISTRESGEDOX(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPNSINIES", "pPNTRAMIT", "pPNDOCUME", "pPTFILENAME", "pPIDFICHERO", "pPTDESC",
						"pPIDCAT", "pPORIGEN" },
				new Object[] { pPNSINIES, pPNTRAMIT, pPNDOCUME, pPTFILENAME, pPIDFICHERO, pPTDESC, pPIDCAT, pPORIGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
		cStmt.setObject(3, pPNTRAMIT);
		cStmt.setObject(4, pPNDOCUME);
		cStmt.setObject(5, pPTFILENAME);
		cStmt.setObject(6, pPIDFICHERO);
		cStmt.setObject(7, pPTDESC);
		cStmt.setObject(8, pPIDCAT);
		cStmt.setObject(9, pPORIGEN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_SET_DOCUMSINISTRESGEDOX(java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPNTRAMIT, java.math.BigDecimal pPNDOCUME, String pPTFILENAME,
			java.math.BigDecimal pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT, String pPORIGEN)
			throws Exception {
		return this.callPAC_IAX_GEDOX__F_SET_DOCUMSINISTRESGEDOX(pPNSINIES, pPNTRAMIT, pPNDOCUME, pPTFILENAME,
				pPIDFICHERO, pPTDESC, pPIDCAT, pPORIGEN);
	}
	// --END-PAC_IAX_GEDOX.F_SET_DOCUMSINISTRESGEDOX

	// --START-PAC_IAX_GEDOX.F_GET_CATEGOR()

	private HashMap callPAC_IAX_GEDOX__F_GET_CATEGOR() throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GET_CATEGOR(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_GET_CATEGOR() throws Exception {
		return this.callPAC_IAX_GEDOX__F_GET_CATEGOR();
	}
	// --END-PAC_IAX_GEDOX.F_GET_CATEGOR

	// --START-PAC_IAX_GEDOX.F_GET_DOCUMMOV_REQUERIDA(PSSEGURO, PNMOVIMI)

	private HashMap callPAC_IAX_GEDOX__F_GET_DOCUMMOV_REQUERIDA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GET_DOCUMMOV_REQUERIDA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNMOVIMI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_GET_DOCUMMOV_REQUERIDA(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_GEDOX__F_GET_DOCUMMOV_REQUERIDA(pPSSEGURO, pPNMOVIMI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GEDOX.F_GET_DOCUMMOV_REQUERIDA

	// --START-PAC_IAX_GEDOX.F_GET_TAMANOFIT(PIDGEDOX)

	private HashMap callPAC_IAX_GEDOX__F_GET_TAMANOFIT(java.math.BigDecimal pPIDGEDOX) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GET_TAMANOFIT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDGEDOX" }, new Object[] { pPIDGEDOX });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDGEDOX);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTAMANO"
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
			retVal.put("PTAMANO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTAMANO", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_GET_TAMANOFIT(java.math.BigDecimal pPIDGEDOX) throws Exception {
		return this.callPAC_IAX_GEDOX__F_GET_TAMANOFIT(pPIDGEDOX); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GEDOX.F_GET_TAMANOFIT

	// --START-PAC_IAX_GEDOX.F_SET_DOCUMGEDOX(PUSER, PTFILENAME, PIDFICHERO, PTDESC,
	// PIDCAT)
	private HashMap callPAC_IAX_GEDOX__F_SET_DOCUMGEDOX(String pPUSER, String pPTFILENAME,
			java.math.BigDecimal pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_SET_DOCUMGEDOX(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPUSER", "pPTFILENAME", "pPIDFICHERO", "pPTDESC", "pPIDCAT" },
				new Object[] { pPUSER, pPTFILENAME, pPIDFICHERO, pPTDESC, pPIDCAT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPUSER);
		cStmt.setObject(3, pPTFILENAME);
		cStmt.setObject(4, pPIDFICHERO);
		cStmt.setObject(5, pPTDESC);
		cStmt.setObject(6, pPIDCAT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PIDDOCGEDOX"
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
			retVal.put("PIDDOCGEDOX", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PIDDOCGEDOX", null);
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

	public HashMap ejecutaPAC_IAX_GEDOX__F_SET_DOCUMGEDOX(String pPUSER, String pPTFILENAME,
			java.math.BigDecimal pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
		return this.callPAC_IAX_GEDOX__F_SET_DOCUMGEDOX(pPUSER, pPTFILENAME, pPIDFICHERO, pPTDESC, pPIDCAT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GEDOX.F_SET_DOCUMGEDOX

	// --START-PAC_IAX_GEDOX.F_GEDOX_VERDOC(PIDDOC)

	private HashMap callPAC_IAX_GEDOX__F_GEDOX_VERDOC(java.math.BigDecimal pPIDDOC) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_GEDOX_VERDOC(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDDOC" }, new Object[] { pPIDDOC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDDOC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "OPTPATH"
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
			retVal.put("OPTPATH", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("OPTPATH", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GEDOX__F_GEDOX_VERDOC(java.math.BigDecimal pPIDDOC) throws Exception {
		return this.callPAC_IAX_GEDOX__F_GEDOX_VERDOC(pPIDDOC); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GEDOX.F_GEDOX_VERDOC

	// --START-PAC_IAX_GEDOX.F_SET_DOCUMMOVCOMPANIGEDOX(PCCOMPANI, PTFILENAME,
	// PIDFICHERO, PTDESC, PIDCAT)
	private HashMap callPAC_IAX_GEDOX__F_SET_DOCUMMOVCOMPANIGEDOX(java.math.BigDecimal pPCCOMPANI, String pPTFILENAME,
			String pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_SET_DOCUMMOVCOMPANIGEDOX(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPTFILENAME", "pPIDFICHERO", "pPTDESC", "pPIDCAT" },
				new Object[] { pPCCOMPANI, pPTFILENAME, pPIDFICHERO, pPTDESC, pPIDCAT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPTFILENAME);
		cStmt.setObject(4, pPIDFICHERO);
		cStmt.setObject(5, pPTDESC);
		cStmt.setObject(6, pPIDCAT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PIDFICHERO"
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
			retVal.put("PIDFICHERO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PIDFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_GEDOX__F_SET_DOCUMMOVCOMPANIGEDOX(java.math.BigDecimal pPCCOMPANI, String pPTFILENAME,
			String pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
		return this.callPAC_IAX_GEDOX__F_SET_DOCUMMOVCOMPANIGEDOX(pPCCOMPANI, pPTFILENAME, pPIDFICHERO, pPTDESC,
				pPIDCAT);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_GEDOX.F_SET_DOCUMMOVCOMPANIGEDOX
	// --START-PAC_IAX_GEDOX.F_SET_GCA_DOCGSFAVCLIS(PIDOBS, PTFILENAME, PIDFICHERO,
	// PTDESC, PIDCAT)
	private HashMap callPAC_IAX_GEDOX__F_SET_GCA_DOCGSFAVCLIS(java.math.BigDecimal pPIDOBS, String pPTFILENAME,
			String pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
		String callQuery = "{?=call PAC_IAX_GEDOX.F_SET_GCA_DOCGSFAVCLIS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPIDOBS", "pPTFILENAME", "pPIDFICHERO", "pPTDESC", "pPIDCAT" },
				new Object[] { pPIDOBS, pPTFILENAME, pPIDFICHERO, pPTDESC, pPIDCAT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPIDOBS);
		cStmt.setObject(3, pPTFILENAME);
		cStmt.setObject(4, pPIDFICHERO);
		cStmt.setObject(5, pPTDESC);
		cStmt.setObject(6, pPIDCAT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PIDFICHERO"
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
			retVal.put("PIDFICHERO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PIDFICHERO", null);
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

	public HashMap ejecutaPAC_IAX_GEDOX__F_SET_GCA_DOCGSFAVCLIS(java.math.BigDecimal pPIDOBS, String pPTFILENAME,
			String pPIDFICHERO, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
		return this.callPAC_IAX_GEDOX__F_SET_GCA_DOCGSFAVCLIS(pPIDOBS, pPTFILENAME, pPIDFICHERO, pPTDESC, pPIDCAT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GEDOX.F_SET_GCA_DOCGSFAVCLIS

}
