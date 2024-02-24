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

public class PAC_IAXPAR_PRODUCTOS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAXPAR_PRODUCTOS.class);
	private Connection conn = null;

	public PAC_IAXPAR_PRODUCTOS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_ACTIVIDADES()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_ACTIVIDADES() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_ACTIVIDADES(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_ACTIVIDADES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_ACTIVIDADES() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_ACTIVIDADES();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_ACTIVIDADES
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CAUSAANULPOL(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CAUSAANULPOL(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CAUSAANULPOL(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CAUSAANULPOL(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CAUSAANULPOL(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CAUSAANULPOL
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CAUSASINI(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CAUSASINI(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CAUSASINI(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CAUSASINI(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CAUSASINI(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CAUSASINI
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CLAUBENEFI()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CLAUBENEFI() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CLAUBENEFI(?)}";
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUBENEFI() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CLAUBENEFI();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CLAUBENEFI
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CLAUSULAS()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULAS() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CLAUSULAS(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULAS() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULAS();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CLAUSULAS
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DATOSRIESGOS()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DATOSRIESGOS() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DATOSRIESGOS(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_PREGUNTAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DATOSRIESGOS() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DATOSRIESGOS();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DATOSRIESGOS
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DEFPRODUCTO(SPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(java.math.BigDecimal pSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DEFPRODUCTO(?,?)}";
		logCall(callQuery, new String[] { "pSPRODUC" }, new Object[] { pSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAXPAR_PRODUCTOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(java.math.BigDecimal pSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(pSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DEFPRODUCTO
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULA(SCLAGEN)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(java.math.BigDecimal pSCLAGEN) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULA(?,?)}";
		logCall(callQuery, new String[] { "pSCLAGEN" }, new Object[] { pSCLAGEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLAGEN);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(java.math.BigDecimal pSCLAGEN) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(pSCLAGEN);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULA
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULAPARMULT(PSCLABEN, PNORDCLA,
	// SSEGURO)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPARMULT(java.math.BigDecimal pPSCLABEN,
			java.math.BigDecimal pPNORDCLA, java.math.BigDecimal pSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULAPARMULT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCLABEN", "pPNORDCLA", "pSSEGURO" },
				new Object[] { pPSCLABEN, pPNORDCLA, pSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLABEN);
		cStmt.setObject(3, pPNORDCLA);
		cStmt.setObject(4, pSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPARMULT(java.math.BigDecimal pPSCLABEN,
			java.math.BigDecimal pPNORDCLA, java.math.BigDecimal pSSEGURO) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPARMULT(pPSCLABEN, pPNORDCLA, pSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULAPARMULT

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULABEN(SCLABEN)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULABEN(java.math.BigDecimal pSCLABEN) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULABEN(?,?)}";
		logCall(callQuery, new String[] { "pSCLABEN" }, new Object[] { pSCLABEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSCLABEN);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULABEN(java.math.BigDecimal pSCLABEN) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULABEN(pSCLABEN);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULABEN
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DESCGARANT(CGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DESCGARANT(java.math.BigDecimal pCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DESCGARANT(?,?)}";
		logCall(callQuery, new String[] { "pCGARANT" }, new Object[] { pCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCGARANT(java.math.BigDecimal pCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DESCGARANT(pCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DESCGARANT
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DESCPREGUN(PCPREGUN)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DESCPREGUN(java.math.BigDecimal pPCPREGUN) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DESCPREGUN(?,?)}";
		logCall(callQuery, new String[] { "pPCPREGUN" }, new Object[] { pPCPREGUN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPREGUN(java.math.BigDecimal pPCPREGUN) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DESCPREGUN(pPCPREGUN);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DESCPREGUN
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DESCPRODUCTO(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DESCPRODUCTO(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DESCPRODUCTO
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DOCUMNECALTA(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DOCUMNECALTA(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DOCUMNECALTA(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DOCUMNECALTA(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DOCUMNECALTA(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DOCUMNECALTA
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_FORMAPAGO()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_FORMAPAGO(?)}";
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_FORMAPAGO
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_FRANQUICIASGAR(CGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_FRANQUICIASGAR(java.math.BigDecimal pCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_FRANQUICIASGAR(?,?)}";
		logCall(callQuery, new String[] { "pCGARANT" }, new Object[] { pCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_FRANQUICIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FRANQUICIASGAR(java.math.BigDecimal pCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_FRANQUICIASGAR(pCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_FRANQUICIASGAR
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_GARANPROCAP(PCGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_GARANPROCAP(java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_GARANPROCAP(?,?)}";
		logCall(callQuery, new String[] { "pPCGARANT" }, new Object[] { pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_GARANPROCAP".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_GARANPROCAP(java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_GARANPROCAP(pPCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_GARANPROCAP
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_GARANTIAS(PNRIESGO)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_GARANTIAS(java.math.BigDecimal pPNRIESGO) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_GARANTIAS(?, ?)}";

		logCall(callQuery, new String[] { "pPNRIESGO" }, new Object[] { pPNRIESGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_GARANTIAS(java.math.BigDecimal pPNRIESGO) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_GARANTIAS(pPNRIESGO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_GARANTIAS

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_INCOMPGARAN(PCGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_INCOMPGARAN(java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_INCOMPGARAN(?,?)}";
		logCall(callQuery, new String[] { "pPCGARANT" }, new Object[] { pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_INCOMPGARAN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_INCOMPGARAN(java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_INCOMPGARAN(pPCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_INCOMPGARAN
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_LSTACTIVIDADES(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_LSTACTIVIDADES(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_LSTACTIVIDADES(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_ACTIVIDADES".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_LSTACTIVIDADES(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_LSTACTIVIDADES(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_LSTACTIVIDADES
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_LSTGARANTIAS(PSPRODUC, PCACTIVI)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_LSTGARANTIAS(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI" }, new Object[] { pPSPRODUC, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_GARANTIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIAS(pPSPRODUC, pPCACTIVI);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_LSTGARANTIAS
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_MOTIVOSSINI(PCCAUSIN, PCRAMO)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_MOTIVOSSINI(java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_MOTIVOSSINI(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCCAUSIN" }, new Object[] { pPSPRODUC, pPCCAUSIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCCAUSIN);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MOTIVOSSINI(java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_MOTIVOSSINI(pPCCAUSIN, pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_MOTIVOSSINI
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PARGARANTIA(CLAVE, PSPRODUC, PGARANT,
	// PCACTIVI)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PARGARANTIA(String pCLAVE, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPGARANT, java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PARGARANTIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCLAVE", "pPSPRODUC", "pPGARANT", "pPCACTIVI" },
				new Object[] { pCLAVE, pPSPRODUC, pPGARANT, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPGARANT);
		cStmt.setObject(5, pPCACTIVI);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARGARANTIA(String pCLAVE, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPGARANT, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PARGARANTIA(pCLAVE, pPSPRODUC, pPGARANT, pPCACTIVI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PARGARANTIA

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PARPRODUCTO(CLAVE, PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO(String pCLAVE, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PARPRODUCTO(?,?)}";
		logCall(callQuery, new String[] { "pCLAVE", "pPSPRODUC" }, new Object[] { pCLAVE, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO(String pCLAVE, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO(pCLAVE, pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PARPRODUCTO
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PERREVISION(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PERREVISION(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PERREVISION(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PERREVISION(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PERREVISION(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PERREVISION
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PREGGARANT(CGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PREGGARANT(java.math.BigDecimal pCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PREGGARANT(?,?)}";
		logCall(callQuery, new String[] { "pCGARANT" }, new Object[] { pCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_PREGUNTAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGGARANT(java.math.BigDecimal pCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PREGGARANT(pCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PREGGARANT
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PREGPOLIZA()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PREGPOLIZA() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PREGPOLIZA(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_PREGUNTAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGPOLIZA() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PREGPOLIZA();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PREGPOLIZA
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PREGTIPPRE(PCPREGUN)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PREGTIPPRE(java.math.BigDecimal pPCPREGUN) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PREGTIPPRE(?,?)}";
		logCall(callQuery, new String[] { "pPCPREGUN" }, new Object[] { pPCPREGUN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGTIPPRE(java.math.BigDecimal pPCPREGUN) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PREGTIPPRE(pPCPREGUN);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PREGTIPPRE
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PREGUNAUTOMATICA(PCPREGUN, TIPO, PCACTIVI,
	// PCGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PREGUNAUTOMATICA(java.math.BigDecimal pPCPREGUN, String pTIPO,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PREGUNAUTOMATICA(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCPREGUN", "pTIPO", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPCPREGUN, pTIPO, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.setObject(3, pTIPO);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGUNAUTOMATICA(java.math.BigDecimal pPCPREGUN, String pTIPO,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PREGUNAUTOMATICA(pPCPREGUN, pTIPO, pPCACTIVI, pPCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PREGUNAUTOMATICA
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PREGUNRESPUE(PCPREGUN, PCRESPUE)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PREGUNRESPUE(java.math.BigDecimal pPCPREGUN,
			java.math.BigDecimal pPCRESPUE) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PREGUNRESPUE(?,?,?)}";
		logCall(callQuery, new String[] { "pPCPREGUN", "pPCRESPUE" }, new Object[] { pPCPREGUN, pPCRESPUE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPREGUN);
		cStmt.setObject(3, pPCRESPUE);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGUNRESPUE(java.math.BigDecimal pPCPREGUN,
			java.math.BigDecimal pPCRESPUE) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PREGUNRESPUE(pPCPREGUN, pPCRESPUE);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PREGUNRESPUE
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PRODTIENEPREG(NIVELPREG, PCGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PRODTIENEPREG(String pNIVELPREG, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PRODTIENEPREG(?,?,?)}";
		logCall(callQuery, new String[] { "pNIVELPREG", "pPCGARANT" }, new Object[] { pNIVELPREG, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNIVELPREG);
		cStmt.setObject(4, pPCGARANT);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PRODTIENEPREG(String pNIVELPREG, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PRODTIENEPREG(pNIVELPREG, pPCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PRODTIENEPREG
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_PRODUCTO(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_PRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_PRODUCTO(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAXPAR_PRODUCTOS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_PRODUCTO(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_PRODUCTO
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_SUBTIPOPROD(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_SUBTIPOPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_SUBTIPOPROD(?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_SUBTIPOPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_SUBTIPOPROD(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_SUBTIPOPROD
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_TIPDURACION()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_TIPDURACION() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_TIPDURACION(?)}";
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPDURACION() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_TIPDURACION();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_TIPDURACION
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_TIPGAR(PCGARANT, PSPRODUC, MENSAJES)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_TIPGAR(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSPRODUC, Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_TIPGAR(?,?,?)}";
		logCall(callQuery, new String[] { "pPCGARANT", "pPSPRODUC", "pMENSAJES" },
				new Object[] { pPCGARANT, pPSPRODUC, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pMENSAJES);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPGAR(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPSPRODUC, Object pMENSAJES) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_TIPGAR(pPCGARANT, pPSPRODUC, pMENSAJES);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_TIPGAR
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_TIPREVAL(P_SPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_TIPREVAL(java.math.BigDecimal pP_SPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_TIPREVAL(?, ?)}";

		logCall(callQuery, new String[] { "pP_SPRODUC" }, new Object[] { pP_SPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_SPRODUC);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPREVAL(java.math.BigDecimal pP_SPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_TIPREVAL(pP_SPRODUC);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_TIPREVAL

	// --START-PAC_IAXPAR_PRODUCTOS.F_INICIALIZA(SPRODUC, CMODALI, CEMPRES, CIDIOMA,
	// CCOLECT, CRAMO, CTIPSEG)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_INICIALIZA(java.math.BigDecimal pSPRODUC, java.math.BigDecimal pCMODALI,
			java.math.BigDecimal pCEMPRES, java.math.BigDecimal pCIDIOMA, java.math.BigDecimal pCCOLECT,
			java.math.BigDecimal pCRAMO, java.math.BigDecimal pCTIPSEG) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_INICIALIZA(?,?,?,?,?,?,?,?)}";
		logCall(callQuery,
				new String[] { "pSPRODUC", "pCMODALI", "pCEMPRES", "pCIDIOMA", "pCCOLECT", "pCRAMO", "pCTIPSEG" },
				new Object[] { pSPRODUC, pCMODALI, pCEMPRES, pCIDIOMA, pCCOLECT, pCRAMO, pCTIPSEG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPRODUC);
		cStmt.setObject(3, pCMODALI);
		cStmt.setObject(4, pCEMPRES);
		cStmt.setObject(5, pCIDIOMA);
		cStmt.setObject(6, pCCOLECT);
		cStmt.setObject(7, pCRAMO);
		cStmt.setObject(8, pCTIPSEG);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_INICIALIZA(java.math.BigDecimal pSPRODUC,
			java.math.BigDecimal pCMODALI, java.math.BigDecimal pCEMPRES, java.math.BigDecimal pCIDIOMA,
			java.math.BigDecimal pCCOLECT, java.math.BigDecimal pCRAMO, java.math.BigDecimal pCTIPSEG)
			throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_INICIALIZA(pSPRODUC, pCMODALI, pCEMPRES, pCIDIOMA, pCCOLECT, pCRAMO,
				pCTIPSEG);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_INICIALIZA
	// --START-PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTIASEG()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTIASEG()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTIASEG
	// --START-PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTIRIESGOS()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIRIESGOS() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTIRIESGOS()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIRIESGOS() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIRIESGOS();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTIRIESGOS
	// --START-PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTITOMADOR()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTITOMADOR() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTITOMADOR()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTITOMADOR() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTITOMADOR();
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_PERMITIRMULTITOMADOR

	// --START-PAC_IAXPAR_PRODUCTOS.F_PERMITIRREVALGAR(PCGARANT, PCREVALIPOL,
	// PPREVALIPOL, PIREVALIPOL)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALGAR(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCREVALIPOL, java.math.BigDecimal pPPREVALIPOL, java.math.BigDecimal pPIREVALIPOL)
			throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_PERMITIRREVALGAR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCGARANT", "pPCREVALIPOL", "pPPREVALIPOL", "pPIREVALIPOL" },
				new Object[] { pPCGARANT, pPCREVALIPOL, pPPREVALIPOL, pPIREVALIPOL });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
		cStmt.setObject(3, pPCREVALIPOL);
		cStmt.setObject(4, pPPREVALIPOL);
		cStmt.setObject(5, pPIREVALIPOL);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALGAR(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCREVALIPOL, java.math.BigDecimal pPPREVALIPOL, java.math.BigDecimal pPIREVALIPOL)
			throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALGAR(pPCGARANT, pPCREVALIPOL, pPPREVALIPOL, pPIREVALIPOL);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_PERMITIRREVALGAR

	// --START-PAC_IAXPAR_PRODUCTOS.F_PERMITIRREVALPROD()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALPROD() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_PERMITIRREVALPROD()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALPROD() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALPROD();
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_PERMITIRREVALPROD
	// --START-PAC_IAXPAR_PRODUCTOS.GET_ANYOSRENTASIRREG(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__GET_ANYOSRENTASIRREG(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.GET_ANYOSRENTASIRREG(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__GET_ANYOSRENTASIRREG(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__GET_ANYOSRENTASIRREG(pPSPRODUC);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.GET_ANYOSRENTASIRREG
	// --START-PAC_IAXPAR_PRODUCTOS.GET_FORPAGREN(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__GET_FORPAGREN(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.GET_FORPAGREN(?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__GET_FORPAGREN(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__GET_FORPAGREN(pPSPRODUC);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.GET_FORPAGREN

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_IDENTPROD(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_IDENTPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_IDENTPROD(?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCRAMO"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PCMODALI"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCTIPSEG"
		cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PCCOLECT"
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
			retVal.put("PCRAMO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCRAMO", null);
		}
		try {
			retVal.put("PCMODALI", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCMODALI", null);
		}
		try {
			retVal.put("PCTIPSEG", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PCTIPSEG", null);
		}
		try {
			retVal.put("PCCOLECT", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PCCOLECT", null);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_IDENTPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_IDENTPROD(pPSPRODUC);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_IDENTPROD

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_LSTGARANTIASDEP(PSPRODUC, PCACTIVI,
	// PCGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIASDEP(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_LSTGARANTIASDEP(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCGARANT);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIASDEP(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIASDEP(pPSPRODUC, pPCACTIVI, pPCGARANT);
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_LSTGARANTIASDEP
	// --START-PAC_IAXPAR_PRODUCTOS.P_REVALPROD()
	private HashMap callPAC_IAXPAR_PRODUCTOS__P_REVALPROD() throws Exception {
		String callQuery = "{call PAC_IAXPAR_PRODUCTOS.P_REVALPROD(?,?,?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "CREVALI"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PREVALI"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("CREVALI", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("CREVALI", null);
		}
		try {
			retVal.put("PREVALI", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PREVALI", null);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__P_REVALPROD() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__P_REVALPROD();
	}
	// --END-PAC_IAXPAR_PRODUCTOS.P_REVALPROD

	// --START-PAC_IAXPAR_PRODUCTOS.P_SET_PRODACTIVITI(PCACTIVI)
	private HashMap callPAC_IAXPAR_PRODUCTOS__P_SET_PRODACTIVITI(java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{call PAC_IAXPAR_PRODUCTOS.P_SET_PRODACTIVITI(?)}";

		logCall(callQuery, new String[] { "pPCACTIVI" }, new Object[] { pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPCACTIVI);
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__P_SET_PRODACTIVITI(java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__P_SET_PRODACTIVITI(pPCACTIVI);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.P_SET_PRODACTIVITI

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CCUESTI(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CCUESTI(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CCUESTI(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCCUESTI"
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
			retVal.put("PCCUESTI", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCCUESTI", null);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CCUESTI(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CCUESTI(pPSPRODUC);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CCUESTI

	// --START-PAC_IAXPAR_PRODUCTOS.F_PERMITE_SUPL_PROD(P_CUSER, P_CMOTMOV,
	// P_SPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_PERMITE_SUPL_PROD(String pP_CUSER, java.math.BigDecimal pP_CMOTMOV,
			java.math.BigDecimal pP_SPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_PERMITE_SUPL_PROD(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_CUSER", "pP_CMOTMOV", "pP_SPRODUC" },
				new Object[] { pP_CUSER, pP_CMOTMOV, pP_SPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CUSER);
		cStmt.setObject(3, pP_CMOTMOV);
		cStmt.setObject(4, pP_SPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "P_PERMITE"
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
			retVal.put("P_PERMITE", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("P_PERMITE", null);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITE_SUPL_PROD(String pP_CUSER, java.math.BigDecimal pP_CMOTMOV,
			java.math.BigDecimal pP_SPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_PERMITE_SUPL_PROD(pP_CUSER, pP_CMOTMOV, pP_SPRODUC);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_PERMITE_SUPL_PROD

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULAPAR(PSCLABEN, SSEGURO)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPAR(java.math.BigDecimal pPSCLABEN,
			java.math.BigDecimal pSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULAPAR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCLABEN", "pSSEGURO" }, new Object[] { pPSCLABEN, pSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCLABEN);
		cStmt.setObject(3, pSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPAR(java.math.BigDecimal pPSCLABEN,
			java.math.BigDecimal pSSEGURO) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPAR(pPSCLABEN, pSSEGURO);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_DESCCLAUSULAPAR

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CMODEXTRA(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CMODEXTRA(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CMODEXTRA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCMODEXTRA"
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
			retVal.put("PCMODEXTRA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCMODEXTRA", null);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CMODEXTRA(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CMODEXTRA(pPSPRODUC);
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CMODEXTRA

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_MONEDAPRODUCTO(PSPRODUC)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_MONEDAPRODUCTO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC" }, new Object[] { pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PCMONEDA"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PCMONINT"
		cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PTMONEDA"
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
			retVal.put("PCMONEDA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PCMONEDA", null);
		}
		try {
			retVal.put("PCMONINT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCMONINT", null);
		}
		try {
			retVal.put("PTMONEDA", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PTMONEDA", null);
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_MONEDAPRODUCTO
	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CABECERA_PREGUNTAB(PTIPO, PCPREGUN,
	// PCGARANT)
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CABECERA_PREGUNTAB(String pPTIPO, java.math.BigDecimal pPCPREGUN,
			java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CABECERA_PREGUNTAB(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTIPO", "pPCPREGUN", "pPCGARANT" },
				new Object[] { pPTIPO, pPCPREGUN, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPO);
		cStmt.setObject(3, pPCPREGUN);
		cStmt.setObject(4, pPCGARANT);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_PREGUNTASTAB_COLUMNS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CABECERA_PREGUNTAB(String pPTIPO, java.math.BigDecimal pPCPREGUN,
			java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CABECERA_PREGUNTAB(pPTIPO, pPCPREGUN, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CABECERA_PREGUNTAB

	// --START-PAC_IAXPAR_PRODUCTOS.F_GET_CLAUSULASMULT()
	private HashMap callPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULASMULT() throws Exception {
		String callQuery = "{?=call PAC_IAXPAR_PRODUCTOS.F_GET_CLAUSULASMULT(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAXPAR_CLAUSULAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULASMULT() throws Exception {
		return this.callPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULASMULT();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAXPAR_PRODUCTOS.F_GET_CLAUSULASMULT
}
