package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_GFI extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_GFI.class);
	private Connection conn = null;

	public PAC_IAX_GFI(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_GFI.F_GET_CLAVES()

	private HashMap callPAC_IAX_GFI__F_GET_CLAVES() throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_CLAVES(?)}";
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_CLAVES() throws Exception {
		return this.callPAC_IAX_GFI__F_GET_CLAVES();
	}
	// --END-PAC_IAX_GFI.F_GET_CLAVES

	// --START-PAC_IAX_GFI.F_GET_FORMULA(PCLAVE)

	private HashMap callPAC_IAX_GFI__F_GET_FORMULA(java.math.BigDecimal pPCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_FORMULA(?,?)}";
		logCall(callQuery, new String[] { "pPCLAVE" }, new Object[] { pPCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCLAVE);

		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_GFIFORM".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_FORMULA(java.math.BigDecimal pPCLAVE) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_FORMULA(pPCLAVE);
	}
	// --END-PAC_IAX_GFI.F_GET_FORMULA

	// --START-PAC_IAX_GFI.F_GET_LSTPARAMETROS()

	private HashMap callPAC_IAX_GFI__F_GET_LSTPARAMETROS() throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_LSTPARAMETROS(?)}";
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_LSTPARAMETROS() throws Exception {
		return this.callPAC_IAX_GFI__F_GET_LSTPARAMETROS();
	}
	// --END-PAC_IAX_GFI.F_GET_LSTPARAMETROS
	// --START-PAC_IAX_GFI.F_GET_PARAMETROS(PCLAVE)

	private HashMap callPAC_IAX_GFI__F_GET_PARAMETROS(java.math.BigDecimal pPCLAVE) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_PARAMETROS(?,?)}";
		logCall(callQuery, new String[] { "pPCLAVE" }, new Object[] { pPCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCLAVE);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GFIPARAM".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_PARAMETROS(java.math.BigDecimal pPCLAVE) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_PARAMETROS(pPCLAVE);
	}
	// --END-PAC_IAX_GFI.F_GET_PARAMETROS

	// --START-PAC_IAX_GFI.F_GET_RASTRO()

	private HashMap callPAC_IAX_GFI__F_GET_RASTRO() throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_RASTRO(?)}";
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_RASTRO() throws Exception {
		return this.callPAC_IAX_GFI__F_GET_RASTRO();
	}
	// --END-PAC_IAX_GFI.F_GET_RASTRO
	// --START-PAC_IAX_GFI.F_GET_UTILI()

	private HashMap callPAC_IAX_GFI__F_GET_UTILI() throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_UTILI(?)}";
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GFI__F_GET_UTILI() throws Exception {
		return this.callPAC_IAX_GFI__F_GET_UTILI();
	}

	// --END-PAC_IAX_GFI.F_GET_UTILI
	// --START-PAC_IAX_GFI.F_GRABAR_FORMULA(FORMULA)
	private HashMap callPAC_IAX_GFI__F_GRABAR_FORMULA(Object pFORMULA) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GRABAR_FORMULA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pFORMULA" }, new Object[] { pFORMULA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pFORMULA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PSCLAVE"
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
			retVal.put("PSCLAVE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PSCLAVE", null);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GRABAR_FORMULA(Object pFORMULA) throws Exception {
		return this.callPAC_IAX_GFI__F_GRABAR_FORMULA(pFORMULA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GFI.F_GRABAR_FORMULA

	// --START-PAC_IAX_GFI.F_SET_CONSULTA(PCLAVE, PCODIGO, PFORMULA, PCRAMO,
	// PCRASTRO, PCUTILI)
	private HashMap callPAC_IAX_GFI__F_SET_CONSULTA(java.math.BigDecimal pPCLAVE, String pPCODIGO, String pPFORMULA,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCRASTRO, java.math.BigDecimal pPCUTILI)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_SET_CONSULTA(?,?,?,?,?,?,?)}";
		logCall(callQuery, new String[] { "pPCLAVE", "pPCODIGO", "pPFORMULA", "pPCRAMO", "pPCRASTRO", "pPCUTILI" },
				new Object[] { pPCLAVE, pPCODIGO, pPFORMULA, pPCRAMO, pPCRASTRO, pPCUTILI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCLAVE);
		cStmt.setObject(3, pPCODIGO);
		cStmt.setObject(4, pPFORMULA);
		cStmt.setObject(5, pPCRAMO);
		cStmt.setObject(6, pPCRASTRO);
		cStmt.setObject(7, pPCUTILI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_GFITREE".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_GFI__F_SET_CONSULTA(java.math.BigDecimal pPCLAVE, String pPCODIGO, String pPFORMULA,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCRASTRO, java.math.BigDecimal pPCUTILI)
			throws Exception {
		return this.callPAC_IAX_GFI__F_SET_CONSULTA(pPCLAVE, pPCODIGO, pPFORMULA, pPCRAMO, pPCRASTRO, pPCUTILI);
	}
	// --END-PAC_IAX_GFI.F_SET_CONSULTA

	// --START-PAC_IAX_GFI.F_SET_ELIMINARFORMPARAM(PCLAVE, PPARAMETRO)

	private HashMap callPAC_IAX_GFI__F_SET_ELIMINARFORMPARAM(String pPCLAVE, String pPPARAMETRO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_SET_ELIMINARFORMPARAM(?,?,?)}";
		logCall(callQuery, new String[] { "pPCLAVE", "pPPARAMETRO" }, new Object[] { pPCLAVE, pPPARAMETRO });
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		CallableStatement cStmt = conn.prepareCall(callQuery);
		cStmt.setObject(2, pPCLAVE);
		cStmt.setObject(3, pPPARAMETRO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_SET_ELIMINARFORMPARAM(String pPCLAVE, String pPPARAMETRO) throws Exception {
		return this.callPAC_IAX_GFI__F_SET_ELIMINARFORMPARAM(pPCLAVE, pPPARAMETRO);
	}

	// --END-PAC_IAX_GFI.F_SET_ELIMINARFORMPARAM
	// --START-PAC_IAX_GFI.F_SET_GRABARFORMPARAMETROS(PPARAMS)
	private HashMap callPAC_IAX_GFI__F_SET_GRABARFORMPARAMETROS(Object pPPARAMS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_SET_GRABARFORMPARAMETROS(?,?)}";
		logCall(callQuery, new String[] { "pPPARAMS" }, new Object[] { pPPARAMS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPPARAMS);
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

	public HashMap ejecutaPAC_IAX_GFI__F_SET_GRABARFORMPARAMETROS(Object pPPARAMS) throws Exception {
		return this.callPAC_IAX_GFI__F_SET_GRABARFORMPARAMETROS(pPPARAMS);
	}
	// --END-PAC_IAX_GFI.F_SET_GRABARFORMPARAMETROS

	// --START-PAC_IAX_GFI.F_ELIMINARTERMINO(PTERMINO)
	private HashMap callPAC_IAX_GFI__F_ELIMINARTERMINO(String pPTERMINO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_ELIMINARTERMINO(?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO" }, new Object[] { pPTERMINO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_ELIMINARTERMINO(String pPTERMINO) throws Exception {
		return this.callPAC_IAX_GFI__F_ELIMINARTERMINO(pPTERMINO);
	}

	// --END-PAC_IAX_GFI.F_ELIMINARTERMINO
	// --START-PAC_IAX_GFI.F_ELIMINARTERMVIGEN(PTERMINO, PCLAVE)
	private HashMap callPAC_IAX_GFI__F_ELIMINARTERMVIGEN(String pPTERMINO, java.math.BigDecimal pPCLAVE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_ELIMINARTERMVIGEN(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO", "pPCLAVE" }, new Object[] { pPTERMINO, pPCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
		cStmt.setObject(3, pPCLAVE);
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

	public HashMap ejecutaPAC_IAX_GFI__F_ELIMINARTERMVIGEN(String pPTERMINO, java.math.BigDecimal pPCLAVE)
			throws Exception {
		return this.callPAC_IAX_GFI__F_ELIMINARTERMVIGEN(pPTERMINO, pPCLAVE);
	}

	// --END-PAC_IAX_GFI.F_ELIMINARTERMVIGEN
	// --START-PAC_IAX_GFI.F_GET_LSTOPERADOR()
	private HashMap callPAC_IAX_GFI__F_GET_LSTOPERADOR() throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_LSTOPERADOR(?)}";

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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_LSTOPERADOR() throws Exception {
		return this.callPAC_IAX_GFI__F_GET_LSTOPERADOR();
	}

	// --END-PAC_IAX_GFI.F_GET_LSTOPERADOR
	// --START-PAC_IAX_GFI.F_GET_LSTORIGEN()
	private HashMap callPAC_IAX_GFI__F_GET_LSTORIGEN() throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_LSTORIGEN(?)}";

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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_LSTORIGEN() throws Exception {
		return this.callPAC_IAX_GFI__F_GET_LSTORIGEN();
	}

	// --END-PAC_IAX_GFI.F_GET_LSTORIGEN
	// --START-PAC_IAX_GFI.F_GET_LSTTIPOTERM()
	private HashMap callPAC_IAX_GFI__F_GET_LSTTIPOTERM() throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_LSTTIPOTERM(?)}";

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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_LSTTIPOTERM() throws Exception {
		return this.callPAC_IAX_GFI__F_GET_LSTTIPOTERM();
	}

	// --END-PAC_IAX_GFI.F_GET_LSTTIPOTERM
	// --START-PAC_IAX_GFI.F_GET_TERMINO(PTERMINO)
	private HashMap callPAC_IAX_GFI__F_GET_TERMINO(String pPTERMINO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_TERMINO(?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO" }, new Object[] { pPTERMINO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_TERMINO(String pPTERMINO) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_TERMINO(pPTERMINO);
	}

	// --END-PAC_IAX_GFI.F_GET_TERMINO
	// --START-PAC_IAX_GFI.F_GET_TERMINOS(PTERMINO, PTIPO, PORIGEN, PTDESC,
	// POPERADOR)
	private HashMap callPAC_IAX_GFI__F_GET_TERMINOS(String pPTERMINO, String pPTIPO, java.math.BigDecimal pPORIGEN,
			String pPTDESC, java.math.BigDecimal pPOPERADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_TERMINOS(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO", "pPTIPO", "pPORIGEN", "pPTDESC", "pPOPERADOR" },
				new Object[] { pPTERMINO, pPTIPO, pPORIGEN, pPTDESC, pPOPERADOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
		cStmt.setObject(3, pPTIPO);
		cStmt.setObject(4, pPORIGEN);
		cStmt.setObject(5, pPTDESC);
		cStmt.setObject(6, pPOPERADOR);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_GFI__F_GET_TERMINOS(String pPTERMINO, String pPTIPO, java.math.BigDecimal pPORIGEN,
			String pPTDESC, java.math.BigDecimal pPOPERADOR) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_TERMINOS(pPTERMINO, pPTIPO, pPORIGEN, pPTDESC, pPOPERADOR);
	}

	// --END-PAC_IAX_GFI.F_GET_TERMINOS
	// --START-PAC_IAX_GFI.F_GET_TERMVIGENCIA(PTERMINO, PCLAVE)
	private HashMap callPAC_IAX_GFI__F_GET_TERMVIGENCIA(String pPTERMINO, java.math.BigDecimal pPCLAVE)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_TERMVIGENCIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO", "pPCLAVE" }, new Object[] { pPTERMINO, pPCLAVE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
		cStmt.setObject(3, pPCLAVE);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_TERMVIGENCIA(String pPTERMINO, java.math.BigDecimal pPCLAVE)
			throws Exception {
		return this.callPAC_IAX_GFI__F_GET_TERMVIGENCIA(pPTERMINO, pPCLAVE);
	}

	// --END-PAC_IAX_GFI.F_GET_TERMVIGENCIA
	// --START-PAC_IAX_GFI.F_GET_TERMVIGENCIAS(PTERMINO)
	private HashMap callPAC_IAX_GFI__F_GET_TERMVIGENCIAS(String pPTERMINO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_TERMVIGENCIAS(?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO" }, new Object[] { pPTERMINO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_TERMVIGENCIAS(String pPTERMINO) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_TERMVIGENCIAS(pPTERMINO);
	}

	// --END-PAC_IAX_GFI.F_GET_TERMVIGENCIAS
	// --START-PAC_IAX_GFI.F_GRABARTERMINO(PTERMINO, PTIPO, PORIGEN, PTDESC,
	// POPERADOR, PISNEW)
	private HashMap callPAC_IAX_GFI__F_GRABARTERMINO(String pPTERMINO, String pPTIPO, java.math.BigDecimal pPORIGEN,
			String pPTDESC, java.math.BigDecimal pPOPERADOR, java.math.BigDecimal pPISNEW) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GRABARTERMINO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO", "pPTIPO", "pPORIGEN", "pPTDESC", "pPOPERADOR", "pPISNEW" },
				new Object[] { pPTERMINO, pPTIPO, pPORIGEN, pPTDESC, pPOPERADOR, pPISNEW });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
		cStmt.setObject(3, pPTIPO);
		cStmt.setObject(4, pPORIGEN);
		cStmt.setObject(5, pPTDESC);
		cStmt.setObject(6, pPOPERADOR);
		cStmt.setObject(7, pPISNEW);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GRABARTERMINO(String pPTERMINO, String pPTIPO, java.math.BigDecimal pPORIGEN,
			String pPTDESC, java.math.BigDecimal pPOPERADOR, java.math.BigDecimal pPISNEW) throws Exception {
		return this.callPAC_IAX_GFI__F_GRABARTERMINO(pPTERMINO, pPTIPO, pPORIGEN, pPTDESC, pPOPERADOR, pPISNEW);
	}
	// --END-PAC_IAX_GFI.F_GRABARTERMINO

	// --START-PAC_IAX_GFI.F_GRABARTERMVIG(PTERMINO, PCLAVE, PFECHAEFE, PCVALOR,
	// ISNEW)
	private HashMap callPAC_IAX_GFI__F_GRABARTERMVIG(String pPTERMINO, java.math.BigDecimal pPCLAVE,
			java.sql.Date pPFECHAEFE, java.math.BigDecimal pPCVALOR, java.math.BigDecimal pISNEW) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GRABARTERMVIG(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO", "pPCLAVE", "pPFECHAEFE", "pPCVALOR", "pISNEW" },
				new Object[] { pPTERMINO, pPCLAVE, pPFECHAEFE, pPCVALOR, pISNEW });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
		cStmt.setObject(3, pPCLAVE);
		cStmt.setObject(4, pPFECHAEFE);
		cStmt.setObject(5, pPCVALOR);
		cStmt.setObject(6, pISNEW);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GRABARTERMVIG(String pPTERMINO, java.math.BigDecimal pPCLAVE,
			java.sql.Date pPFECHAEFE, java.math.BigDecimal pPCVALOR, java.math.BigDecimal pISNEW) throws Exception {
		return this.callPAC_IAX_GFI__F_GRABARTERMVIG(pPTERMINO, pPCLAVE, pPFECHAEFE, pPCVALOR, pISNEW);
	}
	// --END-PAC_IAX_GFI.F_GRABARTERMVIG

	// --START-PAC_IAX_GFI.F_CONSULTRAM(PTRAMO, PCONCEPTO)
	private HashMap callPAC_IAX_GFI__F_CONSULTRAM(java.math.BigDecimal pPTRAMO, String pPCONCEPTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_CONSULTRAM(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTRAMO", "pPCONCEPTO" }, new Object[] { pPTRAMO, pPCONCEPTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTRAMO);
		cStmt.setObject(3, pPCONCEPTO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_CONSULTRAM(java.math.BigDecimal pPTRAMO, String pPCONCEPTO) throws Exception {
		return this.callPAC_IAX_GFI__F_CONSULTRAM(pPTRAMO, pPCONCEPTO);
	}

	// --END-PAC_IAX_GFI.F_CONSULTRAM
	// --START-PAC_IAX_GFI.F_ELIMINARDETVIGENCIA(PDETALLETRAMO, PORDEN)
	private HashMap callPAC_IAX_GFI__F_ELIMINARDETVIGENCIA(java.math.BigDecimal pPDETALLETRAMO,
			java.math.BigDecimal pPORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_ELIMINARDETVIGENCIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPDETALLETRAMO", "pPORDEN" }, new Object[] { pPDETALLETRAMO, pPORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPDETALLETRAMO);
		cStmt.setObject(3, pPORDEN);
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

	public HashMap ejecutaPAC_IAX_GFI__F_ELIMINARDETVIGENCIA(java.math.BigDecimal pPDETALLETRAMO,
			java.math.BigDecimal pPORDEN) throws Exception {
		return this.callPAC_IAX_GFI__F_ELIMINARDETVIGENCIA(pPDETALLETRAMO, pPORDEN);
	}
	// --END-PAC_IAX_GFI.F_ELIMINARDETVIGENCIA

	// --START-PAC_IAX_GFI.F_ELIMINARTRAMO(PTRAMO)
	private HashMap callPAC_IAX_GFI__F_ELIMINARTRAMO(java.math.BigDecimal pPTRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_ELIMINARTRAMO(?, ?)}";

		logCall(callQuery, new String[] { "pPTRAMO" }, new Object[] { pPTRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTRAMO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_ELIMINARTRAMO(java.math.BigDecimal pPTRAMO) throws Exception {
		return this.callPAC_IAX_GFI__F_ELIMINARTRAMO(pPTRAMO);
	}

	// --END-PAC_IAX_GFI.F_ELIMINARTRAMO
	// --START-PAC_IAX_GFI.F_ELIMINARVIGENCIA(PTRAMO, PDETALLETRAMO)
	private HashMap callPAC_IAX_GFI__F_ELIMINARVIGENCIA(java.math.BigDecimal pPTRAMO,
			java.math.BigDecimal pPDETALLETRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_ELIMINARVIGENCIA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTRAMO", "pPDETALLETRAMO" }, new Object[] { pPTRAMO, pPDETALLETRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTRAMO);
		cStmt.setObject(3, pPDETALLETRAMO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_ELIMINARVIGENCIA(java.math.BigDecimal pPTRAMO,
			java.math.BigDecimal pPDETALLETRAMO) throws Exception {
		return this.callPAC_IAX_GFI__F_ELIMINARVIGENCIA(pPTRAMO, pPDETALLETRAMO);
	}
	// --END-PAC_IAX_GFI.F_ELIMINARVIGENCIA

	// --START-PAC_IAX_GFI.F_GET_DETVIGTRAMOS(PDETALLETRAMO)
	private HashMap callPAC_IAX_GFI__F_GET_DETVIGTRAMOS(java.math.BigDecimal pPDETALLETRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_DETVIGTRAMOS(?, ?)}";

		logCall(callQuery, new String[] { "pPDETALLETRAMO" }, new Object[] { pPDETALLETRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPDETALLETRAMO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_DETVIGTRAMOS(java.math.BigDecimal pPDETALLETRAMO) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_DETVIGTRAMOS(pPDETALLETRAMO);
	}
	// --END-PAC_IAX_GFI.F_GET_DETVIGTRAMOS

	// --START-PAC_IAX_GFI.F_GET_TRAMO(PTRAMO)
	private HashMap callPAC_IAX_GFI__F_GET_TRAMO(java.math.BigDecimal pPTRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_TRAMO(?, ?)}";

		logCall(callQuery, new String[] { "pPTRAMO" }, new Object[] { pPTRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTRAMO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_TRAMO(java.math.BigDecimal pPTRAMO) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_TRAMO(pPTRAMO);
	}
	// --END-PAC_IAX_GFI.F_GET_TRAMO

	// --START-PAC_IAX_GFI.F_GET_VIGTRAMOS(PTRAMO)
	private HashMap callPAC_IAX_GFI__F_GET_VIGTRAMOS(java.math.BigDecimal pPTRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GET_VIGTRAMOS(?, ?)}";

		logCall(callQuery, new String[] { "pPTRAMO" }, new Object[] { pPTRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTRAMO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GET_VIGTRAMOS(java.math.BigDecimal pPTRAMO) throws Exception {
		return this.callPAC_IAX_GFI__F_GET_VIGTRAMOS(pPTRAMO);
	}

	// --END-PAC_IAX_GFI.F_GET_VIGTRAMOS
	// --START-PAC_IAX_GFI.F_GRABARDETVIGTRAM(PDETALLETRAMO, PORDEN, PDESDE, PHASTA,
	// PVALOR)
	private HashMap callPAC_IAX_GFI__F_GRABARDETVIGTRAM(java.math.BigDecimal pPDETALLETRAMO,
			java.math.BigDecimal pPORDEN, java.math.BigDecimal pPDESDE, java.math.BigDecimal pPHASTA,
			java.math.BigDecimal pPVALOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GRABARDETVIGTRAM(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPDETALLETRAMO", "pPORDEN", "pPDESDE", "pPHASTA", "pPVALOR" },
				new Object[] { pPDETALLETRAMO, pPORDEN, pPDESDE, pPHASTA, pPVALOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPDETALLETRAMO);
		cStmt.setObject(3, pPORDEN);
		cStmt.setObject(4, pPDESDE);
		cStmt.setObject(5, pPHASTA);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GRABARDETVIGTRAM(java.math.BigDecimal pPDETALLETRAMO,
			java.math.BigDecimal pPORDEN, java.math.BigDecimal pPDESDE, java.math.BigDecimal pPHASTA,
			java.math.BigDecimal pPVALOR) throws Exception {
		return this.callPAC_IAX_GFI__F_GRABARDETVIGTRAM(pPDETALLETRAMO, pPORDEN, pPDESDE, pPHASTA, pPVALOR);
	}

	// --END-PAC_IAX_GFI.F_GRABARDETVIGTRAM
	// --START-PAC_IAX_GFI.F_GRABARTRAMO(PTRAMO, PCONCEPTO, PCPTFRANJA, PCPTVALOR,
	// PISNUEVO)
	private HashMap callPAC_IAX_GFI__F_GRABARTRAMO(java.math.BigDecimal pPTRAMO, String pPCONCEPTO, String pPCPTFRANJA,
			String pPCPTVALOR, java.math.BigDecimal pPISNUEVO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GRABARTRAMO(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTRAMO", "pPCONCEPTO", "pPCPTFRANJA", "pPCPTVALOR", "pPISNUEVO" },
				new Object[] { pPTRAMO, pPCONCEPTO, pPCPTFRANJA, pPCPTVALOR, pPISNUEVO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTRAMO);
		cStmt.setObject(3, pPCONCEPTO);
		cStmt.setObject(4, pPCPTFRANJA);
		cStmt.setObject(5, pPCPTVALOR);
		cStmt.setObject(6, pPISNUEVO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GRABARTRAMO(java.math.BigDecimal pPTRAMO, String pPCONCEPTO,
			String pPCPTFRANJA, String pPCPTVALOR, java.math.BigDecimal pPISNUEVO) throws Exception {
		return this.callPAC_IAX_GFI__F_GRABARTRAMO(pPTRAMO, pPCONCEPTO, pPCPTFRANJA, pPCPTVALOR, pPISNUEVO);
	}
	// --END-PAC_IAX_GFI.F_GRABARTRAMO

	// --START-PAC_IAX_GFI.F_GRABARVIGTRAM(PTRAMO, PFECHAEFECTO, PDETALLETRAMO)
	private HashMap callPAC_IAX_GFI__F_GRABARVIGTRAM(java.math.BigDecimal pPTRAMO, java.sql.Date pPFECHAEFECTO,
			java.math.BigDecimal pPDETALLETRAMO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GRABARVIGTRAM(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTRAMO", "pPFECHAEFECTO", "pPDETALLETRAMO" },
				new Object[] { pPTRAMO, pPFECHAEFECTO, pPDETALLETRAMO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTRAMO);
		cStmt.setObject(3, pPFECHAEFECTO);
		cStmt.setObject(4, pPDETALLETRAMO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GRABARVIGTRAM(java.math.BigDecimal pPTRAMO, java.sql.Date pPFECHAEFECTO,
			java.math.BigDecimal pPDETALLETRAMO) throws Exception {
		return this.callPAC_IAX_GFI__F_GRABARVIGTRAM(pPTRAMO, pPFECHAEFECTO, pPDETALLETRAMO);
	}
	// --END-PAC_IAX_GFI.F_GRABARVIGTRAM

	// --START-PAC_IAX_GFI.F_SET_ELIMINARFORMPARAM(PCLAVE, PPARAMETRO)
	private HashMap callPAC_IAX_GFI__F_SET_ELIMINARFORMPARAM(java.math.BigDecimal pPCLAVE, String pPPARAMETRO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_SET_ELIMINARFORMPARAM(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCLAVE", "pPPARAMETRO" }, new Object[] { pPCLAVE, pPPARAMETRO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCLAVE);
		cStmt.setObject(3, pPPARAMETRO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_SET_ELIMINARFORMPARAM(java.math.BigDecimal pPCLAVE, String pPPARAMETRO)
			throws Exception {
		return this.callPAC_IAX_GFI__F_SET_ELIMINARFORMPARAM(pPCLAVE, pPPARAMETRO);
	}

	// --END-PAC_IAX_GFI.F_SET_ELIMINARFORMPARAM
	// --START-PAC_IAX_GFI.F_CONSULTBUCLE(PTERMINO, PNITERAC, POPERACION)
	private HashMap callPAC_IAX_GFI__F_CONSULTBUCLE(String pPTERMINO, java.math.BigDecimal pPNITERAC,
			String pPOPERACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_CONSULTBUCLE(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO", "pPNITERAC", "pPOPERACION" },
				new Object[] { pPTERMINO, pPNITERAC, pPOPERACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
		cStmt.setObject(3, pPNITERAC);
		cStmt.setObject(4, pPOPERACION);
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

	public HashMap ejecutaPAC_IAX_GFI__F_CONSULTBUCLE(String pPTERMINO, java.math.BigDecimal pPNITERAC,
			String pPOPERACION) throws Exception {
		return this.callPAC_IAX_GFI__F_CONSULTBUCLE(pPTERMINO, pPNITERAC, pPOPERACION);
	}

	// --END-PAC_IAX_GFI.F_CONSULTBUCLE
	// --START-PAC_IAX_GFI.F_ELIMINARBUCLE(PTERMINO)
	private HashMap callPAC_IAX_GFI__F_ELIMINARBUCLE(String pPTERMINO) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_ELIMINARBUCLE(?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO" }, new Object[] { pPTERMINO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
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

	public HashMap ejecutaPAC_IAX_GFI__F_ELIMINARBUCLE(String pPTERMINO) throws Exception {
		return this.callPAC_IAX_GFI__F_ELIMINARBUCLE(pPTERMINO);
	}

	// --END-PAC_IAX_GFI.F_ELIMINARBUCLE
	// --START-PAC_IAX_GFI.F_GRABARBUCLE(PTERMINO, PNITERAC, POPERACION, ISNEW)
	private HashMap callPAC_IAX_GFI__F_GRABARBUCLE(String pPTERMINO, String pPNITERAC, String pPOPERACION,
			java.math.BigDecimal pISNEW) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_GRABARBUCLE(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPTERMINO", "pPNITERAC", "pPOPERACION", "pISNEW" },
				new Object[] { pPTERMINO, pPNITERAC, pPOPERACION, pISNEW });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTERMINO);
		cStmt.setObject(3, pPNITERAC);
		cStmt.setObject(4, pPOPERACION);
		cStmt.setObject(5, pISNEW);
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

	public HashMap ejecutaPAC_IAX_GFI__F_GRABARBUCLE(String pPTERMINO, String pPNITERAC, String pPOPERACION,
			java.math.BigDecimal pISNEW) throws Exception {
		return this.callPAC_IAX_GFI__F_GRABARBUCLE(pPTERMINO, pPNITERAC, pPOPERACION, pISNEW);
	}

	// --END-PAC_IAX_GFI.F_GRABARBUCLE
	// --START-PAC_IAX_GFI.F_TRAMO(PNSESION, PFECHA, PNTRAMO, PBUSCAR)
	private HashMap callPAC_IAX_GFI__F_TRAMO(java.math.BigDecimal pPNSESION, java.math.BigDecimal pPFECHA,
			java.math.BigDecimal pPNTRAMO, java.math.BigDecimal pPBUSCAR) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_TRAMO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSESION", "pPFECHA", "pPNTRAMO", "pPBUSCAR" },
				new Object[] { pPNSESION, pPFECHA, pPNTRAMO, pPBUSCAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSESION);
		cStmt.setObject(3, pPFECHA);
		cStmt.setObject(4, pPNTRAMO);
		cStmt.setObject(5, pPBUSCAR);
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

	public HashMap ejecutaPAC_IAX_GFI__F_TRAMO(java.math.BigDecimal pPNSESION, java.math.BigDecimal pPFECHA,
			java.math.BigDecimal pPNTRAMO, java.math.BigDecimal pPBUSCAR) throws Exception {
		return this.callPAC_IAX_GFI__F_TRAMO(pPNSESION, pPFECHA, pPNTRAMO, pPBUSCAR);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GFI.F_TRAMO

	// --START-PAC_IAX_GFI.F_EVALUAR_FORMULA(PNSESION, PCLAVE, PDEBUG, PPARAMETROS)
	private HashMap callPAC_IAX_GFI__F_EVALUAR_FORMULA(java.math.BigDecimal pPNSESION, java.math.BigDecimal pPCLAVE,
			java.math.BigDecimal pPDEBUG, String pPPARAMETROS) throws Exception {
		String callQuery = "{?=call PAC_IAX_GFI.F_EVALUAR_FORMULA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPNSESION", "pPCLAVE", "pPDEBUG", "pPPARAMETROS" },
				new Object[] { pPNSESION, pPCLAVE, pPDEBUG, pPPARAMETROS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNSESION);
		cStmt.setObject(3, pPCLAVE);
		cStmt.setObject(4, pPDEBUG);
		cStmt.setObject(5, pPPARAMETROS);
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

	public HashMap ejecutaPAC_IAX_GFI__F_EVALUAR_FORMULA(java.math.BigDecimal pPNSESION, java.math.BigDecimal pPCLAVE,
			java.math.BigDecimal pPDEBUG, String pPPARAMETROS) throws Exception {
		return this.callPAC_IAX_GFI__F_EVALUAR_FORMULA(pPNSESION, pPCLAVE, pPDEBUG, pPPARAMETROS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_GFI.F_EVALUAR_FORMULA

}
