//Revision:# Ox0jiAKVxfkeGMgpHCc5hw== #
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


public class PAC_IAX_REA extends AccesoPL {
    static Log logger=LogFactory.getLog(PAC_IAX_REA.class);
    private Connection conn=null;

    public PAC_IAX_REA(Connection conn) {
        this.conn=conn;
    }

    //--START-PAC_IAX_REA.F_ANULA_CIA_FAC(PSFACULT,  PCESTADO,  PCCOMPANI)

    private HashMap callPAC_IAX_REA__F_ANULA_CIA_FAC(java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pCCORRED) throws Exception { //MPC POST-230 27/12/2022 Se adiciona campo CCORRED.
        String callQuery="{?=call PAC_IAX_REA.F_ANULA_CIA_FAC(?, ?, ?, ?, ?)}"; //MPC POST-230 27/12/2022 Se adiciona campo CCORRED.

        logCall(callQuery, new String[] { "pPSFACULT", "pPCESTADO", "pPCCOMPANI" }, new Object[] { pPSFACULT, pPCESTADO, pPCCOMPANI, pCCORRED}); //MPC POST-230 27/12/2022 Se adiciona campo CCORRED
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSFACULT);
        cStmt.setObject(3, pPCESTADO);
        cStmt.setObject(4, pPCCOMPANI);
        cStmt.setObject(5, pCCORRED); //MPC POST-230 27/12/2022 Se adiciona campo CCORRED
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); //MPC POST-230 27/12/2022 Se adiciona campo CCORRED // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(6)); //MPC POST-230 27/12/2022 Se adiciona campo CCORRED
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_ANULA_CIA_FAC(java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pCCORRED) throws Exception { //MPC POST-230 27/12/2022 Se adiciona campo CCORRED
        return this.callPAC_IAX_REA__F_ANULA_CIA_FAC(pPSFACULT, pPCESTADO, pPCCOMPANI, pCCORRED); //MPC 19/12/2022 Se adiciona campo CCORRED. //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_ANULA_CIA_FAC
    //--START-PAC_IAX_REA.F_DEL_AGR_CONTRATOS(PSCONTRA,  PSVERSION,  PCRAMO,  PCMODALI,  PCCOLECT,  PCTIPSEG,  PSPRODUC,  PCACTIVI,  PCGARANT)

    private HashMap callPAC_IAX_REA__F_DEL_AGR_CONTRATOS(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_AGR_CONTRATOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPSVERSION", "pPCRAMO", "pPCMODALI", "pPCCOLECT", "pPCTIPSEG", "pPSPRODUC", "pPCACTIVI", "pPCGARANT" }, new Object[] { pPSCONTRA, pPSVERSION, pPCRAMO, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPSPRODUC, pPCACTIVI, pPCGARANT });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPSVERSION);
        cStmt.setObject(4, pPCRAMO);
        cStmt.setObject(5, pPCMODALI);
        cStmt.setObject(6, pPCCOLECT);
        cStmt.setObject(7, pPCTIPSEG);
        cStmt.setObject(8, pPSPRODUC);
        cStmt.setObject(9, pPCACTIVI);
        cStmt.setObject(10, pPCGARANT);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(11));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_AGR_CONTRATOS(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_AGR_CONTRATOS(pPSCONTRA, pPSVERSION, pPCRAMO, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPSPRODUC, pPCACTIVI, pPCGARANT); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_AGR_CONTRATOS
    //--START-PAC_IAX_REA.F_DEL_CLAUSULAS_REAS(PCCODIGO,  PCIDIOMA)

    private HashMap callPAC_IAX_REA__F_DEL_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_CLAUSULAS_REAS(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCIDIOMA" }, new Object[] { pPCCODIGO, pPCIDIOMA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_CLAUSULAS_REAS(pPCCODIGO, pPCIDIOMA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_CLAUSULAS_REAS
    //--START-PAC_IAX_REA.F_DEL_CLAUSULAS_REAS_DET(PCCODIGO,  PCTRAMO)

    private HashMap callPAC_IAX_REA__F_DEL_CLAUSULAS_REAS_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTRAMO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_CLAUSULAS_REAS_DET(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCTRAMO" }, new Object[] { pPCCODIGO, pPCTRAMO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCTRAMO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_CLAUSULAS_REAS_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTRAMO) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_CLAUSULAS_REAS_DET(pPCCODIGO, pPCTRAMO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_CLAUSULAS_REAS_DET
    //--START-PAC_IAX_REA.F_DEL_COD_REPOSICION(PCCODIGO,  PCIDIOMA)

    private HashMap callPAC_IAX_REA__F_DEL_COD_REPOSICION(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_COD_REPOSICION(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCIDIOMA" }, new Object[] { pPCCODIGO, pPCIDIOMA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_COD_REPOSICION(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_COD_REPOSICION(pPCCODIGO, pPCIDIOMA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_COD_REPOSICION
    //--START-PAC_IAX_REA.F_DEL_CONTRATOSAGR(PSCONAGR,  PCIDIOMA)

    private HashMap callPAC_IAX_REA__F_DEL_CONTRATOSAGR(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_CONTRATOSAGR(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONAGR", "pPCIDIOMA" }, new Object[] { pPSCONAGR, pPCIDIOMA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONAGR);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_CONTRATOSAGR(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_CONTRATOSAGR(pPSCONAGR, pPCIDIOMA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_CONTRATOSAGR
    //--START-PAC_IAX_REA.F_DEL_OBJETOCUADROREA(PNVERSIO,  PCTRAMO,  PSCONTRA,  PCCOMPANI)

    private HashMap callPAC_IAX_REA__F_DEL_OBJETOCUADROREA(java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCCOMPANI) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_OBJETOCUADROREA(?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPNVERSIO", "pPCTRAMO", "pPSCONTRA", "pPCCOMPANI" }, new Object[] { pPNVERSIO, pPCTRAMO, pPSCONTRA, pPCCOMPANI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNVERSIO);
        cStmt.setObject(3, pPCTRAMO);
        cStmt.setObject(4, pPSCONTRA);
        cStmt.setObject(5, pPCCOMPANI);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_OBJETOCUADROREA(java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCCOMPANI) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_OBJETOCUADROREA(pPNVERSIO, pPCTRAMO, pPSCONTRA, pPCCOMPANI); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_OBJETOCUADROREA
    //--START-PAC_IAX_REA.F_DEL_OBJETOTRAMOSREA(PNVERSIO,  PCTRAMO,  PSCONTRA)

    private HashMap callPAC_IAX_REA__F_DEL_OBJETOTRAMOSREA(java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSCONTRA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_OBJETOTRAMOSREA(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPNVERSIO", "pPCTRAMO", "pPSCONTRA" }, new Object[] { pPNVERSIO, pPCTRAMO, pPSCONTRA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNVERSIO);
        cStmt.setObject(3, pPCTRAMO);
        cStmt.setObject(4, pPSCONTRA);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_OBJETOTRAMOSREA(java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSCONTRA) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_OBJETOTRAMOSREA(pPNVERSIO, pPCTRAMO, pPSCONTRA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_OBJETOTRAMOSREA
    //--START-PAC_IAX_REA.F_DEL_REAFORMULA(PSCONTRA,  PNVERSION,  PCRAMO,  PSPRODUC,  PCACTIVI,  PCGARANT,  PCCAMPO,  PCLAVE)

    private HashMap callPAC_IAX_REA__F_DEL_REAFORMULA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO, java.math.BigDecimal pPCLAVE) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_REAFORMULA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSION", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAMPO", "pPCLAVE" }, new Object[] { pPSCONTRA, pPNVERSION, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSION);
        cStmt.setObject(4, pPCRAMO);
        cStmt.setObject(5, pPSPRODUC);
        cStmt.setObject(6, pPCACTIVI);
        cStmt.setObject(7, pPCGARANT);
        cStmt.setObject(8, pPCCAMPO);
        cStmt.setObject(9, pPCLAVE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(10));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_REAFORMULA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO, java.math.BigDecimal pPCLAVE) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_REAFORMULA(pPSCONTRA, pPNVERSION, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_REAFORMULA
    //--START-PAC_IAX_REA.F_DEL_REPOSICIONES_DET(PCCODIGO,  PNORDEN)

    private HashMap callPAC_IAX_REA__F_DEL_REPOSICIONES_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPNORDEN) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_DEL_REPOSICIONES_DET(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPNORDEN" }, new Object[] { pPCCODIGO, pPNORDEN });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPNORDEN);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_DEL_REPOSICIONES_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPNORDEN) throws Exception {
        return this.callPAC_IAX_REA__F_DEL_REPOSICIONES_DET(pPCCODIGO, pPNORDEN); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_DEL_REPOSICIONES_DET
    //--START-PAC_IAX_REA.F_GET_AGR_CONTRATOS(PSCONTRA,  PSVERSION,  PCRAMO,  PCMODALI,  PCCOLECT,  PCTIPSEG,  PSPRODUC,  PCACTIVI,  PCGARANT)

    private HashMap callPAC_IAX_REA__F_GET_AGR_CONTRATOS(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_AGR_CONTRATOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPSVERSION", "pPCRAMO", "pPCMODALI", "pPCCOLECT", "pPCTIPSEG", "pPSPRODUC", "pPCACTIVI", "pPCGARANT" }, new Object[] { pPSCONTRA, pPSVERSION, pPCRAMO, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPSPRODUC, pPCACTIVI, pPCGARANT });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPSVERSION);
        cStmt.setObject(4, pPCRAMO);
        cStmt.setObject(5, pPCMODALI);
        cStmt.setObject(6, pPCCOLECT);
        cStmt.setObject(7, pPCTIPSEG);
        cStmt.setObject(8, pPSPRODUC);
        cStmt.setObject(9, pPCACTIVI);
        cStmt.setObject(10, pPCGARANT);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(11));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_AGR_CONTRATOS(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT) throws Exception {
        return this.callPAC_IAX_REA__F_GET_AGR_CONTRATOS(pPSCONTRA, pPSVERSION, pPCRAMO, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPSPRODUC, pPCACTIVI, pPCGARANT); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_AGR_CONTRATOS
    //--START-PAC_IAX_REA.F_GET_CLAUSULAS_REAS(PCCODIGO,  PCIDIOMA)

    private HashMap callPAC_IAX_REA__F_GET_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CLAUSULAS_REAS(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCIDIOMA" }, new Object[] { pPCCODIGO, pPCIDIOMA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CLAUSULAS_REAS(pPCCODIGO, pPCIDIOMA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CLAUSULAS_REAS
    //--START-PAC_IAX_REA.F_GET_CLAUSULAS_REAS_DET(PCCODIGO,  PCTRAMO)

    private HashMap callPAC_IAX_REA__F_GET_CLAUSULAS_REAS_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTRAMO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CLAUSULAS_REAS_DET(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCTRAMO" }, new Object[] { pPCCODIGO, pPCTRAMO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCTRAMO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CLAUSULAS_REAS_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTRAMO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CLAUSULAS_REAS_DET(pPCCODIGO, pPCTRAMO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CLAUSULAS_REAS_DET
    //--START-PAC_IAX_REA.F_GET_COD_CLAUSULAS_REAS(PCCODIGO,  PCTIPO)

    private HashMap callPAC_IAX_REA__F_GET_COD_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTIPO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_COD_CLAUSULAS_REAS(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCTIPO" }, new Object[] { pPCCODIGO, pPCTIPO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCTIPO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_COD_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTIPO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_COD_CLAUSULAS_REAS(pPCCODIGO, pPCTIPO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_COD_CLAUSULAS_REAS
    //--START-PAC_IAX_REA.F_GET_COD_REPOSICION(PCCODIGO)

    private HashMap callPAC_IAX_REA__F_GET_COD_REPOSICION(java.math.BigDecimal pPCCODIGO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_COD_REPOSICION(?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_COD_REPOSICION(java.math.BigDecimal pPCCODIGO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_COD_REPOSICION(pPCCODIGO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_COD_REPOSICION
     //--START-PAC_IAX_REA.F_GET_CONSULTA_CESIONES(PNPOLIZA,  PNCERTIF,  PNSINIES,  PNRECIBO,  PFEFEINI,  PFEFEFIN,  PNREEMB,  PSCUMULO)
     private HashMap callPAC_IAX_REA__F_GET_CONSULTA_CESIONES (java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNRECIBO, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN, java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPSCUMULO) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_GET_CONSULTA_CESIONES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPNRECIBO", "pPFEFEINI", "pPFEFEFIN", "pPNREEMB", "pPSCUMULO"}, new Object[] {pPNPOLIZA, pPNCERTIF, pPNSINIES, pPNRECIBO, pPFEFEINI, pPFEFEFIN, pPNREEMB, pPSCUMULO});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPNPOLIZA);
         cStmt.setObject(3, pPNCERTIF);
         cStmt.setObject(4, pPNSINIES);
         cStmt.setObject(5, pPNRECIBO);
         cStmt.setObject(6, pPFEFEINI);
         cStmt.setObject(7, pPFEFEFIN);
         cStmt.setObject(8, pPNREEMB);
         cStmt.setObject(9, pPSCUMULO);
         cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
         cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(10));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_GET_CONSULTA_CESIONES (java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNRECIBO, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN, java.math.BigDecimal pPNREEMB, java.math.BigDecimal pPSCUMULO) throws Exception {
         return this.callPAC_IAX_REA__F_GET_CONSULTA_CESIONES(pPNPOLIZA, pPNCERTIF, pPNSINIES, pPNRECIBO, pPFEFEINI, pPFEFEFIN, pPNREEMB, pPSCUMULO);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_GET_CONSULTA_CESIONES

    //--START-PAC_IAX_REA.F_GET_CONSULTA_DET_CESIONES(PSSEGURO)

    private HashMap callPAC_IAX_REA__F_GET_CONSULTA_DET_CESIONES(java.math.BigDecimal pPSSEGURO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CONSULTA_DET_CESIONES(?, ?)}";

        logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSEGURO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CONSULTA_DET_CESIONES(java.math.BigDecimal pPSSEGURO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CONSULTA_DET_CESIONES(pPSSEGURO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CONSULTA_DET_CESIONES
    //--START-PAC_IAX_REA.F_GET_CONTRATOSAGR(PSCONAGR,  PCIDIOMA,  PTCONAGR)

    private HashMap callPAC_IAX_REA__F_GET_CONTRATOSAGR(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA, String pPTCONAGR) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CONTRATOSAGR(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONAGR", "pPCIDIOMA", "pPTCONAGR" }, new Object[] { pPSCONAGR, pPCIDIOMA, pPTCONAGR });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONAGR);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.setObject(4, pPTCONAGR);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CONTRATOSAGR(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA, String pPTCONAGR) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CONTRATOSAGR(pPSCONAGR, pPCIDIOMA, pPTCONAGR); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CONTRATOSAGR
    //--START-PAC_IAX_REA.F_GET_CONTRATOSVERS_REA(PSCONTRA)

    private HashMap callPAC_IAX_REA__F_GET_CONTRATOSVERS_REA(java.math.BigDecimal pPSCONTRA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CONTRATOSVERS_REA(?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA" }, new Object[] { pPSCONTRA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTRATO_REA".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CONTRATOSVERS_REA(java.math.BigDecimal pPSCONTRA) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CONTRATOSVERS_REA(pPSCONTRA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CONTRATOSVERS_REA
    //--START-PAC_IAX_REA.F_GET_CONTRATOS_REA(PSCONTRA,  PCEMPRES,  PCRAMO,  PCMODALI,  PCTIPSEG,  PCCOLECT,  PCACTIVI,  PCGARANT,  PCTIPREA,  PSCONAGR,  PCCOMPANI)

    private HashMap callPAC_IAX_REA__F_GET_CONTRATOS_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCTIPREA, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCCOMPANI) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CONTRATOS_REA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPCEMPRES", "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPCACTIVI", "pPCGARANT", "pPCTIPREA", "pPSCONAGR", "pPCCOMPANI" }, new Object[] { pPSCONTRA, pPCEMPRES, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCTIPREA, pPSCONAGR, pPCCOMPANI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPCEMPRES);
        cStmt.setObject(4, pPCRAMO);
        cStmt.setObject(5, pPCMODALI);
        cStmt.setObject(6, pPCTIPSEG);
        cStmt.setObject(7, pPCCOLECT);
        cStmt.setObject(8, pPCACTIVI);
        cStmt.setObject(9, pPCGARANT);
        cStmt.setObject(10, pPCTIPREA);
        cStmt.setObject(11, pPSCONAGR);
        cStmt.setObject(12, pPCCOMPANI);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(13));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CONTRATOS_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCTIPREA, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCCOMPANI) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CONTRATOS_REA(pPSCONTRA, pPCEMPRES, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCTIPREA, pPSCONAGR, pPCCOMPANI); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CONTRATOS_REA
     //--START-PAC_IAX_REA.F_GET_CONTRATOS_REA_PROD(PSCONTRA,  PCEMPRES,  PSPRODUC,  PCACTIVI,  PCGARANT,  PCTIPREA,  PSCONAGR,  PCCOMPANI,  PCDEVENTO)
     private HashMap callPAC_IAX_REA__F_GET_CONTRATOS_REA_PROD (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCTIPREA, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCDEVENTO) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_GET_CONTRATOS_REA_PROD(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPSCONTRA", "pPCEMPRES", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCTIPREA", "pPSCONAGR", "pPCCOMPANI", "pPCDEVENTO"}, new Object[] {pPSCONTRA, pPCEMPRES, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCTIPREA, pPSCONAGR, pPCCOMPANI, pPCDEVENTO});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSCONTRA);
         cStmt.setObject(3, pPCEMPRES);
         cStmt.setObject(4, pPSPRODUC);
         cStmt.setObject(5, pPCACTIVI);
         cStmt.setObject(6, pPCGARANT);
         cStmt.setObject(7, pPCTIPREA);
         cStmt.setObject(8, pPSCONAGR);
         cStmt.setObject(9, pPCCOMPANI);
         cStmt.setObject(10, pPCDEVENTO);
         cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
         cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(11));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_GET_CONTRATOS_REA_PROD (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCTIPREA, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPCDEVENTO) throws Exception {
         return this.callPAC_IAX_REA__F_GET_CONTRATOS_REA_PROD(pPSCONTRA, pPCEMPRES, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCTIPREA, pPSCONAGR, pPCCOMPANI, pPCDEVENTO);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_GET_CONTRATOS_REA_PROD

    //--START-PAC_IAX_REA.F_GET_CUACESFAC_DET_REA(PSFACULT,  PCCOMPANI)

    private HashMap callPAC_IAX_REA__F_GET_CUACESFAC_DET_REA(java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pCCORRED) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED.
        String callQuery="{?=call PAC_IAX_REA.F_GET_CUACESFAC_DET_REA(?, ?, ?, ?)}"; //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED.

        logCall(callQuery, new String[] { "pPSFACULT", "pPCCOMPANI" }, new Object[] { pPSFACULT, pPCCOMPANI }); //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED.
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSFACULT);
        cStmt.setObject(3, pPCCOMPANI);
        cStmt.setObject(4, pCCORRED); //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED.
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CUACESFAC".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED. // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5)); //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED.
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CUACESFAC_DET_REA(java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pCCORRED) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED.
        return this.callPAC_IAX_REA__F_GET_CUACESFAC_DET_REA(pPSFACULT, pPCCOMPANI, pCCORRED); //POST-230 MPC 27/12/2022 Se adiciona campo CCORRED. //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CUACESFAC_DET_REA
    //--START-PAC_IAX_REA.F_GET_CUACESFAC_REA(PSFACULT)

    private HashMap callPAC_IAX_REA__F_GET_CUACESFAC_REA(java.math.BigDecimal pPSFACULT) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CUACESFAC_REA(?, ?)}";

        logCall(callQuery, new String[] { "pPSFACULT" }, new Object[] { pPSFACULT });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSFACULT);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CUACESFAC_REA(java.math.BigDecimal pPSFACULT) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CUACESFAC_REA(pPSFACULT); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CUACESFAC_REA
    //--START-PAC_IAX_REA.F_GET_CUADROCES_REA(PSCONTRA,  PNVERSIO,  PCTRAMO)

    private HashMap callPAC_IAX_REA__F_GET_CUADROCES_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CUADROCES_REA(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO", "pPCTRAMO" }, new Object[] { pPSCONTRA, pPNVERSIO, pPCTRAMO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.setObject(4, pPCTRAMO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_CUADROCES_REA".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CUADROCES_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CUADROCES_REA(pPSCONTRA, pPNVERSIO, pPCTRAMO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CUADROCES_REA
    //--START-PAC_IAX_REA.F_GET_CUAFACUL_DET_REA(PSFACULT,  PSSEGURO)

    private HashMap callPAC_IAX_REA__F_GET_CUAFACUL_DET_REA(java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPSSEGURO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CUAFACUL_DET_REA(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSFACULT", "pPSSEGURO" }, new Object[] { pPSFACULT, pPSSEGURO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSFACULT);
        cStmt.setObject(3, pPSSEGURO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CUAFACUL".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CUAFACUL_DET_REA(java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPSSEGURO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CUAFACUL_DET_REA(pPSFACULT, pPSSEGURO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CUAFACUL_DET_REA
    //--START-PAC_IAX_REA.F_GET_CUAFACUL_REA(PTEMPRES,  PTRAMO,  PTSPRODUC,  PNPOLIZA,  PNCERTIF,  PSFACULT,  TCESTADO,  PFEFEINI,  PFEFEFIN,  PSCUMULO,  PNSOLICI)

    private HashMap callPAC_IAX_REA__F_GET_CUAFACUL_REA(java.math.BigDecimal pPTEMPRES, java.math.BigDecimal pPTRAMO, java.math.BigDecimal pPTSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSFACULT, java.math.BigDecimal pTCESTADO, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN, java.math.BigDecimal pPSCUMULO, java.math.BigDecimal pPNSOLICI) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_CUAFACUL_REA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPTEMPRES", "pPTRAMO", "pPTSPRODUC", "pPNPOLIZA", "pPNCERTIF", "pPSFACULT", "pTCESTADO", "pPFEFEINI", "pPFEFEFIN", "pPSCUMULO", "pPNSOLICI" }, new Object[] { pPTEMPRES, pPTRAMO, pPTSPRODUC, pPNPOLIZA, pPNCERTIF, pPSFACULT, pTCESTADO, pPFEFEINI, pPFEFEFIN, pPSCUMULO, pPNSOLICI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPTEMPRES);
        cStmt.setObject(3, pPTRAMO);
        cStmt.setObject(4, pPTSPRODUC);
        cStmt.setObject(5, pPNPOLIZA);
        cStmt.setObject(6, pPNCERTIF);
        cStmt.setObject(7, pPSFACULT);
        cStmt.setObject(8, pTCESTADO);
        cStmt.setObject(9, pPFEFEINI);
        cStmt.setObject(10, pPFEFEFIN);
        cStmt.setObject(11, pPSCUMULO);
        cStmt.setObject(12, pPNSOLICI);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(13));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_CUAFACUL_REA(java.math.BigDecimal pPTEMPRES, java.math.BigDecimal pPTRAMO, java.math.BigDecimal pPTSPRODUC, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPSFACULT, java.math.BigDecimal pTCESTADO, java.sql.Date pPFEFEINI, java.sql.Date pPFEFEFIN, java.math.BigDecimal pPSCUMULO, java.math.BigDecimal pPNSOLICI) throws Exception {
        return this.callPAC_IAX_REA__F_GET_CUAFACUL_REA(pPTEMPRES, pPTRAMO, pPTSPRODUC, pPNPOLIZA, pPNCERTIF, pPSFACULT, pTCESTADO, pPFEFEINI, pPFEFEFIN, pPSCUMULO, pPNSOLICI); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_CUAFACUL_REA

    //--START-PAC_IAX_REA.F_GET_DATOSRECIBO_CES(PSREAEMI)

    private HashMap callPAC_IAX_REA__F_GET_DATOSRECIBO_CES(java.math.BigDecimal pPSREAEMI) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_DATOSRECIBO_CES(?, ?)}";

        logCall(callQuery, new String[] { "pPSREAEMI" }, new Object[] { pPSREAEMI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSREAEMI);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_DATOSRECIBO_CES(java.math.BigDecimal pPSREAEMI) throws Exception {
        return this.callPAC_IAX_REA__F_GET_DATOSRECIBO_CES(pPSREAEMI); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_DATOSRECIBO_CES
    //--START-PAC_IAX_REA.F_GET_DETALLECAB_REA(PSCONTRA,  PNVERSIO)

    private HashMap callPAC_IAX_REA__F_GET_DETALLECAB_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_DETALLECAB_REA(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO" }, new Object[] { pPSCONTRA, pPNVERSIO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CODICONTRATO_REA".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_DETALLECAB_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_DETALLECAB_REA(pPSCONTRA, pPNVERSIO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_DETALLECAB_REA
    //--START-PAC_IAX_REA.F_GET_DETALLE_REA(PSCONTRA,  PNVERSIO)

    private HashMap callPAC_IAX_REA__F_GET_DETALLE_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_DETALLE_REA(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO" }, new Object[] { pPSCONTRA, pPNVERSIO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CONTRATO_REA".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_DETALLE_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_DETALLE_REA(pPSCONTRA, pPNVERSIO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_DETALLE_REA
    //--START-PAC_IAX_REA.F_GET_DETCUADRO_REA(PSCONTRA,  PNVERSIO,  PCTRAMO,  PCCOMPANI)

    private HashMap callPAC_IAX_REA__F_GET_DETCUADRO_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCCOMPANI) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_DETCUADRO_REA(?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPCCOMPANI" }, new Object[] { pPSCONTRA, pPNVERSIO, pPCTRAMO, pPCCOMPANI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.setObject(4, pPCTRAMO);
        cStmt.setObject(5, pPCCOMPANI);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CUADROCES_REA".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_DETCUADRO_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCCOMPANI) throws Exception {
        return this.callPAC_IAX_REA__F_GET_DETCUADRO_REA(pPSCONTRA, pPNVERSIO, pPCTRAMO, pPCCOMPANI); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_DETCUADRO_REA
    //--START-PAC_IAX_REA.F_GET_DETTRAMO_REA(PSCONTRA,  PNVERSIO,  PCTRAMO)

    private HashMap callPAC_IAX_REA__F_GET_DETTRAMO_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_DETTRAMO_REA(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO", "pPCTRAMO" }, new Object[] { pPSCONTRA, pPNVERSIO, pPCTRAMO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.setObject(4, pPCTRAMO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_TRAMOS_REA".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_DETTRAMO_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_DETTRAMO_REA(pPSCONTRA, pPNVERSIO, pPCTRAMO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_DETTRAMO_REA
    //--START-PAC_IAX_REA.F_GET_NVERSIO(PSCONTRA)

    private HashMap callPAC_IAX_REA__F_GET_NVERSIO(java.math.BigDecimal pPSCONTRA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_NVERSIO(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA" }, new Object[] { pPSCONTRA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNVERSIO_DATOS"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("PNVERSIO_DATOS", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("PNVERSIO_DATOS", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_NVERSIO(java.math.BigDecimal pPSCONTRA) throws Exception {
        return this.callPAC_IAX_REA__F_GET_NVERSIO(pPSCONTRA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_NVERSIO
    //--START-PAC_IAX_REA.F_GET_OBJETO_CLAUSULAS_REAS(PCCODIGO)

    private HashMap callPAC_IAX_REA__F_GET_OBJETO_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_OBJETO_CLAUSULAS_REAS(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CLAUSULAS_REAS".toUpperCase())); // Valor de "POBJ_CLAUSULAS_REAS"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("POBJ_CLAUSULAS_REAS", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("POBJ_CLAUSULAS_REAS", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_OBJETO_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_OBJETO_CLAUSULAS_REAS(pPCCODIGO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_OBJETO_CLAUSULAS_REAS
     //--START-PAC_IAX_REA.F_GET_OBJETO_REPOSICION(PCCODIGO,  FILTRO_NORDEN)
         private HashMap callPAC_IAX_REA__F_GET_OBJETO_REPOSICION (java.math.BigDecimal pPCCODIGO, String pFILTRO_NORDEN) throws Exception {
             String callQuery="{?=call PAC_IAX_REA.F_GET_OBJETO_REPOSICION(?, ?, ?, ?)}";
             
             logCall(callQuery, new String[] {"pPCCODIGO", "pFILTRO_NORDEN"}, new Object[] {pPCCODIGO, pFILTRO_NORDEN});
             CallableStatement cStmt=conn.prepareCall(callQuery);
             String USERNAME=conn.getMetaData().getUserName().toUpperCase();
             cStmt.setObject(2, pPCCODIGO);
             cStmt.setObject(5, pFILTRO_NORDEN);
             cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
             cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_REPOSICION".toUpperCase())); // Valor de "POBJ_REPOSICION"
             cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
             cStmt.execute();
             HashMap retVal=new HashMap();
             try {
                 retVal.put("RETURN", cStmt.getObject(1));
             }
             catch (SQLException e) {
                 retVal.put("RETURN", null);
             }
             try {
                 retVal.put("POBJ_REPOSICION", cStmt.getObject(3));
             }
             catch (SQLException e) {
                 retVal.put("POBJ_REPOSICION", null);
             }
             try {
                 retVal.put("MENSAJES", cStmt.getObject(4));
             }
             catch (SQLException e) {
                 retVal.put("MENSAJES", null);
             }
             retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
             cStmt.close();//AXIS-WLS1SERVER-Ready
             
             return retVal;
         }

         public HashMap ejecutaPAC_IAX_REA__F_GET_OBJETO_REPOSICION (java.math.BigDecimal pPCCODIGO, String pFILTRO_NORDEN) throws Exception {
             return this.callPAC_IAX_REA__F_GET_OBJETO_REPOSICION(pPCCODIGO, pFILTRO_NORDEN);//AXIS-WLS1SERVER-Ready 
         }
         //--END-PAC_IAX_REA.F_GET_OBJETO_REPOSICION

    //--START-PAC_IAX_REA.F_GET_OBJETO_TRAMOS()

    private HashMap callPAC_IAX_REA__F_GET_OBJETO_TRAMOS() throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_OBJETO_TRAMOS(?, ?)}";

        logCall(callQuery, new String[] { }, new Object[] { });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_TRAMOS_REA".toUpperCase())); // Valor de "PTRAMOSREA"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("PTRAMOSREA", cStmt.getObject(2));
        }
        catch (SQLException e) {
            retVal.put("PTRAMOSREA", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_OBJETO_TRAMOS() throws Exception {
        return this.callPAC_IAX_REA__F_GET_OBJETO_TRAMOS(); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_OBJETO_TRAMOS
    //--START-PAC_IAX_REA.F_GET_REAFORMULA(PSCONTRA,  PNVERSION,  PCRAMO,  PSPRODUC,  PCACTIVI,  PCGARANT,  PCCAMPO,  PCLAVE)

    private HashMap callPAC_IAX_REA__F_GET_REAFORMULA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO, java.math.BigDecimal pPCLAVE) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_REAFORMULA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSION", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAMPO", "pPCLAVE" }, new Object[] { pPSCONTRA, pPNVERSION, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSION);
        cStmt.setObject(4, pPCRAMO);
        cStmt.setObject(5, pPSPRODUC);
        cStmt.setObject(6, pPCACTIVI);
        cStmt.setObject(7, pPCGARANT);
        cStmt.setObject(8, pPCCAMPO);
        cStmt.setObject(9, pPCLAVE);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(10));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_REAFORMULA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO, java.math.BigDecimal pPCLAVE) throws Exception {
        return this.callPAC_IAX_REA__F_GET_REAFORMULA(pPSCONTRA, pPNVERSION, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_REAFORMULA
    //--START-PAC_IAX_REA.F_GET_REARIESGOS(PSCUMULO)

    private HashMap callPAC_IAX_REA__F_GET_REARIESGOS(java.math.BigDecimal pPSCUMULO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_REARIESGOS(?, ?)}";

        logCall(callQuery, new String[] { "pPSCUMULO" }, new Object[] { pPSCUMULO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCUMULO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_REARIESGOS(java.math.BigDecimal pPSCUMULO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_REARIESGOS(pPSCUMULO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_REARIESGOS
    //--START-PAC_IAX_REA.F_GET_RECIBOS_CES(PSSEGURO,  PNMOVIMI)

    private HashMap callPAC_IAX_REA__F_GET_RECIBOS_CES(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_RECIBOS_CES(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSSEGURO", "pPNMOVIMI" }, new Object[] { pPSSEGURO, pPNMOVIMI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSEGURO);
        cStmt.setObject(3, pPNMOVIMI);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_RECIBOS_CES(java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI) throws Exception {
        return this.callPAC_IAX_REA__F_GET_RECIBOS_CES(pPSSEGURO, pPNMOVIMI); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_RECIBOS_CES
    //--START-PAC_IAX_REA.F_GET_REPOSICIONES(PCCODIGO,  PCIDIOMA)

    private HashMap callPAC_IAX_REA__F_GET_REPOSICIONES(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_REPOSICIONES(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCIDIOMA" }, new Object[] { pPCCODIGO, pPCIDIOMA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_REPOSICIONES(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA) throws Exception {
        return this.callPAC_IAX_REA__F_GET_REPOSICIONES(pPCCODIGO, pPCIDIOMA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_REPOSICIONES
    //--START-PAC_IAX_REA.F_GET_REPOSICIONES_DET(PCCODIGO,  PNORDEN)

    private HashMap callPAC_IAX_REA__F_GET_REPOSICIONES_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPNORDEN) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_REPOSICIONES_DET(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPNORDEN" }, new Object[] { pPCCODIGO, pPNORDEN });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPNORDEN);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_REPOSICIONES_DET(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPNORDEN) throws Exception {
        return this.callPAC_IAX_REA__F_GET_REPOSICIONES_DET(pPCCODIGO, pPNORDEN); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_REPOSICIONES_DET
    //--START-PAC_IAX_REA.F_GET_SCONAGR_NEXT()

    private HashMap callPAC_IAX_REA__F_GET_SCONAGR_NEXT() throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_SCONAGR_NEXT(?, ?)}";

        logCall(callQuery, new String[] { }, new Object[] { });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(2, java.sql.Types.NUMERIC); // Valor de "PSMAXCONAGR"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("PSMAXCONAGR", cStmt.getObject(2));
        }
        catch (SQLException e) {
            retVal.put("PSMAXCONAGR", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_SCONAGR_NEXT() throws Exception {
        return this.callPAC_IAX_REA__F_GET_SCONAGR_NEXT(); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_SCONAGR_NEXT
    //--START-PAC_IAX_REA.F_GET_TRAMOS_REA(PSCONTRA,  PNVERSIO)

    private HashMap callPAC_IAX_REA__F_GET_TRAMOS_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_TRAMOS_REA(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO" }, new Object[] { pPSCONTRA, pPNVERSIO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_TRAMOS_REA".toUpperCase())); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_TRAMOS_REA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        return this.callPAC_IAX_REA__F_GET_TRAMOS_REA(pPSCONTRA, pPNVERSIO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_TRAMOS_REA
    //--START-PAC_IAX_REA.F_GET_VERSION_REA(PSCONTRA)

    private HashMap callPAC_IAX_REA__F_GET_VERSION_REA(java.math.BigDecimal pPSCONTRA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_VERSION_REA(?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA" }, new Object[] { pPSCONTRA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_GET_VERSION_REA(java.math.BigDecimal pPSCONTRA) throws Exception {
        return this.callPAC_IAX_REA__F_GET_VERSION_REA(pPSCONTRA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_GET_VERSION_REA
    //--START-PAC_IAX_REA.F_INI_OBJ_TRAMOS()

    private HashMap callPAC_IAX_REA__F_INI_OBJ_TRAMOS() throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_INI_OBJ_TRAMOS(?)}";

        logCall(callQuery, new String[] { }, new Object[] { });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(2));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_INI_OBJ_TRAMOS() throws Exception {
        return this.callPAC_IAX_REA__F_INI_OBJ_TRAMOS(); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_INI_OBJ_TRAMOS
    //--START-PAC_IAX_REA.F_SET_AGRUPCONTRATO(PSCONAGR)

    private HashMap callPAC_IAX_REA__F_SET_AGRUPCONTRATO(java.math.BigDecimal pPSCONAGR) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_AGRUPCONTRATO(?, ?)}";

        logCall(callQuery, new String[] { "pPSCONAGR" }, new Object[] { pPSCONAGR });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONAGR);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_AGRUPCONTRATO(java.math.BigDecimal pPSCONAGR) throws Exception {
        return this.callPAC_IAX_REA__F_SET_AGRUPCONTRATO(pPSCONAGR); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_AGRUPCONTRATO
     //--START-PAC_IAX_REA.F_SET_AGR_CONTRATOS(PSCONTRA,  PSVERSION,  PCRAMO,  PCMODALI,  PCCOLECT,  PCTIPSEG,  PSPRODUC,  PCACTIVI,  PCGARANT,  PILIMSUB)
     private HashMap callPAC_IAX_REA__F_SET_AGR_CONTRATOS (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPILIMSUB) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_SET_AGR_CONTRATOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPSCONTRA", "pPSVERSION", "pPCRAMO", "pPCMODALI", "pPCCOLECT", "pPCTIPSEG", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPILIMSUB"}, new Object[] {pPSCONTRA, pPSVERSION, pPCRAMO, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPSPRODUC, pPCACTIVI, pPCGARANT, pPILIMSUB});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSCONTRA);
         cStmt.setObject(3, pPSVERSION);
         cStmt.setObject(4, pPCRAMO);
         cStmt.setObject(5, pPCMODALI);
         cStmt.setObject(6, pPCCOLECT);
         cStmt.setObject(7, pPCTIPSEG);
         cStmt.setObject(8, pPSPRODUC);
         cStmt.setObject(9, pPCACTIVI);
         cStmt.setObject(10, pPCGARANT);
         cStmt.setObject(11, pPILIMSUB);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(12, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(12));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_SET_AGR_CONTRATOS (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPILIMSUB) throws Exception {
         return this.callPAC_IAX_REA__F_SET_AGR_CONTRATOS(pPSCONTRA, pPSVERSION, pPCRAMO, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPSPRODUC, pPCACTIVI, pPCGARANT, pPILIMSUB);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_SET_AGR_CONTRATOS

    //--START-PAC_IAX_REA.F_SET_CLAUSULAS_REAS(PCCODIGO,  PCIDIOMA,  PTDESCRIPCION)

    private HashMap callPAC_IAX_REA__F_SET_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA, String pPTDESCRIPCION) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_CLAUSULAS_REAS(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCIDIOMA", "pPTDESCRIPCION" }, new Object[] { pPCCODIGO, pPCIDIOMA, pPTDESCRIPCION });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.setObject(4, pPTDESCRIPCION);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_CLAUSULAS_REAS(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA, String pPTDESCRIPCION) throws Exception {
        return this.callPAC_IAX_REA__F_SET_CLAUSULAS_REAS(pPCCODIGO, pPCIDIOMA, pPTDESCRIPCION); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_CLAUSULAS_REAS
    //--START-PAC_IAX_REA.F_SET_CLAUSULAS_REAS_DET(PCMODO,  PCCODIGO,  PCTRAMO,  PLIM_INF,  PLIM_SUP,  PPCTPART,  PPCTMIN,  PPCTMAX)

    private HashMap callPAC_IAX_REA__F_SET_CLAUSULAS_REAS_DET(java.math.BigDecimal pPCMODO, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPLIM_INF, java.math.BigDecimal pPLIM_SUP, java.math.BigDecimal pPPCTPART, java.math.BigDecimal pPPCTMIN, java.math.BigDecimal pPPCTMAX) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_CLAUSULAS_REAS_DET(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCMODO", "pPCCODIGO", "pPCTRAMO", "pPLIM_INF", "pPLIM_SUP", "pPPCTPART", "pPPCTMIN", "pPPCTMAX" }, new Object[] { pPCMODO, pPCCODIGO, pPCTRAMO, pPLIM_INF, pPLIM_SUP, pPPCTPART, pPPCTMIN, pPPCTMAX });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCMODO);
        cStmt.setObject(3, pPCCODIGO);
        cStmt.setObject(4, pPCTRAMO);
        cStmt.setObject(5, pPLIM_INF);
        cStmt.setObject(6, pPLIM_SUP);
        cStmt.setObject(7, pPPCTPART);
        cStmt.setObject(8, pPPCTMIN);
        cStmt.setObject(9, pPPCTMAX);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(10));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_CLAUSULAS_REAS_DET(java.math.BigDecimal pPCMODO, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPLIM_INF, java.math.BigDecimal pPLIM_SUP, java.math.BigDecimal pPPCTPART, java.math.BigDecimal pPPCTMIN, java.math.BigDecimal pPPCTMAX) throws Exception {
        return this.callPAC_IAX_REA__F_SET_CLAUSULAS_REAS_DET(pPCMODO, pPCCODIGO, pPCTRAMO, pPLIM_INF, pPLIM_SUP, pPPCTPART, pPPCTMIN, pPPCTMAX); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_CLAUSULAS_REAS_DET
     //--START-PAC_IAX_REA.F_SET_CODICONTRATOS(PSCONTRA,  PSPLENO,  PCEMPRES,  PCTIPREA,  PFINICTR,  PCRAMO,  PCACTIVI,  PCMODALI,  PCCOLECT,  PCTIPSEG,  PCGARANT,  PFFINCTR,  PNCONREL,  PSCONAGR,  PCVIDAGA,  PCVIDAIR,  PCTIPCUM,  PCVALID,  PCMONEDA,  PTDESCRIPCION,  PCDEVENTO)
    // -- INI - AXIS 4853 - 26/07/2019 - AABG - SE AGREGA ATRIBUTO PNVERSIO PARA AGR_CONTRATOS
     private HashMap callPAC_IAX_REA__F_SET_CODICONTRATOS (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSPLENO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPREA, java.sql.Date pPFINICTR, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCGARANT, java.sql.Date pPFFINCTR, java.math.BigDecimal pPNCONREL, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCVIDAGA, java.math.BigDecimal pPCVIDAIR, java.math.BigDecimal pPCTIPCUM, java.math.BigDecimal pPCVALID, String pPCMONEDA, String pPTDESCRIPCION, String pPCDEVENTO, java.math.BigDecimal pNVERSIO) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_SET_CODICONTRATOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPSCONTRA", "pPSPLENO", "pPCEMPRES", "pPCTIPREA", "pPFINICTR", "pPCRAMO", "pPCACTIVI", "pPCMODALI", "pPCCOLECT", "pPCTIPSEG", "pPCGARANT", "pPFFINCTR", "pPNCONREL", "pPSCONAGR", "pPCVIDAGA", "pPCVIDAIR", "pPCTIPCUM", "pPCVALID", "pPCMONEDA", "pPTDESCRIPCION", "pPCDEVENTO", "pNVERSIO"}, new Object[] {pPSCONTRA, pPSPLENO, pPCEMPRES, pPCTIPREA, pPFINICTR, pPCRAMO, pPCACTIVI, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPCGARANT, pPFFINCTR, pPNCONREL, pPSCONAGR, pPCVIDAGA, pPCVIDAIR, pPCTIPCUM, pPCVALID, pPCMONEDA, pPTDESCRIPCION, pPCDEVENTO, pNVERSIO});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSCONTRA);
         cStmt.setObject(3, pPSPLENO);
         cStmt.setObject(4, pPCEMPRES);
         cStmt.setObject(5, pPCTIPREA);
         cStmt.setObject(6, pPFINICTR);
         cStmt.setObject(7, pPCRAMO);
         cStmt.setObject(8, pPCACTIVI);
         cStmt.setObject(9, pPCMODALI);
         cStmt.setObject(10, pPCCOLECT);
         cStmt.setObject(11, pPCTIPSEG);
         cStmt.setObject(12, pPCGARANT);
         cStmt.setObject(13, pPFFINCTR);
         cStmt.setObject(14, pPNCONREL);
         cStmt.setObject(15, pPSCONAGR);
         cStmt.setObject(16, pPCVIDAGA);
         cStmt.setObject(17, pPCVIDAIR);
         cStmt.setObject(18, pPCTIPCUM);
         cStmt.setObject(19, pPCVALID);
         cStmt.setObject(20, pPCMONEDA);
         cStmt.setObject(21, pPTDESCRIPCION);
         cStmt.setObject(22, pPCDEVENTO);
         cStmt.setObject(23, pNVERSIO);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(24, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(24));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }
  // -- FIN - AXIS 4853 - 26/07/2019 - AABG - SE AGREGA ATRIBUTO PNVERSIO PARA AGR_CONTRATOS

     // -- INI - AXIS 4853 - 26/07/2019 - AABG - SE AGREGA ATRIBUTO PNVERSIO PARA AGR_CONTRATOS
     public HashMap ejecutaPAC_IAX_REA__F_SET_CODICONTRATOS (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSPLENO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPREA, java.sql.Date pPFINICTR, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCGARANT, java.sql.Date pPFFINCTR, java.math.BigDecimal pPNCONREL, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCVIDAGA, java.math.BigDecimal pPCVIDAIR, java.math.BigDecimal pPCTIPCUM, java.math.BigDecimal pPCVALID, String pPCMONEDA, String pPTDESCRIPCION, String pPCDEVENTO, java.math.BigDecimal pNVERSIO) throws Exception {
         return this.callPAC_IAX_REA__F_SET_CODICONTRATOS(pPSCONTRA, pPSPLENO, pPCEMPRES, pPCTIPREA, pPFINICTR, pPCRAMO, pPCACTIVI, pPCMODALI, pPCCOLECT, pPCTIPSEG, pPCGARANT, pPFFINCTR, pPNCONREL, pPSCONAGR, pPCVIDAGA, pPCVIDAIR, pPCTIPCUM, pPCVALID, pPCMONEDA, pPTDESCRIPCION, pPCDEVENTO, pNVERSIO);//AXIS-WLS1SERVER-Ready 
     }
  // -- FIN - AXIS 4853 - 26/07/2019 - AABG - SE AGREGA ATRIBUTO PNVERSIO PARA AGR_CONTRATOS
     //--END-PAC_IAX_REA.F_SET_CODICONTRATOS

    //--START-PAC_IAX_REA.F_SET_COD_CLAUSULAS_REAS(PCMODO,  PCCODIGO,  PCTIPO,  PFEFECTO,  PFVENCIM)

    private HashMap callPAC_IAX_REA__F_SET_COD_CLAUSULAS_REAS(java.math.BigDecimal pPCMODO, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTIPO, java.sql.Date pPFEFECTO, java.sql.Date pPFVENCIM) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_COD_CLAUSULAS_REAS(?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCMODO", "pPCCODIGO", "pPCTIPO", "pPFEFECTO", "pPFVENCIM" }, new Object[] { pPCMODO, pPCCODIGO, pPCTIPO, pPFEFECTO, pPFVENCIM });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCMODO);
        cStmt.setObject(3, pPCCODIGO);
        cStmt.setObject(4, pPCTIPO);
        cStmt.setObject(5, pPFEFECTO);
        cStmt.setObject(6, pPFVENCIM);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_COD_CLAUSULAS_REAS(java.math.BigDecimal pPCMODO, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCTIPO, java.sql.Date pPFEFECTO, java.sql.Date pPFVENCIM) throws Exception {
        return this.callPAC_IAX_REA__F_SET_COD_CLAUSULAS_REAS(pPCMODO, pPCCODIGO, pPCTIPO, pPFEFECTO, pPFVENCIM); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_COD_CLAUSULAS_REAS
    //--START-PAC_IAX_REA.F_SET_COD_REPOSICION(PCCODIGO)

    private HashMap callPAC_IAX_REA__F_SET_COD_REPOSICION(java.math.BigDecimal pPCCODIGO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_COD_REPOSICION(?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO" }, new Object[] { pPCCODIGO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_COD_REPOSICION(java.math.BigDecimal pPCCODIGO) throws Exception {
        return this.callPAC_IAX_REA__F_SET_COD_REPOSICION(pPCCODIGO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_COD_REPOSICION
    //--START-PAC_IAX_REA.F_SET_CONTRATOS(PSCONTRA,  PNVERSIO,  PNPRIORI,  PFCONINI,  PNCONREL,  PFCONFIN,  PIAUTORI,  PIRETENC,  PIMINCES,  PICAPACI,  PIPRIOXL,  PPPRIOSL,  PTCONTRA,  PTOBSERV,  PPCEDIDO,  PPRIESGOS,  PPDESCUENTO,  PPGASTOS,  PPPARTBENE,  PCREAFAC,  PPCESEXT,  PCGARREL,  PCFRECUL,  PSCONQP,  PNVERQP,  PIAGREGA,  PIMAXAGR,  PCLAVECBR,  PCERCARTERA,  PIPRIMAESPERADAS,  PNANYOSLOSS,  PCBASEXL,  PCLOSSCORRIDOR,  PCCAPPEDRATIO,  PSCONTRAPROT,  PCESTADO,  PNVERSIOPROT)

    private HashMap callPAC_IAX_REA__F_SET_CONTRATOS(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPNPRIORI, java.sql.Date pPFCONINI, java.math.BigDecimal pPNCONREL, java.sql.Date pPFCONFIN, java.math.BigDecimal pPIAUTORI, java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIMINCES, java.math.BigDecimal pPICAPACI, java.math.BigDecimal pPIPRIOXL, java.math.BigDecimal pPPPRIOSL, String pPTCONTRA, String pPTOBSERV, java.math.BigDecimal pPPCEDIDO, java.math.BigDecimal pPPRIESGOS, java.math.BigDecimal pPPDESCUENTO, java.math.BigDecimal pPPGASTOS, java.math.BigDecimal pPPPARTBENE, java.math.BigDecimal pPCREAFAC, java.math.BigDecimal pPPCESEXT, java.math.BigDecimal pPCGARREL, java.math.BigDecimal pPCFRECUL, java.math.BigDecimal pPSCONQP, java.math.BigDecimal pPNVERQP, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, java.math.BigDecimal pPCLAVECBR, java.math.BigDecimal pPCERCARTERA, java.math.BigDecimal pPIPRIMAESPERADAS, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCBASEXL, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPSCONTRAPROT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNVERSIOPROT) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_CONTRATOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO", "pPNPRIORI", "pPFCONINI", "pPNCONREL", "pPFCONFIN", "pPIAUTORI", "pPIRETENC", "pPIMINCES", "pPICAPACI", "pPIPRIOXL", "pPPPRIOSL", "pPTCONTRA", "pPTOBSERV", "pPPCEDIDO", "pPPRIESGOS", "pPPDESCUENTO", "pPPGASTOS", "pPPPARTBENE", "pPCREAFAC", "pPPCESEXT", "pPCGARREL", "pPCFRECUL", "pPSCONQP", "pPNVERQP", "pPIAGREGA", "pPIMAXAGR", "pPCLAVECBR", "pPCERCARTERA", "pPIPRIMAESPERADAS", "pPNANYOSLOSS", "pPCBASEXL", "pPCLOSSCORRIDOR", "pPCCAPPEDRATIO", "pPSCONTRAPROT", "pPCESTADO", "pPNVERSIOPROT" }, new Object[] { pPSCONTRA, pPNVERSIO, pPNPRIORI, pPFCONINI, pPNCONREL, pPFCONFIN, pPIAUTORI, pPIRETENC, pPIMINCES, pPICAPACI, pPIPRIOXL, pPPPRIOSL, pPTCONTRA, pPTOBSERV, pPPCEDIDO, pPPRIESGOS, pPPDESCUENTO, pPPGASTOS, pPPPARTBENE, pPCREAFAC, pPPCESEXT, pPCGARREL, pPCFRECUL, pPSCONQP, pPNVERQP, pPIAGREGA, pPIMAXAGR, pPCLAVECBR, pPCERCARTERA, pPIPRIMAESPERADAS, pPNANYOSLOSS, pPCBASEXL, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPSCONTRAPROT, pPCESTADO, pPNVERSIOPROT });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.setObject(4, pPNPRIORI);
        cStmt.setObject(5, pPFCONINI);
        cStmt.setObject(6, pPNCONREL);
        cStmt.setObject(7, pPFCONFIN);
        cStmt.setObject(8, pPIAUTORI);
        cStmt.setObject(9, pPIRETENC);
        cStmt.setObject(10, pPIMINCES);
        cStmt.setObject(11, pPICAPACI);
        cStmt.setObject(12, pPIPRIOXL);
        cStmt.setObject(13, pPPPRIOSL);
        cStmt.setObject(14, pPTCONTRA);
        cStmt.setObject(15, pPTOBSERV);
        cStmt.setObject(16, pPPCEDIDO);
        cStmt.setObject(17, pPPRIESGOS);
        cStmt.setObject(18, pPPDESCUENTO);
        cStmt.setObject(19, pPPGASTOS);
        cStmt.setObject(20, pPPPARTBENE);
        cStmt.setObject(21, pPCREAFAC);
        cStmt.setObject(22, pPPCESEXT);
        cStmt.setObject(23, pPCGARREL);
        cStmt.setObject(24, pPCFRECUL);
        cStmt.setObject(25, pPSCONQP);
        cStmt.setObject(26, pPNVERQP);
        cStmt.setObject(27, pPIAGREGA);
        cStmt.setObject(28, pPIMAXAGR);
        cStmt.setObject(29, pPCLAVECBR);
        cStmt.setObject(30, pPCERCARTERA);
        cStmt.setObject(31, pPIPRIMAESPERADAS);
        cStmt.setObject(32, pPNANYOSLOSS);
        cStmt.setObject(33, pPCBASEXL);
        cStmt.setObject(34, pPCLOSSCORRIDOR);
        cStmt.setObject(35, pPCCAPPEDRATIO);
        cStmt.setObject(36, pPSCONTRAPROT);
        cStmt.setObject(37, pPCESTADO);
        cStmt.setObject(38, pPNVERSIOPROT);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(39, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(39));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_CONTRATOS(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPNPRIORI, java.sql.Date pPFCONINI, java.math.BigDecimal pPNCONREL, java.sql.Date pPFCONFIN, java.math.BigDecimal pPIAUTORI, java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIMINCES, java.math.BigDecimal pPICAPACI, java.math.BigDecimal pPIPRIOXL, java.math.BigDecimal pPPPRIOSL, String pPTCONTRA, String pPTOBSERV, java.math.BigDecimal pPPCEDIDO, java.math.BigDecimal pPPRIESGOS, java.math.BigDecimal pPPDESCUENTO, java.math.BigDecimal pPPGASTOS, java.math.BigDecimal pPPPARTBENE, java.math.BigDecimal pPCREAFAC, java.math.BigDecimal pPPCESEXT, java.math.BigDecimal pPCGARREL, java.math.BigDecimal pPCFRECUL, java.math.BigDecimal pPSCONQP, java.math.BigDecimal pPNVERQP, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, java.math.BigDecimal pPCLAVECBR, java.math.BigDecimal pPCERCARTERA, java.math.BigDecimal pPIPRIMAESPERADAS, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCBASEXL, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPSCONTRAPROT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNVERSIOPROT) throws Exception {
        return this.callPAC_IAX_REA__F_SET_CONTRATOS(pPSCONTRA, pPNVERSIO, pPNPRIORI, pPFCONINI, pPNCONREL, pPFCONFIN, pPIAUTORI, pPIRETENC, pPIMINCES, pPICAPACI, pPIPRIOXL, pPPPRIOSL, pPTCONTRA, pPTOBSERV, pPPCEDIDO, pPPRIESGOS, pPPDESCUENTO, pPPGASTOS, pPPPARTBENE, pPCREAFAC, pPPCESEXT, pPCGARREL, pPCFRECUL, pPSCONQP, pPNVERQP, pPIAGREGA, pPIMAXAGR, pPCLAVECBR, pPCERCARTERA, pPIPRIMAESPERADAS, pPNANYOSLOSS, pPCBASEXL, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPSCONTRAPROT, pPCESTADO, pPNVERSIOPROT); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_CONTRATOS
    //--START-PAC_IAX_REA.F_SET_CONTRATOSAGR(PSCONAGR,  PCIDIOMA,  PTCONAGR)

    private HashMap callPAC_IAX_REA__F_SET_CONTRATOSAGR(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA, String pPTCONAGR) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_CONTRATOSAGR(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONAGR", "pPCIDIOMA", "pPTCONAGR" }, new Object[] { pPSCONAGR, pPCIDIOMA, pPTCONAGR });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONAGR);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.setObject(4, pPTCONAGR);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_CONTRATOSAGR(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA, String pPTCONAGR) throws Exception {
        return this.callPAC_IAX_REA__F_SET_CONTRATOSAGR(pPSCONAGR, pPCIDIOMA, pPTCONAGR); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_CONTRATOSAGR
      // INI - EDBR - 11/06/2019 - IAXIS3338 - se agregan los parametros de Retencion por poliza NRETPOL y Retencion por Cumulo NRETCUL
      //--START-PAC_IAX_REA.F_SET_CONTRATO_REA(PSCONTRA,  PSPLENO,  PCEMPRES,  PCTIPREA,  PCRAMO,  PCMODALI,  PCTIPSEG,  PCCOLECT,  PCACTIVI,  PCGARANT,  PCVIDAGA,  PSCONAGR,  PCVIDAIR,  PCTIPCUM,  PCVALID,  PNVERSIO,  PNPRIORI,  PFCONINI,  PNCONREL,  PFCONFIN,  PIAUTORI,  PIRETENC,  PIMINCES,  PICAPACI,  PIPRIOXL,  PPPRIOSL,  PTOBSERV,  PPCEDIDO,  PPRIESGOS,  PPDESCUENTO,  PPGASTOS,  PPPARTBENE,  PCREAFAC,  PPCESEXT,  PCGARREL,  PCFRECUL,  PSCONQP,  PNVERQP,  PIAGREGA,  PIMAXAGR,  PTCONTRA,  PCMONEDA,  PTDESCRIPCION,  PCLAVECBR,  PCERCARTERA,  PIPRIMAESPERADAS,  PNANYOSLOSS,  PCBASEXL,  PCLOSSCORRIDOR,  PCCAPPEDRATIO,  PSCONTRAPROT,  PCESTADO,  PNVERSIOPROT,  PCDEVENTO,  PNCOMEXT)
           private HashMap callPAC_IAX_REA__F_SET_CONTRATO_REA (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSPLENO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPREA, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCVIDAGA, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCVIDAIR, java.math.BigDecimal pPCTIPCUM, java.math.BigDecimal pPCVALID, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPNPRIORI, java.sql.Date pPFCONINI, java.math.BigDecimal pPNCONREL, java.sql.Date pPFCONFIN, java.math.BigDecimal pPIAUTORI, java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIMINCES, java.math.BigDecimal pPICAPACI, java.math.BigDecimal pPIPRIOXL, java.math.BigDecimal pPPPRIOSL, String pPTOBSERV, java.math.BigDecimal pPPCEDIDO, java.math.BigDecimal pPPRIESGOS, java.math.BigDecimal pPPDESCUENTO, java.math.BigDecimal pPPGASTOS, java.math.BigDecimal pPPPARTBENE, java.math.BigDecimal pPCREAFAC, java.math.BigDecimal pPPCESEXT, java.math.BigDecimal pPCGARREL, java.math.BigDecimal pPCFRECUL, java.math.BigDecimal pPSCONQP, java.math.BigDecimal pPNVERQP, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, String pPTCONTRA, String pPCMONEDA, String pPTDESCRIPCION, java.math.BigDecimal pPCLAVECBR, java.math.BigDecimal pPCERCARTERA, java.math.BigDecimal pPIPRIMAESPERADAS, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCBASEXL, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPSCONTRAPROT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNVERSIOPROT, java.math.BigDecimal pPCDEVENTO, java.math.BigDecimal pPNCOMEXT, java.math.BigDecimal pNRETPOL, java.math.BigDecimal pNRETCUL,java.math.BigDecimal pNISUBLIMITE) throws Exception {
               String callQuery="{?=call PAC_IAX_REA.F_SET_CONTRATO_REA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}";
               
               logCall(callQuery, new String[] {"pPSCONTRA", "pPSPLENO", "pPCEMPRES", "pPCTIPREA", "pPCRAMO", "pPCMODALI", "pPCTIPSEG", "pPCCOLECT", "pPCACTIVI", "pPCGARANT", "pPCVIDAGA", "pPSCONAGR", "pPCVIDAIR", "pPCTIPCUM", "pPCVALID", "pPNVERSIO", "pPNPRIORI", "pPFCONINI", "pPNCONREL", "pPFCONFIN", "pPIAUTORI", "pPIRETENC", "pPIMINCES", "pPICAPACI", "pPIPRIOXL", "pPPPRIOSL", "pPTOBSERV", "pPPCEDIDO", "pPPRIESGOS", "pPPDESCUENTO", "pPPGASTOS", "pPPPARTBENE", "pPCREAFAC", "pPPCESEXT", "pPCGARREL", "pPCFRECUL", "pPSCONQP", "pPNVERQP", "pPIAGREGA", "pPIMAXAGR", "pPTCONTRA", "pPCMONEDA", "pPTDESCRIPCION", "pPCLAVECBR", "pPCERCARTERA", "pPIPRIMAESPERADAS", "pPNANYOSLOSS", "pPCBASEXL", "pPCLOSSCORRIDOR", "pPCCAPPEDRATIO", "pPSCONTRAPROT", "pPCESTADO", "pPNVERSIOPROT", "pPCDEVENTO", "pPNCOMEXT", "pNRETPOL", "pNRETCUL","pNISUBLIMITE"}, new Object[] {pPSCONTRA, pPSPLENO, pPCEMPRES, pPCTIPREA, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCVIDAGA, pPSCONAGR, pPCVIDAIR, pPCTIPCUM, pPCVALID, pPNVERSIO, pPNPRIORI, pPFCONINI, pPNCONREL, pPFCONFIN, pPIAUTORI, pPIRETENC, pPIMINCES, pPICAPACI, pPIPRIOXL, pPPPRIOSL, pPTOBSERV, pPPCEDIDO, pPPRIESGOS, pPPDESCUENTO, pPPGASTOS, pPPPARTBENE, pPCREAFAC, pPPCESEXT, pPCGARREL, pPCFRECUL, pPSCONQP, pPNVERQP, pPIAGREGA, pPIMAXAGR, pPTCONTRA, pPCMONEDA, pPTDESCRIPCION, pPCLAVECBR, pPCERCARTERA, pPIPRIMAESPERADAS, pPNANYOSLOSS, pPCBASEXL, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPSCONTRAPROT, pPCESTADO, pPNVERSIOPROT, pPCDEVENTO, pPNCOMEXT, pNRETPOL, pNRETCUL,pNISUBLIMITE});
               CallableStatement cStmt=conn.prepareCall(callQuery);
               String USERNAME=conn.getMetaData().getUserName().toUpperCase();
               cStmt.setObject(2, pPSCONTRA);
               cStmt.setObject(3, pPSPLENO);
               cStmt.setObject(4, pPCEMPRES);
               cStmt.setObject(5, pPCTIPREA);
               cStmt.setObject(6, pPCRAMO);
               cStmt.setObject(7, pPCMODALI);
               cStmt.setObject(8, pPCTIPSEG);
               cStmt.setObject(9, pPCCOLECT);
               cStmt.setObject(10, pPCACTIVI);
               cStmt.setObject(11, pPCGARANT);
               cStmt.setObject(12, pPCVIDAGA);
               cStmt.setObject(13, pPSCONAGR);
               cStmt.setObject(14, pPCVIDAIR);
               cStmt.setObject(15, pPCTIPCUM);
               cStmt.setObject(16, pPCVALID);
               cStmt.setObject(17, pPNVERSIO);
               cStmt.setObject(18, pPNPRIORI);
               cStmt.setObject(19, pPFCONINI);
               cStmt.setObject(20, pPNCONREL);
               cStmt.setObject(21, pPFCONFIN);
               cStmt.setObject(22, pPIAUTORI);
               cStmt.setObject(23, pPIRETENC);
               cStmt.setObject(24, pPIMINCES);
               cStmt.setObject(25, pPICAPACI);
               cStmt.setObject(26, pPIPRIOXL);
               cStmt.setObject(27, pPPPRIOSL);
               cStmt.setObject(28, pPTOBSERV);
               cStmt.setObject(29, pPPCEDIDO);
               cStmt.setObject(30, pPPRIESGOS);
               cStmt.setObject(31, pPPDESCUENTO);
               cStmt.setObject(32, pPPGASTOS);
               cStmt.setObject(33, pPPPARTBENE);
               cStmt.setObject(34, pPCREAFAC);
               cStmt.setObject(35, pPPCESEXT);
               cStmt.setObject(36, pPCGARREL);
               cStmt.setObject(37, pPCFRECUL);
               cStmt.setObject(38, pPSCONQP);
               cStmt.setObject(39, pPNVERQP);
               cStmt.setObject(40, pPIAGREGA);
               cStmt.setObject(41, pPIMAXAGR);
               cStmt.setObject(42, pPTCONTRA);
               cStmt.setObject(43, pPCMONEDA);
               cStmt.setObject(44, pPTDESCRIPCION);
               cStmt.setObject(45, pPCLAVECBR);
               cStmt.setObject(46, pPCERCARTERA);
               cStmt.setObject(47, pPIPRIMAESPERADAS);
               cStmt.setObject(48, pPNANYOSLOSS);
               cStmt.setObject(49, pPCBASEXL);
               cStmt.setObject(50, pPCLOSSCORRIDOR);
               cStmt.setObject(51, pPCCAPPEDRATIO);
               cStmt.setObject(52, pPSCONTRAPROT);
               cStmt.setObject(53, pPCESTADO);
               cStmt.setObject(54, pPNVERSIOPROT);
               cStmt.setObject(55, pPCDEVENTO);
               cStmt.setObject(56, pPNCOMEXT);
               cStmt.setObject(57, pNRETPOL);
               cStmt.setObject(58, pNRETCUL);
               cStmt.setObject(59, pNISUBLIMITE);  
               cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
               cStmt.registerOutParameter(60, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
               cStmt.execute();
               HashMap retVal=new HashMap();
               try {
                   retVal.put("RETURN", cStmt.getObject(1));
               }
               catch (SQLException e) {
                   retVal.put("RETURN", null);
               }
               try {
                   retVal.put("MENSAJES", cStmt.getObject(59));
               }
               catch (SQLException e) {
                   retVal.put("MENSAJES", null);
               }
               retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
               cStmt.close();//AXIS-WLS1SERVER-Ready
               
               return retVal;
           }

           public HashMap ejecutaPAC_IAX_REA__F_SET_CONTRATO_REA (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSPLENO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPREA, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCVIDAGA, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCVIDAIR, java.math.BigDecimal pPCTIPCUM, java.math.BigDecimal pPCVALID, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPNPRIORI, java.sql.Date pPFCONINI, java.math.BigDecimal pPNCONREL, java.sql.Date pPFCONFIN, java.math.BigDecimal pPIAUTORI, java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIMINCES, java.math.BigDecimal pPICAPACI, java.math.BigDecimal pPIPRIOXL, java.math.BigDecimal pPPPRIOSL, String pPTOBSERV, java.math.BigDecimal pPPCEDIDO, java.math.BigDecimal pPPRIESGOS, java.math.BigDecimal pPPDESCUENTO, java.math.BigDecimal pPPGASTOS, java.math.BigDecimal pPPPARTBENE, java.math.BigDecimal pPCREAFAC, java.math.BigDecimal pPPCESEXT, java.math.BigDecimal pPCGARREL, java.math.BigDecimal pPCFRECUL, java.math.BigDecimal pPSCONQP, java.math.BigDecimal pPNVERQP, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, String pPTCONTRA, String pPCMONEDA, String pPTDESCRIPCION, java.math.BigDecimal pPCLAVECBR, java.math.BigDecimal pPCERCARTERA, java.math.BigDecimal pPIPRIMAESPERADAS, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCBASEXL, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPSCONTRAPROT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNVERSIOPROT, java.math.BigDecimal pPCDEVENTO, java.math.BigDecimal pPNCOMEXT, java.math.BigDecimal pNRETPOL, java.math.BigDecimal pNRETCUL,java.math.BigDecimal pNISUBLIMITE) throws Exception {
               return this.callPAC_IAX_REA__F_SET_CONTRATO_REA(pPSCONTRA, pPSPLENO, pPCEMPRES, pPCTIPREA, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCVIDAGA, pPSCONAGR, pPCVIDAIR, pPCTIPCUM, pPCVALID, pPNVERSIO, pPNPRIORI, pPFCONINI, pPNCONREL, pPFCONFIN, pPIAUTORI, pPIRETENC, pPIMINCES, pPICAPACI, pPIPRIOXL, pPPPRIOSL, pPTOBSERV, pPPCEDIDO, pPPRIESGOS, pPPDESCUENTO, pPPGASTOS, pPPPARTBENE, pPCREAFAC, pPPCESEXT, pPCGARREL, pPCFRECUL, pPSCONQP, pPNVERQP, pPIAGREGA, pPIMAXAGR, pPTCONTRA, pPCMONEDA, pPTDESCRIPCION, pPCLAVECBR, pPCERCARTERA, pPIPRIMAESPERADAS, pPNANYOSLOSS, pPCBASEXL, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPSCONTRAPROT, pPCESTADO, pPNVERSIOPROT, pPCDEVENTO, pPNCOMEXT, pNRETPOL, pNRETCUL,pNISUBLIMITE);//AXIS-WLS1SERVER-Ready 
           }
		   
		   // FIN EDBR - 11/06/2019 - IAXIS3338 - se agregan los parametros de Retencion por poliza NRETPOL y Retencion por Cumulo NRETCUL
           //--END-PAC_IAX_REA.F_SET_CONTRATO_REA

      //     public HashMap ejecutaPAC_IAX_REA__F_SET_CONTRATO_REA (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPSPLENO, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCTIPREA, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPCMODALI, java.math.BigDecimal pPCTIPSEG, java.math.BigDecimal pPCCOLECT, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPCVIDAGA, java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCVIDAIR, java.math.BigDecimal pPCTIPCUM, java.math.BigDecimal pPCVALID, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPNPRIORI, java.sql.Date pPFCONINI, java.math.BigDecimal pPNCONREL, java.sql.Date pPFCONFIN, java.math.BigDecimal pPIAUTORI, java.math.BigDecimal pPIRETENC, java.math.BigDecimal pPIMINCES, java.math.BigDecimal pPICAPACI, java.math.BigDecimal pPIPRIOXL, java.math.BigDecimal pPPPRIOSL, String pPTOBSERV, java.math.BigDecimal pPPCEDIDO, java.math.BigDecimal pPPRIESGOS, java.math.BigDecimal pPPDESCUENTO, java.math.BigDecimal pPPGASTOS, java.math.BigDecimal pPPPARTBENE, java.math.BigDecimal pPCREAFAC, java.math.BigDecimal pPPCESEXT, java.math.BigDecimal pPCGARREL, java.math.BigDecimal pPCFRECUL, java.math.BigDecimal pPSCONQP, java.math.BigDecimal pPNVERQP, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, String pPTCONTRA, String pPCMONEDA, String pPTDESCRIPCION, java.math.BigDecimal pPCLAVECBR, java.math.BigDecimal pPCERCARTERA, java.math.BigDecimal pPIPRIMAESPERADAS, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCBASEXL, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPSCONTRAPROT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNVERSIOPROT, java.math.BigDecimal pPCDEVENTO) throws Exception {
        //       return this.callPAC_IAX_REA__F_SET_CONTRATO_REA(pPSCONTRA, pPSPLENO, pPCEMPRES, pPCTIPREA, pPCRAMO, pPCMODALI, pPCTIPSEG, pPCCOLECT, pPCACTIVI, pPCGARANT, pPCVIDAGA, pPSCONAGR, pPCVIDAIR, pPCTIPCUM, pPCVALID, pPNVERSIO, pPNPRIORI, pPFCONINI, pPNCONREL, pPFCONFIN, pPIAUTORI, pPIRETENC, pPIMINCES, pPICAPACI, pPIPRIOXL, pPPPRIOSL, pPTOBSERV, pPPCEDIDO, pPPRIESGOS, pPPDESCUENTO, pPPGASTOS, pPPPARTBENE, pPCREAFAC, pPPCESEXT, pPCGARREL, pPCFRECUL, pPSCONQP, pPNVERQP, pPIAGREGA, pPIMAXAGR, pPTCONTRA, pPCMONEDA, pPTDESCRIPCION, pPCLAVECBR, pPCERCARTERA, pPIPRIMAESPERADAS, pPNANYOSLOSS, pPCBASEXL, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPSCONTRAPROT, pPCESTADO, pPNVERSIOPROT, pPCDEVENTO);//AXIS-WLS1SERVER-Ready 
          // }
           //--END-PAC_IAX_REA.F_SET_CONTRATO_REA

    //--START-PAC_IAX_REA.F_SET_CUADROCES(PCCOMPANI,  PNVERSIO,  PSCONTRA,  PCTRAMO,  PCCOMREA,  PPCESION,  PNPLENOS,  PICESFIJ,  PICOMFIJ,  PISCONTA,  PPRESERV,  PPINTRES,  PILIACDE,  PPPAGOSL,  PCCORRED,  PCINTRES,  PCINTREF,  PCRESREF,  PIRESERV,  PPTASAJ,  PFUTLIQ,  PIAGREGA,  PIMAXAGR,  PCTIPCOMIS,  PPCTCOMIS,  PCTRAMOCOMISION)

    private HashMap callPAC_IAX_REA__F_SET_CUADROCES(java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPINTRES, java.math.BigDecimal pPILIACDE, java.math.BigDecimal pPPPAGOSL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPCINTREF, java.math.BigDecimal pPCRESREF, java.math.BigDecimal pPIRESERV, java.math.BigDecimal pPPTASAJ, java.sql.Date pPFUTLIQ, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, java.math.BigDecimal pPCTIPCOMIS, java.math.BigDecimal pPPCTCOMIS, java.math.BigDecimal pPCTRAMOCOMISION, java.math.BigDecimal pPCTGASTOSREA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_CUADROCES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCOMPANI", "pPNVERSIO", "pPSCONTRA", "pPCTRAMO", "pPCCOMREA", "pPPCESION", "pPNPLENOS", "pPICESFIJ", "pPICOMFIJ", "pPISCONTA", "pPPRESERV", "pPPINTRES", "pPILIACDE", "pPPPAGOSL", "pPCCORRED", "pPCINTRES", "pPCINTREF", "pPCRESREF", "pPIRESERV", "pPPTASAJ", "pPFUTLIQ", "pPIAGREGA", "pPIMAXAGR", "pPCTIPCOMIS", "pPPCTCOMIS", "pPCTRAMOCOMISION", "pPCTGASTOSREA" }, new Object[] { pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPCCOMREA, pPPCESION, pPNPLENOS, pPICESFIJ, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPINTRES, pPILIACDE, pPPPAGOSL, pPCCORRED, pPCINTRES, pPCINTREF, pPCRESREF, pPIRESERV, pPPTASAJ, pPFUTLIQ, pPIAGREGA, pPIMAXAGR, pPCTIPCOMIS, pPPCTCOMIS, pPCTRAMOCOMISION, pPCTGASTOSREA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCOMPANI);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.setObject(4, pPSCONTRA);
        cStmt.setObject(5, pPCTRAMO);
        cStmt.setObject(6, pPCCOMREA);
        cStmt.setObject(7, pPPCESION);
        cStmt.setObject(8, pPNPLENOS);
        cStmt.setObject(9, pPICESFIJ);
        cStmt.setObject(10, pPICOMFIJ);
        cStmt.setObject(11, pPISCONTA);
        cStmt.setObject(12, pPPRESERV);
        cStmt.setObject(13, pPPINTRES);
        cStmt.setObject(14, pPILIACDE);
        cStmt.setObject(15, pPPPAGOSL);
        cStmt.setObject(16, pPCCORRED);
        cStmt.setObject(17, pPCINTRES);
        cStmt.setObject(18, pPCINTREF);
        cStmt.setObject(19, pPCRESREF);
        cStmt.setObject(20, pPIRESERV);
        cStmt.setObject(21, pPPTASAJ);
        cStmt.setObject(22, pPFUTLIQ);
        cStmt.setObject(23, pPIAGREGA);
        cStmt.setObject(24, pPIMAXAGR);
        cStmt.setObject(25, pPCTIPCOMIS);
        cStmt.setObject(26, pPPCTCOMIS);
        cStmt.setObject(27, pPCTRAMOCOMISION);
        cStmt.setObject(28, pPCTGASTOSREA); //CONF-587
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(29, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(28));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_CUADROCES(java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPINTRES, java.math.BigDecimal pPILIACDE, java.math.BigDecimal pPPPAGOSL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPCINTREF, java.math.BigDecimal pPCRESREF, java.math.BigDecimal pPIRESERV, java.math.BigDecimal pPPTASAJ, java.sql.Date pPFUTLIQ, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, java.math.BigDecimal pPCTIPCOMIS, java.math.BigDecimal pPPCTCOMIS, java.math.BigDecimal pPCTRAMOCOMISION, java.math.BigDecimal pPCTGASTOSREA) throws Exception {
        return this.callPAC_IAX_REA__F_SET_CUADROCES(pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPCCOMREA, pPPCESION, pPNPLENOS, pPICESFIJ, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPINTRES, pPILIACDE, pPPPAGOSL, pPCCORRED, pPCINTRES, pPCINTREF, pPCRESREF, pPIRESERV, pPPTASAJ, pPFUTLIQ, pPIAGREGA, pPIMAXAGR, pPCTIPCOMIS, pPPCTCOMIS, pPCTRAMOCOMISION, pPCTGASTOSREA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_CUADROCES
   
     //--START-PAC_IAX_REA.F_SET_CUADRO_FAC(PSFACULT,  PCESTADO,  PFINCUF,  PPLOCAL,  PCCOMPANI,  PPCESION,  PICESFIJ,  PCCOMREA,  PPCOMISI,  PICOMFIJ,  PISCONTA,  PPRESERV, PPRESREA, PCINTRES,  PINTRES,  PCTIPFAC,  PPTASAXL,  PCCORRED,  PCFRERES,  PCRESREA,  PCCONREC,  PFGARPRI,  PFGARDEP,  PPIMPINT,  PTIDFCOM,  PSSEGURO)
    //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
    // Inicio POST-74 30/06/2022 PAYV. Se Agrega el Campo pPFACCED
        // Inicio IAXIS-5361 09/07/2020 Se agrega a la firma de la funciÃ³n el parÃ¡metro pPIFACCED y dentro, se mueven los Ã­ndices de los demÃ¡s parÃ¡metros y se ajustan trazas y llamados de la funciÃ³n a base de datos.
    private HashMap callPAC_IAX_REA__F_SET_CUADRO_FAC (java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINCUF, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIFACCED, java.math.BigDecimal pPFACCED,java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPRESREA, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPINTRES, java.math.BigDecimal pPCTIPFAC, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCFRERES, java.math.BigDecimal pPCRESREA, java.math.BigDecimal pPCCONREC, java.sql.Date pPFGARPRI, java.sql.Date pPFGARDEP, java.math.BigDecimal pPPIMPINT, String pPTIDFCOM, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pMODIFICACIO) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
         String callQuery="{?=call PAC_IAX_REA.F_SET_CUADRO_FAC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"; //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
         
         
         System.out.println(
        		 "HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC, pPSFACULT:"+pPSFACULT+" pPCESTADO:"+pPCESTADO+" pPFINCUF:"+pPFINCUF+" pPPLOCAL"+pPPLOCAL+
        		 " pPCCOMPANI:"+pPCCOMPANI+" pPPCESION:"+pPPCESION+" pPICESFIJ:"+pPICESFIJ+" pPCCOMREA:"+pPCCOMREA+
        		 " pPPCOMISI:"+pPPCOMISI+" pPICOMFIJ:"+pPICOMFIJ+" pPISCONTA:"+pPISCONTA+" pPPRESERV:"+pPPRESERV+
        		 " pPPRESREA:"+pPPRESREA+" pPCINTRES:"+pPCINTRES+" pPCINTRES:"+pPCINTRES+" pPCTIPFAC"+pPCTIPFAC+
        		 " pPPTASAXL:"+pPPTASAXL+" pPCCORRED:"+pPCCORRED+" pPCFRERES:"+pPCFRERES+" pPCRESREA:"+pPCRESREA+
        		 " pPCCONREC:"+pPCCONREC+" pPFGARPRI:"+pPFGARPRI+" pPFGARDEP:"+pPFGARDEP+" pPPIMPINT:"+pPPIMPINT+
        		 " pPTIDFCOM:"+pPTIDFCOM+" pPSSEGURO:"+pPSSEGURO+" pPIFACCED:"+pPIFACCED+" pPFACCED:"+pPFACCED);
         
         
         System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 2, callQuery:"+callQuery);
         
         logCall(callQuery, new String[] {"pPSFACULT", "pPCESTADO", "pPFINCUF", "pPPLOCAL", "pPIFACCED", "pPFACCED", "pPCCOMPANI", "pPPCESION", "pPICESFIJ", "pPCCOMREA", "pPPCOMISI", "pPICOMFIJ", "pPISCONTA", "pPPRESERV", "pPPRESREA", "pPCINTRES", "pPINTRES", "pPCTIPFAC", "pPPTASAXL", "pPCCORRED", "pPCFRERES", "pPCRESREA", "pPCCONREC", "pPFGARPRI", "pPFGARDEP", "pPPIMPINT", "pPTIDFCOM", "pPSSEGURO", "pMODIFICACIO"}, new Object[] {pPSFACULT, pPCESTADO, pPFINCUF, pPPLOCAL, pPIFACCED, pPFACCED, pPCCOMPANI, pPPCESION, pPICESFIJ, pPCCOMREA, pPPCOMISI, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPRESREA, pPCINTRES, pPINTRES, pPCTIPFAC, pPPTASAXL, pPCCORRED, pPCFRERES, pPCRESREA, pPCCONREC, pPFGARPRI, pPFGARDEP, pPPIMPINT, pPTIDFCOM, pPSSEGURO, pMODIFICACIO}); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
         //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
         System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 3, callQuery:"+callQuery);
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSFACULT);
         cStmt.setObject(3, pPCESTADO);
         cStmt.setObject(4, pPFINCUF);
         cStmt.setObject(5, pPPLOCAL);
         cStmt.setObject(6, pPIFACCED); 
         cStmt.setObject(7, pPFACCED); // INICIO POST-74 30/06/2022 PAYV
         cStmt.setObject(8, pPCCOMPANI);
         cStmt.setObject(9, pPPCESION);
         cStmt.setObject(10, pPICESFIJ);
         cStmt.setObject(11, pPCCOMREA);
         cStmt.setObject(12, pPPCOMISI);
         cStmt.setObject(13, pPICOMFIJ);
         cStmt.setObject(14, pPISCONTA);
         cStmt.setObject(15, pPPRESERV);
         //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
         cStmt.setObject(16, pPPRESREA);         
         cStmt.setObject(17, pPCINTRES);
         cStmt.setObject(18, pPINTRES);
         cStmt.setObject(19, pPCTIPFAC);
         cStmt.setObject(20, pPPTASAXL);
         cStmt.setObject(21, pPCCORRED);
         cStmt.setObject(22, pPCFRERES);
         cStmt.setObject(23, pPCRESREA);
         cStmt.setObject(24, pPCCONREC);
         cStmt.setObject(25, pPFGARPRI);
         cStmt.setObject(26, pPFGARDEP);
         cStmt.setObject(27, pPPIMPINT);
         cStmt.setObject(28, pPTIDFCOM);
         cStmt.setObject(29, pPSSEGURO);
         cStmt.setObject(30, pMODIFICACIO); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
         System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 4, callQuery:"+callQuery);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO. // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5, callQuery:"+callQuery);
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
        	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5.1, callQuery:"+callQuery);
             retVal.put("RETURN", null);
         }
         try {
        	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5.2, callQuery:"+callQuery);
			 //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
             retVal.put("MENSAJES", cStmt.getObject(31)); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
			 //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
         }
         catch (SQLException e) {
        	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5.3, callQuery:"+callQuery);
             retVal.put("MENSAJES", null);
         }
         System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 6, callQuery:"+callQuery);
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 7, callQuery:"+callQuery);
         return retVal;
     }
     // Fin IAXIS-5361 09/07/2020
     //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
     // Inicio IAXIS-5361 09/07/2020 Se agrega a la firma de la funciÃ³n el parÃ¡metro pPIFACCED. Se ajusta la traza con el nuevo parÃ¡metro
     // Inicio POST-74 30/06/2022 PAYV. Se Agrega el Campo pPFACCED
     public HashMap ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC (java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINCUF, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIFACCED, java.math.BigDecimal pPFACCED,java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPRESREA, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPINTRES, java.math.BigDecimal pPCTIPFAC, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCFRERES, java.math.BigDecimal pPCRESREA, java.math.BigDecimal pPCCONREC, java.sql.Date pPFGARPRI, java.sql.Date pPFGARDEP, java.math.BigDecimal pPPIMPINT, String pPTIDFCOM, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pMODIFICACIO) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
         
         System.out.println(
        		 "HANS TRAZA PAC_IAX_REA.ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC, pPSFACULT:"+pPSFACULT+" pPCESTADO:"+pPCESTADO+" pPFINCUF:"+pPFINCUF+" pPPLOCAL"+pPPLOCAL+
        		 " pPCCOMPANI:"+pPCCOMPANI+" pPPCESION:"+pPPCESION+" pPICESFIJ:"+pPICESFIJ+" pPCCOMREA:"+pPCCOMREA+
        		 " pPPCOMISI:"+pPPCOMISI+" pPICOMFIJ:"+pPICOMFIJ+" pPISCONTA:"+pPISCONTA+" pPPRESERV:"+pPPRESERV+
        		 " pPPRESREA:"+pPPRESREA+" pPCINTRES:"+pPCINTRES+" pPCINTRES:"+pPCINTRES+" pPCTIPFAC"+pPCTIPFAC+
        		 " pPPTASAXL:"+pPPTASAXL+" pPCCORRED:"+pPCCORRED+" pPCFRERES:"+pPCFRERES+" pPCRESREA:"+pPCRESREA+
        		 " pPCCONREC:"+pPCCONREC+" pPFGARPRI:"+pPFGARPRI+" pPFGARDEP:"+pPFGARDEP+" pPPIMPINT:"+pPPIMPINT+
        		 " pPTIDFCOM:"+pPTIDFCOM+" pPSSEGURO:"+pPSSEGURO+" pPIFACCED:"+pPIFACCED+" pPFACCED:"+pPFACCED+" pMODIFICACIO:"+pMODIFICACIO
        		 
                 ); //MPC 19/12/2022 Se adiciona campo pMODIFICACIO.
    	 return this.callPAC_IAX_REA__F_SET_CUADRO_FAC(pPSFACULT, pPCESTADO, pPFINCUF, pPPLOCAL, pPIFACCED,pPFACCED,pPCCOMPANI, pPPCESION, pPICESFIJ, pPCCOMREA, pPPCOMISI, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPRESREA, pPCINTRES, pPINTRES, pPCTIPFAC, pPPTASAXL, pPCCORRED, pPCFRERES, pPCRESREA, pPCCONREC, pPFGARPRI, pPFGARDEP, pPPIMPINT, pPTIDFCOM, pPSSEGURO, pMODIFICACIO); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO. //AXIS-WLS1SERVER-Ready
     }
     // Fin IAXIS-5361 09/07/2020
	 //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
     //--END-PAC_IAX_REA.F_SET_CUADRO_FAC


   
   
    //--START-PAC_IAX_REA.F_SET_DESAGRUPCONTRATO(PSCONAGR,  PCIDIOMA,  PTCONAGR)

    private HashMap callPAC_IAX_REA__F_SET_DESAGRUPCONTRATO(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA, String pPTCONAGR) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_DESAGRUPCONTRATO(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONAGR", "pPCIDIOMA", "pPTCONAGR" }, new Object[] { pPSCONAGR, pPCIDIOMA, pPTCONAGR });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONAGR);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.setObject(4, pPTCONAGR);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_DESAGRUPCONTRATO(java.math.BigDecimal pPSCONAGR, java.math.BigDecimal pPCIDIOMA, String pPTCONAGR) throws Exception {
        return this.callPAC_IAX_REA__F_SET_DESAGRUPCONTRATO(pPSCONAGR, pPCIDIOMA, pPTCONAGR); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_DESAGRUPCONTRATO
    //--START-PAC_IAX_REA.F_SET_OBJETOCUADROREA(PCCOMPANI,  PNVERSIO,  PSCONTRA,  PCTRAMO,  PCCOMREA,  PPCESION,  PNPLENOS,  PICESFIJ,  PICOMFIJ,  PISCONTA,  PPRESERV,  PPINTRES,  PILIACDE,  PPPAGOSL,  PCCORRED,  PCINTREF,  PCRESREF,  PCINTRES,  PIRESERV,  PPTASAJ,  PFULTLIQ,  PIAGREGA,  PIMAXAGR,  PCTIPCOMIS,  PPCTCOMIS,  PCTRAMOCOMISION)

    private HashMap callPAC_IAX_REA__F_SET_OBJETOCUADROREA(java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPINTRES, java.math.BigDecimal pPILIACDE, java.math.BigDecimal pPPPAGOSL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCINTREF, java.math.BigDecimal pPCRESREF, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPIRESERV, java.math.BigDecimal pPPTASAJ, java.sql.Date pPFULTLIQ, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, java.math.BigDecimal pPCTIPCOMIS, java.math.BigDecimal pPPCTCOMIS, java.math.BigDecimal pPCTRAMOCOMISION) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_OBJETOCUADROREA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCOMPANI", "pPNVERSIO", "pPSCONTRA", "pPCTRAMO", "pPCCOMREA", "pPPCESION", "pPNPLENOS", "pPICESFIJ", "pPICOMFIJ", "pPISCONTA", "pPPRESERV", "pPPINTRES", "pPILIACDE", "pPPPAGOSL", "pPCCORRED", "pPCINTREF", "pPCRESREF", "pPCINTRES", "pPIRESERV", "pPPTASAJ", "pPFULTLIQ", "pPIAGREGA", "pPIMAXAGR", "pPCTIPCOMIS", "pPPCTCOMIS", "pPCTRAMOCOMISION" }, new Object[] { pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPCCOMREA, pPPCESION, pPNPLENOS, pPICESFIJ, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPINTRES, pPILIACDE, pPPPAGOSL, pPCCORRED, pPCINTREF, pPCRESREF, pPCINTRES, pPIRESERV, pPPTASAJ, pPFULTLIQ, pPIAGREGA, pPIMAXAGR, pPCTIPCOMIS, pPPCTCOMIS, pPCTRAMOCOMISION });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCOMPANI);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.setObject(4, pPSCONTRA);
        cStmt.setObject(5, pPCTRAMO);
        cStmt.setObject(6, pPCCOMREA);
        cStmt.setObject(7, pPPCESION);
        cStmt.setObject(8, pPNPLENOS);
        cStmt.setObject(9, pPICESFIJ);
        cStmt.setObject(10, pPICOMFIJ);
        cStmt.setObject(11, pPISCONTA);
        cStmt.setObject(12, pPPRESERV);
        cStmt.setObject(13, pPPINTRES);
        cStmt.setObject(14, pPILIACDE);
        cStmt.setObject(15, pPPPAGOSL);
        cStmt.setObject(16, pPCCORRED);
        cStmt.setObject(17, pPCINTREF);
        cStmt.setObject(18, pPCRESREF);
        cStmt.setObject(19, pPCINTRES);
        cStmt.setObject(20, pPIRESERV);
        cStmt.setObject(21, pPPTASAJ);
        cStmt.setObject(22, pPFULTLIQ);
        cStmt.setObject(23, pPIAGREGA);
        cStmt.setObject(24, pPIMAXAGR);
        cStmt.setObject(25, pPCTIPCOMIS);
        cStmt.setObject(26, pPPCTCOMIS);
        cStmt.setObject(27, pPCTRAMOCOMISION);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(28, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(28));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_OBJETOCUADROREA(java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPINTRES, java.math.BigDecimal pPILIACDE, java.math.BigDecimal pPPPAGOSL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCINTREF, java.math.BigDecimal pPCRESREF, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPIRESERV, java.math.BigDecimal pPPTASAJ, java.sql.Date pPFULTLIQ, java.math.BigDecimal pPIAGREGA, java.math.BigDecimal pPIMAXAGR, java.math.BigDecimal pPCTIPCOMIS, java.math.BigDecimal pPPCTCOMIS, java.math.BigDecimal pPCTRAMOCOMISION) throws Exception {
        return this.callPAC_IAX_REA__F_SET_OBJETOCUADROREA(pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPCCOMREA, pPPCESION, pPNPLENOS, pPICESFIJ, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPINTRES, pPILIACDE, pPPPAGOSL, pPCCORRED, pPCINTREF, pPCRESREF, pPCINTRES, pPIRESERV, pPPTASAJ, pPFULTLIQ, pPIAGREGA, pPIMAXAGR, pPCTIPCOMIS, pPPCTCOMIS, pPCTRAMOCOMISION); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_OBJETOCUADROREA
        //--START-PAC_IAX_REA.F_SET_OBJETOTRAMOSREA(PNVERSIO,  PSCONTRA,  PCTRAMO,  PITOTTRA,  PNPLENOS,  PCFREBOR,  PPLOCAL,  PIXLPRIO,  PIXLEXCE,  PPSLPRIO,  PPSLEXCE,  PNCESION,  PFULTBOR,  PIMAXPLO,  PNORDEN,  PNSEGCON,  PIMINXL,  PIDEPXL,  PNSEGVER,  PPTASAXL,  PNCTRXL,  PNVERXL,  PIPMD,  PCFREPMD,  PCAPLIXL,  PPLIMGAS,  PPLIMINX,  PIDAA,  PILAA,  PCTPRIMAXL,  PIPRIMAFIJAXL,  PIPRIMAESTIMADA,  PCAPLICTASAXL,  PCTIPTASAXL,  PCTRAMOTASAXL,  PPCTPDXL,  PCFORPAGPDXL,  PPCTMINXL,  PPCTPB,  PNANYOSLOSS,  PCLOSSCORRIDOR,  PCCAPPEDRATIO,  PCREPOS,  PIBONOREC,  PIMPAVISO,  PIMPCONTADO,  PPCTCONTADO,  PPCTGASTOS,  PPTASAAJUSTE,  PICAPCOASEG,  PICOSTOFIJO,  PPCOMISINTERM)
     private HashMap callPAC_IAX_REA__F_SET_OBJETOTRAMOSREA (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPITOTTRA, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPCFREBOR, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIXLPRIO, java.math.BigDecimal pPIXLEXCE, java.math.BigDecimal pPPSLPRIO, java.math.BigDecimal pPPSLEXCE, java.math.BigDecimal pPNCESION, java.sql.Date pPFULTBOR, java.math.BigDecimal pPIMAXPLO, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNSEGCON, java.math.BigDecimal pPIMINXL, java.math.BigDecimal pPIDEPXL, java.math.BigDecimal pPNSEGVER, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPNCTRXL, java.math.BigDecimal pPNVERXL, java.math.BigDecimal pPIPMD, java.math.BigDecimal pPCFREPMD, java.math.BigDecimal pPCAPLIXL, java.math.BigDecimal pPPLIMGAS, java.math.BigDecimal pPPLIMINX, java.math.BigDecimal pPIDAA, java.math.BigDecimal pPILAA, java.math.BigDecimal pPCTPRIMAXL, java.math.BigDecimal pPIPRIMAFIJAXL, java.math.BigDecimal pPIPRIMAESTIMADA, java.math.BigDecimal pPCAPLICTASAXL, java.math.BigDecimal pPCTIPTASAXL, java.math.BigDecimal pPCTRAMOTASAXL, java.math.BigDecimal pPPCTPDXL, java.math.BigDecimal pPCFORPAGPDXL, java.math.BigDecimal pPPCTMINXL, java.math.BigDecimal pPPCTPB, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPCREPOS, java.math.BigDecimal pPIBONOREC, java.math.BigDecimal pPIMPAVISO, java.math.BigDecimal pPIMPCONTADO, java.math.BigDecimal pPPCTCONTADO, java.math.BigDecimal pPPCTGASTOS, java.math.BigDecimal pPPTASAAJUSTE, java.math.BigDecimal pPICAPCOASEG, java.math.BigDecimal pPICOSTOFIJO, java.math.BigDecimal pPPCOMISINTERM) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_SET_OBJETOTRAMOSREA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPNVERSIO", "pPSCONTRA", "pPCTRAMO", "pPITOTTRA", "pPNPLENOS", "pPCFREBOR", "pPPLOCAL", "pPIXLPRIO", "pPIXLEXCE", "pPPSLPRIO", "pPPSLEXCE", "pPNCESION", "pPFULTBOR", "pPIMAXPLO", "pPNORDEN", "pPNSEGCON", "pPIMINXL", "pPIDEPXL", "pPNSEGVER", "pPPTASAXL", "pPNCTRXL", "pPNVERXL", "pPIPMD", "pPCFREPMD", "pPCAPLIXL", "pPPLIMGAS", "pPPLIMINX", "pPIDAA", "pPILAA", "pPCTPRIMAXL", "pPIPRIMAFIJAXL", "pPIPRIMAESTIMADA", "pPCAPLICTASAXL", "pPCTIPTASAXL", "pPCTRAMOTASAXL", "pPPCTPDXL", "pPCFORPAGPDXL", "pPPCTMINXL", "pPPCTPB", "pPNANYOSLOSS", "pPCLOSSCORRIDOR", "pPCCAPPEDRATIO", "pPCREPOS", "pPIBONOREC", "pPIMPAVISO", "pPIMPCONTADO", "pPPCTCONTADO", "pPPCTGASTOS", "pPPTASAAJUSTE", "pPICAPCOASEG", "pPICOSTOFIJO", "pPPCOMISINTERM"}, new Object[] {pPNVERSIO, pPSCONTRA, pPCTRAMO, pPITOTTRA, pPNPLENOS, pPCFREBOR, pPPLOCAL, pPIXLPRIO, pPIXLEXCE, pPPSLPRIO, pPPSLEXCE, pPNCESION, pPFULTBOR, pPIMAXPLO, pPNORDEN, pPNSEGCON, pPIMINXL, pPIDEPXL, pPNSEGVER, pPPTASAXL, pPNCTRXL, pPNVERXL, pPIPMD, pPCFREPMD, pPCAPLIXL, pPPLIMGAS, pPPLIMINX, pPIDAA, pPILAA, pPCTPRIMAXL, pPIPRIMAFIJAXL, pPIPRIMAESTIMADA, pPCAPLICTASAXL, pPCTIPTASAXL, pPCTRAMOTASAXL, pPPCTPDXL, pPCFORPAGPDXL, pPPCTMINXL, pPPCTPB, pPNANYOSLOSS, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPCREPOS, pPIBONOREC, pPIMPAVISO, pPIMPCONTADO, pPPCTCONTADO, pPPCTGASTOS, pPPTASAAJUSTE, pPICAPCOASEG, pPICOSTOFIJO, pPPCOMISINTERM});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPNVERSIO);
         cStmt.setObject(3, pPSCONTRA);
         cStmt.setObject(4, pPCTRAMO);
         cStmt.setObject(5, pPITOTTRA);
         cStmt.setObject(6, pPNPLENOS);
         cStmt.setObject(7, pPCFREBOR);
         cStmt.setObject(8, pPPLOCAL);
         cStmt.setObject(9, pPIXLPRIO);
         cStmt.setObject(10, pPIXLEXCE);
         cStmt.setObject(11, pPPSLPRIO);
         cStmt.setObject(12, pPPSLEXCE);
         cStmt.setObject(13, pPNCESION);
         cStmt.setObject(14, pPFULTBOR);
         cStmt.setObject(15, pPIMAXPLO);
         cStmt.setObject(16, pPNORDEN);
         cStmt.setObject(17, pPNSEGCON);
         cStmt.setObject(18, pPIMINXL);
         cStmt.setObject(19, pPIDEPXL);
         cStmt.setObject(20, pPNSEGVER);
         cStmt.setObject(21, pPPTASAXL);
         cStmt.setObject(22, pPNCTRXL);
         cStmt.setObject(23, pPNVERXL);
         cStmt.setObject(24, pPIPMD);
         cStmt.setObject(25, pPCFREPMD);
         cStmt.setObject(26, pPCAPLIXL);
         cStmt.setObject(27, pPPLIMGAS);
         cStmt.setObject(28, pPPLIMINX);
         cStmt.setObject(29, pPIDAA);
         cStmt.setObject(30, pPILAA);
         cStmt.setObject(31, pPCTPRIMAXL);
         cStmt.setObject(32, pPIPRIMAFIJAXL);
         cStmt.setObject(33, pPIPRIMAESTIMADA);
         cStmt.setObject(34, pPCAPLICTASAXL);
         cStmt.setObject(35, pPCTIPTASAXL);
         cStmt.setObject(36, pPCTRAMOTASAXL);
         cStmt.setObject(37, pPPCTPDXL);
         cStmt.setObject(38, pPCFORPAGPDXL);
         cStmt.setObject(39, pPPCTMINXL);
         cStmt.setObject(40, pPPCTPB);
         cStmt.setObject(41, pPNANYOSLOSS);
         cStmt.setObject(42, pPCLOSSCORRIDOR);
         cStmt.setObject(43, pPCCAPPEDRATIO);
         cStmt.setObject(44, pPCREPOS);
         cStmt.setObject(45, pPIBONOREC);
         cStmt.setObject(46, pPIMPAVISO);
         cStmt.setObject(47, pPIMPCONTADO);
         cStmt.setObject(48, pPPCTCONTADO);
         cStmt.setObject(49, pPPCTGASTOS);
         cStmt.setObject(50, pPPTASAAJUSTE);
         cStmt.setObject(51, pPICAPCOASEG);
         cStmt.setObject(52, pPICOSTOFIJO);
         cStmt.setObject(53, pPPCOMISINTERM);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(54, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(54));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_SET_OBJETOTRAMOSREA (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPITOTTRA, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPCFREBOR, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIXLPRIO, java.math.BigDecimal pPIXLEXCE, java.math.BigDecimal pPPSLPRIO, java.math.BigDecimal pPPSLEXCE, java.math.BigDecimal pPNCESION, java.sql.Date pPFULTBOR, java.math.BigDecimal pPIMAXPLO, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNSEGCON, java.math.BigDecimal pPIMINXL, java.math.BigDecimal pPIDEPXL, java.math.BigDecimal pPNSEGVER, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPNCTRXL, java.math.BigDecimal pPNVERXL, java.math.BigDecimal pPIPMD, java.math.BigDecimal pPCFREPMD, java.math.BigDecimal pPCAPLIXL, java.math.BigDecimal pPPLIMGAS, java.math.BigDecimal pPPLIMINX, java.math.BigDecimal pPIDAA, java.math.BigDecimal pPILAA, java.math.BigDecimal pPCTPRIMAXL, java.math.BigDecimal pPIPRIMAFIJAXL, java.math.BigDecimal pPIPRIMAESTIMADA, java.math.BigDecimal pPCAPLICTASAXL, java.math.BigDecimal pPCTIPTASAXL, java.math.BigDecimal pPCTRAMOTASAXL, java.math.BigDecimal pPPCTPDXL, java.math.BigDecimal pPCFORPAGPDXL, java.math.BigDecimal pPPCTMINXL, java.math.BigDecimal pPPCTPB, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPCREPOS, java.math.BigDecimal pPIBONOREC, java.math.BigDecimal pPIMPAVISO, java.math.BigDecimal pPIMPCONTADO, java.math.BigDecimal pPPCTCONTADO, java.math.BigDecimal pPPCTGASTOS, java.math.BigDecimal pPPTASAAJUSTE, java.math.BigDecimal pPICAPCOASEG, java.math.BigDecimal pPICOSTOFIJO, java.math.BigDecimal pPPCOMISINTERM) throws Exception {
         return this.callPAC_IAX_REA__F_SET_OBJETOTRAMOSREA(pPNVERSIO, pPSCONTRA, pPCTRAMO, pPITOTTRA, pPNPLENOS, pPCFREBOR, pPPLOCAL, pPIXLPRIO, pPIXLEXCE, pPPSLPRIO, pPPSLEXCE, pPNCESION, pPFULTBOR, pPIMAXPLO, pPNORDEN, pPNSEGCON, pPIMINXL, pPIDEPXL, pPNSEGVER, pPPTASAXL, pPNCTRXL, pPNVERXL, pPIPMD, pPCFREPMD, pPCAPLIXL, pPPLIMGAS, pPPLIMINX, pPIDAA, pPILAA, pPCTPRIMAXL, pPIPRIMAFIJAXL, pPIPRIMAESTIMADA, pPCAPLICTASAXL, pPCTIPTASAXL, pPCTRAMOTASAXL, pPPCTPDXL, pPCFORPAGPDXL, pPPCTMINXL, pPPCTPB, pPNANYOSLOSS, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPCREPOS, pPIBONOREC, pPIMPAVISO, pPIMPCONTADO, pPPCTCONTADO, pPPCTGASTOS, pPPTASAAJUSTE, pPICAPCOASEG, pPICOSTOFIJO, pPPCOMISINTERM);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_SET_OBJETOTRAMOSREA
    //--START-PAC_IAX_REA.F_SET_REAFORMULA(PSCONTRA,  PNVERSION,  PCRAMO,  PSPRODUC,  PCACTIVI,  PCGARANT,  PCCAMPO,  PCLAVE)

    private HashMap callPAC_IAX_REA__F_SET_REAFORMULA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO, java.math.BigDecimal pPCLAVE) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_REAFORMULA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSION", "pPCRAMO", "pPSPRODUC", "pPCACTIVI", "pPCGARANT", "pPCCAMPO", "pPCLAVE" }, new Object[] { pPSCONTRA, pPNVERSION, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSION);
        cStmt.setObject(4, pPCRAMO);
        cStmt.setObject(5, pPSPRODUC);
        cStmt.setObject(6, pPCACTIVI);
        cStmt.setObject(7, pPCGARANT);
        cStmt.setObject(8, pPCCAMPO);
        cStmt.setObject(9, pPCLAVE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(10));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_REAFORMULA(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSION, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCACTIVI, java.math.BigDecimal pPCGARANT, String pPCCAMPO, java.math.BigDecimal pPCLAVE) throws Exception {
        return this.callPAC_IAX_REA__F_SET_REAFORMULA(pPSCONTRA, pPNVERSION, pPCRAMO, pPSPRODUC, pPCACTIVI, pPCGARANT, pPCCAMPO, pPCLAVE); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_REAFORMULA
    //--START-PAC_IAX_REA.F_SET_REPOSICIONES(PCCODIGO,  PCIDIOMA,  PTDESCRIPCION)

    private HashMap callPAC_IAX_REA__F_SET_REPOSICIONES(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA, String pPTDESCRIPCION) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_REPOSICIONES(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCCODIGO", "pPCIDIOMA", "pPTDESCRIPCION" }, new Object[] { pPCCODIGO, pPCIDIOMA, pPTDESCRIPCION });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCCODIGO);
        cStmt.setObject(3, pPCIDIOMA);
        cStmt.setObject(4, pPTDESCRIPCION);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_REPOSICIONES(java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPCIDIOMA, String pPTDESCRIPCION) throws Exception {
        return this.callPAC_IAX_REA__F_SET_REPOSICIONES(pPCCODIGO, pPCIDIOMA, pPTDESCRIPCION); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_REPOSICIONES
    //--START-PAC_IAX_REA.F_SET_REPOSICIONES_DET(PCMODO,  PCCODIGO,  PNORDEN,  PICAPACIDAD,  PPTASA)

    private HashMap callPAC_IAX_REA__F_SET_REPOSICIONES_DET(java.math.BigDecimal pPCMODO, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPICAPACIDAD, java.math.BigDecimal pPPTASA) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_REPOSICIONES_DET(?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPCMODO", "pPCCODIGO", "pPNORDEN", "pPICAPACIDAD", "pPPTASA" }, new Object[] { pPCMODO, pPCCODIGO, pPNORDEN, pPICAPACIDAD, pPPTASA });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCMODO);
        cStmt.setObject(3, pPCCODIGO);
        cStmt.setObject(4, pPNORDEN);
        cStmt.setObject(5, pPICAPACIDAD);
        cStmt.setObject(6, pPPTASA);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_REPOSICIONES_DET(java.math.BigDecimal pPCMODO, java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPICAPACIDAD, java.math.BigDecimal pPPTASA) throws Exception {
        return this.callPAC_IAX_REA__F_SET_REPOSICIONES_DET(pPCMODO, pPCCODIGO, pPNORDEN, pPICAPACIDAD, pPPTASA); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_REPOSICIONES_DET
        //--START-PAC_IAX_REA.F_SET_TRAMOS(PNVERSIO,  PSCONTRA,  PCTRAMO,  PITOTTRA,  PNPLENOS,  PCFREBOR,  PPLOCAL,  PIXLPRIO,  PIXLEXCE,  PPSLPRIO,  PPSLEXCE,  PNCESION,  PFULTBOR,  PIMAXPLO,  PNORDEN,  PNSEGCON,  PNSEGVER,  PIMINXL,  PIDEPXL,  PNCTRXL,  PNVERXL,  PPTASAXL,  PIPMD,  PCFREPMD,  PCAPLIXL,  PPLIMGAS,  PPLIMINX,  PIDAA,  PILAA,  PCTPRIMAXL,  PIPRIMAFIJAXL,  PIPRIMAESTIMADA,  PCAPLICTASAXL,  PCTIPTASAXL,  PCTRAMOTASAXL,  PPCTPDXL,  PCFORPAGPDXL,  PPCTMINXL,  PPCTPB,  PNANYOSLOSS,  PCLOSSCORRIDOR,  PCCAPPEDRATIO,  PCREPOS,  PIBONOREC,  PIMPAVISO,  PIMPCONTADO,  PPCTCONTADO,  PPCTGASTOS,  PPTASAAJUSTE,  PICAPCOASEG,  PICOSTOFIJO,  PPCOMISINTERM)
		
        //BUG/IAXIS-14001 QUITAR CAMPO IPRIO YA QUE EL CAMPO PRIORIDAD YA EXISTIA Y ES EL CAMPO IXLPRIO 
      private HashMap callPAC_IAX_REA__F_SET_TRAMOS (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPITOTTRA, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPCFREBOR, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIXLPRIO, java.math.BigDecimal pPIXLEXCE, java.math.BigDecimal pPPSLPRIO, java.math.BigDecimal pPPSLEXCE, java.math.BigDecimal pPNCESION, java.sql.Date pPFULTBOR, java.math.BigDecimal pPIMAXPLO, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNSEGCON, java.math.BigDecimal pPNSEGVER, java.math.BigDecimal pPIMINXL, java.math.BigDecimal pPIDEPXL, java.math.BigDecimal pPNCTRXL, java.math.BigDecimal pPNVERXL, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPIPMD, java.math.BigDecimal pPCFREPMD, java.math.BigDecimal pPCAPLIXL, java.math.BigDecimal pPPLIMGAS, java.math.BigDecimal pPPLIMINX, java.math.BigDecimal pPIDAA, java.math.BigDecimal pPILAA, java.math.BigDecimal pPCTPRIMAXL, java.math.BigDecimal pPIPRIMAFIJAXL, java.math.BigDecimal pPIPRIMAESTIMADA, java.math.BigDecimal pPCAPLICTASAXL, java.math.BigDecimal pPCTIPTASAXL, java.math.BigDecimal pPCTRAMOTASAXL, java.math.BigDecimal pPPCTPDXL, java.math.BigDecimal pPCFORPAGPDXL, java.math.BigDecimal pPPCTMINXL, java.math.BigDecimal pPPCTPB, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPCREPOS, java.math.BigDecimal pPIBONOREC, java.math.BigDecimal pPIMPAVISO, java.math.BigDecimal pPIMPCONTADO, java.math.BigDecimal pPPCTCONTADO, java.math.BigDecimal pPPCTGASTOS, java.math.BigDecimal pPPTASAAJUSTE, java.math.BigDecimal pPICAPCOASEG, java.math.BigDecimal pPICOSTOFIJO, java.math.BigDecimal pPPCOMISINTERM, java.math.BigDecimal pPTRAMO, java.math.BigDecimal pPREEST//--,java.math.BigDecimal pPIPRIO
    		  ) throws Exception {
          String callQuery="{?=call PAC_IAX_REA.F_SET_TRAMOS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
          
          logCall(callQuery, new String[] {"pPNVERSIO", "pPSCONTRA", "pPCTRAMO", "pPITOTTRA", "pPNPLENOS", "pPCFREBOR", "pPPLOCAL", "pPIXLPRIO", "pPIXLEXCE", "pPPSLPRIO", "pPPSLEXCE", "pPNCESION", "pPFULTBOR", "pPIMAXPLO", "pPNORDEN", "pPNSEGCON", "pPNSEGVER", "pPIMINXL", "pPIDEPXL", "pPNCTRXL", "pPNVERXL", "pPPTASAXL", "pPIPMD", "pPCFREPMD", "pPCAPLIXL", "pPPLIMGAS", "pPPLIMINX", "pPIDAA", "pPILAA", "pPCTPRIMAXL", "pPIPRIMAFIJAXL", "pPIPRIMAESTIMADA", "pPCAPLICTASAXL", "pPCTIPTASAXL", "pPCTRAMOTASAXL", "pPPCTPDXL", "pPCFORPAGPDXL", "pPPCTMINXL", "pPPCTPB", "pPNANYOSLOSS", "pPCLOSSCORRIDOR", "pPCCAPPEDRATIO", "pPCREPOS", "pPIBONOREC", "pPIMPAVISO", "pPIMPCONTADO", "pPPCTCONTADO", "pPPCTGASTOS", "pPPTASAAJUSTE", "pPICAPCOASEG", "pPICOSTOFIJO", "pPPCOMISINTERM", "pPTRAMO", "pPREEST"}, new Object[] {pPNVERSIO, pPSCONTRA, pPCTRAMO, pPITOTTRA, pPNPLENOS, pPCFREBOR, pPPLOCAL, pPIXLPRIO, pPIXLEXCE, pPPSLPRIO, pPPSLEXCE, pPNCESION, pPFULTBOR, pPIMAXPLO, pPNORDEN, pPNSEGCON, pPNSEGVER, pPIMINXL, pPIDEPXL, pPNCTRXL, pPNVERXL, pPPTASAXL, pPIPMD, pPCFREPMD, pPCAPLIXL, pPPLIMGAS, pPPLIMINX, pPIDAA, pPILAA, pPCTPRIMAXL, pPIPRIMAFIJAXL, pPIPRIMAESTIMADA, pPCAPLICTASAXL, pPCTIPTASAXL, pPCTRAMOTASAXL, pPPCTPDXL, pPCFORPAGPDXL, pPPCTMINXL, pPPCTPB, pPNANYOSLOSS, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPCREPOS, pPIBONOREC, pPIMPAVISO, pPIMPCONTADO, pPPCTCONTADO, pPPCTGASTOS, pPPTASAAJUSTE, pPICAPCOASEG, pPICOSTOFIJO, pPPCOMISINTERM, pPTRAMO, pPREEST});
          CallableStatement cStmt=conn.prepareCall(callQuery);
          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
          cStmt.setObject(2, pPNVERSIO);
          cStmt.setObject(3, pPSCONTRA);
          cStmt.setObject(4, pPCTRAMO);
          cStmt.setObject(5, pPITOTTRA);
          cStmt.setObject(6, pPNPLENOS);
          cStmt.setObject(7, pPCFREBOR);
          cStmt.setObject(8, pPPLOCAL);
          cStmt.setObject(9, pPIXLPRIO);
          cStmt.setObject(10, pPIXLEXCE);
          cStmt.setObject(11, pPPSLPRIO);
          cStmt.setObject(12, pPPSLEXCE);
          cStmt.setObject(13, pPNCESION);
          cStmt.setObject(14, pPFULTBOR);
          cStmt.setObject(15, pPIMAXPLO);
          cStmt.setObject(16, pPNORDEN);
          cStmt.setObject(17, pPNSEGCON);
          cStmt.setObject(18, pPNSEGVER);
          cStmt.setObject(19, pPIMINXL);
          cStmt.setObject(20, pPIDEPXL);
          cStmt.setObject(21, pPNCTRXL);
          cStmt.setObject(22, pPNVERXL);
          cStmt.setObject(23, pPPTASAXL);
          cStmt.setObject(24, pPIPMD);
          cStmt.setObject(25, pPCFREPMD);
          cStmt.setObject(26, pPCAPLIXL);
          cStmt.setObject(27, pPPLIMGAS);
          cStmt.setObject(28, pPPLIMINX);
          cStmt.setObject(29, pPIDAA);
          cStmt.setObject(30, pPILAA);
          cStmt.setObject(31, pPCTPRIMAXL);
          cStmt.setObject(32, pPIPRIMAFIJAXL);
          cStmt.setObject(33, pPIPRIMAESTIMADA);
          cStmt.setObject(34, pPCAPLICTASAXL);
          cStmt.setObject(35, pPCTIPTASAXL);
          cStmt.setObject(36, pPCTRAMOTASAXL);
          cStmt.setObject(37, pPPCTPDXL);
          cStmt.setObject(38, pPCFORPAGPDXL);
          cStmt.setObject(39, pPPCTMINXL);
          cStmt.setObject(40, pPPCTPB);
          cStmt.setObject(41, pPNANYOSLOSS);
          cStmt.setObject(42, pPCLOSSCORRIDOR);
          cStmt.setObject(43, pPCCAPPEDRATIO);
          cStmt.setObject(44, pPCREPOS);
          cStmt.setObject(45, pPIBONOREC);
          cStmt.setObject(46, pPIMPAVISO);
          cStmt.setObject(47, pPIMPCONTADO);
          cStmt.setObject(48, pPPCTCONTADO);
          cStmt.setObject(49, pPPCTGASTOS);
          cStmt.setObject(50, pPPTASAAJUSTE);
          cStmt.setObject(51, pPICAPCOASEG);
          cStmt.setObject(52, pPICOSTOFIJO);
          cStmt.setObject(53, pPPCOMISINTERM);
          cStmt.setObject(54, pPTRAMO);//BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, adicioma pPTRAMO
          cStmt.setObject(55, pPREEST);//BUG CONF-1048  Fecha (29/08/2017) - HRE - Contratos no proporcionales
          //cStmt.setObject(56, pPIPRIO);//Agregar campo prioridad para tramo IAXIS-4611
          cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
          cStmt.registerOutParameter(56, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"  //BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, asigna posicion 55
          cStmt.execute();
          HashMap retVal=new HashMap();
          try {
              retVal.put("RETURN", cStmt.getObject(1));
          }
          catch (SQLException e) {
              retVal.put("RETURN", null);
          }
          try {
              retVal.put("MENSAJES", cStmt.getObject(55));//BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, asigna posicion 55
          }
          catch (SQLException e) {
              retVal.put("MENSAJES", null);
          }
          retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
          cStmt.close();//AXIS-WLS1SERVER-Ready
          
          return retVal;
      }

      //BUG/IAXIS-14001 QUITAR CAMPO IPRIO YA QUE EL CAMPO PRIORIDAD YA EXISTIA Y ES EL CAMPO IXLPRIO
      public HashMap ejecutaPAC_IAX_REA__F_SET_TRAMOS (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPITOTTRA, java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPCFREBOR, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIXLPRIO, java.math.BigDecimal pPIXLEXCE, java.math.BigDecimal pPPSLPRIO, java.math.BigDecimal pPPSLEXCE, java.math.BigDecimal pPNCESION, java.sql.Date pPFULTBOR, java.math.BigDecimal pPIMAXPLO, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPNSEGCON, java.math.BigDecimal pPNSEGVER, java.math.BigDecimal pPIMINXL, java.math.BigDecimal pPIDEPXL, java.math.BigDecimal pPNCTRXL, java.math.BigDecimal pPNVERXL, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPIPMD, java.math.BigDecimal pPCFREPMD, java.math.BigDecimal pPCAPLIXL, java.math.BigDecimal pPPLIMGAS, java.math.BigDecimal pPPLIMINX, java.math.BigDecimal pPIDAA, java.math.BigDecimal pPILAA, java.math.BigDecimal pPCTPRIMAXL, java.math.BigDecimal pPIPRIMAFIJAXL, java.math.BigDecimal pPIPRIMAESTIMADA, java.math.BigDecimal pPCAPLICTASAXL, java.math.BigDecimal pPCTIPTASAXL, java.math.BigDecimal pPCTRAMOTASAXL, java.math.BigDecimal pPPCTPDXL, java.math.BigDecimal pPCFORPAGPDXL, java.math.BigDecimal pPPCTMINXL, java.math.BigDecimal pPPCTPB, java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCLOSSCORRIDOR, java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPCREPOS, java.math.BigDecimal pPIBONOREC, java.math.BigDecimal pPIMPAVISO, java.math.BigDecimal pPIMPCONTADO, java.math.BigDecimal pPPCTCONTADO, java.math.BigDecimal pPPCTGASTOS, java.math.BigDecimal pPPTASAAJUSTE, java.math.BigDecimal pPICAPCOASEG, java.math.BigDecimal pPICOSTOFIJO, java.math.BigDecimal pPPCOMISINTERM, java.math.BigDecimal pPTRAMO, java.math.BigDecimal pPREEST) throws Exception {//BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, adicioma pPTRAMO - //BUG CONF-1048  Fecha (29/08/2017) - HRE - Contratos no proporcionales
          return this.callPAC_IAX_REA__F_SET_TRAMOS(pPNVERSIO, pPSCONTRA, pPCTRAMO, pPITOTTRA, pPNPLENOS, pPCFREBOR, pPPLOCAL, pPIXLPRIO, pPIXLEXCE, pPPSLPRIO, pPPSLEXCE, pPNCESION, pPFULTBOR, pPIMAXPLO, pPNORDEN, pPNSEGCON, pPNSEGVER, pPIMINXL, pPIDEPXL, pPNCTRXL, pPNVERXL, pPPTASAXL, pPIPMD, pPCFREPMD, pPCAPLIXL, pPPLIMGAS, pPPLIMINX, pPIDAA, pPILAA, pPCTPRIMAXL, pPIPRIMAFIJAXL, pPIPRIMAESTIMADA, pPCAPLICTASAXL, pPCTIPTASAXL, pPCTRAMOTASAXL, pPPCTPDXL, pPCFORPAGPDXL, pPPCTMINXL, pPPCTPB, pPNANYOSLOSS, pPCLOSSCORRIDOR, pPCCAPPEDRATIO, pPCREPOS, pPIBONOREC, pPIMPAVISO, pPIMPCONTADO, pPPCTCONTADO, pPPCTGASTOS, pPPTASAAJUSTE, pPICAPCOASEG, pPICOSTOFIJO, pPPCOMISINTERM, pPTRAMO, pPREEST);//AXIS-WLS1SERVER-Ready //BUG CONF-250  Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3, adicioma pPTRAMO //BUG CONF-1048  Fecha (29/08/2017) - HRE - Contratos no proporcionales
      }
      //--END-PAC_IAX_REA.F_SET_TRAMOS
    //--START-PAC_IAX_REA.F_SET_T_TRAMO_MEM(PSCONTRA,  PNVERSIO)

    private HashMap callPAC_IAX_REA__F_SET_T_TRAMO_MEM(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_SET_T_TRAMO_MEM(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSCONTRA", "pPNVERSIO" }, new Object[] { pPSCONTRA, pPNVERSIO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSCONTRA);
        cStmt.setObject(3, pPNVERSIO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_SET_T_TRAMO_MEM(java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO) throws Exception {
        return this.callPAC_IAX_REA__F_SET_T_TRAMO_MEM(pPSCONTRA, pPNVERSIO); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_SET_T_TRAMO_MEM
     //--START-PAC_IAX_REA.F_GET_CAB_MOVCTA(PCEMPRES,  PSPRODUC,  PCCOMPANI,  PSCONTRA,  PNVERSIO,  PCTRAMO,  PFCIERRE,  PCESTADO,  PNPOLIZA,  PCIAPROP,  PSPAGREA)
     private HashMap callPAC_IAX_REA__F_GET_CAB_MOVCTA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPSPAGREA) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_GET_CAB_MOVCTA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPCEMPRES", "pPSPRODUC", "pPCCOMPANI", "pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPFCIERRE", "pPCESTADO", "pPNPOLIZA", "pPCIAPROP", "pPSPAGREA"}, new Object[] {pPCEMPRES, pPSPRODUC, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPCESTADO, pPNPOLIZA, pPCIAPROP, pPSPAGREA});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPCEMPRES);
         cStmt.setObject(3, pPSPRODUC);
         cStmt.setObject(4, pPCCOMPANI);
         cStmt.setObject(5, pPSCONTRA);
         cStmt.setObject(6, pPNVERSIO);
         cStmt.setObject(7, pPCTRAMO);
         cStmt.setObject(8, pPFCIERRE);
         cStmt.setObject(9, pPCESTADO);
         cStmt.setObject(10, pPNPOLIZA);
         cStmt.setObject(11, pPCIAPROP);
         cStmt.setObject(12, pPSPAGREA);
         cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
         cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(13));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_GET_CAB_MOVCTA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPSPAGREA) throws Exception {
         return this.callPAC_IAX_REA__F_GET_CAB_MOVCTA(pPCEMPRES, pPSPRODUC, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPCESTADO, pPNPOLIZA, pPCIAPROP, pPSPAGREA);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_GET_CAB_MOVCTA



     //--START-PAC_IAX_REA.F_GET_CTATECNICA(PCEMPRES,  PCRAMO,  PSPRODUC,  PCCORRED,  PCCOMPANI,  PSCONTRA,  PNVERSIO,  PCTRAMO,  PFCIERRE,  PNPOLIZA,  PNCERTIF,  PNSINIES,  PCESTADO,  PCIAPROP,  PSPROCES)
     private HashMap callPAC_IAX_REA__F_GET_CTATECNICA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPSPROCES) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_GET_CTATECNICA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPCEMPRES", "pPCRAMO", "pPSPRODUC", "pPCCORRED", "pPCCOMPANI", "pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPFCIERRE", "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPCESTADO", "pPCIAPROP", "pPSPROCES"}, new Object[] {pPCEMPRES, pPCRAMO, pPSPRODUC, pPCCORRED, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTADO, pPCIAPROP, pPSPROCES});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPCEMPRES);
         cStmt.setObject(3, pPCRAMO);
         cStmt.setObject(4, pPSPRODUC);
         cStmt.setObject(5, pPCCORRED);
         cStmt.setObject(6, pPCCOMPANI);
         cStmt.setObject(7, pPSCONTRA);
         cStmt.setObject(8, pPNVERSIO);
         cStmt.setObject(9, pPCTRAMO);
         cStmt.setObject(10, pPFCIERRE);
         cStmt.setObject(11, pPNPOLIZA);
         cStmt.setObject(12, pPNCERTIF);
         cStmt.setObject(13, pPNSINIES);
         cStmt.setObject(14, pPCESTADO);
         cStmt.setObject(15, pPCIAPROP);
         cStmt.setObject(16, pPSPROCES);
         cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
         cStmt.registerOutParameter(17, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(17));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_GET_CTATECNICA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPCRAMO, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPSPROCES) throws Exception {
         return this.callPAC_IAX_REA__F_GET_CTATECNICA(pPCEMPRES, pPCRAMO, pPSPRODUC, pPCCORRED, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCESTADO, pPCIAPROP, pPSPROCES);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_GET_CTATECNICA


       //--START-PAC_IAX_REA.F_GET_MOVCTATECNICA(PCEMPRES,  PSPRODUC,  PCCOMPANI,  PSCONTRA,  PNVERSIO,  PCTRAMO,  PFCIERRE,  PCESTADO,  PNPOLIZA,  PCIAPROP,  PSPAGREA,  PCHECKALL)
            private HashMap callPAC_IAX_REA__F_GET_MOVCTATECNICA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPSPAGREA, java.math.BigDecimal pPCHECKALL) throws Exception {
                String callQuery="{?=call PAC_IAX_REA.F_GET_MOVCTATECNICA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                
                logCall(callQuery, new String[] {"pPCEMPRES", "pPSPRODUC", "pPCCOMPANI", "pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPFCIERRE", "pPCESTADO", "pPNPOLIZA", "pPCIAPROP", "pPSPAGREA", "pPCHECKALL"}, new Object[] {pPCEMPRES, pPSPRODUC, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPCESTADO, pPNPOLIZA, pPCIAPROP, pPSPAGREA, pPCHECKALL});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPCEMPRES);
                cStmt.setObject(3, pPSPRODUC);
                cStmt.setObject(4, pPCCOMPANI);
                cStmt.setObject(5, pPSCONTRA);
                cStmt.setObject(6, pPNVERSIO);
                cStmt.setObject(7, pPCTRAMO);
                cStmt.setObject(8, pPFCIERRE);
                cStmt.setObject(9, pPCESTADO);
                cStmt.setObject(10, pPNPOLIZA);
                cStmt.setObject(11, pPCIAPROP);
                cStmt.setObject(12, pPSPAGREA);
                cStmt.setObject(13, pPCHECKALL);
                cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
                cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                cStmt.execute();
                HashMap retVal=new HashMap();
                try {
                    retVal.put("RETURN", cStmt.getObject(1));
                }
                catch (SQLException e) {
                    retVal.put("RETURN", null);
                }
                try {
                    retVal.put("MENSAJES", cStmt.getObject(14));
                }
                catch (SQLException e) {
                    retVal.put("MENSAJES", null);
                }
                retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                cStmt.close();//AXIS-WLS1SERVER-Ready
                
                return retVal;
            }

            public HashMap ejecutaPAC_IAX_REA__F_GET_MOVCTATECNICA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPSPAGREA, java.math.BigDecimal pPCHECKALL) throws Exception {
                return this.callPAC_IAX_REA__F_GET_MOVCTATECNICA(pPCEMPRES, pPSPRODUC, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPCESTADO, pPNPOLIZA, pPCIAPROP, pPSPAGREA, pPCHECKALL);//AXIS-WLS1SERVER-Ready 
            }
            //--END-PAC_IAX_REA.F_GET_MOVCTATECNICA




     //--START-PAC_IAX_REA.F_DEL_MOVCTATECNICA(PCEMPRES,  PSPRODUC,  PCCOMPANI,  PSCONTRA,  PNVERSIO,  PCTRAMO,  PFCIERRE,  PCCONCEP,  PNNUMLIN,  PNPOLIZA,  PNCERTIF,  PNSINIES,  PCIAPROP)
     private HashMap callPAC_IAX_REA__F_DEL_MOVCTATECNICA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCIAPROP) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_DEL_MOVCTATECNICA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPCEMPRES", "pPSPRODUC", "pPCCOMPANI", "pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPFCIERRE", "pPCCONCEP", "pPNNUMLIN", "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPCIAPROP"}, new Object[] {pPCEMPRES, pPSPRODUC, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPCCONCEP, pPNNUMLIN, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCIAPROP});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPCEMPRES);
         cStmt.setObject(3, pPSPRODUC);
         cStmt.setObject(4, pPCCOMPANI);
         cStmt.setObject(5, pPSCONTRA);
         cStmt.setObject(6, pPNVERSIO);
         cStmt.setObject(7, pPCTRAMO);
         cStmt.setObject(8, pPFCIERRE);
         cStmt.setObject(9, pPCCONCEP);
         cStmt.setObject(10, pPNNUMLIN);
         cStmt.setObject(11, pPNPOLIZA);
         cStmt.setObject(12, pPNCERTIF);
         cStmt.setObject(13, pPNSINIES);
         cStmt.setObject(14, pPCIAPROP);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(15, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(15));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_DEL_MOVCTATECNICA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPCIAPROP) throws Exception {
         return this.callPAC_IAX_REA__F_DEL_MOVCTATECNICA(pPCEMPRES, pPSPRODUC, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPCCONCEP, pPNNUMLIN, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPCIAPROP);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_DEL_MOVCTATECNICA



      //--START-PAC_IAX_REA.F_SET_MOVCTATECNICA(PCCOMPANI,  PNVERSIO,  PSCONTRA,  PCTRAMO,  PNNUMLIN,  PFMOVIMI,  PFEFECTO,  PCCONCEP,  PCDEBHAB,  PIIMPORT,  PCESTADO,  PSPROCES,  PSCESREA,  PIIMPORT_MONCON,  PFCAMBIO,  PCEMPRES,  PDESCRIP,  PDOCUMEN,  PNPOLIZA,  PNCERTIF,  PNSINIES,  PSPRODUC,  PMODO,  PSIDEPAG,  PCIAPROP)
      private HashMap callPAC_IAX_REA__F_SET_MOVCTATECNICA (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPNNUMLIN, java.sql.Date pPFMOVIMI, java.sql.Date pPFEFECTO, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCDEBHAB, java.math.BigDecimal pPIIMPORT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPSCESREA, java.math.BigDecimal pPIIMPORT_MONCON, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCEMPRES, String pPDESCRIP, String pPDOCUMEN, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPMODO, java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPCIAPROP) throws Exception {
          String callQuery="{?=call PAC_IAX_REA.F_SET_MOVCTATECNICA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
          
          logCall(callQuery, new String[] {"pPCCOMPANI", "pPNVERSIO", "pPSCONTRA", "pPCTRAMO", "pPNNUMLIN", "pPFMOVIMI", "pPFEFECTO", "pPCCONCEP", "pPCDEBHAB", "pPIIMPORT", "pPCESTADO", "pPSPROCES", "pPSCESREA", "pPIIMPORT_MONCON", "pPFCAMBIO", "pPCEMPRES", "pPDESCRIP", "pPDOCUMEN", "pPNPOLIZA", "pPNCERTIF", "pPNSINIES", "pPSPRODUC", "pPMODO", "pPSIDEPAG", "pPCIAPROP"}, new Object[] {pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPNNUMLIN, pPFMOVIMI, pPFEFECTO, pPCCONCEP, pPCDEBHAB, pPIIMPORT, pPCESTADO, pPSPROCES, pPSCESREA, pPIIMPORT_MONCON, pPFCAMBIO, pPCEMPRES, pPDESCRIP, pPDOCUMEN, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPSPRODUC, pPMODO, pPSIDEPAG, pPCIAPROP});
          CallableStatement cStmt=conn.prepareCall(callQuery);
          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
          cStmt.setObject(2, pPCCOMPANI);
          cStmt.setObject(3, pPNVERSIO);
          cStmt.setObject(4, pPSCONTRA);
          cStmt.setObject(5, pPCTRAMO);
          cStmt.setObject(6, pPNNUMLIN);
          cStmt.setObject(7, pPFMOVIMI);
          cStmt.setObject(8, pPFEFECTO);
          cStmt.setObject(9, pPCCONCEP);
          cStmt.setObject(10, pPCDEBHAB);
          cStmt.setObject(11, pPIIMPORT);
          cStmt.setObject(12, pPCESTADO);
          cStmt.setObject(13, pPSPROCES);
          cStmt.setObject(14, pPSCESREA);
          cStmt.setObject(15, pPIIMPORT_MONCON);
          cStmt.setObject(16, pPFCAMBIO);
          cStmt.setObject(17, pPCEMPRES);
          cStmt.setObject(18, pPDESCRIP);
          cStmt.setObject(19, pPDOCUMEN);
          cStmt.setObject(20, pPNPOLIZA);
          cStmt.setObject(21, pPNCERTIF);
          cStmt.setObject(22, pPNSINIES);
          cStmt.setObject(23, pPSPRODUC);
          cStmt.setObject(24, pPMODO);
          cStmt.setObject(26, pPSIDEPAG);
          cStmt.setObject(27, pPCIAPROP);
          cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
          cStmt.registerOutParameter(25, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
          cStmt.execute();
          HashMap retVal=new HashMap();
          try {
              retVal.put("RETURN", cStmt.getObject(1));
          }
          catch (SQLException e) {
              retVal.put("RETURN", null);
          }
          try {
              retVal.put("MENSAJES", cStmt.getObject(25));
          }
          catch (SQLException e) {
              retVal.put("MENSAJES", null);
          }
          retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
          cStmt.close();//AXIS-WLS1SERVER-Ready
          
          return retVal;
      }

      public HashMap ejecutaPAC_IAX_REA__F_SET_MOVCTATECNICA (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPNNUMLIN, java.sql.Date pPFMOVIMI, java.sql.Date pPFEFECTO, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCDEBHAB, java.math.BigDecimal pPIIMPORT, java.math.BigDecimal pPCESTADO, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPSCESREA, java.math.BigDecimal pPIIMPORT_MONCON, java.sql.Date pPFCAMBIO, java.math.BigDecimal pPCEMPRES, String pPDESCRIP, String pPDOCUMEN, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPMODO, java.math.BigDecimal pPSIDEPAG, java.math.BigDecimal pPCIAPROP) throws Exception {
          return this.callPAC_IAX_REA__F_SET_MOVCTATECNICA(pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPNNUMLIN, pPFMOVIMI, pPFEFECTO, pPCCONCEP, pPCDEBHAB, pPIIMPORT, pPCESTADO, pPSPROCES, pPSCESREA, pPIIMPORT_MONCON, pPFCAMBIO, pPCEMPRES, pPDESCRIP, pPDOCUMEN, pPNPOLIZA, pPNCERTIF, pPNSINIES, pPSPRODUC, pPMODO, pPSIDEPAG, pPCIAPROP);//AXIS-WLS1SERVER-Ready 
      }
      //--END-PAC_IAX_REA.F_SET_MOVCTATECNICA


     //--START-PAC_IAX_REA.F_SET_RETEN_LIQUIDA(PCCOMPANI,  PNVERSIO,  PSCONTRA,  PCTRAMO,  PNNUMLIN,  PCCORRED,  PCEMPRES,  PSPRODUC,  PFCIERRE,  PESTADONEW,  PESTADOOLD)
     private HashMap callPAC_IAX_REA__F_SET_RETEN_LIQUIDA (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.sql.Date pPFCIERRE, java.math.BigDecimal pPESTADONEW, java.math.BigDecimal pPESTADOOLD) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_SET_RETEN_LIQUIDA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPCCOMPANI", "pPNVERSIO", "pPSCONTRA", "pPCTRAMO", "pPNNUMLIN", "pPCCORRED", "pPCEMPRES", "pPSPRODUC", "pPFCIERRE", "pPESTADONEW", "pPESTADOOLD"}, new Object[] {pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPNNUMLIN, pPCCORRED, pPCEMPRES, pPSPRODUC, pPFCIERRE, pPESTADONEW, pPESTADOOLD});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPCCOMPANI);
         cStmt.setObject(3, pPNVERSIO);
         cStmt.setObject(4, pPSCONTRA);
         cStmt.setObject(5, pPCTRAMO);
         cStmt.setObject(6, pPNNUMLIN);
         cStmt.setObject(7, pPCCORRED);
         cStmt.setObject(8, pPCEMPRES);
         cStmt.setObject(9, pPSPRODUC);
         cStmt.setObject(10, pPFCIERRE);
         cStmt.setObject(11, pPESTADONEW);
         cStmt.setObject(12, pPESTADOOLD);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(13));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_SET_RETEN_LIQUIDA (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPNNUMLIN, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.sql.Date pPFCIERRE, java.math.BigDecimal pPESTADONEW, java.math.BigDecimal pPESTADOOLD) throws Exception {
         return this.callPAC_IAX_REA__F_SET_RETEN_LIQUIDA(pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPNNUMLIN, pPCCORRED, pPCEMPRES, pPSPRODUC, pPFCIERRE, pPESTADONEW, pPESTADOOLD);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_SET_RETEN_LIQUIDA
     
    //--START-PAC_IAX_REA.F_LIQUIDA_CTATEC_REA(PCEMPRES,  PSPRODUC,  PCCORRED,  PCCOMPANI,  PSCONTRA,  PNVERSIO,  PCTRAMO,  PFCIERRE,  PSPROCES,  PCLIQUIDAR,  PCIAPROP,  PULTIMOREG)
      private HashMap callPAC_IAX_REA__F_LIQUIDA_CTATEC_REA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCLIQUIDAR, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPULTIMOREG) throws Exception {
          String callQuery="{?=call PAC_IAX_REA.F_LIQUIDA_CTATEC_REA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
          
          logCall(callQuery, new String[] {"pPCEMPRES", "pPSPRODUC", "pPCCORRED", "pPCCOMPANI", "pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPFCIERRE", "pPSPROCES", "pPCLIQUIDAR", "pPCIAPROP", "pPULTIMOREG"}, new Object[] {pPCEMPRES, pPSPRODUC, pPCCORRED, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPSPROCES, pPCLIQUIDAR, pPCIAPROP, pPULTIMOREG});
          CallableStatement cStmt=conn.prepareCall(callQuery);
          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
          cStmt.setObject(2, pPCEMPRES);
          cStmt.setObject(3, pPSPRODUC);
          cStmt.setObject(4, pPCCORRED);
          cStmt.setObject(5, pPCCOMPANI);
          cStmt.setObject(6, pPSCONTRA);
          cStmt.setObject(7, pPNVERSIO);
          cStmt.setObject(8, pPCTRAMO);
          cStmt.setObject(9, pPFCIERRE);
          cStmt.setObject(10, pPSPROCES);
          cStmt.setObject(11, pPCLIQUIDAR);
          cStmt.setObject(12, pPCIAPROP);
          cStmt.setObject(13, pPULTIMOREG);
          cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
          cStmt.registerOutParameter(14, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
          cStmt.execute();
          HashMap retVal=new HashMap();
          try {
              retVal.put("RETURN", cStmt.getObject(1));
          }
          catch (SQLException e) {
              retVal.put("RETURN", null);
          }
          try {
              retVal.put("MENSAJES", cStmt.getObject(14));
          }
          catch (SQLException e) {
              retVal.put("MENSAJES", null);
          }
          retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
          cStmt.close();//AXIS-WLS1SERVER-Ready
          
          return retVal;
      }

      public HashMap ejecutaPAC_IAX_REA__F_LIQUIDA_CTATEC_REA (java.math.BigDecimal pPCEMPRES, java.math.BigDecimal pPSPRODUC, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCLIQUIDAR, java.math.BigDecimal pPCIAPROP, java.math.BigDecimal pPULTIMOREG) throws Exception {
          return this.callPAC_IAX_REA__F_LIQUIDA_CTATEC_REA(pPCEMPRES, pPSPRODUC, pPCCORRED, pPCCOMPANI, pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPSPROCES, pPCLIQUIDAR, pPCIAPROP, pPULTIMOREG);//AXIS-WLS1SERVER-Ready 
      }
      //--END-PAC_IAX_REA.F_LIQUIDA_CTATEC_REA
      
    //--START-PAC_IAX_REA.F_REGISTRA_PROCESO(PFPERINI,  PCEMPRES)

    private HashMap callPAC_IAX_REA__F_REGISTRA_PROCESO(java.sql.Date pPFPERINI, java.math.BigDecimal pPCEMPRES) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_REGISTRA_PROCESO(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPFPERINI", "pPCEMPRES" }, new Object[] { pPFPERINI, pPCEMPRES });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPFPERINI);
        cStmt.setObject(3, pPCEMPRES);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNPROCESO"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("PNPROCESO", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("PNPROCESO", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_REA__F_REGISTRA_PROCESO(java.sql.Date pPFPERINI, java.math.BigDecimal pPCEMPRES) throws Exception {
        return this.callPAC_IAX_REA__F_REGISTRA_PROCESO(pPFPERINI, pPCEMPRES); //AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_REA.F_REGISTRA_PROCESO
    
     //--START-PAC_IAX_REA.F_GET_MOVMANUAL_REA(PSCONTRA,  PNVERSIO,  PCTRAMO,  PFCIERRE,  PTDESCRIP,  PNIDENTIF,  PCCONCEP,  PCDEBHAB,  PIIMPORT,  PNSINIES,  PNPOLIZA,  PNCERTIF,  PCEVENTO,  PCGARANT,  PNID)
     private HashMap callPAC_IAX_REA__F_GET_MOVMANUAL_REA (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, String pPTDESCRIP, String pPNIDENTIF, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCDEBHAB, java.math.BigDecimal pPIIMPORT, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, String pPCEVENTO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNID) throws Exception {
         String callQuery="{?=call PAC_IAX_REA.F_GET_MOVMANUAL_REA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPSCONTRA", "pPNVERSIO", "pPCTRAMO", "pPFCIERRE", "pPTDESCRIP", "pPNIDENTIF", "pPCCONCEP", "pPCDEBHAB", "pPIIMPORT", "pPNSINIES", "pPNPOLIZA", "pPNCERTIF", "pPCEVENTO", "pPCGARANT", "pPNID"}, new Object[] {pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPTDESCRIP, pPNIDENTIF, pPCCONCEP, pPCDEBHAB, pPIIMPORT, pPNSINIES, pPNPOLIZA, pPNCERTIF, pPCEVENTO, pPCGARANT, pPNID});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSCONTRA);
         cStmt.setObject(3, pPNVERSIO);
         cStmt.setObject(4, pPCTRAMO);
         cStmt.setObject(5, pPFCIERRE);
         cStmt.setObject(6, pPTDESCRIP);
         cStmt.setObject(7, pPNIDENTIF);
         cStmt.setObject(8, pPCCONCEP);
         cStmt.setObject(9, pPCDEBHAB);
         cStmt.setObject(10, pPIIMPORT);
         cStmt.setObject(11, pPNSINIES);
         cStmt.setObject(12, pPNPOLIZA);
         cStmt.setObject(13, pPNCERTIF);
         cStmt.setObject(14, pPCEVENTO);
         cStmt.setObject(15, pPCGARANT);
         cStmt.setObject(16, pPNID);
         cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
         cStmt.registerOutParameter(17, java.sql.Types.NUMERIC); // Valor de "PNIDOUT"
         cStmt.registerOutParameter(18, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
         cStmt.execute();
         HashMap retVal=new HashMap();
         try {
             retVal.put("RETURN", cStmt.getObject(1));
         }
         catch (SQLException e) {
             retVal.put("RETURN", null);
         }
         try {
             retVal.put("PNIDOUT", cStmt.getObject(17));
         }
         catch (SQLException e) {
             retVal.put("PNIDOUT", null);
         }
         try {
             retVal.put("MENSAJES", cStmt.getObject(18));
         }
         catch (SQLException e) {
             retVal.put("MENSAJES", null);
         }
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_REA__F_GET_MOVMANUAL_REA (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.sql.Date pPFCIERRE, String pPTDESCRIP, String pPNIDENTIF, java.math.BigDecimal pPCCONCEP, java.math.BigDecimal pPCDEBHAB, java.math.BigDecimal pPIIMPORT, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pPNPOLIZA, java.math.BigDecimal pPNCERTIF, String pPCEVENTO, java.math.BigDecimal pPCGARANT, java.math.BigDecimal pPNID) throws Exception {
         return this.callPAC_IAX_REA__F_GET_MOVMANUAL_REA(pPSCONTRA, pPNVERSIO, pPCTRAMO, pPFCIERRE, pPTDESCRIP, pPNIDENTIF, pPCCONCEP, pPCDEBHAB, pPIIMPORT, pPNSINIES, pPNPOLIZA, pPNCERTIF, pPCEVENTO, pPCGARANT, pPNID);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_REA.F_GET_MOVMANUAL_REA

      //--START-PAC_IAX_REA.F_SET_MOVMANUAL_REA(PNID,  PACCION)
      private HashMap callPAC_IAX_REA__F_SET_MOVMANUAL_REA (java.math.BigDecimal pPNID, java.math.BigDecimal pPACCION) throws Exception {
          String callQuery="{?=call PAC_IAX_REA.F_SET_MOVMANUAL_REA(?, ?, ?)}";
          
          logCall(callQuery, new String[] {"pPNID", "pPACCION"}, new Object[] {pPNID, pPACCION});
          CallableStatement cStmt=conn.prepareCall(callQuery);
          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
          cStmt.setObject(2, pPNID);
          cStmt.setObject(3, pPACCION);
          cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
          cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
          cStmt.execute();
          HashMap retVal=new HashMap();
          try {
              retVal.put("RETURN", cStmt.getObject(1));
          }
          catch (SQLException e) {
              retVal.put("RETURN", null);
          }
          try {
              retVal.put("MENSAJES", cStmt.getObject(4));
          }
          catch (SQLException e) {
              retVal.put("MENSAJES", null);
          }
          retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
          cStmt.close();//AXIS-WLS1SERVER-Ready
          
          return retVal;
      }

      public HashMap ejecutaPAC_IAX_REA__F_SET_MOVMANUAL_REA (java.math.BigDecimal pPNID, java.math.BigDecimal pPACCION) throws Exception {
          return this.callPAC_IAX_REA__F_SET_MOVMANUAL_REA(pPNID, pPACCION);//AXIS-WLS1SERVER-Ready 
      }
      //--END-PAC_IAX_REA.F_SET_MOVMANUAL_REA

       //--START-PAC_IAX_REA.F_GET_MAX_COD_REPOSICION()
       private HashMap callPAC_IAX_REA__F_GET_MAX_COD_REPOSICION () throws Exception {
           String callQuery="{?=call PAC_IAX_REA.F_GET_MAX_COD_REPOSICION(?)}";
           
           logCall(callQuery, new String[] {}, new Object[] {});
           CallableStatement cStmt=conn.prepareCall(callQuery);
           String USERNAME=conn.getMetaData().getUserName().toUpperCase();
           cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
           cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
           cStmt.execute();
           HashMap retVal=new HashMap();
           try {
               retVal.put("RETURN", cStmt.getObject(1));
           }
           catch (SQLException e) {
               retVal.put("RETURN", null);
           }
           try {
               retVal.put("MENSAJES", cStmt.getObject(2));
           }
           catch (SQLException e) {
               retVal.put("MENSAJES", null);
           }
           retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
           cStmt.close();//AXIS-WLS1SERVER-Ready
           
           return retVal;
       }

       public HashMap ejecutaPAC_IAX_REA__F_GET_MAX_COD_REPOSICION () throws Exception {
           return this.callPAC_IAX_REA__F_GET_MAX_COD_REPOSICION();//AXIS-WLS1SERVER-Ready 
       }
       //--END-PAC_IAX_REA.F_GET_MAX_COD_REPOSICION

       
        //--START-PAC_IAX_REA.F_DEL_TRAMO(PNVERSIO,  PCTRAMO,  PSCONTRA)
        private HashMap callPAC_IAX_REA__F_DEL_TRAMO (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSCONTRA) throws Exception {
            String callQuery="{?=call PAC_IAX_REA.F_DEL_TRAMO(?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPNVERSIO", "pPCTRAMO", "pPSCONTRA"}, new Object[] {pPNVERSIO, pPCTRAMO, pPSCONTRA});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPNVERSIO);
            cStmt.setObject(3, pPCTRAMO);
            cStmt.setObject(4, pPSCONTRA);
            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
            cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
            cStmt.execute();
            HashMap retVal=new HashMap();
            try {
                retVal.put("RETURN", cStmt.getObject(1));
            }
            catch (SQLException e) {
                retVal.put("RETURN", null);
            }
            try {
                retVal.put("MENSAJES", cStmt.getObject(5));
            }
            catch (SQLException e) {
                retVal.put("MENSAJES", null);
            }
            retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
            
            return retVal;
        }

        public HashMap ejecutaPAC_IAX_REA__F_DEL_TRAMO (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPSCONTRA) throws Exception {
            return this.callPAC_IAX_REA__F_DEL_TRAMO(pPNVERSIO, pPCTRAMO, pPSCONTRA);//AXIS-WLS1SERVER-Ready 
        }
        //--END-PAC_IAX_REA.F_DEL_TRAMO

          //--START-PAC_IAX_REA.F_GET_FILTERED_TRAMOS(PSCONTRA,  PNVERSIO,  FILTERT,  NOT_IN)
          private HashMap callPAC_IAX_REA__F_GET_FILTERED_TRAMOS (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, String pFILTERT, java.math.BigDecimal pNOT_IN) throws Exception {
              String callQuery="{?=call PAC_IAX_REA.F_GET_FILTERED_TRAMOS(?, ?, ?, ?, ?)}";
              
              logCall(callQuery, new String[] {"pPSCONTRA", "pPNVERSIO", "pFILTERT", "pNOT_IN"}, new Object[] {pPSCONTRA, pPNVERSIO, pFILTERT, pNOT_IN});
              CallableStatement cStmt=conn.prepareCall(callQuery);
              String USERNAME=conn.getMetaData().getUserName().toUpperCase();
              cStmt.setObject(2, pPSCONTRA);
              cStmt.setObject(3, pPNVERSIO);
              cStmt.setObject(4, pFILTERT);
              cStmt.setObject(5, pNOT_IN);
              cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_TRAMOS_REA".toUpperCase())); // Valor de "RETURN"
              cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
              cStmt.execute();
              HashMap retVal=new HashMap();
              try {
                  retVal.put("RETURN", cStmt.getObject(1));
              }
              catch (SQLException e) {
                  retVal.put("RETURN", null);
              }
              try {
                  retVal.put("MENSAJES", cStmt.getObject(6));
              }
              catch (SQLException e) {
                  retVal.put("MENSAJES", null);
              }
              retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
              cStmt.close();//AXIS-WLS1SERVER-Ready
              
              return retVal;
          }

          public HashMap ejecutaPAC_IAX_REA__F_GET_FILTERED_TRAMOS (java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, String pFILTERT, java.math.BigDecimal pNOT_IN) throws Exception {
              return this.callPAC_IAX_REA__F_GET_FILTERED_TRAMOS(pPSCONTRA, pPNVERSIO, pFILTERT, pNOT_IN);//AXIS-WLS1SERVER-Ready 
          }
          //--END-PAC_IAX_REA.F_GET_FILTERED_TRAMOS

           //--START-PAC_IAX_REA.F_DEL_FILTERED_TRAMOS(PNVERSIO,  FILTERT,  PSCONTRA)
           private HashMap callPAC_IAX_REA__F_DEL_FILTERED_TRAMOS (java.math.BigDecimal pPNVERSIO, String pFILTERT, java.math.BigDecimal pPSCONTRA) throws Exception {
               String callQuery="{?=call PAC_IAX_REA.F_DEL_FILTERED_TRAMOS(?, ?, ?, ?)}";
               
               logCall(callQuery, new String[] {"pPNVERSIO", "pFILTERT", "pPSCONTRA"}, new Object[] {pPNVERSIO, pFILTERT, pPSCONTRA});
               CallableStatement cStmt=conn.prepareCall(callQuery);
               String USERNAME=conn.getMetaData().getUserName().toUpperCase();
               cStmt.setObject(2, pPNVERSIO);
               cStmt.setObject(3, pFILTERT);
               cStmt.setObject(4, pPSCONTRA);
               cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
               cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
               cStmt.execute();
               HashMap retVal=new HashMap();
               try {
                   retVal.put("RETURN", cStmt.getObject(1));
               }
               catch (SQLException e) {
                   retVal.put("RETURN", null);
               }
               try {
                   retVal.put("MENSAJES", cStmt.getObject(5));
               }
               catch (SQLException e) {
                   retVal.put("MENSAJES", null);
               }
               retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
               cStmt.close();//AXIS-WLS1SERVER-Ready
               
               return retVal;
           }

           public HashMap ejecutaPAC_IAX_REA__F_DEL_FILTERED_TRAMOS (java.math.BigDecimal pPNVERSIO, String pFILTERT, java.math.BigDecimal pPSCONTRA) throws Exception {
               return this.callPAC_IAX_REA__F_DEL_FILTERED_TRAMOS(pPNVERSIO, pFILTERT, pPSCONTRA);//AXIS-WLS1SERVER-Ready 
           }
           //--END-PAC_IAX_REA.F_DEL_FILTERED_TRAMOS


            //--START-PAC_IAX_REA.F_GET_NEW_SCONTRA()
            private HashMap callPAC_IAX_REA__F_GET_NEW_SCONTRA () throws Exception {
                String callQuery="{?=call PAC_IAX_REA.F_GET_NEW_SCONTRA(?)}";
                
                logCall(callQuery, new String[] {}, new Object[] {});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                cStmt.execute();
                HashMap retVal=new HashMap();
                try {
                    retVal.put("RETURN", cStmt.getObject(1));
                }
                catch (SQLException e) {
                    retVal.put("RETURN", null);
                }
                try {
                    retVal.put("MENSAJES", cStmt.getObject(2));
                }
                catch (SQLException e) {
                    retVal.put("MENSAJES", null);
                }
                retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                cStmt.close();//AXIS-WLS1SERVER-Ready
                
                return retVal;
            }

            public HashMap ejecutaPAC_IAX_REA__F_GET_NEW_SCONTRA () throws Exception {
                return this.callPAC_IAX_REA__F_GET_NEW_SCONTRA();//AXIS-WLS1SERVER-Ready 
            }
            //--END-PAC_IAX_REA.F_GET_NEW_SCONTRA
            
            

            //--START-PAC_IAX_REA.F_DEL_CONTRATO_REA(PSCONTRA)
            private HashMap callPAC_IAX_REA__F_DEL_CONTRATO_REA (java.math.BigDecimal pPSCONTRA) throws Exception {
                String callQuery="{?=call PAC_IAX_REA.F_DEL_CONTRATO_REA(?, ?)}";
                
                logCall(callQuery, new String[] {"pPSCONTRA"}, new Object[] {pPSCONTRA});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSCONTRA);
                cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                cStmt.execute();
                HashMap retVal=new HashMap();
                try {
                    retVal.put("RETURN", cStmt.getObject(1));
                }
                catch (SQLException e) {
                    retVal.put("RETURN", null);
                }
                try {
                    retVal.put("MENSAJES", cStmt.getObject(3));
                }
                catch (SQLException e) {
                    retVal.put("MENSAJES", null);
                }
                retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                cStmt.close();//AXIS-WLS1SERVER-Ready
                
                return retVal;
            }

            public HashMap ejecutaPAC_IAX_REA__F_DEL_CONTRATO_REA (java.math.BigDecimal pPSCONTRA) throws Exception {
                return this.callPAC_IAX_REA__F_DEL_CONTRATO_REA(pPSCONTRA);//AXIS-WLS1SERVER-Ready 
            }
            //--END-PAC_IAX_REA.F_DEL_CONTRATO_REA

             //--START-PAC_IAX_REA.F_DEL_CUADROCES(PCCOMPANI,  PNVERSIO,  PSCONTRA,  PCTRAMO,  MENSAJES)
             private HashMap callPAC_IAX_REA__F_DEL_CUADROCES (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO) throws Exception {
                 String callQuery="{?=call PAC_IAX_REA.F_DEL_CUADROCES(?, ?, ?, ?, ?)}";
                 
                 logCall(callQuery, new String[] {"pPCCOMPANI", "pPNVERSIO", "pPSCONTRA", "pPCTRAMO"}, new Object[] {pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO});
                 CallableStatement cStmt=conn.prepareCall(callQuery);
                 String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                 cStmt.setObject(2, pPCCOMPANI);
                 cStmt.setObject(3, pPNVERSIO);
                 cStmt.setObject(4, pPSCONTRA);
                 cStmt.setObject(5, pPCTRAMO);
                 cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                 cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                 cStmt.execute();
                 HashMap retVal=new HashMap();
                 try {
                     retVal.put("RETURN", cStmt.getObject(1));
                 }
                 catch (SQLException e) {
                     retVal.put("RETURN", null);
                 }
                 try {
                     retVal.put("MENSAJES", cStmt.getObject(6));
                 }
                 catch (SQLException e) {
                     retVal.put("MENSAJES", null);
                 }
                 retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                 cStmt.close();//AXIS-WLS1SERVER-Ready
                 
                 return retVal;
             }

             public HashMap ejecutaPAC_IAX_REA__F_DEL_CUADROCES (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO) throws Exception {
                 return this.callPAC_IAX_REA__F_DEL_CUADROCES(pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO);//AXIS-WLS1SERVER-Ready 
             }
             //--END-PAC_IAX_REA.F_DEL_CUADROCES

              //--START-PAC_IAX_REA.F_GET_REPOSICIONES_CONTRATO(PCCODIGO,  PSCONTRA,  PNVERSIO,  PCTRAMO)
              private HashMap callPAC_IAX_REA__F_GET_REPOSICIONES_CONTRATO (java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO) throws Exception {
                  String callQuery="{?=call PAC_IAX_REA.F_GET_REPOSICIONES_CONTRATO(?, ?, ?, ?, ?)}";
                  
                  logCall(callQuery, new String[] {"pPCCODIGO", "pPSCONTRA", "pPNVERSIO", "pPCTRAMO"}, new Object[] {pPCCODIGO, pPSCONTRA, pPNVERSIO, pPCTRAMO});
                  CallableStatement cStmt=conn.prepareCall(callQuery);
                  String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                  cStmt.setObject(2, pPCCODIGO);
                  cStmt.setObject(3, pPSCONTRA);
                  cStmt.setObject(4, pPNVERSIO);
                  cStmt.setObject(5, pPCTRAMO);
                  cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
                  cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                  cStmt.execute();
                  HashMap retVal=new HashMap();
                  try {
                      retVal.put("RETURN", cStmt.getObject(1));
                  }
                  catch (SQLException e) {
                      retVal.put("RETURN", null);
                  }
                  try {
                      retVal.put("MENSAJES", cStmt.getObject(6));
                  }
                  catch (SQLException e) {
                      retVal.put("MENSAJES", null);
                  }
                  retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                  cStmt.close();//AXIS-WLS1SERVER-Ready
                  
                  return retVal;
              }

              public HashMap ejecutaPAC_IAX_REA__F_GET_REPOSICIONES_CONTRATO (java.math.BigDecimal pPCCODIGO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPCTRAMO) throws Exception {
                  return this.callPAC_IAX_REA__F_GET_REPOSICIONES_CONTRATO(pPCCODIGO, pPSCONTRA, pPNVERSIO, pPCTRAMO);//AXIS-WLS1SERVER-Ready 
              }
              //--END-PAC_IAX_REA.F_GET_REPOSICIONES_CONTRATO

               //--START-PAC_IAX_REA.F_DEL_TRAMOS(PNVERSIO,  PSCONTRA,  PCTRAMO)
               private HashMap callPAC_IAX_REA__F_DEL_TRAMOS (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO) throws Exception {
                   String callQuery="{?=call PAC_IAX_REA.F_DEL_TRAMOS(?, ?, ?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPNVERSIO", "pPSCONTRA", "pPCTRAMO"}, new Object[] {pPNVERSIO, pPSCONTRA, pPCTRAMO});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPNVERSIO);
                   cStmt.setObject(3, pPSCONTRA);
                   cStmt.setObject(4, pPCTRAMO);
                   cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                   cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                   cStmt.execute();
                   HashMap retVal=new HashMap();
                   try {
                       retVal.put("RETURN", cStmt.getObject(1));
                   }
                   catch (SQLException e) {
                       retVal.put("RETURN", null);
                   }
                   try {
                       retVal.put("MENSAJES", cStmt.getObject(5));
                   }
                   catch (SQLException e) {
                       retVal.put("MENSAJES", null);
                   }
                   retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                   cStmt.close();//AXIS-WLS1SERVER-Ready
                   
                   return retVal;
               }

               public HashMap ejecutaPAC_IAX_REA__F_DEL_TRAMOS (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA, java.math.BigDecimal pPCTRAMO) throws Exception {
                   return this.callPAC_IAX_REA__F_DEL_TRAMOS(pPNVERSIO, pPSCONTRA, pPCTRAMO);//AXIS-WLS1SERVER-Ready 
               }
               //--END-PAC_IAX_REA.F_DEL_TRAMOS

               //--START-PAC_IAX_REA.F_EDIT_COMPANI_DOC(PCCOMPANI,  PIDDOCGDX,  PCTIPO,  PTOBSERV,  PTFILENAME,  PFCADUCI,  PFALTA)
               private HashMap callPAC_IAX_REA__F_EDIT_COMPANI_DOC (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO, String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI, java.sql.Date pPFALTA) throws Exception {
                   String callQuery="{?=call PAC_IAX_REA.F_EDIT_COMPANI_DOC(?, ?, ?, ?, ?, ?, ?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPCCOMPANI", "pPIDDOCGDX", "pPCTIPO", "pPTOBSERV", "pPTFILENAME", "pPFCADUCI", "pPFALTA"}, new Object[] {pPCCOMPANI, pPIDDOCGDX, pPCTIPO, pPTOBSERV, pPTFILENAME, pPFCADUCI, pPFALTA});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPCCOMPANI);
                   cStmt.setObject(3, pPIDDOCGDX);
                   cStmt.setObject(4, pPCTIPO);
                   cStmt.setObject(5, pPTOBSERV);
                   cStmt.setObject(6, pPTFILENAME);
                   cStmt.setObject(7, pPFCADUCI);
                   cStmt.setObject(8, pPFALTA);
                   cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                   cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                   cStmt.execute();
                   HashMap retVal=new HashMap();
                   try {
                       retVal.put("RETURN", cStmt.getObject(1));
                   }
                   catch (SQLException e) {
                       retVal.put("RETURN", null);
                   }
                   try {
                       retVal.put("MENSAJES", cStmt.getObject(9));
                   }
                   catch (SQLException e) {
                       retVal.put("MENSAJES", null);
                   }
                   retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                   cStmt.close();//AXIS-WLS1SERVER-Ready
                   
                   return retVal;
               }

               public HashMap ejecutaPAC_IAX_REA__F_EDIT_COMPANI_DOC (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO, String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI, java.sql.Date pPFALTA) throws Exception {
                   return this.callPAC_IAX_REA__F_EDIT_COMPANI_DOC(pPCCOMPANI, pPIDDOCGDX, pPCTIPO, pPTOBSERV, pPTFILENAME, pPFCADUCI, pPFALTA);//AXIS-WLS1SERVER-Ready 
               }
               //--END-PAC_IAX_REA.F_EDIT_COMPANI_DOC
               //--START-PAC_IAX_REA.F_GET_COMPANI_DOC(PCCOMPANI)
               private HashMap callPAC_IAX_REA__F_GET_COMPANI_DOC (java.math.BigDecimal pPCCOMPANI) throws Exception {
                   String callQuery="{?=call PAC_IAX_REA.F_GET_COMPANI_DOC(?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPCCOMPANI"}, new Object[] {pPCCOMPANI});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPCCOMPANI);
                   cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
                   cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                   cStmt.execute();
                   HashMap retVal=new HashMap();
                   try {
                       retVal.put("RETURN", cStmt.getObject(1));
                   }
                   catch (SQLException e) {
                       retVal.put("RETURN", null);
                   }
                   try {
                       retVal.put("MENSAJES", cStmt.getObject(3));
                   }
                   catch (SQLException e) {
                       retVal.put("MENSAJES", null);
                   }
                   retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                   cStmt.close();//AXIS-WLS1SERVER-Ready
                   
                   return retVal;
               }

               public HashMap ejecutaPAC_IAX_REA__F_GET_COMPANI_DOC (java.math.BigDecimal pPCCOMPANI) throws Exception {
                   return this.callPAC_IAX_REA__F_GET_COMPANI_DOC(pPCCOMPANI);//AXIS-WLS1SERVER-Ready 
               }
               //--END-PAC_IAX_REA.F_GET_COMPANI_DOC
               //--START-PAC_IAX_REA.F_INS_COMPANI_DOC(PCCOMPANI,  PIDDOCGDX,  PCTIPO,  PTOBSERV,  PTFILENAME,  PFCADUCI,  PFALTA)
               private HashMap callPAC_IAX_REA__F_INS_COMPANI_DOC (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO, String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI, java.sql.Date pPFALTA) throws Exception {
                   String callQuery="{?=call PAC_IAX_REA.F_INS_COMPANI_DOC(?, ?, ?, ?, ?, ?, ?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPCCOMPANI", "pPIDDOCGDX", "pPCTIPO", "pPTOBSERV", "pPTFILENAME", "pPFCADUCI", "pPFALTA"}, new Object[] {pPCCOMPANI, pPIDDOCGDX, pPCTIPO, pPTOBSERV, pPTFILENAME, pPFCADUCI, pPFALTA});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPCCOMPANI);
                   cStmt.setObject(3, pPIDDOCGDX);
                   cStmt.setObject(4, pPCTIPO);
                   cStmt.setObject(5, pPTOBSERV);
                   cStmt.setObject(6, pPTFILENAME);
                   cStmt.setObject(7, pPFCADUCI);
                   cStmt.setObject(8, pPFALTA);
                   cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                   cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                   cStmt.execute();
                   HashMap retVal=new HashMap();
                   try {
                       retVal.put("RETURN", cStmt.getObject(1));
                   }
                   catch (SQLException e) {
                       retVal.put("RETURN", null);
                   }
                   try {
                       retVal.put("MENSAJES", cStmt.getObject(9));
                   }
                   catch (SQLException e) {
                       retVal.put("MENSAJES", null);
                   }
                   retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                   cStmt.close();//AXIS-WLS1SERVER-Ready
                   
                   return retVal;
               }

               public HashMap ejecutaPAC_IAX_REA__F_INS_COMPANI_DOC (java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPIDDOCGDX, java.math.BigDecimal pPCTIPO, String pPTOBSERV, String pPTFILENAME, java.sql.Date pPFCADUCI, java.sql.Date pPFALTA) throws Exception {
                   return this.callPAC_IAX_REA__F_INS_COMPANI_DOC(pPCCOMPANI, pPIDDOCGDX, pPCTIPO, pPTOBSERV, pPTFILENAME, pPFCADUCI, pPFALTA);//AXIS-WLS1SERVER-Ready 
               }
               //--END-PAC_IAX_REA.F_INS_COMPANI_DOC
               //--START-PAC_IAX_REA.F_GET_COMPANI_DOCS(PCCOMPANI)
               private HashMap callPAC_IAX_REA__F_GET_COMPANI_DOCS (java.math.BigDecimal pPCCOMPANI) throws Exception {
                   String callQuery="{?=call PAC_IAX_REA.F_GET_COMPANI_DOCS(?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPCCOMPANI"}, new Object[] {pPCCOMPANI});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPCCOMPANI);
                   cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
                   cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                   cStmt.execute();
                   HashMap retVal=new HashMap();
                   try {
                       retVal.put("RETURN", cStmt.getObject(1));
                   }
                   catch (SQLException e) {
                       retVal.put("RETURN", null);
                   }
                   try {
                       retVal.put("MENSAJES", cStmt.getObject(3));
                   }
                   catch (SQLException e) {
                       retVal.put("MENSAJES", null);
                   }
                   retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                   cStmt.close();//AXIS-WLS1SERVER-Ready
                   
                   return retVal;
               }

               public HashMap ejecutaPAC_IAX_REA__F_GET_COMPANI_DOCS (java.math.BigDecimal pPCCOMPANI) throws Exception {
                   return this.callPAC_IAX_REA__F_GET_COMPANI_DOCS(pPCCOMPANI);//AXIS-WLS1SERVER-Ready 
               }
               //--END-PAC_IAX_REA.F_GET_COMPANI_DOCS
			   
			   private HashMap callPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA(String pPTABLA,java.math.BigDecimal pPPOLIZA,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCGENERA, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pSCONTRA) throws Exception {
		String callQuery = "{?=call PAC_IAX_rea.F_GET_REASEGURO_X_GARANTIA(?,?,?,?,?,?,?,?)}";

    logCall(callQuery, new String[] { "pPTABLA","pPPOLIZA", "pPSSEGURO", "pPSPROCES","pPCGENERA","pPNSINIES","pSCONTRA"},
				new Object[] { pPTABLA,pPPOLIZA, pPSSEGURO, pPSPROCES,pPCGENERA,pPNSINIES,pSCONTRA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPTABLA);
		cStmt.setObject(3, pPPOLIZA);
		cStmt.setObject(4, pPSSEGURO);
		cStmt.setObject(5, pPSPROCES);
 		cStmt.setObject(6, pPCGENERA);
 		cStmt.setObject(7, pPNSINIES);
 		cStmt.setObject(8, pSCONTRA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
																		// de
																		// "RETURN"
		cStmt.registerOutParameter(9, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor
																					// de
																					// "MENSAJES"
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

	public HashMap ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA(String pPTABLA,java.math.BigDecimal pPPOLIZA,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCGENERA) throws Exception {
		return this.callPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA(pPTABLA,pPPOLIZA, pPSSEGURO, pPSPROCES,pPCGENERA,null,null);
	}
		
	public HashMap ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA(String pPTABLA,java.math.BigDecimal pPPOLIZA,
			java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPROCES, java.math.BigDecimal pPCGENERA, java.math.BigDecimal pPNSINIES, java.math.BigDecimal pSCONTRA) throws Exception {
		return this.callPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA(pPTABLA,pPPOLIZA, pPSSEGURO, pPSPROCES,pPCGENERA,pPNSINIES,pSCONTRA);
	}
	
	//INI - EDBR - 13/JUNIO2019 - IAXIS43330 - Se agrega funciones para control de pantallas de patrimonio tecnico
	public HashMap ejecutaPAC_IAX_REA__F_GET_TRIMESTRES(java.sql.Date pPFINITRIM, java.sql.Date pPFFINTRIM) throws Exception {
        return this.callPAC_IAX_REA__F_GET_TRIMESTRES(pPFINITRIM, pPFFINTRIM);
    }

	
	private HashMap callPAC_IAX_REA__F_GET_TRIMESTRES(java.sql.Date pPFINITRIM, java.sql.Date pPFFINTRIM) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_TRIMESTRES(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPFINITRIM", "pPFFINTRIM" }, new Object[] { pPFINITRIM, pPFFINTRIM });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPFINITRIM);
        cStmt.setObject(3, pPFFINTRIM);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
        	
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }
	
	public HashMap ejecutaPAC_IAX_REA__F_SET_PATRI_TEC(java.math.BigDecimal pANIO, java.math.BigDecimal pTRIMESTRE, String pMONEDA, java.math.BigDecimal pVALOR, java.math.BigDecimal pMOVIMI, java.math.BigDecimal pPORPAT) throws Exception { // IAXIS-15090 13/04/2021
        return this.callPAC_IAX_REA__F_SET_PATRI_TEC(pANIO, pTRIMESTRE, pMONEDA, pVALOR, pMOVIMI, pPORPAT); // IAXIS-15090 13/04/2021        
    }
	
	private HashMap callPAC_IAX_REA__F_SET_PATRI_TEC (java.math.BigDecimal pANIO, java.math.BigDecimal pTRIMESTRE, String pMONEDA, java.math.BigDecimal pVALOR, java.math.BigDecimal pMOVIMI, java.math.BigDecimal pPORPAT) throws Exception { // IAXIS-15090 13/04/2021
		String callQuery="{?=call PAC_IAX_REA.F_SET_PATRI_TEC(?, ?, ?, ?, ?, ?, ?)}"; // IAXIS-15090 13/04/2021
		logCall(callQuery, new String[] { "pANIO", "pTRIMESTRE", "pMONEDA", "pVALOR", "pMOVIMI", "pPORPAT" }, new Object[] { pANIO, pTRIMESTRE, pMONEDA, pVALOR, pMOVIMI, pPORPAT }); // IAXIS-15090 13/04/2021
		CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pANIO);
        cStmt.setObject(3, pTRIMESTRE);
        cStmt.setObject(4, pMONEDA);
        cStmt.setObject(5, pVALOR);
        cStmt.setObject(6, pMOVIMI);
        cStmt.setObject(7, pPORPAT); // IAXIS-15090 13/04/2021
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(8, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(8));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
	}
	
	public HashMap ejecutaPAC_IAX_REA__F_GET_HIST_PAT_TEC(java.math.BigDecimal pPANIO, java.math.BigDecimal pPNTRIM) throws Exception {
        return this.callPAC_IAX_REA__F_GET_HIST_PAT_TEC(pPANIO, pPNTRIM);
    }

	
	private HashMap callPAC_IAX_REA__F_GET_HIST_PAT_TEC(java.math.BigDecimal pPANIO, java.math.BigDecimal pPNTRIM) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_GET_HIST_PAT_TEC(?, ?, ?)}";

        logCall(callQuery, new String[] { "pPANIO", "pPNTRIM" }, new Object[] { pPANIO, pPNTRIM });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPANIO);
        cStmt.setObject(3, pPNTRIM);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(4));
        }
        catch (SQLException e) {
        	
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal); //AXIS-WLS1SERVER-Ready
        cStmt.close(); //AXIS-WLS1SERVER-Ready

        return retVal;
    }
	//FIN - EDBR - 13/JUNIO2019 - IAXIS43330 - Se agrega funciones para control de pantallas de patrimonio tecnico

	//INI - ML - 4549 - ACTIVA CONTRATO BASANDOSE EN LA ULTIMA VERSION DEL CONTRATO 
	public HashMap ejecutaPAC_IAX_REA__F_ACTIVAR_CONTRATO(java.math.BigDecimal pNCONTRATO) throws Exception {
        return this.callPAC_IAX_REA__F_ACTIVAR_CONTRATO(pNCONTRATO);
    }
	
	private HashMap callPAC_IAX_REA__F_ACTIVAR_CONTRATO(java.math.BigDecimal pNCONTRATO) throws Exception {
        String callQuery="{?=call PAC_IAX_REA.F_ACTIVAR_CONTRATO(?, ?)}";
        logCall(callQuery, new String[] { "pNCONTRATO"}, new Object[] { pNCONTRATO});
        
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMBER);
        cStmt.setObject(2, pNCONTRATO);
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES"));
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(3));
        }
        catch (SQLException e) {
        	
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);
        cStmt.close();

        return retVal;
    }
//FIN - ML - 4549 - ACTIVA CONTRATO BASANDOSE EN LA ULTIMA VERSION DEL CONTRATO

    private HashMap callPAC_IAX_REA__F_SET_CUADRO_FAC_MAS (java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINCUF, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIFACCED, java.math.BigDecimal pPFACCED,java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPRESREA, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPINTRES, java.math.BigDecimal pPCTIPFAC, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCFRERES, java.math.BigDecimal pPCRESREA, java.math.BigDecimal pPCCONREC, java.sql.Date pPFGARPRI, java.sql.Date pPFGARDEP, java.math.BigDecimal pPPIMPINT, String pPTIDFCOM, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pMODIFICACIO) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        String callQuery="{?=call PAC_IAX_REA.F_SET_CUADRO_FAC_MAS(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"; //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        
        
        System.out.println(
       		 "HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC_MAS, pPSFACULT:"+pPSFACULT+" pPCESTADO:"+pPCESTADO+" pPFINCUF:"+pPFINCUF+" pPPLOCAL"+pPPLOCAL+
       		 " pPCCOMPANI:"+pPCCOMPANI+" pPPCESION:"+pPPCESION+" pPICESFIJ:"+pPICESFIJ+" pPCCOMREA:"+pPCCOMREA+
       		 " pPPCOMISI:"+pPPCOMISI+" pPICOMFIJ:"+pPICOMFIJ+" pPISCONTA:"+pPISCONTA+" pPPRESERV:"+pPPRESERV+
       		 " pPPRESREA:"+pPPRESREA+" pPCINTRES:"+pPCINTRES+" pPCINTRES:"+pPCINTRES+" pPCTIPFAC"+pPCTIPFAC+
       		 " pPPTASAXL:"+pPPTASAXL+" pPCCORRED:"+pPCCORRED+" pPCFRERES:"+pPCFRERES+" pPCRESREA:"+pPCRESREA+
       		 " pPCCONREC:"+pPCCONREC+" pPFGARPRI:"+pPFGARPRI+" pPFGARDEP:"+pPFGARDEP+" pPPIMPINT:"+pPPIMPINT+
       		 " pPTIDFCOM:"+pPTIDFCOM+" pPSSEGURO:"+pPSSEGURO+" pPIFACCED:"+pPIFACCED+" pPFACCED:"+pPFACCED+" pMODIFICACIO:"+pMODIFICACIO); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        
        
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC_MAS PASO 2, callQuery:"+callQuery);
        logCall(callQuery, new String[] {"pPSFACULT", "pPCESTADO", "pPFINCUF", "pPPLOCAL", "pPIFACCED", "pPFACCED", "pPCCOMPANI", "pPPCESION", "pPICESFIJ", "pPCCOMREA", "pPPCOMISI", "pPICOMFIJ", "pPISCONTA", "pPPRESERV", "pPPRESREA", "pPCINTRES", "pPINTRES", "pPCTIPFAC", "pPPTASAXL", "pPCCORRED", "pPCFRERES", "pPCRESREA", "pPCCONREC", "pPFGARPRI", "pPFGARDEP", "pPPIMPINT", "pPTIDFCOM", "pPSSEGURO", "pMODIFICACIO"}, new Object[] {pPSFACULT, pPCESTADO, pPFINCUF, pPPLOCAL, pPIFACCED, pPFACCED, pPCCOMPANI, pPPCESION, pPICESFIJ, pPCCOMREA, pPPCOMISI, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPRESREA, pPCINTRES, pPINTRES, pPCTIPFAC, pPPTASAXL, pPCCORRED, pPCFRERES, pPCRESREA, pPCCONREC, pPFGARPRI, pPFGARDEP, pPPIMPINT, pPTIDFCOM, pPSSEGURO, pMODIFICACIO}); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
    
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC_MAS PASO 3, callQuery:"+callQuery);
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSFACULT);
        cStmt.setObject(3, pPCESTADO);
        cStmt.setObject(4, pPFINCUF);
        cStmt.setObject(5, pPPLOCAL);
        cStmt.setObject(6, pPIFACCED);
        cStmt.setObject(7, pPFACCED);  // INICIO POST-74 30/06/2022 PAYV
        cStmt.setObject(8, pPCCOMPANI);
        cStmt.setObject(9, pPPCESION);
        cStmt.setObject(10, pPICESFIJ);
        cStmt.setObject(11, pPCCOMREA);
        cStmt.setObject(12, pPPCOMISI);
        cStmt.setObject(13, pPICOMFIJ);
        cStmt.setObject(14, pPISCONTA);
        cStmt.setObject(15, pPPRESERV);
        cStmt.setObject(16, pPPRESREA);         
        cStmt.setObject(17, pPCINTRES);
        cStmt.setObject(18, pPINTRES);
        cStmt.setObject(19, pPCTIPFAC);
        cStmt.setObject(20, pPPTASAXL);
        cStmt.setObject(21, pPCCORRED);
        cStmt.setObject(22, pPCFRERES);
        cStmt.setObject(23, pPCRESREA);
        cStmt.setObject(24, pPCCONREC);
        cStmt.setObject(25, pPFGARPRI);
        cStmt.setObject(26, pPFGARDEP);
        cStmt.setObject(27, pPPIMPINT);
        cStmt.setObject(28, pPTIDFCOM);
        cStmt.setObject(29, pPSSEGURO);
        cStmt.setObject(30, pMODIFICACIO); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 4, callQuery:"+callQuery);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO. // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5, callQuery:"+callQuery);
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
       	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5.1, callQuery:"+callQuery);
            retVal.put("RETURN", null);
        }
        try {
       	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5.2, callQuery:"+callQuery);
			 
            retVal.put("MENSAJES", cStmt.getObject(31)); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
		
        }
        catch (SQLException e) {
       	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 5.3, callQuery:"+callQuery);
            retVal.put("MENSAJES", null);
        }
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 6, callQuery:"+callQuery);
        retVal=new ConversionUtil().convertOracleObjects(retVal);
        cStmt.close();
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 7, callQuery:"+callQuery);
        return retVal;
    }
    public HashMap ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC_MAS (java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINCUF, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIFACCED,java.math.BigDecimal pPFACCED, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPRESREA, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPINTRES, java.math.BigDecimal pPCTIPFAC, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCFRERES, java.math.BigDecimal pPCRESREA, java.math.BigDecimal pPCCONREC, java.sql.Date pPFGARPRI, java.sql.Date pPFGARDEP, java.math.BigDecimal pPPIMPINT, String pPTIDFCOM, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pMODIFICACIO) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        
        System.out.println(
       		 "HANS TRAZA PAC_IAX_REA.ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC_MAS, pPSFACULT:"+pPSFACULT+" pPCESTADO:"+pPCESTADO+" pPFINCUF:"+pPFINCUF+" pPPLOCAL"+pPPLOCAL+
       		 " pPCCOMPANI:"+pPCCOMPANI+" pPPCESION:"+pPPCESION+" pPICESFIJ:"+pPICESFIJ+" pPCCOMREA:"+pPCCOMREA+
       		 " pPPCOMISI:"+pPPCOMISI+" pPICOMFIJ:"+pPICOMFIJ+" pPISCONTA:"+pPISCONTA+" pPPRESERV:"+pPPRESERV+
       		 " pPPRESREA:"+pPPRESREA+" pPCINTRES:"+pPCINTRES+" pPCINTRES:"+pPCINTRES+" pPCTIPFAC"+pPCTIPFAC+
       		 " pPPTASAXL:"+pPPTASAXL+" pPCCORRED:"+pPCCORRED+" pPCFRERES:"+pPCFRERES+" pPCRESREA:"+pPCRESREA+
       		 " pPCCONREC:"+pPCCONREC+" pPFGARPRI:"+pPFGARPRI+" pPFGARDEP:"+pPFGARDEP+" pPPIMPINT:"+pPPIMPINT+
       		 " pPTIDFCOM:"+pPTIDFCOM+" pPSSEGURO:"+pPSSEGURO+" pPIFACCED:"+pPIFACCED+" pPFACCED:"+pPFACCED+" pMODIFICACIO:"+pMODIFICACIO
       		 
                ); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO. 
   	 return this.callPAC_IAX_REA__F_SET_CUADRO_FAC_MAS(pPSFACULT, pPCESTADO, pPFINCUF, pPPLOCAL, pPIFACCED,pPFACCED,pPCCOMPANI, pPPCESION, pPICESFIJ, pPCCOMREA, pPPCOMISI, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPRESREA, pPCINTRES, pPINTRES, pPCTIPFAC, pPPTASAXL, pPCCORRED, pPCFRERES, pPCRESREA, pPCCONREC, pPFGARPRI, pPFGARDEP, pPPIMPINT, pPTIDFCOM, pPSSEGURO, pMODIFICACIO); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.//AXIS-WLS1SERVER-Ready
    }
    private HashMap callPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA (java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINCUF, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIFACCED,java.math.BigDecimal pPFACCED, java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPRESREA, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPINTRES, java.math.BigDecimal pPCTIPFAC, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCFRERES, java.math.BigDecimal pPCRESREA, java.math.BigDecimal pPCCONREC, java.sql.Date pPFGARPRI, java.sql.Date pPFGARDEP, java.math.BigDecimal pPPIMPINT, String pPTIDFCOM, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pMODIFICACIO) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        String callQuery="{?=call PAC_IAX_REA.F_SET_CUADRO_FAC_CONTRA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?)}"; //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO. 
        
        
        System.out.println(
       		 "HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA, pPSFACULT:"+pPSFACULT+" pPCESTADO:"+pPCESTADO+" pPFINCUF:"+pPFINCUF+" pPPLOCAL"+pPPLOCAL+
       		 " pPCCOMPANI:"+pPCCOMPANI+" pPPCESION:"+pPPCESION+" pPICESFIJ:"+pPICESFIJ+" pPCCOMREA:"+pPCCOMREA+
       		 " pPPCOMISI:"+pPPCOMISI+" pPICOMFIJ:"+pPICOMFIJ+" pPISCONTA:"+pPISCONTA+" pPPRESERV:"+pPPRESERV+
       		 " pPPRESREA:"+pPPRESREA+" pPCINTRES:"+pPCINTRES+" pPCINTRES:"+pPCINTRES+" pPCTIPFAC"+pPCTIPFAC+
       		 " pPPTASAXL:"+pPPTASAXL+" pPCCORRED:"+pPCCORRED+" pPCFRERES:"+pPCFRERES+" pPCRESREA:"+pPCRESREA+
       		 " pPCCONREC:"+pPCCONREC+" pPFGARPRI:"+pPFGARPRI+" pPFGARDEP:"+pPFGARDEP+" pPPIMPINT:"+pPPIMPINT+
       		 " pPTIDFCOM:"+pPTIDFCOM+" pPSSEGURO:"+pPSSEGURO+" pPIFACCED:"+pPIFACCED+" pPFACCED:"+pPFACCED+" pMODIFICACIO:"+pMODIFICACIO); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        
        
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA PASO 2, callQuery:"+callQuery);
        
        logCall(callQuery, new String[] {"pPSFACULT", "pPCESTADO", "pPFINCUF", "pPPLOCAL", "pPIFACCED","pPFACCED", "pPCCOMPANI", "pPPCESION", "pPICESFIJ", "pPCCOMREA", "pPPCOMISI", "pPICOMFIJ", "pPISCONTA", "pPPRESERV", "pPPRESREA", "pPCINTRES", "pPINTRES", "pPCTIPFAC", "pPPTASAXL", "pPCCORRED", "pPCFRERES", "pPCRESREA", "pPCCONREC", "pPFGARPRI", "pPFGARDEP", "pPPIMPINT", "pPTIDFCOM", "pPSSEGURO"}, new Object[] {pPSFACULT, pPCESTADO, pPFINCUF, pPPLOCAL, pPIFACCED, pPFACCED,pPCCOMPANI, pPPCESION, pPICESFIJ, pPCCOMREA, pPPCOMISI, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPRESREA, pPCINTRES, pPINTRES, pPCTIPFAC, pPPTASAXL, pPCCORRED, pPCFRERES, pPCRESREA, pPCCONREC, pPFGARPRI, pPFGARDEP, pPPIMPINT, pPTIDFCOM, pPSSEGURO, pMODIFICACIO}); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO. 
        //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA PASO 3, callQuery:"+callQuery);
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSFACULT);
        cStmt.setObject(3, pPCESTADO);
        cStmt.setObject(4, pPFINCUF);
        cStmt.setObject(5, pPPLOCAL);
        cStmt.setObject(6, pPIFACCED); 
        cStmt.setObject(7, pPFACCED);
        cStmt.setObject(8, pPCCOMPANI);
        cStmt.setObject(9, pPPCESION);
        cStmt.setObject(10, pPICESFIJ);
        cStmt.setObject(11, pPCCOMREA);
        cStmt.setObject(12, pPPCOMISI);
        cStmt.setObject(13, pPICOMFIJ);
        cStmt.setObject(14, pPISCONTA);
        cStmt.setObject(15, pPPRESERV);
        //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
        cStmt.setObject(16, pPPRESREA);         
        cStmt.setObject(17, pPCINTRES);
        cStmt.setObject(18, pPINTRES);
        cStmt.setObject(19, pPCTIPFAC);
        cStmt.setObject(20, pPPTASAXL);
        cStmt.setObject(21, pPCCORRED);
        cStmt.setObject(22, pPCFRERES);
        cStmt.setObject(23, pPCRESREA);
        cStmt.setObject(24, pPCCONREC);
        cStmt.setObject(25, pPFGARPRI);
        cStmt.setObject(26, pPFGARDEP);
        cStmt.setObject(27, pPPIMPINT);
        cStmt.setObject(28, pPTIDFCOM);
        cStmt.setObject(29, pPSSEGURO);
        cStmt.setObject(30, pMODIFICACIO); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_CONTRA PASO 4, callQuery:"+callQuery);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_CONTRA PASO 5, callQuery:"+callQuery);
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
       	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_CONTRA PASO 5.1, callQuery:"+callQuery);
            retVal.put("RETURN", null);
        }
        try {
       	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_CONTRA PASO 5.2, callQuery:"+callQuery);
			 //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
            retVal.put("MENSAJES", cStmt.getObject(31)); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
			 //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
        }
        catch (SQLException e) {
       	 System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_CONTRA PASO 5.3, callQuery:"+callQuery);
            retVal.put("MENSAJES", null);
        }
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_CONTRA PASO 6, callQuery:"+callQuery);
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        System.out.println("HANS TRAZA PAC_IAX_REA.callPAC_IAX_REA__F_SET_CUADRO_FAC PASO 7, callQuery:"+callQuery);
        return retVal;
    }
    // Fin IAXIS-5361 09/07/2020
    //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
    // Inicio IAXIS-5361 09/07/2020 Se agrega a la firma de la función el parámetro pPIFACCED. Se ajusta la traza con el nuevo parámetro
    public HashMap ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA (java.math.BigDecimal pPSFACULT, java.math.BigDecimal pPCESTADO, java.sql.Date pPFINCUF, java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIFACCED,java.math.BigDecimal  pPFACCED,java.math.BigDecimal pPCCOMPANI, java.math.BigDecimal pPPCESION, java.math.BigDecimal pPICESFIJ, java.math.BigDecimal pPCCOMREA, java.math.BigDecimal pPPCOMISI, java.math.BigDecimal pPICOMFIJ, java.math.BigDecimal pPISCONTA, java.math.BigDecimal pPPRESERV, java.math.BigDecimal pPPRESREA, java.math.BigDecimal pPCINTRES, java.math.BigDecimal pPINTRES, java.math.BigDecimal pPCTIPFAC, java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPCCORRED, java.math.BigDecimal pPCFRERES, java.math.BigDecimal pPCRESREA, java.math.BigDecimal pPCCONREC, java.sql.Date pPFGARPRI, java.sql.Date pPFGARDEP, java.math.BigDecimal pPPIMPINT, String pPTIDFCOM, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pMODIFICACIO) throws Exception { //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
        
        System.out.println(
       		 "HANS TRAZA PAC_IAX_REA.ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA, pPSFACULT:"+pPSFACULT+" pPCESTADO:"+pPCESTADO+" pPFINCUF:"+pPFINCUF+" pPPLOCAL"+pPPLOCAL+
       		 " pPCCOMPANI:"+pPCCOMPANI+" pPPCESION:"+pPPCESION+" pPICESFIJ:"+pPICESFIJ+" pPCCOMREA:"+pPCCOMREA+
       		 " pPPCOMISI:"+pPPCOMISI+" pPICOMFIJ:"+pPICOMFIJ+" pPISCONTA:"+pPISCONTA+" pPPRESERV:"+pPPRESERV+
       		 " pPPRESREA:"+pPPRESREA+" pPCINTRES:"+pPCINTRES+" pPCINTRES:"+pPCINTRES+" pPCTIPFAC"+pPCTIPFAC+
       		 " pPPTASAXL:"+pPPTASAXL+" pPCCORRED:"+pPCCORRED+" pPCFRERES:"+pPCFRERES+" pPCRESREA:"+pPCRESREA+
       		 " pPCCONREC:"+pPCCONREC+" pPFGARPRI:"+pPFGARPRI+" pPFGARDEP:"+pPFGARDEP+" pPPIMPINT:"+pPPIMPINT+
       		 " pPTIDFCOM:"+pPTIDFCOM+" pPSSEGURO:"+pPSSEGURO+" pPIFACCED:"+pPIFACCED+" pPFACCED:"+pPFACCED+" pMODIFICACIO:"+pMODIFICACIO 
       		 
                ); //POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO.
   	 return this.callPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA(pPSFACULT, pPCESTADO, pPFINCUF, pPPLOCAL, pPIFACCED,pPFACCED,pPCCOMPANI, pPPCESION, pPICESFIJ, pPCCOMREA, pPPCOMISI, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPRESREA, pPCINTRES, pPINTRES, pPCTIPFAC, pPPTASAXL, pPCCORRED, pPCFRERES, pPCRESREA, pPCCONREC, pPFGARPRI, pPFGARDEP, pPPIMPINT, pPTIDFCOM, pPSSEGURO, pMODIFICACIO);//POST-230 MPC 27/12/2022 Se adiciona campo pMODIFICACIO. //AXIS-WLS1SERVER-Ready
    }
}
