package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_MNTDTOSESPECIALES extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_MNTDTOSESPECIALES.class);
	private Connection conn = null;

	public PAC_IAX_MNTDTOSESPECIALES(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_MNTDTOSESPECIALES.F_GET_CAMPANYAS()
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_GET_CAMPANYAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_GET_CAMPANYAS(?)}";

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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_CAMPANYAS() throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_GET_CAMPANYAS();// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTDTOSESPECIALES.F_GET_CAMPANYAS
	// --START-PAC_IAX_MNTDTOSESPECIALES.F_GET_DTOSESPECIALES(PCCAMPANYA, PFECINI,
	// PFECFIN)
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIALES(java.math.BigDecimal pPCCAMPANYA,
			java.sql.Date pPFECINI, java.sql.Date pPFECFIN) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_GET_DTOSESPECIALES(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA", "pPFECINI", "pPFECFIN" },
				new Object[] { pPCCAMPANYA, pPFECINI, pPFECFIN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPFECINI);
		cStmt.setObject(4, pPFECFIN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_DTOSESPECIALES".toUpperCase())); // Valor de "PDTOSESPE"
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
			retVal.put("PDTOSESPE", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("PDTOSESPE", null);
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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIALES(java.math.BigDecimal pPCCAMPANYA,
			java.sql.Date pPFECINI, java.sql.Date pPFECFIN) throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIALES(pPCCAMPANYA, pPFECINI, pPFECFIN);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTDTOSESPECIALES.F_GET_DTOSESPECIALES

	// --START-PAC_IAX_MNTDTOSESPECIALES.F_DEL_DTOSESPECIALES(PCCAMPANYA)
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES(java.math.BigDecimal pPCCAMPANYA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_DEL_DTOSESPECIALES(?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA" }, new Object[] { pPCCAMPANYA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES(java.math.BigDecimal pPCCAMPANYA)
			throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES(pPCCAMPANYA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTDTOSESPECIALES.F_DEL_DTOSESPECIALES
	// --START-PAC_IAX_MNTDTOSESPECIALES.F_DEL_DTOSESPECIALES_LIN(PCCAMPANYA,
	// PSPRODUC, PCPAIS, PCDPTO, PCCIUDAD, PCAGRUPA, PCSUCURSAL, PCINTERMED)
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES_LIN(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCDPTO,
			java.math.BigDecimal pPCCIUDAD, String pPCAGRUPA, java.math.BigDecimal pPCSUCURSAL,
			java.math.BigDecimal pPCINTERMED) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_DEL_DTOSESPECIALES_LIN(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCAMPANYA", "pPSPRODUC", "pPCPAIS", "pPCDPTO", "pPCCIUDAD", "pPCAGRUPA",
						"pPCSUCURSAL", "pPCINTERMED" },
				new Object[] { pPCCAMPANYA, pPSPRODUC, pPCPAIS, pPCDPTO, pPCCIUDAD, pPCAGRUPA, pPCSUCURSAL,
						pPCINTERMED });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCPAIS);
		cStmt.setObject(5, pPCDPTO);
		cStmt.setObject(6, pPCCIUDAD);
		cStmt.setObject(7, pPCAGRUPA);
		cStmt.setObject(8, pPCSUCURSAL);
		cStmt.setObject(9, pPCINTERMED);
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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES_LIN(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCDPTO,
			java.math.BigDecimal pPCCIUDAD, String pPCAGRUPA, java.math.BigDecimal pPCSUCURSAL,
			java.math.BigDecimal pPCINTERMED) throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES_LIN(pPCCAMPANYA, pPSPRODUC, pPCPAIS, pPCDPTO,
				pPCCIUDAD, pPCAGRUPA, pPCSUCURSAL, pPCINTERMED);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTDTOSESPECIALES.F_DEL_DTOSESPECIALES_LIN

	// --START-PAC_IAX_MNTDTOSESPECIALES.F_GET_DTOSESPECIAL(PCCAMPANYA)
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIAL(java.math.BigDecimal pPCCAMPANYA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_GET_DTOSESPECIAL(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA" }, new Object[] { pPCCAMPANYA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_DTOSESPECIALES".toUpperCase())); // Valor de "PDTOSESPE"
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
			retVal.put("PDTOSESPE", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PDTOSESPE", null);
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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIAL(java.math.BigDecimal pPCCAMPANYA)
			throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIAL(pPCCAMPANYA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTDTOSESPECIALES.F_GET_DTOSESPECIAL
	// --START-PAC_IAX_MNTDTOSESPECIALES.F_SET_DTOSESPECIALES(PCCAMPANYA, PFECINI,
	// PFECFIN, PMODO)
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES(java.math.BigDecimal pPCCAMPANYA,
			java.sql.Date pPFECINI, java.sql.Date pPFECFIN, String pPMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_SET_DTOSESPECIALES(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCAMPANYA", "pPFECINI", "pPFECFIN", "pPMODO" },
				new Object[] { pPCCAMPANYA, pPFECINI, pPFECFIN, pPMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPFECINI);
		cStmt.setObject(4, pPFECFIN);
		cStmt.setObject(5, pPMODO);
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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES(java.math.BigDecimal pPCCAMPANYA,
			java.sql.Date pPFECINI, java.sql.Date pPFECFIN, String pPMODO) throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES(pPCCAMPANYA, pPFECINI, pPFECFIN, pPMODO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_MNTDTOSESPECIALES.F_SET_DTOSESPECIALES
	// --START-PAC_IAX_MNTDTOSESPECIALES.F_SET_DTOSESPECIALES_LIN(PCCAMPANYA,
	// PSPRODUC, PCPAIS, PCDPTO, PCCIUDAD, PCAGRUPA, PCSUCURSAL, PCINTERMED, PPDTO)
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES_LIN(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCDPTO,
			java.math.BigDecimal pPCCIUDAD, String pPCAGRUPA, java.math.BigDecimal pPCSUCURSAL,
			java.math.BigDecimal pPCINTERMED, java.math.BigDecimal pPPDTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_SET_DTOSESPECIALES_LIN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCAMPANYA", "pPSPRODUC", "pPCPAIS", "pPCDPTO", "pPCCIUDAD", "pPCAGRUPA",
						"pPCSUCURSAL", "pPCINTERMED", "pPPDTO" },
				new Object[] { pPCCAMPANYA, pPSPRODUC, pPCPAIS, pPCDPTO, pPCCIUDAD, pPCAGRUPA, pPCSUCURSAL, pPCINTERMED,
						pPPDTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCAMPANYA);
		cStmt.setObject(3, pPSPRODUC);
		cStmt.setObject(4, pPCPAIS);
		cStmt.setObject(5, pPCDPTO);
		cStmt.setObject(6, pPCCIUDAD);
		cStmt.setObject(7, pPCAGRUPA);
		cStmt.setObject(8, pPCSUCURSAL);
		cStmt.setObject(9, pPCINTERMED);
		cStmt.setObject(10, pPPDTO);
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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES_LIN(java.math.BigDecimal pPCCAMPANYA,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCDPTO,
			java.math.BigDecimal pPCCIUDAD, String pPCAGRUPA, java.math.BigDecimal pPCSUCURSAL,
			java.math.BigDecimal pPCINTERMED, java.math.BigDecimal pPPDTO) throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES_LIN(pPCCAMPANYA, pPSPRODUC, pPCPAIS, pPCDPTO,
				pPCCIUDAD, pPCAGRUPA, pPCSUCURSAL, pPCINTERMED, pPPDTO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTDTOSESPECIALES.F_SET_DTOSESPECIALES_LIN

	// --START-PAC_IAX_MNTDTOSESPECIALES.F_GET_CAGRTIPO()
	private HashMap callPAC_IAX_MNTDTOSESPECIALES__F_GET_CAGRTIPO() throws Exception {
		String callQuery = "{?=call PAC_IAX_MNTDTOSESPECIALES.F_GET_CAGRTIPO(?)}";

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

	public HashMap ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_CAGRTIPO() throws Exception {
		return this.callPAC_IAX_MNTDTOSESPECIALES__F_GET_CAGRTIPO();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_MNTDTOSESPECIALES.F_GET_CAGRTIPO

}
