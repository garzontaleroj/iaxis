//Revision:# ROMSjzihwJxgH8z80LiECA== #
package axis.jdbc;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_LISTVALORES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES.class);
	private Connection conn = null;

	public PAC_IAX_LISTVALORES(Connection conn) {
		this.conn = conn;
	}

	// ---START-PAC_IAX_LISTVALORES.F_GET_LSTINTERES_REA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTINTERES_REA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTINTERES_REA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTINTERES_REA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTINTERES_REA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTINTERES_REA

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCOMIS_REA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCOMIS_REA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCOMIS_REA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMIS_REA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCOMIS_REA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCOMIS_REA

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADO_FAC()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADO_FAC() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADO_FAC(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADO_FAC() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADO_FAC();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADO_FAC

	// --START-PAC_IAX_LISTVALORES.F_DETVALORES(CLAVE)

	private HashMap callPAC_IAX_LISTVALORES__F_DETVALORES(java.math.BigDecimal pCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_DETVALORES(?,?)}";
		logCall(callQuery, new String[] { "pCLAVE" }, new Object[] { pCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap callPAC_IAX_LISTVALORES__F_GETLITERALES(java.math.BigDecimal pCIDIOMA) throws Exception {

		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LITERALES(?,?)}";
		logCall(callQuery, new String[] { "pCIDIOMA" }, new Object[] { pCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCIDIOMA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"

		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"

		cStmt.execute();
		HashMap retVal2 = new HashMap();
		try {
			retVal2.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal2.put("RETURN", null);
		}
		try {
			retVal2.put("MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal2.put("MENSAJES", null);
		}
		retVal2 = new ConversionUtil().convertOracleObjects(retVal2); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal2;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GETLITERALES(java.math.BigDecimal pCIDIOMA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GETLITERALES(pCIDIOMA);
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(java.math.BigDecimal pCLAVE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_DETVALORES(pCLAVE);
	}

	// --END-PAC_IAX_LISTVALORES.F_DETVALORES
	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPO_PERSONA_REL(java.math.BigDecimal pPCTIPPER) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPO_PERSONA_REL(pPCTIPPER);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPO_PERSONA_REL

	// --START-PAC_IAX_LISTVALORES.F_DETVALORESCOND(CLAVE, COND)

	private HashMap callPAC_IAX_LISTVALORES__F_DETVALORESCOND(java.math.BigDecimal pCLAVE, String pCOND)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_DETVALORESCOND(?,?,?)}";
		logCall(callQuery, new String[] { "pCLAVE", "pCOND" }, new Object[] { pCLAVE, pCOND });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
		cStmt.setObject(3, pCOND);
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

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPO_PERSONA_REL(PCTIPPER)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPO_PERSONA_REL(java.math.BigDecimal pPCTIPPER) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPO_PERSONA_REL(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPER" }, new Object[] { pPCTIPPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPER);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(java.math.BigDecimal pCLAVE, String pCOND)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_DETVALORESCOND(pCLAVE, pCOND);
	}
	// --END-PAC_IAX_LISTVALORES.F_DETVALORESCOND
	// --START-PAC_IAX_LISTVALORES.F_GETDESCRIPVALOR(SQUERY, MENSAJES)

	private HashMap callPAC_IAX_LISTVALORES__F_GETDESCRIPVALOR(String pSQUERY, Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GETDESCRIPVALOR(?,?)}";
		logCall(callQuery, new String[] { "pSQUERY", "pMENSAJES" }, new Object[] { pSQUERY, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSQUERY);
		cStmt.setObject(3, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GETDESCRIPVALOR(String pSQUERY, Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GETDESCRIPVALOR(pSQUERY, pMENSAJES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GETDESCRIPVALOR
	// --START-PAC_IAX_LISTVALORES.F_GETDESCRIPVALORES(CLAVE, VALOR, MENSAJES)

	private HashMap callPAC_IAX_LISTVALORES__F_GETDESCRIPVALORES(java.math.BigDecimal pCLAVE,
			java.math.BigDecimal pVALOR, Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GETDESCRIPVALORES(?,?,?)}";
		logCall(callQuery, new String[] { "pCLAVE", "pVALOR", "pMENSAJES" },
				new Object[] { pCLAVE, pVALOR, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
		cStmt.setObject(3, pVALOR);
		cStmt.setObject(4, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GETDESCRIPVALORES(java.math.BigDecimal pCLAVE,
			java.math.BigDecimal pVALOR, Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GETDESCRIPVALORES(pCLAVE, pVALOR, pMENSAJES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GETDESCRIPVALORES
	// --START-PAC_IAX_LISTVALORES.F_GETDESCVINCLE(PCVINCLE, MENSAJES)

	private HashMap callPAC_IAX_LISTVALORES__F_GETDESCVINCLE(java.math.BigDecimal pPCVINCLE, Object pMENSAJES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GETDESCVINCLE(?,?)}";
		logCall(callQuery, new String[] { "pPCVINCLE", "pMENSAJES" }, new Object[] { pPCVINCLE, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCVINCLE);
		cStmt.setObject(3, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GETDESCVINCLE(java.math.BigDecimal pPCVINCLE, Object pMENSAJES)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GETDESCVINCLE(pPCVINCLE, pMENSAJES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GETDESCVINCLE
	// --START-PAC_IAX_LISTVALORES.F_GETTIPBAN(PSPERSON, PCBANCAR, MENSAJES)

	private HashMap callPAC_IAX_LISTVALORES__F_GETTIPBAN(java.math.BigDecimal pPSPERSON, String pPCBANCAR,
			Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GETTIPBAN(?,?,?)}";
		logCall(callQuery, new String[] { "pPSPERSON", "pPCBANCAR", "pMENSAJES" },
				new Object[] { pPSPERSON, pPCBANCAR, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCBANCAR);
		cStmt.setObject(4, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GETTIPBAN(java.math.BigDecimal pPSPERSON, String pPCBANCAR,
			Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GETTIPBAN(pPSPERSON, pPCBANCAR, pMENSAJES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GETTIPBAN
	// --START-PAC_IAX_LISTVALORES.F_GET_CAUSASSINI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CAUSASSINI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CAUSASSINI(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CAUSASSINI() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CAUSASSINI();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CAUSASSINI
	// --START-PAC_IAX_LISTVALORES.F_GET_ESTADOSSINI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_ESTADOSSINI(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_ESTADOSSINI

	// --START-PAC_IAX_LISTVALORES.F_GET_ESTADOSSINI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_ESTADOSREEMB() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_ESTADOSREEMB(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSREEMB() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_ESTADOSREEMB();
	}
	// --END-PAC_IAX_LISTVALORES.F_Get_EstadosReemb

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES(NUMIDE, NOMBRE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(String pNUMIDE, String pNOMBRE, String pCAGENTE,
			BigDecimal pFORMATO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGENTES(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNUMIDE", "pNOMBRE", "pCAGENTE", "pFORMATO" },
				new Object[] { pNUMIDE, pNOMBRE, pCAGENTE, pFORMATO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNUMIDE);
		cStmt.setObject(3, pNOMBRE);
		cStmt.setObject(4, pCAGENTE);
		cStmt.setObject(5, pFORMATO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(String pNUMIDE, String pNOMBRE, String pCAGENTE,
			BigDecimal pFORMATO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(pNUMIDE, pNOMBRE, pCAGENTE, pFORMATO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGRUPPROD()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGRUPPROD(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGRUPPROD
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCOMISION()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCOMISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCOMISION(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISION() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCOMISION();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCOMISION
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCOMISIONES()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCOMISIONES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCOMISIONES(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISIONES() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCOMISIONES();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCOMISIONES
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTDOMIPERSON(SPERSON)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(java.math.BigDecimal pSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTDOMIPERSON(?,?)}";
		logCall(callQuery, new String[] { "pSPERSON" }, new Object[] { pSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(java.math.BigDecimal pSPERSON) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(pSPERSON);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTDOMIPERSON
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTEMPRESAS()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTEMPRESAS(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTEMPRESAS
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTIDIOMAS()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTIDIOMAS(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTIDIOMAS
	// --START-PAC_IAX_LISTVALORES.F_GET_MOTIVOSRECHAZOPOL()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_MOTIVOSRECHAZOPOL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MOTIVOSRECHAZOPOL()}";
		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MOTIVOSRECHAZOPOL() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MOTIVOSRECHAZOPOL();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MOTIVOSRECHAZOPOL
	// --START-PAC_IAX_LISTVALORES.F_GET_MOTIVOSSINI(CCAUSA, CRAMO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_MOTIVOSSINI(java.math.BigDecimal pCCAUSA,
			java.math.BigDecimal pCRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MOTIVOSSINI(?,?,?)}";
		logCall(callQuery, new String[] { "pCCAUSA", "pCRAMO" }, new Object[] { pCCAUSA, pCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCAUSA);
		cStmt.setObject(3, pCRAMO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MOTIVOSSINI(java.math.BigDecimal pCCAUSA,
			java.math.BigDecimal pCRAMO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MOTIVOSSINI(pCCAUSA, pCRAMO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MOTIVOSSINI
	// --START-PAC_IAX_LISTVALORES.F_GET_NAMETOMADOR(SSEGURO, NORDTOM)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_NAMETOMADOR(java.math.BigDecimal pSSEGURO,
			java.math.BigDecimal pNORDTOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_NAMETOMADOR(?,?)}";
		logCall(callQuery, new String[] { "pSSEGURO", "pNORDTOM" }, new Object[] { pSSEGURO, pNORDTOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSSEGURO);
		cStmt.setObject(3, pNORDTOM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_NAMETOMADOR(java.math.BigDecimal pSSEGURO,
			java.math.BigDecimal pNORDTOM) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_NAMETOMADOR(pSSEGURO, pNORDTOM);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_NAMETOMADOR
	// --START-PAC_IAX_LISTVALORES.F_GET_NUMIDETOMADOR(PSSEGURO, PNORDTOM)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_NUMIDETOMADOR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNORDTOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_NUMIDETOMADOR(?,?)}";
		logCall(callQuery, new String[] { "pPSSEGURO", "pPNORDTOM" }, new Object[] { pPSSEGURO, pPNORDTOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.setObject(3, pPNORDTOM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_NUMIDETOMADOR(java.math.BigDecimal pPSSEGURO,
			java.math.BigDecimal pPNORDTOM) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_NUMIDETOMADOR(pPSSEGURO, pPNORDTOM);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_NUMIDETOMADOR

	// --START-PAC_IAX_LISTVALORES.F_GET_PERSONAS(NUMIDE, NOMBRE, NSIP, PSSEGURO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_PERSONAS(String pNUMIDE, String pNOMBRE, String pNSIP,
			java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_PERSONAS(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNUMIDE", "pNOMBRE", "pNSIP", "pPSSEGURO" },
				new Object[] { pNUMIDE, pNOMBRE, pNSIP, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNUMIDE);
		cStmt.setObject(3, pNOMBRE);
		cStmt.setObject(4, pNSIP);
		cStmt.setObject(6, pPSSEGURO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_PERSONAS(String pNUMIDE, String pNOMBRE, String pNSIP,
			java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_PERSONAS(pNUMIDE, pNOMBRE, pNSIP, pPSSEGURO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_PERSONAS

	// --START-PAC_IAX_LISTVALORES.F_GET_PRODUCTOS(P_TIPO, P_CEMPRES, P_CRAMO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(String pP_TIPO, java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_CRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_PRODUCTOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_TIPO", "pP_CEMPRES", "pP_CRAMO" },
				new Object[] { pP_TIPO, pP_CEMPRES, pP_CRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TIPO);
		cStmt.setObject(3, pP_CEMPRES);
		cStmt.setObject(4, pP_CRAMO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(String pP_TIPO, java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_CRAMO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(pP_TIPO, pP_CEMPRES, pP_CRAMO);
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_PRODUCTOS
	// --START-PAC_IAX_LISTVALORES.F_GET_RAMOS(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMOS(String pPtipo, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPtipo);
		cStmt.setObject(3, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(String pPtipo, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMOS(pPtipo, pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RAMOS

	// --START-PAC_IAX_LISTVALORES.F_GET_RAMPRODUCTOS(PCRAMO, PCTERMFIN)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(String pTipo, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTERMFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMPRODUCTOS(?,?,?, ?)}";
		logCall(callQuery, new String[] { "pPCRAMO", "pPCTERMFIN" }, new Object[] { pPCRAMO, pPCTERMFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pTipo);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPCTERMFIN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(String pTipo, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTERMFIN) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(pTipo, pPCRAMO, pPCTERMFIN);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RAMPRODUCTOS
	// --START-PAC_IAX_LISTVALORES.F_GET_RESPONSABILIDASINI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RESPONSABILIDASINI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RESPONSABILIDASINI(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RESPONSABILIDASINI() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RESPONSABILIDASINI();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RESPONSABILIDASINI
	// --START-PAC_IAX_LISTVALORES.F_GET_RETENCIONPOLIZA(CRETENI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RETENCIONPOLIZA(java.math.BigDecimal pCRETENI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RETENCIONPOLIZA(?)}";
		logCall(callQuery, new String[] { "pCRETENI" }, new Object[] { pCRETENI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCRETENI);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RETENCIONPOLIZA(java.math.BigDecimal pCRETENI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RETENCIONPOLIZA(pCRETENI);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RETENCIONPOLIZA
	// --START-PAC_IAX_LISTVALORES.F_GET_SITPOLIZA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_SITPOLIZA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_SITPOLIZA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_SITPOLIZA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_SITPOLIZA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_SITPOLIZA
	// --START-PAC_IAX_LISTVALORES.F_GET_SITUACIONPOLIZA(PSSEGURO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_SITUACIONPOLIZA(java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_SITUACIONPOLIZA(?)}";
		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_SITUACIONPOLIZA(java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_SITUACIONPOLIZA(pPSSEGURO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_SITUACIONPOLIZA
	// --START-PAC_IAX_LISTVALORES.F_GET_SUBAGENTES(CAGENTE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_SUBAGENTES(java.math.BigDecimal pCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_SUBAGENTES(?,?)}";
		logCall(callQuery, new String[] { "pCAGENTE" }, new Object[] { pCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCAGENTE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_SUBAGENTES(java.math.BigDecimal pCAGENTE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_SUBAGENTES(pCAGENTE);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_SUBAGENTES
	// --START-PAC_IAX_LISTVALORES.F_GET_TIPANULPOL()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPANULPOL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPANULPOL(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPANULPOL() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPANULPOL();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPANULPOL

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPANULPOL(PSPRODUC)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPANULPOL(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPANULPOL(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPANULPOL(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPANULPOL(pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPANULPOL

	// --START-PAC_IAX_LISTVALORES.F_GET_CAUSAANULPOL(PSPRODUC, PCTIPBAJA, MENSAJES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CAUSAANULPOL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPBAJA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CAUSAANULPOL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCTIPBAJA" }, new Object[] { pPSPRODUC, pPCTIPBAJA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCTIPBAJA);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CAUSAANULPOL(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPBAJA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CAUSAANULPOL(pPSPRODUC, pPCTIPBAJA);
	}

	// --START-PAC_IAX_LISTVALORES.F_GET_MOTANULPOL(PCMOTMOV)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_MOTANULPOL(java.math.BigDecimal pPCMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MOTANULPOL(?, ?)}";

		logCall(callQuery, new String[] { "pPCMOTMOV" }, new Object[] { pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOV);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MOTANULPOL(java.math.BigDecimal pPCMOTMOV) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MOTANULPOL(pPCMOTMOV);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MOTANULPOL

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPCCC()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPCCC() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPCCC(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPCCC();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPCCC
	// --START-PAC_IAX_LISTVALORES.F_GET_TIPDOCUM()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPDOCUM(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPDOCUM
	// --START-PAC_IAX_LISTVALORES.F_GET_TIPOCOBRO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPOCOBRO(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPOCOBRO
	// --START-PAC_IAX_LISTVALORES.F_GET_TIPOVINCULOS()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPOVINCULOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPOVINCULOS(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOVINCULOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPOVINCULOS();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPOVINCULOS
	// --START-PAC_IAX_LISTVALORES.F_GET_TIPPERSON()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPPERSON() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPPERSON(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPPERSON
	// --START-PAC_IAX_LISTVALORES.F_GET_TIPSEXO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPSEXO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPSEXO(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPSEXO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPSEXO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPSEXO
	// --START-PAC_IAX_LISTVALORES.F_OPENCURSOR(SQUERY, MENSAJES)

	private HashMap callPAC_IAX_LISTVALORES__F_OPENCURSOR(String pSQUERY, Object pMENSAJES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_OPENCURSOR(?,?)}";
		logCall(callQuery, new String[] { "pSQUERY", "pMENSAJES" }, new Object[] { pSQUERY, pMENSAJES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSQUERY);
		cStmt.setObject(3, pMENSAJES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_OPENCURSOR(String pSQUERY, Object pMENSAJES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_OPENCURSOR(pSQUERY, pMENSAJES);
	}
	// --END-PAC_IAX_LISTVALORES.F_OPENCURSOR

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTPAISES()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTPAISES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTPAISES(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_LSTPAISES
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTPROFESIONES(COCUPACION)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(java.math.BigDecimal pCOCUPACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTPROFESIONES(?, ?)}";

		logCall(callQuery, new String[] { "pCOCUPACION" }, new Object[] { pCOCUPACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(3, pCOCUPACION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(java.math.BigDecimal pCOCUPACION) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(pCOCUPACION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTPROFESIONES

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPOCUENTA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPOCUENTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPOCUENTA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCUENTA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPOCUENTA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOCUENTA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTACTIVO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTACTIVO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTACTIVO(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		CallableStatement cStmt = conn.prepareCall(callQuery);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTACTIVO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTACTIVO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTACTIVO
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTERFINANCIERO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTERFINANCIERO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTERFINANCIERO(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTERFINANCIERO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTERFINANCIERO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTERFINANCIERO

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPRIESGO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPRIESGO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPRIESGO(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		CallableStatement cStmt = conn.prepareCall(callQuery);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPRIESGO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPRIESGO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPRIESGO

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCOBJASE()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCOBJASE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCOBJASE(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBJASE() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCOBJASE();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCOBJASE
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCSUBPRO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCSUBPRO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCSUBPRO(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCSUBPRO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCSUBPRO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCSUBPRO
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCPRPROD()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCPRPROD() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCPRPROD(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		CallableStatement cStmt = conn.prepareCall(callQuery);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCPRPROD() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCPRPROD();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCPRPROD
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTDIVISA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTDIVISA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTDIVISA(?)}";
		logCall(callQuery, new String[] {}, new Object[] {});
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		CallableStatement cStmt = conn.prepareCall(callQuery);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDIVISA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTDIVISA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTDIVISA

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTFORMULAS(PSPRODUC)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTFORMULAS(?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS(pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTFORMULAS

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPGAR()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPGAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPGAR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPGAR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPGAR();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPGAR

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPCAPGAR()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPCAPGAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPCAPGAR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCAPGAR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPCAPGAR();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPCAPGAR

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCAPMAXGAR()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCAPMAXGAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCAPMAXGAR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCAPMAXGAR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCAPMAXGAR();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCAPMAXGAR

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPTARGAR()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPTARGAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPTARGAR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPTARGAR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPTARGAR();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPTARGAR

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTREAGAR()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTREAGAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTREAGAR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREAGAR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTREAGAR();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTREAGAR

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTREVALGAR()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTREVALGAR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTREVALGAR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREVALGAR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTREVALGAR();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTREVALGAR
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCRECCOB()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCRECCOB() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCRECCOB(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCRECCOB() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCRECCOB();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCRECCOB
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCTIPREB()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCTIPREB() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCTIPREB(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPREB() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCTIPREB();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCTIPREB
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCCALCOM()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCCALCOM() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCCALCOM(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCCALCOM() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCCALCOM();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCCALCOM
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCTIPPAG()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCTIPPAG() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCTIPPAG(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPPAG() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCTIPPAG();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCTIPPAG
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCTIPGES()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCTIPGES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCTIPGES(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPGES() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCTIPGES();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCTIPGES
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCDURACI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCDURACI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCDURACI(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCDURACI() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCDURACI();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCDURACI
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCTEMPOR()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCTEMPOR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCTEMPOR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTEMPOR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCTEMPOR();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCTEMPOR
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCDURMIN()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCDURMIN() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCDURMIN(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCDURMIN() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCDURMIN();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCDURMIN
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCDURMAX()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCDURMAX() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCDURMAX(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCDURMAX() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCDURMAX();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCDURMAX
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCTIPEFE()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCTIPEFE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCTIPEFE(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPEFE() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCTIPEFE();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCTIPEFE
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCREVALI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCREVALI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCREVALI(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCREVALI() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCREVALI();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCREVALI
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCTARMAN()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCTARMAN() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCTARMAN(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTARMAN() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCTARMAN();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCTARMAN
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTSINO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTSINO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTSINO(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTSINO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTSINO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTSINO
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCRETENI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCRETENI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCRETENI(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCRETENI() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCRETENI();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCRETENI
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCPRORRA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCPRORRA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCPRORRA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCPRORRA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCPRORRA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCPRORRA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCPRIMIN()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCPRIMIN() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCPRIMIN(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCPRIMIN() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCPRIMIN();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCPRIMIN

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPODIRECCION()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPODIRECCION(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPODIRECCION

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPOVIA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPOVIA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOVIA
	// --START-PAC_IAX_LISTVALORES.F_GET_CONSULTA(CODIGO, CONDICION)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CONSULTA(String pCODIGO, String pCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CONSULTA(?,?,?)}";
		logCall(callQuery, new String[] { "pCODIGO", "pCONDICION" }, new Object[] { pCODIGO, pCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCODIGO);
		cStmt.setObject(3, pCONDICION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(String pCODIGO, String pCONDICION) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CONSULTA(pCODIGO, pCONDICION);
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_CONSULTA
	// INI SGM 8/11/2019 IAXIS BUG-6149 recibos que tienen reversiones
	private HashMap callPAC_IAX_LISTVALORES__F_GET_PUBLICINFO(String pCODIGO, String pCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_PUBLICINFO(?,?,?)}";
		logCall(callQuery, new String[] { "pCODIGO", "pCONDICION" }, new Object[] { pCODIGO, pCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCODIGO);
		cStmt.setObject(3, pCONDICION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_PUBLICINFO(String pCODIGO, String pCONDICION) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_PUBLICINFO(pCODIGO, pCONDICION);
	}
	// FIN SGM 8/11/2019 IAXIS BUG-6149 recibos que tienen reversiones
	// -PAC_IAX_LISTVALORES.F_GET_PUBLICINFO

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTNIVEL()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTNIVEL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTNIVEL(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTNIVEL() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTNIVEL();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTNIVEL

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTNCODINT()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTNCODINT() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTNCODINT(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTNCODINT() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTNCODINT();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTNCODINT

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPINTERES()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPINTERES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPINTERES(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPINTERES() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPINTERES();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPINTERES

	// --START-PAC_IAX_LISTVALORES.F_GET_CTRAMTIP()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CTRAMTIP() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CTRAMTIP(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CTRAMTIP() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CTRAMTIP();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CTRAMTIP

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADORECIBO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADORECIBO(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADORECIBO

	// -- ini Bug 0012679 - 18/02/2010 - JMF
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADORECIBO_MV()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO_MV() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADORECIBO_MV(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO_MV() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO_MV();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADORECIBO_MV
	// -- fin Bug 0012679 - 18/02/2010 - JMF

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADOCIERRE(PPREVIO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE(java.math.BigDecimal pPPREVIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADOCIERRE(?,?)}";
		logCall(callQuery, new String[] { "pPPREVIO" }, new Object[] { pPPREVIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPREVIO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE(java.math.BigDecimal pPPREVIO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE(pPPREVIO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADOCIERRE

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPOCIERRE(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPOCIERRE(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPOCIERRE(?,?)}";
		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCIERRE(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPOCIERRE(pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOCIERRE

	// --START-PAC_IAX_LISTVALORES.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCACTIVI

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCACTIVI(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCACTIVI(?,?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCACTIVI(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCACTIVI(pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCACTIVI

	// --START-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCPAISMAT

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCPAISMAT() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCPAISMAT(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCPAISMAT() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCPAISMAT();
	}
	// --END-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCPAISMAT

	// --START-PAC_IAX_LISTVALORES.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCMARCA

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCMARCA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCMARCA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCMARCA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCMARCA();
	}
	// --END-PAC_IAX_LISTVALORES.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCMARCA

	// --START-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCMODELO

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCMODELO(java.math.BigDecimal pPCMARCA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCMODELO(?,?)}";
		logCall(callQuery, new String[] { "pPCMARCA" }, new Object[] { pPCMARCA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCMODELO(java.math.BigDecimal pPCMARCA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCMODELO(pPCMARCA);
	}
	// --END-PAC_IAX_LISTVALORES.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCMODELO

	// --START-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCVERSION

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCVERSION(java.math.BigDecimal pPCMARCA,
			java.math.BigDecimal pPCMODELO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCVERSION(?,?,?)}";
		logCall(callQuery, new String[] { "pPCMARCA", "pPCMODELO" }, new Object[] { pPCMARCA, pPCMODELO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMARCA);
		cStmt.setObject(3, pPCMODELO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCVERSION(java.math.BigDecimal pPCMARCA,
			java.math.BigDecimal pPCMODELO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCVERSION(pPCMARCA, pPCMODELO);
	}
	// --END-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCVERSION

	// --START-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCUSU

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCUSU(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCTIPVEH, String pPCCLAVEH) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCUSU(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPSPRODUC", "pPCACTIVI", "pPCTIPVEH", "pPCCLAVEH" },
				new Object[] { pPSPRODUC, pPCACTIVI, pPCTIPVEH, pPCCLAVEH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCACTIVI);
		cStmt.setObject(4, pPCTIPVEH);
		cStmt.setObject(5, pPCCLAVEH);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCUSU(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCACTIVI, String pPCTIPVEH, String pPCCLAVEH) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCUSU(pPSPRODUC, pPCACTIVI, pPCTIPVEH, pPCCLAVEH);
	}
	// --END-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCUSU

	// --START-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__LSTSUBCUSO

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCSUBUSO(java.math.BigDecimal pPCUSO, String pPCTIPVEH,
			String pPCCLAVEH) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCSUBUSO(?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCUSO", "pPCTIPVEH", "pPCCLAVEH" },
				new Object[] { pPCUSO, pPCTIPVEH, pPCCLAVEH });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUSO);
		cStmt.setObject(3, pPCTIPVEH);
		cStmt.setObject(4, pPCCLAVEH);

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCSUBUSO(java.math.BigDecimal pPCUSO, String pPCTIPVEH,
			String pPCCLAVEH) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCSUBUSO(pPCUSO, pPCTIPVEH, pPCCLAVEH);
	}
	// --END-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__LSTSUBCUSO

	// --START-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__LSTSUBCUSO

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCCOLOR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCCOLOR(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCCOLOR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCCOLOR();
	}
	// --END-PAC_IAX_LISTVALORES.callPAC_IAX_LISTVALORES__F_GET_LSTCCOLOR

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADOCIERRE_NUEVO(PPREVIO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE_NUEVO(java.math.BigDecimal pPPREVIO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADOCIERRE_NUEVO(?,?)}";
		logCall(callQuery, new String[] { "pPPREVIO" }, new Object[] { pPPREVIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPREVIO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE_NUEVO(java.math.BigDecimal pPPREVIO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE_NUEVO(pPPREVIO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADOCIERRE_NUEVO

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPOAGENTE(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOAGENTE

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADOAGENTE(PCEMPRES, PCVALOR,
	// PCTIPAGE, PCACTIVO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPCACTIVO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADOAGENTE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCVALOR", "pPCTIPAGE", "pPCACTIVO" },
				new Object[] { pPCEMPRES, pPCVALOR, pPCTIPAGE, pPCACTIVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCVALOR);
		cStmt.setObject(4, pPCTIPAGE);
		cStmt.setObject(5, pPCACTIVO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPCACTIVO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(pPCEMPRES, pPCVALOR, pPCTIPAGE, pPCACTIVO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADOAGENTE

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPOIVA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPOIVA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOIVA

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTRETENCION()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTRETENCION() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTRETENCION(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTRETENCION() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTRETENCION();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTRETENCION

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGECOMISION()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGECOMISION(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGECOMISION

	// --START-PAC_IAX_LISTVALORES.F_GET_GSTPOLRETMOT()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_GSTPOLRETMOT() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_GSTPOLRETMOT(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_GSTPOLRETMOT() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_GSTPOLRETMOT();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_GSTPOLRETMOT

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTMESES()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTMESES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTMESES(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTMESES();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTMESES

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGR_REA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTDIAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTDIAS(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDIAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTDIAS();
	}

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGR_REA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGR_REA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGR_REA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGR_REA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGR_REA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCIA_REA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCIA_REA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCIA_REA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPO_REA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPO_REA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPO_REA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_REA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPO_REA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPO_REA

	// --START-PAC_IAX_LISTVALORES.F_GET_CRAMO_EMP(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CRAMO_EMP(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CRAMO_EMP

	// --START-PAC_IAX_LISTVALORES.F_GET_CACTIVI(PSPRODUC, PCRAMO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CACTIVI(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCRAMO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CACTIVI(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCRAMO" }, new Object[] { pPSPRODUC, pPCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCRAMO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCRAMO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CACTIVI(pPSPRODUC, pPCRAMO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CACTIVI

	// --START-PAC_IAX_LISTVALORES.F_GET_CGARANT(PSPRODUC, PCRAMO, PCACTIVI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CGARANT(java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CGARANT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCRAMO", "pPCACTIVI" },
				new Object[] { pPSPRODUC, pPCRAMO, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPCACTIVI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CGARANT(pPSPRODUC, pPCRAMO, pPCACTIVI);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CGARANT

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CGARANT_POL(java.math.BigDecimal pPNPOLIZA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CGARANT_POL(?, ?)}";

		logCall(callQuery, new String[] { "pPNPOLIZA" }, new Object[] { pPNPOLIZA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNPOLIZA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT_POL(java.math.BigDecimal pPNPOLIZA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CGARANT_POL(pPNPOLIZA);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CGARANT

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CGARANT_SIN(java.math.BigDecimal pPNSINIES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CGARANT_SIN(?, ?)}";

		logCall(callQuery, new String[] { "pPNSINIES" }, new Object[] { pPNSINIES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSINIES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT_SIN(java.math.BigDecimal pPNSINES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CGARANT_SIN(pPNSINES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CGARANT

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCESTPER()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCESTPER() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCESTPER(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCESTPER() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCESTPER();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCESTPER

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTASIENTO(P_EMPRESA)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(java.math.BigDecimal pP_EMPRESA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTASIENTO(?, ?)}";

		logCall(callQuery, new String[] { "pP_EMPRESA" }, new Object[] { pP_EMPRESA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_EMPRESA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MSJ"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MSJ", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("MSJ", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(java.math.BigDecimal pP_EMPRESA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(pP_EMPRESA);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTASIENTO
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCONCEPTOCONTABLE()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOCONTABLE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCONCEPTOCONTABLE(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOCONTABLE() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOCONTABLE();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCONCEPTOCONTABLE
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCUENTACONTABLE()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCUENTACONTABLE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCUENTACONTABLE(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCUENTACONTABLE() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCUENTACONTABLE();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCUENTACONTABLE

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPOVISION()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPOVISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPOVISION(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVISION() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPOVISION();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOVISION
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCOBRADORES(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCOBRADORES(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCOBRADORES

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTDELEGACIONES(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTDELEGACIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTDELEGACIONES(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDELEGACIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTDELEGACIONES(pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTDELEGACIONES

	// --START-PAC_IAX_LISTVALORES.F_GET_SUBESTADOSSINI()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_SUBESTADOSSINI() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_SUBESTADOSSINI(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_SUBESTADOSSINI() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_SUBESTADOSSINI();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_SUBESTADOSSINI

	/**
	 * @param pSSEGURO
	 * @param pNORDTOM
	 * @return
	 * @throws Exception
	 */
	private
	// --START-PAC_IAX_LISTVALORES.F_GET_NAMETOMADORCERO(SSEGURO, NORDTOM)
	HashMap callPAC_IAX_LISTVALORES__F_GET_NAMETOMADORCERO(java.math.BigDecimal pSSEGURO, java.math.BigDecimal pNORDTOM)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_NAMETOMADORCERO(?, ?)}";

		logCall(callQuery, new String[] { "pSSEGURO", "pNORDTOM" }, new Object[] { pSSEGURO, pNORDTOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSSEGURO);
		cStmt.setObject(3, pNORDTOM);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_NAMETOMADORCERO(java.math.BigDecimal pSSEGURO,
			java.math.BigDecimal pNORDTOM) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_NAMETOMADORCERO(pSSEGURO, pNORDTOM);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_NAMETOMADORCERO

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTGRADOMINUSVALIA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTGRADOMINUSVALIA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTGRADOMINUSVALIA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTGRADOMINUSVALIA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTGRADOMINUSVALIA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTGRADOMINUSVALIA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTSITFAM()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTSITFAM() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTSITFAM(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTSITFAM() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTSITFAM();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTSITFAM

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCONCEPTOSAPUNTEAGENDA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOSAPUNTEAGENDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCONCEPTOSAPUNTEAGENDA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOSAPUNTEAGENDA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOSAPUNTEAGENDA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCONCEPTOSAPUNTEAGENDA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADOSAPUNTEAGENDA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADOSAPUNTEAGENDA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADOSAPUNTEAGENDA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPOAPUNTESAGENDA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPOAPUNTESAGENDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPOAPUNTESAGENDA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAPUNTESAGENDA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPOAPUNTESAGENDA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOAPUNTESAGENDA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTUSUARIOSAGENDA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTUSUARIOSAGENDA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTUSUARIOSAGENDA

	/**
	 * RKV Bug 9416
	 * 
	 * @param pPSPRODUC
	 * @return
	 * @throws Exception
	 */
	private
	// --START-PAC_IAX_LISTVALORES.F_GET_PERFILES(PSPRODUC)

	HashMap callPAC_IAX_LISTVALORES__F_GET_PERFILES(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_PERFILES(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_PERFILES(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_PERFILES(pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_PERFILES

	/**
	 * XGC - Bug 9499
	 * 
	 * @param pPCEMPRES
	 * @return
	 * @throws Exception
	 */
	private
	// --START-PAC_IAX_LISTVALORES.F_GET_FONDOSINVERSION(PCEMPRES)
	HashMap callPAC_IAX_LISTVALORES__F_GET_FONDOSINVERSION(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_FONDOSINVERSION(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_FONDOSINVERSION(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_FONDOSINVERSION(pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_FONDOSINVERSION
	// --START-PAC_IAX_LISTVALORES.F_GET_FICHEROS()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_FICHEROS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_FICHEROS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_FICHEROS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_FICHEROS();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_FICHEROS
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCONCEP_CTA()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCONCEP_CTA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCONCEP_CTA
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPO_CTA(PCCONCEPTO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(java.math.BigDecimal pPCCONCEPTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPO_CTA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCONCEPTO" }, new Object[] { pPCCONCEPTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONCEPTO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(java.math.BigDecimal pPCCONCEPTO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(pPCCONCEPTO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPO_CTA
	// --START-PAC_IAX_LISTVALORES.F_GET_AGRUPACIONES(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_AGRUPACIONES(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES(pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_AGRUPACIONES
	// --START-PAC_IAX_LISTVALORES.F_GET_RAMOSAGRUPACION(PCEMPRES, PCAGRUPACION)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMOSAGRUPACION(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGRUPACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMOSAGRUPACION(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCAGRUPACION" }, new Object[] { pPCEMPRES, pPCAGRUPACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCAGRUPACION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGRUPACION(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCAGRUPACION) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMOSAGRUPACION(pPCEMPRES, pPCAGRUPACION);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RAMOSAGRUPACION
	// --START-PAC_IAX_LISTVALORES.F_GET_LIQSPENDIENTES(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LIQSPENDIENTES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LIQSPENDIENTES(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LIQSPENDIENTES(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LIQSPENDIENTES(pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LIQSPENDIENTES

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCCOBBAN_REC(PNRECIBO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCCOBBAN_REC(java.math.BigDecimal pPNRECIBO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCCOBBAN_REC(?, ?)}";

		logCall(callQuery, new String[] { "pPNRECIBO" }, new Object[] { pPNRECIBO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNRECIBO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCCOBBAN_REC(java.math.BigDecimal pPNRECIBO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCCOBBAN_REC(pPNRECIBO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCCOBBAN_REC
	// --START-PAC_IAX_LISTVALORES.F_GET_CIERES_TIPO17(PCEMPRES, PAGENTE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CIERES_TIPO17(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CIERES_TIPO17(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPAGENTE" }, new Object[] { pPCEMPRES, pPAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPAGENTE);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CIERES_TIPO17(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPAGENTE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CIERES_TIPO17(pPCEMPRES, pPAGENTE);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CIERES_TIPO17

	// --START-PAC_IAX_LISTVALORES.F_GET_GSTCESTGEST()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_GSTCESTGEST() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_GSTCESTGEST(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_GSTCESTGEST() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_GSTCESTGEST();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_GSTCESTGEST

	// --START-PAC_IAX_LISTVALORES.F_GET_CONCEPGARAN(PCGARANT)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CONCEPGARAN(java.math.BigDecimal pPCGARANT) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CONCEPGARAN(?, ?)}";

		logCall(callQuery, new String[] { "pPCGARANT" }, new Object[] { pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CONCEPGARAN(java.math.BigDecimal pPCGARANT) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CONCEPGARAN(pPCGARANT);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CONCEPGARAN

	// --START-PAC_IAX_LISTVALORES.F_GET_CIAPRODUCTOS()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CIAPRODUCTOS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();

	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CIAPRODUCTOS

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTRAMOSDGS()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTRAMOSDGS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTRAMOSDGS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTRAMOSDGS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTRAMOSDGS();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTRAMOSDGS
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTMORTALIDAD()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTMORTALIDAD() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTMORTALIDAD(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTMORTALIDAD() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTMORTALIDAD();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTMORTALIDAD

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCODCAMPO(PCUTILI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCODCAMPO(java.math.BigDecimal pPCUTILI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCODCAMPO(?, ?)}";

		logCall(callQuery, new String[] { "pPCUTILI" }, new Object[] { pPCUTILI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUTILI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCODCAMPO(java.math.BigDecimal pPCUTILI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCODCAMPO(pPCUTILI);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCODCAMPO

	// --START-PAC_IAX_LISTVALORES.F_GET_MOTIVOSSINI(CCAUSA, CRAMO, PSPRODUC,
	// PSSEGURO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_MOTIVOSSINI(java.math.BigDecimal pCCAUSA,
			java.math.BigDecimal pCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MOTIVOSSINI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pCCAUSA", "pCRAMO", "pPSPRODUC", "pPSSEGURO" },
				new Object[] { pCCAUSA, pCRAMO, pPSPRODUC, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCCAUSA);
		cStmt.setObject(3, pCRAMO);
		cStmt.setObject(4, pPSPRODUC);
		cStmt.setObject(5, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MOTIVOSSINI(java.math.BigDecimal pCCAUSA,
			java.math.BigDecimal pCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MOTIVOSSINI(pCCAUSA, pCRAMO, pPSPRODUC, pPSSEGURO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MOTIVOSSINI

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTBANCOS(PCBANCO, PTBANCO)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(java.math.BigDecimal pPCBANCO, String pPTBANCO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTBANCOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCBANCO", "pPTBANCO" }, new Object[] { pPCBANCO, pPTBANCO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCBANCO);
		cStmt.setObject(3, pPTBANCO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(java.math.BigDecimal pPCBANCO, String pPTBANCO)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(pPCBANCO, pPTBANCO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTBANCOS

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPORIESGO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPORIESGO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPORIESGO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPORIESGO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPORIESGO();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPORIESGO

	// --START-PAC_IAX_LISTVALORES.F_GET_NEGOCIO(PCNEGOCIO, PCIDIOMA, PCEMPRESA,
	// PSPRODUC)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_NEGOCIO(java.math.BigDecimal pPCNEGOCIO,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCEMPRESA, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_NEGOCIO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCNEGOCIO", "pPCIDIOMA", "pPCEMPRESA", "pPSPRODUC" },
				new Object[] { pPCNEGOCIO, pPCIDIOMA, pPCEMPRESA, pPSPRODUC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCNEGOCIO);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.setObject(4, pPCEMPRESA);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_NEGOCIO(java.math.BigDecimal pPCNEGOCIO,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCEMPRESA, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_NEGOCIO(pPCNEGOCIO, pPCIDIOMA, pPCEMPRESA, pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_NEGOCIO

	// --START-PAC_IAX_LISTVALORES.F_GET_PRODUCTOSCOMPANIA(PCCOMPANI, PCRAMO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_PRODUCTOSCOMPANIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPCRAMO" }, new Object[] { pPCCOMPANI, pPCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPCRAMO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCRAMO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(pPCCOMPANI, pPCRAMO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_PRODUCTOSCOMPANIA
	// --START-PAC_IAX_LISTVALORES.F_GET_RAMOSCOMPANIA(PCCOMPANI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(java.math.BigDecimal pPCCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMOSCOMPANIA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI" }, new Object[] { pPCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(java.math.BigDecimal pPCCOMPANI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(pPCCOMPANI);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RAMOSCOMPANIA
	// --START-PAC_IAX_LISTVALORES.F_GET_AGRUPCOMPANIA(PCCOMPANI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_AGRUPCOMPANIA(java.math.BigDecimal pPCCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_AGRUPCOMPANIA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI" }, new Object[] { pPCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPCOMPANIA(java.math.BigDecimal pPCCOMPANI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_AGRUPCOMPANIA(pPCCOMPANI);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_AGRUPCOMPANIA
	// --START-PAC_IAX_LISTVALORES.F_GET_RAMOSCOMPAGRUPA(PCAGRPRO, PCCOMPANI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPAGRUPA(java.math.BigDecimal pPCAGRPRO,
			java.math.BigDecimal pPCCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMOSCOMPAGRUPA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGRPRO", "pPCCOMPANI" }, new Object[] { pPCAGRPRO, pPCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGRPRO);
		cStmt.setObject(3, pPCCOMPANI);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPAGRUPA(java.math.BigDecimal pPCAGRPRO,
			java.math.BigDecimal pPCCOMPANI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPAGRUPA(pPCAGRPRO, pPCCOMPANI);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RAMOSCOMPAGRUPA

	// --START-PAC_IAX_LISTVALORES.F_RECIBO_PAGMANUAL()

	private HashMap callPAC_IAX_LISTVALORES__F_RECIBO_PAGMANUAL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_RECIBO_PAGMANUAL(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_RECIBO_PAGMANUAL() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_RECIBO_PAGMANUAL();
	}
	// --END-PAC_IAX_LISTVALORES.F_RECIBO_PAGMANUAL

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTACTIVI(PSPRODUC, PCRAMO, PCCOMPANI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTACTIVI(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTACTIVI(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCRAMO", "pPCCOMPANI" },
				new Object[] { pPSPRODUC, pPCRAMO, pPCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPCCOMPANI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTACTIVI(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCCOMPANI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTACTIVI(pPSPRODUC, pPCRAMO, pPCCOMPANI);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTACTIVI

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTCTIPREC()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTCTIPREC() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTCTIPREC(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPREC() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTCTIPREC();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTCTIPREC

	// --START-PAC_IAX_LISTVALORES.F_GET_REGIMENFISCAL(PCTIPPER)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL(java.math.BigDecimal pPCTIPPER) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_REGIMENFISCAL(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPER" }, new Object[] { pPCTIPPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPER);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL(java.math.BigDecimal pPCTIPPER) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL(pPCTIPPER);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_REGIMENFISCAL

	// --START-PAC_IAX_LISTVALORES.F_GET_RAMOSAGENTE(PCAGENTE, P_TIPO, PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(java.math.BigDecimal pPCAGENTE, String pP_TIPO,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMOSAGENTE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE", "pP_TIPO", "pPCEMPRES" },
				new Object[] { pPCAGENTE, pP_TIPO, pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.setObject(3, pP_TIPO);
		cStmt.setObject(4, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(java.math.BigDecimal pPCAGENTE, String pP_TIPO,
			java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(pPCAGENTE, pP_TIPO, pPCEMPRES);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RAMOSAGENTE

	// --START-PAC_IAX_LISTVALORES.F_GET_RAMPRODUCTOSAGENTE(P_TIPO, PCRAMO,
	// PCTERMFIN, PCAGENTE, PCMODALI)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOSAGENTE(String pP_TIPO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTERMFIN, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMODALI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMPRODUCTOSAGENTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_TIPO", "pPCRAMO", "pPCTERMFIN", "pPCAGENTE", "pPCMODALI" },
				new Object[] { pP_TIPO, pPCRAMO, pPCTERMFIN, pPCAGENTE, pPCMODALI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TIPO);
		cStmt.setObject(3, pPCRAMO);
		cStmt.setObject(4, pPCTERMFIN);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.setObject(6, pPCMODALI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOSAGENTE(String pP_TIPO, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTERMFIN, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMODALI)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOSAGENTE(pP_TIPO, pPCRAMO, pPCTERMFIN, pPCAGENTE,
				pPCMODALI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RAMPRODUCTOSAGENTE

	// --START-PAC_IAX_LISTVALORES.F_GET_PRODUCTOSAGENTE(P_TIPO, P_CEMPRES, P_CRAMO,
	// PCAGENTE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_PRODUCTOSAGENTE(String pP_TIPO, java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_CRAMO, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_PRODUCTOSAGENTE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pP_TIPO", "pP_CEMPRES", "pP_CRAMO", "pPCAGENTE" },
				new Object[] { pP_TIPO, pP_CEMPRES, pP_CRAMO, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TIPO);
		cStmt.setObject(3, pP_CEMPRES);
		cStmt.setObject(4, pP_CRAMO);
		cStmt.setObject(5, pPCAGENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSAGENTE(String pP_TIPO, java.math.BigDecimal pP_CEMPRES,
			java.math.BigDecimal pP_CRAMO, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_PRODUCTOSAGENTE(pP_TIPO, pP_CEMPRES, pP_CRAMO, pPCAGENTE);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_PRODUCTOSAGENTE

	// --START-PAC_IAX_LISTVALORES.F_DETVALORES_DEP(PCEMPRES, PCVALOR, PCATRIBU,
	// PCVALORDEP)

	private HashMap callPAC_IAX_LISTVALORES__F_DETVALORES_DEP(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCATRIBU, java.math.BigDecimal pPCVALORDEP)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_DETVALORES_DEP(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCVALOR", "pPCATRIBU", "pPCVALORDEP" },
				new Object[] { pPCEMPRES, pPCVALOR, pPCATRIBU, pPCVALORDEP });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCVALOR);
		cStmt.setObject(4, pPCATRIBU);
		cStmt.setObject(5, pPCVALORDEP);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCATRIBU, java.math.BigDecimal pPCVALORDEP)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_DETVALORES_DEP(pPCEMPRES, pPCVALOR, pPCATRIBU, pPCVALORDEP);
	}
	// --END-PAC_IAX_LISTVALORES.F_DETVALORES_DEP

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPDOCUM_TIPPER(PCTIPPER)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(java.math.BigDecimal pPCTIPPER) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPDOCUM_TIPPER(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPER" }, new Object[] { pPCTIPPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPER);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	// INI IAXIS-5378
	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER_ROL(java.math.BigDecimal pPCTIPPER)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPDOCUM_TIPPER_ROL(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPER" }, new Object[] { pPCTIPPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPER);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER_ROL(java.math.BigDecimal pPCTIPPER)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER_ROL(pPCTIPPER);
	}// FIN IAXIS-5378

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(java.math.BigDecimal pPCTIPPER) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(pPCTIPPER);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPDOCUM_TIPPER

	// --START-PAC_IAX_LISTVALORES.F_GET_AGENTESTIPO(PCTIPAGE, PCIDIOMA, PCPADRE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(java.math.BigDecimal pPCTIPAGE,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCPADRE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_AGENTESTIPO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPAGE", "pPCIDIOMA", "pPCPADRE" },
				new Object[] { pPCTIPAGE, pPCIDIOMA, pPCPADRE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPAGE);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.setObject(4, pPCPADRE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(java.math.BigDecimal pPCTIPAGE,
			java.math.BigDecimal pPCIDIOMA, java.math.BigDecimal pPCPADRE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(pPCTIPAGE, pPCIDIOMA, pPCPADRE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_AGENTESTIPO

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTFORMULAS_UTILI(PCUTILI)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS_UTILI(java.math.BigDecimal pPCUTILI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTFORMULAS_UTILI(?, ?)}";

		logCall(callQuery, new String[] { "pPCUTILI" }, new Object[] { pPCUTILI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCUTILI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS_UTILI(java.math.BigDecimal pPCUTILI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS_UTILI(pPCUTILI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTFORMULAS_UTILI

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTDESCCOBRADORES(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTDESCCOBRADORES(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(java.math.BigDecimal pPCEMPRES)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(pPCEMPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTDESCCOBRADORES

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTDESCCOBRADORES_ALL(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES_ALL(java.math.BigDecimal pPCEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTDESCCOBRADORES_ALL(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES_ALL(java.math.BigDecimal pPCEMPRES)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES_ALL(pPCEMPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTDESCCOBRADORES_ALL

	// --START-PAC_IAX_LISTVALORES.F_GET_DESCOBRADORES_RAMO(PSPRODUC, PCBANCAR,
	// PCTIPBAN)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_DESCOBRADORES_RAMO(java.math.BigDecimal pPSPRODUC, String pPCBANCAR,
			java.math.BigDecimal pPCTIPBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_DESCOBRADORES_RAMO(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCBANCAR", "pPCTIPBAN" },
				new Object[] { pPSPRODUC, pPCBANCAR, pPCTIPBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCBANCAR);
		cStmt.setObject(4, pPCTIPBAN);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_DESCOBRADORES_RAMO(java.math.BigDecimal pPSPRODUC,
			String pPCBANCAR, java.math.BigDecimal pPCTIPBAN) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_DESCOBRADORES_RAMO(pPSPRODUC, pPCBANCAR, pPCTIPBAN); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_DESCOBRADORES_RAMO

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_COND(NUMIDE, NOMBRE, CAGENTE,
	// PFORMATO, PCCONDICION)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(String pNUMIDE, String pNOMBRE,
			java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPFORMATO, String pPCCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_COND(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNUMIDE", "pNOMBRE", "pCAGENTE", "pPFORMATO", "pPCCONDICION" },
				new Object[] { pNUMIDE, pNOMBRE, pCAGENTE, pPFORMATO, pPCCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNUMIDE);
		cStmt.setObject(3, pNOMBRE);
		cStmt.setObject(4, pCAGENTE);
		cStmt.setObject(5, pPFORMATO);
		cStmt.setObject(6, pPCCONDICION);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(String pNUMIDE, String pNOMBRE,
			java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPFORMATO, String pPCCONDICION) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(pNUMIDE, pNOMBRE, pCAGENTE, pPFORMATO, pPCCONDICION); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_COND

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_TIPAGE_COND(NUMIDE, NOMBRE,
	// CAGENTE, PFORMATO, PCCONDICION, PCTIPAGE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(String pNUMIDE, String pNOMBRE,
			java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPFORMATO, String pPCCONDICION,
			java.math.BigDecimal pPCTIPAGE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_TIPAGE_COND(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pNUMIDE", "pNOMBRE", "pCAGENTE", "pPFORMATO", "pPCCONDICION", "pPCTIPAGE" },
				new Object[] { pNUMIDE, pNOMBRE, pCAGENTE, pPFORMATO, pPCCONDICION, pPCTIPAGE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNUMIDE);
		cStmt.setObject(3, pNOMBRE);
		cStmt.setObject(4, pCAGENTE);
		cStmt.setObject(5, pPFORMATO);
		cStmt.setObject(6, pPCCONDICION);
		cStmt.setObject(7, pPCTIPAGE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(String pNUMIDE, String pNOMBRE,
			java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPFORMATO, String pPCCONDICION,
			java.math.BigDecimal pPCTIPAGE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(pNUMIDE, pNOMBRE, pCAGENTE, pPFORMATO,
				pPCCONDICION, pPCTIPAGE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_TIPAGE_COND

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_TIPAGE_COND(NUMIDE, NOMBRE,
	// CAGENTE, PFORMATO, PCCONDICION, PCTIPAGE, PPARTNER)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(String pNUMIDE, String pNOMBRE,
			java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPFORMATO, String pPCCONDICION,
			java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPPARTNER) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_TIPAGE_COND(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pNUMIDE", "pNOMBRE", "pCAGENTE", "pPFORMATO", "pPCCONDICION", "pPCTIPAGE",
						"pPPARTNER" },
				new Object[] { pNUMIDE, pNOMBRE, pCAGENTE, pPFORMATO, pPCCONDICION, pPCTIPAGE, pPPARTNER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNUMIDE);
		cStmt.setObject(3, pNOMBRE);
		cStmt.setObject(4, pCAGENTE);
		cStmt.setObject(5, pPFORMATO);
		cStmt.setObject(6, pPCCONDICION);
		cStmt.setObject(7, pPCTIPAGE);
		cStmt.setObject(9, pPPARTNER);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
			retVal.put("MENSAJES", cStmt.getObject(9));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(String pNUMIDE, String pNOMBRE,
			java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPFORMATO, String pPCCONDICION,
			java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPPARTNER) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(pNUMIDE, pNOMBRE, pCAGENTE, pPFORMATO,
				pPCCONDICION, pPCTIPAGE, pPPARTNER);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_TIPAGE_COND

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_DAT(NUMIDE, NOMBRE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_DAT(String pNUMIDE, String pNOMBRE, String pCAGENTE,
			BigDecimal pFORMATO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_DAT(?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pNUMIDE", "pNOMBRE", "pCAGENTE", "pFORMATO" },
				new Object[] { pNUMIDE, pNOMBRE, pCAGENTE, pFORMATO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pNUMIDE);
		cStmt.setObject(3, pNOMBRE);
		cStmt.setObject(4, pCAGENTE);
		cStmt.setObject(5, pFORMATO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_DAT(String pNUMIDE, String pNOMBRE, String pCAGENTE,
			BigDecimal pFORMATO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_DAT(pNUMIDE, pNOMBRE, pCAGENTE, pFORMATO);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGENTES_DAT

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGECOMISION(PCTIPO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(java.math.BigDecimal pPCTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGECOMISION(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPO" }, new Object[] { pPCTIPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(pPCTIPO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGECOMISION

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTESTADOAGENTE(PCEMPRES, PCVALOR,
	// PCATRIBU, PCTIPAGE, PCACTIVO)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCATRIBU, java.math.BigDecimal pPCTIPAGE,
			java.math.BigDecimal pPCACTIVO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTESTADOAGENTE(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPCVALOR", "pPCATRIBU", "pPCTIPAGE", "pPCACTIVO" },
				new Object[] { pPCEMPRES, pPCVALOR, pPCATRIBU, pPCTIPAGE, pPCACTIVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCVALOR);
		cStmt.setObject(4, pPCATRIBU);
		cStmt.setObject(5, pPCTIPAGE);
		cStmt.setObject(6, pPCACTIVO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCVALOR, java.math.BigDecimal pPCATRIBU, java.math.BigDecimal pPCTIPAGE,
			java.math.BigDecimal pPCACTIVO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(pPCEMPRES, pPCVALOR, pPCATRIBU, pPCTIPAGE,
				pPCACTIVO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTESTADOAGENTE

	private HashMap callPAC_IAX_LISTVALORES__F_GET_MONEDAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MONEDAS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MONEDAS(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MONEDAS
	// --START-PAC_IAX_LISTVALORES.F_GET_TMONEDA(PCMONEDA)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TMONEDA(java.math.BigDecimal pPCMONEDA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TMONEDA(?, ?)}";

		logCall(callQuery, new String[] { "pPCMONEDA" }, new Object[] { pPCMONEDA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMONEDA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TMONEDA(java.math.BigDecimal pPCMONEDA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TMONEDA(pPCMONEDA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TMONEDA

	// BUG 21924--ETM
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPRETRIBU()
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPRETRIBU(PCAGENTE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPRETRIBU(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPRETRIBU(?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPRETRIBU(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPRETRIBU(pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPRETRIBU

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTREVALFRANQ()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTREVALFRANQ() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTREVALFRANQ(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREVALFRANQ() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTREVALFRANQ(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTREVALFRANQ

	// FIN BUG 21924--ETM

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPCC()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPCC() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPCC(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPCC
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTTIPCC(PTIPOCTA)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(java.math.BigDecimal pPTIPOCTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPCC(?, ?)}";

		logCall(callQuery, new String[] { "pPTIPOCTA" }, new Object[] { pPTIPOCTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPOCTA);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(java.math.BigDecimal pPTIPOCTA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(pPTIPOCTA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPCC

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTAGEDESCUENTO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTAGEDESCUENTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTAGEDESCUENTO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGEDESCUENTO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTAGEDESCUENTO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTAGEDESCUENTO
	// bfp bug 21524 ini
	// --START-PAC_IAX_LISTVALORES.F_GET_LISTA_PROFESIONALES(PTIPOPROF)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LISTA_PROFESIONALES(java.math.BigDecimal pPTIPOPROF)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LISTA_PROFESIONALES(?, ?)}";

		logCall(callQuery, new String[] { "pPTIPOPROF" }, new Object[] { pPTIPOPROF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTIPOPROF);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LISTA_PROFESIONALES(java.math.BigDecimal pPTIPOPROF)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LISTA_PROFESIONALES(pPTIPOPROF); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LISTA_PROFESIONALES

	// --START-PAC_IAX_LISTVALORES.F_GET_LISTA_TRAMITADORES(PCRAMO, PCTRAMTE,
	// PCEMPRES, PCCAUSIN, PCMOTSIN, PCAGENTE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LISTA_TRAMITADORES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTRAMTE, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LISTA_TRAMITADORES(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCTRAMTE", "pPCEMPRES", "pPCCAUSIN", "pPCMOTSIN", "pPCAGENTE" },
				new Object[] { pPCRAMO, pPCTRAMTE, pPCEMPRES, pPCCAUSIN, pPCMOTSIN, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCTRAMTE);
		cStmt.setObject(4, pPCEMPRES);
		cStmt.setObject(5, pPCCAUSIN);
		cStmt.setObject(6, pPCMOTSIN);
		cStmt.setObject(7, pPCAGENTE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LISTA_TRAMITADORES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTRAMTE, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCAUSIN,
			java.math.BigDecimal pPCMOTSIN, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LISTA_TRAMITADORES(pPCRAMO, pPCTRAMTE, pPCEMPRES, pPCCAUSIN,
				pPCMOTSIN, pPCAGENTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LISTA_TRAMITADORES

	// --START-PAC_IAX_LISTVALORES.F_GET_TRAMITADORES(PCRAMO, PCTRAMTE)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TRAMITADORES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTRAMTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TRAMITADORES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCTRAMTE" }, new Object[] { pPCRAMO, pPCTRAMTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCTRAMTE);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TRAMITADORES(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCTRAMTE) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TRAMITADORES(pPCRAMO, pPCTRAMTE); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TRAMITADORES

	// bfp bug 21524 fi

	// --START-PAC_IAX_LISTVALORES.F_GET_COASEGURADORAS()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_COASEGURADORAS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_COASEGURADORAS

	// --START-PAC_IAX_LISTVALORES.F_GET_COMPANIAS(PSPRODUC, PCTIPCOM)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_COMPANIAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPCOM) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_COMPANIAS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCTIPCOM" }, new Object[] { pPSPRODUC, pPCTIPCOM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCTIPCOM);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPCOM) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_COMPANIAS(pPSPRODUC, pPCTIPCOM); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_COMPANIAS

	// --START-PAC_IAX_LISTVALORES.F_GET_LST_TIPOBENEFICIARIO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LST_TIPOBENEFICIARIO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LST_TIPOBENEFICIARIO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LST_TIPOBENEFICIARIO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LST_TIPOBENEFICIARIO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LST_TIPOBENEFICIARIO
	// --START-PAC_IAX_LISTVALORES.F_GET_LST_TIPOPARENTESCO()

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LST_TIPOPARENTESCO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LST_TIPOPARENTESCO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LST_TIPOPARENTESCO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LST_TIPOPARENTESCO(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LST_TIPOPARENTESCO
	// BUG 24685 2013-FEB-05 AEG seccion preimpresos

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTPREIMPRESOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTPREIMPRESOS(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPREIMPRESOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTPREIMPRESOS();
	}
	// fin BUG 24685 2013-FEB-05 AEG seccion preimpresos

	// Bug 0025584/135342 - 25/03/2013 - MMS
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTEDADESPROD(PSPRODUC)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTEDADESPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTEDADESPROD(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEDADESPROD(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTEDADESPROD(pPSPRODUC); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTEDADESPRO
	// Bug 0025584/135342 - 25/03/2013 - MMS
	// --START-PAC_IAX_LISTVALORES.F_DETVALORESCOND2(CLAVE, COND)

	private HashMap callPAC_IAX_LISTVALORES__F_DETVALORESCOND2(java.math.BigDecimal pCLAVE, String pCOND)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_DETVALORESCOND2(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCLAVE", "pCOND" }, new Object[] { pCLAVE, pCOND });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
		cStmt.setObject(3, pCOND);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(java.math.BigDecimal pCLAVE, String pCOND)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_DETVALORESCOND2(pCLAVE, pCOND); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_DETVALORESCOND2

	// --START-PAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(EMPRESA)
	// Bug 0027650/ - 01/08/2013 - JGUTIERREZ - Jenny Gutierrez

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(java.math.BigDecimal pEMPRESA) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(pEMPRESA);
	}

	private HashMap callPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(java.math.BigDecimal pP_CEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_GESTORESCOMPANIA(?, ?)}";

		logCall(callQuery, new String[] { "pP_CEMPRES" }, new Object[] { pP_CEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_CEMPRES);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}
	// --END-PAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(EMPRESA)

	// --START-PAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(GESTOR)
	// Bug 0027650/ - 01/08/2013 - JGUTIERREZ - Jenny Gutierrez

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(java.math.BigDecimal pGESTOR) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(pGESTOR);
	}

	private HashMap callPAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(java.math.BigDecimal pP_TGESTOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_FORMATOSGESTOR(?, ?)}";

		logCall(callQuery, new String[] { "pP_TGESTOR" }, new Object[] { pP_TGESTOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pP_TGESTOR);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}
	// --END-PAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(EMPRESA)

	// --START-PAC_IAX_LISTVALORES__F_GET_LSTPROCESOERR()
	// Bug 0027650/ - 01/08/2013 - JGUTIERREZ - Jenny Gutierrez

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROCESOERR() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTPROCESOERR();
	}

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTPROCESOERR() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTPROCESOERR(?)}";

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
			retVal.put("MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}
	// --END-PAC_IAX_LISTVALORES__F_GET_LSTPROCESOERR(EMPRESA)

	// --START-PAC_IAX_LISTVALORES.F_GET_MONEDAS_COND(PCCONDICION)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_MONEDAS_COND(String pPCCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MONEDAS_COND(?, ?)}";

		logCall(callQuery, new String[] { "pPCCONDICION" }, new Object[] { pPCCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCONDICION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS_COND(String pPCCONDICION) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MONEDAS_COND(pPCCONDICION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MONEDAS_COND

	// --START-PAC_IAX_LISTVALORES.F_GET_COMPANIAS(PSPRODUC, PCTIPCOM, PAXISREA037)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_COMPANIAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPCOM, java.math.BigDecimal pPAXISREA037) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_COMPANIAS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPRODUC", "pPCTIPCOM", "pPAXISREA037" },
				new Object[] { pPSPRODUC, pPCTIPCOM, pPAXISREA037 });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.setObject(3, pPCTIPCOM);
		cStmt.setObject(5, pPAXISREA037);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCTIPCOM, java.math.BigDecimal pPAXISREA037) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_COMPANIAS(pPSPRODUC, pPCTIPCOM, pPAXISREA037);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_COMPANIAS

	// --START-PAC_IAX_LISTVALORES.F_GET_CAPLICAINDICADORCIA()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_CAPLICAINDICADORCIA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CAPLICAINDICADORCIA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CAPLICAINDICADORCIA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CAPLICAINDICADORCIA();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CAPLICAINDICADORCIA

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTBANCOS_PAGOS(PCBANCO, PTBANCO, PCFORPAG)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTBANCOS_PAGOS(java.math.BigDecimal pPCBANCO, String pPTBANCO,
			java.math.BigDecimal pPCFORPAG) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTBANCOS_PAGOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCBANCO", "pPTBANCO", "pPCFORPAG" },
				new Object[] { pPCBANCO, pPTBANCO, pPCFORPAG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCBANCO);
		cStmt.setObject(3, pPTBANCO);
		cStmt.setObject(5, pPCFORPAG);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS_PAGOS(java.math.BigDecimal pPCBANCO, String pPTBANCO,
			java.math.BigDecimal pPCFORPAG) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTBANCOS_PAGOS(pPCBANCO, pPTBANCO, pPCFORPAG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTBANCOS_PAGOS

	// --START-PAC_IAX_LISTVALORES.F_GET_MUNICIPIOS_PAGOS()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_MUNICIPIOS_PAGOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MUNICIPIOS_PAGOS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MUNICIPIOS_PAGOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MUNICIPIOS_PAGOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MUNICIPIOS_PAGOS

	// --START-PAC_IAX_LISTVALORES.F_GET_RANK_PLEDGE()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_RANK_PLEDGE() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RANK_PLEDGE(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RANK_PLEDGE() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RANK_PLEDGE();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_RANK_PLEDGE

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPO_CAUSA(PCMOTMOV)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPO_CAUSA(java.math.BigDecimal pPCMOTMOV) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPO_CAUSA(?, ?)}";

		logCall(callQuery, new String[] { "pPCMOTMOV" }, new Object[] { pPCMOTMOV });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMOTMOV);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPO_CAUSA(java.math.BigDecimal pPCMOTMOV) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPO_CAUSA(pPCMOTMOV);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPO_CAUSA

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTMONTO()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTMONTO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTMONTO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMONTO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTMONTO();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_LSTMONTO_MSV
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTREEMBOLSO()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTREEMBOLSO() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTREEMBOLSO(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREEMBOLSO() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTREEMBOLSO();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_LSTREEMBOLSO
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTSTATUS
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTSTATUS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTSTATUS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTSTATUS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTSTATUS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTSTATUS_MSV

	// --START-PAC_IAX_LISTVALORES.F_GET_BANCOS()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_BANCOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_BANCOS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_BANCOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_BANCOS();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_BANCOS

	// 34866/209952
	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LST_TIPOCONTINGENCIAS(java.math.BigDecimal pCLAVE)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LST_TIPOCONTINGENCIAS(pCLAVE);
	}

	private HashMap callPAC_IAX_LISTVALORES__F_GET_LST_TIPOCONTINGENCIAS(BigDecimal pCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LST_TIPOCONTINGENCIAS(?,?)}";
		logCall(callQuery, new String[] { "pCLAVE" }, new Object[] { pCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCLAVE);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTPRODPROYP()
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTPRODPROYP() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTPRODPROYP(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPRODPROYP() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTPRODPROYP();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTPRODPROYP

	// --START-PAC_IAX_LISTVALORES.F_GET_LSTPROYPROVIS(PSPRODUC)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTPROYPROVIS(java.math.BigDecimal pPSPRODUC) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTPROYPROVIS(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROYPROVIS(java.math.BigDecimal pPSPRODUC) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTPROYPROVIS(pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_LSTPROYPROVIS
	// --START-PAC_IAX_LISTVALORES.F_GET_LSTMODALI(PCRAMO)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTMODALI(java.math.BigDecimal pPCRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTMODALI(?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO" }, new Object[] { pPCRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMODALI(java.math.BigDecimal pPCRAMO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTMODALI(pPCRAMO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTMODALI

	// --START-PAC_IAX_LISTVALORES.F_GET_CIIU(CODIGO, CONDICION)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_CIIU(String pCODIGO, String pCONDICION) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CIIU(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCODIGO", "pCONDICION" }, new Object[] { pCODIGO, pCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCODIGO);
		cStmt.setObject(3, pCONDICION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CIIU(String pCODIGO, String pCONDICION) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CIIU(pCODIGO, pCONDICION);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_CIIU

	// --START-PAC_IAX_LISTVALORES.F_GET_TIPO_PERSONA_REL_DES(PCTIPPER)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPO_PERSONA_REL_DES(java.math.BigDecimal pPCTIPPER)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPO_PERSONA_REL_DES(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPER" }, new Object[] { pPCTIPPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPER);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPO_PERSONA_REL_DES(java.math.BigDecimal pPCTIPPER)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPO_PERSONA_REL_DES(pPCTIPPER);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_TIPO_PERSONA_REL_DES

	// --START-PAC_IAX_LISTVALORES.F_GET_ACTIVIGRUPO(PCGRUPO)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_ACTIVIGRUPO(String pPCGRUPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_ACTIVIGRUPO(?, ?)}";

		logCall(callQuery, new String[] { "pPCGRUPO" }, new Object[] { pPCGRUPO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGRUPO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_ACTIVIGRUPO(String pPCGRUPO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_ACTIVIGRUPO(pPCGRUPO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_ACTIVIGRUPO

	// --START-PAC_IAX_LISTVALORES.F_GET_AGRUPACIONES_CONSORCIOS(SPERSON)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES_CONSORCIOS(java.math.BigDecimal pSPERSON, String pPMODO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_AGRUPACIONES_CONSORCIOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pSPERSON", "pPMODO" }, new Object[] { pSPERSON, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pSPERSON);
		cStmt.setObject(3, pPMODO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES_CONSORCIOS(java.math.BigDecimal pSPERSON,
			String pPMODO) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES_CONSORCIOS(pSPERSON, pPMODO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_AGRUPACIONES_CONSORCIOS
	// --START-PAC_IAX_LISTVALORES.F_GET_CRAMO_CONV(PCEMPRES)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_CRAMO_CONV(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_CRAMO_CONV(?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_CONV(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_CRAMO_CONV(pPCEMPRES);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_CRAMO_CONV
	// --START-PAC_IAX_LISTVALORES__F_GET_LSTVINCULOS
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTVINCULOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTVINCULOS(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTVINCULOS() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTVINCULOS();
	}

	// --END-PAC_IAX_LISTVALORES__F_GET_LSTVINCULOS
	private HashMap callPAC_IAX_LISTVALORES__F_GET_LSTTIPCOMP() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_LSTTIPCOMP(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCOMP() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_LSTTIPCOMP();
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_LSTTIPOAGENTE

	// TCS_827 - ACL - 27/02/2019 Se agrega función F_GET_RAMO_CONTRAG
	// --START-PAC_IAX_LISTVALORES.F_GET_RAMO_CONTRAG(PCEMPRES)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMO_CONTRAG(String pPtipo, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMO_CONTRAG(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPtipo);
		cStmt.setObject(3, pPCEMPRES);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMO_CONTRAG(String pPtipo, java.math.BigDecimal pPCEMPRES)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMO_CONTRAG(pPtipo, pPCEMPRES);
	}

	// --END-PAC_IAX_LISTVALORES.F_GET_RAMO_CONTRAG
	// --START-PAC_IAX_LISTVALORES.F_GET_RAMO_CONTRAG(PCRAMO, PCACTIVI)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_PRODACTIVIDAD(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_PRODACTIVIDAD(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPCACTIVI" }, new Object[] { pPCRAMO, pPCACTIVI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPCACTIVI);
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
	// --END-PAC_IAX_LISTVALORES.F_GET_PRODACTIVIDAD

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_PRODACTIVIDAD(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCACTIVI) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_PRODACTIVIDAD(pPCRAMO, pPCACTIVI);
	}

	// --START-PAC_IAX_LISTVALORES.F_GET_AGRUPA_CONSORCIOS(PCEMPRES)
	private HashMap callPAC_IAX_LISTVALORES__F_GET_AGRUPA_CONSORCIOS(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_AGRUPA_CONSORCIOS(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPA_CONSORCIOS(java.math.BigDecimal pPSPERSON)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_AGRUPA_CONSORCIOS(pPSPERSON);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_AGRUPA_CONSORCIOS

	/* IAXIS-13881 : Cambios de facturacion electronica : Start */
	private HashMap callPAC_IAX_LISTVALORES__F_GET_FISCALES_ADQUIRIENTE(String pCODIGO, String pCONDICION)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_FISCALES_ADQUIRIENTE(?, ?, ?)}";

		logCall(callQuery, new String[] { "pCODIGO", "pCONDICION" }, new Object[] { pCODIGO, pCONDICION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCODIGO);
		cStmt.setObject(3, pCONDICION);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_FISCALES_ADQUIRIENTE(String pCODIGO, String pCONDICION)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_FISCALES_ADQUIRIENTE(pCODIGO, pCONDICION);// AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_LISTVALORES__F_GET_RESPONSABLE_IVA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RESPONSABLE_IVA(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RESPONSABLE_IVA() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RESPONSABLE_IVA();
	}

	/* IAXIS-13881 : Cambios de facturacion electronica : End */

	// IAXIS-14479 26/10/2020 BJHB
	private HashMap callPAC_IAX_LISTVALORES__F_GET_SUCURSALES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_SUCURSALES(?)}";
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

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_SUCURSALES() throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_SUCURSALES();
	}
	// IAXIS-14479 26/10/2020 BJHB

	/* Cambios para IAXIS-15339 :Start */

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER_CIFIN(java.math.BigDecimal pPCTIPPER)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER_CIFIN(pPCTIPPER);
	}

	private HashMap callPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER_CIFIN(java.math.BigDecimal pPCTIPPER)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_TIPDOCUM_TIPPER_CIFIN(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPPER" }, new Object[] { pPCTIPPER });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPPER);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;

	}

	/* Cambios para IAXIS-15339 :End */
}
