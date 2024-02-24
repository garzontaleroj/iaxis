//Revision:# 2+nGz73uzymAC5tO5QRArQ== #
package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_DESCVALORES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_DESCVALORES.class);
	private Connection conn = null;

	public PAC_IAX_DESCVALORES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_DESCVALORES.F_GET_DESCPAIS(PCPAIS)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_DESCPAIS(java.math.BigDecimal pPCPAIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCPAIS(?,?)}";
		logCall(callQuery, new String[] { "pPCPAIS" }, new Object[] { pPCPAIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPAIS);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(java.math.BigDecimal pPCPAIS) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCPAIS(pPCPAIS);
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_DESCPAIS

	// --START-PAC_IAX_DESCVALORES.F_GET_DESCPROBLACION(PCPROVIN, PCPOBLAC)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCPROBLACION(?,?,?)}";
		logCall(callQuery, new String[] { "pPCPROVIN", "pPCPOBLAC" }, new Object[] { pPCPROVIN, pPCPOBLAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPROVIN);
		cStmt.setObject(3, pPCPOBLAC);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPOBLAC) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(pPCPROVIN, pPCPOBLAC);
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_DESCPROBLACION

	// --START-PAC_IAX_DESCVALORES.F_GET_DESCPROVINCIA(PCPROVIN, PCPAIS)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPAIS) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCPROVINCIA(?,?,?)}";
		logCall(callQuery, new String[] { "pPCPROVIN", "pPCPAIS" }, new Object[] { pPCPROVIN, pPCPAIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPROVIN);
		cStmt.setObject(3, pPCPAIS);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(java.math.BigDecimal pPCPROVIN,
			java.math.BigDecimal pPCPAIS) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(pPCPROVIN, pPCPAIS);
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_DESCPROVINCIA

	// --START-PAC_IAX_DESCVALORES.F_DESCREEMBACTOS(PCACTO, PCGARANT, PAGR_SALUD)
	private HashMap callPAC_IAX_DESCVALORES__F_DESCREEMBACTOS(String pPCACTO, java.math.BigDecimal pPCGARANT,
			String pPAGR_SALUD) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_DESCREEMBACTOS(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCACTO", "pPCGARANT", "pPAGR_SALUD" },
				new Object[] { pPCACTO, pPCGARANT, pPAGR_SALUD });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCACTO);
		cStmt.setObject(3, pPCGARANT);
		cStmt.setObject(4, pPAGR_SALUD);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_DESCREEMBACTOS(String pPCACTO, java.math.BigDecimal pPCGARANT,
			String pPAGR_SALUD) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_DESCREEMBACTOS(pPCACTO, pPCGARANT, pPAGR_SALUD);
	}
	// --END-PAC_IAX_DESCVALORES.F_DESCREEMBACTOS

	// --START-PAC_IAX_DESCVALORES.F_GET_DESCEVENTO(PCEVENTO)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_DESCEVENTO(String pPCEVENTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCEVENTO(?, ?)}";

		logCall(callQuery, new String[] { "pPCEVENTO" }, new Object[] { pPCEVENTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEVENTO);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCEVENTO(String pPCEVENTO) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCEVENTO(pPCEVENTO);
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_DESCEVENTO

	// --START-PAC_IAX_DESCVALORES.F_DESCGARANT(PCGARANT, PCIDIOMA)
	private HashMap callPAC_IAX_DESCVALORES__F_DESCGARANT(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_DESCGARANT(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCGARANT", "pPCIDIOMA" }, new Object[] { pPCGARANT, pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCGARANT);
		cStmt.setObject(3, pPCIDIOMA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTGARANT"
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
			retVal.put("PTGARANT", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTGARANT", null);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_DESCGARANT(java.math.BigDecimal pPCGARANT,
			java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_DESCGARANT(pPCGARANT, pPCIDIOMA);
	}
	// --END-PAC_IAX_DESCVALORES.F_DESCGARANT

	// --START-PAC_IAX_DESCVALORES.F_GET_DESCIDIOMA(PCIDIOMA)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_DESCIDIOMA(java.math.BigDecimal pPCIDIOMA) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCIDIOMA(?, ?)}";

		logCall(callQuery, new String[] { "pPCIDIOMA" }, new Object[] { pPCIDIOMA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCIDIOMA);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCIDIOMA(java.math.BigDecimal pPCIDIOMA) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCIDIOMA(pPCIDIOMA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_DESCIDIOMA

	// --START-PAC_IAX_DESCVALORES.F_GET_DESCSOCIEDAD(PNNUMIDE)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_DESCSOCIEDAD(String pPNNUMIDE) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCSOCIEDAD(?, ?)}";

		logCall(callQuery, new String[] { "pPNNUMIDE" }, new Object[] { pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPNNUMIDE);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCSOCIEDAD(String pPNNUMIDE) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCSOCIEDAD(pPNNUMIDE);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_DESCSOCIEDAD

	// --START-PAC_IAX_DESCVALORES.F_GET_DESCNACION(PCNACION)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_DESCNACION(java.math.BigDecimal pPCNACION) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCNACION(?, ?)}";

		logCall(callQuery, new String[] { "pPCNACION" }, new Object[] { pPCNACION });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCNACION);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCNACION(java.math.BigDecimal pPCNACION) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCNACION(pPCNACION);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_DESCVALORES.F_GET_DESCNACION
	public HashMap callPAC_IAX_DESCVALORES__F_GET_DESCPOBLACIONSINPROV(java.math.BigDecimal pPCPOBLAC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_DESCPOBLACIONSINPROV(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCPOBLAC" }, new Object[] { pPCPOBLAC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCPOBLAC);
		cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, Types.NUMERIC);
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
			retVal.put("CPROVIN", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("CPROVIN", null);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPOBLACIONSINPROV(java.math.BigDecimal pPCPOBLAC)
			throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_DESCPOBLACIONSINPROV(pPCPOBLAC);
	}

	// --START-PAC_IAX_DESCVALORES.F_GET_CIIU(CIIU)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_CIIU(java.math.BigDecimal pCIIU) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_CIIU(?, ?)}";

		logCall(callQuery, new String[] { "pCIIU" }, new Object[] { pCIIU });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCIIU);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_CIIU(java.math.BigDecimal pCIIU) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_CIIU(pCIIU);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_CIIU

	// --START-PAC_IAX_DESCVALORES.F_GET_TIPOVIA(PCSIGLAS)
	private HashMap callPAC_IAX_DESCVALORES__F_GET_TIPOVIA(java.math.BigDecimal pPCSIGLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_TIPOVIA(?, ?)}";

		logCall(callQuery, new String[] { "pPCSIGLAS" }, new Object[] { pPCSIGLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCSIGLAS);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_TIPOVIA(java.math.BigDecimal pPCSIGLAS) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_TIPOVIA(pPCSIGLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_DESCVALORES.F_GET_TIPOVIA

	/* IAXIS-13881 : Cambios de facturacion electronica : start */

	private HashMap callPAC_IAX_DESCVALORES__F_GET_FISCALES_ADQUIRIENTE(String pCFIS_ADQUIRIENT) throws Exception {
		String callQuery = "{?=call PAC_IAX_DESCVALORES.F_GET_FISCALES_ADQUIRIENTE(?, ?)}";

		logCall(callQuery, new String[] { "pCFIS_ADQUIRIENT" }, new Object[] { pCFIS_ADQUIRIENT });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pCFIS_ADQUIRIENT);
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

	public HashMap ejecutaPAC_IAX_DESCVALORES__F_GET_FISCALES_ADQUIRIENTE(String pCFIS_ADQUIRIENT) throws Exception {
		return this.callPAC_IAX_DESCVALORES__F_GET_FISCALES_ADQUIRIENTE(pCFIS_ADQUIRIENT);// AXIS-WLS1SERVER-Ready
	}

	/* IAXIS-13881 : Cambios de facturacion electronica : end */
}
