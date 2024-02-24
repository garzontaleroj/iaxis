//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CAMPANAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CAMPANAS.class);
	private Connection conn = null;

	public PAC_IAX_CAMPANAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CAMPANAS.F_BUSCAR(PCCODIGO, PCESTADO, PFINICAM, PFFINCAM)
	private HashMap callPAC_IAX_CAMPANAS__F_BUSCAR(java.math.BigDecimal pPCCODIGO, String pPCESTADO,
			java.sql.Date pPFINICAM, java.sql.Date pPFFINCAM) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_BUSCAR(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO", "pPCESTADO", "pPFINICAM", "pPFFINCAM" },
				new Object[] { pPCCODIGO, pPCESTADO, pPFINICAM, pPFFINCAM });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.setObject(3, pPCESTADO);
		cStmt.setObject(4, pPFINICAM);
		cStmt.setObject(5, pPFFINCAM);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CAMPANAS".toUpperCase())); // Valor de "PTCAMPANAS"
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
			retVal.put("PTCAMPANAS", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PTCAMPANAS", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_BUSCAR(java.math.BigDecimal pPCCODIGO, String pPCESTADO,
			java.sql.Date pPFINICAM, java.sql.Date pPFFINCAM) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_BUSCAR(pPCCODIGO, pPCESTADO, pPFINICAM, pPFFINCAM);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_BUSCAR
	// --START-PAC_IAX_CAMPANAS.F_CARTEAR(PCTIPOCARTA)
	private HashMap callPAC_IAX_CAMPANAS__F_CARTEAR(String pPCTIPOCARTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_CARTEAR(?, ?)}";

		logCall(callQuery, new String[] { "pPCTIPOCARTA" }, new Object[] { pPCTIPOCARTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPOCARTA);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_CARTEAR(String pPCTIPOCARTA) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_CARTEAR(pPCTIPOCARTA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_CARTEAR
	// --START-PAC_IAX_CAMPANAS.F_DEL_PRODUCTOS_CAMPA(PCCODIGO)
	private HashMap callPAC_IAX_CAMPANAS__F_DEL_PRODUCTOS_CAMPA(java.math.BigDecimal pPCCODIGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_DEL_PRODUCTOS_CAMPA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_DEL_PRODUCTOS_CAMPA(java.math.BigDecimal pPCCODIGO) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_DEL_PRODUCTOS_CAMPA(pPCCODIGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_DEL_PRODUCTOS_CAMPA
	// --START-PAC_IAX_CAMPANAS.F_EDITAR(PCCODIGO)
	private HashMap callPAC_IAX_CAMPANAS__F_EDITAR(java.math.BigDecimal pPCCODIGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_EDITAR(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_CAMPANAS".toUpperCase())); // Valor de "POBCAMPANA"
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
			retVal.put("POBCAMPANA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("POBCAMPANA", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_EDITAR(java.math.BigDecimal pPCCODIGO) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_EDITAR(pPCCODIGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_EDITAR
	// --START-PAC_IAX_CAMPANAS.F_GET_AGENTECAMPANYES(PCAGENTE)
	private HashMap callPAC_IAX_CAMPANAS__F_GET_AGENTECAMPANYES(java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_AGENTECAMPANYES(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCAGENTE" }, new Object[] { pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLISTAGECAMPA"
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
			retVal.put("PLISTAGECAMPA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLISTAGECAMPA", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_AGENTECAMPANYES(java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_AGENTECAMPANYES(pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_AGENTECAMPANYES
	// --START-PAC_IAX_CAMPANAS.F_GET_AGENTES_CAMPA(PCMODO, PCCODIGO, PFINICAM,
	// PCTIPAGE, PCAGENTE)
	private HashMap callPAC_IAX_CAMPANAS__F_GET_AGENTES_CAMPA(String pPCMODO, java.math.BigDecimal pPCCODIGO,
			java.sql.Date pPFINICAM, java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPCAGENTE) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_AGENTES_CAMPA(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCMODO", "pPCCODIGO", "pPFINICAM", "pPCTIPAGE", "pPCAGENTE" },
				new Object[] { pPCMODO, pPCCODIGO, pPFINICAM, pPCTIPAGE, pPCAGENTE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPCCODIGO);
		cStmt.setObject(4, pPFINICAM);
		cStmt.setObject(5, pPCTIPAGE);
		cStmt.setObject(6, pPCAGENTE);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CAMPAAGE".toUpperCase())); // Valor de "PLISTAGE"
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
			retVal.put("PLISTAGE", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("PLISTAGE", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_AGENTES_CAMPA(String pPCMODO, java.math.BigDecimal pPCCODIGO,
			java.sql.Date pPFINICAM, java.math.BigDecimal pPCTIPAGE, java.math.BigDecimal pPCAGENTE) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_AGENTES_CAMPA(pPCMODO, pPCCODIGO, pPFINICAM, pPCTIPAGE, pPCAGENTE);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_AGENTES_CAMPA
	// --START-PAC_IAX_CAMPANAS.F_GET_CAMPAPRD(PCCODIGO)
	private HashMap callPAC_IAX_CAMPANAS__F_GET_CAMPAPRD(java.math.BigDecimal pPCCODIGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_CAMPAPRD(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLISTPROD"
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
			retVal.put("PLISTPROD", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLISTPROD", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_CAMPAPRD(java.math.BigDecimal pPCCODIGO) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_CAMPAPRD(pPCCODIGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_CAMPAPRD
	// --START-PAC_IAX_CAMPANAS.F_GET_CAMPA(PCCODIGO)
	private HashMap callPAC_IAX_CAMPANAS__F_GET_CAMPA(java.math.BigDecimal pPCCODIGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_CAMPA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLISTPROD"
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
			retVal.put("PLISTPROD", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLISTPROD", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_CAMPA(java.math.BigDecimal pPCCODIGO) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_CAMPA(pPCCODIGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_CAMPA
	// --START-PAC_IAX_CAMPANAS.F_GET_DOCUMENTOS(PCCODIGO)
	private HashMap callPAC_IAX_CAMPANAS__F_GET_DOCUMENTOS(java.math.BigDecimal pPCCODIGO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_DOCUMENTOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLISTDOCUMENTOS"
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
			retVal.put("PLISTDOCUMENTOS", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PLISTDOCUMENTOS", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_DOCUMENTOS(java.math.BigDecimal pPCCODIGO) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_DOCUMENTOS(pPCCODIGO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_DOCUMENTOS
	// --START-PAC_IAX_CAMPANAS.F_GET_ESTADOCAMPANA()
	private HashMap callPAC_IAX_CAMPANAS__F_GET_ESTADOCAMPANA() throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_ESTADOCAMPANA(?)}";

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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_ESTADOCAMPANA() throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_ESTADOCAMPANA();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_ESTADOCAMPANA
	// --START-PAC_IAX_CAMPANAS.F_GET_MEDIOS()
	private HashMap callPAC_IAX_CAMPANAS__F_GET_MEDIOS() throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_MEDIOS(?)}";

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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_MEDIOS() throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_MEDIOS();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_MEDIOS
	// --START-PAC_IAX_CAMPANAS.F_GET_PRODUCTOS_CAMPA(PCRAMO, PSPRODUC, PCACTIVI,
	// PCGARANT)
	private HashMap callPAC_IAX_CAMPANAS__F_GET_PRODUCTOS_CAMPA(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_PRODUCTOS_CAMPA(?, ?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCRAMO);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCACTIVI);
		cStmt.setObject(5, pPCGARANT);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PLISTPROD"
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
			retVal.put("PLISTPROD", cStmt.getObject(6));
		} catch (SQLException e) {
			retVal.put("PLISTPROD", null);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_PRODUCTOS_CAMPA(java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_PRODUCTOS_CAMPA(pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_PRODUCTOS_CAMPA
	// --START-PAC_IAX_CAMPANAS.F_GRABAR(PCCODIGO, PTDESCRIP, PCESTADO, PFINICAM,
	// PFFINCAM, PIVALINI, PIPREMIO, PIVTAPRV, PIVTAREA, PCMEDIOS, PNAGECAM,
	// PNAGEGAN, PTOBSERV, PCEXCCRR, PCEXCNEWP, PFINIREC, PFFINREC, PCCONVEN)
	private HashMap callPAC_IAX_CAMPANAS__F_GRABAR(String pPCCODIGO, String pPTDESCRIP, String pPCESTADO,
			java.sql.Date pPFINICAM, java.sql.Date pPFFINCAM, java.math.BigDecimal pPIVALINI,
			java.math.BigDecimal pPIPREMIO, java.math.BigDecimal pPIVTAPRV, java.math.BigDecimal pPIVTAREA,
			String pPCMEDIOS, java.math.BigDecimal pPNAGECAM, java.math.BigDecimal pPNAGEGAN, String pPTOBSERV,
			java.math.BigDecimal pPCEXCCRR, java.math.BigDecimal pPCEXCNEWP, java.sql.Date pPFINIREC,
			java.sql.Date pPFFINREC, String pPCCONVEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GRABAR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCODIGO", "pPTDESCRIP", "pPCESTADO", "pPFINICAM", "pPFFINCAM", "pPIVALINI",
						"pPIPREMIO", "pPIVTAPRV", "pPIVTAREA", "pPCMEDIOS", "pPNAGECAM", "pPNAGEGAN", "pPTOBSERV",
						"pPCEXCCRR", "pPCEXCNEWP", "pPFINIREC", "pPFFINREC", "pPCCONVEN" },
				new Object[] { pPCCODIGO, pPTDESCRIP, pPCESTADO, pPFINICAM, pPFFINCAM, pPIVALINI, pPIPREMIO, pPIVTAPRV,
						pPIVTAREA, pPCMEDIOS, pPNAGECAM, pPNAGEGAN, pPTOBSERV, pPCEXCCRR, pPCEXCNEWP, pPFINIREC,
						pPFFINREC, pPCCONVEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.setObject(3, pPTDESCRIP);
		cStmt.setObject(4, pPCESTADO);
		cStmt.setObject(5, pPFINICAM);
		cStmt.setObject(6, pPFFINCAM);
		cStmt.setObject(7, pPIVALINI);
		cStmt.setObject(8, pPIPREMIO);
		cStmt.setObject(9, pPIVTAPRV);
		cStmt.setObject(10, pPIVTAREA);
		cStmt.setObject(11, pPCMEDIOS);
		cStmt.setObject(12, pPNAGECAM);
		cStmt.setObject(13, pPNAGEGAN);
		cStmt.setObject(14, pPTOBSERV);
		cStmt.setObject(15, pPCEXCCRR);
		cStmt.setObject(16, pPCEXCNEWP);
		cStmt.setObject(17, pPFINIREC);
		cStmt.setObject(18, pPFFINREC);
		cStmt.setObject(19, pPCCONVEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(20, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(20));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GRABAR(String pPCCODIGO, String pPTDESCRIP, String pPCESTADO,
			java.sql.Date pPFINICAM, java.sql.Date pPFFINCAM, java.math.BigDecimal pPIVALINI,
			java.math.BigDecimal pPIPREMIO, java.math.BigDecimal pPIVTAPRV, java.math.BigDecimal pPIVTAREA,
			String pPCMEDIOS, java.math.BigDecimal pPNAGECAM, java.math.BigDecimal pPNAGEGAN, String pPTOBSERV,
			java.math.BigDecimal pPCEXCCRR, java.math.BigDecimal pPCEXCNEWP, java.sql.Date pPFINIREC,
			java.sql.Date pPFFINREC, String pPCCONVEN) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GRABAR(pPCCODIGO, pPTDESCRIP, pPCESTADO, pPFINICAM, pPFFINCAM, pPIVALINI,
				pPIPREMIO, pPIVTAPRV, pPIVTAREA, pPCMEDIOS, pPNAGECAM, pPNAGEGAN, pPTOBSERV, pPCEXCCRR, pPCEXCNEWP,
				pPFINIREC, pPFFINREC, pPCCONVEN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAMPANAS.F_GRABAR

	// --START-PAC_IAX_CAMPANAS.F_SET_AGEGANADOR(PCCODIGO, PCAGENTE, PTGANADOR)
	private HashMap callPAC_IAX_CAMPANAS__F_SET_AGEGANADOR(java.math.BigDecimal pPCCODIGO,
			java.math.BigDecimal pPCAGENTE, String pPTGANADOR) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_SET_AGEGANADOR(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO", "pPCAGENTE", "pPTGANADOR" },
				new Object[] { pPCCODIGO, pPCAGENTE, pPTGANADOR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPTGANADOR);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_SET_AGEGANADOR(java.math.BigDecimal pPCCODIGO,
			java.math.BigDecimal pPCAGENTE, String pPTGANADOR) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_SET_AGEGANADOR(pPCCODIGO, pPCAGENTE, pPTGANADOR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_SET_AGEGANADOR
	// --START-PAC_IAX_CAMPANAS.F_GET_CAMPA_CIERRE(PCTIPO, PCAGENTE, PCCAMPANA,
	// PNMES, PNANO, PCRAMO, PCEMPRES, PSPRODUC, PCSUCURS)
	private HashMap callPAC_IAX_CAMPANAS__F_GET_CAMPA_CIERRE(java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCCAMPANA, java.math.BigDecimal pPNMES,
			java.math.BigDecimal pPNANO, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCSUCURS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GET_CAMPA_CIERRE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPO", "pPCAGENTE", "pPCCAMPANA", "pPNMES", "pPNANO", "pPCRAMO", "pPCEMPRES",
						"pPSPRODUC", "pPCSUCURS" },
				new Object[] { pPCTIPO, pPCAGENTE, pPCCAMPANA, pPNMES, pPNANO, pPCRAMO, pPCEMPRES, pPSPRODUC,
						pPCSUCURS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCCAMPANA);
		cStmt.setObject(5, pPNMES);
		cStmt.setObject(6, pPNANO);
		cStmt.setObject(7, pPCRAMO);
		cStmt.setObject(8, pPCEMPRES);
		cStmt.setObject(9, pPSPRODUC);
		cStmt.setObject(10, pPCSUCURS);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GET_CAMPA_CIERRE(java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCCAMPANA, java.math.BigDecimal pPNMES,
			java.math.BigDecimal pPNANO, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCSUCURS) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GET_CAMPA_CIERRE(pPCTIPO, pPCAGENTE, pPCCAMPANA, pPNMES, pPNANO, pPCRAMO,
				pPCEMPRES, pPSPRODUC, pPCSUCURS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GET_CAMPA_CIERRE
	// --START-PAC_IAX_CAMPANAS.F_GENERAR_CORREO(PCTIPO, PCAGENTE, PCCAMPANA, PNMES,
	// PNANO, PCRAMO, PCEMPRES, PSPRODUC, PCSUCURS)
	private HashMap callPAC_IAX_CAMPANAS__F_GENERAR_CORREO(java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCCAMPANA, java.math.BigDecimal pPNMES, java.math.BigDecimal pPNANO,
			java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCSUCURS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_GENERAR_CORREO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCTIPO", "pPCAGENTE", "pPCCAMPANA", "pPNMES", "pPNANO", "pPCRAMO", "pPCEMPRES",
						"pPSPRODUC", "pPCSUCURS" },
				new Object[] { pPCTIPO, pPCAGENTE, pPCCAMPANA, pPNMES, pPNANO, pPCRAMO, pPCEMPRES, pPSPRODUC,
						pPCSUCURS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCTIPO);
		cStmt.setObject(3, pPCAGENTE);
		cStmt.setObject(4, pPCCAMPANA);
		cStmt.setObject(5, pPNMES);
		cStmt.setObject(6, pPNANO);
		cStmt.setObject(7, pPCRAMO);
		cStmt.setObject(8, pPCEMPRES);
		cStmt.setObject(9, pPSPRODUC);
		cStmt.setObject(10, pPCSUCURS);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_GENERAR_CORREO(java.math.BigDecimal pPCTIPO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCCAMPANA, java.math.BigDecimal pPNMES,
			java.math.BigDecimal pPNANO, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCSUCURS) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_GENERAR_CORREO(pPCTIPO, pPCAGENTE, pPCCAMPANA, pPNMES, pPNANO, pPCRAMO,
				pPCEMPRES, pPSPRODUC, pPCSUCURS);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_GENERAR_CORREO
	// --START-PAC_IAX_CAMPANAS.F_SET_AGENTES_CAMPA(PCMODO, PCCODIGO, PCAGENTE,
	// PCTIPAGE, PFINICAM, PFFINCAM, PIMETA)
	private HashMap callPAC_IAX_CAMPANAS__F_SET_AGENTES_CAMPA(String pPCMODO, java.math.BigDecimal pPCCODIGO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPAGE, java.sql.Date pPFINICAM,
			java.sql.Date pPFFINCAM, java.math.BigDecimal pPIMETA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_SET_AGENTES_CAMPA(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCMODO", "pPCCODIGO", "pPCAGENTE", "pPCTIPAGE", "pPFINICAM", "pPFFINCAM", "pPIMETA" },
				new Object[] { pPCMODO, pPCCODIGO, pPCAGENTE, pPCTIPAGE, pPFINICAM, pPFFINCAM, pPIMETA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCMODO);
		cStmt.setObject(3, pPCCODIGO);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPCTIPAGE);
		cStmt.setObject(6, pPFINICAM);
		cStmt.setObject(7, pPFFINCAM);
		cStmt.setObject(8, pPIMETA);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_SET_AGENTES_CAMPA(String pPCMODO, java.math.BigDecimal pPCCODIGO,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPAGE, java.sql.Date pPFINICAM,
			java.sql.Date pPFFINCAM, java.math.BigDecimal pPIMETA) throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_SET_AGENTES_CAMPA(pPCMODO, pPCCODIGO, pPCAGENTE, pPCTIPAGE, pPFINICAM,
				pPFFINCAM, pPIMETA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CAMPANAS.F_SET_AGENTES_CAMPA
	// --START-PAC_IAX_CAMPANAS.F_SET_PRODUCTOS_CAMPA(PCCODIGO, PSPRODUC, PCACTIVI,
	// PCGARANT)
	private HashMap callPAC_IAX_CAMPANAS__F_SET_PRODUCTOS_CAMPA(java.math.BigDecimal pPCCODIGO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CAMPANAS.F_SET_PRODUCTOS_CAMPA(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCODIGO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT" },
				new Object[] { pPCCODIGO, pPSPRODUC, pPCACTIVI, pPCGARANT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCODIGO);
		cStmt.setObject(3, pPSPRODUC);
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

	public HashMap ejecutaPAC_IAX_CAMPANAS__F_SET_PRODUCTOS_CAMPA(java.math.BigDecimal pPCCODIGO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT)
			throws Exception {
		return this.callPAC_IAX_CAMPANAS__F_SET_PRODUCTOS_CAMPA(pPCCODIGO, pPSPRODUC, pPCACTIVI, pPCGARANT);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CAMPANAS.F_SET_PRODUCTOS_CAMPA

}
