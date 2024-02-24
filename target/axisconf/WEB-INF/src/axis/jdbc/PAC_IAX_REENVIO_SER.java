package axis.jdbc;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

/**
 * @author PranayK 23/06/2019
 *
 */
public class PAC_IAX_REENVIO_SER extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_PRODUCCION.class);
	private Connection conn = null;

	public PAC_IAX_REENVIO_SER(Connection conn) {
		this.conn = conn;
	}

	// ---START-PAC_IAX_REENVIO_SER.P_BUSCAR_INTERFACE()
	private HashMap callPAC_IAX_REENVIO_SER_P_BUSCAR_INTERFACE() throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_BUSCAR_INTERFACE(?)}";

		// logCall(callQuery, new String[] {"pPESTADO"}, new Object[] {pPESTADO});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR,
				UsuarioBean.fixOwner(USERNAME, "PO_RESULT".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_BUSCAR_INTERFACE() throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_BUSCAR_INTERFACE();
	}
	// --END-PAC_IAX_REENVIO_SER.P_BUSCAR_INTERFACE

	// ---START-PAC_IAX_REENVIO_SER.P_BUSCAR_ESTADO()
	private HashMap callPAC_IAX_REENVIO_SER_P_BUSCAR_ESTADO() throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_BUSCAR_ESTADO(?)}";

		// logCall(callQuery, new String[] {"pPESTADO"}, new Object[] {pPESTADO});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR,
				UsuarioBean.fixOwner(USERNAME, "PO_RESULT".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_BUSCAR_ESTADO() throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_BUSCAR_ESTADO();
	}
	// --END-PAC_IAX_REENVIO_SER.P_BUSCAR_ESTADO

	// ---START-PAC_IAX_REENVIO_SER.P_GET_SERVICIO()
	private HashMap callPAC_IAX_REENVIO_SER_P_GET_SERVICIO(String pPCINTERF, BigDecimal pPESTADO, String pPNNUMIDE,
			Date pPFINICIO, Date pPFFIN, String pPNUMPAGO) throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_GET_SERVICIO(?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPI_CINTERF", "pPI_ESTADO", "pPI_NNUMIDE", "pPI_FINICIO", "pPI_FFIN", "pPI_NUMPAGO" },
				new Object[] { pPCINTERF, pPESTADO, pPNNUMIDE, pPFINICIO, pPFFIN, pPNUMPAGO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPCINTERF);
		cStmt.setObject(2, pPESTADO);
		cStmt.setObject(3, pPNNUMIDE);
		cStmt.setObject(4, pPFINICIO);
		cStmt.setObject(5, pPFFIN);
		cStmt.setObject(6, pPNUMPAGO);
		cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.CURSOR,
				UsuarioBean.fixOwner(USERNAME, "PO_RESULT".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(7));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_GET_SERVICIO(String cinterf, BigDecimal estado, String nnumIde,
			Date FINICIO, Date FFIN, String numPago) throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_GET_SERVICIO(cinterf, estado, nnumIde, FINICIO, FFIN, numPago);
	}
	// --END-PAC_IAX_REENVIO_SER.P_GET_SERVICIO

	// ---START-PAC_IAX_REENVIO_SER.P_GET_ENTSALIDA()
	private HashMap callPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA(BigDecimal pPSINTERF, BigDecimal pPESTADO, String pPCINTERF)
			throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_GET_ENTSALIDA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPESTADO", "pPCINTERF" },
				new Object[] { pPSINTERF, pPESTADO, pPCINTERF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSINTERF);
		cStmt.setObject(2, pPESTADO);
		cStmt.setObject(3, pPCINTERF);
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR,
				UsuarioBean.fixOwner(USERNAME, "PO_RESULT".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA(BigDecimal sinterf, BigDecimal estado, String cinterf)
			throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA(sinterf, estado, cinterf);
	}
	// --END-PAC_IAX_REENVIO_SER.P_BUSCAR_INTERFACE

	// ---START-PAC_IAX_REENVIO_SER.P_REINTENTAR_I017()
	private HashMap callPAC_IAX_REENVIO_SER_P_REINTENTAR_I017(BigDecimal pPSINTERF, BigDecimal pPESTADO)
			throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_REINTENTAR_I017(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPESTADO" }, new Object[] { pPSINTERF, pPESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSINTERF);
		cStmt.setObject(2, pPESTADO);
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"

		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_REINTENTAR_I017(BigDecimal sinterf, BigDecimal estado)
			throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_REINTENTAR_I017(sinterf, estado);
	}
	// --END-PAC_IAX_REENVIO_SER.P_REINTENTAR_I017

	// ---START-PAC_IAX_REENVIO_SER.P_REINTENTAR_I031()
	private HashMap callPAC_IAX_REENVIO_SER_P_REINTENTAR_I031(BigDecimal pPSINTERF, BigDecimal pPESTADO)
			throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_REINTENTAR_I031(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPESTADO" }, new Object[] { pPSINTERF, pPESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSINTERF);
		cStmt.setObject(2, pPESTADO);
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER,
				UsuarioBean.fixOwner(USERNAME, "PSINTERF".toUpperCase()));
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.NUMBER, UsuarioBean.fixOwner(USERNAME, "PNUMINTENTO"));
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		try {
			retVal.put("PNUMINTENTO", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNUMINTENTO", null);
		}

		try {
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_REINTENTAR_I031(BigDecimal sinterf, BigDecimal estado)
			throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_REINTENTAR_I031(sinterf, estado);
	}
	// --END-PAC_IAX_REENVIO_SER.P_REINTENTAR_I031

	private HashMap callPAC_IAX_REENVIO_SER_P_REINTENTAR_CONVI(BigDecimal pPSINTERF, String pPNNUMIDE)
			throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_REINTENTAR_CONVI(?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPNNUMIDE" }, new Object[] { pPSINTERF, pPNNUMIDE });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSINTERF);
		cStmt.setObject(2, pPNNUMIDE);
		cStmt.execute();
		HashMap retVal = new HashMap();
		retVal.put("RETURN", null);
		retVal.put("MENSAJES", null);
		cStmt.close();
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_REINTENTAR_CONVI(BigDecimal sinterf, String mmumide) throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_REINTENTAR_CONVI(sinterf, mmumide);
	}

	private HashMap callPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA_CONVI(BigDecimal pPSINTERF, BigDecimal pPESTADO,
			String pPCINTERF, String pPTABLAOSIRIS) throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_GET_ENTSALIDA_CONVI(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPESTADO", "pPCINTERF", "pPTABLAOSIRIS" },
				new Object[] { pPSINTERF, pPESTADO, pPCINTERF, pPTABLAOSIRIS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSINTERF);
		cStmt.setObject(2, pPESTADO);
		cStmt.setObject(3, pPCINTERF);
		cStmt.setObject(4, pPTABLAOSIRIS);
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR,
				UsuarioBean.fixOwner(USERNAME, "PO_RESULT".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA_CONVI(BigDecimal sinterf, BigDecimal estado,
			String cinterf, String tablaOsiris) throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA_CONVI(sinterf, estado, cinterf, tablaOsiris);
	}

	private HashMap callPAC_IAX_REENVIO_SER_P_GET_DATOS(BigDecimal pPSINTERF, String pPCINTERF) throws Exception {
		String callQuery = "{call PAC_IAX_REENVIO_SER.P_GET_DATOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSINTERF", "pPCINTERF" }, new Object[] { pPSINTERF, pPCINTERF });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(1, pPSINTERF);
		cStmt.setObject(2, pPCINTERF);
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR,
				UsuarioBean.fixOwner(USERNAME, "PO_RESULT".toUpperCase()));
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}

		retVal = new ConversionUtil().convertOracleObjects(retVal);
		cStmt.close();

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_REENVIO_SER_P_GET_DATOS(BigDecimal sinterf, String cinterf) throws Exception {
		return this.callPAC_IAX_REENVIO_SER_P_GET_DATOS(sinterf, cinterf);
	}

}
