//Revision:# QElK21JqGCiGK5ELBEP21w== #
package axis.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; //WLS-Ready

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_RANGO_DIAN extends AccesoPL {
	static Log logger = LogFactory.getLog(PAC_IAX_RANGO_DIAN.class);
	private Connection conn = null;

	public PAC_IAX_RANGO_DIAN(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_RANGO_DIAN.F_GET_GRUPOSDIAN()
	private HashMap callPAC_IAX_RANGO_DIAN__F_GET_GRUPOSDIAN() throws Exception {
		String callQuery = "{?=call PAC_IAX_RANGO_DIAN.F_GET_GRUPOSDIAN(?)}";

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

	public HashMap ejecutaPAC_IAX_RANGO_DIAN__F_GET_GRUPOSDIAN() throws Exception {
		return this.callPAC_IAX_RANGO_DIAN__F_GET_GRUPOSDIAN();// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RANGO_DIAN.F_GET_GRUPOSDIAN

	// --START-PAC_IAX_RANGO_DIAN.F_GET_VERSIONESDIAN(pPSRDIAN,PRESOLUCION,
	// PDESCRIP,pPCRAMO, PCACTIVI, PCGRUPO, PSUCURSAL, PUSUARIO, PMAIL, pPTESTADO)
	private HashMap callPAC_IAX_RANGO_DIAN__F_GET_VERSIONESDIAN(java.math.BigDecimal pPSRDIAN,
			java.math.BigDecimal pPRESOLUCION, String pPDESCRIP, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCACTIVI, String pPCGRUPO, java.math.BigDecimal pPSUCURSAL, String pPUSUARIO,
			java.math.BigDecimal pPMAIL, java.math.BigDecimal pPTESTADO) throws Exception {
		String callQuery = "{?=call PAC_IAX_RANGO_DIAN.F_GET_VERSIONESDIAN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSRDIAN", "pPRESOLUCION", "pPDESCRIP", "pPCRAMO", "pPCACTIVI", "pPCGRUPO",
						"pPSUCURSAL", "pPUSUARIO", "pPMAIL", "pPTESTADO" },
				new Object[] { pPSRDIAN, pPRESOLUCION, pPDESCRIP, pPCRAMO, pPCACTIVI, pPCGRUPO, pPSUCURSAL, pPUSUARIO,
						pPMAIL, pPTESTADO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRDIAN);
		cStmt.setObject(3, pPRESOLUCION);
		cStmt.setObject(4, pPDESCRIP);
		cStmt.setObject(5, pPCRAMO);
		cStmt.setObject(6, pPCACTIVI);
		cStmt.setObject(7, pPCGRUPO);
		cStmt.setObject(8, pPSUCURSAL);
		cStmt.setObject(9, pPUSUARIO);
		cStmt.setObject(10, pPMAIL);
		cStmt.setObject(11, pPTESTADO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_RANGO_DIAN__F_GET_VERSIONESDIAN(java.math.BigDecimal pPSRDIAN,
			java.math.BigDecimal pPRESOLUCION, String pPDESCRIP, java.math.BigDecimal pPCRAMO,
			java.math.BigDecimal pPCACTIVI, String pPCGRUPO, java.math.BigDecimal pPSUCURSAL, String pPUSUARIO,
			java.math.BigDecimal pPMAIL, java.math.BigDecimal pPTESTADO) throws Exception {
		return this.callPAC_IAX_RANGO_DIAN__F_GET_VERSIONESDIAN(pPSRDIAN, pPRESOLUCION, pPDESCRIP, pPCRAMO, pPCACTIVI,
				pPCGRUPO, pPSUCURSAL, pPUSUARIO, pPMAIL, pPTESTADO);// AXIS-WLS1SERVER-Ready
	}
	// --END-PAC_IAX_RANGO_DIAN.F_GET_VERSIONESDIAN

	// --START-PAC_IAX_RANGO_DIAN.F_SET_VERSIONESDIAN(PSRDIAN, PNRESOL, PCAGENTE,
	// PCGRUPO, PFRESOL, PFINIVIG, PFFINVIG, PTDESCRIP, PNINICIAL, PNFINAL, PCUSU,
	// PTESTADO, PCENVCORR, PNAVISO, PNCERTAVI, PNCONTADOR, PMODO, PCACTIVI, PCRAMO)
	// -- INI - IAXIS-3288 - JLTS - 20/06/2019. Se adiciona el SPRODUC
	private HashMap callPAC_IAX_RANGO_DIAN__F_SET_VERSIONESDIAN(java.math.BigDecimal pPSRDIAN,
			java.math.BigDecimal pPNRESOL, java.math.BigDecimal pPCAGENTE, String pPCGRUPO, java.sql.Date pPFRESOL,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, String pPTDESCRIP, java.math.BigDecimal pPNINICIAL,
			java.math.BigDecimal pPNFINAL, String pPCUSU, String pPTESTADO, String pPCENVCORR,
			java.math.BigDecimal pPNAVISO, java.math.BigDecimal pPNCERTAVI, java.math.BigDecimal pPNCONTADOR,
			String pPMODO, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_RANGO_DIAN.F_SET_VERSIONESDIAN(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		logCall(callQuery,
				new String[] { "pPSRDIAN", "pPNRESOL", "pPCAGENTE", "pPCGRUPO", "pPFRESOL", "pPFINIVIG", "pPFFINVIG",
						"pPTDESCRIP", "pPNINICIAL", "pPNFINAL", "pPCUSU", "pPTESTADO", "pPCENVCORR", "pPNAVISO",
						"pPNCERTAVI", "pPNCONTADOR", "pPMODO", "pPCACTIVI", "pPCRAMO", "pPSPRODUC" },
				new Object[] { pPSRDIAN, pPNRESOL, pPCAGENTE, pPCGRUPO, pPFRESOL, pPFINIVIG, pPFFINVIG, pPTDESCRIP,
						pPNINICIAL, pPNFINAL, pPCUSU, pPTESTADO, pPCENVCORR, pPNAVISO, pPNCERTAVI, pPNCONTADOR, pPMODO,
						pPCACTIVI, pPCRAMO, pPSPRODUC });

		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSRDIAN);
		cStmt.setObject(3, pPNRESOL);
		cStmt.setObject(4, pPCAGENTE);
		cStmt.setObject(5, pPCGRUPO);
		cStmt.setObject(6, pPFRESOL);
		cStmt.setObject(7, pPFINIVIG);
		cStmt.setObject(8, pPFFINVIG);
		cStmt.setObject(9, pPTDESCRIP);
		cStmt.setObject(10, pPNINICIAL);
		cStmt.setObject(11, pPNFINAL);
		cStmt.setObject(12, pPCUSU);
		cStmt.setObject(13, pPTESTADO);
		cStmt.setObject(14, pPCENVCORR);
		cStmt.setObject(15, pPNAVISO);
		cStmt.setObject(16, pPNCERTAVI);
		cStmt.setObject(17, pPNCONTADOR);
		cStmt.setObject(18, pPMODO);
		cStmt.setObject(19, pPCACTIVI);
		cStmt.setObject(20, pPCRAMO);
		cStmt.setObject(21, pPSPRODUC);

		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(22, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(22));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_RANGO_DIAN__F_SET_VERSIONESDIAN(java.math.BigDecimal pPSRDIAN,
			java.math.BigDecimal pPNRESOL, java.math.BigDecimal pPCAGENTE, String pPCGRUPO, java.sql.Date pPFRESOL,
			java.sql.Date pPFINIVIG, java.sql.Date pPFFINVIG, String pPTDESCRIP, java.math.BigDecimal pPNINICIAL,
			java.math.BigDecimal pPNFINAL, String pPCUSU, String pPTESTADO, String pPCENVCORR,
			java.math.BigDecimal pPNAVISO, java.math.BigDecimal pPNCERTAVI, java.math.BigDecimal pPNCONTADOR,
			String pPMODO, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_RANGO_DIAN__F_SET_VERSIONESDIAN(pPSRDIAN, pPNRESOL, pPCAGENTE, pPCGRUPO, pPFRESOL,
				pPFINIVIG, pPFFINVIG, pPTDESCRIP, pPNINICIAL, pPNFINAL, pPCUSU, pPTESTADO, pPCENVCORR, pPNAVISO,
				pPNCERTAVI, pPNCONTADOR, pPMODO, pPCACTIVI, pPCRAMO, pPSPRODUC);// AXIS-WLS1SERVER-Ready
	}
	// -- FIN - IAXIS-3288 - JLTS - 20/06/2019. Se adiciona el SPRODUC
	// --END-PAC_IAX_RANGO_DIAN.F_SET_VERSIONESDIAN

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(java.math.BigDecimal cempres) throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_RAMOS(cempres);
	}

	/** --START-PAC_IAX_LISTVALORES.F_GET_RAMOS() */
	private HashMap callPAC_IAX_LISTVALORES__F_GET_RAMOS(java.math.BigDecimal cempres) throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_RAMOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "p_TIPO", "pCEMPRES" }, new Object[] { null, cempres });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, null);
		cStmt.setObject(3, cempres);
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
	/** --END-PAC_IAX_LISTVALORES.F_GET_RAMOS() */

}
