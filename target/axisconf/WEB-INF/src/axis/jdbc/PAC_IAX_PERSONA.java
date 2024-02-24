//Revision:# jjT1RKGzuFAgvEPqmw5bsg== #
package axis.jdbc;


import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.service.modal.Axisper010Service;
import axis.util.ConversionUtil;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OracleTypes;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;    


public class PAC_IAX_PERSONA extends AccesoPL {
    static Log logger=LogFactory.getLog(PAC_IAX_PERSONA.class);
    private Connection conn=null;

    public PAC_IAX_PERSONA(Connection conn) {
        this.conn=conn;
    }

    //--START-PAC_IAX_PERSONA.F_GET_PREFIJOSPAISES()
    private HashMap callPAC_IAX_PERSONA__F_GET_PREFIJOSPAISES () throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PREFIJOSPAISES(?)}";
        
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PREFIJOSPAISES () throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PREFIJOSPAISES();//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PREFIJOSPAISES






    //--START-PAC_IAX_PERSONA.F_EXISTE_PERSONA(PNNUMIDE,  PCSEXPER,  PFNACIMI,  PSNIP,  PSPEREAL,  PCAGENTE)
     private HashMap callPAC_IAX_PERSONA__F_EXISTE_PERSONA (String pPNNUMIDE, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPSNIP, java.math.BigDecimal pPSPEREAL, java.math.BigDecimal pPCAGENTE) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_EXISTE_PERSONA(?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPNNUMIDE", "pPCSEXPER", "pPFNACIMI", "pPSNIP", "pPSPEREAL", "pPCAGENTE"}, new Object[] {pPNNUMIDE, pPCSEXPER, pPFNACIMI, pPSNIP, pPSPEREAL, pPCAGENTE});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPNNUMIDE);
         cStmt.setObject(3, pPCSEXPER);
         cStmt.setObject(4, pPFNACIMI);
         cStmt.setObject(6, pPSNIP);
         cStmt.setObject(7, pPSPEREAL);
         cStmt.setObject(8, pPCAGENTE);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PSPERSON_NEW"
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
             retVal.put("PSPERSON_NEW", cStmt.getObject(5));
         }
         catch (SQLException e) {
             retVal.put("PSPERSON_NEW", null);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_EXISTE_PERSONA (String pPNNUMIDE, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPSNIP, java.math.BigDecimal pPSPEREAL, java.math.BigDecimal pPCAGENTE) throws Exception {
         return this.callPAC_IAX_PERSONA__F_EXISTE_PERSONA(pPNNUMIDE, pPCSEXPER, pPFNACIMI, pPSNIP, pPSPEREAL, pPCAGENTE); 
     }
     //--END-PAC_IAX_PERSONA.F_EXISTE_PERSONA


    //--START-PAC_IAX_PERSONA.F_DEL_ESTCCC(PSPERSON,  CNORDBAN)

    private HashMap callPAC_IAX_PERSONA__F_DEL_ESTCCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ESTCCC(?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCNORDBAN" }, new Object[] { pPSPERSON, pCNORDBAN });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCNORDBAN);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ESTCCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_ESTCCC(pPSPERSON, pCNORDBAN); 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_ESTCCC

    //--START-PAC_IAX_PERSONA.F_DEL_CCC(PSPERSON,  CNORDBAN)

    private HashMap callPAC_IAX_PERSONA__F_DEL_CCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_CCC(?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCNORDBAN" }, new Object[] { pPSPERSON, pCNORDBAN });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCNORDBAN);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_CCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_CCC(pPSPERSON, pCNORDBAN); 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_CCC


    //--START-PAC_IAX_PERSONA.F_DEL_IDENTIFICADOR(PSPERSON, ,PCAGENTE, pCTIPIDE)

    private HashMap callPAC_IAX_PERSONA__F_DEL_ESTIDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ESTIDENTIFICADOR(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCTIPIDE" }, new Object[] { pPSPERSON, pCAGENTE, pCTIPIDE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCTIPIDE);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ESTIDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_ESTIDENTIFICADOR(pPSPERSON, pCAGENTE, pCTIPIDE); 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_ESTIDENTIFICADOR

    //--START-PAC_IAX_PERSONA.F_DEL_IDENTIFICADOR(PSPERSON, ,PCAGENTE, pCTIPIDE)

    private HashMap callPAC_IAX_PERSONA__F_DEL_IDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_IDENTIFICADOR(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCTIPIDE" }, new Object[] { pPSPERSON, pCAGENTE, pCTIPIDE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCTIPIDE);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_IDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_IDENTIFICADOR(pPSPERSON, pCAGENTE, pCTIPIDE); 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_IDENTIFICADOR


    //--START-PAC_IAX_PERSONA.F_DEL_nacionalidad(PSPERSON,  pCPAIS)

    private HashMap callPAC_IAX_PERSONA__F_DEL_NACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCPAIS, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_NACIONALIDAD(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCPAIS", "pCAGENTE" }, new Object[] { pPSPERSON, pCPAIS, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCPAIS);
        cStmt.setObject(4, pCAGENTE);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_NACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCPAIS, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_NACIONALIDAD(pPSPERSON, pCPAIS, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_NACIONALIDAD 

    //--START-PAC_IAX_PERSONA.F_DEL_ESTnacionalidad(PSPERSON,  pCPAIS)

    private HashMap callPAC_IAX_PERSONA__F_DEL_ESTNACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCPAIS, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ESTNACIONALIDAD(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCPAIS", "pCAGENTE" }, new Object[] { pPSPERSON, pCPAIS, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCPAIS);
        cStmt.setObject(4, pCAGENTE);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ESTNACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCPAIS, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_ESTNACIONALIDAD(pPSPERSON, pCPAIS, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_NACIONALIDAD   


     //--START-PAC_IAX_PERSONA.F_DEL_ESTDIRECCIONES(PSPERSON,  CDOMICI,  PTABLAS,  PCAGENTE)
     private HashMap callPAC_IAX_PERSONA__F_DEL_ESTDIRECCIONES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI, String pPTABLAS, java.math.BigDecimal pPCAGENTE) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ESTDIRECCIONES(?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPSPERSON", "pCDOMICI", "pPTABLAS", "pPCAGENTE"}, new Object[] {pPSPERSON, pCDOMICI, pPTABLAS, pPCAGENTE});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSPERSON);
         cStmt.setObject(3, pCDOMICI);
         cStmt.setObject(4, pPTABLAS);
         cStmt.setObject(5, pPCAGENTE);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ESTDIRECCIONES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI, String pPTABLAS, java.math.BigDecimal pPCAGENTE) throws Exception {
         return this.callPAC_IAX_PERSONA__F_DEL_ESTDIRECCIONES(pPSPERSON, pCDOMICI, pPTABLAS, pPCAGENTE);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_PERSONA.F_DEL_ESTDIRECCIONES


      //--START-PAC_IAX_PERSONA.F_DEL_DIRECCIONES(PSPERSON,  CDOMICI,  PTABLAS,  PCAGENTE)
         private HashMap callPAC_IAX_PERSONA__F_DEL_DIRECCIONES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI, String pPTABLAS, java.math.BigDecimal pPCAGENTE) throws Exception {
             String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_DIRECCIONES(?, ?, ?, ?, ?)}";
             
             logCall(callQuery, new String[] {"pPSPERSON", "pCDOMICI", "pPTABLAS", "pPCAGENTE"}, new Object[] {pPSPERSON, pCDOMICI, pPTABLAS, pPCAGENTE});
             CallableStatement cStmt=conn.prepareCall(callQuery);
             String USERNAME=conn.getMetaData().getUserName().toUpperCase();
             cStmt.setObject(2, pPSPERSON);
             cStmt.setObject(3, pCDOMICI);
             cStmt.setObject(4, pPTABLAS);
             cStmt.setObject(5, pPCAGENTE);
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

         public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_DIRECCIONES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI, String pPTABLAS, java.math.BigDecimal pPCAGENTE) throws Exception {
             return this.callPAC_IAX_PERSONA__F_DEL_DIRECCIONES(pPSPERSON, pCDOMICI, pPTABLAS, pPCAGENTE);//AXIS-WLS1SERVER-Ready 
         }
         //--END

    //--START-PAC_IAX_PERSONA.F_GET_ESTCCC(PSPERSON,  CNORDBAN)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCCC(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCNORDBAN" }, new Object[] { pPSPERSON, pCNORDBAN });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCNORDBAN);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CCC".toUpperCase())); // Valor de "CCC"
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
            retVal.put("CCC", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("CCC", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCCC(pPSPERSON, pCNORDBAN); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCCC
    //--start-PAC_IAX_PERSONA.F_GET_CCC

    private HashMap callPAC_IAX_PERSONA__F_GET_CCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CCC(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCNORDBAN" }, new Object[] { pPSPERSON, pCNORDBAN });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCNORDBAN);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CCC".toUpperCase())); // Valor de "CCC"
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
            retVal.put("CCC", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("CCC", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCNORDBAN) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CCC(pPSPERSON, pCNORDBAN); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CCC


    //--START-PAC_IAX_PERSONA.F_GETFORMATOCCC(PCTIPBAN,  CBANCAR)

    private HashMap callPAC_IAX_PERSONA__F_GETFORMATOCCC(java.math.BigDecimal pPCTIPBAN, String pCBANCAR) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GETFORMATOCCC(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPCTIPBAN", "pCBANCAR" }, new Object[] { pPCTIPBAN, pCBANCAR });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCTIPBAN);
        cStmt.setObject(3, pCBANCAR);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PCBANCAR"
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
        try {
            retVal.put("PCBANCAR", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("PCBANCAR", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GETFORMATOCCC(java.math.BigDecimal pPCTIPBAN, String pCBANCAR) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GETFORMATOCCC(pPCTIPBAN, pCBANCAR); 
    }
    //--END-PAC_IAX_PERSONA.F_GETFORMATOCCC


    //--start-PAC_IAX_PERSONA.F_GET_IDENTIFICADOR

    private HashMap callPAC_IAX_PERSONA__F_GET_IDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_IDENTIFICADOR(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCTIPIDE" }, new Object[] { pPSPERSON, pCAGENTE, pCTIPIDE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCTIPIDE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_IDENTIFICADORES".toUpperCase())); // Valor de "IDENTIFICADORES"
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
            retVal.put("IDENTIFICADOR", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("IDENTIFICADOR", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_IDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_IDENTIFICADOR(pPSPERSON, pCAGENTE, pCTIPIDE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_IDENTIFICADOR

    //--start-PAC_IAX_PERSONA.F_GET_IDENTIFICADOR

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTIDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTIDENTIFICADOR(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCTIPIDE" }, new Object[] { pPSPERSON, pCAGENTE, pCTIPIDE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCTIPIDE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_IDENTIFICADORES".toUpperCase())); // Valor de "IDENTIFICADORES"
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
            retVal.put("IDENTIFICADOR", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("IDENTIFICADOR", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTIDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTIDENTIFICADOR(pPSPERSON, pCAGENTE, pCTIPIDE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_estIDENTIFICADOR     


    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCMODCON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCONTACTO(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCMODCON" }, new Object[] { pPSPERSON, pCAGENTE, pCMODCON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCMODCON);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CONTACTOS".toUpperCase()));
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
            retVal.put("OB_IAX_CONTACTOS", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("OB_IAX_CONTACTOS", null);
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


    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCMODCON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCONTACTO(pPSPERSON, pCAGENTE, pCMODCON); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCONTACTO 

    private HashMap callPAC_IAX_PERSONA__F_GET_CONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCMODCON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONTACTO(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCMODCON" }, new Object[] { pPSPERSON, pCAGENTE, pCMODCON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCMODCON);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CONTACTOS".toUpperCase()));
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
            retVal.put("OB_IAX_CONTACTOS", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("OB_IAX_CONTACTOS", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCMODCON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CONTACTO(pPSPERSON, pCAGENTE, pCMODCON); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CONTACTO

    //--START-PAC_IAX_PERSONA.F_DEL_CONTACTO(pPSPERSON,  pCAGENTE,pCMODCON)

    private HashMap callPAC_IAX_PERSONA__F_DEL_CONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCMODCON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.f_del_contacto(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCMODCON", "pCAGENTE" }, new Object[] { pPSPERSON, pCMODCON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCMODCON);
        cStmt.setObject(4, pCAGENTE);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_CONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCMODCON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_CONTACTO(pPSPERSON, pCAGENTE, pCMODCON); 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_CONTACTO 

    //--START-PAC_IAX_PERSONA.F_DEL_ESTCONTACTO(PSPERSON,  PSMODCON,  PCAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_DEL_ESTCONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSMODCON, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ESTCONTACTO(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPSMODCON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPSMODCON, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPSMODCON);
        cStmt.setObject(4, pPCAGENTE);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ESTCONTACTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSMODCON, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_ESTCONTACTO(pPSPERSON, pPSMODCON, pPCAGENTE); //AXIS-WLS1SERVER-Ready
    }
    //--END-PAC_IAX_PERSONA.F_DEL_CONTACTO     


    //--START-PAC_IAX_PERSONA.F_GET_CONTACTOMAIL(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_CONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONTACTOMAIL(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
        cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
            retVal.put("SMODCON", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("SMODCON", null);
        }
        try {
            retVal.put("TVALCON", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("TVALCON", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CONTACTOMAIL(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CONTACTOMAIL

    //--START-PAC_IAX_PERSONA.F_GET_ESTCONTACTOMAIL(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCONTACTOMAIL(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
        cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
            retVal.put("SMODCON", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("SMODCON", null);
        }
        try {
            retVal.put("TVALCON", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("TVALCON", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCONTACTOMAIL(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCONTACTOMAIL    

     //--START-PAC_IAX_PERSONA.F_GET_CONTACTOFAX(PSPERSON,    CAGENTE)

     private HashMap callPAC_IAX_PERSONA__F_GET_CONTACTOFAX(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONTACTOFAX(?,?,?,?,?)}";
         logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSPERSON);
         cStmt.setObject(3, pCAGENTE);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
         cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
             retVal.put("SMODCON", cStmt.getObject(4));
         }
         catch (SQLException e) {
             retVal.put("SMODCON", null);
         }
         try {
             retVal.put("TVALCON", cStmt.getObject(5));
         }
         catch (SQLException e) {
             retVal.put("TVALCON", null);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOFAX(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
         return this.callPAC_IAX_PERSONA__F_GET_CONTACTOFAX(pPSPERSON, pCAGENTE); 
     }
     //--END-PAC_IAX_PERSONA.F_GET_CONTACTOFAX
     
     
     //--START-PAC_IAX_PERSONA.F_GET_ESTCONTACTOFAX(PSPERSON,    CAGENTE)

     private HashMap callPAC_IAX_PERSONA__F_GET_ESTCONTACTOFAX(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCONTACTOFAX(?,?,?,?,?)}";
         logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSPERSON);
         cStmt.setObject(3, pCAGENTE);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
         cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
             retVal.put("SMODCON", cStmt.getObject(4));
         }
         catch (SQLException e) {
             retVal.put("SMODCON", null);
         }
         try {
             retVal.put("TVALCON", cStmt.getObject(5));
         }
         catch (SQLException e) {
             retVal.put("TVALCON", null);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOFAX(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
         return this.callPAC_IAX_PERSONA__F_GET_ESTCONTACTOFAX(pPSPERSON, pCAGENTE); 
     }
     //--END-PAC_IAX_PERSONA.F_GET_ESTCONTACTOFAX    

    //--START-PAC_IAX_PERSONA.F_GET_CONTACTOTLFFIJO(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_CONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONTACTOTLFFIJO(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
        cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
            retVal.put("SMODCON", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("SMODCON", null);
        }
        try {
            retVal.put("TVALCON", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("TVALCON", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CONTACTOTLFFIJO(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CONTACTOTLFFIJO

    //--START-PAC_IAX_PERSONA.F_GET_ESTCONTACTOTLFFIJO(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCONTACTOTLFFIJO(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
        cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
            retVal.put("SMODCON", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("SMODCON", null);
        }
        try {
            retVal.put("TVALCON", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("TVALCON", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFFIJO(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCONTACTOTLFFIJO

    //--START-PAC_IAX_PERSONA.F_GET_CONTACTOTLFMOVIL(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_CONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONTACTOTLFMOVIL(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
        cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
            retVal.put("SMODCON", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("SMODCON", null);
        }
        try {
            retVal.put("TVALCON", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("TVALCON", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CONTACTOTLFMOVIL(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CONTACTOTLFMOVIL

    //--START-PAC_IAX_PERSONA.F_GET_ESTCONTACTOTLFMOVIL(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCONTACTOTLFMOVIL(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "SMODCON"
        cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "TVALCON"
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
            retVal.put("SMODCON", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("SMODCON", null);
        }
        try {
            retVal.put("TVALCON", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("TVALCON", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFMOVIL(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCONTACTOTLFMOVIL    

    //--START-PAC_IAX_PERSONA.F_GET_CUENTAPOLIZA(PSPERSON,    CAGENTE,  PSSEGURO)

    private HashMap callPAC_IAX_PERSONA__F_GET_CUENTAPOLIZA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPSSEGURO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CUENTAPOLIZA(?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pPSSEGURO" }, new Object[] { pPSPERSON, pCAGENTE, pPSSEGURO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pPSSEGURO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCTIPBAN"
        cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "CBANCAR"
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
            retVal.put("PCTIPBAN", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("PCTIPBAN", null);
        }
        try {
            retVal.put("CBANCAR", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("CBANCAR", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CUENTAPOLIZA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPSSEGURO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CUENTAPOLIZA(pPSPERSON, pCAGENTE, pPSSEGURO); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCUENTAPOLIZA

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCUENTAPOLIZA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPSSEGURO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCUENTAPOLIZA(?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pPSSEGURO" }, new Object[] { pPSPERSON, pCAGENTE, pPSSEGURO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pPSSEGURO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCTIPBAN"
        cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "CBANCAR"
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
            retVal.put("PCTIPBAN", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("PCTIPBAN", null);
        }
        try {
            retVal.put("CBANCAR", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("CBANCAR", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTAPOLIZA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPSSEGURO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCUENTAPOLIZA(pPSPERSON, pCAGENTE, pPSSEGURO); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCUENTAPOLIZA    


    //--START-PAC_IAX_PERSONA.F_GET_ESTCUENTASBANCARIAS(PSPERSON,    PCAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCUENTASBANCARIAS(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_CCC".toUpperCase())); // Valor de "PCCC"
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
            retVal.put("PCCC", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("PCCC", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(pPSPERSON, pPCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCUENTASBANCARIAS

    //--START-PAC_IAX_PERSONA.F_GET_CUENTASBANCARIAS(PSPERSON,    PCAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_CUENTASBANCARIAS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CUENTASBANCARIAS(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_CCC".toUpperCase())); // Valor de "PCCC"
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
            retVal.put("PCCC", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("PCCC", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CUENTASBANCARIAS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CUENTASBANCARIAS(pPSPERSON, pPCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTCUENTASBANCARIAS

    //--START-PAC_IAX_PERSONA.F_GET_ESTDIRECCION(PSPERSON,  CDOMICI)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTDIRECCION(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTDIRECCION(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCDOMICI" }, new Object[] { pPSPERSON, pCDOMICI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCDOMICI);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_DIRECCIONES".toUpperCase())); // Valor de "PDIRECCIONES"
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
            retVal.put("PDIRECCIONES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("PDIRECCIONES", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTDIRECCION(pPSPERSON, pCDOMICI); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTDIRECCION

    //--START-PAC_IAX_PERSONA.F_GET_DIRECCION(PSPERSON,  CDOMICI)

    private HashMap callPAC_IAX_PERSONA__F_GET_DIRECCION(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_DIRECCION(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCDOMICI" }, new Object[] { pPSPERSON, pCDOMICI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCDOMICI);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_DIRECCIONES".toUpperCase())); // Valor de "PDIRECCIONES"
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
            retVal.put("PDIRECCIONES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("PDIRECCIONES", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCDOMICI) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_DIRECCION(pPSPERSON, pCDOMICI); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_DIRECCION    

    //--START-PAC_IAX_PERSONA.F_GET_ESTDIRECCIONES(PSPERSON,    PCAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTDIRECCIONES(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_DIRECCIONES".toUpperCase())); // Valor de "PDIRECCIONES"
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
            retVal.put("PDIRECCIONES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("PDIRECCIONES", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(pPSPERSON, pPCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTDIRECCIONES

    private HashMap callPAC_IAX_PERSONA__F_GET_DIRECCIONES(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_DIRECCIONES(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_DIRECCIONES".toUpperCase())); // Valor de "PDIRECCIONES"
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
            retVal.put("PDIRECCIONES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("PDIRECCIONES", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DIRECCIONES(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_DIRECCIONES(pPSPERSON, pPCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_DIRECCIONES    

    //--START-PAC_IAX_PERSONA.F_GET_ESTNACIONALIDADDEFECTO(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTNACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTNACIONALIDADDEFECTO(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "CPAIS"
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
            retVal.put("CPAIS", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("CPAIS", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTNACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTNACIONALIDADDEFECTO(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTNACIONALIDADDEFECTO

    private HashMap callPAC_IAX_PERSONA__F_GET_NACIONALIDADES(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_NACIONALIDADES(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_NACIONALIDADES".toUpperCase())); // Valor de "PDIRECCIONES"
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
            retVal.put("T_IAX_NACIONALIDADES", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("T_IAX_NACIONALIDADES", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_NACIONALIDADES(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_NACIONALIDADES(pPSPERSON, pCAGENTE); 
    }

    //--START-PAC_IAX_PERSONA.F_GET_NACIONALIDAD(PSPERSON,  PCPAIS,  PCAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_NACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_NACIONALIDAD(?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSPERSON", "pPCPAIS", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCPAIS, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCPAIS);
        cStmt.setObject(4, pPCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_NACIONALIDADES".toUpperCase())); // Valor de "NACIONALIDAD"
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
            retVal.put("NACIONALIDAD", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("NACIONALIDAD", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_NACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_NACIONALIDAD(pPSPERSON, pPCPAIS, pPCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_NACIONALIDAD


    //--START-PAC_IAX_PERSONA.F_GET_NACIONALIDADDEFECTO(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_NACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_NACIONALIDADDEFECTO(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "CPAIS"
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
            retVal.put("CPAIS", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("CPAIS", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_NACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_NACIONALIDADDEFECTO(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ NACIONALIDADDEFECTO    

    //--START-PAC_IAX_PERSONA.F_GET_ESTPERSONA(PSPERSON,  PCAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTPERSONA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTPERSONA(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS".toUpperCase())); // Valor de "OBPERSONA"
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
            retVal.put("OBPERSONA", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("OBPERSONA", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTPERSONA(pPSPERSON, pPCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTPERSONA


    //--START-PAC_IAX_PERSONA.F_GET_PERSONA(PSPERSON,  PCAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_PERSONA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONA(?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE" }, new Object[] { pPSPERSON, pPCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS".toUpperCase())); // Valor de "OBPERSONA"
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
            retVal.put("OBPERSONA", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("OBPERSONA", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PERSONA(pPSPERSON, pPCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PERSONA


     //--START-PAC_IAX_PERSONA.F_GET_PERSONAUNICA(PCTIPPER,  PCTIPIDE,  PNNUMNIF,  PCSEXPER,  FNACIMI,  PMODO,  PSSEGURO,  PCAGENTE,  PPDUPLICADA)
     private HashMap callPAC_IAX_PERSONA__F_GET_PERSONAUNICA (java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String pPNNUMNIF, java.math.BigDecimal pPCSEXPER, java.sql.Date pFNACIMI, String pPMODO, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPPDUPLICADA) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONAUNICA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPCTIPPER", "pPCTIPIDE", "pPNNUMNIF", "pPCSEXPER", "pFNACIMI", "pPMODO", "pPSSEGURO", "pPCAGENTE", "pPPDUPLICADA"}, new Object[] {pPCTIPPER, pPCTIPIDE, pPNNUMNIF, pPCSEXPER, pFNACIMI, pPMODO, pPSSEGURO, pPCAGENTE, pPPDUPLICADA});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPCTIPPER);
         cStmt.setObject(3, pPCTIPIDE);
         cStmt.setObject(4, pPNNUMNIF);
         cStmt.setObject(5, pPCSEXPER);
         cStmt.setObject(6, pFNACIMI);
         cStmt.setObject(7, pPMODO);
         cStmt.setObject(8, pPSSEGURO);
         cStmt.setObject(9, pPCAGENTE);
         cStmt.setObject(10, pPPDUPLICADA);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS".toUpperCase())); // Valor de "OBPERSONA"
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
             retVal.put("OBPERSONA", cStmt.getObject(11));
         }
         catch (SQLException e) {
             retVal.put("OBPERSONA", null);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONAUNICA (java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String pPNNUMNIF, java.math.BigDecimal pPCSEXPER, java.sql.Date pFNACIMI, String pPMODO, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPPDUPLICADA) throws Exception {
         return this.callPAC_IAX_PERSONA__F_GET_PERSONAUNICA(pPCTIPPER, pPCTIPIDE, pPNNUMNIF, pPCSEXPER, pFNACIMI, pPMODO, pPSSEGURO, pPCAGENTE, pPPDUPLICADA); 
     }
     //--END-PAC_IAX_PERSONA.F_GET_PERSONAUNICA



    //--START-PAC_IAX_PERSONA.F_SET_CCC(PSPERSON,    CAGENTE,  CNORDBAN,  PCTIPBAN,  CBANCAR)

    private HashMap callPAC_IAX_PERSONA__F_SET_CCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pCDEFECTO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CCC(?,?,?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCNORDBAN", "pPCTIPBAN", "pCBANCAR", "pCDEFECTO" }, new Object[] { pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pCDEFECTO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCNORDBAN);
        cStmt.setObject(6, pPCTIPBAN);
        cStmt.setObject(7, pCBANCAR);
        cStmt.setObject(8, pCDEFECTO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "CNORDBANOUT"
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
            retVal.put("CNORDBANOUT", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("CNORDBANOUT", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CCC(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pCDEFECTO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_CCC(pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pCDEFECTO); 
    }
    //--END-PAC_IAX_PERSONA.F_SET_CCC

     //--START-PAC_IAX_PERSONA.F_SET_ESTCCC(PSPERSON,  CAGENTE,  CNORDBAN,  PCTIPBAN,  CBANCAR,  PCDEFECTO,  PCPAGSIN,  PFVENCIM,  PTSEGURI)
        private HashMap callPAC_IAX_PERSONA__F_SET_ESTCCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTCCC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pCNORDBAN", "pPCTIPBAN", "pCBANCAR", "pPCDEFECTO", "pPCPAGSIN", "pPFVENCIM", "pPTSEGURI"}, new Object[] {pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pCAGENTE);
            cStmt.setObject(4, pCNORDBAN);
            cStmt.setObject(6, pPCTIPBAN);
            cStmt.setObject(7, pCBANCAR);
            cStmt.setObject(8, pPCDEFECTO);
            cStmt.setObject(10, pPCPAGSIN);
            cStmt.setObject(11, pPFVENCIM);
            cStmt.setObject(12, pPTSEGURI);
            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
            cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "CNORDBANOUT"
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
                retVal.put("CNORDBANOUT", cStmt.getObject(5));
            }
            catch (SQLException e) {
                retVal.put("CNORDBANOUT", null);
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

        public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTCCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI) throws Exception {
            return this.callPAC_IAX_PERSONA__F_SET_ESTCCC(pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI);//AXIS-WLS1SERVER-Ready 
        }
        //--END-PAC_IAX_PERSONA.F_SET_ESTCCC


        //--START-PAC_IAX_PERSONA.F_SET_CONTACTO(PSPERSON,  CAGENTE,  PCTIPCON,  PTCOMCON,  TVALCON,  PSMODCON,  PCDOMICI,  PCPREFIX)
        private HashMap callPAC_IAX_PERSONA__F_SET_CONTACTO (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPCTIPCON, String pPTCOMCON, String pTVALCON, java.math.BigDecimal pPSMODCON, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPREFIX) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CONTACTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pPCTIPCON", "pPTCOMCON", "pTVALCON", "pPSMODCON", "pPCDOMICI", "pPCPREFIX"}, new Object[] {pPSPERSON, pCAGENTE, pPCTIPCON, pPTCOMCON, pTVALCON, pPSMODCON, pPCDOMICI, pPCPREFIX});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pCAGENTE);
            cStmt.setObject(4, pPCTIPCON);
            cStmt.setObject(5, pPTCOMCON);
            cStmt.setObject(6, pTVALCON);
            cStmt.setObject(7, pPSMODCON);
            cStmt.setObject(8, pPCDOMICI);
            cStmt.setObject(10, pPCPREFIX);
            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
            cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PSMODCONOUT"
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
                retVal.put("PSMODCONOUT", cStmt.getObject(9));
            }
            catch (SQLException e) {
                retVal.put("PSMODCONOUT", null);
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

        public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CONTACTO (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPCTIPCON, String pPTCOMCON, String pTVALCON, java.math.BigDecimal pPSMODCON, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPREFIX) throws Exception {
            return this.callPAC_IAX_PERSONA__F_SET_CONTACTO(pPSPERSON, pCAGENTE, pPCTIPCON, pPTCOMCON, pTVALCON, pPSMODCON, pPCDOMICI, pPCPREFIX);//AXIS-WLS1SERVER-Ready 
        }
        //--END-PAC_IAX_PERSONA.F_SET_CONTACTO       
         


          //--START-PAC_IAX_PERSONA.F_SET_ESTCONTACTO(PSPERSON,  CAGENTE,  PCTIPCON,  PTCOMCON,  TVALCON,  PSMODCON,  PCDOMICI,  MENSAJES)
          private HashMap callPAC_IAX_PERSONA__F_SET_ESTCONTACTO (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPCTIPCON, String pPTCOMCON, String pTVALCON, java.math.BigDecimal pPSMODCON, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPREFIX) throws Exception {
              String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTCONTACTO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
              
              logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pPCTIPCON", "pPTCOMCON", "pTVALCON", "pPSMODCON", "pPCDOMICI", "pPCPREFIX"}, new Object[] {pPSPERSON, pCAGENTE, pPCTIPCON, pPTCOMCON, pTVALCON, pPSMODCON, pPCDOMICI, pPCPREFIX});
              CallableStatement cStmt=conn.prepareCall(callQuery);
              String USERNAME=conn.getMetaData().getUserName().toUpperCase();
              cStmt.setObject(2, pPSPERSON);
              cStmt.setObject(3, pCAGENTE);
              cStmt.setObject(4, pPCTIPCON);
              cStmt.setObject(5, pPTCOMCON);
              cStmt.setObject(6, pTVALCON);
              cStmt.setObject(7, pPSMODCON);
              cStmt.setObject(8, pPCDOMICI);
              cStmt.setObject(10, pPCPREFIX);
              cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
              cStmt.registerOutParameter(9, java.sql.Types.NUMERIC); // Valor de "PSMODCONOUT"
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
                  retVal.put("PSMODCONOUT", cStmt.getObject(9));
              }
              catch (SQLException e) {
                  retVal.put("PSMODCONOUT", null);
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

          public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTO (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pPCTIPCON, String pPTCOMCON, String pTVALCON, java.math.BigDecimal pPSMODCON, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCPREFIX) throws Exception {
              return this.callPAC_IAX_PERSONA__F_SET_ESTCONTACTO(pPSPERSON, pCAGENTE, pPCTIPCON, pPTCOMCON, pTVALCON, pPSMODCON, pPCDOMICI, pPCPREFIX);//AXIS-WLS1SERVER-Ready 
          }
          //--END-PAC_IAX_PERSONA.F_SET_ESTCONTACTO



    //--START-PAC_IAX_PERSONA__F_SET_CONTACTOMAIL(PSPERSON,    CAGENTE,  TVALCON,  SMODCON)

    private HashMap callPAC_IAX_PERSONA__F_SET_CONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CONTACTOMAIL(?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pTVALCON", "pSMODCON" }, new Object[] { pPSPERSON, pCAGENTE, pTVALCON, pSMODCON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pTVALCON);
        cStmt.setObject(5, pSMODCON);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "SMODCONOUT"
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
            retVal.put("SMODCONOUT", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("SMODCONOUT", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_CONTACTOMAIL(pPSPERSON, pCAGENTE, pTVALCON, pSMODCON); 
    }
    //--END-PAC_IAX_PERSONA.F_SET_CONTACTOMAIL

    //--START-PAC_IAX_PERSONA__F_SET_CONTACTOS(PSPERSON,    CAGENTE)

    private HashMap callPAC_IAX_PERSONA__F_GET_CONTACTOS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.f_get_contactos(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTACTOS".toUpperCase())); // Valor de "CONTACTOS"               
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
            retVal.put("tcontactos", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("tcontactos", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CONTACTOS(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CONTACTOS  

    private HashMap callPAC_IAX_PERSONA__F_GET_ESTCONTACTOS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCONTACTOS(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE" }, new Object[] { pPSPERSON, pCAGENTE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_CONTACTOS".toUpperCase())); // Valor de "CONTACTOS"               
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
            retVal.put("T_IAX_CONTACTOS", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("T_IAX_CONTACTOS", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOS(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTCONTACTOS(pPSPERSON, pCAGENTE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CONTACTOS         

    //--START-PAC_IAX_PERSONA__F_SET_ESTCONTACTOMAIL(PSPERSON,    CAGENTE,  TVALCON,  SMODCON)

    private HashMap callPAC_IAX_PERSONA__F_SET_ESTCONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTCONTACTOMAIL(?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pTVALCON", "pSMODCON" }, new Object[] { pPSPERSON, pCAGENTE, pTVALCON, pSMODCON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pTVALCON);
        cStmt.setObject(5, pSMODCON);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "SMODCONOUT"
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
            retVal.put("SMODCONOUT", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("SMODCONOUT", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTOMAIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_ESTCONTACTOMAIL(pPSPERSON, pCAGENTE, pTVALCON, pSMODCON); 
    }
    //--END-PAC_IAX_PERSONA.F_SET_ESTCONTACTOMAIL


    //--START-PAC_IAX_PERSONA.F_SET_ESTCONTACTOTLFFIJO (PSPERSON,    CAGENTE,  TVALCON,  SMODCON)

    private HashMap callPAC_IAX_PERSONA__F_SET_CONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CONTACTOTLFFIJO(?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pTVALCON", "pSMODCON" }, new Object[] { pPSPERSON, pCAGENTE, pTVALCON, pSMODCON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pTVALCON);
        cStmt.setObject(5, pSMODCON);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "SMODCONOUT"
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
            retVal.put("SMODCONOUT", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("SMODCONOUT", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_CONTACTOTLFFIJO(pPSPERSON, pCAGENTE, pTVALCON, pSMODCON); 
    }
    //--END-PAC_IAX_PERSONA.F_SET_CONTACTOTLFFIJO

    //--START-PAC_IAX_PERSONA.F_SET_ESTCONTACTOTLFFIJO (PSPERSON,    CAGENTE,  TVALCON,  SMODCON)

    private HashMap callPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON, java.math.BigDecimal pCPREFIX) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTCONTACTOTLFFIJO(?,?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pTVALCON", "pSMODCON", "pCPREFIX" }, new Object[] { pPSPERSON, pCAGENTE, pTVALCON, pSMODCON, pCPREFIX });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pTVALCON);
        cStmt.setObject(5, pSMODCON);
        cStmt.setObject(7, pCPREFIX);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "SMODCONOUT"
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
            retVal.put("SMODCONOUT", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("SMODCONOUT", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFFIJO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON, java.math.BigDecimal pCPREFIX) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFFIJO(pPSPERSON, pCAGENTE, pTVALCON, pSMODCON, pCPREFIX); 
    }
    //--END-PAC_IAX_PERSONA.F_SET_ESTCONTACTOTLFFIJO


    //--START- PAC_IAX_PERSONA__F_SET_CONTACTOTLFMOVIL(PSPERSON,    CAGENTE,  TVALCON,  SMODCON)

    private HashMap callPAC_IAX_PERSONA__F_SET_CONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CONTACTOTLFMOVIL(?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pTVALCON", "pSMODCON" }, new Object[] { pPSPERSON, pCAGENTE, pTVALCON, pSMODCON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pTVALCON);
        cStmt.setObject(5, pSMODCON);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "SMODCONOUT"
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
            retVal.put("SMODCONOUT", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("SMODCONOUT", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_CONTACTOTLFMOVIL(pPSPERSON, pCAGENTE, pTVALCON, pSMODCON); 
    }
    //--END-PAC_IAX_PERSONA__F_SET_CONTACTOTLFMOVIL

    //--START- PAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFMOVIL(PSPERSON,    CAGENTE,  TVALCON,  SMODCON)

    private HashMap callPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON, java.math.BigDecimal pCPREFIX) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTCONTACTOTLFMOVIL(?,?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pTVALCON", "pSMODCON", "pCPREFIX" }, new Object[] { pPSPERSON, pCAGENTE, pTVALCON, pSMODCON, pCPREFIX });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pTVALCON);
        cStmt.setObject(5, pSMODCON);
        cStmt.setObject(7, pCPREFIX);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "SMODCONOUT"
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
            retVal.put("SMODCONOUT", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("SMODCONOUT", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFMOVIL(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, String pTVALCON, java.math.BigDecimal pSMODCON, java.math.BigDecimal pCPREFIX) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFMOVIL(pPSPERSON, pCAGENTE, pTVALCON, pSMODCON, pCPREFIX); 
    }
    //--END-PAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFMOVIL

    //--START-PAC_IAX_PERSONA.F_SET_DIRECCION(PSPERSON,  PCAGENTE,  PCDOMICI,  PCTIPDIR,  PCSIGLAS,  PTNOMVIA,  PNNUMVIA,  PTCOMPLE,  PCPOSTAL,  PCPOBLAC,  PCPROVIN,  PCPAIS,  PCVIAVP,  PCLITVP,  PCBISVP,  PCORVP,  PNVIAADCO,  PCLITCO,  PCORCO,  PNPLACACO,  PCOR2CO,  PCDET1IA,  PTNUM1IA,  PCDET2IA,  PTNUM2IA,  PCDET3IA,  PTNUM3IA,  PLOCALIDAD,  PTALIAS)
    private HashMap callPAC_IAX_PERSONA__F_SET_DIRECCION (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCVIAVP, java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP, java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO, java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA, String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA, String pPTNUM3IA, String pPLOCALIDAD, String pPTALIAS) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_DIRECCION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCDOMICI", "pPCTIPDIR", "pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPCPOSTAL", "pPCPOBLAC", "pPCPROVIN", "pPCPAIS", "pPCVIAVP", "pPCLITVP", "pPCBISVP", "pPCORVP", "pPNVIAADCO", "pPCLITCO", "pPCORCO", "pPNPLACACO", "pPCOR2CO", "pPCDET1IA", "pPTNUM1IA", "pPCDET2IA", "pPTNUM2IA", "pPCDET3IA", "pPTNUM3IA", "pPLOCALIDAD", "pPTALIAS"}, new Object[] {pPSPERSON, pPCAGENTE, pPCDOMICI, pPCTIPDIR, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPLOCALIDAD, pPTALIAS});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.setObject(4, pPCDOMICI);
        cStmt.setObject(6, pPCTIPDIR);
        cStmt.setObject(7, pPCSIGLAS);
        cStmt.setObject(8, pPTNOMVIA);
        cStmt.setObject(9, pPNNUMVIA);
        cStmt.setObject(10, pPTCOMPLE);
        cStmt.setObject(11, pPCPOSTAL);
        cStmt.setObject(12, pPCPOBLAC);
        cStmt.setObject(13, pPCPROVIN);
        cStmt.setObject(14, pPCPAIS);
        cStmt.setObject(15, pPCVIAVP);
        cStmt.setObject(16, pPCLITVP);
        cStmt.setObject(17, pPCBISVP);
        cStmt.setObject(18, pPCORVP);
        cStmt.setObject(19, pPNVIAADCO);
        cStmt.setObject(20, pPCLITCO);
        cStmt.setObject(21, pPCORCO);
        cStmt.setObject(22, pPNPLACACO);
        cStmt.setObject(23, pPCOR2CO);
        cStmt.setObject(24, pPCDET1IA);
        cStmt.setObject(25, pPTNUM1IA);
        cStmt.setObject(26, pPCDET2IA);
        cStmt.setObject(27, pPTNUM2IA);
        cStmt.setObject(28, pPCDET3IA);
        cStmt.setObject(29, pPTNUM3IA);
        cStmt.setObject(30, pPLOCALIDAD);
        cStmt.setObject(31, pPTALIAS);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCDOMICIOUT"
        cStmt.registerOutParameter(32, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("PCDOMICIOUT", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("PCDOMICIOUT", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(32));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DIRECCION (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCVIAVP, java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP, java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO, java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA, String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA, String pPTNUM3IA, String pPLOCALIDAD, String pPTALIAS) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_DIRECCION(pPSPERSON, pPCAGENTE, pPCDOMICI, pPCTIPDIR, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPLOCALIDAD, pPTALIAS);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_SET_DIRECCION

       //--START-PAC_IAX_PERSONA.F_SET_ESTDIRECCION(PSPERSON,  PCAGENTE,  PCDOMICI,  PCTIPDIR,  PCSIGLAS,  PTNOMVIA,  PNNUMVIA,  PTCOMPLE,  PCPOSTAL,  PCPOBLAC,  PCPROVIN,  PCPAIS,  PCVIAVP,  PCLITVP,  PCBISVP,  PCORVP,  PNVIAADCO,  PCLITCO,  PCORCO,  PNPLACACO,  PCOR2CO,  PCDET1IA,  PTNUM1IA,  PCDET2IA,  PTNUM2IA,  PCDET3IA,  PTNUM3IA,  PLOCALIDAD)
       private HashMap callPAC_IAX_PERSONA__F_SET_ESTDIRECCION (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCVIAVP, java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP, java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO, java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA, String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA, String pPTNUM3IA, String pPLOCALIDAD) throws Exception {
           String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTDIRECCION(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
           
           logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCDOMICI", "pPCTIPDIR", "pPCSIGLAS", "pPTNOMVIA", "pPNNUMVIA", "pPTCOMPLE", "pPCPOSTAL", "pPCPOBLAC", "pPCPROVIN", "pPCPAIS", "pPCVIAVP", "pPCLITVP", "pPCBISVP", "pPCORVP", "pPNVIAADCO", "pPCLITCO", "pPCORCO", "pPNPLACACO", "pPCOR2CO", "pPCDET1IA", "pPTNUM1IA", "pPCDET2IA", "pPTNUM2IA", "pPCDET3IA", "pPTNUM3IA", "pPLOCALIDAD"}, new Object[] {pPSPERSON, pPCAGENTE, pPCDOMICI, pPCTIPDIR, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPLOCALIDAD});
           CallableStatement cStmt=conn.prepareCall(callQuery);
           String USERNAME=conn.getMetaData().getUserName().toUpperCase();
           cStmt.setObject(2, pPSPERSON);
           cStmt.setObject(3, pPCAGENTE);
           cStmt.setObject(4, pPCDOMICI);
           cStmt.setObject(6, pPCTIPDIR);
           cStmt.setObject(7, pPCSIGLAS);
           cStmt.setObject(8, pPTNOMVIA);
           cStmt.setObject(9, pPNNUMVIA);
           cStmt.setObject(10, pPTCOMPLE);
           cStmt.setObject(11, pPCPOSTAL);
           cStmt.setObject(12, pPCPOBLAC);
           cStmt.setObject(13, pPCPROVIN);
           cStmt.setObject(14, pPCPAIS);
           cStmt.setObject(15, pPCVIAVP);
           cStmt.setObject(16, pPCLITVP);
           cStmt.setObject(17, pPCBISVP);
           cStmt.setObject(18, pPCORVP);
           cStmt.setObject(19, pPNVIAADCO);
           cStmt.setObject(20, pPCLITCO);
           cStmt.setObject(21, pPCORCO);
           cStmt.setObject(22, pPNPLACACO);
           cStmt.setObject(23, pPCOR2CO);
           cStmt.setObject(24, pPCDET1IA);
           cStmt.setObject(25, pPTNUM1IA);
           cStmt.setObject(26, pPCDET2IA);
           cStmt.setObject(27, pPTNUM2IA);
           cStmt.setObject(28, pPCDET3IA);
           cStmt.setObject(29, pPTNUM3IA);
           cStmt.setObject(30, pPLOCALIDAD);
           cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
           cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCDOMICIOUT"
           cStmt.registerOutParameter(31, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
           cStmt.execute();
           HashMap retVal=new HashMap();
           try {
               retVal.put("RETURN", cStmt.getObject(1));
           }
           catch (SQLException e) {
               retVal.put("RETURN", null);
           }
           try {
               retVal.put("PCDOMICIOUT", cStmt.getObject(5));
           }
           catch (SQLException e) {
               retVal.put("PCDOMICIOUT", null);
           }
           try {
               retVal.put("MENSAJES", cStmt.getObject(31));
           }
           catch (SQLException e) {
               retVal.put("MENSAJES", null);
           }
           retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
           cStmt.close();//AXIS-WLS1SERVER-Ready
           
           return retVal;
       }

       public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTDIRECCION (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pPNNUMVIA, String pPTCOMPLE, String pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCVIAVP, java.math.BigDecimal pPCLITVP, java.math.BigDecimal pPCBISVP, java.math.BigDecimal pPCORVP, java.math.BigDecimal pPNVIAADCO, java.math.BigDecimal pPCLITCO, java.math.BigDecimal pPCORCO, java.math.BigDecimal pPNPLACACO, java.math.BigDecimal pPCOR2CO, java.math.BigDecimal pPCDET1IA, String pPTNUM1IA, java.math.BigDecimal pPCDET2IA, String pPTNUM2IA, java.math.BigDecimal pPCDET3IA, String pPTNUM3IA, String pPLOCALIDAD) throws Exception {
           return this.callPAC_IAX_PERSONA__F_SET_ESTDIRECCION(pPSPERSON, pPCAGENTE, pPCDOMICI, pPCTIPDIR, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPCPAIS, pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO, pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPLOCALIDAD);//AXIS-WLS1SERVER-Ready 
       }
       //--END-PAC_IAX_PERSONA.F_SET_ESTDIRECCION



     //--START-PAC_IAX_PERSONA.F_SET_BASICOS_PERSONA(PSPERSON,  PCTIPPER,  PCTIPIDE,  PNNUMIDE,  PCSEXPER,  PFNACIMI,  PSWPUBLI,  PSWRUT)
     private HashMap callPAC_IAX_PERSONA__F_SET_BASICOS_PERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPSWRUT, java.math.BigDecimal pPCPREAVISO) throws Exception {
         /* Cambio para IAXIS-14685 : start */
         String callQuery="{?=call PAC_IAX_PERSONA.F_SET_BASICOS_PERSONA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
         /* Cambio para IAXIS-14685 : end */
         logCall(callQuery, new String[] {"pPSPERSON", "pPCTIPPER", "pPCTIPIDE", "pPNNUMIDE", "pPCSEXPER", "pPFNACIMI", "pPSWPUBLI", "pPSWRUT", "pPCPREAVISO"}, new Object[] {pPSPERSON, pPCTIPPER, pPCTIPIDE, pPNNUMIDE, pPCSEXPER, pPFNACIMI, pPSWPUBLI, pPSWRUT, pPCPREAVISO});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSPERSON);
         cStmt.setObject(3, pPCTIPPER);
         cStmt.setObject(4, pPCTIPIDE);
         cStmt.setObject(5, pPNNUMIDE);
         cStmt.setObject(6, pPCSEXPER);
         cStmt.setObject(7, pPFNACIMI);
         cStmt.setObject(8, pPSWPUBLI);
         cStmt.setObject(9, pPSWRUT);
         cStmt.setObject(10, pPCPREAVISO);
         /* Cambio para IAXIS-14685 : start */
         cStmt.setBigDecimal(12, BigDecimal.ZERO); 
         /* Cambio para IAXIS-14685 : end */
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
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_PERSONA__F_SET_BASICOS_PERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPSWRUT, java.math.BigDecimal pPCPREAVISO) throws Exception {
         return this.callPAC_IAX_PERSONA__F_SET_BASICOS_PERSONA(pPSPERSON, pPCTIPPER, pPCTIPIDE, pPNNUMIDE, pPCSEXPER, pPFNACIMI, pPSWPUBLI, pPSWRUT, pPCPREAVISO);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_PERSONA.F_SET_BASICOS_PERSONA
      //--START-PAC_IAX_PERSONA.F_SET_ESTPERSONA(PSSEGURO,  PSPERSON,  PSPEREAL,  PCAGENTE,  CTIPPER,  CTIPIDE,  NNUMIDE,  CSEXPER,  FNACIMI,  SNIP,  CESTPER,  FJUBILA,  CMUTUALISTA,  FDEFUNC,  NORDIDE,  CIDIOMA,  TAPELLI1,  TAPELLI2,  TNOMBRE,  TSIGLAS,  CPROFES,  CESTCIV,  CPAIS,  PTNOMBRE1,  PTNOMBRE2,  PSWRUT,  PCOCUPACION)
      private HashMap callPAC_IAX_PERSONA__F_SET_ESTPERSONA (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPEREAL, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pCTIPPER, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCSEXPER, java.sql.Date pFNACIMI, String pSNIP, java.math.BigDecimal pCESTPER, java.sql.Date pFJUBILA, java.math.BigDecimal pCMUTUALISTA, java.sql.Date pFDEFUNC, java.math.BigDecimal pNORDIDE, java.math.BigDecimal pCIDIOMA, String pTAPELLI1, String pTAPELLI2, String pTNOMBRE, String pTSIGLAS, String pCPROFES, java.math.BigDecimal pCESTCIV, java.math.BigDecimal pCPAIS, String pPTNOMBRE1, String pPTNOMBRE2, java.math.BigDecimal pPSWRUT, String pPCOCUPACION) throws Exception {
          String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTPERSONA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
          
          logCall(callQuery, new String[] {"pPSSEGURO", "pPSPERSON", "pPSPEREAL", "pPCAGENTE", "pCTIPPER", "pCTIPIDE", "pNNUMIDE", "pCSEXPER", "pFNACIMI", "pSNIP", "pCESTPER", "pFJUBILA", "pCMUTUALISTA", "pFDEFUNC", "pNORDIDE", "pCIDIOMA", "pTAPELLI1", "pTAPELLI2", "pTNOMBRE", "pTSIGLAS", "pCPROFES", "pCESTCIV", "pCPAIS", "pPTNOMBRE1", "pPTNOMBRE2", "pPSWRUT", "pPCOCUPACION"}, new Object[] {pPSSEGURO, pPSPERSON, pPSPEREAL, pPCAGENTE, pCTIPPER, pCTIPIDE, pNNUMIDE, pCSEXPER, pFNACIMI, pSNIP, pCESTPER, pFJUBILA, pCMUTUALISTA, pFDEFUNC, pNORDIDE, pCIDIOMA, pTAPELLI1, pTAPELLI2, pTNOMBRE, pTSIGLAS, pCPROFES, pCESTCIV, pCPAIS, pPTNOMBRE1, pPTNOMBRE2, pPSWRUT, pPCOCUPACION});
          CallableStatement cStmt=conn.prepareCall(callQuery);
          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
          cStmt.setObject(2, pPSSEGURO);
          cStmt.setObject(3, pPSPERSON);
          cStmt.setObject(5, pPSPEREAL);
          cStmt.setObject(6, pPCAGENTE);
          cStmt.setObject(7, pCTIPPER);
          cStmt.setObject(8, pCTIPIDE);
          cStmt.setObject(9, pNNUMIDE);
          cStmt.setObject(10, pCSEXPER);
          cStmt.setObject(11, pFNACIMI);
          cStmt.setObject(12, pSNIP);
          cStmt.setObject(13, pCESTPER);
          cStmt.setObject(14, pFJUBILA);
          cStmt.setObject(15, pCMUTUALISTA);
          cStmt.setObject(16, pFDEFUNC);
          cStmt.setObject(17, pNORDIDE);
          cStmt.setObject(18, pCIDIOMA);
          cStmt.setObject(19, pTAPELLI1);
          cStmt.setObject(20, pTAPELLI2);
          cStmt.setObject(21, pTNOMBRE);
          cStmt.setObject(22, pTSIGLAS);
          cStmt.setObject(23, pCPROFES);
          cStmt.setObject(24, pCESTCIV);
          cStmt.setObject(25, pCPAIS);
          cStmt.setObject(26, pPTNOMBRE1);
          cStmt.setObject(27, pPTNOMBRE2);
          cStmt.setObject(28, pPSWRUT);
          cStmt.setObject(29, pPCOCUPACION);
          cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
          cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPERSONOUT"
          cStmt.registerOutParameter(30, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
          cStmt.execute();
          HashMap retVal=new HashMap();
          try {
              retVal.put("RETURN", cStmt.getObject(1));
          }
          catch (SQLException e) {
              retVal.put("RETURN", null);
          }
          try {
              retVal.put("PSPERSONOUT", cStmt.getObject(4));
          }
          catch (SQLException e) {
              retVal.put("PSPERSONOUT", null);
          }
          try {
              retVal.put("MENSAJES", cStmt.getObject(30));
          }
          catch (SQLException e) {
              retVal.put("MENSAJES", null);
          }
          retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
          cStmt.close();//AXIS-WLS1SERVER-Ready
          
          return retVal;
      }

      public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTPERSONA (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPEREAL, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pCTIPPER, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCSEXPER, java.sql.Date pFNACIMI, String pSNIP, java.math.BigDecimal pCESTPER, java.sql.Date pFJUBILA, java.math.BigDecimal pCMUTUALISTA, java.sql.Date pFDEFUNC, java.math.BigDecimal pNORDIDE, java.math.BigDecimal pCIDIOMA, String pTAPELLI1, String pTAPELLI2, String pTNOMBRE, String pTSIGLAS, String pCPROFES, java.math.BigDecimal pCESTCIV, java.math.BigDecimal pCPAIS, String pPTNOMBRE1, String pPTNOMBRE2, java.math.BigDecimal pPSWRUT, String pPCOCUPACION) throws Exception {
          return this.callPAC_IAX_PERSONA__F_SET_ESTPERSONA(pPSSEGURO, pPSPERSON, pPSPEREAL, pPCAGENTE, pCTIPPER, pCTIPIDE, pNNUMIDE, pCSEXPER, pFNACIMI, pSNIP, pCESTPER, pFJUBILA, pCMUTUALISTA, pFDEFUNC, pNORDIDE, pCIDIOMA, pTAPELLI1, pTAPELLI2, pTNOMBRE, pTSIGLAS, pCPROFES, pCESTCIV, pCPAIS, pPTNOMBRE1, pPTNOMBRE2, pPSWRUT, pPCOCUPACION);//AXIS-WLS1SERVER-Ready 
      }
      //--END-PAC_IAX_PERSONA.F_SET_ESTPERSONA

      //--START-PAC_IAX_PERSONA.F_SET_PERSONA(PSSEGURO,  PSPERSON,  PSPEREAL,  PCAGENTE,  CTIPPER,  CTIPIDE,  NNUMIDE,  CSEXPER,  FNACIMI,  SNIP,  CESTPER,  FJUBILA,  CMUTUALISTA,  FDEFUNC,  NORDIDE,  CIDIOMA,  TAPELLI1,  TAPELLI2,  TNOMBRE,  TSIGLAS,  CPROFES,  CESTCIV,  CPAIS,  PSWPUBLI,  PDUPLICADA,  PTNOMBRE1,  PTNOMBRE2,  PSWRUT,  PCOCUPACION)
         private HashMap callPAC_IAX_PERSONA__F_SET_PERSONA (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPEREAL, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pCTIPPER, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCSEXPER, java.sql.Date pFNACIMI, String pSNIP, java.math.BigDecimal pCESTPER, java.sql.Date pFJUBILA, java.math.BigDecimal pCMUTUALISTA, java.sql.Date pFDEFUNC, java.math.BigDecimal pNORDIDE, java.math.BigDecimal pCIDIOMA, String pTAPELLI1, String pTAPELLI2, String pTNOMBRE, String pTSIGLAS, String pCPROFES, java.math.BigDecimal pCESTCIV, java.math.BigDecimal pCPAIS, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPDUPLICADA, String pPTNOMBRE1, String pPTNOMBRE2, java.math.BigDecimal pPSWRUT, String pPCOCUPACION,
                 java.math.BigDecimal pTTipoosc, java.math.BigDecimal pPCIIU, java.sql.Date pFConsti, Axisper010Service.PerDireccion pDireccion, Axisper010Service.PerContacto pContacto, java.math.BigDecimal pCNacionalidad,   java.math.BigDecimal pTDigitoide, java.math.BigDecimal pSFINANCI,java.sql.Date pFEFECTO,java.math.BigDecimal pCREGFISCAL,java.math.BigDecimal pCTIPIVA,List<Map> plTablaImptos
                /* IAXIS-13881 : Cambios de facturacion electronica : start */
                ,Axisper010Service.PerFacturacion_Electronica pFacturacion_Electronica,java.math.BigDecimal pPPARCIR037) throws Exception {
             /* Cambio para IAXIS-14685 : start */ 
             String callQuery="{?=call PAC_IAX_PERSONA.F_SET_PERSONA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
             /* Cambio para IAXIS-14685 : end */ 
                /* IAXIS-13881 : Cambios de facturacion electronica : end */
             OracleConnection oconn = conn.unwrap(OracleConnection.class);  
             
                       
             StructDescriptor recDescriptorImp  = StructDescriptor.createDescriptor("OB_IAX_PROF_IMPUESTOS", oconn);
             ArrayDescriptor arrayDescriptorImp = ArrayDescriptor.createDescriptor("T_IAX_PROF_IMPUESTOS", oconn); //T_IAX_PROF_IMPUESTOS             
             STRUCT[] recordsImp       = new STRUCT[plTablaImptos.size()];
             for(int i=0;i<plTablaImptos.size();i++) 
             {
                 Map indicador = (Map) plTablaImptos.get(i).get("OB_IAX_PROF_IMPUESTOS");
                 /* Cambio para bug-14446 : start */ 
                 if(indicador.get("ID").equals(pNNUMIDE))
                 {
                     recordsImp[i] = new STRUCT(recDescriptorImp, oconn, new Object[] {indicador.get("CCODIMP"),indicador.get("CCODVIN"),indicador.get("CTIPIND"),indicador.get("CCODAGEN"),indicador.get("CUSUARI"),indicador.get("FALTA")});                   
                 }
                 /* Cambio para bug-14446 : end */
                 logger.debug("Objeto pObjImppuestos :: "+indicador);
             }
                    
             ARRAY  pObjImpuesto = new ARRAY(arrayDescriptorImp, oconn,recordsImp);
            
             /* IAXIS-13881 : Cambios de facturacion electronica : start*/
             StructDescriptor recDescriptorFE  = StructDescriptor.createDescriptor("OB_IAX_FACT_ELECTRONICA_PER", oconn);
             ArrayDescriptor arrayDescriptorFE = ArrayDescriptor.createDescriptor("T_IAX_FACT_ELECTRONICA_PER", oconn); //T_IAX_FACT_ELECTRONICA_PER             
             STRUCT[] recordsFE       = new STRUCT[1];
             recordsFE[0] = new STRUCT(recDescriptorFE, oconn, new Object[] {pFacturacion_Electronica.getNit_proveedor(),pFacturacion_Electronica.getCresponsable_iva(),null,pFacturacion_Electronica.getCfiscales_adquiriente(),null,pFacturacion_Electronica.getCorreo_fact_elect(),pFacturacion_Electronica.getApplica_fact_elect(),null,null});             
             logger.debug("Objeto pObjFacturacion_Electronica :: "+pFacturacion_Electronica);
             ARRAY  pObjFacturacion_Electronica = new ARRAY(arrayDescriptorFE, oconn,recordsFE);
             /* IAXIS-13881 : Cambios de facturacion electronica : end*/
                     
             StructDescriptor recDescriptor  = StructDescriptor.createDescriptor("OB_IAX_CONTACTOS_PER", oconn);
             ArrayDescriptor arrayDescriptor = ArrayDescriptor.createDescriptor("T_IAX_CONTACTOS_PER", oconn); //T_IAX_CONTACTOS_PER             
             STRUCT[] records       = new STRUCT[1];
             records[0] = new STRUCT(recDescriptor, oconn, new Object[] {pContacto.getTelFijo(),pContacto.getPrexi_telFijo(),pContacto.getTelMovil(),pContacto.getPrexi_telMovil(),pContacto.getEmail(),pContacto.getTelFax(),pContacto.getPrexi_telFax()});             
             logger.debug("Objeto pObjContacto :: "+pContacto);
             ARRAY  pObjContacto = new ARRAY(arrayDescriptor, oconn,records);
             
             
             StructDescriptor recDescriptorDir  = StructDescriptor.createDescriptor("OB_IAX_DIRECCIONES", oconn);
             ArrayDescriptor arrayDescriptorDir = ArrayDescriptor.createDescriptor("T_IAX_DIRECCIONES", oconn); //T_IAX_DIRECCIONES             
             STRUCT[] recordsDir       = new STRUCT[1];
             logger.debug("Objeto Direccion :: "+pDireccion);
             
             recordsDir[0] = new STRUCT(recDescriptorDir, oconn, new Object[] {pDireccion.getcDomici(), pDireccion.gettDomici(), pDireccion.getPostal(), pDireccion.getProvin(), pDireccion.gettProvin(), pDireccion.getPobla(), pDireccion.gettPoblac(), pDireccion.getPais_direccion(), pDireccion.gettPais(), 
                     pDireccion.getTipDir(), pDireccion.gettTipDir(), pDireccion.getcSiglas(), pDireccion.gettSiglas(), pDireccion.getNomVia(), pDireccion.getnNumvia(), pDireccion.gettComple(), pDireccion.getcCiudad(), pDireccion.getfGisX(), pDireccion.getfGisY(), pDireccion.getfGisZ(), pDireccion.getcValida(), pDireccion.getViaVp(),
                     pDireccion.getLitVp(), pDireccion.getBisVp(), pDireccion.getCorVp(), pDireccion.getViaAdco(), pDireccion.getLitCo(), pDireccion.getCorCo(), pDireccion.getPlacaCo(), pDireccion.getCor2co(), pDireccion.getDet1ia(), pDireccion.getNum1ia(),
                     pDireccion.getDet2ia(), pDireccion.getNum2ia(),pDireccion.getDet3ia(), pDireccion.getNum3ia(),pDireccion.getLocalidad(), pDireccion.getAlias(), pDireccion.getNueva(), pDireccion.getFdefecto()}); 
             
             ARRAY  pObjDireccion = new ARRAY(arrayDescriptorDir, oconn,recordsDir);
            // logger.debug("Objeto Direccion :: "+pObjDireccion.stringValue() + " :: "+ pObjDireccion.toString() + " :: "+pObjDireccion.getLength()+ " :: "+pObjDireccion.getLocator().toString());
             //ARRAY pObjContacto = new ARRAY(ArrayDescriptor.createDescriptor("T_IAX_CONTACTOS_PER", conn), conn,new STRUCT (StructDescriptor.createDescriptor("OB_IAX_CONTACTOS_PER", conn), conn, new Object[] {pContacto.getTelFijo(),pContacto.getPrexi_telFijo(),pContacto.getTelMovil(),pContacto.getPrexi_telMovil(),pContacto.getEmail(),pContacto.getTelFax(),pContacto.getPrexi_telFax()}));
             /*ARRAY pObjDireccion = new ARRAY(ArrayDescriptor.createDescriptor("T_IAX_DIRECCIONES", conn), conn,new STRUCT (StructDescriptor.createDescriptor("ob_iax_direcciones", conn), conn, new Object[] {pDireccion.getcDomici(), pDireccion.gettDomici(), pDireccion.getPostal(), pDireccion.getProvin(), pDireccion.gettProvin(), pDireccion.getPobla(), pDireccion.gettPoblac(), pDireccion.getPais_direccion(), pDireccion.gettPais(), 
                     pDireccion.getTipDir(), pDireccion.gettTipDir(), pDireccion.getcSiglas(), pDireccion.gettSiglas(), pDireccion.getNomVia(), pDireccion.getnNumvia(), pDireccion.gettComple(), pDireccion.getcCiudad(), pDireccion.getfGisX(), pDireccion.getfGisY(), pDireccion.getfGisZ(), pDireccion.getcValida(), pDireccion.getViaVp(),
                     pDireccion.getLitVp(), pDireccion.getBisVp(), pDireccion.getCorVp(), pDireccion.getViaAdco(), pDireccion.getLitCo(), pDireccion.getCorCo(), pDireccion.getPlacaCo(), pDireccion.getCor2co(), pDireccion.getDet1ia(), pDireccion.getNum1ia(),
                     pDireccion.getDet2ia(), pDireccion.getNum2ia(),pDireccion.getDet3ia(), pDireccion.getNum3ia(),pDireccion.getLocalidad(), pDireccion.getAlias(), pDireccion.getNueva(), pDireccion.getFdefecto()}));
             */
            
             /* IAXIS-13881 : Cambios de facturacion electronica : start*/
             logCall(callQuery, new String[] {"pPSSEGURO", "pPSPERSON", "pPSPEREAL", "pPCAGENTE", "pCTIPPER", "pCTIPIDE", "pNNUMIDE", "pCSEXPER", "pFNACIMI", "pSNIP", "pCESTPER", "pFJUBILA", "pCMUTUALISTA", "pFDEFUNC", "pNORDIDE", "pCIDIOMA", "pTAPELLI1", "pTAPELLI2", "pTNOMBRE", "pTSIGLAS", "pCPROFES", "pCESTCIV", "pCPAIS", "pPSWPUBLI", "pPDUPLICADA", "pPTNOMBRE1", "pPTNOMBRE2", "pPSWRUT", "pPCOCUPACION", "pTipoosc", "pPCIIU", "pSFINANCI", "pFConsti", "pContacto", "pDireccion", "pCNacionalidad", "pDigitoide","pFEFECTO","pCREGFISCAL","pCTIPIVA","pObjImpuesto","pFacturacion_Electronica"}, 
                     new Object[] {pPSSEGURO, pPSPERSON, pPSPEREAL, pPCAGENTE, pCTIPPER, pCTIPIDE, pNNUMIDE, pCSEXPER, pFNACIMI, pSNIP, pCESTPER, pFJUBILA, pCMUTUALISTA, pFDEFUNC, pNORDIDE, pCIDIOMA, pTAPELLI1, pTAPELLI2, pTNOMBRE, pTSIGLAS, pCPROFES, pCESTCIV, pCPAIS, pPSWPUBLI, pPDUPLICADA, pPTNOMBRE1, pPTNOMBRE2, pPSWRUT, pPCOCUPACION, pTTipoosc, pPCIIU, pSFINANCI, pFConsti, pObjContacto, pObjDireccion, pCNacionalidad, pTDigitoide,pFEFECTO,pCREGFISCAL,pCTIPIVA,pObjImpuesto,pObjFacturacion_Electronica});
             /* IAXIS-13881 : Cambios de facturacion electronica : end*/
             CallableStatement cStmt=conn.prepareCall(callQuery);
             String USERNAME=conn.getMetaData().getUserName().toUpperCase();
             cStmt.setObject(2, pPSSEGURO);
             cStmt.setObject(3, pPSPERSON);
             cStmt.setObject(5, pPSPEREAL);
             cStmt.setObject(6, pPCAGENTE);
             cStmt.setObject(7, pCTIPPER);
             cStmt.setObject(8, pCTIPIDE);
             cStmt.setObject(9, pNNUMIDE);
             cStmt.setObject(10, pCSEXPER);
             cStmt.setObject(11, pFNACIMI);
             cStmt.setObject(12, pSNIP);
             cStmt.setObject(13, pCESTPER);
             cStmt.setObject(14, pFJUBILA);
             cStmt.setObject(15, pCMUTUALISTA);
             cStmt.setObject(16, pFDEFUNC);
             cStmt.setObject(17, pNORDIDE);
             cStmt.setObject(18, pCIDIOMA);
             cStmt.setObject(19, pTAPELLI1);
             cStmt.setObject(20, pTAPELLI2);
             cStmt.setObject(21, pTNOMBRE);
             cStmt.setObject(22, pTSIGLAS);
             cStmt.setObject(23, pCPROFES);
             cStmt.setObject(24, pCESTCIV);
             cStmt.setObject(25, pCPAIS);
             cStmt.setObject(26, pPSWPUBLI);
             cStmt.setObject(27, pPDUPLICADA);
             cStmt.setObject(28, pPTNOMBRE1);
             cStmt.setObject(29, pPTNOMBRE2);
             cStmt.setObject(30, pPSWRUT);
             cStmt.setObject(31, pPCOCUPACION);
             cStmt.setObject(32, pTTipoosc);
             cStmt.setObject(33, pPCIIU);
             cStmt.setObject(34, pSFINANCI);
             cStmt.setObject(35, pFConsti);
             cStmt.setObject(36, pObjContacto);
             cStmt.setObject(37, pObjDireccion);
             cStmt.setObject(38, pCNacionalidad);
             cStmt.setObject(39, pTDigitoide);
             cStmt.setObject(42, pFEFECTO);
             cStmt.setObject(43, pCREGFISCAL);
             cStmt.setObject(44, pCTIPIVA);
             cStmt.setObject(45, pObjImpuesto);
             /* IAXIS-13881 : Cambios de facturacion electronica : start*/
             cStmt.setObject(46,pObjFacturacion_Electronica);
             /* IAXIS-13881 : Cambios de facturacion electronica : end*/
             /* Cambio para IAXIS-14685 : start */ 
             cStmt.setBigDecimal(47, BigDecimal.ZERO);             
             /* Cambio para IAXIS-14685 : end */ 
             cStmt.setBigDecimal(48, pPPARCIR037); /* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES */
             cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
             cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PSPERSONOUT"
             cStmt.registerOutParameter(40, java.sql.Types.NUMERIC); // Valor de "PCAGENTEOUT"
             cStmt.registerOutParameter(41, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
             cStmt.execute();
             HashMap retVal=new HashMap();
             try {
                 retVal.put("RETURN", cStmt.getObject(1));
             }
             catch (SQLException e) {
                 retVal.put("RETURN", null);
             }
             try {
                 retVal.put("PSPERSONOUT", cStmt.getObject(4));
             }
             catch (SQLException e) {
                 retVal.put("PSPERSONOUT", null);
             }
             try {
                 retVal.put("PCAGENTEOUT", cStmt.getObject(40));
             }
             catch (SQLException e) {
                 retVal.put("PCAGENTEOUT", null);
             }
             try {
                 retVal.put("MENSAJES", cStmt.getObject(41));
             }
             catch (SQLException e) {
                 retVal.put("MENSAJES", null);
             }
             retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
             cStmt.close();//AXIS-WLS1SERVER-Ready
             
             return retVal;
         }

      public HashMap ejecutaPAC_IAX_PERSONA__F_SET_PERSONA (java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSPEREAL, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pCTIPPER, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCSEXPER, java.sql.Date pFNACIMI, String pSNIP, java.math.BigDecimal pCESTPER, java.sql.Date pFJUBILA, java.math.BigDecimal pCMUTUALISTA, java.sql.Date pFDEFUNC, java.math.BigDecimal pNORDIDE, java.math.BigDecimal pCIDIOMA, String pTAPELLI1, String pTAPELLI2, String pTNOMBRE, String pTSIGLAS, String pCPROFES, java.math.BigDecimal pCESTCIV, java.math.BigDecimal pCPAIS, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPDUPLICADA, String pPTNOMBRE1, String pPTNOMBRE2, java.math.BigDecimal pPSWRUT, String pPCOCUPACION,
              java.math.BigDecimal pTTipoosc, java.math.BigDecimal pPCIIU, java.sql.Date pFConsti, Axisper010Service.PerDireccion pDireccion, Axisper010Service.PerContacto pContacto, java.math.BigDecimal pCNacionalidad,   java.math.BigDecimal pTDigitoide, java.math.BigDecimal pSFINANCI,java.sql.Date pFEFECTO,java.math.BigDecimal pCREGFISCAL,java.math.BigDecimal pCTIPIVA,List<Map> plTablaImptos
              /* IAXIS-13881 : Cambios de facturacion electronica : start*/           
              ,Axisper010Service.PerFacturacion_Electronica pFacturacion_Electronica,java.math.BigDecimal pPPARCIR037) throws Exception {
          return this.callPAC_IAX_PERSONA__F_SET_PERSONA(pPSSEGURO, pPSPERSON, pPSPEREAL, pPCAGENTE, pCTIPPER, pCTIPIDE, pNNUMIDE, pCSEXPER, pFNACIMI, pSNIP, pCESTPER, pFJUBILA, pCMUTUALISTA, pFDEFUNC, pNORDIDE, pCIDIOMA, pTAPELLI1, pTAPELLI2, pTNOMBRE, pTSIGLAS, pCPROFES, pCESTCIV, pCPAIS, pPSWPUBLI, pPDUPLICADA, pPTNOMBRE1, pPTNOMBRE2, pPSWRUT, pPCOCUPACION,
                  pTTipoosc, pPCIIU, pFConsti, pDireccion, pContacto, pCNacionalidad, pTDigitoide, pSFINANCI, pFEFECTO, pCREGFISCAL, pCTIPIVA,plTablaImptos
                  ,pFacturacion_Electronica, pPPARCIR037);//IAXIS-15419 : CIRCULAR 037 MODIFICACIONES //AXIS-WLS1SERVER-Ready 
              /* IAXIS-13881 : Cambios de facturacion electronica : end*/
      }
      //--END-PAC_IAX_PERSONA.F_SET_PERSONA
    
    //--END-PAC_IAX_PERSONA.F_GRABAESTPERSONA
    //--START-PAC_IAX_PERSONA__F_SET_NACIONALIDADDEFECTO(PSPERSON,   CAGENTE,  CPAIS)

    private HashMap callPAC_IAX_PERSONA__F_SET_NACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_NACIONALIDADDEFECTO(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCPAIS" }, new Object[] { pPSPERSON, pCAGENTE, pCPAIS });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCPAIS);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_NACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_NACIONALIDADDEFECTO(pPSPERSON, pCAGENTE, pCPAIS); 
    }
    //--END-PAC_IAX_PERSONA__F_SET_NACIONALIDADDEFECTO

    //--START-PAC_IAX_PERSONA__F_SET_ESTNACIONALIDADDEFECTO(PSPERSON,   CAGENTE,  CPAIS)

    private HashMap callPAC_IAX_PERSONA__F_SET_ESTNACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTNACIONALIDADDEFECTO(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCPAIS" }, new Object[] { pPSPERSON, pCAGENTE, pCPAIS });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCPAIS);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTNACIONALIDADDEFECTO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_ESTNACIONALIDADDEFECTO(pPSPERSON, pCAGENTE, pCPAIS); 
    }
    //--END-PAC_IAX_PERSONA__F_SET_ESTNACIONALIDADDEFECTO

    //--START-PAC_IAX_PERSONA__F_SET_ESTNACIONALIDADDEFECTO(PSPERSON,   CAGENTE,  CPAIS)

    private HashMap callPAC_IAX_PERSONA__F_SET_NACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS, java.math.BigDecimal pCDEFECTO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_NACIONALIDAD(?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCPAIS", "pCDEFECTO" }, new Object[] { pPSPERSON, pCAGENTE, pCPAIS, pCDEFECTO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCPAIS);
        cStmt.setObject(5, pCDEFECTO);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_NACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS, java.math.BigDecimal pCDEFECTO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_NACIONALIDAD(pPSPERSON, pCAGENTE, pCPAIS, pCDEFECTO); 
    }

    //--START-PAC_IAX_PERSONA.F_SET_IDENTIFICADOR(PSPERSON,  CAGENTE,  CTIPIDE,  NNUMIDE,  CDEFECTO,  PAISEXP,  CDEPARTEXP,  CCIUDADEXP,  FECHAEXP)
    private HashMap callPAC_IAX_PERSONA__F_SET_IDENTIFICADOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCDEFECTO, java.math.BigDecimal pPAISEXP, java.math.BigDecimal pCDEPARTEXP, java.math.BigDecimal pCCIUDADEXP, java.sql.Date pFECHAEXP) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_IDENTIFICADOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pCTIPIDE", "pNNUMIDE", "pCDEFECTO", "pPAISEXP", "pCDEPARTEXP", "pCCIUDADEXP", "pFECHAEXP"}, new Object[] {pPSPERSON, pCAGENTE, pCTIPIDE, pNNUMIDE, pCDEFECTO, pPAISEXP, pCDEPARTEXP, pCCIUDADEXP, pFECHAEXP});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCTIPIDE);
        cStmt.setObject(5, pNNUMIDE);
        cStmt.setObject(6, pCDEFECTO);
        cStmt.setObject(8, pPAISEXP);
        cStmt.setObject(9, pCDEPARTEXP);
        cStmt.setObject(10, pCCIUDADEXP);
        cStmt.setObject(11, pFECHAEXP);
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
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_IDENTIFICADOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCDEFECTO, java.math.BigDecimal pPAISEXP, java.math.BigDecimal pCDEPARTEXP, java.math.BigDecimal pCCIUDADEXP, java.sql.Date pFECHAEXP) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_IDENTIFICADOR(pPSPERSON, pCAGENTE, pCTIPIDE, pNNUMIDE, pCDEFECTO, pPAISEXP, pCDEPARTEXP, pCCIUDADEXP, pFECHAEXP);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_SET_IDENTIFICADOR



    //--START-callPAC_IAX_PERSONA__F_SET_IDENTIFICADOR(PSPERSON,   CAGENTE,  pCTIPIDE,pNNUMIDE)

    private HashMap callPAC_IAX_PERSONA__F_SET_ESTIDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCDEFECTO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTIDENTIFICADOR(?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCTIPIDE", "pNNUMIDE", "pCDEFECTO" }, new Object[] { pPSPERSON, pCAGENTE, pCTIPIDE, pNNUMIDE, pCDEFECTO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCTIPIDE);
        cStmt.setObject(5, pNNUMIDE);
        cStmt.setObject(6, pCDEFECTO);
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
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTIDENTIFICADOR(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCDEFECTO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_ESTIDENTIFICADOR(pPSPERSON, pCAGENTE, pCTIPIDE, pNNUMIDE, pCDEFECTO); 
    }
    //--END-PAC_IAX_PERSONA__F_SET_ESTIDENTIFICADOR    


    private HashMap callPAC_IAX_PERSONA__F_TRASPASAPERSONAEST(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCODITABLA, java.math.BigDecimal pPSSEGURO, String pPSNIP) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_TRASPASAPERSONAEST(?,?,?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE", "pPCODITABLA", "pPSSEGURO", "pPSNIP" }, new Object[] { pPSPERSON, pPCAGENTE, pPCODITABLA, pPSSEGURO, pPSNIP });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();

        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPSNIP);
        cStmt.setObject(4, pPCAGENTE);
        cStmt.setObject(5, pPCODITABLA);
        cStmt.setObject(7, pPSSEGURO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, java.sql.Types.NUMERIC); // Valor de "PSPERSON_OUT"
        cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "pmensapotup"
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
            retVal.put("PSPERSON_OUT", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("PSPERSON_OUT", null);
        }
        try {
            retVal.put("PMENSAPOPUP", cStmt.getObject(8));
        }
        catch (SQLException e) {
            retVal.put("PMENSAPOPUP", null);
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


    public HashMap ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAEST(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCODITABLA, java.math.BigDecimal pPSSEGURO, String pPSNIP) throws Exception {
        return this.callPAC_IAX_PERSONA__F_TRASPASAPERSONAEST(pPSPERSON, pPCAGENTE, pPCODITABLA, pPSSEGURO, pPSNIP); 
    }
    //--END-PAC_IAX_PERSONA.F_TRASPASAPERSONAEST

    //--START-PAC_IAX_PERSONA.F_VALIDACCC(PCTIPBAN,  CBANCAR)

    private HashMap callPAC_IAX_PERSONA__F_VALIDACCC(java.math.BigDecimal pPCTIPBAN, String pCBANCAR) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_VALIDACCC(?,?,?)}";
        logCall(callQuery, new String[] { "pPCTIPBAN", "pCBANCAR" }, new Object[] { pPCTIPBAN, pCBANCAR });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCTIPBAN);
        cStmt.setObject(3, pCBANCAR);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_VALIDACCC(java.math.BigDecimal pPCTIPBAN, String pCBANCAR) throws Exception {
        return this.callPAC_IAX_PERSONA__F_VALIDACCC(pPCTIPBAN, pCBANCAR); 
    }
    //--END-PAC_IAX_PERSONA.F_VALIDACCC


    //--START-PAC_IAX_PERSONA.F_VALIDA_DIRECCION(PSPERSON,   PCAGENTE,  PCTIPDIR,  PCSIGLAS,  PTNOMVIA,  NNUMVIA,  PTCOMPLE,  PCPOSTAL,  PCPOBLAC,  PCPROVIN,  PCPAIS)

    private HashMap callPAC_IAX_PERSONA__F_VALIDA_DIRECCION(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pNNUMVIA, String pPTCOMPLE, java.math.BigDecimal pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_VALIDA_DIRECCION(?,?,?,?,?,?,?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCAGENTE", "pPCTIPDIR", "pPCSIGLAS", "pPTNOMVIA", "pNNUMVIA", "pPTCOMPLE", "pPCPOSTAL", "pPCPOBLAC", "pPCPROVIN", "pPCPAIS" }, new Object[] { pPSPERSON, pPCAGENTE, pPCTIPDIR, pPCSIGLAS, pPTNOMVIA, pNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPCPAIS });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.setObject(4, pPCTIPDIR);
        cStmt.setObject(5, pPCSIGLAS);
        cStmt.setObject(6, pPTNOMVIA);
        cStmt.setObject(7, pNNUMVIA);
        cStmt.setObject(8, pPTCOMPLE);
        cStmt.setObject(9, pPCPOSTAL);
        cStmt.setObject(10, pPCPOBLAC);
        cStmt.setObject(11, pPCPROVIN);
        cStmt.setObject(12, pPCPAIS);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_VALIDA_DIRECCION(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPDIR, java.math.BigDecimal pPCSIGLAS, String pPTNOMVIA, java.math.BigDecimal pNNUMVIA, String pPTCOMPLE, java.math.BigDecimal pPCPOSTAL, java.math.BigDecimal pPCPOBLAC, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPAIS) throws Exception {
        return this.callPAC_IAX_PERSONA__F_VALIDA_DIRECCION(pPSPERSON, pPCAGENTE, pPCTIPDIR, pPCSIGLAS, pPTNOMVIA, pNNUMVIA, pPTCOMPLE, pPCPOSTAL, pPCPOBLAC, pPCPROVIN, pPCPAIS); 
    }
    //--END-PAC_IAX_PERSONA.F_VALIDA_DIRECCION

    //--START-PAC_IAX_PERSONA.F_GET_PROVINPOBLA(PCPOSTAL)



    // 34989/209710 - Se agrega par?tro de salida pautocalle
    //   
    private HashMap callPAC_IAX_PERSONA__F_GET_PROVINPOBLA(String pPCPOSTAL) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PROVINPOBLA(?,?,?,?,?,?,?,?,?)}";
        logCall(callQuery, new String[] { "pPCPOSTAL" }, new Object[] { pPCPOSTAL });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCPOSTAL);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "CPAIS"
        cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "TPAIS"
        cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "CPROVIN"
        cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "TPROVIN"
        cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "CPOBLAC"
        cStmt.registerOutParameter(8, java.sql.Types.VARCHAR); // Valor de "TPOBLAC"
        cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de PAUTOCALLE"
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
            retVal.put("CPAIS", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("CPAIS", null);
        }
        try {
            retVal.put("TPAIS", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("TPAIS", null);
        }
        try {
            retVal.put("CPROVIN", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("CPROVIN", null);
        }
        try {
            retVal.put("TPROVIN", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("TPROVIN", null);
        }
        try {
            retVal.put("CPOBLAC", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("CPOBLAC", null);
        }
        try {
            retVal.put("TPOBLAC", cStmt.getObject(8));
        }
        catch (SQLException e) {
            retVal.put("TPOBLAC", null);
        }
        
        try {
            retVal.put("PAUTOCALLE", cStmt.getObject(9));
        }
        catch (SQLException e) {
            retVal.put("PAUTOCALLE", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PROVINPOBLA(String pPCPOSTAL) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PROVINPOBLA(pPCPOSTAL); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PROVINPOBLA

  //--START-PAC_IAX_PERSONA.F_GET_PERSONAS_AGENTES(NUMIDE,  NOMBRE,  NSIP,  PSSEGURO,  PNOM,  PCOGNOM1,  PCOGNOM2,  PCTIPIDE,  PFNACIMI,  PTDOMICI,  PCPOSTAL,  PHOSPITAL,  PFIDEICO)
    private HashMap callPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES (String pNUMIDE, String pNOMBRE, String pNSIP, java.math.BigDecimal pPSSEGURO, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.sql.Date pPFNACIMI, String pPTDOMICI, String pPCPOSTAL, String pPHOSPITAL, String pPFIDEICO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONAS_AGENTES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pNUMIDE", "pNOMBRE", "pNSIP", "pPSSEGURO", "pPNOM", "pPCOGNOM1", "pPCOGNOM2", "pPCTIPIDE", "pPFNACIMI", "pPTDOMICI", "pPCPOSTAL", "pPHOSPITAL","pPFIDEICO"}, new Object[] {pNUMIDE, pNOMBRE, pNSIP, pPSSEGURO, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPFNACIMI, pPTDOMICI, pPCPOSTAL, pPHOSPITAL,pPFIDEICO});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pNUMIDE);
        cStmt.setObject(3, pNOMBRE);
        cStmt.setObject(4, pNSIP);
        cStmt.setObject(5, pPSSEGURO);
        cStmt.setObject(6, pPNOM);
        cStmt.setObject(7, pPCOGNOM1);
        cStmt.setObject(8, pPCOGNOM2);
        cStmt.setObject(9, pPCTIPIDE);
        cStmt.setObject(10, pPFNACIMI);
        cStmt.setObject(11, pPTDOMICI);
        cStmt.setObject(12, pPCPOSTAL);
        cStmt.setObject(13, pPHOSPITAL);
        cStmt.setObject(14, pPFIDEICO);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES (String pNUMIDE, String pNOMBRE, String pNSIP, java.math.BigDecimal pPSSEGURO, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.sql.Date pPFNACIMI, String pPTDOMICI, String pPCPOSTAL, String pPHOSPITAL, String pPFIDEICO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES(pNUMIDE, pNOMBRE, pNSIP, pPSSEGURO, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPFNACIMI, pPTDOMICI, pPCPOSTAL, pPHOSPITAL, pPFIDEICO);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PERSONAS_AGENTES




    //--START-PAC_IAX_PERSONA.F_GET_PERSONAS_HOST(NUMIDE,  NOMBRE,  NSIP,  PSSEGURO,  PNOM,  PCOGNOM1,  PCOGNOM2,  PCTIPIDE)

    private HashMap callPAC_IAX_PERSONA__F_GET_PERSONAS_HOST(String pNUMIDE, String pNOMBRE, String pNSIP, java.math.BigDecimal pPSSEGURO, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONAS_HOST(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pNUMIDE", "pNOMBRE", "pNSIP", "pPSSEGURO", "pPNOM", "pPCOGNOM1", "pPCOGNOM2", "pPCTIPIDE" }, new Object[] { pNUMIDE, pNOMBRE, pNSIP, pPSSEGURO, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pNUMIDE);
        cStmt.setObject(3, pNOMBRE);
        cStmt.setObject(4, pNSIP);
        cStmt.setObject(6, pPSSEGURO);
        cStmt.setObject(7, pPNOM);
        cStmt.setObject(8, pPCOGNOM1);
        cStmt.setObject(9, pPCOGNOM2);
        cStmt.setObject(10, pPCTIPIDE);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.registerOutParameter(11, java.sql.Types.NUMERIC); // Valor de "POMASDATOS"
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
        try {
            retVal.put("POMASDATOS", cStmt.getObject(11));
        }
        catch (SQLException e) {
            retVal.put("POMASDATOS", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_HOST(String pNUMIDE, String pNOMBRE, String pNSIP, java.math.BigDecimal pPSSEGURO, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PERSONAS_HOST(pNUMIDE, pNOMBRE, pNSIP, pPSSEGURO, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PERSONAS_HOST


    //--START-PAC_IAX_LISTVALORES.F_GET_TIPCONTACTOS()

    private HashMap callPAC_IAX_PERSONA__F_GET_TIPCONTACTOS() throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_Get_TipContactos (?)}";
        logCall(callQuery, new String[] { }, new Object[] { });
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_TIPCONTACTOS() throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_TIPCONTACTOS(); 
    }
    //--END-PAC_IAX_LISTVALORES.F_Get_TipContactos  

    //--START-PAC_IAX_PERSONA.F_GET_POLASE(PSPERSON)

    private HashMap callPAC_IAX_PERSONA__F_GET_POLASE(java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_POLASE(?, ?)}";

        logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_POLASE(java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_POLASE(pPSPERSON); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_POLASE
    //--START-PAC_IAX_PERSONA.F_GET_POLTOM(PSPERSON)

    private HashMap callPAC_IAX_PERSONA__F_GET_POLTOM(java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_POLTOM(?, ?)}";

        logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_POLTOM(java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_POLTOM(pPSPERSON); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_POLTOM


    //--START-PAC_IAX_PERSONA.F_DIRECCION_ORIGEN_INT(PSPERSON,  PCDOMICI)

    private HashMap callPAC_IAX_PERSONA__F_DIRECCION_ORIGEN_INT(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCDOMICI) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DIRECCION_ORIGEN_INT(?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCDOMICI" }, new Object[] { pPSPERSON, pPCDOMICI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCDOMICI);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMBER); // Valor de "RETURN"
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DIRECCION_ORIGEN_INT(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCDOMICI) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DIRECCION_ORIGEN_INT(pPSPERSON, pPCDOMICI); 
    }
    //--END-PAC_IAX_PERSONA.F_DIRECCION_ORIGEN_INT
    //--START-PAC_IAX_PERSONA.F_GET_DIRECCION_TRECIBIDO(PSPERSON,  PCDOMICI)

    private HashMap callPAC_IAX_PERSONA__F_GET_DIRECCION_TRECIBIDO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCDOMICI) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_DIRECCION_TRECIBIDO(?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pPCDOMICI" }, new Object[] { pPSPERSON, pPCDOMICI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCDOMICI);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMBER); // Valor de "RETURN"
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION_TRECIBIDO(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCDOMICI) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_DIRECCION_TRECIBIDO(pPSPERSON, pPCDOMICI); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_DIRECCION_TRECIBIDO
    //--START-PAC_IAX_PERSONA.F_GET_PERSONA_TRECIBIDO(PSPERSON)

    private HashMap callPAC_IAX_PERSONA__F_GET_PERSONA_TRECIBIDO(java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONA_TRECIBIDO(?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMBER); // Valor de "RETURN"
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_TRECIBIDO(java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PERSONA_TRECIBIDO(pPSPERSON); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PERSONA_TRECIBIDO
    //--START-PAC_IAX_PERSONA.F_PERSONA_ORIGEN_INT(PSPERSON)

    private HashMap callPAC_IAX_PERSONA__F_PERSONA_ORIGEN_INT(java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_PERSONA_ORIGEN_INT(?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMBER); // Valor de "RETURN"
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_PERSONA_ORIGEN_INT(java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_PERSONA_ORIGEN_INT(pPSPERSON); 
    }
    //--END-PAC_IAX_PERSONA.F_PERSONA_ORIGEN_INT

    //--START-PAC_IAX_PERSONA.F_VALIDANIF(PNNUMIDE,  PCTIPIDE,  CSEXPER,  FNACIMI)

    private HashMap callPAC_IAX_PERSONA__F_VALIDANIF(String pPNNUMIDE, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pCSEXPER, java.sql.Date pFNACIMI) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_VALIDANIF(?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pPNNUMIDE", "pPCTIPIDE", "pCSEXPER", "pFNACIMI" }, new Object[] { pPNNUMIDE, pPCTIPIDE, pCSEXPER, pFNACIMI });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNNUMIDE);
        cStmt.setObject(3, pPCTIPIDE);
        cStmt.setObject(4, pCSEXPER);
        cStmt.setObject(5, pFNACIMI);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_VALIDANIF(String pPNNUMIDE, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pCSEXPER, java.sql.Date pFNACIMI) throws Exception {
        return this.callPAC_IAX_PERSONA__F_VALIDANIF(pPNNUMIDE, pPCTIPIDE, pCSEXPER, pFNACIMI); 
    }
    //--END-PAC_IAX_PERSONA.F_VALIDANIF

    //--START-PAC_IAX_PERSONA.F_BUSQUEDA_MASDATOS()

    private HashMap callPAC_IAX_PERSONA__F_BUSQUEDA_MASDATOS() throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_BUSQUEDA_MASDATOS(?, ?)}";

        logCall(callQuery, new String[] { }, new Object[] { });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
        cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "POMASDATOS"
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
        try {
            retVal.put("POMASDATOS", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("POMASDATOS", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_BUSQUEDA_MASDATOS() throws Exception {
        return this.callPAC_IAX_PERSONA__F_BUSQUEDA_MASDATOS(); 
    }
    //--END-PAC_IAX_PERSONA.F_BUSQUEDA_MASDATOS


       //--START-PAC_IAX_PERSONA.F_GET_DET_PERSONA(NUMIDE,  NOMBRE,  NSIP,  PNOM,  PCOGNOM1,  PCOGNOM2,  PCTIPIDE,  PFNACIMI,  PTDOMICI,  PCPOSTAL,  PSWPUBLI,  PEST)
       private HashMap callPAC_IAX_PERSONA__F_GET_DET_PERSONA (String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.sql.Date pPFNACIMI, String pPTDOMICI, String pPCPOSTAL, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPEST) throws Exception {
           String callQuery="{?=call PAC_IAX_PERSONA.F_GET_DET_PERSONA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
           
           logCall(callQuery, new String[] {"pNUMIDE", "pNOMBRE", "pNSIP", "pPNOM", "pPCOGNOM1", "pPCOGNOM2", "pPCTIPIDE", "pPFNACIMI", "pPTDOMICI", "pPCPOSTAL", "pPSWPUBLI", "pPEST"}, new Object[] {pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPFNACIMI, pPTDOMICI, pPCPOSTAL, pPSWPUBLI, pPEST});
           CallableStatement cStmt=conn.prepareCall(callQuery);
           String USERNAME=conn.getMetaData().getUserName().toUpperCase();
           cStmt.setObject(2, pNUMIDE);
           cStmt.setObject(3, pNOMBRE);
           cStmt.setObject(4, pNSIP);
           cStmt.setObject(6, pPNOM);
           cStmt.setObject(7, pPCOGNOM1);
           cStmt.setObject(8, pPCOGNOM2);
           cStmt.setObject(9, pPCTIPIDE);
           cStmt.setObject(10, pPFNACIMI);
           cStmt.setObject(11, pPTDOMICI);
           cStmt.setObject(12, pPCPOSTAL);
           cStmt.setObject(13, pPSWPUBLI);
           cStmt.setObject(14, pPEST);
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
           retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
           cStmt.close();//AXIS-WLS1SERVER-Ready
           
           return retVal;
       }

       public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DET_PERSONA (String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.sql.Date pPFNACIMI, String pPTDOMICI, String pPCPOSTAL, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPEST) throws Exception {
           return this.callPAC_IAX_PERSONA__F_GET_DET_PERSONA(pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPFNACIMI, pPTDOMICI, pPCPOSTAL, pPSWPUBLI, pPEST);//AXIS-WLS1SERVER-Ready 
       }
       //--END-PAC_IAX_PERSONA.F_GET_DET_PERSONA



    //--START-PAC_IAX_PERSONA.F_GET_AGENTES_VISION(PSPERSON)

    private HashMap callPAC_IAX_PERSONA__F_GET_AGENTES_VISION(java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_AGENTES_VISION(?, ?)}";

        logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_AGENTES_VISION(pPSPERSON); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_AGENTES_VISION

    //--START-PAC_IAX_PERSONA.F_GET_PERSONAS_PUBLICAS(NUMIDE,  NOMBRE,  NSIP,  PNOM,  PCOGNOM1,  PCOGNOM2,  PCTIPIDE)

    private HashMap callPAC_IAX_PERSONA__F_GET_PERSONAS_PUBLICAS(String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONAS_PUBLICAS(?, ?, ?, ?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pNUMIDE", "pNOMBRE", "pNSIP", "pPNOM", "pPCOGNOM1", "pPCOGNOM2", "pPCTIPIDE" }, new Object[] { pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pNUMIDE);
        cStmt.setObject(3, pNOMBRE);
        cStmt.setObject(4, pNSIP);
        cStmt.setObject(6, pPNOM);
        cStmt.setObject(7, pPCOGNOM1);
        cStmt.setObject(8, pPCOGNOM2);
        cStmt.setObject(9, pPCTIPIDE);
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
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_PUBLICAS(String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PERSONAS_PUBLICAS(pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PERSONAS_PUBLICAS

     //--START-PAC_IAX_PERSONA.F_GET_PERSONA_PUBLICA(PSPERSON)
     private HashMap callPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA (java.math.BigDecimal pPSPERSON) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONA_PUBLICA(?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSPERSON);
         cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
         cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS".toUpperCase())); // Valor de "OBPERSONA"
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
             retVal.put("OBPERSONA", cStmt.getObject(3));
         }
         catch (SQLException e) {
             retVal.put("OBPERSONA", null);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA (java.math.BigDecimal pPSPERSON) throws Exception {
         return this.callPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA(pPSPERSON); 
     }
     //--END-PAC_IAX_PERSONA.F_GET_PERSONA_PUBLICA

        //--START-PAC_IAX_PERSONA.F_GET_ANYSIRPF(PSPERSON,  PCAGENTE)
        private HashMap callPAC_IAX_PERSONA__F_GET_ANYSIRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ANYSIRPF(?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE"}, new Object[] {pPSPERSON, pPCAGENTE});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pPCAGENTE);
            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
            cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PNANOS"
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
                retVal.put("PNANOS", cStmt.getObject(4));
            }
            catch (SQLException e) {
                retVal.put("PNANOS", null);
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

        public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ANYSIRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
            return this.callPAC_IAX_PERSONA__F_GET_ANYSIRPF(pPSPERSON, pPCAGENTE); 
        }
        //--END-PAC_IAX_PERSONA.F_GET_ANYSIRPF
        //--START-PAC_IAX_PERSONA.F_GET_IRPF(PSPERSON,  PCAGENTE,  PNANO)
        private HashMap callPAC_IAX_PERSONA__F_GET_IRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_GET_IRPF(?, ?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pPCAGENTE);
            cStmt.setObject(4, pPNANO);
            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
            cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_IRPF".toUpperCase())); // Valor de "PIRPF"
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
                retVal.put("PIRPF", cStmt.getObject(5));
            }
            catch (SQLException e) {
                retVal.put("PIRPF", null);
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

        public HashMap ejecutaPAC_IAX_PERSONA__F_GET_IRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO) throws Exception {
            return this.callPAC_IAX_PERSONA__F_GET_IRPF(pPSPERSON, pPCAGENTE, pPNANO); 
        }
        //--END-PAC_IAX_PERSONA.F_GET_IRPF
        //--START-PAC_IAX_PERSONA.F_GET_IRPFS(PSPERSON,  PCAGENTE,  MENSAJES)
        private HashMap callPAC_IAX_PERSONA__F_GET_IRPFS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_GET_IRPFS(?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE"}, new Object[] {pPSPERSON, pPCAGENTE});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pPCAGENTE);
            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
            cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_IRPF".toUpperCase())); // Valor de "PIRPFS"
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
                retVal.put("PIRPFS", cStmt.getObject(4));
            }
            catch (SQLException e) {
                retVal.put("PIRPFS", null);
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

        public HashMap ejecutaPAC_IAX_PERSONA__F_GET_IRPFS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
            return this.callPAC_IAX_PERSONA__F_GET_IRPFS(pPSPERSON, pPCAGENTE); 
        }
        //--END-PAC_IAX_PERSONA.F_GET_IRPFS
        //--START-PAC_IAX_PERSONA.F_SET_IRPF(PSPERSON,  PCAGENTE,  PNANO,  PCSITFAM,  PCNIFCON,  PCGRADO,  PCAYUDA,  PIPENSION,  PIANUHIJOS,  PPROLON,  PRMOVGEO)
          private HashMap callPAC_IAX_PERSONA__F_SET_IRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPCSITFAM, String pPCNIFCON, java.math.BigDecimal pPCGRADO, java.math.BigDecimal pPCAYUDA, java.math.BigDecimal pPIPENSION, java.math.BigDecimal pPIANUHIJOS, java.math.BigDecimal pPPROLON, java.math.BigDecimal pPRMOVGEO, java.sql.Date pPFMOVGEO, java.math.BigDecimal pPCPAGO) throws Exception {
              String callQuery="{?=call PAC_IAX_PERSONA.F_SET_IRPF(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
              
              logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO", "pPCSITFAM", "pPCNIFCON", "pPCGRADO", "pPCAYUDA", "pPIPENSION", "pPIANUHIJOS", "pPPROLON", "pPRMOVGEO", "pPFMOVGEO", "pPCPAGO"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO, pPCSITFAM, pPCNIFCON, pPCGRADO, pPCAYUDA, pPIPENSION, pPIANUHIJOS, pPPROLON, pPRMOVGEO, pPFMOVGEO, pPCPAGO});
              CallableStatement cStmt=conn.prepareCall(callQuery);
              String USERNAME=conn.getMetaData().getUserName().toUpperCase();
              cStmt.setObject(2, pPSPERSON);
              cStmt.setObject(3, pPCAGENTE);
              cStmt.setObject(4, pPNANO);
              cStmt.setObject(5, pPCSITFAM);
              cStmt.setObject(6, pPCNIFCON);
              cStmt.setObject(7, pPCGRADO);
              cStmt.setObject(8, pPCAYUDA);
              cStmt.setObject(9, pPIPENSION);
              cStmt.setObject(10, pPIANUHIJOS);
              cStmt.setObject(11, pPPROLON);
              cStmt.setObject(12, pPRMOVGEO);
              cStmt.setObject(13, pPFMOVGEO);
              cStmt.setObject(14, pPCPAGO);
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

          public HashMap ejecutaPAC_IAX_PERSONA__F_SET_IRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPCSITFAM, String pPCNIFCON, java.math.BigDecimal pPCGRADO, java.math.BigDecimal pPCAYUDA, java.math.BigDecimal pPIPENSION, java.math.BigDecimal pPIANUHIJOS, java.math.BigDecimal pPPROLON, java.math.BigDecimal pPRMOVGEO, java.sql.Date pPFMOVGEO, java.math.BigDecimal pPCPAGO) throws Exception {
              return this.callPAC_IAX_PERSONA__F_SET_IRPF(pPSPERSON, pPCAGENTE, pPNANO, pPCSITFAM, pPCNIFCON, pPCGRADO, pPCAYUDA, pPIPENSION, pPIANUHIJOS, pPPROLON, pPRMOVGEO, pPFMOVGEO, pPCPAGO); 
          }
          //--END-PAC_IAX_PERSONA.F_SET_IRPF


         //--START-PAC_IAX_PERSONA.F_SET_OBJETOIRPFDESCEN(PSPERSON,  PCAGENTE,  PNANO,  PNORDEN,  PFNACIMI,  PFADOPCION,  PCGRADO,  PCENTER)
            private HashMap callPAC_IAX_PERSONA__F_SET_OBJETOIRPFDESCEN (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN, java.sql.Date pPFNACIMI, java.sql.Date pPFADOPCION, java.math.BigDecimal pPCGRADO, java.math.BigDecimal pPCENTER) throws Exception {
                String callQuery="{?=call PAC_IAX_PERSONA.F_SET_OBJETOIRPFDESCEN(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                
                logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO", "pPNORDEN", "pPFNACIMI", "pPFADOPCION", "pPCGRADO", "pPCENTER"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN, pPFNACIMI, pPFADOPCION, pPCGRADO, pPCENTER});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSPERSON);
                cStmt.setObject(3, pPCAGENTE);
                cStmt.setObject(4, pPNANO);
                cStmt.setObject(5, pPNORDEN);
                cStmt.setObject(6, pPFNACIMI);
                cStmt.setObject(7, pPFADOPCION);
                cStmt.setObject(8, pPCGRADO);
                cStmt.setObject(9, pPCENTER);
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
                retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
                
                return retVal;
            }

            public HashMap ejecutaPAC_IAX_PERSONA__F_SET_OBJETOIRPFDESCEN (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN, java.sql.Date pPFNACIMI, java.sql.Date pPFADOPCION, java.math.BigDecimal pPCGRADO, java.math.BigDecimal pPCENTER) throws Exception {
                return this.callPAC_IAX_PERSONA__F_SET_OBJETOIRPFDESCEN(pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN, pPFNACIMI, pPFADOPCION, pPCGRADO, pPCENTER); 
            }
        //--END-PAC_IAX_PERSONA.F_SET_OBJETOIRPFDESCEN
        //--START-PAC_IAX_PERSONA.F_SET_OBJETOIRPFMAYORES(PSPERSON,  PCAGENTE,  PNANO,  PNORDEN,  PFNACIMI,  PCGRADO,  PNVIVEN,  PCRENTA)
        private HashMap callPAC_IAX_PERSONA__F_SET_OBJETOIRPFMAYORES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN, java.sql.Date pPFNACIMI, java.math.BigDecimal pPCGRADO, java.math.BigDecimal pPNVIVEN, java.math.BigDecimal pPCRENTA) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_SET_OBJETOIRPFMAYORES(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO", "pPNORDEN", "pPFNACIMI", "pPCGRADO", "pPNVIVEN", "pPCRENTA"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN, pPFNACIMI, pPCGRADO, pPNVIVEN, pPCRENTA});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pPCAGENTE);
            cStmt.setObject(4, pPNANO);
            cStmt.setObject(5, pPNORDEN);
            cStmt.setObject(6, pPFNACIMI);
            cStmt.setObject(7, pPCGRADO);
            cStmt.setObject(8, pPNVIVEN);
            cStmt.setObject(9, pPCRENTA);
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
            retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
            
            return retVal;
        }

        public HashMap ejecutaPAC_IAX_PERSONA__F_SET_OBJETOIRPFMAYORES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN, java.sql.Date pPFNACIMI, java.math.BigDecimal pPCGRADO, java.math.BigDecimal pPNVIVEN, java.math.BigDecimal pPCRENTA) throws Exception {
            return this.callPAC_IAX_PERSONA__F_SET_OBJETOIRPFMAYORES(pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN, pPFNACIMI, pPCGRADO, pPNVIVEN, pPCRENTA); 
        }
        //--END-PAC_IAX_PERSONA.F_SET_OBJETOIRPFMAYORES

         //--START-PAC_IAX_PERSONA.F_GET_OBJETOIRPF()
         private HashMap callPAC_IAX_PERSONA__F_GET_OBJETOIRPF () throws Exception {
             String callQuery="{?=call PAC_IAX_PERSONA.F_GET_OBJETOIRPF(?, ?)}";
             
             logCall(callQuery, new String[] {}, new Object[] {});
             CallableStatement cStmt=conn.prepareCall(callQuery);
             String USERNAME=conn.getMetaData().getUserName().toUpperCase();
             cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
             cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_IRPF".toUpperCase())); // Valor de "PIRPF"
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
                 retVal.put("PIRPF", cStmt.getObject(2));
             }
             catch (SQLException e) {
                 retVal.put("PIRPF", null);
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

         public HashMap ejecutaPAC_IAX_PERSONA__F_GET_OBJETOIRPF () throws Exception {
             return this.callPAC_IAX_PERSONA__F_GET_OBJETOIRPF(); 
         }
         //--END-PAC_IAX_PERSONA.F_GET_OBJETOIRPF
         //--START-PAC_IAX_PERSONA.F_INICIALIZA_OBIRPF(PSPERSON,  PCAGENTE,  PNANO)
         private HashMap callPAC_IAX_PERSONA__F_INICIALIZA_OBIRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO) throws Exception {
             String callQuery="{?=call PAC_IAX_PERSONA.F_INICIALIZA_OBIRPF(?, ?, ?, ?)}";
             
             logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO});
             CallableStatement cStmt=conn.prepareCall(callQuery);
             String USERNAME=conn.getMetaData().getUserName().toUpperCase();
             cStmt.setObject(2, pPSPERSON);
             cStmt.setObject(3, pPCAGENTE);
             cStmt.setObject(4, pPNANO);
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

         public HashMap ejecutaPAC_IAX_PERSONA__F_INICIALIZA_OBIRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO) throws Exception {
             return this.callPAC_IAX_PERSONA__F_INICIALIZA_OBIRPF(pPSPERSON, pPCAGENTE, pPNANO); 
         }
         //--END-PAC_IAX_PERSONA.F_INICIALIZA_OBIRPF

          //--START-PAC_IAX_PERSONA.F_DEL_OBJETOIRPFDESCEN(PSPERSON,  PCAGENTE,  PNANO,  PNORDEN)
            private HashMap callPAC_IAX_PERSONA__F_DEL_OBJETOIRPFDESCEN (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN) throws Exception {
                String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_OBJETOIRPFDESCEN(?, ?, ?, ?, ?)}";
                
                logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO", "pPNORDEN"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSPERSON);
                cStmt.setObject(3, pPCAGENTE);
                cStmt.setObject(4, pPNANO);
                cStmt.setObject(5, pPNORDEN);
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

            public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_OBJETOIRPFDESCEN (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN) throws Exception {
                return this.callPAC_IAX_PERSONA__F_DEL_OBJETOIRPFDESCEN(pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN); 
            }
            //--END-PAC_IAX_PERSONA.F_DEL_OBJETOIRPFDESCEN
            //--START-PAC_IAX_PERSONA.F_DEL_OBJETOIRPFMAYOR(PSPERSON,  PCAGENTE,  PNANO,  PNORDEN)
            private HashMap callPAC_IAX_PERSONA__F_DEL_OBJETOIRPFMAYOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN) throws Exception {
                String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_OBJETOIRPFMAYOR(?, ?, ?, ?, ?)}";
                
                logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO", "pPNORDEN"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSPERSON);
                cStmt.setObject(3, pPCAGENTE);
                cStmt.setObject(4, pPNANO);
                cStmt.setObject(5, pPNORDEN);
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

            public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_OBJETOIRPFMAYOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO, java.math.BigDecimal pPNORDEN) throws Exception {
                return this.callPAC_IAX_PERSONA__F_DEL_OBJETOIRPFMAYOR(pPSPERSON, pPCAGENTE, pPNANO, pPNORDEN); 
            }
            //--END-PAC_IAX_PERSONA.F_DEL_OBJETOIRPFMAYOR

             //--START-PAC_IAX_PERSONA.F_GET_OBJETOS_ASC_DESC()
             private HashMap callPAC_IAX_PERSONA__F_GET_OBJETOS_ASC_DESC () throws Exception {
                 String callQuery="{?=call PAC_IAX_PERSONA.F_GET_OBJETOS_ASC_DESC(?, ?, ?)}";
                 
                 logCall(callQuery, new String[] {}, new Object[] {});
                 CallableStatement cStmt=conn.prepareCall(callQuery);
                 String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                 cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                 cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_IRPFMAYORES".toUpperCase())); // Valor de "PIRPFMAYORES"
                 cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_IRPFDESCEN".toUpperCase())); // Valor de "PIRPFDESCEN"
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
                     retVal.put("PIRPFMAYORES", cStmt.getObject(2));
                 }
                 catch (SQLException e) {
                     retVal.put("PIRPFMAYORES", null);
                 }
                 try {
                     retVal.put("PIRPFDESCEN", cStmt.getObject(3));
                 }
                 catch (SQLException e) {
                     retVal.put("PIRPFDESCEN", null);
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

             public HashMap ejecutaPAC_IAX_PERSONA__F_GET_OBJETOS_ASC_DESC () throws Exception {
                 return this.callPAC_IAX_PERSONA__F_GET_OBJETOS_ASC_DESC(); 
             }
             //--END-PAC_IAX_PERSONA.F_GET_OBJETOS_ASC_DESC

              //--START-PAC_IAX_PERSONA.F_DEL_IRPF(PSPERSON,  PCAGENTE,  PNANO)
              private HashMap callPAC_IAX_PERSONA__F_DEL_IRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO) throws Exception {
                  String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_IRPF(?, ?, ?, ?)}";
                  
                  logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPNANO"}, new Object[] {pPSPERSON, pPCAGENTE, pPNANO});
                  CallableStatement cStmt=conn.prepareCall(callQuery);
                  String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                  cStmt.setObject(2, pPSPERSON);
                  cStmt.setObject(3, pPCAGENTE);
                  cStmt.setObject(4, pPNANO);
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
              public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_IRPF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPNANO) throws Exception {
                  return this.callPAC_IAX_PERSONA__F_DEL_IRPF(pPSPERSON, pPCAGENTE, pPNANO); 
              }
              //--END-PAC_IAX_PERSONA.F_DEL_IRPF      

               //--START-PAC_IAX_PERSONA.F_GET_PERSONAS_GENERICA(NUMIDE,  NOMBRE,  NSIP,  PNOM,  PCOGNOM1,  PCOGNOM2,  PCTIPIDE,  PCAGENTE,  PMODO_SWPUBLI)
               private HashMap callPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA (String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCAGENTE, String pPMODO_SWPUBLI) throws Exception {
                   String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONAS_GENERICA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                   
                   logCall(callQuery, new String[] {"pNUMIDE", "pNOMBRE", "pNSIP", "pPNOM", "pPCOGNOM1", "pPCOGNOM2", "pPCTIPIDE", "pPCAGENTE", "pPMODO_SWPUBLI"}, new Object[] {pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPCAGENTE, pPMODO_SWPUBLI});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pNUMIDE);
                   cStmt.setObject(3, pNOMBRE);
                   cStmt.setObject(4, pNSIP);
                   cStmt.setObject(6, pPNOM);
                   cStmt.setObject(7, pPCOGNOM1);
                   cStmt.setObject(8, pPCOGNOM2);
                   cStmt.setObject(9, pPCTIPIDE);
                   cStmt.setObject(10, pPCAGENTE);
                   cStmt.setObject(11, pPMODO_SWPUBLI);
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
                   retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
                   
                   return retVal;
               }

               public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA (String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCAGENTE, String pPMODO_SWPUBLI) throws Exception {
                   return this.callPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA(pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPCAGENTE, pPMODO_SWPUBLI); 
               }
               //--END-PAC_IAX_PERSONA.F_GET_PERSONAS_GENERICA
               //--START-PAC_IAX_PERSONA.F_GET_PERSONAUNICA_GENERICA(PCTIPPER,  PCTIPIDE,  PNNUMNIF,  PCSEXPER,  FNACIMI,  PMODO,  PSSEGURO,  PCAGENTE,  PSWPUBLI)
               private HashMap callPAC_IAX_PERSONA__F_GET_PERSONAUNICA_GENERICA (java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String pPNNUMNIF, java.math.BigDecimal pPCSEXPER, java.sql.Date pFNACIMI, String pPMODO, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSWPUBLI) throws Exception {
                   String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONAUNICA_GENERICA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPCTIPPER", "pPCTIPIDE", "pPNNUMNIF", "pPCSEXPER", "pFNACIMI", "pPMODO", "pPSSEGURO", "pPCAGENTE", "pPSWPUBLI"}, new Object[] {pPCTIPPER, pPCTIPIDE, pPNNUMNIF, pPCSEXPER, pFNACIMI, pPMODO, pPSSEGURO, pPCAGENTE, pPSWPUBLI});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPCTIPPER);
                   cStmt.setObject(3, pPCTIPIDE);
                   cStmt.setObject(4, pPNNUMNIF);
                   cStmt.setObject(5, pPCSEXPER);
                   cStmt.setObject(6, pFNACIMI);
                   cStmt.setObject(7, pPMODO);
                   cStmt.setObject(8, pPSSEGURO);
                   cStmt.setObject(9, pPCAGENTE);
                   cStmt.setObject(10, pPSWPUBLI);
                   cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                   cStmt.registerOutParameter(11, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS".toUpperCase())); // Valor de "OBPERSONA"
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
                       retVal.put("OBPERSONA", cStmt.getObject(11));
                   }
                   catch (SQLException e) {
                       retVal.put("OBPERSONA", null);
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

               public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONAUNICA_GENERICA (java.math.BigDecimal pPCTIPPER, java.math.BigDecimal pPCTIPIDE, String pPNNUMNIF, java.math.BigDecimal pPCSEXPER, java.sql.Date pFNACIMI, String pPMODO, java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSWPUBLI) throws Exception {
                   return this.callPAC_IAX_PERSONA__F_GET_PERSONAUNICA_GENERICA(pPCTIPPER, pPCTIPIDE, pPNNUMNIF, pPCSEXPER, pFNACIMI, pPMODO, pPSSEGURO, pPCAGENTE, pPSWPUBLI); 
               }
               //--END-PAC_IAX_PERSONA.F_GET_PERSONAUNICA_GENERICA                      

            //--START-PAC_IAX_PERSONA.F_GET_PROFESIONALES(PSPERSON)
            private HashMap callPAC_IAX_PERSONA__F_GET_PROFESIONALES(java.math.BigDecimal pPSPERSON) throws Exception {
                String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PROFESIONALES(?, ?, ?)}";

                logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSPERSON);
                cStmt.registerOutParameter(1, OracleTypes.NUMBER);  
                cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
                cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                cStmt.execute();
                HashMap retVal=new HashMap();
                try {
                    retVal.put("RETURN", cStmt.getObject(3));
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

            public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PROFESIONALES(java.math.BigDecimal pPSPERSON) throws Exception {
                return this.callPAC_IAX_PERSONA__F_GET_PROFESIONALES(pPSPERSON); 
            }
            //--END-PAC_IAX_PERSONA.F_GET_PROFESIONALES
                
             //--START-PAC_IAX_PERSONA.F_GET_COMPANIAS(PSPERSON)
             private HashMap callPAC_IAX_PERSONA__F_GET_COMPANIAS(java.math.BigDecimal pPSPERSON) throws Exception {
                 String callQuery="{?=call PAC_IAX_PERSONA.F_GET_COMPANIAS(?, ?, ?)}";

                 logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
                 CallableStatement cStmt=conn.prepareCall(callQuery);
                 String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                 cStmt.setObject(2, pPSPERSON);
                 cStmt.registerOutParameter(1, OracleTypes.NUMBER);  
                 cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
                 cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                 cStmt.execute();
                 HashMap retVal=new HashMap();
                 try {
                     retVal.put("RETURN", cStmt.getObject(3));
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

             public HashMap ejecutaPAC_IAX_PERSONA__F_GET_COMPANIAS(java.math.BigDecimal pPSPERSON) throws Exception {
                 return this.callPAC_IAX_PERSONA__F_GET_COMPANIAS(pPSPERSON); 
             }
             //--END-PAC_IAX_PERSONA.F_GET_COMPANIAS
     
              //--START-PAC_IAX_PERSONA.F_GET_AGENTES(PSPERSON)
              private HashMap callPAC_IAX_PERSONA__F_GET_AGENTES(java.math.BigDecimal pPSPERSON) throws Exception {
                  String callQuery="{?=call PAC_IAX_PERSONA.F_GET_AGENTES(?, ?, ?)}";

                  logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
                  CallableStatement cStmt=conn.prepareCall(callQuery);
                  String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                  cStmt.setObject(2, pPSPERSON);
                  cStmt.registerOutParameter(1, OracleTypes.NUMBER);  
                  cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
                  cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                  cStmt.execute();
                  HashMap retVal=new HashMap();
                  try {
                      retVal.put("RETURN", cStmt.getObject(3));
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

              public HashMap ejecutaPAC_IAX_PERSONA__F_GET_AGENTES(java.math.BigDecimal pPSPERSON) throws Exception {
                  return this.callPAC_IAX_PERSONA__F_GET_AGENTES(pPSPERSON); 
              }
              //--END-PAC_IAX_PERSONA.F_GET_AGENTES
              
           //--START-PAC_IAX_PERSONA.F_GET_SINIESTROS(PSPERSON)
           private HashMap callPAC_IAX_PERSONA__F_GET_SINIESTROS(java.math.BigDecimal pPSPERSON) throws Exception {
               String callQuery="{?=call PAC_IAX_PERSONA.F_GET_SINIESTROS(?, ?, ?)}";

               logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON });
               CallableStatement cStmt=conn.prepareCall(callQuery);
               String USERNAME=conn.getMetaData().getUserName().toUpperCase();
               cStmt.setObject(2, pPSPERSON);
               cStmt.registerOutParameter(1, OracleTypes.NUMBER);  
               cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
               cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
               cStmt.execute();
               HashMap retVal=new HashMap();
               try {
                   retVal.put("RETURN", cStmt.getObject(3));
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

           public HashMap ejecutaPAC_IAX_PERSONA__F_GET_SINIESTROS(java.math.BigDecimal pPSPERSON) throws Exception {
               return this.callPAC_IAX_PERSONA__F_GET_SINIESTROS(pPSPERSON); 
           }
           //--END-PAC_IAX_PERSONA.F_GET_SINIESTROS
           
            //--START-PAC_IAX_PERSONA.F_DEL_PARPERSONA(PSPERSON,  PCAGENTE,  PCPARAM)
            private HashMap callPAC_IAX_PERSONA__F_DEL_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM) throws Exception {
                String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_PARPERSONA(?, ?, ?, ?)}";
                
                logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCPARAM"}, new Object[] {pPSPERSON, pPCAGENTE, pPCPARAM});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSPERSON);
                cStmt.setObject(3, pPCAGENTE);
                cStmt.setObject(4, pPCPARAM);
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

            public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM) throws Exception {
                return this.callPAC_IAX_PERSONA__F_DEL_PARPERSONA(pPSPERSON, pPCAGENTE, pPCPARAM); 
            }
            //--END-PAC_IAX_PERSONA.F_DEL_PARPERSONA
             //--START-PAC_IAX_PERSONA.F_GET_PARPERSONA(PSPERSON,  PCAGENTE,  PCVISIBLE,  PTOTS)
             private HashMap callPAC_IAX_PERSONA__F_GET_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS) throws Exception {
                 String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PARPERSONA(?, ?, ?, ?, ?, ?)}";
                 
                 logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCVISIBLE", "pPTOTS"}, new Object[] {pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS});
                 CallableStatement cStmt=conn.prepareCall(callQuery);
                 String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                 cStmt.setObject(2, pPSPERSON);
                 cStmt.setObject(3, pPCAGENTE);
                 cStmt.setObject(4, pPCVISIBLE);
                 cStmt.setObject(5, pPTOTS);
                 cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                 cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
                 cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
                 cStmt.execute();
                 HashMap retVal=new HashMap();
                 try {
                     retVal.put("RETURN", cStmt.getObject(6));
                 }
                 catch (SQLException e) {
                     retVal.put("RETURN", null);
                 }
                /* try {
                     retVal.put("PCUR", cStmt.getObject(6));
                 }
                 catch (SQLException e) {
                     retVal.put("PCUR", null);
                 }*/
                 try {
                     retVal.put("MENSAJES", cStmt.getObject(7));
                 }
                 catch (SQLException e) {
                     retVal.put("MENSAJES", null);
                 }
                 retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                 cStmt.close();//AXIS-WLS1SERVER-Ready
                 
                 return retVal;
             }

             public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS) throws Exception {
                 return this.callPAC_IAX_PERSONA__F_GET_PARPERSONA(pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS);//AXIS-WLS1SERVER-Ready 
             }
             //--END-PAC_IAX_PERSONA.F_GET_PARPERSONA

            //--START-PAC_IAX_PERSONA.F_INS_PARPERSONA(PSPERSON,  PCAGENTE,  PCPARAM,  PNVALPAR,  PTVALPAR,  PFVALPAR)
            private HashMap callPAC_IAX_PERSONA__F_INS_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
                String callQuery="{?=call PAC_IAX_PERSONA.F_INS_PARPERSONA(?, ?, ?, ?, ?, ?, ?)}";
                
                logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCPARAM", "pPNVALPAR", "pPTVALPAR", "pPFVALPAR"}, new Object[] {pPSPERSON, pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSPERSON);
                cStmt.setObject(3, pPCAGENTE);
                cStmt.setObject(4, pPCPARAM);
                cStmt.setObject(5, pPNVALPAR);
                cStmt.setObject(6, pPTVALPAR);
                cStmt.setObject(7, pPFVALPAR);
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

            public HashMap ejecutaPAC_IAX_PERSONA__F_INS_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
                return this.callPAC_IAX_PERSONA__F_INS_PARPERSONA(pPSPERSON, pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR); 
            }
            //--END-PAC_IAX_PERSONA.F_INS_PARPERSONA
             //--START-PAC_IAX_PERSONA.F_GET_CONTRATOS_HOST(PNRIESGO,  PMODO)
               private HashMap callPAC_IAX_PERSONA__F_GET_CONTRATOS_HOST (String pPMODO) throws Exception {
                   String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONTRATOS_HOST(?, ?, ?)}";
                   
                   logCall(callQuery, new String[] { "pPMODO"}, new Object[] { pPMODO});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPMODO);
                   cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                   cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_PRESTAMOSEG".toUpperCase())); // Valor de "PT_PRESTAMO"
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
                       retVal.put("PT_PRESTAMO", cStmt.getObject(3));
                   }
                   catch (SQLException e) {
                       retVal.put("PT_PRESTAMO", null);
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

               public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTRATOS_HOST (String pPMODO) throws Exception {
                   return this.callPAC_IAX_PERSONA__F_GET_CONTRATOS_HOST( pPMODO); 
               }
               //--END-PAC_IAX_PERSONA.F_GET_CONTRATOS_HOST
               //--START-PAC_IAX_PERSONA.F_GET_CTR_PRESTAMOSEG_HOST(PNRIESGO,  PMODO)
               private HashMap callPAC_IAX_PERSONA__F_GET_CTR_PRESTAMOSEG_HOST (java.math.BigDecimal pPNRIESGO, String pPMODO) throws Exception {
                   String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CTR_PRESTAMOSEG_HOST(?, ?, ?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPNRIESGO", "pPMODO"}, new Object[] {pPNRIESGO, pPMODO});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPNRIESGO);
                   cStmt.setObject(3, pPMODO);
                   cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                   cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_PRESTAMOSEG".toUpperCase())); // Valor de "PT_PRESTAMOSEG"
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
                       retVal.put("PT_PRESTAMOSEG", cStmt.getObject(4));
                   }
                   catch (SQLException e) {
                       retVal.put("PT_PRESTAMOSEG", null);
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

               public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CTR_PRESTAMOSEG_HOST (java.math.BigDecimal pPNRIESGO, String pPMODO) throws Exception {
                   return this.callPAC_IAX_PERSONA__F_GET_CTR_PRESTAMOSEG_HOST(pPNRIESGO, pPMODO); 
               }
               //--END-PAC_IAX_PERSONA.F_GET_CTR_PRESTAMOSEG_HOST

                  //--START-PAC_IAX_PERSONA.F_TRASPASAPERSONAPOL(PSPERSON,  PSNIP,  PCAGENTE_IN,  PCODITABLA,  PSSEGURO)
    private HashMap callPAC_IAX_PERSONA__F_TRASPASAPERSONAPOL (java.math.BigDecimal pPSPERSON, String pPSNIP, java.math.BigDecimal pPCAGENTE_IN, String pPCODITABLA, java.math.BigDecimal pPSSEGURO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_TRASPASAPERSONAPOL(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pPSNIP", "pPCAGENTE_IN", "pPCODITABLA", "pPSSEGURO"}, new Object[] {pPSPERSON, pPSNIP, pPCAGENTE_IN, pPCODITABLA, pPSSEGURO});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPSNIP);
        cStmt.setObject(4, pPCAGENTE_IN);
        cStmt.setObject(6, pPCODITABLA);
        cStmt.setObject(8, pPSSEGURO);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "PCAGENTE"
        cStmt.registerOutParameter(7, java.sql.Types.NUMERIC); // Valor de "PSPERSON_OUT"
        cStmt.registerOutParameter(9, java.sql.Types.VARCHAR); // Valor de "PMENSAPOTUP"
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
            retVal.put("PCAGENTE", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("PCAGENTE", null);
        }
        try {
            retVal.put("PSPERSON_OUT", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("PSPERSON_OUT", null);
        }
        try {
            retVal.put("PMENSAPOTUP", cStmt.getObject(9));
        }
        catch (SQLException e) {
            retVal.put("PMENSAPOTUP", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAPOL (java.math.BigDecimal pPSPERSON, String pPSNIP, java.math.BigDecimal pPCAGENTE_IN, String pPCODITABLA, java.math.BigDecimal pPSSEGURO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_TRASPASAPERSONAPOL(pPSPERSON, pPSNIP, pPCAGENTE_IN, pPCODITABLA, pPSSEGURO); 
    }
    //--END-PAC_IAX_PERSONA.F_TRASPASAPERSONAPOL

                 //--START-PAC_IAX_PERSONA.F_GET_CCC_HOST_AXIS(PSPERSON,  PCAGENTE,  PSNIP,  PORIGEN,  PSSEGURO)
                 private HashMap callPAC_IAX_PERSONA__F_GET_CCC_HOST_AXIS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPSNIP, String pPORIGEN, java.math.BigDecimal pPSSEGURO) throws Exception {
                     String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CCC_HOST_AXIS(?, ?, ?, ?, ?, ?)}";
                     
                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPSNIP", "pPORIGEN", "pPSSEGURO"}, new Object[] {pPSPERSON, pPCAGENTE, pPSNIP, pPORIGEN, pPSSEGURO});
                     CallableStatement cStmt=conn.prepareCall(callQuery);
                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                     cStmt.setObject(2, pPSPERSON);
                     cStmt.setObject(3, pPCAGENTE);
                     cStmt.setObject(4, pPSNIP);
                     cStmt.setObject(5, pPORIGEN);
                     cStmt.setObject(6, pPSSEGURO);
                     cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
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
                     retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
                     
                     return retVal;
                 }

                 public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CCC_HOST_AXIS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPSNIP, String pPORIGEN, java.math.BigDecimal pPSSEGURO) throws Exception {
                     return this.callPAC_IAX_PERSONA__F_GET_CCC_HOST_AXIS(pPSPERSON, pPCAGENTE, pPSNIP, pPORIGEN, pPSSEGURO); 
                 }
                 //--END-PAC_IAX_PERSONA.F_GET_CCC_HOST_AXIS


                    //--START-PAC_IAX_PERSONA.F_EXISTE_CCC(PSPERSON,  PCAGENTE,  PCBANCAR,  PCTIPBAN)
                      private HashMap callPAC_IAX_PERSONA__F_EXISTE_CCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN) throws Exception {
                          String callQuery="{?=call PAC_IAX_PERSONA.F_EXISTE_CCC(?, ?, ?, ?, ?)}";
                          
                          logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCBANCAR", "pPCTIPBAN"}, new Object[] {pPSPERSON, pPCAGENTE, pPCBANCAR, pPCTIPBAN});
                          CallableStatement cStmt=conn.prepareCall(callQuery);
                          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                          cStmt.setObject(2, pPSPERSON);
                          cStmt.setObject(3, pPCAGENTE);
                          cStmt.setObject(4, pPCBANCAR);
                          cStmt.setObject(5, pPCTIPBAN);
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

                      public HashMap ejecutaPAC_IAX_PERSONA__F_EXISTE_CCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCBANCAR, java.math.BigDecimal pPCTIPBAN) throws Exception {
                          return this.callPAC_IAX_PERSONA__F_EXISTE_CCC(pPSPERSON, pPCAGENTE, pPCBANCAR, pPCTIPBAN); 
                      }
                      //--END-PAC_IAX_PERSONA.F_EXISTE_CCC
                      
                       //--START-PAC_IAX_PERSONA.F_GET_PERSONA_AGENTE(SPERSON,  PCAGENTE,  PMODE)
                       private HashMap callPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE (java.math.BigDecimal pSPERSON, java.math.BigDecimal pPCAGENTE, String pPMODE) throws Exception {
                           String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONA_AGENTE(?, ?, ?, ?, ?)}";
                           
                           logCall(callQuery, new String[] {"pSPERSON", "pPCAGENTE", "pPMODE"}, new Object[] {pSPERSON, pPCAGENTE, pPMODE});
                           CallableStatement cStmt=conn.prepareCall(callQuery);
                           String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                           cStmt.setObject(2, pSPERSON);
                           cStmt.setObject(3, pPCAGENTE);
                           cStmt.setObject(4, pPMODE);
                           cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                           cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS".toUpperCase())); // Valor de "OBPERSONA"
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
                               retVal.put("OBPERSONA", cStmt.getObject(5));
                           }
                           catch (SQLException e) {
                               retVal.put("OBPERSONA", null);
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

                       public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE (java.math.BigDecimal pSPERSON, java.math.BigDecimal pPCAGENTE, String pPMODE) throws Exception {
                           return this.callPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(pSPERSON, pPCAGENTE, pPMODE); 
                       }
                       //--END-PAC_IAX_PERSONA.F_GET_PERSONA_AGENTE


            //--START-PAC_IAX_PERSONA.F_INSERTA_DETALLE_PER(PSPERSON,  PCAGENTE,  PCAGENTE_PROD)
            private HashMap callPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCAGENTE_PROD) throws Exception {
                String callQuery="{?=call PAC_IAX_PERSONA.F_INSERTA_DETALLE_PER(?, ?, ?, ?)}";
                
                logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCAGENTE_PROD"}, new Object[] {pPSPERSON, pPCAGENTE, pPCAGENTE_PROD});
                CallableStatement cStmt=conn.prepareCall(callQuery);
                String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                cStmt.setObject(2, pPSPERSON);
                cStmt.setObject(3, pPCAGENTE);
                cStmt.setObject(4, pPCAGENTE_PROD);
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

            public HashMap ejecutaPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCAGENTE_PROD) throws Exception {
                return this.callPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER(pPSPERSON, pPCAGENTE, pPCAGENTE_PROD); 
            }
            //--END-PAC_IAX_PERSONA.F_INSERTA_DETALLE_PER

             //--START-PAC_IAX_PERSONA.F_PERSONA_DUPLICADA(PSPERSON,  PNNUMIDE,  PCSEXPER,  PFNACIMI,  PSNIP,  PCAGENTE,  PSWPUBLI,  PCTIPIDE)
             private HashMap callPAC_IAX_PERSONA__F_PERSONA_DUPLICADA (java.math.BigDecimal pPSPERSON, String pPNNUMIDE, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPSNIP, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPCTIPIDE) throws Exception {
                 String callQuery="{?=call PAC_IAX_PERSONA.F_PERSONA_DUPLICADA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                 
                 logCall(callQuery, new String[] {"pPSPERSON", "pPNNUMIDE", "pPCSEXPER", "pPFNACIMI", "pPSNIP", "pPCAGENTE", "pPSWPUBLI", "pPCTIPIDE"}, new Object[] {pPSPERSON, pPNNUMIDE, pPCSEXPER, pPFNACIMI, pPSNIP, pPCAGENTE, pPSWPUBLI, pPCTIPIDE});
                 CallableStatement cStmt=conn.prepareCall(callQuery);
                 String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                 cStmt.setObject(2, pPSPERSON);
                 cStmt.setObject(3, pPNNUMIDE);
                 cStmt.setObject(4, pPCSEXPER);
                 cStmt.setObject(5, pPFNACIMI);
                 cStmt.setObject(6, pPSNIP);
                 cStmt.setObject(7, pPCAGENTE);
                 cStmt.setObject(8, pPSWPUBLI);
                 cStmt.setObject(9, pPCTIPIDE);
                 cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                 cStmt.registerOutParameter(10, java.sql.Types.NUMERIC); // Valor de "PDUPLICADA"
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
                     retVal.put("PDUPLICADA", cStmt.getObject(10));
                 }
                 catch (SQLException e) {
                     retVal.put("PDUPLICADA", null);
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

             public HashMap ejecutaPAC_IAX_PERSONA__F_PERSONA_DUPLICADA (java.math.BigDecimal pPSPERSON, String pPNNUMIDE, java.math.BigDecimal pPCSEXPER, java.sql.Date pPFNACIMI, String pPSNIP, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSWPUBLI, java.math.BigDecimal pPCTIPIDE) throws Exception {
                 return this.callPAC_IAX_PERSONA__F_PERSONA_DUPLICADA(pPSPERSON, pPNNUMIDE, pPCSEXPER, pPFNACIMI, pPSNIP, pPCAGENTE, pPSWPUBLI, pPCTIPIDE);//AXIS-WLS1SERVER-Ready 
             }
             //--END-PAC_IAX_PERSONA.F_PERSONA_DUPLICADA



              //--START-PAC_IAX_PERSONA.F_GET_NIF(PSPERSON,  PCTIPIDE,  PNNUMIDE,  PSNIP)
              private HashMap callPAC_IAX_PERSONA__F_GET_NIF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, String pPSNIP) throws Exception {
                  String callQuery="{?=call PAC_IAX_PERSONA.F_GET_NIF(?, ?, ?, ?, ?, ?)}";
                  
                  logCall(callQuery, new String[] {"pPSPERSON", "pPCTIPIDE", "pPNNUMIDE", "pPSNIP"}, new Object[] {pPSPERSON, pPCTIPIDE, pPNNUMIDE, pPSNIP});
                  CallableStatement cStmt=conn.prepareCall(callQuery);
                  String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                  cStmt.setObject(2, pPSPERSON);
                  cStmt.setObject(3, pPCTIPIDE);
                  cStmt.setObject(4, pPNNUMIDE);
                  cStmt.setObject(5, pPSNIP);
                  cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                  cStmt.registerOutParameter(6, java.sql.Types.VARCHAR); // Valor de "PNNUMIDE_OUT"
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
                      retVal.put("PNNUMIDE_OUT", cStmt.getObject(6));
                  }
                  catch (SQLException e) {
                      retVal.put("PNNUMIDE_OUT", null);
                  }
                  try {
                      retVal.put("MENSAJES", cStmt.getObject(7));
                  }
                  catch (SQLException e) {
                      retVal.put("MENSAJES", null);
                  }
                  retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
                  
                  return retVal;
              }

              public HashMap ejecutaPAC_IAX_PERSONA__F_GET_NIF (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE, String pPSNIP) throws Exception {
                  return this.callPAC_IAX_PERSONA__F_GET_NIF(pPSPERSON, pPCTIPIDE, pPNNUMIDE, pPSNIP); 
              }
              //--END-PAC_IAX_PERSONA.F_GET_NIF
              
              
               //--START-PAC_IAX_PERSONA.F_DEL_PERSONA_REL(PSPERSON,  PCAGENTE,  PSPERSON_REL, PCAGRUPA)
               private HashMap callPAC_IAX_PERSONA__F_DEL_PERSONA_REL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON_REL, java.math.BigDecimal pPCAGRUPA) throws Exception {
                   String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_PERSONA_REL(?, ?, ?, ?, ?)}";
                   
                   logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPSPERSON_REL", "pPCAGRUPA"}, new Object[] {pPSPERSON, pPCAGENTE, pPSPERSON_REL, pPCAGRUPA});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPSPERSON);
                   cStmt.setObject(3, pPCAGENTE);
                   cStmt.setObject(4, pPSPERSON_REL);
                   cStmt.setObject(5, pPCAGRUPA);
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

               public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_PERSONA_REL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON_REL, java.math.BigDecimal pPCAGRUPA) throws Exception {
                   return this.callPAC_IAX_PERSONA__F_DEL_PERSONA_REL(pPSPERSON, pPCAGENTE, pPSPERSON_REL, pPCAGRUPA); 
               }
               //--END-PAC_IAX_PERSONA.F_DEL_PERSONA_REL
               
                //--START-PAC_IAX_PERSONA.F_SET_PERSONA_REL(PSPERSON,  PCAGENTE,  PSPERSON_REL,  PCTIPPER_REL,  PPPARTICIPACION,  PISLIDER,  PTLIMIT,  PCAGRUPA,  PFAGRUPA)
               private HashMap callPAC_IAX_PERSONA__F_SET_PERSONA_REL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON_REL, java.math.BigDecimal pPCTIPPER_REL, java.math.BigDecimal pPPPARTICIPACION, java.math.BigDecimal pPISLIDER, String pPTLIMIT, java.math.BigDecimal pPCAGRUPA, java.sql.Date pPFAGRUPA) throws Exception {
                   String callQuery="{?=call PAC_IAX_PERSONA.F_SET_PERSONA_REL(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

                   
                   logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPSPERSON_REL", "pPCTIPPER_REL", "pPPPARTICIPACION", "pPISLIDER", "pPTLIMIT", "pPCAGRUPA", "pPFAGRUPA"}, new Object[] {pPSPERSON, pPCAGENTE, pPSPERSON_REL, pPCTIPPER_REL, pPPPARTICIPACION, pPISLIDER, pPTLIMIT, pPCAGRUPA, pPFAGRUPA});
                   CallableStatement cStmt=conn.prepareCall(callQuery);
                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                   cStmt.setObject(2, pPSPERSON);
                   cStmt.setObject(3, pPCAGENTE);
                   cStmt.setObject(4, pPSPERSON_REL);
                   cStmt.setObject(5, pPCTIPPER_REL);
                   cStmt.setObject(6, pPPPARTICIPACION);
                   cStmt.setObject(7, pPISLIDER);
                   cStmt.setObject(8, pPTLIMIT);
                   cStmt.setObject(9, pPCAGRUPA);
                   cStmt.setObject(10, pPFAGRUPA);
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
                   retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                   cStmt.close();//AXIS-WLS1SERVER-Ready

                   
                   return retVal;


               }

               public HashMap ejecutaPAC_IAX_PERSONA__F_SET_PERSONA_REL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPSPERSON_REL, java.math.BigDecimal pPCTIPPER_REL, java.math.BigDecimal pPPPARTICIPACION, java.math.BigDecimal pPISLIDER, String pPTLIMIT, java.math.BigDecimal pPCAGRUPA, java.sql.Date pPFAGRUPA) throws Exception {
                   return this.callPAC_IAX_PERSONA__F_SET_PERSONA_REL(pPSPERSON, pPCAGENTE, pPSPERSON_REL, pPCTIPPER_REL, pPPPARTICIPACION, pPISLIDER, pPTLIMIT, pPCAGRUPA, pPFAGRUPA);//AXIS-WLS1SERVER-Ready 

               }
               //--END-PAC_IAX_PERSONA.F_SET_PERSONA_REL


                
                
                 //--START-PAC_IAX_PERSONA.F_DEL_REGIMENFISCAL(PSPERSON,  PCAGENTE,  PFEFECTO)
                 private HashMap callPAC_IAX_PERSONA__F_DEL_REGIMENFISCAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO) throws Exception {
                     String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_REGIMENFISCAL(?, ?, ?, ?)}";
                     
                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPFEFECTO"}, new Object[] {pPSPERSON, pPCAGENTE, pPFEFECTO});
                     CallableStatement cStmt=conn.prepareCall(callQuery);
                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                     cStmt.setObject(2, pPSPERSON);
                     cStmt.setObject(3, pPCAGENTE);
                     cStmt.setObject(4, pPFEFECTO);
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

                 public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_REGIMENFISCAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO) throws Exception {
                     return this.callPAC_IAX_PERSONA__F_DEL_REGIMENFISCAL(pPSPERSON, pPCAGENTE, pPFEFECTO); 
                 }
                 //--END-PAC_IAX_PERSONA.F_DEL_REGIMENFISCAL


                 //--START-PAC_IAX_PERSONA.F_SET_REGIMENFISCAL(PSPERSON,  PCAGENTE,  PFEFECTO,  PCREGFISCAL,  PCREGFISEXEIVA,  PCTIPIVA)
                 private HashMap callPAC_IAX_PERSONA__F_SET_REGIMENFISCAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO, java.math.BigDecimal pPCREGFISCAL, java.math.BigDecimal pPCREGFISEXEIVA, java.math.BigDecimal pPCTIPIVA) throws Exception {
                     String callQuery="{?=call PAC_IAX_PERSONA.F_SET_REGIMENFISCAL(?, ?, ?, ?, ?, ?, ?)}";
                     
                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPFEFECTO", "pPCREGFISCAL", "pPCREGFISEXEIVA", "pPCTIPIVA"}, new Object[] {pPSPERSON, pPCAGENTE, pPFEFECTO, pPCREGFISCAL, pPCREGFISEXEIVA, pPCTIPIVA});
                     CallableStatement cStmt=conn.prepareCall(callQuery);
                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                     cStmt.setObject(2, pPSPERSON);
                     cStmt.setObject(3, pPCAGENTE);
                     cStmt.setObject(4, pPFEFECTO);
                     cStmt.setObject(5, pPCREGFISCAL);
                     cStmt.setObject(6, pPCREGFISEXEIVA);
                     cStmt.setObject(7, pPCTIPIVA);
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

                 public HashMap ejecutaPAC_IAX_PERSONA__F_SET_REGIMENFISCAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO, java.math.BigDecimal pPCREGFISCAL, java.math.BigDecimal pPCREGFISEXEIVA, java.math.BigDecimal pPCTIPIVA) throws Exception {
                     return this.callPAC_IAX_PERSONA__F_SET_REGIMENFISCAL(pPSPERSON, pPCAGENTE, pPFEFECTO, pPCREGFISCAL, pPCREGFISEXEIVA, pPCTIPIVA);//AXIS-WLS1SERVER-Ready 
                 }
                 //--END-PAC_IAX_PERSONA.F_SET_REGIMENFISCAL


                   //--START-PAC_IAX_PERSONA.F_DEL_SARLAFT(PSPERSON,  PCAGENTE,  PFEFECTO)
                      private HashMap callPAC_IAX_PERSONA__F_DEL_SARLAFT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO) throws Exception {
                          String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_SARLAFT(?, ?, ?, ?)}";
                          
                          logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPFEFECTO"}, new Object[] {pPSPERSON, pPCAGENTE, pPFEFECTO});
                          CallableStatement cStmt=conn.prepareCall(callQuery);
                          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                          cStmt.setObject(2, pPSPERSON);
                          cStmt.setObject(3, pPCAGENTE);
                          cStmt.setObject(4, pPFEFECTO);
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

                      public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_SARLAFT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO) throws Exception {
                          return this.callPAC_IAX_PERSONA__F_DEL_SARLAFT(pPSPERSON, pPCAGENTE, pPFEFECTO);//AXIS-WLS1SERVER-Ready 
                      }
                      //--END-PAC_IAX_PERSONA.F_DEL_SARLAFT
                      //--START-PAC_IAX_PERSONA.F_SET_SARLAFT(PSPERSON,  PCAGENTE,  PFEFECTO)
                      private HashMap callPAC_IAX_PERSONA__F_SET_SARLAFT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO) throws Exception {
                          String callQuery="{?=call PAC_IAX_PERSONA.F_SET_SARLAFT(?, ?, ?, ?)}";
                          
                          logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPFEFECTO"}, new Object[] {pPSPERSON, pPCAGENTE, pPFEFECTO});
                          CallableStatement cStmt=conn.prepareCall(callQuery);
                          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                          cStmt.setObject(2, pPSPERSON);
                          cStmt.setObject(3, pPCAGENTE);
                          cStmt.setObject(4, pPFEFECTO);
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

                      public HashMap ejecutaPAC_IAX_PERSONA__F_SET_SARLAFT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO) throws Exception {
                          return this.callPAC_IAX_PERSONA__F_SET_SARLAFT(pPSPERSON, pPCAGENTE, pPFEFECTO);//AXIS-WLS1SERVER-Ready 
                      }
                      //--END-PAC_IAX_PERSONA.F_SET_SARLAFT
                      
                      
                      /* ********************************* NUEVAS LISTAS ********************************************* */
                      
                       //--START-PAC_IAX_PERSONA.F_GET_COORDINADORES(PSPERSON)
                          private HashMap callPAC_IAX_PERSONA__F_GET_COORDINADORES (java.math.BigDecimal pPSPERSON) throws Exception {
                              String callQuery="{?=call PAC_IAX_PERSONA.F_GET_COORDINADORES(?, ?, ?)}";
                              
                              logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
                              CallableStatement cStmt=conn.prepareCall(callQuery);
                              String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                              cStmt.setObject(2, pPSPERSON);
                              cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                              cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
                                  retVal.put("PCUR", cStmt.getObject(3));
                              }
                              catch (SQLException e) {
                                  retVal.put("PCUR", null);
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

                          public HashMap ejecutaPAC_IAX_PERSONA__F_GET_COORDINADORES (java.math.BigDecimal pPSPERSON) throws Exception {
                              return this.callPAC_IAX_PERSONA__F_GET_COORDINADORES(pPSPERSON);//AXIS-WLS1SERVER-Ready 
                          }
                          //--END-PAC_IAX_PERSONA.F_GET_COORDINADORES
                          //--START-PAC_IAX_PERSONA.F_GET_GESTORES_EMPLEADOS(PSPERSON)
                          private HashMap callPAC_IAX_PERSONA__F_GET_GESTORES_EMPLEADOS (java.math.BigDecimal pPSPERSON) throws Exception {
                              String callQuery="{?=call PAC_IAX_PERSONA.F_GET_GESTORES_EMPLEADOS(?, ?, ?)}";
                              
                              logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
                              CallableStatement cStmt=conn.prepareCall(callQuery);
                              String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                              cStmt.setObject(2, pPSPERSON);
                              cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                              cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
                                  retVal.put("PCUR", cStmt.getObject(3));
                              }
                              catch (SQLException e) {
                                  retVal.put("PCUR", null);
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

                          public HashMap ejecutaPAC_IAX_PERSONA__F_GET_GESTORES_EMPLEADOS (java.math.BigDecimal pPSPERSON) throws Exception {
                              return this.callPAC_IAX_PERSONA__F_GET_GESTORES_EMPLEADOS(pPSPERSON);//AXIS-WLS1SERVER-Ready 
                          }
                          //--END-PAC_IAX_PERSONA.F_GET_GESTORES_EMPLEADOS
                          //--START-PAC_IAX_PERSONA.F_GET_LISTAS_OFICIALES(PSPERSON,  PCCLALIS)
                          private HashMap callPAC_IAX_PERSONA__F_GET_LISTAS_OFICIALES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCLALIS) throws Exception {
                              String callQuery="{?=call PAC_IAX_PERSONA.F_GET_LISTAS_OFICIALES(?, ?, ?, ?)}";
                              
                              logCall(callQuery, new String[] {"pPSPERSON", "pPCCLALIS"}, new Object[] {pPSPERSON, pPCCLALIS});
                              CallableStatement cStmt=conn.prepareCall(callQuery);
                              String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                              cStmt.setObject(2, pPSPERSON);
                              cStmt.setObject(3, pPCCLALIS);
                              cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                              cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
                                  retVal.put("PCUR", cStmt.getObject(4));
                              }
                              catch (SQLException e) {
                                  retVal.put("PCUR", null);
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

                          public HashMap ejecutaPAC_IAX_PERSONA__F_GET_LISTAS_OFICIALES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCCLALIS) throws Exception {
                              return this.callPAC_IAX_PERSONA__F_GET_LISTAS_OFICIALES(pPSPERSON, pPCCLALIS);//AXIS-WLS1SERVER-Ready 
                          }
                          //--END-PAC_IAX_PERSONA.F_GET_LISTAS_OFICIALES
                          //--START-PAC_IAX_PERSONA.F_GET_REPRESENT_PROMOTORES(PSPERSON)
                          private HashMap callPAC_IAX_PERSONA__F_GET_REPRESENT_PROMOTORES (java.math.BigDecimal pPSPERSON) throws Exception {
                              String callQuery="{?=call PAC_IAX_PERSONA.F_GET_REPRESENT_PROMOTORES(?, ?, ?)}";
                              
                              logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
                              CallableStatement cStmt=conn.prepareCall(callQuery);
                              String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                              cStmt.setObject(2, pPSPERSON);
                              cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                              cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
                                  retVal.put("PCUR", cStmt.getObject(3));
                              }
                              catch (SQLException e) {
                                  retVal.put("PCUR", null);
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

                          public HashMap ejecutaPAC_IAX_PERSONA__F_GET_REPRESENT_PROMOTORES (java.math.BigDecimal pPSPERSON) throws Exception {
                              return this.callPAC_IAX_PERSONA__F_GET_REPRESENT_PROMOTORES(pPSPERSON);//AXIS-WLS1SERVER-Ready 
                          }
                          //--END-PAC_IAX_PERSONA.F_GET_REPRESENT_PROMOTORES
                          //--START-PAC_IAX_PERSONA.F_GET_SPERSONCONTRATOS()
                          private HashMap callPAC_IAX_PERSONA__F_GET_SPERSONCONTRATOS () throws Exception {
                              String callQuery="{?=call PAC_IAX_PERSONA.F_GET_SPERSONCONTRATOS(?)}";
                              
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

                          public HashMap ejecutaPAC_IAX_PERSONA__F_GET_SPERSONCONTRATOS () throws Exception {
                              return this.callPAC_IAX_PERSONA__F_GET_SPERSONCONTRATOS();//AXIS-WLS1SERVER-Ready 
                          }
                          //--END-PAC_IAX_PERSONA.F_GET_SPERSONCONTRATOS
                          
                          //TODO:Se sobrecarga el m?do SET_CCC  (definidos p?metros NULL en PL)
                          //--START-PAC_IAX_PERSONA.F_SET_CCC(PSPERSON,  CAGENTE,  CNORDBAN,  PCTIPBAN,  CBANCAR,  PCDEFECTO,  PCPAGSIN,  PFVENCIM,  PTSEGURI)
                              private HashMap callPAC_IAX_PERSONA__F_SET_CCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI) throws Exception {
                                  String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CCC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                                  
                                  logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pCNORDBAN", "pPCTIPBAN", "pCBANCAR", "pPCDEFECTO", "pPCPAGSIN", "pPFVENCIM", "pPTSEGURI"}, new Object[] {pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI});
                                  CallableStatement cStmt=conn.prepareCall(callQuery);
                                  String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                  cStmt.setObject(2, pPSPERSON);
                                  cStmt.setObject(3, pCAGENTE);
                                  cStmt.setObject(4, pCNORDBAN);
                                  cStmt.setObject(6, pPCTIPBAN);
                                  cStmt.setObject(7, pCBANCAR);
                                  cStmt.setObject(8, pPCDEFECTO);
                                  cStmt.setObject(10, pPCPAGSIN);
                                  cStmt.setObject(11, pPFVENCIM);
                                  cStmt.setObject(12, pPTSEGURI);
                                  cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                  cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "CNORDBANOUT"
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
                                      retVal.put("CNORDBANOUT", cStmt.getObject(5));
                                  }
                                  catch (SQLException e) {
                                      retVal.put("CNORDBANOUT", null);
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

                              public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI) throws Exception {
                                  return this.callPAC_IAX_PERSONA__F_SET_CCC(pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI);//AXIS-WLS1SERVER-Ready 
                              }
                              //--END-PAC_IAX_PERSONA.F_SET_CCC
                              
                               //--START-PAC_IAX_PERSONA.F_GET_TIPCCC(PCTIPOCC)
                                   private HashMap callPAC_IAX_PERSONA__F_GET_TIPCCC (java.math.BigDecimal pPCTIPOCC) throws Exception {
                                       String callQuery="{?=call PAC_IAX_PERSONA.F_GET_TIPCCC(?, ?)}";
                                       
                                       logCall(callQuery, new String[] {"pPCTIPOCC"}, new Object[] {pPCTIPOCC});
                                       CallableStatement cStmt=conn.prepareCall(callQuery);
                                       String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                       cStmt.setObject(3, pPCTIPOCC);
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

                                   public HashMap ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC (java.math.BigDecimal pPCTIPOCC) throws Exception {
                                       return this.callPAC_IAX_PERSONA__F_GET_TIPCCC(pPCTIPOCC);//AXIS-WLS1SERVER-Ready 
                                   }
                                   //--END-PAC_IAX_PERSONA.F_GET_TIPCCC
                                   //TODO: Sobrecargada, acepta que sea null desde PL
                                    //--START-PAC_IAX_PERSONA.F_GET_ESTCUENTASBANCARIAS(PSPERSON,  PCAGENTE,  PCTIPCC)
                                        private HashMap callPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPCC) throws Exception {
                                            String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTCUENTASBANCARIAS(?, ?, ?, ?, ?)}";
                                            
                                            logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCTIPCC"}, new Object[] {pPSPERSON, pPCAGENTE, pPCTIPCC});
                                            CallableStatement cStmt=conn.prepareCall(callQuery);
                                            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                            cStmt.setObject(2, pPSPERSON);
                                            cStmt.setObject(3, pPCAGENTE);
                                            cStmt.setObject(6, pPCTIPCC);
                                            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                            cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_CCC".toUpperCase())); // Valor de "PCCC"
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
                                                retVal.put("PCCC", cStmt.getObject(4));
                                            }
                                            catch (SQLException e) {
                                                retVal.put("PCCC", null);
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

                                        public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCTIPCC) throws Exception {
                                            return this.callPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(pPSPERSON, pPCAGENTE, pPCTIPCC);//AXIS-WLS1SERVER-Ready 
                                        }
                                        //--END-PAC_IAX_PERSONA.F_GET_ESTCUENTASBANCARIAS


                           //--START-PAC_IAX_PERSONA.F_GET_PERSONAS_GENERICA_COND(NUMIDE,  NOMBRE,  NSIP,  PNOM,  PCOGNOM1,  PCOGNOM2,  PCTIPIDE,  PCAGENTE,  PMODO_SWPUBLI,  PCCONDICION)
                           private HashMap callPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND (String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCAGENTE, String pPMODO_SWPUBLI, String pPCCONDICION) throws Exception {
                               String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONAS_GENERICA_COND(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                               
                               logCall(callQuery, new String[] {"pNUMIDE", "pNOMBRE", "pNSIP", "pPNOM", "pPCOGNOM1", "pPCOGNOM2", "pPCTIPIDE", "pPCAGENTE", "pPMODO_SWPUBLI", "pPCCONDICION"}, new Object[] {pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPCAGENTE, pPMODO_SWPUBLI, pPCCONDICION});
                               CallableStatement cStmt=conn.prepareCall(callQuery);
                               String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                               cStmt.setObject(2, pNUMIDE);
                               cStmt.setObject(3, pNOMBRE);
                               cStmt.setObject(4, pNSIP);
                               cStmt.setObject(6, pPNOM);
                               cStmt.setObject(7, pPCOGNOM1);
                               cStmt.setObject(8, pPCOGNOM2);
                               cStmt.setObject(9, pPCTIPIDE);
                               cStmt.setObject(10, pPCAGENTE);
                               cStmt.setObject(11, pPMODO_SWPUBLI);
                               cStmt.setObject(12, pPCCONDICION);
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
                               retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                               cStmt.close();//AXIS-WLS1SERVER-Ready
                               
                               return retVal;
                           }

                           public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND (String pNUMIDE, String pNOMBRE, String pNSIP, String pPNOM, String pPCOGNOM1, String pPCOGNOM2, java.math.BigDecimal pPCTIPIDE, java.math.BigDecimal pPCAGENTE, String pPMODO_SWPUBLI, String pPCCONDICION) throws Exception {
                               return this.callPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(pNUMIDE, pNOMBRE, pNSIP, pPNOM, pPCOGNOM1, pPCOGNOM2, pPCTIPIDE, pPCAGENTE, pPMODO_SWPUBLI, pPCCONDICION);//AXIS-WLS1SERVER-Ready 
                           }
                           //--END-PAC_IAX_PERSONA.F_GET_PERSONAS_GENERICA_COND

                             //--START-PAC_IAX_PERSONA.F_SET_DOCPERSONA(PSPERSON,  PCAGENTE,  PFCADUCA,  PTOBSERVA,  PTFILENAME,  PIDDOCGEDOX,  PTDESC,  PIDCAT)
                             private HashMap callPAC_IAX_PERSONA__F_SET_DOCPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA, String pPTOBSERVA, String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
                                 
                                 
                                 String callQuery="{?=call PAC_IAX_PERSONA.F_SET_DOCPERSONA(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                                 
                                 logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPFCADUCA", "pPTOBSERVA", "pPTFILENAME", "pPIDDOCGEDOX", "pPTDESC", "pPIDCAT"}, new Object[] {pPSPERSON, pPCAGENTE, pPFCADUCA, pPTOBSERVA, pPTFILENAME, pPIDDOCGEDOX, pPTDESC, pPIDCAT});
                                 CallableStatement cStmt=conn.prepareCall(callQuery);
                                 String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                 cStmt.setObject(2, pPSPERSON);
                                 cStmt.setObject(3, pPCAGENTE);
                                 cStmt.setObject(4, pPFCADUCA);
                                 cStmt.setObject(5, pPTOBSERVA);
                                 cStmt.setObject(6, pPTFILENAME);
                                 cStmt.setObject(7, pPIDDOCGEDOX);
                                 cStmt.setObject(8, pPTDESC);
                                 cStmt.setObject(9, pPIDCAT);
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
                                 retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                                 cStmt.close();//AXIS-WLS1SERVER-Ready
                                 
                                 return retVal;
                             }

                             public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DOCPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA, String pPTOBSERVA, String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC, java.math.BigDecimal pPIDCAT) throws Exception {
                                 return this.callPAC_IAX_PERSONA__F_SET_DOCPERSONA(pPSPERSON, pPCAGENTE, pPFCADUCA, pPTOBSERVA, pPTFILENAME, pPIDDOCGEDOX, pPTDESC, pPIDCAT);//AXIS-WLS1SERVER-Ready 
                             }
                             //--END-PAC_IAX_PERSONA.F_SET_DOCPERSONA
                             
                              //--START-PAC_IAX_PERSONA.F_SET_DOCPERSONA(PSPERSON,  PCAGENTE,  PFCADUCA,  PTOBSERVA,  PTFILENAME,  PIDDOCGEDOX,  PTDESC,  PIDCAT,  PTDOCUMENTO,  PEDOCUMENTO,  PFEDO)
                              private HashMap callPAC_IAX_PERSONA__F_SET_DOCPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA, String pPTOBSERVA, String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC, java.math.BigDecimal pPIDCAT, java.math.BigDecimal pPTDOCUMENTO, java.math.BigDecimal pPEDOCUMENTO, java.sql.Date pPFEDO) throws Exception {
                                  String callQuery="{?=call PAC_IAX_PERSONA.F_SET_DOCPERSONA(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                                  
                                  logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPFCADUCA", "pPTOBSERVA", "pPTFILENAME", "pPIDDOCGEDOX", "pPTDESC", "pPIDCAT", "pPTDOCUMENTO", "pPEDOCUMENTO", "pPFEDO"}, new Object[] {pPSPERSON, pPCAGENTE, pPFCADUCA, pPTOBSERVA, pPTFILENAME, pPIDDOCGEDOX, pPTDESC, pPIDCAT, pPTDOCUMENTO, pPEDOCUMENTO, pPFEDO});
                                  CallableStatement cStmt=conn.prepareCall(callQuery);
                                  String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                  cStmt.setObject(2, pPSPERSON);
                                  cStmt.setObject(3, pPCAGENTE);
                                  cStmt.setObject(4, pPFCADUCA);
                                  cStmt.setObject(5, pPTOBSERVA);
                                  cStmt.setObject(6, pPTFILENAME);
                                  cStmt.setObject(7, pPIDDOCGEDOX);
                                  cStmt.setObject(8, pPTDESC);
                                  cStmt.setObject(9, pPIDCAT);
                                  cStmt.setObject(10, pPTDOCUMENTO);
                                  cStmt.setObject(11, pPEDOCUMENTO);
                                  cStmt.setObject(12, pPFEDO);
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

                              public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DOCPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFCADUCA, String pPTOBSERVA, String pPTFILENAME, java.math.BigDecimal pPIDDOCGEDOX, String pPTDESC, java.math.BigDecimal pPIDCAT, java.math.BigDecimal pPTDOCUMENTO, java.math.BigDecimal pPEDOCUMENTO, java.sql.Date pPFEDO) throws Exception {
                                  return this.callPAC_IAX_PERSONA__F_SET_DOCPERSONA(pPSPERSON, pPCAGENTE, pPFCADUCA, pPTOBSERVA, pPTFILENAME, pPIDDOCGEDOX, pPTDESC, pPIDCAT, pPTDOCUMENTO, pPEDOCUMENTO, pPFEDO);//AXIS-WLS1SERVER-Ready 
                              }
                              //--END-PAC_IAX_PERSONA.F_SET_DOCPERSONA
                              //--START-PAC_IAX_PERSONA.F_GET_DOCPERSONA(PSPERSON,  PCAGENTE,  PIDDOCGEDOX,  PTABLAS)
                              private HashMap callPAC_IAX_PERSONA__F_GET_DOCPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPIDDOCGEDOX, String pPTABLAS) throws Exception {
                                 String callQuery="{?=call PAC_IAX_PERSONA.F_GET_DOCPERSONA(?, ?, ?, ?, ?, ?)}";
                                 
                                 logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPIDDOCGEDOX", "pPTABLAS"}, new Object[] {pPSPERSON, pPCAGENTE, pPIDDOCGEDOX, pPTABLAS});
                                 CallableStatement cStmt=conn.prepareCall(callQuery);
                                 String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                 cStmt.setObject(2, pPSPERSON);
                                 cStmt.setObject(3, pPCAGENTE);
                                 cStmt.setObject(4, pPIDDOCGEDOX);
                                 cStmt.setObject(5, pPTABLAS);
                                 cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                 cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_DOCPERSONA".toUpperCase())); // Valor de "POBDOCPERSONA"
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
                                     retVal.put("POBDOCPERSONA", cStmt.getObject(6));
                                 }
                                 catch (SQLException e) {
                                     retVal.put("POBDOCPERSONA", null);
                                 }
                                 try {
                                     retVal.put("MENSAJES", cStmt.getObject(7));
                                 }
                                 catch (SQLException e) {
                                     retVal.put("MENSAJES", null);
                                 }
                                 retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                                 cStmt.close();//AXIS-WLS1SERVER-Ready
                                 
                                 return retVal;
                              }

                              public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DOCPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPIDDOCGEDOX, String pPTABLAS) throws Exception {
                                 return this.callPAC_IAX_PERSONA__F_GET_DOCPERSONA(pPSPERSON, pPCAGENTE, pPIDDOCGEDOX, pPTABLAS);//AXIS-WLS1SERVER-Ready 
                              }
                              //--END-PAC_IAX_PERSONA.F_GET_DOCPERSONA
                              //--START-PAC_IAX_PERSONA.F_SET_ESTREGIMENFISCAL(PSPERSON,  PCAGENTE,  PFEFECTO,  PCREGFISCAL,  PCTIPIVA)
                              private HashMap callPAC_IAX_PERSONA__F_SET_ESTREGIMENFISCAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO, java.math.BigDecimal pPCREGFISCAL, java.math.BigDecimal pPCTIPIVA) throws Exception {
                                  String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTREGIMENFISCAL(?, ?, ?, ?, ?, ?)}";
                                  
                                  logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPFEFECTO", "pPCREGFISCAL", "pPCTIPIVA"}, new Object[] {pPSPERSON, pPCAGENTE, pPFEFECTO, pPCREGFISCAL, pPCTIPIVA});
                                  CallableStatement cStmt=conn.prepareCall(callQuery);
                                  String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                  cStmt.setObject(2, pPSPERSON);
                                  cStmt.setObject(3, pPCAGENTE);
                                  cStmt.setObject(4, pPFEFECTO);
                                  cStmt.setObject(5, pPCREGFISCAL);
                                  cStmt.setObject(6, pPCTIPIVA);
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
                                  retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                                  cStmt.close();//AXIS-WLS1SERVER-Ready
                                  
                                  return retVal;
                              }

                              public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTREGIMENFISCAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.sql.Date pPFEFECTO, java.math.BigDecimal pPCREGFISCAL, java.math.BigDecimal pPCTIPIVA) throws Exception {
                                  return this.callPAC_IAX_PERSONA__F_SET_ESTREGIMENFISCAL(pPSPERSON, pPCAGENTE, pPFEFECTO, pPCREGFISCAL, pPCTIPIVA);//AXIS-WLS1SERVER-Ready 
                              }
                              //--END-PAC_IAX_PERSONA.F_SET_ESTREGIMENFISCAL


                               //--START-PAC_IAX_PERSONA.F_GET_ESTPARPERSONA(PSPERSON,  PCAGENTE,  PCVISIBLE,  PTOTS)
                               private HashMap callPAC_IAX_PERSONA__F_GET_ESTPARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS, java.math.BigDecimal pCTIPPER) throws Exception {
                                   String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTPARPERSONA(?, ?, ?, ?, ?, ?, ?)}";
                                   
                                   logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCVISIBLE", "pPTOTS", "pCTIPPER"}, new Object[] {pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS, pCTIPPER});
                                   CallableStatement cStmt=conn.prepareCall(callQuery);
                                   String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                   cStmt.setObject(2, pPSPERSON);
                                   cStmt.setObject(3, pPCAGENTE);
                                   cStmt.setObject(4, pPCVISIBLE);
                                   cStmt.setObject(5, pPTOTS);
                                   cStmt.setObject(6, pCTIPPER);
                                   cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                   cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_PAR_PERSONAS".toUpperCase())); // Valor de "PPARPER"
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
                                       retVal.put("PPARPER", cStmt.getObject(7));
                                   }
                                   catch (SQLException e) {
                                       retVal.put("PPARPER", null);
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

                               public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS, java.math.BigDecimal pCTIPPER) throws Exception {
                                   return this.callPAC_IAX_PERSONA__F_GET_ESTPARPERSONA(pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS, pCTIPPER);//AXIS-WLS1SERVER-Ready 
                               }
                               //--END-PAC_IAX_PERSONA.F_GET_ESTPARPERSONA
                                //--START-PAC_IAX_PERSONA.F_GET_PARPERSONA_OB(PSPERSON,  PCAGENTE,  PCVISIBLE,  PTOTS,  PTABLAS)
                                private HashMap callPAC_IAX_PERSONA__F_GET_PARPERSONA_OB (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS, String pPTABLAS) throws Exception {
                                    String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PARPERSONA_OB(?, ?, ?, ?, ?, ?, ?)}";
                                    
                                    logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCVISIBLE", "pPTOTS", "pPTABLAS"}, new Object[] {pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS, pPTABLAS});
                                    CallableStatement cStmt=conn.prepareCall(callQuery);
                                    String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                    cStmt.setObject(2, pPSPERSON);
                                    cStmt.setObject(3, pPCAGENTE);
                                    cStmt.setObject(4, pPCVISIBLE);
                                    cStmt.setObject(5, pPTOTS);
                                    cStmt.setObject(6, pPTABLAS);
                                    cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                    cStmt.registerOutParameter(7, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_PAR_PERSONAS".toUpperCase())); // Valor de "PPARPER"
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
                                        retVal.put("PPARPER", cStmt.getObject(7));
                                    }
                                    catch (SQLException e) {
                                        retVal.put("PPARPER", null);
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

                                public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PARPERSONA_OB (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS, String pPTABLAS) throws Exception {
                                    return this.callPAC_IAX_PERSONA__F_GET_PARPERSONA_OB(pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS, pPTABLAS);//AXIS-WLS1SERVER-Ready 
                                }
                                //--END-PAC_IAX_PERSONA.F_GET_PARPERSONA_OB
                               
                                //--START-PAC_IAX_PERSONA.F_INS_ESTPARPERSONA(PSPERSON,  PCAGENTE,  PCPARAM,  PNVALPAR,  PTVALPAR,  PFVALPAR)
                                private HashMap callPAC_IAX_PERSONA__F_INS_ESTPARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
                                    String callQuery="{?=call PAC_IAX_PERSONA.F_INS_ESTPARPERSONA(?, ?, ?, ?, ?, ?, ?)}";
                                    
                                    logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCPARAM", "pPNVALPAR", "pPTVALPAR", "pPFVALPAR"}, new Object[] {pPSPERSON, pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR});
                                    CallableStatement cStmt=conn.prepareCall(callQuery);
                                    String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                    cStmt.setObject(2, pPSPERSON);
                                    cStmt.setObject(3, pPCAGENTE);
                                    cStmt.setObject(4, pPCPARAM);
                                    cStmt.setObject(5, pPNVALPAR);
                                    cStmt.setObject(6, pPTVALPAR);
                                    cStmt.setObject(7, pPFVALPAR);
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

                                public HashMap ejecutaPAC_IAX_PERSONA__F_INS_ESTPARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
                                    return this.callPAC_IAX_PERSONA__F_INS_ESTPARPERSONA(pPSPERSON, pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR);//AXIS-WLS1SERVER-Ready 
                                }
                                //--END-PAC_IAX_PERSONA.F_INS_ESTPARPERSONA

                                 //--START-PAC_IAX_PERSONA.F_DEL_ESTPARPERSONA(PSPERSON,  PCAGENTE,  PCPARAM)
                                 private HashMap callPAC_IAX_PERSONA__F_DEL_ESTPARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM) throws Exception {
                                     String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ESTPARPERSONA(?, ?, ?, ?)}";
                                     
                                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCPARAM"}, new Object[] {pPSPERSON, pPCAGENTE, pPCPARAM});
                                     CallableStatement cStmt=conn.prepareCall(callQuery);
                                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                     cStmt.setObject(2, pPSPERSON);
                                     cStmt.setObject(3, pPCAGENTE);
                                     cStmt.setObject(4, pPCPARAM);
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

                                 public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ESTPARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM) throws Exception {
                                     return this.callPAC_IAX_PERSONA__F_DEL_ESTPARPERSONA(pPSPERSON, pPCAGENTE, pPCPARAM);//AXIS-WLS1SERVER-Ready 
                                 }
                                 //--END-PAC_IAX_PERSONA.F_DEL_ESTPARPERSONA
      
                                  //--START-PAC_IAX_PERSONA.F_GRABAR_PARPERSONA(PSPERSON,  PCAGENTE,  PTABLAS)
                                  private HashMap callPAC_IAX_PERSONA__F_GRABAR_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPTABLAS) throws Exception {
                                      String callQuery="{?=call PAC_IAX_PERSONA.F_GRABAR_PARPERSONA(?, ?, ?, ?)}";
                                      
                                      logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPTABLAS"}, new Object[] {pPSPERSON, pPCAGENTE, pPTABLAS});
                                      CallableStatement cStmt=conn.prepareCall(callQuery);
                                      String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                      cStmt.setObject(2, pPSPERSON);
                                      cStmt.setObject(3, pPCAGENTE);
                                      cStmt.setObject(4, pPTABLAS);
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

                                  public HashMap ejecutaPAC_IAX_PERSONA__F_GRABAR_PARPERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPTABLAS) throws Exception {
                                      return this.callPAC_IAX_PERSONA__F_GRABAR_PARPERSONA(pPSPERSON, pPCAGENTE, pPTABLAS);//AXIS-WLS1SERVER-Ready 
                                  }
                                  //--END-PAC_IAX_PERSONA.F_GRABAR_PARPERSONA
                                  
                                  
                                 

                                   //--START-PAC_IAX_PERSONA.F_LIMPIAR_OBJETOS()
                                   private HashMap callPAC_IAX_PERSONA__F_LIMPIAR_OBJETOS () throws Exception {
                                       String callQuery="{?=call PAC_IAX_PERSONA.F_LIMPIAR_OBJETOS(?)}";
                                       
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

                                   public HashMap ejecutaPAC_IAX_PERSONA__F_LIMPIAR_OBJETOS () throws Exception {
                                       return this.callPAC_IAX_PERSONA__F_LIMPIAR_OBJETOS();//AXIS-WLS1SERVER-Ready 
                                   }
                                   //--END-PAC_IAX_PERSONA.F_LIMPIAR_OBJETOS
                                    //--START-PAC_IAX_PERSONA.F_DIGITO_NIF_COL(PCTIPIDE,  PNNUMIDE)
                                    private HashMap callPAC_IAX_PERSONA__F_DIGITO_NIF_COL (java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE) throws Exception {
                                        String callQuery="{?=call PAC_IAX_PERSONA.F_DIGITO_NIF_COL(?, ?, ?)}";
                                        
                                        logCall(callQuery, new String[] {"pPCTIPIDE", "pPNNUMIDE"}, new Object[] {pPCTIPIDE, pPNNUMIDE});
                                        CallableStatement cStmt=conn.prepareCall(callQuery);
                                        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                        cStmt.setObject(2, pPCTIPIDE);
                                        cStmt.setObject(3, pPNNUMIDE);
                                        cStmt.registerOutParameter(1, java.sql.Types.VARCHAR); // Valor de "RETURN"
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

                                    public HashMap ejecutaPAC_IAX_PERSONA__F_DIGITO_NIF_COL (java.math.BigDecimal pPCTIPIDE, String pPNNUMIDE) throws Exception {
                                        return this.callPAC_IAX_PERSONA__F_DIGITO_NIF_COL(pPCTIPIDE, pPNNUMIDE);//AXIS-WLS1SERVER-Ready 
                                    }
                                    //--END-PAC_IAX_PERSONA.F_DIGITO_NIF_COL

                             /* Con parametro a??do ctipcc*/ 
                            //--START-PAC_IAX_PERSONA.F_SET_CCC(PSPERSON,  CAGENTE,  CNORDBAN,  PCTIPBAN,  CBANCAR,  PCDEFECTO,  PCPAGSIN,  PFVENCIM,  PTSEGURI,  PCTIPCC)
                                   private HashMap callPAC_IAX_PERSONA__F_SET_CCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI, String pPCTIPCC) throws Exception {
                                       /* Cambio para IAXIS-14685 : start */
                                       String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CCC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                                       /* Cambio para IAXIS-14685 : end */
                                       logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pCNORDBAN", "pPCTIPBAN", "pCBANCAR", "pPCDEFECTO", "pPCPAGSIN", "pPFVENCIM", "pPTSEGURI", "pPCTIPCC"}, new Object[] {pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI, pPCTIPCC});
                                       CallableStatement cStmt=conn.prepareCall(callQuery);
                                       String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                       cStmt.setObject(2, pPSPERSON);
                                       cStmt.setObject(3, pCAGENTE);
                                       cStmt.setObject(4, pCNORDBAN);
                                       cStmt.setObject(6, pPCTIPBAN);
                                       cStmt.setObject(7, pCBANCAR);
                                       cStmt.setObject(8, pPCDEFECTO);
                                       cStmt.setObject(10, pPCPAGSIN);
                                       cStmt.setObject(11, pPFVENCIM);
                                       cStmt.setObject(12, pPTSEGURI);
                                       cStmt.setObject(13, pPCTIPCC);
                                       /* Cambio para IAXIS-14685 : start */ 
                                       cStmt.setBigDecimal(14, BigDecimal.ZERO);             
                                       /* Cambio para IAXIS-14685 : end */ 
                                       cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                       cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "CNORDBANOUT"
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
                                           retVal.put("CNORDBANOUT", cStmt.getObject(5));
                                       }
                                       catch (SQLException e) {
                                           retVal.put("CNORDBANOUT", null);
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

                                   public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI, String pPCTIPCC) throws Exception {
                                       return this.callPAC_IAX_PERSONA__F_SET_CCC(pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI, pPCTIPCC);//AXIS-WLS1SERVER-Ready 
                                   }
                                   //--END-PAC_IAX_PERSONA.F_SET_CCC

                                    //--START-PAC_IAX_PERSONA.F_SET_ESTCCC(PSPERSON,  CAGENTE,  CNORDBAN,  PCTIPBAN,  CBANCAR,  PCDEFECTO,  PCPAGSIN,  PFVENCIM,  PTSEGURI,  PCTIPCC)
                                    private HashMap callPAC_IAX_PERSONA__F_SET_ESTCCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI, String pPCTIPCC) throws Exception {
                                        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTCCC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                                        
                                        logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pCNORDBAN", "pPCTIPBAN", "pCBANCAR", "pPCDEFECTO", "pPCPAGSIN", "pPFVENCIM", "pPTSEGURI", "pPCTIPCC"}, new Object[] {pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI, pPCTIPCC});
                                        CallableStatement cStmt=conn.prepareCall(callQuery);
                                        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                        cStmt.setObject(2, pPSPERSON);
                                        cStmt.setObject(3, pCAGENTE);
                                        cStmt.setObject(4, pCNORDBAN);
                                        cStmt.setObject(6, pPCTIPBAN);
                                        cStmt.setObject(7, pCBANCAR);
                                        cStmt.setObject(8, pPCDEFECTO);
                                        cStmt.setObject(10, pPCPAGSIN);
                                        cStmt.setObject(11, pPFVENCIM);
                                        cStmt.setObject(12, pPTSEGURI);
                                        cStmt.setObject(13, pPCTIPCC);
                                        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                        cStmt.registerOutParameter(5, java.sql.Types.NUMERIC); // Valor de "CNORDBANOUT"
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
                                            retVal.put("CNORDBANOUT", cStmt.getObject(5));
                                        }
                                        catch (SQLException e) {
                                            retVal.put("CNORDBANOUT", null);
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

                                    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTCCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCNORDBAN, java.math.BigDecimal pPCTIPBAN, String pCBANCAR, java.math.BigDecimal pPCDEFECTO, java.math.BigDecimal pPCPAGSIN, java.sql.Date pPFVENCIM, String pPTSEGURI, String pPCTIPCC) throws Exception {
                                        return this.callPAC_IAX_PERSONA__F_SET_ESTCCC(pPSPERSON, pCAGENTE, pCNORDBAN, pPCTIPBAN, pCBANCAR, pPCDEFECTO, pPCPAGSIN, pPFVENCIM, pPTSEGURI, pPCTIPCC);//AXIS-WLS1SERVER-Ready 
                                    }
                                    //--END-PAC_IAX_PERSONA.F_SET_ESTCCC
                                    
                                     //--START-PAC_IAX_PERSONA.F_MOD_IDENTIFICADOR(PSPERSON,  CAGENTE,  CTIPIDE,  NNUMIDE,  CDEFECTO,  PAISEXP,  CDEPARTEXP,  CCIUDADEXP,  FECHAEXP)
                                     private HashMap callPAC_IAX_PERSONA__F_MOD_IDENTIFICADOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCDEFECTO, java.math.BigDecimal pPAISEXP, java.math.BigDecimal pCDEPARTEXP, java.math.BigDecimal pCCIUDADEXP, java.sql.Date pFECHAEXP) throws Exception {
                                         /* Cambio para IAXIS-14685 : start */ 
                                         String callQuery="{?=call PAC_IAX_PERSONA.F_MOD_IDENTIFICADOR(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
                                         /* Cambio para IAXIS-14685 : end */ 
                                         logCall(callQuery, new String[] {"pPSPERSON", "pCAGENTE", "pCTIPIDE", "pNNUMIDE", "pCDEFECTO", "pPAISEXP", "pCDEPARTEXP", "pCCIUDADEXP", "pFECHAEXP"}, new Object[] {pPSPERSON, pCAGENTE, pCTIPIDE, pNNUMIDE, pCDEFECTO, pPAISEXP, pCDEPARTEXP, pCCIUDADEXP, pFECHAEXP});
                                         CallableStatement cStmt=conn.prepareCall(callQuery);
                                         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                         cStmt.setObject(2, pPSPERSON);
                                         cStmt.setObject(3, pCAGENTE);
                                         cStmt.setObject(4, pCTIPIDE);
                                         cStmt.setObject(5, pNNUMIDE);
                                         cStmt.setObject(6, pCDEFECTO);
                                         cStmt.setObject(8, pPAISEXP);
                                         cStmt.setObject(9, pCDEPARTEXP);
                                         cStmt.setObject(10, pCCIUDADEXP);
                                         cStmt.setObject(11, pFECHAEXP);
                                         /* Cambio para IAXIS-14685 : start */ 
                                         cStmt.setBigDecimal(12, BigDecimal.ZERO);             
                                         /* Cambio para IAXIS-14685 : end */ 
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
                                         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                                         cStmt.close();//AXIS-WLS1SERVER-Ready
                                         
                                         return retVal;
                                     }

                                     public HashMap ejecutaPAC_IAX_PERSONA__F_MOD_IDENTIFICADOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCTIPIDE, String pNNUMIDE, java.math.BigDecimal pCDEFECTO, java.math.BigDecimal pPAISEXP, java.math.BigDecimal pCDEPARTEXP, java.math.BigDecimal pCCIUDADEXP, java.sql.Date pFECHAEXP) throws Exception {
                                         return this.callPAC_IAX_PERSONA__F_MOD_IDENTIFICADOR(pPSPERSON, pCAGENTE, pCTIPIDE, pNNUMIDE, pCDEFECTO, pPAISEXP, pCDEPARTEXP, pCCIUDADEXP, pFECHAEXP);//AXIS-WLS1SERVER-Ready 
                                     }
                                     //--END-PAC_IAX_PERSONA.F_MOD_IDENTIFICADOR


                              
                               //--START-PAC_IAX_PERSONA.F_VALIDA_PAGOCCC(PSPERSON,  PCAGENTE,  PCNORDBAN)
                                 private HashMap callPAC_IAX_PERSONA__F_VALIDA_PAGOCCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCNORDBAN) throws Exception {
                                     String callQuery="{?=call PAC_IAX_PERSONA.F_VALIDA_PAGOCCC(?, ?, ?, ?, ?)}";
                                     
                                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCNORDBAN"}, new Object[] {pPSPERSON, pPCAGENTE, pPCNORDBAN});
                                     CallableStatement cStmt=conn.prepareCall(callQuery);
                                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                     cStmt.setObject(2, pPSPERSON);
                                     cStmt.setObject(3, pPCAGENTE);
                                     cStmt.setObject(4, pPCNORDBAN);
                                     cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                     cStmt.registerOutParameter(5, java.sql.Types.VARCHAR); // Valor de "PCODILIT"
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
                                         retVal.put("PCODILIT", cStmt.getObject(5));
                                     }
                                     catch (SQLException e) {
                                         retVal.put("PCODILIT", null);
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

                                 public HashMap ejecutaPAC_IAX_PERSONA__F_VALIDA_PAGOCCC (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCNORDBAN) throws Exception {
                                     return this.callPAC_IAX_PERSONA__F_VALIDA_PAGOCCC(pPSPERSON, pPCAGENTE, pPCNORDBAN);//AXIS-WLS1SERVER-Ready 
                                 }
                                 //--END-PAC_IAX_PERSONA.F_VALIDA_PAGOCCC

  //--START-PAC_IAX_PERSONA.F_BLOQUEAR_PERSONA(PSPERSON,  PCAGENTE)
                                 private HashMap callPAC_IAX_PERSONA__F_BLOQUEAR_PERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                     String callQuery="{?=call PAC_IAX_PERSONA.F_BLOQUEAR_PERSONA(?, ?, ?)}";
                                     
                                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE"}, new Object[] {pPSPERSON, pPCAGENTE});
                                     CallableStatement cStmt=conn.prepareCall(callQuery);
                                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                     cStmt.setObject(2, pPSPERSON);
                                     cStmt.setObject(3, pPCAGENTE);
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

                                 public HashMap ejecutaPAC_IAX_PERSONA__F_BLOQUEAR_PERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                     return this.callPAC_IAX_PERSONA__F_BLOQUEAR_PERSONA(pPSPERSON, pPCAGENTE);//AXIS-WLS1SERVER-Ready 
                                 }
                                 //--END-PAC_IAX_PERSONA.F_BLOQUEAR_PERSONA
                                 //--START-PAC_IAX_PERSONA.F_BORRAR_PERSONA_LOPD(PSPERSON,  PCAGENTE)
                                 private HashMap callPAC_IAX_PERSONA__F_BORRAR_PERSONA_LOPD (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                     String callQuery="{?=call PAC_IAX_PERSONA.F_BORRAR_PERSONA_LOPD(?, ?, ?)}";
                                     
                                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE"}, new Object[] {pPSPERSON, pPCAGENTE});
                                     CallableStatement cStmt=conn.prepareCall(callQuery);
                                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                     cStmt.setObject(2, pPSPERSON);
                                     cStmt.setObject(3, pPCAGENTE);
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

                                 public HashMap ejecutaPAC_IAX_PERSONA__F_BORRAR_PERSONA_LOPD (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                     return this.callPAC_IAX_PERSONA__F_BORRAR_PERSONA_LOPD(pPSPERSON, pPCAGENTE);//AXIS-WLS1SERVER-Ready 
                                 }
                                 //--END-PAC_IAX_PERSONA.F_BORRAR_PERSONA_LOPD
                                 //--START-PAC_IAX_PERSONA.F_DESBLOQUEAR_PERSONA(PSPERSON,  PCAGENTE)
                                 private HashMap callPAC_IAX_PERSONA__F_DESBLOQUEAR_PERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                     String callQuery="{?=call PAC_IAX_PERSONA.F_DESBLOQUEAR_PERSONA(?, ?, ?)}";
                                     
                                     logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE"}, new Object[] {pPSPERSON, pPCAGENTE});
                                     CallableStatement cStmt=conn.prepareCall(callQuery);
                                     String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                     cStmt.setObject(2, pPSPERSON);
                                     cStmt.setObject(3, pPCAGENTE);
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

                                 public HashMap ejecutaPAC_IAX_PERSONA__F_DESBLOQUEAR_PERSONA (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                     return this.callPAC_IAX_PERSONA__F_DESBLOQUEAR_PERSONA(pPSPERSON, pPCAGENTE);//AXIS-WLS1SERVER-Ready 
                                 }
                                 //--END-PAC_IAX_PERSONA.F_DESBLOQUEAR_PERSONA


                                  //--START-PAC_IAX_PERSONA.F_GET_PERLOPD(PSPERSON,  PCAGENTE)
                                  private HashMap callPAC_IAX_PERSONA__F_GET_PERLOPD (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                      String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERLOPD(?, ?, ?, ?)}";
                                      
                                      logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE"}, new Object[] {pPSPERSON, pPCAGENTE});
                                      CallableStatement cStmt=conn.prepareCall(callQuery);
                                      String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                      cStmt.setObject(2, pPSPERSON);
                                      cStmt.setObject(3, pPCAGENTE);
                                      cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                      cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERLOPD".toUpperCase())); // Valor de "POBPERLOPD"
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
                                          retVal.put("POBPERLOPD", cStmt.getObject(4));
                                      }
                                      catch (SQLException e) {
                                          retVal.put("POBPERLOPD", null);
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

                                  public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERLOPD (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                      return this.callPAC_IAX_PERSONA__F_GET_PERLOPD(pPSPERSON, pPCAGENTE);//AXIS-WLS1SERVER-Ready 
                                  }
                                  //--END-PAC_IAX_PERSONA.F_GET_PERLOPD
                                   //--START-PAC_IAX_PERSONA.F_SET_PERSONA_LOPD(PSPERSON,  PCAGENTE,  PCESION,  PPUBLICIDAD,  PACCESO,  PRECTIFICACION)
                                   private HashMap callPAC_IAX_PERSONA__F_SET_PERSONA_LOPD (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCESION, java.math.BigDecimal pPPUBLICIDAD, java.math.BigDecimal pPACCESO, java.math.BigDecimal pPRECTIFICACION) throws Exception {
                                       String callQuery="{?=call PAC_IAX_PERSONA.F_SET_PERSONA_LOPD(?, ?, ?, ?, ?, ?, ?)}";
                                       
                                       logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCESION", "pPPUBLICIDAD", "pPACCESO", "pPRECTIFICACION"}, new Object[] {pPSPERSON, pPCAGENTE, pPCESION, pPPUBLICIDAD, pPACCESO, pPRECTIFICACION});
                                       CallableStatement cStmt=conn.prepareCall(callQuery);
                                       String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                       cStmt.setObject(2, pPSPERSON);
                                       cStmt.setObject(3, pPCAGENTE);
                                       cStmt.setObject(4, pPCESION);
                                       cStmt.setObject(5, pPPUBLICIDAD);
                                       cStmt.setObject(6, pPACCESO);
                                       cStmt.setObject(7, pPRECTIFICACION);
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

                                   public HashMap ejecutaPAC_IAX_PERSONA__F_SET_PERSONA_LOPD (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCESION, java.math.BigDecimal pPPUBLICIDAD, java.math.BigDecimal pPACCESO, java.math.BigDecimal pPRECTIFICACION) throws Exception {
                                       return this.callPAC_IAX_PERSONA__F_SET_PERSONA_LOPD(pPSPERSON, pPCAGENTE, pPCESION, pPPUBLICIDAD, pPACCESO, pPRECTIFICACION);//AXIS-WLS1SERVER-Ready 
                                   }
                                   //--END-PAC_IAX_PERSONA.F_SET_PERSONA_LOPD



                                //--START-PAC_IAX_PERSONA.F_GET_AUTORIZACIONES(PSPERSON,  PCAGENTE)
                                private HashMap callPAC_IAX_PERSONA__F_GET_AUTORIZACIONES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                    String callQuery="{?=call PAC_IAX_PERSONA.F_GET_AUTORIZACIONES(?, ?, ?)}";
                                    
                                    logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE"}, new Object[] {pPSPERSON, pPCAGENTE});
                                    CallableStatement cStmt=conn.prepareCall(callQuery);
                                    String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                    cStmt.setObject(2, pPSPERSON);
                                    cStmt.setObject(3, pPCAGENTE);
                                    cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS_AUT".toUpperCase())); // Valor de "RETURN"
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

                                public HashMap ejecutaPAC_IAX_PERSONA__F_GET_AUTORIZACIONES (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE) throws Exception {
                                    return this.callPAC_IAX_PERSONA__F_GET_AUTORIZACIONES(pPSPERSON, pPCAGENTE);//AXIS-WLS1SERVER-Ready 
                                }
                                //--END-PAC_IAX_PERSONA.F_GET_AUTORIZACIONES
                                //--START-PAC_IAX_PERSONA.F_GET_CONTACTO_AUT(PSPERSON,  PCAGENTE,  PCMODCON,  PNORDEN)
                                private HashMap callPAC_IAX_PERSONA__F_GET_CONTACTO_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMODCON, java.math.BigDecimal pPNORDEN) throws Exception {
                                    String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONTACTO_AUT(?, ?, ?, ?, ?, ?)}";
                                    
                                    logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCMODCON", "pPNORDEN"}, new Object[] {pPSPERSON, pPCAGENTE, pPCMODCON, pPNORDEN});
                                    CallableStatement cStmt=conn.prepareCall(callQuery);
                                    String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                    cStmt.setObject(2, pPSPERSON);
                                    cStmt.setObject(3, pPCAGENTE);
                                    cStmt.setObject(4, pPCMODCON);
                                    cStmt.setObject(5, pPNORDEN);
                                    cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                    cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_CONTACTOS_AUT".toUpperCase())); // Valor de "OBCONTACTO_AUT"
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
                                        retVal.put("OBCONTACTO_AUT", cStmt.getObject(6));
                                    }
                                    catch (SQLException e) {
                                        retVal.put("OBCONTACTO_AUT", null);
                                    }
                                    try {
                                        retVal.put("MENSAJES", cStmt.getObject(7));
                                    }
                                    catch (SQLException e) {
                                        retVal.put("MENSAJES", null);
                                    }
                                    retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                                    cStmt.close();//AXIS-WLS1SERVER-Ready
                                    
                                    return retVal;
                                }

                                public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONTACTO_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMODCON, java.math.BigDecimal pPNORDEN) throws Exception {
                                    return this.callPAC_IAX_PERSONA__F_GET_CONTACTO_AUT(pPSPERSON, pPCAGENTE, pPCMODCON, pPNORDEN);//AXIS-WLS1SERVER-Ready 
                                }
                                //--END-PAC_IAX_PERSONA.F_GET_CONTACTO_AUT
                                //--START-PAC_IAX_PERSONA.F_GET_DIRECCION_AUT(PSPERSON,  PCAGENTE,  PCDOMICI,  PNORDEN)
                                private HashMap callPAC_IAX_PERSONA__F_GET_DIRECCION_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPNORDEN) throws Exception {
                                    String callQuery="{?=call PAC_IAX_PERSONA.F_GET_DIRECCION_AUT(?, ?, ?, ?, ?, ?)}";
                                    
                                    logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCDOMICI", "pPNORDEN"}, new Object[] {pPSPERSON, pPCAGENTE, pPCDOMICI, pPNORDEN});
                                    CallableStatement cStmt=conn.prepareCall(callQuery);
                                    String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                    cStmt.setObject(2, pPSPERSON);
                                    cStmt.setObject(3, pPCAGENTE);
                                    cStmt.setObject(4, pPCDOMICI);
                                    cStmt.setObject(5, pPNORDEN);
                                    cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                    cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_DIRECCIONES_AUT".toUpperCase())); // Valor de "OBDIRECCION_AUT"
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
                                        retVal.put("OBDIRECCION_AUT", cStmt.getObject(6));
                                    }
                                    catch (SQLException e) {
                                        retVal.put("OBDIRECCION_AUT", null);
                                    }
                                    try {
                                        retVal.put("MENSAJES", cStmt.getObject(7));
                                    }
                                    catch (SQLException e) {
                                        retVal.put("MENSAJES", null);
                                    }
                                    retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
                                    cStmt.close();//AXIS-WLS1SERVER-Ready
                                    
                                    return retVal;
                                }

                                public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPNORDEN) throws Exception {
                                    return this.callPAC_IAX_PERSONA__F_GET_DIRECCION_AUT(pPSPERSON, pPCAGENTE, pPCDOMICI, pPNORDEN);//AXIS-WLS1SERVER-Ready 
                                }
                                //--END-PAC_IAX_PERSONA.F_GET_DIRECCION_AUT
                                //--START-PAC_IAX_PERSONA.F_SET_CONTACTO_AUT(PSPERSON,  PCAGENTE,  PCMODCON,  PTMODCON,  PNORDEN,  PCESTADO,  PTOBSERVA)
                                private HashMap callPAC_IAX_PERSONA__F_SET_CONTACTO_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMODCON, String pPTMODCON, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCESTADO, String pPTOBSERVA) throws Exception {
                                    String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CONTACTO_AUT(?, ?, ?, ?, ?, ?, ?, ?)}";
                                    
                                    logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCMODCON", "pPTMODCON", "pPNORDEN", "pPCESTADO", "pPTOBSERVA"}, new Object[] {pPSPERSON, pPCAGENTE, pPCMODCON, pPTMODCON, pPNORDEN, pPCESTADO, pPTOBSERVA});
                                    CallableStatement cStmt=conn.prepareCall(callQuery);
                                    String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                    cStmt.setObject(2, pPSPERSON);
                                    cStmt.setObject(3, pPCAGENTE);
                                    cStmt.setObject(4, pPCMODCON);
                                    cStmt.setObject(5, pPTMODCON);
                                    cStmt.setObject(6, pPNORDEN);
                                    cStmt.setObject(7, pPCESTADO);
                                    cStmt.setObject(8, pPTOBSERVA);
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

                                public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CONTACTO_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCMODCON, String pPTMODCON, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCESTADO, String pPTOBSERVA) throws Exception {
                                    return this.callPAC_IAX_PERSONA__F_SET_CONTACTO_AUT(pPSPERSON, pPCAGENTE, pPCMODCON, pPTMODCON, pPNORDEN, pPCESTADO, pPTOBSERVA);//AXIS-WLS1SERVER-Ready 
                                }
                                //--END-PAC_IAX_PERSONA.F_SET_CONTACTO_AUT
                                //--START-PAC_IAX_PERSONA.F_SET_DIRECCION_AUT(PSPERSON,  PCAGENTE,  PCDOMICI,  PNORDEN,  PCESTADO,  PTOBSERVA)
                                private HashMap callPAC_IAX_PERSONA__F_SET_DIRECCION_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCESTADO, String pPTOBSERVA) throws Exception {
                                    String callQuery="{?=call PAC_IAX_PERSONA.F_SET_DIRECCION_AUT(?, ?, ?, ?, ?, ?, ?)}";
                                    
                                    logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCDOMICI", "pPNORDEN", "pPCESTADO", "pPTOBSERVA"}, new Object[] {pPSPERSON, pPCAGENTE, pPCDOMICI, pPNORDEN, pPCESTADO, pPTOBSERVA});
                                    CallableStatement cStmt=conn.prepareCall(callQuery);
                                    String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                    cStmt.setObject(2, pPSPERSON);
                                    cStmt.setObject(3, pPCAGENTE);
                                    cStmt.setObject(4, pPCDOMICI);
                                    cStmt.setObject(5, pPNORDEN);
                                    cStmt.setObject(6, pPCESTADO);
                                    cStmt.setObject(7, pPTOBSERVA);
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

                                public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DIRECCION_AUT (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCDOMICI, java.math.BigDecimal pPNORDEN, java.math.BigDecimal pPCESTADO, String pPTOBSERVA) throws Exception {
                                    return this.callPAC_IAX_PERSONA__F_SET_DIRECCION_AUT(pPSPERSON, pPCAGENTE, pPCDOMICI, pPNORDEN, pPCESTADO, pPTOBSERVA);//AXIS-WLS1SERVER-Ready 
                                }
                                //--END-PAC_IAX_PERSONA.F_SET_DIRECCION_AUT

                                 //--END-PAC_IAX_PERSONA.F_SET_DIRECCION_AUT
                                  //--START-PAC_IAX_PERSONA.F_GET_INQUIAVAL(PSPERSON,  PCTIPFIG)
                                  private HashMap callPAC_IAX_PERSONA__F_GET_INQUIAVAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPFIG) throws Exception {
                                      String callQuery="{?=call PAC_IAX_PERSONA.F_GET_INQUIAVAL(?, ?, ?, ?)}";
                                      
                                      logCall(callQuery, new String[] {"pPSPERSON", "pPCTIPFIG"}, new Object[] {pPSPERSON, pPCTIPFIG});
                                      CallableStatement cStmt=conn.prepareCall(callQuery);
                                      String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                      cStmt.setObject(2, pPSPERSON);
                                      cStmt.setObject(3, pPCTIPFIG);
                                      cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                      cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
                                          retVal.put("PCUR", cStmt.getObject(4));
                                      }
                                      catch (SQLException e) {
                                          retVal.put("PCUR", null);
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

                                  public HashMap ejecutaPAC_IAX_PERSONA__F_GET_INQUIAVAL (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPFIG) throws Exception {
                                      return this.callPAC_IAX_PERSONA__F_GET_INQUIAVAL(pPSPERSON, pPCTIPFIG);//AXIS-WLS1SERVER-Ready 
                                  }
                                  //--END-PAC_IAX_PERSONA.F_GET_INQUIAVAL
                                  
                                   //--START-PAC_IAX_PERSONA.F_GET_GESCOBRO(PSPERSON)
                                   private HashMap callPAC_IAX_PERSONA__F_GET_GESCOBRO (java.math.BigDecimal pPSPERSON) throws Exception {
                                       String callQuery="{?=call PAC_IAX_PERSONA.F_GET_GESCOBRO(?, ?, ?)}";
                                       
                                       logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
                                       CallableStatement cStmt=conn.prepareCall(callQuery);
                                       String USERNAME=conn.getMetaData().getUserName().toUpperCase();
                                       cStmt.setObject(2, pPSPERSON);
                                       cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
                                       cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
                                           retVal.put("PCUR", cStmt.getObject(3));
                                       }
                                       catch (SQLException e) {
                                           retVal.put("PCUR", null);
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

                                   public HashMap ejecutaPAC_IAX_PERSONA__F_GET_GESCOBRO (java.math.BigDecimal pPSPERSON) throws Exception {
                                       return this.callPAC_IAX_PERSONA__F_GET_GESCOBRO(pPSPERSON);//AXIS-WLS1SERVER-Ready 
                                   }
                                   //--END-PAC_IAX_PERSONA.F_GET_GESCOBRO
    //--START-PAC_IAX_PERSONA.F_GET_ANTIGUEDAD(PSPERSON)
    private HashMap callPAC_IAX_PERSONA__F_GET_ANTIGUEDAD (java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ANTIGUEDAD(?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
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
    
    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ANTIGUEDAD (java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ANTIGUEDAD(pPSPERSON);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ANTIGUEDAD
    
     //--START-PAC_IAX_PERSONA.F_GET_CONDUCTORES(PSPERSON)
     private HashMap callPAC_IAX_PERSONA__F_GET_CONDUCTORES (java.math.BigDecimal pPSPERSON) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CONDUCTORES(?, ?)}";
         
         logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPSPERSON);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CONDUCTORES (java.math.BigDecimal pPSPERSON) throws Exception {
         return this.callPAC_IAX_PERSONA__F_GET_CONDUCTORES(pPSPERSON);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_PERSONA.F_GET_CONDUCTORES

     //--START-PAC_IAX_PERSONA.F_GET_PROVINPOBLAPAIS(PCPOSTAL)
     private HashMap callPAC_IAX_PERSONA__F_GET_PROVINPOBLAPAIS (String pPCPOSTAL) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PROVINPOBLAPAIS(?, ?)}";
         
         logCall(callQuery, new String[] {"pPCPOSTAL"}, new Object[] {pPCPOSTAL});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPCPOSTAL);
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

     public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PROVINPOBLAPAIS (String pPCPOSTAL) throws Exception {
         return this.callPAC_IAX_PERSONA__F_GET_PROVINPOBLAPAIS(pPCPOSTAL);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_PERSONA.F_GET_PROVINPOBLAPAIS
     
     
     //--START-PAC_IAX_PERSONA.F_GET_CODPOSTAL(PCPAIS,  PCPROVIN,  PCPOBLAC)
     private HashMap callPAC_IAX_PERSONA__F_GET_CODPOSTAL (java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC) throws Exception {
         String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CODPOSTAL(?, ?, ?, ?)}";
         
         logCall(callQuery, new String[] {"pPCPAIS", "pPCPROVIN", "pPCPOBLAC"}, new Object[] {pPCPAIS, pPCPROVIN, pPCPOBLAC});
         CallableStatement cStmt=conn.prepareCall(callQuery);
         String USERNAME=conn.getMetaData().getUserName().toUpperCase();
         cStmt.setObject(2, pPCPAIS);
         cStmt.setObject(3, pPCPROVIN);
         cStmt.setObject(4, pPCPOBLAC);
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
         retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
         cStmt.close();//AXIS-WLS1SERVER-Ready
         
         return retVal;
     }

     public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CODPOSTAL (java.math.BigDecimal pPCPAIS, java.math.BigDecimal pPCPROVIN, java.math.BigDecimal pPCPOBLAC) throws Exception {
         return this.callPAC_IAX_PERSONA__F_GET_CODPOSTAL(pPCPAIS, pPCPROVIN, pPCPOBLAC);//AXIS-WLS1SERVER-Ready 
     }
     //--END-PAC_IAX_PERSONA.F_GET_CODPOSTAL
     
    
    // Para parche Ramiro
    //--START-PAC_IAX_PERSONA.F_GET_ESTPARPERSONAS(PSPERSON,  PCAGENTE,  PCVISIBLE,  PTOTS)
    private HashMap callPAC_IAX_PERSONA__F_GET_ESTPARPERSONAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ESTPARPERSONAS(?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCVISIBLE", "pPTOTS"}, new Object[] {pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.setObject(4, pPCVISIBLE);
        cStmt.setObject(5, pPTOTS);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); // Valor de "PCUR"
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
            retVal.put("PCUR", cStmt.getObject(6));
        }
        catch (SQLException e) {
            retVal.put("PCUR", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(7));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }

    /**
     * @param pPSPERSON
     * @param pPCAGENTE
     * @param pPCVISIBLE
     * @param pPTOTS
     * @return
     * @throws Exception
     */
    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, java.math.BigDecimal pPCVISIBLE, java.math.BigDecimal pPTOTS) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ESTPARPERSONAS(pPSPERSON, pPCAGENTE, pPCVISIBLE, pPTOTS);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ESTPARPERSONAS
    
    
    //--START-PAC_IAX_PERSONA.F_INS_PARPERSONAS(PSPERSON,  PCAGENTE,  PCPARAM,  PNVALPAR,  PTVALPAR,  PFVALPAR)
    private HashMap callPAC_IAX_PERSONA__F_INS_ESTPARPERSONAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_INS_ESTPARPERSONAS(?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCPARAM", "pPNVALPAR", "pPTVALPAR", "pPFVALPAR"}, new Object[] {pPSPERSON, pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.setObject(4, pPCPARAM);
        cStmt.setObject(5, pPNVALPAR);
        cStmt.setObject(6, pPTVALPAR);
        cStmt.setObject(7, pPFVALPAR);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_INS_ESTPARPERSONAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM, java.math.BigDecimal pPNVALPAR, String pPTVALPAR, java.sql.Date pPFVALPAR) throws Exception {
        return this.callPAC_IAX_PERSONA__F_INS_ESTPARPERSONAS(pPSPERSON, pPCAGENTE, pPCPARAM, pPNVALPAR, pPTVALPAR, pPFVALPAR);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_INS_PARPERSONAS


    //--START-PAC_IAX_PERSONA.F_DEL_ESTPARPERSONAS(PSPERSON,  PCAGENTE,  PCPARAM)
    private HashMap callPAC_IAX_PERSONA__F_DEL_ESTPARPERSONAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ESTPARPERSONAS(?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pPCAGENTE", "pPCPARAM"}, new Object[] {pPSPERSON, pPCAGENTE, pPCPARAM});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCAGENTE);
        cStmt.setObject(4, pPCPARAM);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ESTPARPERSONAS (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCAGENTE, String pPCPARAM) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_ESTPARPERSONAS(pPSPERSON, pPCAGENTE, pPCPARAM);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_ESTPARPERSONAS

    //--START-PAC_IAX_PERSONA.F_GET_REGIMENFISCAL(PCAGENTE,  PTABLAS)
    private HashMap callPAC_IAX_PERSONA__F_GET_REGIMENFISCAL (java.math.BigDecimal pPCAGENTE, String pPTABLAS) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_REGIMENFISCAL(?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPCAGENTE", "pPTABLAS"}, new Object[] {pPCAGENTE, pPTABLAS});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCAGENTE);
        cStmt.setObject(5, pPTABLAS);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_REGIMENFISCAL".toUpperCase())); // Valor de "POREGIMENFISCAL"
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
            retVal.put("POREGIMENFISCAL", cStmt.getObject(3));
        }
        catch (SQLException e) {
            retVal.put("POREGIMENFISCAL", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_REGIMENFISCAL (java.math.BigDecimal pPCAGENTE, String pPTABLAS) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_REGIMENFISCAL(pPCAGENTE, pPTABLAS);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_REGIMENFISCAL

    // CP0727M_SYS_PERS_Val - ACL - 23/11/2018 -- Se agrega el parametro pcorigenfon
    //--START-PAC_IAX_PERSONA.F_SET_DATSARLATF(PSSARLAFT,  PFRADICA,  PSPERSON,  PFDILIGENCIA,  PCAUTTRADAT,  PCRUTFCC,  PCESTCONF,  PFCONFIR,  PCVINCULACION,  PTVINCULACION,  PER_CDEPTOSOL,  PER_TDEPTOSOL,  PER_CCIUSOL,  PER_TCIUSOL,  PCVINTOMASE,  PTVINTOMASE,  PCVINTOMBEN,  PTVINTOMBEM,  PCVINASEBEN,  PTVINASEBEM,  PCACTIPPAL,  PPERSECTORPPAL,  PNCIIUPPAL,  PTCCIIUPPAL,  PPERTIPOACTIVPPAL,  PTOCUPACION,  PTCARGO,  PTEMPRESA,  PTDIREMPRESA,  PPERCDEPTOOFIC,  PPERTDEPTOOFIC,  PPERCCIUOFIC,  PPERTCIUOFIC,  PTTELEMPRESA,  PCACTISEC,  PNCIIUSEC,  PTCCIIUSEC,  PTDIRSEC,  PTTELSEC,  PTPRODSERVCOM,  PIINGRESOS,  PIACTIVOS,  PIPATRIMONIO,  PIEGRESOS,  PIPASIVOS,  PIOTROINGRESO,  PTCONCOTRING,  PCMANRECPUB,  PCPODPUB,  PCRECPUB,  PCVINPERPUB,  PTVINPERPUB,  PCDECTRIBEXT,  PTDECTRIBEXT,  PTORIGFOND,  PCTRAXMODEXT,  PTTRAXMODEXT,  PCPRODFINEXT,  PCCTAMODEXT,  PTOTRASOPER,  PCRECLINDSEG,  PTCIUDADSUC,  PTPAISUC,  PTDEPATAMENTOSUC,  PTCIUDAD,  PTDEPATAMENTO,  PTPAIS,  PTLUGAREXPEDIDOC,  PRESOCIEDAD,  PTNACIONALI2,  PNGRADOPOD,  PNGOZREC,  PNPARTICIPA,  PNVINCULO,  PNTIPDOC,  PFEXPEDICDOC,  PFNACIMIENTO,  PNRAZONSO,  PTNIT,  PTDV,  PTOFICINAPRI,  PTTELEFONO,  PTFAX,  PTSUCURSAL,  PTTELEFONOSUC,  PTFAXSUC,  PCTIPOEMP,  PTCUALTEMP,  PTSECTOR,  PCCIIU,  PTACTIACA,  PTMAILJURID,  PTREPRESENTANLE,  PTSEGAPE,  PTNOMBRES,  PTNUMDOC,  PTLUGNACI,  PTNACIONALI1,  PTINDIQUEVIN,  PPER_PAPELLIDO,  PPER_SAPELLIDO,  PPER_NOMBRES,  PPER_TIPDOCUMENT,  PPER_DOCUMENT,  PPER_FEXPEDICION,  PPER_LUGEXPEDICION,  PPER_FNACIMI,  PPER_LUGNACIMI,  PPER_NACION1,  PPER_DIRERECI,  PPER_PAIS,  PPER_CIUDAD,  PPER_DEPARTAMENT,  PPER_EMAIL,  PPER_TELEFONO,  PPER_CELULAR,  PNRECPUB,  PTPRESETRECLAMACI,  PPER_TLUGEXPEDICION,  PPER_TLUGNACIMI,  PPER_TNACION1,  PPER_TNACION2,  PPER_TPAIS,  PPER_TDEPARTAMENT,  PPER_TCIUDAD,  PEMPTPAIS,  PEMPTDEPATAMENTO,  PEMPTCIUDAD,  PEMPTPAISUC,  PEMPTDEPATAMENTOSUC,  PEMPTCIUDADSUC,  PEMPTLUGNACI,  PEMPTNACIONALI1,  PEMPTNACIONALI2,  PCSUJETOOBLIFACION,  PTINDIQUEOBLIG,  PPER_PAISEXPEDICION,  PPER_TPAISEXPEDICION,  PPER_DEPEXPEDICION,  PPER_TDEPEXPEDICION,  PPER_PAISLUGNACIMI,  PPER_TPAISLUGNACIMI,  PPER_DEPLUGNACIMI,  PPER_TDEPLUGNACIMI,  PEMP_PAISEXPEDICION,  PEMP_TPAISEXPEDICION,  PEMP_DEPEXPEDICION,  PEMP_TDEPEXPEDICION,  PEMP_PAISLUGNACIMI,  PEMP_TPAISLUGNACIMI,  PEMP_DEPLUGNACIMI,  PEMP_TDEPLUGNACIMI,  PEMP_LUGNACIMI,  PEMP_TLUGNACIMI,  PEMP_FEXPEDICION,  PEMP_LUGEXPEDICION,  PEMP_TLUGEXPEDICION,  PPER_NACION2,  PPER_PCCIUSOL,  PPER_PCSUCURSAL,  PPER_PCTIPSOL,  PPER_PCSECTOR,  PPER_PCTIPACT,  PPER_PCCIUOFC,  PPER_PCDEPOFC,  PEMP_TMAILREPL,  PEMP_TDIRSREPL,  PEMP_CCIURREPL,  PEMP_TCIURREPL,  PEMP_CDEPRREPL,  PEMP_TDEPRREPL,  PEMP_CPAIRREPL,  PEMP_TPAIRREPL,  PEMP_TTELREPL,  PEMP_TCELUREPL,  PCDEPTOENTREV,  PTDEPTOENTREV,  PCCIUENTREV,  PTCIUENTREV,  PFENTREVISTA,  PTHORAENTREV,  PTAGENENTREV,  PTASESENTREV,  PTOBSEENTREV,  PCRESTENTREV,  PTOBSECONFIR,  PTHORACONFIR,  PTEMPLCONFIR, PCORIGENFON, PCCLAUSULA1, PCCLAUSULA2)
    private HashMap callPAC_IAX_PERSONA__F_SET_DATSARLATF (java.math.BigDecimal pPSSARLAFT, java.sql.Date pPFRADICA, java.math.BigDecimal pPSPERSON, java.sql.Date pPFDILIGENCIA, java.math.BigDecimal pPCAUTTRADAT, java.math.BigDecimal pPCRUTFCC, java.math.BigDecimal pPCESTCONF, java.sql.Date pPFCONFIR, java.math.BigDecimal pPCVINCULACION, String pPTVINCULACION, java.math.BigDecimal pPER_CDEPTOSOL, String pPER_TDEPTOSOL, java.math.BigDecimal pPER_CCIUSOL, String pPER_TCIUSOL, java.math.BigDecimal pPCVINTOMASE, String pPTVINTOMASE, java.math.BigDecimal pPCVINTOMBEN, String pPTVINTOMBEM, java.math.BigDecimal pPCVINASEBEN, String pPTVINASEBEM, java.math.BigDecimal pPCACTIPPAL, java.math.BigDecimal pPPERSECTORPPAL, java.math.BigDecimal pPNCIIUPPAL, String pPTCCIIUPPAL, String pPPERTIPOACTIVPPAL, String pPTOCUPACION, String pPTCARGO, String pPTEMPRESA, String pPTDIREMPRESA, java.math.BigDecimal pPPERCDEPTOOFIC, String pPPERTDEPTOOFIC, java.math.BigDecimal pPPERCCIUOFIC, String pPPERTCIUOFIC, String pPTTELEMPRESA, java.math.BigDecimal pPCACTISEC, java.math.BigDecimal pPNCIIUSEC, String pPTCCIIUSEC, String pPTDIRSEC, String pPTTELSEC, String pPTPRODSERVCOM, java.math.BigDecimal pPIINGRESOS, java.math.BigDecimal pPIACTIVOS, java.math.BigDecimal pPIPATRIMONIO, java.math.BigDecimal pPIEGRESOS, java.math.BigDecimal pPIPASIVOS, java.math.BigDecimal pPIOTROINGRESO, String pPTCONCOTRING, java.math.BigDecimal pPCMANRECPUB, java.math.BigDecimal pPCPODPUB, java.math.BigDecimal pPCRECPUB, java.math.BigDecimal pPCVINPERPUB, String pPTVINPERPUB, java.math.BigDecimal pPCDECTRIBEXT, String pPTDECTRIBEXT, String pPTORIGFOND, java.math.BigDecimal pPCTRAXMODEXT, String pPTTRAXMODEXT, java.math.BigDecimal pPCPRODFINEXT, java.math.BigDecimal pPCCTAMODEXT, String pPTOTRASOPER, java.math.BigDecimal pPCRECLINDSEG, java.math.BigDecimal pPTCIUDADSUC, java.math.BigDecimal pPTPAISUC, java.math.BigDecimal pPTDEPATAMENTOSUC, java.math.BigDecimal pPTCIUDAD, java.math.BigDecimal pPTDEPATAMENTO, java.math.BigDecimal pPTPAIS, java.math.BigDecimal pPTLUGAREXPEDIDOC, java.math.BigDecimal pPRESOCIEDAD, java.math.BigDecimal pPTNACIONALI2, java.math.BigDecimal pPNGRADOPOD, java.math.BigDecimal pPNGOZREC, java.math.BigDecimal pPNPARTICIPA, java.math.BigDecimal pPNVINCULO, java.math.BigDecimal pPNTIPDOC, java.sql.Date pPFEXPEDICDOC, java.sql.Date pPFNACIMIENTO, String pPNRAZONSO, String pPTNIT, String pPTDV, String pPTOFICINAPRI, String pPTTELEFONO, String pPTFAX, String pPTSUCURSAL, String pPTTELEFONOSUC, String pPTFAXSUC, String pPCTIPOEMP, String pPTCUALTEMP, String pPTSECTOR, java.math.BigDecimal pPCCIIU, String pPTACTIACA, String pPTMAILJURID, String pPTREPRESENTANLE, String pPTSEGAPE, String pPTNOMBRES, String pPTNUMDOC, String pPTLUGNACI, String pPTNACIONALI1, String pPTINDIQUEVIN, String pPPER_PAPELLIDO, String pPPER_SAPELLIDO, String pPPER_NOMBRES, java.math.BigDecimal pPPER_TIPDOCUMENT, String pPPER_DOCUMENT, java.sql.Date pPPER_FEXPEDICION, java.math.BigDecimal pPPER_LUGEXPEDICION, java.sql.Date pPPER_FNACIMI, java.math.BigDecimal pPPER_LUGNACIMI, java.math.BigDecimal pPPER_NACION1, String pPPER_DIRERECI, java.math.BigDecimal pPPER_PAIS, java.math.BigDecimal pPPER_CIUDAD, java.math.BigDecimal pPPER_DEPARTAMENT, String pPPER_EMAIL, String pPPER_TELEFONO, String pPPER_CELULAR, java.math.BigDecimal pPNRECPUB, java.math.BigDecimal pPTPRESETRECLAMACI, String pPPER_TLUGEXPEDICION, String pPPER_TLUGNACIMI, String pPPER_TNACION1, String pPPER_TNACION2, String pPPER_TPAIS, String pPPER_TDEPARTAMENT, String pPPER_TCIUDAD, String pPEMPTPAIS, String pPEMPTDEPATAMENTO, String pPEMPTCIUDAD, String pPEMPTPAISUC, String pPEMPTDEPATAMENTOSUC, String pPEMPTCIUDADSUC, String pPEMPTLUGNACI, String pPEMPTNACIONALI1, String pPEMPTNACIONALI2, java.math.BigDecimal pPCSUJETOOBLIFACION, String pPTINDIQUEOBLIG, java.math.BigDecimal pPPER_PAISEXPEDICION, String pPPER_TPAISEXPEDICION, java.math.BigDecimal pPPER_DEPEXPEDICION, String pPPER_TDEPEXPEDICION, java.math.BigDecimal pPPER_PAISLUGNACIMI, String pPPER_TPAISLUGNACIMI, java.math.BigDecimal pPPER_DEPLUGNACIMI, String pPPER_TDEPLUGNACIMI, java.math.BigDecimal pPEMP_PAISEXPEDICION, String pPEMP_TPAISEXPEDICION, java.math.BigDecimal pPEMP_DEPEXPEDICION, String pPEMP_TDEPEXPEDICION, java.math.BigDecimal pPEMP_PAISLUGNACIMI, String pPEMP_TPAISLUGNACIMI, java.math.BigDecimal pPEMP_DEPLUGNACIMI, String pPEMP_TDEPLUGNACIMI, java.math.BigDecimal pPEMP_LUGNACIMI, String pPEMP_TLUGNACIMI, java.sql.Date pPEMP_FEXPEDICION, java.math.BigDecimal pPEMP_LUGEXPEDICION, String pPEMP_TLUGEXPEDICION, java.math.BigDecimal pPPER_NACION2, java.math.BigDecimal pPPER_PCCIUSOL, String pPPER_PCSUCURSAL, java.math.BigDecimal pPPER_PCTIPSOL, java.math.BigDecimal pPPER_PCSECTOR, String pPPER_PCTIPACT, java.math.BigDecimal pPPER_PCCIUOFC, java.math.BigDecimal pPPER_PCDEPOFC, String pPEMP_TMAILREPL, String pPEMP_TDIRSREPL, java.math.BigDecimal pPEMP_CCIURREPL, String pPEMP_TCIURREPL, java.math.BigDecimal pPEMP_CDEPRREPL, String pPEMP_TDEPRREPL, java.math.BigDecimal pPEMP_CPAIRREPL, String pPEMP_TPAIRREPL, java.math.BigDecimal pPEMP_TTELREPL, java.math.BigDecimal pPEMP_TCELUREPL, java.math.BigDecimal pPCDEPTOENTREV, String pPTDEPTOENTREV, java.math.BigDecimal pPCCIUENTREV, String pPTCIUENTREV, java.sql.Date pPFENTREVISTA, String pPTHORAENTREV, String pPTAGENENTREV, String pPTASESENTREV, String pPTOBSEENTREV, java.math.BigDecimal pPCRESTENTREV, String pPTOBSECONFIR, String pPTHORACONFIR, String pPTEMPLCONFIR, String pPCORIGENFON, java.math.BigDecimal pPCCLAUSULA1, java.math.BigDecimal pPCCLAUSULA2,java.math.BigDecimal pPCCONFIR) throws Exception { //IAXIS-3287 01/04/2019
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_DATSARLATF(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)}"; //IAXIS-3287 01/04/2019
        
        logCall(callQuery, new String[] {"pPSSARLAFT", "pPFRADICA", "pPSPERSON", "pPFDILIGENCIA", "pPCAUTTRADAT", "pPCRUTFCC", "pPCESTCONF", "pPFCONFIR", "pPCVINCULACION", "pPTVINCULACION", "pPER_CDEPTOSOL", "pPER_TDEPTOSOL", "pPER_CCIUSOL", "pPER_TCIUSOL", "pPCVINTOMASE", "pPTVINTOMASE", "pPCVINTOMBEN", "pPTVINTOMBEM", "pPCVINASEBEN", "pPTVINASEBEM", "pPCACTIPPAL", "pPPERSECTORPPAL", "pPNCIIUPPAL", "pPTCCIIUPPAL", "pPPERTIPOACTIVPPAL", "pPTOCUPACION", "pPTCARGO", "pPTEMPRESA", "pPTDIREMPRESA", "pPPERCDEPTOOFIC", "pPPERTDEPTOOFIC", "pPPERCCIUOFIC", "pPPERTCIUOFIC", "pPTTELEMPRESA", "pPCACTISEC", "pPNCIIUSEC", "pPTCCIIUSEC", "pPTDIRSEC", "pPTTELSEC", "pPTPRODSERVCOM", "pPIINGRESOS", "pPIACTIVOS", "pPIPATRIMONIO", "pPIEGRESOS", "pPIPASIVOS", "pPIOTROINGRESO", "pPTCONCOTRING", "pPCMANRECPUB", "pPCPODPUB", "pPCRECPUB", "pPCVINPERPUB", "pPTVINPERPUB", "pPCDECTRIBEXT", "pPTDECTRIBEXT", "pPTORIGFOND", "pPCTRAXMODEXT", "pPTTRAXMODEXT", "pPCPRODFINEXT", "pPCCTAMODEXT", "pPTOTRASOPER", "pPCRECLINDSEG", "pPTCIUDADSUC", "pPTPAISUC", "pPTDEPATAMENTOSUC", "pPTCIUDAD", "pPTDEPATAMENTO", "pPTPAIS", "pPTLUGAREXPEDIDOC", "pPRESOCIEDAD", "pPTNACIONALI2", "pPNGRADOPOD", "pPNGOZREC", "pPNPARTICIPA", "pPNVINCULO", "pPNTIPDOC", "pPFEXPEDICDOC", "pPFNACIMIENTO", "pPNRAZONSO", "pPTNIT", "pPTDV", "pPTOFICINAPRI", "pPTTELEFONO", "pPTFAX", "pPTSUCURSAL", "pPTTELEFONOSUC", "pPTFAXSUC", "pPCTIPOEMP", "pPTCUALTEMP", "pPTSECTOR", "pPCCIIU", "pPTACTIACA", "pPTMAILJURID", "pPTREPRESENTANLE", "pPTSEGAPE", "pPTNOMBRES", "pPTNUMDOC", "pPTLUGNACI", "pPTNACIONALI1", "pPTINDIQUEVIN", "pPPER_PAPELLIDO", "pPPER_SAPELLIDO", "pPPER_NOMBRES", "pPPER_TIPDOCUMENT", "pPPER_DOCUMENT", "pPPER_FEXPEDICION", "pPPER_LUGEXPEDICION", "pPPER_FNACIMI", "pPPER_LUGNACIMI", "pPPER_NACION1", "pPPER_DIRERECI", "pPPER_PAIS", "pPPER_CIUDAD", "pPPER_DEPARTAMENT", "pPPER_EMAIL", "pPPER_TELEFONO", "pPPER_CELULAR", "pPNRECPUB", "pPTPRESETRECLAMACI", "pPPER_TLUGEXPEDICION", "pPPER_TLUGNACIMI", "pPPER_TNACION1", "pPPER_TNACION2", "pPPER_TPAIS", "pPPER_TDEPARTAMENT", "pPPER_TCIUDAD", "pPEMPTPAIS", "pPEMPTDEPATAMENTO", "pPEMPTCIUDAD", "pPEMPTPAISUC", "pPEMPTDEPATAMENTOSUC", "pPEMPTCIUDADSUC", "pPEMPTLUGNACI", "pPEMPTNACIONALI1", "pPEMPTNACIONALI2", "pPCSUJETOOBLIFACION", "pPTINDIQUEOBLIG", "pPPER_PAISEXPEDICION", "pPPER_TPAISEXPEDICION", "pPPER_DEPEXPEDICION", "pPPER_TDEPEXPEDICION", "pPPER_PAISLUGNACIMI", "pPPER_TPAISLUGNACIMI", "pPPER_DEPLUGNACIMI", "pPPER_TDEPLUGNACIMI", "pPEMP_PAISEXPEDICION", "pPEMP_TPAISEXPEDICION", "pPEMP_DEPEXPEDICION", "pPEMP_TDEPEXPEDICION", "pPEMP_PAISLUGNACIMI", "pPEMP_TPAISLUGNACIMI", "pPEMP_DEPLUGNACIMI", "pPEMP_TDEPLUGNACIMI", "pPEMP_LUGNACIMI", "pPEMP_TLUGNACIMI", "pPEMP_FEXPEDICION", "pPEMP_LUGEXPEDICION", "pPEMP_TLUGEXPEDICION", "pPPER_NACION2", "pPPER_PCCIUSOL", "pPPER_PCSUCURSAL", "pPPER_PCTIPSOL", "pPPER_PCSECTOR", "pPPER_PCTIPACT", "pPPER_PCCIUOFC", "pPPER_PCDEPOFC", "pPEMP_TMAILREPL", "pPEMP_TDIRSREPL", "pPEMP_CCIURREPL", "pPEMP_TCIURREPL", "pPEMP_CDEPRREPL", "pPEMP_TDEPRREPL", "pPEMP_CPAIRREPL", "pPEMP_TPAIRREPL", "pPEMP_TTELREPL", "pPEMP_TCELUREPL", "pPCDEPTOENTREV", "pPTDEPTOENTREV", "pPCCIUENTREV", "pPTCIUENTREV", "pPFENTREVISTA", "pPTHORAENTREV", "pPTAGENENTREV", "pPTASESENTREV", "pPTOBSEENTREV", "pPCRESTENTREV", "pPTOBSECONFIR", "pPTHORACONFIR", "pPTEMPLCONFIR", "pPCORIGENFON","pPCCLAUSULA1", "pPCCLAUSULA2", "pPCCONFIR"}, new Object[] {pPSSARLAFT, pPFRADICA, pPSPERSON, pPFDILIGENCIA, pPCAUTTRADAT, pPCRUTFCC, pPCESTCONF, pPFCONFIR, pPCVINCULACION, pPTVINCULACION, pPER_CDEPTOSOL, pPER_TDEPTOSOL, pPER_CCIUSOL, pPER_TCIUSOL, pPCVINTOMASE, pPTVINTOMASE, pPCVINTOMBEN, pPTVINTOMBEM, pPCVINASEBEN, pPTVINASEBEM, pPCACTIPPAL, pPPERSECTORPPAL, pPNCIIUPPAL, pPTCCIIUPPAL, pPPERTIPOACTIVPPAL, pPTOCUPACION, pPTCARGO, pPTEMPRESA, pPTDIREMPRESA, pPPERCDEPTOOFIC, pPPERTDEPTOOFIC, pPPERCCIUOFIC, pPPERTCIUOFIC, pPTTELEMPRESA, pPCACTISEC, pPNCIIUSEC, pPTCCIIUSEC, pPTDIRSEC, pPTTELSEC, pPTPRODSERVCOM, pPIINGRESOS, pPIACTIVOS, pPIPATRIMONIO, pPIEGRESOS, pPIPASIVOS, pPIOTROINGRESO, pPTCONCOTRING, pPCMANRECPUB, pPCPODPUB, pPCRECPUB, pPCVINPERPUB, pPTVINPERPUB, pPCDECTRIBEXT, pPTDECTRIBEXT, pPTORIGFOND, pPCTRAXMODEXT, pPTTRAXMODEXT, pPCPRODFINEXT, pPCCTAMODEXT, pPTOTRASOPER, pPCRECLINDSEG, pPTCIUDADSUC, pPTPAISUC, pPTDEPATAMENTOSUC, pPTCIUDAD, pPTDEPATAMENTO, pPTPAIS, pPTLUGAREXPEDIDOC, pPRESOCIEDAD, pPTNACIONALI2, pPNGRADOPOD, pPNGOZREC, pPNPARTICIPA, pPNVINCULO, pPNTIPDOC, pPFEXPEDICDOC, pPFNACIMIENTO, pPNRAZONSO, pPTNIT, pPTDV, pPTOFICINAPRI, pPTTELEFONO, pPTFAX, pPTSUCURSAL, pPTTELEFONOSUC, pPTFAXSUC, pPCTIPOEMP, pPTCUALTEMP, pPTSECTOR, pPCCIIU, pPTACTIACA, pPTMAILJURID, pPTREPRESENTANLE, pPTSEGAPE, pPTNOMBRES, pPTNUMDOC, pPTLUGNACI, pPTNACIONALI1, pPTINDIQUEVIN, pPPER_PAPELLIDO, pPPER_SAPELLIDO, pPPER_NOMBRES, pPPER_TIPDOCUMENT, pPPER_DOCUMENT, pPPER_FEXPEDICION, pPPER_LUGEXPEDICION, pPPER_FNACIMI, pPPER_LUGNACIMI, pPPER_NACION1, pPPER_DIRERECI, pPPER_PAIS, pPPER_CIUDAD, pPPER_DEPARTAMENT, pPPER_EMAIL, pPPER_TELEFONO, pPPER_CELULAR, pPNRECPUB, pPTPRESETRECLAMACI, pPPER_TLUGEXPEDICION, pPPER_TLUGNACIMI, pPPER_TNACION1, pPPER_TNACION2, pPPER_TPAIS, pPPER_TDEPARTAMENT, pPPER_TCIUDAD, pPEMPTPAIS, pPEMPTDEPATAMENTO, pPEMPTCIUDAD, pPEMPTPAISUC, pPEMPTDEPATAMENTOSUC, pPEMPTCIUDADSUC, pPEMPTLUGNACI, pPEMPTNACIONALI1, pPEMPTNACIONALI2, pPCSUJETOOBLIFACION, pPTINDIQUEOBLIG, pPPER_PAISEXPEDICION, pPPER_TPAISEXPEDICION, pPPER_DEPEXPEDICION, pPPER_TDEPEXPEDICION, pPPER_PAISLUGNACIMI, pPPER_TPAISLUGNACIMI, pPPER_DEPLUGNACIMI, pPPER_TDEPLUGNACIMI, pPEMP_PAISEXPEDICION, pPEMP_TPAISEXPEDICION, pPEMP_DEPEXPEDICION, pPEMP_TDEPEXPEDICION, pPEMP_PAISLUGNACIMI, pPEMP_TPAISLUGNACIMI, pPEMP_DEPLUGNACIMI, pPEMP_TDEPLUGNACIMI, pPEMP_LUGNACIMI, pPEMP_TLUGNACIMI, pPEMP_FEXPEDICION, pPEMP_LUGEXPEDICION, pPEMP_TLUGEXPEDICION, pPPER_NACION2, pPPER_PCCIUSOL, pPPER_PCSUCURSAL, pPPER_PCTIPSOL, pPPER_PCSECTOR, pPPER_PCTIPACT, pPPER_PCCIUOFC, pPPER_PCDEPOFC, pPEMP_TMAILREPL, pPEMP_TDIRSREPL, pPEMP_CCIURREPL, pPEMP_TCIURREPL, pPEMP_CDEPRREPL, pPEMP_TDEPRREPL, pPEMP_CPAIRREPL, pPEMP_TPAIRREPL, pPEMP_TTELREPL, pPEMP_TCELUREPL, pPCDEPTOENTREV, pPTDEPTOENTREV, pPCCIUENTREV, pPTCIUENTREV, pPFENTREVISTA, pPTHORAENTREV, pPTAGENENTREV, pPTASESENTREV, pPTOBSEENTREV, pPCRESTENTREV, pPTOBSECONFIR, pPTHORACONFIR, pPTEMPLCONFIR, pPCORIGENFON, pPCCLAUSULA1, pPCCLAUSULA2, pPCCONFIR}); //IAXIS-3287 01/04/2019
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPFRADICA);
        cStmt.setObject(4, pPSPERSON);
        cStmt.setObject(5, pPFDILIGENCIA);
        cStmt.setObject(6, pPCAUTTRADAT);
        cStmt.setObject(7, pPCRUTFCC);
        cStmt.setObject(8, pPCESTCONF);
        cStmt.setObject(9, pPFCONFIR);
        cStmt.setObject(10, pPCVINCULACION);
        cStmt.setObject(11, pPTVINCULACION);
        cStmt.setObject(12, pPER_CDEPTOSOL);
        cStmt.setObject(13, pPER_TDEPTOSOL);
        cStmt.setObject(14, pPER_CCIUSOL);
        cStmt.setObject(15, pPER_TCIUSOL);
        cStmt.setObject(16, pPCVINTOMASE);
        cStmt.setObject(17, pPTVINTOMASE);
        cStmt.setObject(18, pPCVINTOMBEN);
        cStmt.setObject(19, pPTVINTOMBEM);
        cStmt.setObject(20, pPCVINASEBEN);
        cStmt.setObject(21, pPTVINASEBEM);
        cStmt.setObject(22, pPCACTIPPAL);
        cStmt.setObject(23, pPPERSECTORPPAL);
        cStmt.setObject(24, pPNCIIUPPAL);
        cStmt.setObject(25, pPTCCIIUPPAL);
        cStmt.setObject(26, pPPERTIPOACTIVPPAL);
        cStmt.setObject(27, pPTOCUPACION);
        cStmt.setObject(28, pPTCARGO);
        cStmt.setObject(29, pPTEMPRESA);
        cStmt.setObject(30, pPTDIREMPRESA);
        cStmt.setObject(31, pPPERCDEPTOOFIC);
        cStmt.setObject(32, pPPERTDEPTOOFIC);
        cStmt.setObject(33, pPPERCCIUOFIC);
        cStmt.setObject(34, pPPERTCIUOFIC);
        cStmt.setObject(35, pPTTELEMPRESA);
        cStmt.setObject(36, pPCACTISEC);
        cStmt.setObject(37, pPNCIIUSEC);
        cStmt.setObject(38, pPTCCIIUSEC);
        cStmt.setObject(39, pPTDIRSEC);
        cStmt.setObject(40, pPTTELSEC);
        cStmt.setObject(41, pPTPRODSERVCOM);
        cStmt.setObject(42, pPIINGRESOS);
        cStmt.setObject(43, pPIACTIVOS);
        cStmt.setObject(44, pPIPATRIMONIO);
        cStmt.setObject(45, pPIEGRESOS);
        cStmt.setObject(46, pPIPASIVOS);
        cStmt.setObject(47, pPIOTROINGRESO);
        cStmt.setObject(48, pPTCONCOTRING);
        cStmt.setObject(49, pPCMANRECPUB);
        cStmt.setObject(50, pPCPODPUB);
        cStmt.setObject(51, pPCRECPUB);
        cStmt.setObject(52, pPCVINPERPUB);
        cStmt.setObject(53, pPTVINPERPUB);
        cStmt.setObject(54, pPCDECTRIBEXT);
        cStmt.setObject(55, pPTDECTRIBEXT);
        cStmt.setObject(56, pPTORIGFOND);
        cStmt.setObject(57, pPCTRAXMODEXT);
        cStmt.setObject(58, pPTTRAXMODEXT);
        cStmt.setObject(59, pPCPRODFINEXT);
        cStmt.setObject(60, pPCCTAMODEXT);
        cStmt.setObject(61, pPTOTRASOPER);
        cStmt.setObject(62, pPCRECLINDSEG);
        cStmt.setObject(63, pPTCIUDADSUC);
        cStmt.setObject(64, pPTPAISUC);
        cStmt.setObject(65, pPTDEPATAMENTOSUC);
        cStmt.setObject(66, pPTCIUDAD);
        cStmt.setObject(67, pPTDEPATAMENTO);
        cStmt.setObject(68, pPTPAIS);
        cStmt.setObject(69, pPTLUGAREXPEDIDOC);
        cStmt.setObject(70, pPRESOCIEDAD);
        cStmt.setObject(71, pPTNACIONALI2);
        cStmt.setObject(72, pPNGRADOPOD);
        cStmt.setObject(73, pPNGOZREC);
        cStmt.setObject(74, pPNPARTICIPA);
        cStmt.setObject(75, pPNVINCULO);
        cStmt.setObject(76, pPNTIPDOC);
        cStmt.setObject(77, pPFEXPEDICDOC);
        cStmt.setObject(78, pPFNACIMIENTO);
        cStmt.setObject(79, pPNRAZONSO);
        cStmt.setObject(80, pPTNIT);
        cStmt.setObject(81, pPTDV);
        cStmt.setObject(82, pPTOFICINAPRI);
        cStmt.setObject(83, pPTTELEFONO);
        cStmt.setObject(84, pPTFAX);
        cStmt.setObject(85, pPTSUCURSAL);
        cStmt.setObject(86, pPTTELEFONOSUC);
        cStmt.setObject(87, pPTFAXSUC);
        cStmt.setObject(88, pPCTIPOEMP);
        cStmt.setObject(89, pPTCUALTEMP);
        cStmt.setObject(90, pPTSECTOR);
        cStmt.setObject(91, pPCCIIU);
        cStmt.setObject(92, pPTACTIACA);
        cStmt.setObject(93, pPTMAILJURID);
        cStmt.setObject(94, pPTREPRESENTANLE);
        cStmt.setObject(95, pPTSEGAPE);
        cStmt.setObject(96, pPTNOMBRES);
        cStmt.setObject(97, pPTNUMDOC);
        cStmt.setObject(98, pPTLUGNACI);
        cStmt.setObject(99, pPTNACIONALI1);
        cStmt.setObject(100, pPTINDIQUEVIN);
        cStmt.setObject(101, pPPER_PAPELLIDO);
        cStmt.setObject(102, pPPER_SAPELLIDO);
        cStmt.setObject(103, pPPER_NOMBRES);
        cStmt.setObject(104, pPPER_TIPDOCUMENT);
        cStmt.setObject(105, pPPER_DOCUMENT);
        cStmt.setObject(106, pPPER_FEXPEDICION);
        cStmt.setObject(107, pPPER_LUGEXPEDICION);
        cStmt.setObject(108, pPPER_FNACIMI);
        cStmt.setObject(109, pPPER_LUGNACIMI);
        cStmt.setObject(110, pPPER_NACION1);
        cStmt.setObject(111, pPPER_DIRERECI);
        cStmt.setObject(112, pPPER_PAIS);
        cStmt.setObject(113, pPPER_CIUDAD);
        cStmt.setObject(114, pPPER_DEPARTAMENT);
        cStmt.setObject(115, pPPER_EMAIL);
        cStmt.setObject(116, pPPER_TELEFONO);
        cStmt.setObject(117, pPPER_CELULAR);
        cStmt.setObject(118, pPNRECPUB);
        cStmt.setObject(119, pPTPRESETRECLAMACI);
        cStmt.setObject(120, pPPER_TLUGEXPEDICION);
        cStmt.setObject(121, pPPER_TLUGNACIMI);
        cStmt.setObject(122, pPPER_TNACION1);
        cStmt.setObject(123, pPPER_TNACION2);
        cStmt.setObject(124, pPPER_TPAIS);
        cStmt.setObject(125, pPPER_TDEPARTAMENT);
        cStmt.setObject(126, pPPER_TCIUDAD);
        cStmt.setObject(127, pPEMPTPAIS);
        cStmt.setObject(128, pPEMPTDEPATAMENTO);
        cStmt.setObject(129, pPEMPTCIUDAD);
        cStmt.setObject(130, pPEMPTPAISUC);
        cStmt.setObject(131, pPEMPTDEPATAMENTOSUC);
        cStmt.setObject(132, pPEMPTCIUDADSUC);
        cStmt.setObject(133, pPEMPTLUGNACI);
        cStmt.setObject(134, pPEMPTNACIONALI1);
        cStmt.setObject(135, pPEMPTNACIONALI2);
        cStmt.setObject(136, pPCSUJETOOBLIFACION);
        cStmt.setObject(137, pPTINDIQUEOBLIG);
        cStmt.setObject(138, pPPER_PAISEXPEDICION);
        cStmt.setObject(139, pPPER_TPAISEXPEDICION);
        cStmt.setObject(140, pPPER_DEPEXPEDICION);
        cStmt.setObject(141, pPPER_TDEPEXPEDICION);
        cStmt.setObject(142, pPPER_PAISLUGNACIMI);
        cStmt.setObject(143, pPPER_TPAISLUGNACIMI);
        cStmt.setObject(144, pPPER_DEPLUGNACIMI);
        cStmt.setObject(145, pPPER_TDEPLUGNACIMI);
        cStmt.setObject(146, pPEMP_PAISEXPEDICION);
        cStmt.setObject(147, pPEMP_TPAISEXPEDICION);
        cStmt.setObject(148, pPEMP_DEPEXPEDICION);
        cStmt.setObject(149, pPEMP_TDEPEXPEDICION);
        cStmt.setObject(150, pPEMP_PAISLUGNACIMI);
        cStmt.setObject(151, pPEMP_TPAISLUGNACIMI);
        cStmt.setObject(152, pPEMP_DEPLUGNACIMI);
        cStmt.setObject(153, pPEMP_TDEPLUGNACIMI);
        cStmt.setObject(154, pPEMP_LUGNACIMI);
        cStmt.setObject(155, pPEMP_TLUGNACIMI);
        cStmt.setObject(156, pPEMP_FEXPEDICION);
        cStmt.setObject(157, pPEMP_LUGEXPEDICION);
        cStmt.setObject(158, pPEMP_TLUGEXPEDICION);
        cStmt.setObject(159, pPPER_NACION2);
        cStmt.setObject(160, pPPER_PCCIUSOL);
        cStmt.setObject(161, pPPER_PCSUCURSAL);
        cStmt.setObject(162, pPPER_PCTIPSOL);
        cStmt.setObject(163, pPPER_PCSECTOR);
        cStmt.setObject(164, pPPER_PCTIPACT);
        cStmt.setObject(165, pPPER_PCCIUOFC);
        cStmt.setObject(166, pPPER_PCDEPOFC);
        cStmt.setObject(167, pPEMP_TMAILREPL);
        cStmt.setObject(168, pPEMP_TDIRSREPL);
        cStmt.setObject(169, pPEMP_CCIURREPL);
        cStmt.setObject(170, pPEMP_TCIURREPL);
        cStmt.setObject(171, pPEMP_CDEPRREPL);
        cStmt.setObject(172, pPEMP_TDEPRREPL);
        cStmt.setObject(173, pPEMP_CPAIRREPL);
        cStmt.setObject(174, pPEMP_TPAIRREPL);
        cStmt.setObject(175, pPEMP_TTELREPL);
        cStmt.setObject(176, pPEMP_TCELUREPL);
        cStmt.setObject(177, pPCDEPTOENTREV);
        cStmt.setObject(178, pPTDEPTOENTREV);
        cStmt.setObject(179, pPCCIUENTREV);
        cStmt.setObject(180, pPTCIUENTREV);
        cStmt.setObject(181, pPFENTREVISTA);
        cStmt.setObject(182, pPTHORAENTREV);
        cStmt.setObject(183, pPTAGENENTREV);
        cStmt.setObject(184, pPTASESENTREV);
        cStmt.setObject(185, pPTOBSEENTREV);
        cStmt.setObject(186, pPCRESTENTREV);
        cStmt.setObject(187, pPTOBSECONFIR);
        cStmt.setObject(188, pPTHORACONFIR);
        cStmt.setObject(189, pPTEMPLCONFIR);
        cStmt.setObject(190, pPCORIGENFON);
        cStmt.setObject(191, pPCCLAUSULA1); // TCS-9 AP 12/02/2019
        cStmt.setObject(192, pPCCLAUSULA2); // TCS-9 AP 12/02/2019
        cStmt.setObject(193, pPCCONFIR); //IAXIS-3287 01/04/2019
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(194, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES" //IAXIS-3287 01/04/2019
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(194)); //IAXIS-3287 01/04/2019
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DATSARLATF (java.math.BigDecimal pPSSARLAFT, java.sql.Date pPFRADICA, java.math.BigDecimal pPSPERSON, java.sql.Date pPFDILIGENCIA, java.math.BigDecimal pPCAUTTRADAT, java.math.BigDecimal pPCRUTFCC, java.math.BigDecimal pPCESTCONF, java.sql.Date pPFCONFIR, java.math.BigDecimal pPCVINCULACION, String pPTVINCULACION, java.math.BigDecimal pPER_CDEPTOSOL, String pPER_TDEPTOSOL, java.math.BigDecimal pPER_CCIUSOL, String pPER_TCIUSOL, java.math.BigDecimal pPCVINTOMASE, String pPTVINTOMASE, java.math.BigDecimal pPCVINTOMBEN, String pPTVINTOMBEM, java.math.BigDecimal pPCVINASEBEN, String pPTVINASEBEM, java.math.BigDecimal pPCACTIPPAL, java.math.BigDecimal pPPERSECTORPPAL, java.math.BigDecimal pPNCIIUPPAL, String pPTCCIIUPPAL, String pPPERTIPOACTIVPPAL, String pPTOCUPACION, String pPTCARGO, String pPTEMPRESA, String pPTDIREMPRESA, java.math.BigDecimal pPPERCDEPTOOFIC, String pPPERTDEPTOOFIC, java.math.BigDecimal pPPERCCIUOFIC, String pPPERTCIUOFIC, String pPTTELEMPRESA, java.math.BigDecimal pPCACTISEC, java.math.BigDecimal pPNCIIUSEC, String pPTCCIIUSEC, String pPTDIRSEC, String pPTTELSEC, String pPTPRODSERVCOM, java.math.BigDecimal pPIINGRESOS, java.math.BigDecimal pPIACTIVOS, java.math.BigDecimal pPIPATRIMONIO, java.math.BigDecimal pPIEGRESOS, java.math.BigDecimal pPIPASIVOS, java.math.BigDecimal pPIOTROINGRESO, String pPTCONCOTRING, java.math.BigDecimal pPCMANRECPUB, java.math.BigDecimal pPCPODPUB, java.math.BigDecimal pPCRECPUB, java.math.BigDecimal pPCVINPERPUB, String pPTVINPERPUB, java.math.BigDecimal pPCDECTRIBEXT, String pPTDECTRIBEXT, String pPTORIGFOND, java.math.BigDecimal pPCTRAXMODEXT, String pPTTRAXMODEXT, java.math.BigDecimal pPCPRODFINEXT, java.math.BigDecimal pPCCTAMODEXT, String pPTOTRASOPER, java.math.BigDecimal pPCRECLINDSEG, java.math.BigDecimal pPTCIUDADSUC, java.math.BigDecimal pPTPAISUC, java.math.BigDecimal pPTDEPATAMENTOSUC, java.math.BigDecimal pPTCIUDAD, java.math.BigDecimal pPTDEPATAMENTO, java.math.BigDecimal pPTPAIS, java.math.BigDecimal pPTLUGAREXPEDIDOC, java.math.BigDecimal pPRESOCIEDAD, java.math.BigDecimal pPTNACIONALI2, java.math.BigDecimal pPNGRADOPOD, java.math.BigDecimal pPNGOZREC, java.math.BigDecimal pPNPARTICIPA, java.math.BigDecimal pPNVINCULO, java.math.BigDecimal pPNTIPDOC, java.sql.Date pPFEXPEDICDOC, java.sql.Date pPFNACIMIENTO, String pPNRAZONSO, String pPTNIT, String pPTDV, String pPTOFICINAPRI, String pPTTELEFONO, String pPTFAX, String pPTSUCURSAL, String pPTTELEFONOSUC, String pPTFAXSUC, String pPCTIPOEMP, String pPTCUALTEMP, String pPTSECTOR, java.math.BigDecimal pPCCIIU, String pPTACTIACA, String pPTMAILJURID, String pPTREPRESENTANLE, String pPTSEGAPE, String pPTNOMBRES, String pPTNUMDOC, String pPTLUGNACI, String pPTNACIONALI1, String pPTINDIQUEVIN, String pPPER_PAPELLIDO, String pPPER_SAPELLIDO, String pPPER_NOMBRES, java.math.BigDecimal pPPER_TIPDOCUMENT, String pPPER_DOCUMENT, java.sql.Date pPPER_FEXPEDICION, java.math.BigDecimal pPPER_LUGEXPEDICION, java.sql.Date pPPER_FNACIMI, java.math.BigDecimal pPPER_LUGNACIMI, java.math.BigDecimal pPPER_NACION1, String pPPER_DIRERECI, java.math.BigDecimal pPPER_PAIS, java.math.BigDecimal pPPER_CIUDAD, java.math.BigDecimal pPPER_DEPARTAMENT, String pPPER_EMAIL, String pPPER_TELEFONO, String pPPER_CELULAR, java.math.BigDecimal pPNRECPUB, java.math.BigDecimal pPTPRESETRECLAMACI, String pPPER_TLUGEXPEDICION, String pPPER_TLUGNACIMI, String pPPER_TNACION1, String pPPER_TNACION2, String pPPER_TPAIS, String pPPER_TDEPARTAMENT, String pPPER_TCIUDAD, String pPEMPTPAIS, String pPEMPTDEPATAMENTO, String pPEMPTCIUDAD, String pPEMPTPAISUC, String pPEMPTDEPATAMENTOSUC, String pPEMPTCIUDADSUC, String pPEMPTLUGNACI, String pPEMPTNACIONALI1, String pPEMPTNACIONALI2, java.math.BigDecimal pPCSUJETOOBLIFACION, String pPTINDIQUEOBLIG, java.math.BigDecimal pPPER_PAISEXPEDICION, String pPPER_TPAISEXPEDICION, java.math.BigDecimal pPPER_DEPEXPEDICION, String pPPER_TDEPEXPEDICION, java.math.BigDecimal pPPER_PAISLUGNACIMI, String pPPER_TPAISLUGNACIMI, java.math.BigDecimal pPPER_DEPLUGNACIMI, String pPPER_TDEPLUGNACIMI, java.math.BigDecimal pPEMP_PAISEXPEDICION, String pPEMP_TPAISEXPEDICION, java.math.BigDecimal pPEMP_DEPEXPEDICION, String pPEMP_TDEPEXPEDICION, java.math.BigDecimal pPEMP_PAISLUGNACIMI, String pPEMP_TPAISLUGNACIMI, java.math.BigDecimal pPEMP_DEPLUGNACIMI, String pPEMP_TDEPLUGNACIMI, java.math.BigDecimal pPEMP_LUGNACIMI, String pPEMP_TLUGNACIMI, java.sql.Date pPEMP_FEXPEDICION, java.math.BigDecimal pPEMP_LUGEXPEDICION, String pPEMP_TLUGEXPEDICION, java.math.BigDecimal pPPER_NACION2, java.math.BigDecimal pPPER_PCCIUSOL, String pPPER_PCSUCURSAL, java.math.BigDecimal pPPER_PCTIPSOL, java.math.BigDecimal pPPER_PCSECTOR, String pPPER_PCTIPACT, java.math.BigDecimal pPPER_PCCIUOFC, java.math.BigDecimal pPPER_PCDEPOFC, String pPEMP_TMAILREPL, String pPEMP_TDIRSREPL, java.math.BigDecimal pPEMP_CCIURREPL, String pPEMP_TCIURREPL, java.math.BigDecimal pPEMP_CDEPRREPL, String pPEMP_TDEPRREPL, java.math.BigDecimal pPEMP_CPAIRREPL, String pPEMP_TPAIRREPL, java.math.BigDecimal pPEMP_TTELREPL, java.math.BigDecimal pPEMP_TCELUREPL, java.math.BigDecimal pPCDEPTOENTREV, String pPTDEPTOENTREV, java.math.BigDecimal pPCCIUENTREV, String pPTCIUENTREV, java.sql.Date pPFENTREVISTA, String pPTHORAENTREV, String pPTAGENENTREV, String pPTASESENTREV, String pPTOBSEENTREV, java.math.BigDecimal pPCRESTENTREV, String pPTOBSECONFIR, String pPTHORACONFIR, String pPTEMPLCONFIR, String pPCORIGENFON, java.math.BigDecimal pPCCLAUSULA1, java.math.BigDecimal pPCCLAUSULA2,java.math.BigDecimal pPCCONFIR) throws Exception { //IAXIS-3287 01/04/2019
        return this.callPAC_IAX_PERSONA__F_SET_DATSARLATF(pPSSARLAFT, pPFRADICA, pPSPERSON, pPFDILIGENCIA, pPCAUTTRADAT, pPCRUTFCC, pPCESTCONF, pPFCONFIR, pPCVINCULACION, pPTVINCULACION, pPER_CDEPTOSOL, pPER_TDEPTOSOL, pPER_CCIUSOL, pPER_TCIUSOL, pPCVINTOMASE, pPTVINTOMASE, pPCVINTOMBEN, pPTVINTOMBEM, pPCVINASEBEN, pPTVINASEBEM, pPCACTIPPAL, pPPERSECTORPPAL, pPNCIIUPPAL, pPTCCIIUPPAL, pPPERTIPOACTIVPPAL, pPTOCUPACION, pPTCARGO, pPTEMPRESA, pPTDIREMPRESA, pPPERCDEPTOOFIC, pPPERTDEPTOOFIC, pPPERCCIUOFIC, pPPERTCIUOFIC, pPTTELEMPRESA, pPCACTISEC, pPNCIIUSEC, pPTCCIIUSEC, pPTDIRSEC, pPTTELSEC, pPTPRODSERVCOM, pPIINGRESOS, pPIACTIVOS, pPIPATRIMONIO, pPIEGRESOS, pPIPASIVOS, pPIOTROINGRESO, pPTCONCOTRING, pPCMANRECPUB, pPCPODPUB, pPCRECPUB, pPCVINPERPUB, pPTVINPERPUB, pPCDECTRIBEXT, pPTDECTRIBEXT, pPTORIGFOND, pPCTRAXMODEXT, pPTTRAXMODEXT, pPCPRODFINEXT, pPCCTAMODEXT, pPTOTRASOPER, pPCRECLINDSEG, pPTCIUDADSUC, pPTPAISUC, pPTDEPATAMENTOSUC, pPTCIUDAD, pPTDEPATAMENTO, pPTPAIS, pPTLUGAREXPEDIDOC, pPRESOCIEDAD, pPTNACIONALI2, pPNGRADOPOD, pPNGOZREC, pPNPARTICIPA, pPNVINCULO, pPNTIPDOC, pPFEXPEDICDOC, pPFNACIMIENTO, pPNRAZONSO, pPTNIT, pPTDV, pPTOFICINAPRI, pPTTELEFONO, pPTFAX, pPTSUCURSAL, pPTTELEFONOSUC, pPTFAXSUC, pPCTIPOEMP, pPTCUALTEMP, pPTSECTOR, pPCCIIU, pPTACTIACA, pPTMAILJURID, pPTREPRESENTANLE, pPTSEGAPE, pPTNOMBRES, pPTNUMDOC, pPTLUGNACI, pPTNACIONALI1, pPTINDIQUEVIN, pPPER_PAPELLIDO, pPPER_SAPELLIDO, pPPER_NOMBRES, pPPER_TIPDOCUMENT, pPPER_DOCUMENT, pPPER_FEXPEDICION, pPPER_LUGEXPEDICION, pPPER_FNACIMI, pPPER_LUGNACIMI, pPPER_NACION1, pPPER_DIRERECI, pPPER_PAIS, pPPER_CIUDAD, pPPER_DEPARTAMENT, pPPER_EMAIL, pPPER_TELEFONO, pPPER_CELULAR, pPNRECPUB, pPTPRESETRECLAMACI, pPPER_TLUGEXPEDICION, pPPER_TLUGNACIMI, pPPER_TNACION1, pPPER_TNACION2, pPPER_TPAIS, pPPER_TDEPARTAMENT, pPPER_TCIUDAD, pPEMPTPAIS, pPEMPTDEPATAMENTO, pPEMPTCIUDAD, pPEMPTPAISUC, pPEMPTDEPATAMENTOSUC, pPEMPTCIUDADSUC, pPEMPTLUGNACI, pPEMPTNACIONALI1, pPEMPTNACIONALI2, pPCSUJETOOBLIFACION, pPTINDIQUEOBLIG, pPPER_PAISEXPEDICION, pPPER_TPAISEXPEDICION, pPPER_DEPEXPEDICION, pPPER_TDEPEXPEDICION, pPPER_PAISLUGNACIMI, pPPER_TPAISLUGNACIMI, pPPER_DEPLUGNACIMI, pPPER_TDEPLUGNACIMI, pPEMP_PAISEXPEDICION, pPEMP_TPAISEXPEDICION, pPEMP_DEPEXPEDICION, pPEMP_TDEPEXPEDICION, pPEMP_PAISLUGNACIMI, pPEMP_TPAISLUGNACIMI, pPEMP_DEPLUGNACIMI, pPEMP_TDEPLUGNACIMI, pPEMP_LUGNACIMI, pPEMP_TLUGNACIMI, pPEMP_FEXPEDICION, pPEMP_LUGEXPEDICION, pPEMP_TLUGEXPEDICION, pPPER_NACION2, pPPER_PCCIUSOL, pPPER_PCSUCURSAL, pPPER_PCTIPSOL, pPPER_PCSECTOR, pPPER_PCTIPACT, pPPER_PCCIUOFC, pPPER_PCDEPOFC, pPEMP_TMAILREPL, pPEMP_TDIRSREPL, pPEMP_CCIURREPL, pPEMP_TCIURREPL, pPEMP_CDEPRREPL, pPEMP_TDEPRREPL, pPEMP_CPAIRREPL, pPEMP_TPAIRREPL, pPEMP_TTELREPL, pPEMP_TCELUREPL, pPCDEPTOENTREV, pPTDEPTOENTREV, pPCCIUENTREV, pPTCIUENTREV, pPFENTREVISTA, pPTHORAENTREV, pPTAGENENTREV, pPTASESENTREV, pPTOBSEENTREV, pPCRESTENTREV, pPTOBSECONFIR, pPTHORACONFIR, pPTEMPLCONFIR, pPCORIGENFON, pPCCLAUSULA1, pPCCLAUSULA2,pPCCONFIR);//AXIS-WLS1SERVER-Ready //IAXIS-3287 01/04/2019
    }
    //--END-PAC_IAX_PERSONA.F_SET_DATSARLATF

    
    private HashMap callPAC_IAX_PERSONA__F_GET_DATSARLATF(java.math.BigDecimal pPSSARLAFT, java.util.Date pPFRADICA,
            java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_GET_DATSARLATF(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPSSARLAFT", "pPFRADICA", "pPSPERSON" },
                new Object[] { pPSSARLAFT, pPFRADICA, pPSPERSON });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPFRADICA);
        cStmt.setObject(4, pPSPERSON);

        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
                                                                        // de
                                                                        // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DATSARLATF(java.math.BigDecimal pPSSARLAFT, java.util.Date pPFRADICA,
            java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_DATSARLATF(pPSSARLAFT, pPFRADICA, pPSPERSON);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_DEL_DATSARLATF(java.math.BigDecimal pPSSARLAFT, java.util.Date pPFRADICA,
            java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_DEL_DATSARLATF(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPSSARLAFT", "pPFRADICA", "pPSPERSON" },
                new Object[] { pPSSARLAFT, pPFRADICA, pPSPERSON });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPFRADICA);
        cStmt.setObject(4, pPSPERSON);

        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
                                                                // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_DATSARLATF(java.math.BigDecimal pPSSARLAFT, java.util.Date pPFRADICA,
            java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_DATSARLATF(pPSSARLAFT, pPFRADICA, pPSPERSON);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_SET_DETSARLATF_DEC(java.math.BigDecimal pPNDECLARA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPCTIPOID,
            String pPCNUMEROID, String pPTNOMBRE, java.math.BigDecimal pPCMANEJAREC, java.math.BigDecimal pPCEJERCEPOD,
            java.math.BigDecimal pPCGOZAREC, java.math.BigDecimal pPCDECLARACI, String pPCDECLARACICUAL)
            throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_SET_DETSARLATF_DEC(?,?,?,?,?,?,?,?,?,?,?,?)}";

        logCall(callQuery,
                new String[] { "pPNDECLARA", "pPSPERSON", "pPSSARLAFT", "pPCTIPOID", "pPCNUMEROID", "pPTNOMBRE",
                        "pPCMANEJAREC", "pPCEJERCEPOD", "pPCGOZAREC", "pPCDECLARACI", "pPCDECLARACICUAL" },
                new Object[] { pPNDECLARA, pPSPERSON, pPSSARLAFT, pPCTIPOID, pPCNUMEROID, pPTNOMBRE, pPCMANEJAREC,
                        pPCEJERCEPOD, pPCGOZAREC, pPCDECLARACI, pPCDECLARACICUAL });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNDECLARA);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);
        cStmt.setObject(5, pPCTIPOID);
        cStmt.setObject(6, pPCNUMEROID);
        cStmt.setObject(7, pPTNOMBRE);
        cStmt.setObject(8, pPCMANEJAREC);
        cStmt.setObject(9, pPCEJERCEPOD);
        cStmt.setObject(10, pPCGOZAREC);
        cStmt.setObject(11, pPCDECLARACI);
        cStmt.setObject(12, pPCDECLARACICUAL);

        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
                                                                // "RETURN"
        cStmt.registerOutParameter(13, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(13));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DETSARLATF_DEC(java.math.BigDecimal pPNDECLARA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPCTIPOID,
            String pPCNUMEROID, String pPTNOMBRE, java.math.BigDecimal pPCMANEJAREC, java.math.BigDecimal pPCEJERCEPOD,
            java.math.BigDecimal pPCGOZAREC, java.math.BigDecimal pPCDECLARACI, String pPCDECLARACICUAL)
            throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_DETSARLATF_DEC(pPNDECLARA, pPSPERSON, pPSSARLAFT, pPCTIPOID, pPCNUMEROID,
                pPTNOMBRE, pPCMANEJAREC, pPCEJERCEPOD, pPCGOZAREC, pPCDECLARACI, pPCDECLARACICUAL);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_GET_DETSARLATF_DEC(java.math.BigDecimal pPNDECLARA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_GET_DETSARLATF_DEC(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPNDECLARA", "pPSPERSON", "pPSSARLAFT" },
                new Object[] { pPNDECLARA, pPSPERSON, pPSSARLAFT });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNDECLARA);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);

        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
                                                                        // de
                                                                        // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DETSARLATF_DEC(java.math.BigDecimal pPNDECLARA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_DETSARLATF_DEC(pPNDECLARA, pPSPERSON, pPSSARLAFT);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_DEL_DETSARLATF_DEC(java.math.BigDecimal pPNDECLARA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_DEL_DETSARLATF_DEC(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPNDECLARA", "pPSPERSON", "pPSSARLAFT" },
                new Object[] { pPNDECLARA, pPSPERSON, pPSSARLAFT });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNDECLARA);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);

        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
                                                                // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_DEC(java.math.BigDecimal pPNDECLARA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_DETSARLATF_DEC(pPNDECLARA, pPSPERSON, pPSSARLAFT);// AXIS-WLS1SERVER-Ready
    }

    //--START-PAC_IAX_PERSONA.F_SET_DETSARLATF_ACT(PNACTIVI,  PSPERSON,  PSSARLAFT,  PCTIPOPROD,  PCIDNUMPROD,  PTENTIDAD,  PCMONTO,  PCCIUDAD,  PCPAIS,  PCMONEDA,  PSCPAIS,  PSTDEPB,  PTDEPB,  PSCCIUDAD)
    private HashMap callPAC_IAX_PERSONA__F_SET_DETSARLATF_ACT (java.math.BigDecimal pPNACTIVI, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT, String pPCTIPOPROD, String pPCIDNUMPROD, String pPTENTIDAD, String pPCMONTO, java.math.BigDecimal pPCCIUDAD, java.math.BigDecimal pPCPAIS, String pPCMONEDA, String pPSCPAIS, String pPSTDEPB, java.math.BigDecimal pPTDEPB, String pPSCCIUDAD) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_DETSARLATF_ACT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPNACTIVI", "pPSPERSON", "pPSSARLAFT", "pPCTIPOPROD", "pPCIDNUMPROD", "pPTENTIDAD", "pPCMONTO", "pPCCIUDAD", "pPCPAIS", "pPCMONEDA", "pPSCPAIS", "pPSTDEPB", "pPTDEPB", "pPSCCIUDAD"}, new Object[] {pPNACTIVI, pPSPERSON, pPSSARLAFT, pPCTIPOPROD, pPCIDNUMPROD, pPTENTIDAD, pPCMONTO, pPCCIUDAD, pPCPAIS, pPCMONEDA, pPSCPAIS, pPSTDEPB, pPTDEPB, pPSCCIUDAD});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNACTIVI);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);
        cStmt.setObject(5, pPCTIPOPROD);
        cStmt.setObject(6, pPCIDNUMPROD);
        cStmt.setObject(7, pPTENTIDAD);
        cStmt.setObject(8, pPCMONTO);
        cStmt.setObject(9, pPCCIUDAD);
        cStmt.setObject(10, pPCPAIS);
        cStmt.setObject(11, pPCMONEDA);
        cStmt.setObject(12, pPSCPAIS);
        cStmt.setObject(13, pPSTDEPB);
        cStmt.setObject(14, pPTDEPB);
        cStmt.setObject(15, pPSCCIUDAD);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(16, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("MENSAJES", cStmt.getObject(16));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DETSARLATF_ACT (java.math.BigDecimal pPNACTIVI, java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT, String pPCTIPOPROD, String pPCIDNUMPROD, String pPTENTIDAD, String pPCMONTO, java.math.BigDecimal pPCCIUDAD, java.math.BigDecimal pPCPAIS, String pPCMONEDA, String pPSCPAIS, String pPSTDEPB, java.math.BigDecimal pPTDEPB, String pPSCCIUDAD) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_DETSARLATF_ACT(pPNACTIVI, pPSPERSON, pPSSARLAFT, pPCTIPOPROD, pPCIDNUMPROD, pPTENTIDAD, pPCMONTO, pPCCIUDAD, pPCPAIS, pPCMONEDA, pPSCPAIS, pPSTDEPB, pPTDEPB, pPSCCIUDAD);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_SET_DETSARLATF_ACT

    private HashMap callPAC_IAX_PERSONA__F_GET_DETSARLATF_ACT(java.math.BigDecimal pPNACTIVI,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_GET_DETSARLATF_ACT(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPNACTIVI", "pPSPERSON", "pPSSARLAFT" },
                new Object[] { pPNACTIVI, pPSPERSON, pPSSARLAFT });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNACTIVI);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);

        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
                                                                        // de
                                                                        // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DETSARLATF_ACT(java.math.BigDecimal pPNACTIVI,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_DETSARLATF_ACT(pPNACTIVI, pPSPERSON, pPSSARLAFT);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_DEL_DETSARLATF_ACT(java.math.BigDecimal pPNACTIVI,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_DEL_DETSARLATF_ACT(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPNACTIVI", "pPSPERSON", "pPSSARLAFT" },
                new Object[] { pPNACTIVI, pPSPERSON, pPSSARLAFT });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNACTIVI);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);

        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
                                                                // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_ACT(java.math.BigDecimal pPNACTIVI,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_DETSARLATF_ACT(pPNACTIVI, pPSPERSON, pPSSARLAFT);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_SET_DETSARLAFT_REC(java.math.BigDecimal pPNRECLA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPCANIO,
            String pPCRAMO, String pPTCOMPANIA, String pPCVALOR, String pPTRESULTADO) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_SET_DETSARLAFT_REC(?,?,?,?,?,?,?,?,?)}";

        logCall(callQuery,
                new String[] { "pPNRECLA", "pPSPERSON", "pPSSARLAFT", "pPCANIO", "pPCRAMO", "pPTCOMPANIA", "pPCVALOR",
                        "pPTRESULTADO" },
                new Object[] { pPNRECLA, pPSPERSON, pPSSARLAFT, pPCANIO, pPCRAMO, pPTCOMPANIA, pPCVALOR,
                        pPTRESULTADO });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNRECLA);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);
        cStmt.setObject(5, pPCANIO);
        cStmt.setObject(6, pPCRAMO);
        cStmt.setObject(7, pPTCOMPANIA);
        cStmt.setObject(8, pPCVALOR);
        cStmt.setObject(9, pPTRESULTADO);

        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
                                                                // "RETURN"
        cStmt.registerOutParameter(10, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(10));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DETSARLAFT_REC(java.math.BigDecimal pPNRECLA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPCANIO,
            String pPCRAMO, String pPTCOMPANIA, String pPCVALOR, String pPTRESULTADO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_DETSARLAFT_REC(pPNRECLA, pPSPERSON, pPSSARLAFT, pPCANIO, pPCRAMO,
                pPTCOMPANIA, pPCVALOR, pPTRESULTADO);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_GET_DETSARLAFT_REC(java.math.BigDecimal pPNRECLA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_GET_DETSARLAFT_REC(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPNRECLA", "pPSPERSON", "pPSSARLAFT" },
                new Object[] { pPNRECLA, pPSPERSON, pPSSARLAFT });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNRECLA);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);

        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
                                                                        // de
                                                                        // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_DETSARLAFT_REC(java.math.BigDecimal pPNRECLA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_DETSARLAFT_REC(pPNRECLA, pPSPERSON, pPSSARLAFT);// AXIS-WLS1SERVER-Ready
    }

    private HashMap callPAC_IAX_PERSONA__F_DEL_DETSARLAFT_REC(java.math.BigDecimal pPNRECLA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_DEL_DETSARLAFT_REC(?,?,?,?)}";

        logCall(callQuery, new String[] { "pPNRECLA", "pPSPERSON", "pPSSARLAFT" },
                new Object[] { pPNRECLA, pPSPERSON, pPSSARLAFT });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPNRECLA);
        cStmt.setObject(3, pPSPERSON);
        cStmt.setObject(4, pPSSARLAFT);

        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de
                                                                // "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLAFT_REC(java.math.BigDecimal pPNRECLA,
            java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_DETSARLAFT_REC(pPNRECLA, pPSPERSON, pPSSARLAFT);// AXIS-WLS1SERVER-Ready
    }
        
    //--START-PAC_IAX_PERSONA.F_SET_PERSONA_CIFIN(NNUMIDE,  MENSAJES)
    private HashMap callPAC_IAX_PERSONA__F_SET_PERSONA_CIFIN (String pNNUMIDE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_PERSONA_CIFIN(?, ?)}";
        
        logCall(callQuery, new String[] {"pNNUMIDE"}, new Object[] {pNNUMIDE});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pNNUMIDE);       
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_PERSONA_CIFIN (String pNNUMIDE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_PERSONA_CIFIN(pNNUMIDE);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_SET_PERSONA_CIFIN
    
    //--START-PAC_IAX_PERSONA.F_DEL_ACCIONISTA_SARLATF(PSSARLAFT,  PIDENTIFICACION)
    private HashMap callPAC_IAX_PERSONA__F_DEL_ACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_ACCIONISTA_SARLATF(?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT", "pPIDENTIFICACION"}, new Object[] {pPSSARLAFT, pPIDENTIFICACION});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPIDENTIFICACION);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_ACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_ACCIONISTA_SARLATF(pPSSARLAFT, pPIDENTIFICACION);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_ACCIONISTA_SARLATF

    //--START-PAC_IAX_PERSONA.F_DEL_CACCIONISTA_SARLATF(PSSARLAFT,  PIDENTIFICACION)
    private HashMap callPAC_IAX_PERSONA__F_DEL_CACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_CACCIONISTA_SARLATF(?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT", "pPIDENTIFICACION"}, new Object[] {pPSSARLAFT, pPIDENTIFICACION});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPIDENTIFICACION);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_CACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_CACCIONISTA_SARLATF(pPSSARLAFT, pPIDENTIFICACION);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_CACCIONISTA_SARLATF

    //--START-PAC_IAX_PERSONA.F_DEL_CPEP_SARLATF(PSSARLAFT,  PIDENTIFICACION)
    private HashMap callPAC_IAX_PERSONA__F_DEL_CPEP_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_CPEP_SARLATF(?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT", "pPIDENTIFICACION"}, new Object[] {pPSSARLAFT, pPIDENTIFICACION});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPIDENTIFICACION);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_CPEP_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DEL_CPEP_SARLATF(pPSSARLAFT, pPIDENTIFICACION);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_DEL_CPEP_SARLATF
    
    //--START-PAC_IAX_PERSONA.F_GET_ACCIONISTA_SARLATF(PSSARLAFT)
    private HashMap callPAC_IAX_PERSONA__F_GET_ACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ACCIONISTA_SARLATF(?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT"}, new Object[] {pPSSARLAFT});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ACCIONISTA_SARLATF(pPSSARLAFT);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ACCIONISTA_SARLATF
    //--START-PAC_IAX_PERSONA.F_GET_CACCIONISTA_SARLATF(PSSARLAFT)
    private HashMap callPAC_IAX_PERSONA__F_GET_CACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CACCIONISTA_SARLATF(?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT"}, new Object[] {pPSSARLAFT});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CACCIONISTA_SARLATF(pPSSARLAFT);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CACCIONISTA_SARLATF
    //--START-PAC_IAX_PERSONA.F_GET_CPEP_SARLATF(PSSARLAFT)
    private HashMap callPAC_IAX_PERSONA__F_GET_CPEP_SARLATF (java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CPEP_SARLATF(?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT"}, new Object[] {pPSSARLAFT});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CPEP_SARLATF (java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CPEP_SARLATF(pPSSARLAFT);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_CPEP_SARLATF
    
    //--START-PAC_IAX_PERSONA.F_SET_ACCIONISTA_SARLATF(PSSARLAFT,  PIDENTIFICACION,  PPPARTICI,  PTNOMBRE,  PCTIPIDEN,  PNNUMIDE,  PTSOCIEDAD,  PNNUMIDESOC)
    private HashMap callPAC_IAX_PERSONA__F_SET_ACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION, java.math.BigDecimal pPPPARTICI, String pPTNOMBRE, java.math.BigDecimal pPCTIPIDEN, String pPNNUMIDE, String pPTSOCIEDAD, String pPNNUMIDESOC) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ACCIONISTA_SARLATF(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT", "pPIDENTIFICACION", "pPPPARTICI", "pPTNOMBRE", "pPCTIPIDEN", "pPNNUMIDE", "pPTSOCIEDAD", "pPNNUMIDESOC"}, new Object[] {pPSSARLAFT, pPIDENTIFICACION, pPPPARTICI, pPTNOMBRE, pPCTIPIDEN, pPNNUMIDE, pPTSOCIEDAD, pPNNUMIDESOC});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPIDENTIFICACION);
        cStmt.setObject(4, pPPPARTICI);
        cStmt.setObject(5, pPTNOMBRE);
        cStmt.setObject(6, pPCTIPIDEN);
        cStmt.setObject(7, pPNNUMIDE);
        cStmt.setObject(8, pPTSOCIEDAD);
        cStmt.setObject(9, pPNNUMIDESOC);
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
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION, java.math.BigDecimal pPPPARTICI, String pPTNOMBRE, java.math.BigDecimal pPCTIPIDEN, String pPNNUMIDE, String pPTSOCIEDAD, String pPNNUMIDESOC) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_ACCIONISTA_SARLATF(pPSSARLAFT, pPIDENTIFICACION, pPPPARTICI, pPTNOMBRE, pPCTIPIDEN, pPNNUMIDE, pPTSOCIEDAD, pPNNUMIDESOC);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_SET_ACCIONISTA_SARLATF

    //--START-PAC_IAX_PERSONA.F_SET_CACCIONISTA_SARLATF(PSSARLAFT,  PIDENTIFICACION,  PPPARTICI,  PTNOMBRE,  PCTIPIDEN,  PNNUMIDE,  PCBOLSA,  PCPEP,  PCTRIBUEXT)
    private HashMap callPAC_IAX_PERSONA__F_SET_CACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION, java.math.BigDecimal pPPPARTICI, String pPTNOMBRE, java.math.BigDecimal pPCTIPIDEN, String pPNNUMIDE, java.math.BigDecimal pPCBOLSA, java.math.BigDecimal pPCPEP, java.math.BigDecimal pPCTRIBUEXT) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CACCIONISTA_SARLATF(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT", "pPIDENTIFICACION", "pPPPARTICI", "pPTNOMBRE", "pPCTIPIDEN", "pPNNUMIDE", "pPCBOLSA", "pPCPEP", "pPCTRIBUEXT"}, new Object[] {pPSSARLAFT, pPIDENTIFICACION, pPPPARTICI, pPTNOMBRE, pPCTIPIDEN, pPNNUMIDE, pPCBOLSA, pPCPEP, pPCTRIBUEXT});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPIDENTIFICACION);
        cStmt.setObject(4, pPPPARTICI);
        cStmt.setObject(5, pPTNOMBRE);
        cStmt.setObject(6, pPCTIPIDEN);
        cStmt.setObject(7, pPNNUMIDE);
        cStmt.setObject(8, pPCBOLSA);
        cStmt.setObject(9, pPCPEP);
        cStmt.setObject(10, pPCTRIBUEXT);
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
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CACCIONISTA_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION, java.math.BigDecimal pPPPARTICI, String pPTNOMBRE, java.math.BigDecimal pPCTIPIDEN, String pPNNUMIDE, java.math.BigDecimal pPCBOLSA, java.math.BigDecimal pPCPEP, java.math.BigDecimal pPCTRIBUEXT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_CACCIONISTA_SARLATF(pPSSARLAFT, pPIDENTIFICACION, pPPPARTICI, pPTNOMBRE, pPCTIPIDEN, pPNNUMIDE, pPCBOLSA, pPCPEP, pPCTRIBUEXT);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_SET_CACCIONISTA_SARLATF

    //--START-PAC_IAX_PERSONA.F_SET_CPEP_SARLATF(PSSARLAFT,  PIDENTIFICACION,  PCTIPREL,  PTNOMBRE,  PCTIPIDEN,  PNNUMIDE,  PCPAIS,  PTPAIS,  PTENTIDAD,  PTCARGO,  PFDESVIN)
    private HashMap callPAC_IAX_PERSONA__F_SET_CPEP_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION, java.math.BigDecimal pPCTIPREL, String pPTNOMBRE, java.math.BigDecimal pPCTIPIDEN, String pPNNUMIDE, java.math.BigDecimal pPCPAIS, String pPTPAIS, String pPTENTIDAD, String pPTCARGO, java.sql.Date pPFDESVIN) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_CPEP_SARLATF(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSSARLAFT", "pPIDENTIFICACION", "pPCTIPREL", "pPTNOMBRE", "pPCTIPIDEN", "pPNNUMIDE", "pPCPAIS", "pPTPAIS", "pPTENTIDAD", "pPTCARGO", "pPFDESVIN"}, new Object[] {pPSSARLAFT, pPIDENTIFICACION, pPCTIPREL, pPTNOMBRE, pPCTIPIDEN, pPNNUMIDE, pPCPAIS, pPTPAIS, pPTENTIDAD, pPTCARGO, pPFDESVIN});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        cStmt.setObject(3, pPIDENTIFICACION);
        cStmt.setObject(4, pPCTIPREL);
        cStmt.setObject(5, pPTNOMBRE);
        cStmt.setObject(6, pPCTIPIDEN);
        cStmt.setObject(7, pPNNUMIDE);
        cStmt.setObject(8, pPCPAIS);
        cStmt.setObject(9, pPTPAIS);
        cStmt.setObject(10, pPTENTIDAD);
        cStmt.setObject(11, pPTCARGO);
        cStmt.setObject(12, pPFDESVIN);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_CPEP_SARLATF (java.math.BigDecimal pPSSARLAFT, java.math.BigDecimal pPIDENTIFICACION, java.math.BigDecimal pPCTIPREL, String pPTNOMBRE, java.math.BigDecimal pPCTIPIDEN, String pPNNUMIDE, java.math.BigDecimal pPCPAIS, String pPTPAIS, String pPTENTIDAD, String pPTCARGO, java.sql.Date pPFDESVIN) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_CPEP_SARLATF(pPSSARLAFT, pPIDENTIFICACION, pPCTIPREL, pPTNOMBRE, pPCTIPIDEN, pPNNUMIDE, pPCPAIS, pPTPAIS, pPTENTIDAD, pPTCARGO, pPFDESVIN);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_SET_CPEP_SARLATF

    //--START-PAC_IAX_PERSONA.F_GET_ULTIMOSESTADOS_SARLATF(PSPERSON)
    private HashMap callPAC_IAX_PERSONA__F_GET_ULTIMOSESTADOS_SARLATF (java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_ULTIMOSESTADOS_SARLATF(?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_ULTIMOSESTADOS_SARLATF (java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_ULTIMOSESTADOS_SARLATF(pPSPERSON);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_ULTIMOSESTADOS_SARLATF
    
  //--START-PAC_IAX_PERSONA__F_SET_ESTNACIONALIDAD(PSPERSON,   CAGENTE,  CPAIS, PCDEFECTO)

    private HashMap callPAC_IAX_PERSONA__F_SET_ESTNACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS , java.math.BigDecimal pPCDEFECTO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_ESTNACIONALIDAD(?,?,?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON", "pCAGENTE", "pCPAIS", "pPCDEFECTO" }, new Object[] { pPSPERSON, pCAGENTE, pCPAIS, pPCDEFECTO });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCAGENTE);
        cStmt.setObject(4, pCPAIS);
        cStmt.setObject(5, pPCDEFECTO);
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
            retVal.put("MENSAJES", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_ESTNACIONALIDAD(java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCAGENTE, java.math.BigDecimal pCPAIS, java.math.BigDecimal pPCDEFECTO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_SET_ESTNACIONALIDAD(pPSPERSON, pCAGENTE, pCPAIS, pPCDEFECTO); 
    }
    //--END-PAC_IAX_PERSONA__F_SET_ESTNACIONALIDAD
    
    // CP0416M_SYS_PERS 18/12/2018 - AP Se agrega funciÃ³n F_GET_PERSONA_SARLAF
    private HashMap callPAC_IAX_PERSONA__F_GET_PERSONA_SARLAF(java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_GET_PERSONA_SARLAF(?,?)}";

        logCall(callQuery, new String[] { "pPSPERSON" },
                new Object[] { pPSPERSON });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);

        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor
                                                                        // de
                                                                        // "RETURN"
        cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
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
            retVal.put("MENSAJES", cStmt.getObject(3));
        } catch (SQLException e) {
            retVal.put("MENSAJES", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_SARLAF(java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PERSONA_SARLAF(pPSPERSON);// AXIS-WLS1SERVER-Ready
    }
    //--INI--WAJ
      private HashMap callPAC_IAX_PERSONA__F_GET_IMPUESTOS (java.math.BigDecimal pPSPERSON, String pPTABLAS) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_GET_IMPUESTOS(?, ?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pPTABLAS"}, new Object[] {pPSPERSON, pPTABLAS});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pPTABLAS);
            cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
            cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_IMPUESTOS".toUpperCase())); // Valor de "IMPUESTOS"
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
                retVal.put("OBIMPUESTOS", cStmt.getObject(5));
            }
            catch (SQLException e) {
                retVal.put("OBIMPUESTOS", null);
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

        public HashMap ejecutaPAC_IAX_PERSONA__F_GET_IMPUESTOS (java.math.BigDecimal pPSPERSON, String pPTABLAS) throws Exception {
            return this.callPAC_IAX_PERSONA__F_GET_IMPUESTOS(pPSPERSON, pPTABLAS);//AXIS-WLS1SERVER-Ready 
        }

        
        private HashMap callPAC_IAX_PERSONA__F_DEL_IMPUESTO (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPIND) throws Exception {
            String callQuery="{?=call PAC_IAX_PERSONA.F_DEL_IMPUESTO(?, ?, ?)}";
            
            logCall(callQuery, new String[] {"pPSPERSON", "pPCTIPIND"}, new Object[] {pPSPERSON, pPCTIPIND});
            CallableStatement cStmt=conn.prepareCall(callQuery);
            String USERNAME=conn.getMetaData().getUserName().toUpperCase();
            cStmt.setObject(2, pPSPERSON);
            cStmt.setObject(3, pPCTIPIND);
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
                retVal.put("MENSAJES", cStmt.getObject(5));
            }
            catch (SQLException e) {
                retVal.put("MENSAJES", null);
            }
            retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
   cStmt.close();//AXIS-WLS1SERVER-Ready
            
            return retVal;
        }

        public HashMap ejecutaPAC_IAX_PERSONA__F_DEL_IMPUESTO (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPIND) throws Exception {
            return this.callPAC_IAX_PERSONA__F_DEL_IMPUESTO(pPSPERSON, pPCTIPIND); 
        }
      //--FIN--WAJ    
    
    //TCS_1569B - ACL - 01/02/2019 - Se agrega la funciÃ³n F_GET_PERSONA_PUBLICA_IMP
    //--START-PAC_IAX_PERSONA.F_GET_PERSONA_PUBLICA_IMP(PSPERSON, PCTIPAGE)
    private HashMap callPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA_IMP (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPAGE) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PERSONA_PUBLICA_IMP(?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pPCTIPAGE" }, new Object[] {pPSPERSON, pPCTIPAGE });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pPCTIPAGE);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS".toUpperCase())); // Valor de "OBPERSONA"
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
            retVal.put("OBPERSONA", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("OBPERSONA", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA_IMP (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pPCTIPAGE) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA_IMP(pPSPERSON, pPCTIPAGE); 
    }
    //--END-PAC_IAX_PERSONA.F_GET_PERSONA_PUBLICA_IMP
    
    //inicio Bartolo Herrera
    private HashMap callPAC_IAX_PERSONA__F_GET_TIPO_VINCULACION_PERSONA (java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_TIPO_VINCULACION(?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);       
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);  // Valor de "RETURN"
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_TIPO_VINCULACION_PERSONA (java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_TIPO_VINCULACION_PERSONA(pPSPERSON);//AXIS-WLS1SERVER-Ready 
    }
  //fin Bartolo Herrera
    
    //--END-PAC_IAX_PERSONA.F_GET_TIPO_VINCULACION
    
   
   //inicio Bartolo Herrera 01/03/2019 IAXIS-2826
    
  //--START-PAC_IAX_PERSONA.F_GET_PARPERSONA_CONT (SPERSON, CPARAM, MENSAJES)
      private HashMap callPAC_IAX_PERSONA__F_GET_PARPERSONA_CONT (java.math.BigDecimal pPSPERSON, String pPCPARAM) throws Exception {
          String callQuery="{?=call PAC_IAX_PERSONA.F_GET_PARPERSONA_CONT(?, ?, ?)}";
          
          logCall(callQuery, new String[] {"pPSPERSON", "CPARAM"}, new Object[] {pPSPERSON,pPCPARAM});
          CallableStatement cStmt=conn.prepareCall(callQuery);
          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
          cStmt.setObject(2, pPSPERSON);   
          cStmt.setObject(3, pPCPARAM);  
          cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);  // Valor de "RETURN"
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

      public HashMap ejecutaPAC_IAX_PERSONA__F_GET_PARPERSONA_CONT (java.math.BigDecimal pPSPERSON, String pPCPARAM) throws Exception {
          return this.callPAC_IAX_PERSONA__F_GET_PARPERSONA_CONT(pPSPERSON, pPCPARAM);//AXIS-WLS1SERVER-Ready 
      } 
      //--END-PAC_IAX_PERSONA.F_GET_PARPERSONA_CONT 
      
      //--START-PAC_IAX_PERSONA.F_GET_CUPO_PERSONA(SPERSON, MENSAJES)
      private HashMap callPAC_IAX_PERSONA__F_GET_CUPO_PERSONA (java.math.BigDecimal pPSPERSON) throws Exception {
          String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CUPO_PERSONA(?, ?)}";
          
          logCall(callQuery, new String[] {"pPSPERSON"}, new Object[] {pPSPERSON});
          CallableStatement cStmt=conn.prepareCall(callQuery);
          String USERNAME=conn.getMetaData().getUserName().toUpperCase();
          cStmt.setObject(2, pPSPERSON);       
          cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);  // Valor de "RETURN"
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

      public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CUPO_PERSONA (java.math.BigDecimal pPSPERSON) throws Exception {
          return this.callPAC_IAX_PERSONA__F_GET_CUPO_PERSONA(pPSPERSON);//AXIS-WLS1SERVER-Ready 
      }
      //--END-PAC_IAX_PERSONA.F_GET_CUPO_PERSONA

    //fin Bartolo Herrera 01/03/2019 IAXIS-2826
    
    // Inicio IAXIS-3287 01/04/2019
      private HashMap callPAC_IAX_PERSONA__F_DUPLICAR_SARLAFT(java.math.BigDecimal pPSSARLAFT) throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_DUPLICAR_SARLAFT(?,?,?)}";

        logCall(callQuery, new String[] { "pPSSARLAFT" },
                new Object[] { pPSSARLAFT });
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSSARLAFT);
        
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNPOLIZADEST"

        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
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
             retVal.put("PSSARLAFTDEST", cStmt.getObject(3));
         }
         catch (SQLException e) {
             retVal.put("PSSARLAFTDEST", null);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_DUPLICAR_SARLAFT(java.math.BigDecimal pPSSARLAFT) throws Exception {
        return this.callPAC_IAX_PERSONA__F_DUPLICAR_SARLAFT(pPSSARLAFT);// AXIS-WLS1SERVER-Ready
    }  
      
    // Fin IAXIS-3287 01/04/2019
    
    //INI IAXIS-3670 16/04/2019 AP

    private HashMap callPAC_IAX_PERSONA__F_VALIDA_CONSORCIOS(java.math.BigDecimal pPSPERSON) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_VALIDA_CONSORCIOS(?,?)}";
        logCall(callQuery, new String[] { "pPSPERSON" }, new Object[] { pPSPERSON});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_VALIDA_CONSORCIOS(java.math.BigDecimal pPSPERSON) throws Exception {
        return this.callPAC_IAX_PERSONA__F_VALIDA_CONSORCIOS(pPSPERSON); 
    }
    //FIN IAXIS-3670 16/04/2019 AP
    
    /** Start Added for IAXIS-4149 by PranayK on 18/07/2019 */
    //--START-PAC_IAX_PERSONA.F_VALIDACCC(pPCBANCO, pPCTIPCC)
    private HashMap callPAC_IAX_PERSONA__F_GET_CODITIPOBANC(java.math.BigDecimal pPCBANCO, String pPCTIPCC) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_CODITIPOBANC(?,?,?)}";
        logCall(callQuery, new String[] { "pPCBANCO", "pPCTIPCC" }, new Object[] { pPCBANCO, pPCTIPCC });
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPCBANCO);
        cStmt.setObject(3, pPCTIPCC);
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.NUMERIC, UsuarioBean.fixOwner(USERNAME, "PCTIPBAN".toUpperCase()));
        cStmt.execute();
        HashMap retVal=new HashMap();
        try {
            retVal.put("RETURN", cStmt.getObject(1));
        }
        catch (SQLException e) {
            retVal.put("RETURN", null);
        }
        try {
            retVal.put("CTIPBAN", cStmt.getObject(4));
        }
        catch (SQLException e) {
            retVal.put("CTIPBAN", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
            cStmt.close();//AXIS-WLS1SERVER-Ready
        return retVal;
    }

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_CODITIPOBANC(java.math.BigDecimal pPCBANCO, String pPCTIPCC) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_CODITIPOBANC(pPCBANCO, pPCTIPCC); 
    }
    //--END-PAC_IAX_PERSONA.F_VALIDACCC
    /** End Added for IAXIS-4149 by PranayK on 18/07/2019 */
    
    /* IAXIS-13881 : Cambios de facturacion electronica : start*/    
  //--START-PAC_IAX_PERSONA.F_SET_REGIMENFISCAL(PSPERSON,  PCAGENTE,  PFEFECTO,  PCREGFISCAL,  PCREGFISEXEIVA,  PCTIPIVA)
    private HashMap callPAC_IAX_PERSONA__F_SET_FACT_ELECTRONICA (java.math.BigDecimal pPSPERSON, String pPNIT_PROVEEDOR, java.math.BigDecimal pPCRESPONSABLE_IVA, String  pPCFISCALES_ADQUIRIENTE, String pPCORREO_FACT_ELECT) throws Exception 
    {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_FACT_ELECTRONICA(?, ?, ?, ?, ?, ?, ?, ?)}";
        String pPAPPLICA_FACT_ELECT = "SI";
        logCall(callQuery, new String[] {"pPSPERSON", "pPNIT_PROVEEDOR", "pPCRESPONSABLE_IVA", "pPCFISCALES_ADQUIRIENTE", "pPCORREO_FACT_ELECT", "pPAPPLICA_FACT_ELECT"}, new Object[] {pPSPERSON, pPNIT_PROVEEDOR, pPCRESPONSABLE_IVA, pPCFISCALES_ADQUIRIENTE, pPCORREO_FACT_ELECT, pPAPPLICA_FACT_ELECT});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, null);
        cStmt.setObject(4, pPNIT_PROVEEDOR);
        cStmt.setObject(5, pPCRESPONSABLE_IVA);
        cStmt.setObject(6, pPCFISCALES_ADQUIRIENTE);
        cStmt.setObject(7, pPCORREO_FACT_ELECT);
        cStmt.setObject(8, pPAPPLICA_FACT_ELECT);
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
    
    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_FACT_ELECTRONICA (java.math.BigDecimal pPSPERSON, String pPNIT_PROVEEDOR, java.math.BigDecimal pPCRESPONSABLE_IVA, String  pPCFISCALES_ADQUIRIENTE, String pPCORREO_FACT_ELECT) throws Exception 
    {
        return this.callPAC_IAX_PERSONA__F_SET_FACT_ELECTRONICA(pPSPERSON, pPNIT_PROVEEDOR, pPCRESPONSABLE_IVA, pPCFISCALES_ADQUIRIENTE, pPCORREO_FACT_ELECT);//AXIS-WLS1SERVER-Ready 
    }
    /* IAXIS-13881 : Cambios de facturacion electronica : end*/
    
    //--START-PAC_IAX_PERSONA.F_GET_INF_FINANCIERA(ID, TIPO, MENSAJES)
    private HashMap callPAC_IAX_PERSONA__F_GET_INF_FINANCIERA (java.math.BigDecimal pPID, java.math.BigDecimal pPTIPO) throws Exception {
        String callQuery="{?=call PAC_IAX_PERSONA.F_GET_INF_FINANCIERA(?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPID", "pPTIPO"}, new Object[] {pPID, pPTIPO});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        cStmt.setObject(2, pPID);       
        cStmt.setObject(3, pPTIPO);   
        cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);  // Valor de "RETURN"
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

    public HashMap ejecutaPAC_IAX_PERSONA__F_GET_INF_FINANCIERA (java.math.BigDecimal pPID, java.math.BigDecimal pPTIPO) throws Exception {
        return this.callPAC_IAX_PERSONA__F_GET_INF_FINANCIERA(pPID, pPTIPO);//AXIS-WLS1SERVER-Ready 
    }
    //--END-PAC_IAX_PERSONA.F_GET_INF_FINANCIERA

  //Fin Bartolo Herrera 01/02/2021 ---- IAXIS-14960
  
     /* Cambio para IAXIS-15284 : Start */
    
    
    private HashMap callPAC_IAX_PERSONA__F_SET_DEUDOR_ACREEDOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCODDEUDOR, java.math.BigDecimal pCODACREEDOR) throws Exception 
    {
        String callQuery="{?=call PAC_IAX_PERSONA.F_SET_DEUDOR_ACREEDOR(?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pPSPERSON", "pCODDEUDOR", "pCODACREEDOR"}, new Object[] {pPSPERSON, pCODDEUDOR, pCODACREEDOR});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        
        cStmt.setObject(2, pPSPERSON);
        cStmt.setObject(3, pCODDEUDOR);
        cStmt.setObject(4, pCODACREEDOR);
     
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
    
    public HashMap ejecutaPAC_IAX_PERSONA__F_SET_DEUDOR_ACREEDOR (java.math.BigDecimal pPSPERSON, java.math.BigDecimal pCODDEUDOR, java.math.BigDecimal pCODACREEDOR ) throws Exception 
    {
        return this.callPAC_IAX_PERSONA__F_SET_DEUDOR_ACREEDOR(pPSPERSON, pCODDEUDOR, pCODACREEDOR);//AXIS-WLS1SERVER-Ready 
    }
    
    /* Cambio para IAXIS-15284 : End */
    
    /* Cambio para IAXIS-15339 : Start */
    
    
    private HashMap callPAC_IAX_PERSONA__F_BUSCAR_DATOS_CIFIN (String pNNUMNIF, java.math.BigDecimal pCTIPIDE) throws Exception 
    {
        String callQuery="{?=call PAC_IAX_PERSONA.F_BUSCAR_DATOS_CIFIN(?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pNNUMNIF", "pCTIPIDE"}, new Object[] {pNNUMNIF, pCTIPIDE});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        
        cStmt.setObject(2, pNNUMNIF);
        cStmt.setObject(3, pCTIPIDE);
             
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"        
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);  // Valor de "RETURN"        
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
        try {
            retVal.put("RESULTADO", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("RESULTADO", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }
    
    public HashMap ejecutaPAC_IAX_PERSONA__F_BUSCAR_DATOS_CIFIN (String pNNUMNIF, java.math.BigDecimal pCTIPIDE ) throws Exception 
    {
        return this.callPAC_IAX_PERSONA__F_BUSCAR_DATOS_CIFIN(pNNUMNIF, pCTIPIDE);//AXIS-WLS1SERVER-Ready 
    }
    
    
    private HashMap callPAC_IAX_PERSONA__F_BUSCAR_SERVICIO_CIFIN(String pNNUMNIF, java.math.BigDecimal pCTIPIDE) throws Exception 
    {
        String callQuery="{?=call PAC_IAX_PERSONA.F_BUSCAR_SERVICIO_CIFIN(?, ?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pNNUMNIF", "pCTIPIDE"}, new Object[] {pNNUMNIF, pCTIPIDE});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        
        cStmt.setObject(2, pNNUMNIF);
        cStmt.setObject(3, pCTIPIDE);
             
        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"        
        cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY, UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.STRUCT, UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS_CIFIN".toUpperCase()));  // Valor de "RETURN"        
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
        try {
            retVal.put("PERSONAS_CIFIN", cStmt.getObject(5));
        }
        catch (SQLException e) {
            retVal.put("PERSONAS_CIFIN", null);
        }
        retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready
        cStmt.close();//AXIS-WLS1SERVER-Ready
        
        return retVal;
    }
    
    public HashMap ejecutaPAC_IAX_PERSONA__F_BUSCAR_SERVICIO_CIFIN(String pNNUMNIF, java.math.BigDecimal pCTIPIDE ) throws Exception 
    {
        return this.callPAC_IAX_PERSONA__F_BUSCAR_SERVICIO_CIFIN(pNNUMNIF, pCTIPIDE);//AXIS-WLS1SERVER-Ready 
    }
    
    /* POST-35 : Start */
    private HashMap callPAC_IAX_PERSONA__F_CREAR_SERVICIO_CIFIN(String pNNUMNIF, java.math.BigDecimal pCTIPIDE, String pTAPELLI)
            throws Exception {
        String callQuery = "{?=call PAC_IAX_PERSONA.F_CREAR_DATOS_CIFIN(?, ?, ?, ?, ?)}";

        logCall(callQuery, new String[] { "pNNUMNIF", "pCTIPIDE", "pTAPELLI" }, new Object[] { pNNUMNIF, pCTIPIDE, pTAPELLI});
        CallableStatement cStmt = conn.prepareCall(callQuery);
        String USERNAME = conn.getMetaData().getUserName().toUpperCase();

        cStmt.setObject(2, pNNUMNIF);
        cStmt.setObject(3, pCTIPIDE);
        cStmt.setObject(4, pTAPELLI);

        cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
        cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
                UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
        cStmt.registerOutParameter(6, oracle.jdbc.OracleTypes.STRUCT,
                UsuarioBean.fixOwner(USERNAME, "OB_IAX_PERSONAS_CIFIN".toUpperCase())); // Valor de "RETURN"
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
        try {
            retVal.put("PERSONAS_CIFIN", cStmt.getObject(6));
        } catch (SQLException e) {
            retVal.put("PERSONAS_CIFIN", null);
        }
        retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
        cStmt.close();// AXIS-WLS1SERVER-Ready

        return retVal;
    }   
    
    public HashMap ejecutaPAC_IAX_PERSONA__F_CREAR_SERVICIO_CIFIN(String pNNUMNIF, java.math.BigDecimal pCTIPIDE, String pTAPELLI)
            throws Exception {
        return this.callPAC_IAX_PERSONA__F_CREAR_SERVICIO_CIFIN(pNNUMNIF, pCTIPIDE, pTAPELLI);// AXIS-WLS1SERVER-Ready
    }
    /* POST-35 : End */
    
    private HashMap callPAC_IAX_PERSONA__F_ACTUALIZAR_DATOS_CIFIN(String pNNUMNIF, java.math.BigDecimal pCTIPIDE) throws Exception 
    {
        String callQuery="{?=call PAC_IAX_PERSONA.F_ACTUALIZAR_DATOS_CIFIN(?, ?, ?)}";
        
        logCall(callQuery, new String[] {"pNNUMNIF", "pCTIPIDE"}, new Object[] {pNNUMNIF, pCTIPIDE});
        CallableStatement cStmt=conn.prepareCall(callQuery);
        String USERNAME=conn.getMetaData().getUserName().toUpperCase();
        
        cStmt.setObject(2, pNNUMNIF);
        cStmt.setObject(3, pCTIPIDE);
             
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
    
    public HashMap ejecutaPAC_IAX_PERSONA__F_ACTUALIZAR_DATOS_CIFIN(String pNNUMNIF, java.math.BigDecimal pCTIPIDE ) throws Exception 
    {
        return this.callPAC_IAX_PERSONA__F_ACTUALIZAR_DATOS_CIFIN(pNNUMNIF, pCTIPIDE);//AXIS-WLS1SERVER-Ready 
    }
                
    /* Cambio para IAXIS-15339 : End */ 
    
}
