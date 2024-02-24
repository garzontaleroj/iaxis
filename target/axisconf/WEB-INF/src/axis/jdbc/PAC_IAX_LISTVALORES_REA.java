//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

//WLS-Ready

public class PAC_IAX_LISTVALORES_REA extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_LISTVALORES_REA.class);
	private Connection conn = null;

	public PAC_IAX_LISTVALORES_REA(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_LISTVALORES_REA.F_GET_APLICTASA()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_APLICTASA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_APLICTASA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_APLICTASA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_APLICTASA(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_APLICTASA
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_BASEXL()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_BASEXL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_BASEXL(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_BASEXL() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_BASEXL(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_BASEXL
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_BROKER()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_BROKER() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_BROKER(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_BROKER() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_BROKER(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_BROKER
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_CONTRATOPROT(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOPROT(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_CONTRATOPROT(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOPROT(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOPROT(pPCEMPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_CONTRATOPROT
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_CONTRATOS(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_CONTRATOS(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(pPCEMPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_CONTRATOS
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_ERCARTERAPRIMAS()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS_XL(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_CONTRATOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES" }, new Object[] { pPCEMPRES });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		// Inicializamos el par�metro del tipo de contrato a 3 (CTIPREA = 3 -->
		// REASEGURO XL )
		cStmt.setObject(4, 3);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS_XL(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS_XL(pPCEMPRES); // AXIS-WLS1SERVER-Ready
	}

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_ERCARTERAPRIMAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_ERCARTERAPRIMAS(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ERCARTERAPRIMAS() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_ERCARTERAPRIMAS(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_ERCARTERAPRIMAS
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_REPOSICIONES()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_REPOSICIONES() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_REPOSICIONES(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_REPOSICIONES() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_REPOSICIONES(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_REPOSICIONES
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPOCLAUTRAMESCAL()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOCLAUTRAMESCAL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOCLAUTRAMESCAL(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOCLAUTRAMESCAL() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOCLAUTRAMESCAL(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPOCLAUTRAMESCAL
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPOCOMISION()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOCOMISION() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOCOMISION(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOCOMISION() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOCOMISION(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPOCOMISION
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPOPRIMAXL()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOPRIMAXL() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOPRIMAXL(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOPRIMAXL() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOPRIMAXL(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPOPRIMAXL
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS_NOPROP()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_NOPROP() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS_NOPROP(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_NOPROP() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_NOPROP(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS_NOPROP
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS_PROP()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_PROP(java.math.BigDecimal pPCTIPREA)
			throws Exception {// BUG CONF-250 Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, adicioma
								// pPCTIPREA
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS_PROP(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.setObject(2, pPCTIPREA);// BUG CONF-250 Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, adicioma
										// pPCTIPREA
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
			retVal.put("MENSAJES", cStmt.getObject(3));// BUG CONF-250 Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3,
														// asigna posicion 3
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_PROP(java.math.BigDecimal pPCTIPREA)
			throws Exception {// BUG CONF-250 Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, adicioma
								// pPCTIPREA
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_PROP(pPCTIPREA); // AXIS-WLS1SERVER-Ready //BUG
																					// CONF-250 Fecha (02/09/2016) - HRE
																					// - Contratos Q1, Q2, Q3, adicioma
																					// pPCTIPREA
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS_PROP
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPOTASA()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOTASA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOTASA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOTASA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOTASA(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPOTASA
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TRAMOSREA(PCTIPO)

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(java.math.BigDecimal pPCTIPO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TRAMOSREA(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(java.math.BigDecimal pPCTIPO) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(pPCTIPO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TRAMOSREA
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_VERSIONES(PCEMPRES)

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_VERSIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_VERSIONES(?, ?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONES(java.math.BigDecimal pPCEMPRES) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_VERSIONES(pPCEMPRES); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_VERSIONES
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_VERSIONESCONTRATOPROT(PCEMPRES,
	// PSCONTRA)

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_VERSIONESCONTRATOPROT(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSCONTRA" }, new Object[] { pPCEMPRES, pPSCONTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSCONTRA);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(pPCEMPRES, pPSCONTRA); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_VERSIONESCONTRATOPROT
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS(PSCONTRA)

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS(java.math.BigDecimal pPSCONTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS(?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTRA" }, new Object[] { pPSCONTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTRA);
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

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_FIL(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPNVERSIO) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS_FIL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO" }, new Object[] { pPSCONTRA, pPNVERSIO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTRA);
		cStmt.setObject(3, pPNVERSIO);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS(java.math.BigDecimal pPSCONTRA) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS(pPSCONTRA); // AXIS-WLS1SERVER-Ready
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_FIL(java.math.BigDecimal pPSCONTRA,
			java.math.BigDecimal pPNVERSIO) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_FIL(pPSCONTRA, pPNVERSIO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPOSTRAMOS
	// --START-PAC_IAX_LISTVALORES_REA.F_GET_ESTADO_CTA()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_ESTADO_CTA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_ESTADO_CTA

	// --START-PAC_IAX_LISTVALORES_REA.F_GET_TIPO_MOVCTA()

	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_TIPO_MOVCTA() throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_TIPO_MOVCTA(?)}";

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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPO_MOVCTA() throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_TIPO_MOVCTA(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_TIPO_MOVCTA

	// --START-PAC_IAX_LISTVALORES_REA.F_GET_IDENTIF_PAGO_SIN(PNSINIES)
	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_IDENTIF_PAGO_SIN(java.math.BigDecimal pPNSINIES)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_IDENTIF_PAGO_SIN(?, ?)}";

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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_IDENTIF_PAGO_SIN(java.math.BigDecimal pPNSINIES)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_IDENTIF_PAGO_SIN(pPNSINIES);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_IDENTIF_PAGO_SIN

	// --START-PAC_IAX_LISTVALORES_REA.F_GET_RAMOS_CONTRATO(PCEMPRES, PSCONTRA)
	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_RAMOS_CONTRATO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_RAMOS_CONTRATO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSCONTRA" }, new Object[] { pPCEMPRES, pPSCONTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSCONTRA);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_RAMOS_CONTRATO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_RAMOS_CONTRATO(pPCEMPRES, pPSCONTRA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_RAMOS_CONTRATO

	// --START-PAC_IAX_LISTVALORES_REA.F_GET_VERSIONVIGENTE_CONTRATO(PCEMPRES,
	// PSCONTRA)
	private HashMap callPAC_IAX_LISTVALORES_REA__F_GET_VERSIONVIGENTE_CONTRATO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES_REA.F_GET_VERSIONVIGENTE_CONTRATO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCEMPRES", "pPSCONTRA" }, new Object[] { pPCEMPRES, pPSCONTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPSCONTRA);
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

	public HashMap ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONVIGENTE_CONTRATO(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSCONTRA) throws Exception {
		return this.callPAC_IAX_LISTVALORES_REA__F_GET_VERSIONVIGENTE_CONTRATO(pPCEMPRES, pPSCONTRA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_LISTVALORES_REA.F_GET_VERSIONVIGENTE_CONTRATO

}
