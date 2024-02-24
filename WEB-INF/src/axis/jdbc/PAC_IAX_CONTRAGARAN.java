//Revision:# z8EIdKN2vwVfmyWwi5ik+A== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_CONTRAGARAN extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_CONTRAGARAN.class);
	private Connection conn = null;

	public PAC_IAX_CONTRAGARAN(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_CONTRAGARANTIAS.F_DEL_CONTRAGARAN_CODEU(PSCONTGAR, PSPERSON,
	// PNMOVIMI)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_CODEU(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_DEL_CONTRAGARAN_CODEU(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR", "pPSPERSON", "pPNMOVIMI" },
				new Object[] { pPSCONTGAR, pPSPERSON, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_CODEU(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_CODEU(pPSCONTGAR, pPSPERSON, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_DEL_CONTRAGARAN_CODEU
	// --START-PAC_IAX_CONTRAGARANTIAS.F_DEL_CONTRAGARAN_POL(PSCONTGAR, PSSEGURO,
	// PNMOVIMI)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_POL(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_DEL_CONTRAGARAN_POL(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR", "pPSSEGURO", "pPNMOVIMI" },
				new Object[] { pPSCONTGAR, pPSSEGURO, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_POL(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_POL(pPSCONTGAR, pPSSEGURO, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_DEL_CONTRAGARAN_POL
	// --START-PAC_IAX_CONTRAGARANTIAS.F_EDIT_CONTRAGARAN_DOC(PSCONTGAR, PNMOVIMI,
	// PIDDOCGDX, PCTIPO, PTOBSERV, PTFILENAME, PFCADUCI)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_EDIT_CONTRAGARAN_DOC(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO,
			String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_EDIT_CONTRAGARAN_DOC(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSCONTGAR", "pPNMOVIMI", "pPIDDOCGDX", "pPCTIPO", "pPTOBSERV", "pPTFILENAME",
						"pPFCADUCI" },
				new Object[] { pPSCONTGAR, pPNMOVIMI, pPIDDOCGDX, pPCTIPO, pPTOBSERV, pPTFILENAME, pPFCADUCI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPIDDOCGDX);
		cStmt.setObject(5, pPCTIPO);
		cStmt.setObject(6, pPTOBSERV);
		cStmt.setObject(7, pPTFILENAME);
		cStmt.setObject(8, pPFCADUCI);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_EDIT_CONTRAGARAN_DOC(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO,
			String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_EDIT_CONTRAGARAN_DOC(pPSCONTGAR, pPNMOVIMI, pPIDDOCGDX, pPCTIPO,
				pPTOBSERV, pPTFILENAME, pPFCADUCI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_EDIT_CONTRAGARAN_DOC
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CAB(PSPERSON, PNRADICA,
	// PSSEGURO)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB(java.math.BigDecimal pPSPERSON, String pPNRADICA,
			java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CAB(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPNRADICA", "pPSSEGURO" },
				new Object[] { pPSPERSON, pPNRADICA, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPNRADICA);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTRAGARAN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB(java.math.BigDecimal pPSPERSON,
			String pPNRADICA, java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB(pPSPERSON, pPNRADICA, pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CAB
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CODE(PSCONTGAR)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CODE(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CODE(?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR" }, new Object[] { pPSCONTGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CODE(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CODE(pPSCONTGAR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CODE
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_DET(PSCONTGAR, PSPERSON)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DET(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_DET(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR", "pPSPERSON" }, new Object[] { pPSCONTGAR, pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPSPERSON);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DET(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DET(pPSCONTGAR, pPSPERSON);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_DET
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_DOC(PSCONTGAR)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DOC(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_DOC(?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR" }, new Object[] { pPSCONTGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DOC(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DOC(pPSCONTGAR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_DOC
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_MOV(PSCONTGAR)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_MOV(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_MOV(?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR" }, new Object[] { pPSCONTGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_MOV(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_MOV(pPSCONTGAR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_MOV
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_POL(PSCONTGAR)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_POL(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_POL(?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR" }, new Object[] { pPSCONTGAR });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_POL(java.math.BigDecimal pPSCONTGAR)
			throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_POL(pPSCONTGAR);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_POL
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_SEG(PSSEGURO)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_SEG(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_SEG(?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTRAGARAN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_SEG(java.math.BigDecimal pPSSEGURO)
			throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_SEG(pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_SEG

	// TCS_826 - ACL - 25/02/2019 Se agregan los parámetros TITCDT y NITTIT
	// TCS_823 - ACL - 04/03/2019 Se ajusta el paràmetro SPERFIDE a campo texto
	// TCS_319 - ACL - 14/03/2019 Se agregan los campos NSINIES, PORCENTAJE, FOBLIG,
	// CCUENTA, NCUENTA
	// TCS_309 - ACL - 19/03/2019 Se agrega los campos TEXPAGARE, TEXIDEN
	// --START-PAC_IAX_CONTRAGARANTIAS.F_GRABAR_CONTRAGARANTIA(PSCONTGAR, PCASEGURA,
	// PCBANCO, PCCLASE, PCESTADO, PCMARCA, PCTIPOVEH, PCMONEDA, PCORIGEN, PTCAUSA,
	// PCPAIS, PCPROVIN, PCPOBLAC, PCTENEDOR, PCTIPO, PDOCUMENTO, PFCERTLIB, PFCREA,
	// PFESCRITURA, PFEXPEDIC, PFVENCIMI, PFVENCIMI1, PFVENCIMI2, PIASEGURA,
	// PIINTCAP, PIINTERES, PIVALOR, PNEMPRESA, PNMOTOR, PNNUMESCR, PNPLACA,
	// PNCOLOR, PNPLAZO, PNRADICA, PNSERIE, PSPERFIDE, PSPERSON, PTABLAS, PTAUXILIA,
	// PCIMPRESO, PTDESCRIPCION, PTDESCRIPINM, PTDIRECCION, PTOBSTEN, PTSUCURSAL,
	// PTITCDT, PNITTIT, pPTASA, pPIVA, pPFINIPAG, pPFFINPAG, pPCPOBLACPAG,
	// pPCPROVINPAG, pPCPOBLACPAR, pPCPROVINPAR, pPCPOBLACFIR, pPCPROVINFIR,
	// PNSINIES, PPORCENTAJE, PFOBLIG, PCCUENTA, PNCUENTA, PTEXPAGARE, PTEXIDEN)

	// inicio Bartolo Herrera 11-03-2019 --- IAXIS-3053
	// IAXIS-15586-- 01/06/2021
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GRABAR_CONTRAGARANTIA(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPCASEGURA, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCCLASE,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCMARCA, java.math.BigDecimal pPCTIPOVEH,
			String pPCMONEDA, java.math.BigDecimal pPCORIGEN, String pPTCAUSA, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCTENEDOR,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCAREA, String pPDOCUMENTO, java.sql.Date pPFCERTLIB,
			java.sql.Date pPFCREA, java.sql.Date pPFESCRITURA, java.sql.Date pPFEXPEDIC, java.sql.Date pPFVENCIMI,
			java.sql.Date pPFVENCIMI1, java.sql.Date pPFVENCIMI2, java.math.BigDecimal pPIASEGURA,
			java.math.BigDecimal pPIINTCAP, java.math.BigDecimal pPIINTERES, java.math.BigDecimal pPIVALOR,
			java.math.BigDecimal pPNEMPRESA, String pPNMOTOR, java.math.BigDecimal pPNNUMESCR, String pPNPLACA,
			java.math.BigDecimal pPNCOLOR, java.math.BigDecimal pPNPLAZO, java.math.BigDecimal pPNRADICA,
			String pPNSERIE, String pPSPERFIDE, java.math.BigDecimal pPSPERSON, String pPTABLAS, String pPTAUXILIA,
			java.math.BigDecimal pPCIMPRESO, String pPTDESCRIPCION, String pPTDESCRIPINM, String pPTDIRECCION,
			String pPTOBSTEN, String pPTSUCURSAL, String pPTITCDT, String pPNITTIT, java.sql.Date MODELO, String pPTASA,
			String pPIVA, java.sql.Date pPFINIPAG, java.sql.Date pPFFINPAG, java.math.BigDecimal pPCPOBLACPAG,
			java.math.BigDecimal pPCPROVINPAG, java.math.BigDecimal pPCPOBLACPAR, java.math.BigDecimal pPCPROVINPAR,
			java.math.BigDecimal pPCPOBLACFIR, java.math.BigDecimal pPCPROVINFIR, java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPPORCENTAJE, java.sql.Date pPFOBLIG, java.math.BigDecimal pPCCUENTA, String pPNCUENTA,
			String pPTEXPAGARE, String pPTEXIDEN, String pPNOTARIA, String pPMATRICULA) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GRABAR_CONTRAGARANTIA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
		logCall(callQuery, new String[] { "pPSCONTGAR", "pPCASEGURA", "pPCBANCO", "pPCCLASE", "pPCESTADO", "pPCMARCA",
				"pPCTIPOVEH", "pPCMONEDA", "pPCORIGEN", "pPTCAUSA", "pPCPAIS", "pPCPROVIN", "pPCPOBLAC", "pPCTENEDOR",
				"pPCTIPO", "pPCAREA", "pPDOCUMENTO", "pPFCERTLIB", "pPFCREA", "pPFESCRITURA", "pPFEXPEDIC",
				"pPFVENCIMI", "pPFVENCIMI1", "pPFVENCIMI2", "pPIASEGURA", "pPIINTCAP", "pPIINTERES", "pPIVALOR",
				"pPNEMPRESA", "pPNMOTOR", "pPNNUMESCR", "pPNPLACA", "pPNCOLOR", "pPNPLAZO", "pPNRADICA", "pPNSERIE",
				"pPSPERFIDE", "pPSPERSON", "pPTABLAS", "pPTAUXILIA", "pPCIMPRESO", "pPTDESCRIPCION", "pPTDESCRIPINM",
				"pPTDIRECCION", "pPTOBSTEN", "pPTSUCURSAL", "pPTITCDT", "pPNITTIT", "MODELO", "pPTASA", "pPIVA",
				"pPFINIPAG", "pPFFINPAG", "pPCPOBLACPAG", "pPCPROVINPAG", "pPCPOBLACPAR", "pPCPROVINPAR",
				"pPCPOBLACFIR", "pPCPROVINFIR", "pPNSINIES", "pPPORCENTAJE", "pPFOBLIG", "pPCCUENTA", "pPNCUENTA",
				"pPTEXPAGARE", "pPTEXIDEN", "pPNOTARIA", "pPMATRICULA" },
				new Object[] { pPSCONTGAR, pPCASEGURA, pPCBANCO, pPCCLASE, pPCESTADO, pPCMARCA, pPCTIPOVEH, pPCMONEDA,
						pPCORIGEN, pPTCAUSA, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCTENEDOR, pPCTIPO, pPCAREA, pPDOCUMENTO,
						pPFCERTLIB, pPFCREA, pPFESCRITURA, pPFEXPEDIC, pPFVENCIMI, pPFVENCIMI1, pPFVENCIMI2, pPIASEGURA,
						pPIINTCAP, pPIINTERES, pPIVALOR, pPNEMPRESA, pPNMOTOR, pPNNUMESCR, pPNPLACA, pPNCOLOR, pPNPLAZO,
						pPNRADICA, pPNSERIE, pPSPERFIDE, pPSPERSON, pPTABLAS, pPTAUXILIA, pPCIMPRESO, pPTDESCRIPCION,
						pPTDESCRIPINM, pPTDIRECCION, pPTOBSTEN, pPTSUCURSAL, pPTITCDT, pPNITTIT, MODELO, pPTASA, pPIVA,
						pPFINIPAG, pPFFINPAG, pPCPOBLACPAG, pPCPROVINPAG, pPCPOBLACPAR, pPCPROVINPAR, pPCPOBLACFIR,
						pPCPROVINFIR, pPNSINIES, pPPORCENTAJE, pPFOBLIG, pPCCUENTA, pPNCUENTA, pPTEXPAGARE, pPTEXIDEN,
						pPNOTARIA, pPMATRICULA });

		// fin Bartolo Herrera 11-03-2019 --- IAXIS-3053

		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPCASEGURA);
		cStmt.setObject(4, pPCBANCO);
		cStmt.setObject(5, pPCCLASE);
		cStmt.setObject(6, pPCESTADO);
		cStmt.setObject(7, pPCMARCA);
		cStmt.setObject(8, pPCTIPOVEH);
		cStmt.setObject(9, pPCMONEDA);
		cStmt.setObject(10, pPCORIGEN);
		cStmt.setObject(11, pPTCAUSA);
		cStmt.setObject(12, pPCPAIS);
		cStmt.setObject(13, pPCPROVIN);
		cStmt.setObject(14, pPCPOBLAC);
		cStmt.setObject(15, pPCTENEDOR);
		cStmt.setObject(16, pPCTIPO);
		cStmt.setObject(17, pPDOCUMENTO);
		cStmt.setObject(18, pPFCERTLIB);
		cStmt.setObject(19, pPFCREA);
		cStmt.setObject(20, pPFESCRITURA);
		cStmt.setObject(21, pPFEXPEDIC);
		cStmt.setObject(22, pPFVENCIMI);
		cStmt.setObject(23, pPFVENCIMI1);
		cStmt.setObject(24, pPFVENCIMI2);
		cStmt.setObject(25, pPIASEGURA);
		cStmt.setObject(26, pPIINTCAP);
		cStmt.setObject(27, pPIINTERES);
		cStmt.setObject(28, pPIVALOR);
		cStmt.setObject(29, pPNEMPRESA);
		cStmt.setObject(30, pPNMOTOR);
		cStmt.setObject(31, pPNNUMESCR);
		cStmt.setObject(32, pPNPLACA);
		cStmt.setObject(33, pPNCOLOR);
		cStmt.setObject(34, pPNPLAZO);
		cStmt.setObject(35, pPNRADICA);
		cStmt.setObject(36, pPNSERIE);
		cStmt.setObject(37, pPSPERFIDE);
		cStmt.setObject(38, pPSPERSON);
		cStmt.setObject(39, pPTABLAS);
		cStmt.setObject(40, pPTAUXILIA);
		cStmt.setObject(41, pPCIMPRESO);
		cStmt.setObject(42, pPTDESCRIPCION);
		cStmt.setObject(43, pPTDESCRIPINM);
		cStmt.setObject(44, pPTDIRECCION);
		cStmt.setObject(45, pPTOBSTEN);
		cStmt.setObject(46, pPTSUCURSAL);
		cStmt.setObject(47, pPTITCDT);
		cStmt.setObject(48, pPNITTIT);

		// inicio Bartolo Herrera 11-03-2019 --- IAXIS-3053
		cStmt.setObject(49, pPCAREA);
		cStmt.setObject(50, MODELO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(51, java.sql.Types.NUMERIC); // Valor de "PSCONTGAR_OUT"
		cStmt.registerOutParameter(52, java.sql.Types.NUMERIC); // Valor de "PNMOVIMI_OUT"
		cStmt.setObject(53, pPTASA);
		cStmt.setObject(54, pPIVA);
		cStmt.setObject(55, pPFINIPAG);
		cStmt.setObject(56, pPFFINPAG);
		cStmt.setObject(57, pPCPOBLACPAG);
		cStmt.setObject(58, pPCPROVINPAG);
		cStmt.setObject(59, pPCPOBLACPAR);
		cStmt.setObject(60, pPCPROVINPAR);
		cStmt.setObject(61, pPCPOBLACFIR);
		cStmt.setObject(62, pPCPROVINFIR);
		cStmt.setObject(63, pPNSINIES);
		cStmt.setObject(64, pPPORCENTAJE);
		cStmt.setObject(65, pPFOBLIG);
		cStmt.setObject(66, pPCCUENTA);
		cStmt.setObject(67, pPNCUENTA);
		cStmt.setObject(68, pPTEXPAGARE);
		cStmt.setObject(69, pPTEXIDEN);
		cStmt.setObject(70, pPNOTARIA);
		cStmt.setObject(71, pPMATRICULA);
		cStmt.registerOutParameter(72, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PSCONTGAR_OUT", cStmt.getObject(51));
		} catch (SQLException e) {
			retVal.put("PSCONTGAR_OUT", null);
		}
		try {
			retVal.put("PNMOVIMI_OUT", cStmt.getObject(52));
		} catch (SQLException e) {
			retVal.put("PNMOVIMI_OUT", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(72));

			// fin Bartolo Herrera 11-03-2019 --- IAXIS-3053
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	// inicio Bartolo Herrera 11-03-2019 --- IAXIS-3053
	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GRABAR_CONTRAGARANTIA(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPCASEGURA, java.math.BigDecimal pPCBANCO, java.math.BigDecimal pPCCLASE,
			java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCMARCA, java.math.BigDecimal pPCTIPOVEH,
			String pPCMONEDA, java.math.BigDecimal pPCORIGEN, String pPTCAUSA, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCTENEDOR,
			java.math.BigDecimal pPCTIPO, java.math.BigDecimal pPCAREA, String pPDOCUMENTO, java.sql.Date pPFCERTLIB,
			java.sql.Date pPFCREA, java.sql.Date pPFESCRITURA, java.sql.Date pPFEXPEDIC, java.sql.Date pPFVENCIMI,
			java.sql.Date pPFVENCIMI1, java.sql.Date pPFVENCIMI2, java.math.BigDecimal pPIASEGURA,
			java.math.BigDecimal pPIINTCAP, java.math.BigDecimal pPIINTERES, java.math.BigDecimal pPIVALOR,
			java.math.BigDecimal pPNEMPRESA, String pPNMOTOR, java.math.BigDecimal pPNNUMESCR, String pPNPLACA,
			java.math.BigDecimal pPNCOLOR, java.math.BigDecimal pPNPLAZO, java.math.BigDecimal pPNRADICA,
			String pPNSERIE, String pPSPERFIDE, java.math.BigDecimal pPSPERSON, String pPTABLAS, String pPTAUXILIA,
			java.math.BigDecimal pPCIMPRESO, String pPTDESCRIPCION, String pPTDESCRIPINM, String pPTDIRECCION,
			String pPTOBSTEN, String pPTSUCURSAL, String pPTITCDT, String pPNITTIT, java.sql.Date MODELO, String pPTASA,
			String pPIVA, java.sql.Date pPFINIPAG, java.sql.Date pPFFINPAG, java.math.BigDecimal pPCPOBLACPAG,
			java.math.BigDecimal pPCPROVINPAG, java.math.BigDecimal pPCPOBLACPAR, java.math.BigDecimal pPCPROVINPAR,
			java.math.BigDecimal pPCPOBLACFIR, java.math.BigDecimal pPCPROVINFIR, java.math.BigDecimal pPNSINIES,
			java.math.BigDecimal pPPORCENTAJE, java.sql.Date pPFOBLIG, java.math.BigDecimal pPCCUENTA, String pPNCUENTA,
			String pPTEXPAGARE, String pPTEXIDEN, String pPNOTARIA, String pPMATRICULA) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GRABAR_CONTRAGARANTIA(pPSCONTGAR, pPCASEGURA, pPCBANCO, pPCCLASE,
				pPCESTADO, pPCMARCA, pPCTIPOVEH, pPCMONEDA, pPCORIGEN, pPTCAUSA, pPCPAIS, pPCPROVIN, pPCPOBLAC,
				pPCTENEDOR, pPCTIPO, pPCAREA, pPDOCUMENTO, pPFCERTLIB, pPFCREA, pPFESCRITURA, pPFEXPEDIC, pPFVENCIMI,
				pPFVENCIMI1, pPFVENCIMI2, pPIASEGURA, pPIINTCAP, pPIINTERES, pPIVALOR, pPNEMPRESA, pPNMOTOR, pPNNUMESCR,
				pPNPLACA, pPNCOLOR, pPNPLAZO, pPNRADICA, pPNSERIE, pPSPERFIDE, pPSPERSON, pPTABLAS, pPTAUXILIA,
				pPCIMPRESO, pPTDESCRIPCION, pPTDESCRIPINM, pPTDIRECCION, pPTOBSTEN, pPTSUCURSAL, pPTITCDT, pPNITTIT,
				MODELO, pPTASA, pPIVA, pPFINIPAG, pPFFINPAG, pPCPOBLACPAG, pPCPROVINPAG, pPCPOBLACPAR, pPCPROVINPAR,
				pPCPOBLACFIR, pPCPROVINFIR, pPNSINIES, pPPORCENTAJE, pPFOBLIG, pPCCUENTA, pPNCUENTA, pPTEXPAGARE,
				pPTEXIDEN, pPNOTARIA, pPMATRICULA);// AXIS-WLS1SERVER-Ready
	}
	// fin Bartolo Herrera 11-03-2019 --- IAXIS-3053

	// --END-PAC_IAX_CONTRAGARANTIAS.F_GRABAR_CONTRAGARANTIA

	// --START-PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_CODEU(PSCONTGAR, PSPERSON,
	// PNMOVIMI)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_CODEU(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_CODEU(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR", "pPSPERSON", "pPNMOVIMI" },
				new Object[] { pPSCONTGAR, pPSPERSON, pPNMOVIMI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPNMOVIMI);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_CODEU(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPNMOVIMI) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_CODEU(pPSCONTGAR, pPSPERSON, pPNMOVIMI);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_CODEU
	// --START-PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_DOC(PSCONTGAR, PNMOVIMI,
	// PIDDOCGDX, PCTIPO, PTDESCRIP, PTOBSERV, PTFILENAME, PFCADUCI, PFALTA)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_DOC(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO,
			String pPTDESCRIP, String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI, java.sql.Date pPFALTA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_DOC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSCONTGAR", "pPNMOVIMI", "pPIDDOCGDX", "pPCTIPO", "pPTDESCRIP", "pPTOBSERV",
						"pPTFILENAME", "pPFCADUCI", "pPFALTA" },
				new Object[] { pPSCONTGAR, pPNMOVIMI, pPIDDOCGDX, pPCTIPO, pPTDESCRIP, pPTOBSERV, pPTFILENAME,
						pPFCADUCI, pPFALTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPNMOVIMI);
		cStmt.setObject(4, pPIDDOCGDX);
		cStmt.setObject(5, pPCTIPO);
		cStmt.setObject(6, pPTDESCRIP);
		cStmt.setObject(7, pPTOBSERV);
		cStmt.setObject(8, pPTFILENAME);
		cStmt.setObject(9, pPFCADUCI);
		cStmt.setObject(10, pPFALTA);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_DOC(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPNMOVIMI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO,
			String pPTDESCRIP, String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI, java.sql.Date pPFALTA)
			throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_DOC(pPSCONTGAR, pPNMOVIMI, pPIDDOCGDX, pPCTIPO,
				pPTDESCRIP, pPTOBSERV, pPTFILENAME, pPFCADUCI, pPFALTA);// AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_DOC
	// --START-PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_POL(PSCONTGAR, PSSEGURO,
	// PNMOVIMI, PTABLAS)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_POL(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI, String pPTABLAS) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_POL(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSCONTGAR", "pPSSEGURO", "pPNMOVIMI", "pPTABLAS" },
				new Object[] { pPSCONTGAR, pPSSEGURO, pPNMOVIMI, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSCONTGAR);
		cStmt.setObject(3, pPSSEGURO);
		cStmt.setObject(4, pPNMOVIMI);
		cStmt.setObject(5, pPTABLAS);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_POL(java.math.BigDecimal pPSCONTGAR,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI, String pPTABLAS) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_POL(pPSCONTGAR, pPSSEGURO, pPNMOVIMI, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTRAGARANTIAS.F_INS_CONTRAGARAN_POL

	// --START-PAC_IAX_CONTRAGARANTIAS.F_GETRELACION_SPERSON(PSPERSON, PTABLAS)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GETRELACION_SPERSON(java.math.BigDecimal pPSPERSON, String pPTABLAS)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GETRELACION_SPERSON(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPTABLAS" }, new Object[] { pPSPERSON, pPTABLAS });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPTABLAS);
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GETRELACION_SPERSON(java.math.BigDecimal pPSPERSON,
			String pPTABLAS) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GETRELACION_SPERSON(pPSPERSON, pPTABLAS);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTRAGARANTIAS.F_GETRELACION_SPERSON

	// inicio Bartolo Herrera 04/03/2019 IAXIS-2826

	// --START-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CAB2(PSPERSON, PNRADICA,
	// PSSEGURO)
	private HashMap callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB2(java.math.BigDecimal pPSPERSON,
			String pPNRADICA, java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CAB2(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPNRADICA", "pPSSEGURO" },
				new Object[] { pPSPERSON, pPNRADICA, pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPNRADICA);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTRAGARAN".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB2(java.math.BigDecimal pPSPERSON,
			String pPNRADICA, java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB2(pPSPERSON, pPNRADICA, pPSSEGURO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_CONTRAGARANTIAS.F_GET_CONTRAGARAN_CAB2

	// fin Bartolo Herrera 04/03/2019 IAXIS-2826

}