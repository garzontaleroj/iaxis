package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_COBRADOR extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COBRADOR.class);
	private Connection conn = null;

	public PAC_IAX_COBRADOR(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COBRADOR.F_GET_COBRADOR(PCEMPRES, PCCOBBAN, PCTIPBAN,
	// PCDOMENT, PTSUFIJO, PCDOMSUC, PCRAMO, PSPRODUC, PCAGENTE, PCBANCO, PNCUENTA)
	private HashMap callPAC_IAX_COBRADOR__F_GET_COBRADOR(java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCDOMENT, String pPTSUFIJO,
			java.math.BigDecimal pPCDOMSUC, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCBANCO, String pPNCUENTA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_GET_COBRADOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCEMPRES", "pPCCOBBAN", "pPCTIPBAN", "pPCDOMENT", "pPTSUFIJO", "pPCDOMSUC", "pPCRAMO",
						"pPSPRODUC", "pPCAGENTE", "pPCBANCO", "pPNCUENTA" },
				new Object[] { pPCEMPRES, pPCCOBBAN, pPCTIPBAN, pPCDOMENT, pPTSUFIJO, pPCDOMSUC, pPCRAMO, pPSPRODUC,
						pPCAGENTE, pPCBANCO, pPNCUENTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCEMPRES);
		cStmt.setObject(3, pPCCOBBAN);
		cStmt.setObject(4, pPCTIPBAN);
		cStmt.setObject(5, pPCDOMENT);
		cStmt.setObject(6, pPTSUFIJO);
		cStmt.setObject(7, pPCDOMSUC);
		cStmt.setObject(8, pPCRAMO);
		cStmt.setObject(9, pPSPRODUC);
		cStmt.setObject(10, pPCAGENTE);
		cStmt.setObject(11, pPCBANCO);
		cStmt.setObject(12, pPNCUENTA);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCOBRADOR"
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
			retVal.put("PCOBRADOR", cStmt.getObject(13));
		} catch (SQLException e) {
			retVal.put("PCOBRADOR", null);
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

	public HashMap ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR(java.math.BigDecimal pPCEMPRES,
			java.math.BigDecimal pPCCOBBAN, java.math.BigDecimal pPCTIPBAN, java.math.BigDecimal pPCDOMENT,
			String pPTSUFIJO, java.math.BigDecimal pPCDOMSUC, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCBANCO,
			String pPNCUENTA) throws Exception {
		return this.callPAC_IAX_COBRADOR__F_GET_COBRADOR(pPCEMPRES, pPCCOBBAN, pPCTIPBAN, pPCDOMENT, pPTSUFIJO,
				pPCDOMSUC, pPCRAMO, pPSPRODUC, pPCAGENTE, pPCBANCO, pPNCUENTA);
	}
	// --END-PAC_IAX_COBRADOR.F_GET_COBRADOR

	// --START-PAC_IAX_COBRADOR.F_TRASPASO_COBRADORES(CODEMPRESA, COBBANCORIGEN,
	// BANCOATRASPASAR, COBBANCDESTINO)
	private HashMap callPAC_IAX_COBRADOR__F_TRASPASO_COBRADORES(java.math.BigDecimal pPCODEMPRESA,
			java.math.BigDecimal pPCOBBANCORIGEN, java.math.BigDecimal pPBANCOATRASPASAR,
			java.math.BigDecimal pPCOBBANCDESTINO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_TRASPASO_COBRADORES(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCODEMPRESA", "pPCOBBANCORIGEN", "pPBANCOATRASPASAR", "pPCOBBANCDESTINO" },
				new Object[] { pPCODEMPRESA, pPCOBBANCORIGEN, pPBANCOATRASPASAR, pPCOBBANCDESTINO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCODEMPRESA);
		cStmt.setObject(3, pPCOBBANCORIGEN);
		cStmt.setObject(4, pPBANCOATRASPASAR);
		cStmt.setObject(5, pPCOBBANCDESTINO);
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

	public HashMap ejecutaPAC_IAX_COBRADOR__F_TRASPASO_COBRADORES(java.math.BigDecimal pPCODEMPRESA,
			java.math.BigDecimal pPCOBBANCORIGEN, java.math.BigDecimal pPBANCOATRASPASAR,
			java.math.BigDecimal pPCOBBANCDESTINO) throws Exception {
		return this.callPAC_IAX_COBRADOR__F_TRASPASO_COBRADORES(pPCODEMPRESA, pPCOBBANCORIGEN, pPBANCOATRASPASAR,
				pPCOBBANCDESTINO);
	}
	// --END-PAC_IAX_COBRADOR.F_TRASPASO_COBRADORES

	// --START-PAC_IAX_COBRADOR.F_GET_COBRADOR_DET(PCCOBBAN)
	private HashMap callPAC_IAX_COBRADOR__F_GET_COBRADOR_DET(java.math.BigDecimal pPCCOBBAN) throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_GET_COBRADOR_DET(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOBBAN" }, new Object[] { pPCCOBBAN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOBBAN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_COBBANCARIO".toUpperCase())); // Valor de "POBJBAN"
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
			retVal.put("POBJBAN", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("POBJBAN", null);
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

	public HashMap ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR_DET(java.math.BigDecimal pPCCOBBAN) throws Exception {
		return this.callPAC_IAX_COBRADOR__F_GET_COBRADOR_DET(pPCCOBBAN);
	}
	// --END-PAC_IAX_COBRADOR.F_GET_COBRADOR_DET

	// --START-PAC_IAX_COBRADOR.F_GET_COBRADOR_SEL(PCCOBBAN, PNORDEN)
	private HashMap callPAC_IAX_COBRADOR__F_GET_COBRADOR_SEL(java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPNORDEN) throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_GET_COBRADOR_SEL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOBBAN", "pPNORDEN" }, new Object[] { pPCCOBBAN, pPNORDEN });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOBBAN);
		cStmt.setObject(3, pPNORDEN);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_COBBANCARIOSEL".toUpperCase())); // Valor de "PCCOBBANSEL"
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
			retVal.put("PCCOBBANSEL", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PCCOBBANSEL", null);
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

	public HashMap ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR_SEL(java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPNORDEN) throws Exception {
		return this.callPAC_IAX_COBRADOR__F_GET_COBRADOR_SEL(pPCCOBBAN, pPNORDEN);
	}
	// --END-PAC_IAX_COBRADOR.F_GET_COBRADOR_SEL

	// --START-PAC_IAX_COBRADOR.F_SET_COBRADOR(PCCOBBAN, PNCUENTA, PTSUFIJO,
	// PCEMPRES, PCDOMENT, PCDOMSUC, PNPRISEL, PCBAJA, PDESCRIP, PNNUMNIF, PTCOBBAN,
	// PCTIPBAN, PCCONTABAN, PDOMFILL3, PCMODO, PPRECIMP, PCAGRUPREC)
	private HashMap callPAC_IAX_COBRADOR__F_SET_COBRADOR(java.math.BigDecimal pPCCOBBAN, String pPNCUENTA,
			String pPTSUFIJO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCDOMENT,
			java.math.BigDecimal pPCDOMSUC, java.math.BigDecimal pPNPRISEL, java.math.BigDecimal pPCBAJA,
			String pPDESCRIP, String pPNNUMNIF, String pPTCOBBAN, java.math.BigDecimal pPCTIPBAN,
			java.math.BigDecimal pPCCONTABAN, String pPDOMFILL3, String pPCMODO, java.math.BigDecimal pPPRECIMP,
			java.math.BigDecimal pPCAGRUPREC) throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_SET_COBRADOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOBBAN", "pPNCUENTA", "pPTSUFIJO", "pPCEMPRES", "pPCDOMENT", "pPCDOMSUC",
						"pPNPRISEL", "pPCBAJA", "pPDESCRIP", "pPNNUMNIF", "pPTCOBBAN", "pPCTIPBAN", "pPCCONTABAN",
						"pPDOMFILL3", "pPCMODO", "pPPRECIMP", "pPCAGRUPREC" },
				new Object[] { pPCCOBBAN, pPNCUENTA, pPTSUFIJO, pPCEMPRES, pPCDOMENT, pPCDOMSUC, pPNPRISEL, pPCBAJA,
						pPDESCRIP, pPNNUMNIF, pPTCOBBAN, pPCTIPBAN, pPCCONTABAN, pPDOMFILL3, pPCMODO, pPPRECIMP,
						pPCAGRUPREC });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOBBAN);
		cStmt.setObject(3, pPNCUENTA);
		cStmt.setObject(4, pPTSUFIJO);
		cStmt.setObject(5, pPCEMPRES);
		cStmt.setObject(6, pPCDOMENT);
		cStmt.setObject(7, pPCDOMSUC);
		cStmt.setObject(8, pPNPRISEL);
		cStmt.setObject(9, pPCBAJA);
		cStmt.setObject(10, pPDESCRIP);
		cStmt.setObject(11, pPNNUMNIF);
		cStmt.setObject(12, pPTCOBBAN);
		cStmt.setObject(13, pPCTIPBAN);
		cStmt.setObject(14, pPCCONTABAN);
		cStmt.setObject(15, pPDOMFILL3);
		cStmt.setObject(16, pPCMODO);
		cStmt.setObject(17, pPPRECIMP);
		cStmt.setObject(18, pPCAGRUPREC);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(19, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(19));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COBRADOR__F_SET_COBRADOR(java.math.BigDecimal pPCCOBBAN, String pPNCUENTA,
			String pPTSUFIJO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCDOMENT,
			java.math.BigDecimal pPCDOMSUC, java.math.BigDecimal pPNPRISEL, java.math.BigDecimal pPCBAJA,
			String pPDESCRIP, String pPNNUMNIF, String pPTCOBBAN, java.math.BigDecimal pPCTIPBAN,
			java.math.BigDecimal pPCCONTABAN, String pPDOMFILL3, String pPCMODO, java.math.BigDecimal pPPRECIMP,
			java.math.BigDecimal pPCAGRUPREC) throws Exception {
		return this.callPAC_IAX_COBRADOR__F_SET_COBRADOR(pPCCOBBAN, pPNCUENTA, pPTSUFIJO, pPCEMPRES, pPCDOMENT,
				pPCDOMSUC, pPNPRISEL, pPCBAJA, pPDESCRIP, pPNNUMNIF, pPTCOBBAN, pPCTIPBAN, pPCCONTABAN, pPDOMFILL3,
				pPCMODO, pPPRECIMP, pPCAGRUPREC);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COBRADOR.F_SET_COBRADOR

	// --START-PAC_IAX_COBRADOR.F_GET_NOUCOBRADOR()
	private HashMap callPAC_IAX_COBRADOR__F_GET_NOUCOBRADOR() throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_GET_NOUCOBRADOR(?, ?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PCCOBBAN"
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
			retVal.put("PCCOBBAN", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("PCCOBBAN", null);
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

	public HashMap ejecutaPAC_IAX_COBRADOR__F_GET_NOUCOBRADOR() throws Exception {
		return this.callPAC_IAX_COBRADOR__F_GET_NOUCOBRADOR();
	}
	// --END-PAC_IAX_COBRADOR.F_GET_NOUCOBRADOR

	// --START-PAC_IAX_COBRADOR.F_SET_COBRADOR_SEL(PCCOBBAN, PNORDEN, PCRAMO,
	// PSPRODUC, PCEMPRES, PCBANCO, PCAGENTE, PCTIPAGE, PCMODO)
	private HashMap callPAC_IAX_COBRADOR__F_SET_COBRADOR_SEL(java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPAGE, String pPCMODO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_SET_COBRADOR_SEL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOBBAN", "pPNORDEN", "pPCRAMO", "pPSPRODUC", "pPCEMPRES", "pPCBANCO", "pPCAGENTE",
						"pPCTIPAGE", "pPCMODO" },
				new Object[] { pPCCOBBAN, pPNORDEN, pPCRAMO, pPSPRODUC, pPCEMPRES, pPCBANCO, pPCAGENTE, pPCTIPAGE,
						pPCMODO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOBBAN);
		cStmt.setObject(3, pPNORDEN);
		cStmt.setObject(4, pPCRAMO);
		cStmt.setObject(5, pPSPRODUC);
		cStmt.setObject(6, pPCEMPRES);
		cStmt.setObject(7, pPCBANCO);
		cStmt.setObject(8, pPCAGENTE);
		cStmt.setObject(9, pPCTIPAGE);
		cStmt.setObject(10, pPCMODO);
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

	public HashMap ejecutaPAC_IAX_COBRADOR__F_SET_COBRADOR_SEL(java.math.BigDecimal pPCCOBBAN,
			java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC,
			java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCAGENTE,
			java.math.BigDecimal pPCTIPAGE, String pPCMODO) throws Exception {
		return this.callPAC_IAX_COBRADOR__F_SET_COBRADOR_SEL(pPCCOBBAN, pPNORDEN, pPCRAMO, pPSPRODUC, pPCEMPRES,
				pPCBANCO, pPCAGENTE, pPCTIPAGE, pPCMODO);
	}
	// --END-PAC_IAX_COBRADOR.F_SET_COBRADOR_SEL

	// --START-PAC_IAX_COBRADOR.F_GET_DESBANCO(PCBANCO)
	private HashMap callPAC_IAX_COBRADOR__F_GET_DESBANCO(java.math.BigDecimal pPCBANCO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COBRADOR.F_GET_DESBANCO(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCBANCO" }, new Object[] { pPCBANCO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCBANCO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "PTBANCO"
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
			retVal.put("PTBANCO", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTBANCO", null);
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

	public HashMap ejecutaPAC_IAX_COBRADOR__F_GET_DESBANCO(java.math.BigDecimal pPCBANCO) throws Exception {
		return this.callPAC_IAX_COBRADOR__F_GET_DESBANCO(pPCBANCO);
	}
	// --END-PAC_IAX_COBRADOR.F_GET_DESBANCO

}
