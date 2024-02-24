//Revision:# 39WgkpBi2TuAnKk5tKbgtA== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_COMPANIAS extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_COMPANIAS.class);
	private Connection conn = null;

	public PAC_IAX_COMPANIAS(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_COMPANIAS.F_DEL_COMPANIA(PCCOMPANI)

	private HashMap callPAC_IAX_COMPANIAS__F_DEL_COMPANIA(java.math.BigDecimal pPCCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_DEL_COMPANIA(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI" }, new Object[] { pPCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_DEL_COMPANIA(java.math.BigDecimal pPCCOMPANI) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_DEL_COMPANIA(pPCCOMPANI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_DEL_COMPANIA
	// --START-PAC_IAX_COMPANIAS.F_GET_COMPANIA(PCCOMPANI, PSPERSON, PTCOMPANI)

	private HashMap callPAC_IAX_COMPANIAS__F_GET_COMPANIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSPERSON, String pPTCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_GET_COMPANIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPSPERSON", "pPTCOMPANI" },
				new Object[] { pPCCOMPANI, pPSPERSON, pPTCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPSPERSON);
		cStmt.setObject(4, pPTCOMPANI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_COMPANIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPSPERSON, String pPTCOMPANI) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_GET_COMPANIA(pPCCOMPANI, pPSPERSON, pPTCOMPANI); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_GET_COMPANIA
	// --START-PAC_IAX_COMPANIAS.F_GET_COMPANIAS()

	private HashMap callPAC_IAX_COMPANIAS__F_GET_COMPANIAS() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_GET_COMPANIAS(?)}";

		logCall(callQuery, new String[] {}, new Object[] {});
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_COMPANIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS() throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_GET_COMPANIAS(); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_GET_COMPANIAS
	// --START-PAC_IAX_COMPANIAS.F_SET_COMPANIA(PSPERSON, PCCOMPANI, PTCOMPANI,
	// PCPAIS, PCTIPIVA, PCCOMISI, PCUNESPA, PFFALTA, PFBAJA, PCCONTABLE, PCTIPCOM,
	// PCAFILI, PCCASAMAT, PCSUPERFINAN, PCDIAN, PCCALIFI, PCENTICALIFI, PNANYCALIF,
	// PNPATRIMONIO, PPIMPINT, PCTRAMTAX)

	// --START-PAC_IAX_COMPANIAS.F_SET_COMPANIA(PSPERSON, PCCOMPANI, PTCOMPANI,
	// PCPAIS, PCTIPIVA, PCCOMISI, PCUNESPA, PFFALTA, PFBAJA, PCCONTABLE, PCTIPCOM,
	// PCAFILI, PCCASAMAT, PCSUPERFINAN, PCDIAN, PCCALIFI, PCENTICALIFI, PNANYCALIF,
	// PNPATRIMONIO, PPIMPINT, PCTRAMTAX, PCINVERFAS)
	private HashMap callPAC_IAX_COMPANIAS__F_SET_COMPANIA(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCCOMPANI, String pPTCOMPANI, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCTIPIVA, String pPCCOMISI, String pPCUNESPA, java.sql.Date pPFFALTA,
			java.sql.Date pPFBAJA, java.math.BigDecimal pPCCONTABLE, java.math.BigDecimal pPCTIPCOM,
			java.math.BigDecimal pPCAFILI, String pPCCASAMAT, String pPCSUPERFINAN, String pPCDIAN,
			java.math.BigDecimal pPCCALIFI, java.math.BigDecimal pPCENTICALIFI, java.math.BigDecimal pPNANYCALIF,
			java.math.BigDecimal pPNPATRIMONIO, java.math.BigDecimal pPPIMPINT, java.math.BigDecimal pPCTRAMTAX,
			java.math.BigDecimal pPCINVERFAS, java.math.BigDecimal pPCRESIDFISC, java.sql.Date pPFRESFINI,
			java.sql.Date pPFRESFFIN, java.math.BigDecimal pPCTIPREA) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_SET_COMPANIA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
		logger.debug(pPCTIPREA + " FREDDY2");
		logCall(callQuery, new String[] { "pPSPERSON", "pPCCOMPANI", "pPTCOMPANI", "pPCPAIS", "pPCTIPIVA", "pPCCOMISI",
				"pPCUNESPA", "pPFFALTA", "pPFBAJA", "pPCCONTABLE", "pPCTIPCOM", "pPCAFILI", "pPCCASAMAT",
				"pPCSUPERFINAN", "pPCDIAN", "pPCCALIFI", "pPCENTICALIFI", "pPNANYCALIF", "pPNPATRIMONIO", "pPPIMPINT",
				"pPCTRAMTAX", "pPCINVERFAS", "pPCRESIDFISC", "pPFRESFINI", "pPFRESFFIN", "pPCTIPREA" },
				new Object[] { pPSPERSON, pPCCOMPANI, pPTCOMPANI, pPCPAIS, pPCTIPIVA, pPCCOMISI, pPCUNESPA, pPFFALTA,
						pPFBAJA, pPCCONTABLE, pPCTIPCOM, pPCAFILI, pPCCASAMAT, pPCSUPERFINAN, pPCDIAN, pPCCALIFI,
						pPCENTICALIFI, pPNANYCALIF, pPNPATRIMONIO, pPPIMPINT, pPCTRAMTAX, pPCINVERFAS, pPCRESIDFISC,
						pPFRESFINI, pPFRESFFIN, pPCTIPREA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCCOMPANI);
		cStmt.setObject(4, pPTCOMPANI);
		cStmt.setObject(5, pPCPAIS);
		cStmt.setObject(6, pPCTIPIVA);
		cStmt.setObject(7, pPCCOMISI);
		cStmt.setObject(8, pPCUNESPA);
		cStmt.setObject(9, pPFFALTA);
		cStmt.setObject(10, pPFBAJA);
		cStmt.setObject(11, pPCCONTABLE);
		cStmt.setObject(12, pPCTIPCOM);
		cStmt.setObject(13, pPCAFILI);
		cStmt.setObject(14, pPCCASAMAT);
		cStmt.setObject(15, pPCSUPERFINAN);
		cStmt.setObject(16, pPCDIAN);
		cStmt.setObject(17, pPCCALIFI);
		cStmt.setObject(18, pPCENTICALIFI);
		cStmt.setObject(19, pPNANYCALIF);
		cStmt.setObject(20, pPNPATRIMONIO);
		cStmt.setObject(21, pPPIMPINT);
		cStmt.setObject(22, pPCTRAMTAX);
		cStmt.setObject(24, pPCINVERFAS);
		cStmt.setObject(25, pPCRESIDFISC); // CONFCC-5
		cStmt.setObject(26, pPFRESFINI); // CONFCC-5
		cStmt.setObject(27, pPFRESFFIN); // CONFCC-5
		cStmt.setObject(28, pPCTIPREA); // IAXIS-4823
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(23, java.sql.Types.NUMERIC); // Valor de "PCCOMPANI_NEW"
		cStmt.registerOutParameter(29, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PCCOMPANI_NEW", cStmt.getObject(23));
		} catch (SQLException e) {
			retVal.put("PCCOMPANI_NEW", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(25));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_SET_COMPANIA(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCCOMPANI, String pPTCOMPANI, java.math.BigDecimal pPCPAIS,
			java.math.BigDecimal pPCTIPIVA, String pPCCOMISI, String pPCUNESPA, java.sql.Date pPFFALTA,
			java.sql.Date pPFBAJA, java.math.BigDecimal pPCCONTABLE, java.math.BigDecimal pPCTIPCOM,
			java.math.BigDecimal pPCAFILI, String pPCCASAMAT, String pPCSUPERFINAN, String pPCDIAN,
			java.math.BigDecimal pPCCALIFI, java.math.BigDecimal pPCENTICALIFI, java.math.BigDecimal pPNANYCALIF,
			java.math.BigDecimal pPNPATRIMONIO, java.math.BigDecimal pPPIMPINT, java.math.BigDecimal pPCTRAMTAX,
			java.math.BigDecimal pPCINVERFAS, java.math.BigDecimal pPCRESIDFISC, java.sql.Date pPFRESFINI,
			java.sql.Date pPFRESFFIN, java.math.BigDecimal pPCTIPREA) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_SET_COMPANIA(pPSPERSON, pPCCOMPANI, pPTCOMPANI, pPCPAIS, pPCTIPIVA,
				pPCCOMISI, pPCUNESPA, pPFFALTA, pPFBAJA, pPCCONTABLE, pPCTIPCOM, pPCAFILI, pPCCASAMAT, pPCSUPERFINAN,
				pPCDIAN, pPCCALIFI, pPCENTICALIFI, pPNANYCALIF, pPNPATRIMONIO, pPPIMPINT, pPCTRAMTAX, pPCINVERFAS,
				pPCRESIDFISC, pPFRESFINI, pPFRESFFIN, pPCTIPREA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_SET_COMPANIA

	// --START-PAC_IAX_COMPANIAS.F_DEL_COMPANIA_CALIF(PSPERSON, PCENTICALIFI,
	// PFEFECTO)

	private HashMap callPAC_IAX_COMPANIAS__F_DEL_COMPANIA_CALIF(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCENTICALIFI, java.sql.Date pPFEFECTO) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_DEL_COMPANIA_CALIF(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCENTICALIFI", "pPFEFECTO" },
				new Object[] { pPSPERSON, pPCENTICALIFI, pPFEFECTO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCENTICALIFI);
		cStmt.setObject(4, pPFEFECTO);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_DEL_COMPANIA_CALIF(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCENTICALIFI, java.sql.Date pPFEFECTO) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_DEL_COMPANIA_CALIF(pPSPERSON, pPCENTICALIFI, pPFEFECTO); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_DEL_COMPANIA_CALIF

	// --START-PAC_IAX_COMPANIAS.F_GET_COMPANIAS_CALIF(PSPERSON, PCENTICALIFI)

	private HashMap callPAC_IAX_COMPANIAS__F_GET_COMPANIAS_CALIF(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCENTICALIFI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_GET_COMPANIAS_CALIF(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON", "pPCENTICALIFI" }, new Object[] { pPSPERSON, pPCENTICALIFI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCENTICALIFI);
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

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS_CALIF(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCENTICALIFI) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_GET_COMPANIAS_CALIF(pPSPERSON, pPCENTICALIFI); // AXIS-WLS1SERVER-Ready
	}

	// --END-PAC_IAX_COMPANIAS.F_GET_COMPANIAS_CALIF
	// --START-PAC_IAX_COMPANIAS.F_SET_COMPANIA_CALIF(PSPERSON, PCENTICALIFI,
	// PCCOMPANI, PCCALIFI, PPRECARGO, PFEFECTO, POFC_REPRES, PCESTADO_CALIFI,
	// PFINSCRIP, PANYOACTUALIZ)
	private HashMap callPAC_IAX_COMPANIAS__F_SET_COMPANIA_CALIF(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCENTICALIFI, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCCALIFI,
			java.math.BigDecimal pPPRECARGO, java.sql.Date pPFEFECTO, String pPOFC_REPRES,
			java.math.BigDecimal pPCESTADO_CALIFI, java.sql.Date pPFINSCRIP, java.sql.Date pPANYOACTUALIZ)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_SET_COMPANIA_CALIF(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSPERSON", "pPCENTICALIFI", "pPCCOMPANI", "pPCCALIFI", "pPPRECARGO", "pPFEFECTO",
						"pPOFC_REPRES", "pPCESTADO_CALIFI", "pPFINSCRIP", "pPANYOACTUALIZ" },
				new Object[] { pPSPERSON, pPCENTICALIFI, pPCCOMPANI, pPCCALIFI, pPPRECARGO, pPFEFECTO, pPOFC_REPRES,
						pPCESTADO_CALIFI, pPFINSCRIP, pPANYOACTUALIZ });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
		cStmt.setObject(3, pPCENTICALIFI);
		cStmt.setObject(4, pPCCOMPANI);
		cStmt.setObject(5, pPCCALIFI);
		cStmt.setObject(6, pPPRECARGO);
		cStmt.setObject(7, pPFEFECTO);
		cStmt.setObject(8, pPOFC_REPRES);
		cStmt.setObject(9, pPCESTADO_CALIFI);
		cStmt.setObject(10, pPFINSCRIP);
		cStmt.setObject(11, pPANYOACTUALIZ);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(12));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_SET_COMPANIA_CALIF(java.math.BigDecimal pPSPERSON,
			java.math.BigDecimal pPCENTICALIFI, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCCALIFI,
			java.math.BigDecimal pPPRECARGO, java.sql.Date pPFEFECTO, String pPOFC_REPRES,
			java.math.BigDecimal pPCESTADO_CALIFI, java.sql.Date pPFINSCRIP, java.sql.Date pPANYOACTUALIZ)
			throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_SET_COMPANIA_CALIF(pPSPERSON, pPCENTICALIFI, pPCCOMPANI, pPCCALIFI,
				pPPRECARGO, pPFEFECTO, pPOFC_REPRES, pPCESTADO_CALIFI, pPFINSCRIP, pPANYOACTUALIZ);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_SET_COMPANIA_CALIF

	// --START-PAC_IAX_COMPANIAS.F_VAL_COMPANIAS_CALIF(PSPERSON)

	private HashMap callPAC_IAX_COMPANIAS__F_VAL_COMPANIAS_CALIF(java.math.BigDecimal pPSPERSON) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_VAL_COMPANIAS_CALIF(?, ?)}";

		logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPERSON);
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
		retVal = new ConversionUtil().convertOracleObjects(retVal); // AXIS-WLS1SERVER-Ready
		cStmt.close(); // AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_VAL_COMPANIAS_CALIF(java.math.BigDecimal pPSPERSON) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_VAL_COMPANIAS_CALIF(pPSPERSON); // AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_VAL_COMPANIAS_CALIF

	// --START-PAC_IAX_COMPANIAS.F_GET_INDICADORES_CIAS(PCCOMPANI)
	private HashMap callPAC_IAX_COMPANIAS__F_GET_INDICADORES_CIAS(java.math.BigDecimal pPCCOMPANI) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_GET_INDICADORES_CIAS(?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI" }, new Object[] { pPCCOMPANI });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_INDICADORES_CIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_GET_INDICADORES_CIAS(java.math.BigDecimal pPCCOMPANI) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_GET_INDICADORES_CIAS(pPCCOMPANI);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_GET_INDICADORES_CIAS

	// --START-PAC_IAX_COMPANIAS.F_GET_TINDICADORESCIA()
	private HashMap callPAC_IAX_COMPANIAS__F_GET_TINDICADORESCIA() throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_GET_TINDICADORESCIA(?)}";

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

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_GET_TINDICADORESCIA() throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_GET_TINDICADORESCIA();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_GET_TINDICADORESCIA

	// --START-PAC_IAX_COMPANIAS.F_GET_INDICADOR_CIA(PCCOMPANI, PCTIPIND, PFFINIVIG)
	private HashMap callPAC_IAX_COMPANIAS__F_GET_INDICADOR_CIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPIND, java.sql.Date pPFFINIVIG) throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_GET_INDICADOR_CIA(?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCCOMPANI", "pPCTIPIND", "pPFFINIVIG" },
				new Object[] { pPCCOMPANI, pPCTIPIND, pPFFINIVIG });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPCTIPIND);
		cStmt.setObject(4, pPFFINIVIG);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_INDICADORES_CIAS".toUpperCase())); // Valor de "RETURN"
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

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_GET_INDICADOR_CIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPIND, java.sql.Date pPFFINIVIG) throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_GET_INDICADOR_CIA(pPCCOMPANI, pPCTIPIND, pPFFINIVIG);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_GET_INDICADOR_CIA

	// --START-PAC_IAX_COMPANIAS.F_SET_INDICADOR_CIA(PCCOMPANI, PCTIPIND, PNVALOR,
	// PFINIVIG, PFFINVIG, PCENVIOSAP, PCAPLICA)
	private HashMap callPAC_IAX_COMPANIAS__F_SET_INDICADOR_CIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPIND, java.math.BigDecimal pPNVALOR, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, java.math.BigDecimal pPCENVIOSAP, java.math.BigDecimal pPCAPLICA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_COMPANIAS.F_SET_INDICADOR_CIA(?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPCCOMPANI", "pPCTIPIND", "pPNVALOR", "pPFINIVIG", "pPFFINVIG", "pPCENVIOSAP",
						"pPCAPLICA" },
				new Object[] { pPCCOMPANI, pPCTIPIND, pPNVALOR, pPFINIVIG, pPFFINVIG, pPCENVIOSAP, pPCAPLICA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCCOMPANI);
		cStmt.setObject(3, pPCTIPIND);
		cStmt.setObject(4, pPNVALOR);
		cStmt.setObject(5, pPFINIVIG);
		cStmt.setObject(6, pPFFINVIG);
		cStmt.setObject(7, pPCENVIOSAP);
		cStmt.setObject(8, pPCAPLICA);
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

	public HashMap ejecutaPAC_IAX_COMPANIAS__F_SET_INDICADOR_CIA(java.math.BigDecimal pPCCOMPANI,
			java.math.BigDecimal pPCTIPIND, java.math.BigDecimal pPNVALOR, java.sql.Date pPFINIVIG,
			java.sql.Date pPFFINVIG, java.math.BigDecimal pPCENVIOSAP, java.math.BigDecimal pPCAPLICA)
			throws Exception {
		return this.callPAC_IAX_COMPANIAS__F_SET_INDICADOR_CIA(pPCCOMPANI, pPCTIPIND, pPNVALOR, pPFINIVIG, pPFFINVIG,
				pPCENVIOSAP, pPCAPLICA);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_COMPANIAS.F_SET_INDICADOR_CIA

}
