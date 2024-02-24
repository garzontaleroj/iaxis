//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONEGOCIO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_RENTAS;
import axis.mvc.control.axis.Axiscomi013Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axiscomi013Service.java
 * @since Java 5.0
 */
public class Axiscomi013Service extends AxisBaseService {
    Log logger = LogFactory.getLog(this.getClass());

    /*********************************************************************************************************************/
    /*********************************************** MÃƒâ€°TODOS DE INICIALIZACION *******************************************/
    /*********************************************************************************************************************/

    /**
     * 
     * @param request
     */
    @SuppressWarnings("all")
    public void m_init(HttpServletRequest request, 
                       Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service m_init");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        try {


        } catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo m_form", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);

        } finally {
            this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
        }

    }

    public void m_form(HttpServletRequest request, 
                       Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service m_form");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);
        try {
        
            //INI IAXIS 4081 AABG: Para limpiar o no las variables de sesion
            if(formdata.get("borrarinfo") != null && formdata.get("borrarinfo").toString().equals("1")) {
                cleanTemp(request, thisAction);
                formdata.put("borrarinfo", 0);
                formdata.put("NTASA", null);
                formdata.put("NPRIMA",null);
                formdata.put("NPRIMAUSD",null);
                formdata.put("NPRIMAEUR",null);
            }
            //FIN IAXIS 4081 AABG: Para limpiar o no las variables de sesion
            
            PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES((Connection)request.getAttribute(Constantes.DB01CONN));
                PAC_IAX_COMISIONEGOCIO pac_iax_comisionegocio = new PAC_IAX_COMISIONEGOCIO((Connection)request.getAttribute(Constantes.DB01CONN)); 
            BigDecimal IDCONVENIO = getCampoNumerico(request,"IDCONVENIO");
            BigDecimal CAGENTE = usuario.getCagente();
            String MODO = getCampoTextual(request,"MODO");
            
          //INI IAXIS 4081 AABG: Se almacena el codigo del convenio para consulta posterior de tasas y primas de productos y asegurados
            request.getSession().setAttribute("codigo_convenio", IDCONVENIO);
          //FIN IAXIS 4081 AABG: Se almacena el codigo del convenio para consulta posterior de tasas y primas de productos y asegurados
        
        
        if(!isEmpty(IDCONVENIO) && MODO.equals(new String("MODIFICAR"))){
            
            Map m = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_DATCONVCOMESP(IDCONVENIO);
            logger.debug("-->busqueda:"+m);
            tratarRETURNyMENSAJES(request,m);
            
            Map OB_IAX_CONVCOMESP = (HashMap)m.get("RETURN");
            if(!isEmpty(OB_IAX_CONVCOMESP)){
                    if (request.getParameter("NoRecargarLstComi")==null) {
                        formdata.put("IDCONVENIO",OB_IAX_CONVCOMESP.get("IDCONVCOMESP"));
                        formdata.put("TDESCONV",OB_IAX_CONVCOMESP.get("TDESCONV"));
                        formdata.put("FINIVIG",OB_IAX_CONVCOMESP.get("FINIVIG")); 
                        formdata.put("FFINVIG",OB_IAX_CONVCOMESP.get("FFINVIG")); 
                        formdata.put("CAGENTE",OB_IAX_CONVCOMESP.get("CAGENTE")); 
                        formdata.put("SPERSON",OB_IAX_CONVCOMESP.get("SPERSON")); 
                        formdata.put("NOMBRE_TEXT",OB_IAX_CONVCOMESP.get("TNOMAGE"));
                        
                        // INI BJHB 19-04-2022
                        
                        formdata.put("CACTIVI",OB_IAX_CONVCOMESP.get("CACTIVI")); 
                        
                        // INI BJHB 19-04-2022
                        
                        //INI IAXIS 4081 AABG: Aqui se llena la lista de asegurados
                        formdata.put("NNUMIDE",""); 
                        formdata.put("TNOMBRE","");
                        formdata.put("TAPELLI1","");
                        formdata.put("TAPELLI2","");
                        
                        List listaAsegurados;
                        if( (List) request.getSession().getAttribute("axisctr_asegurados") == null) {
                            listaAsegurados = new ArrayList();
                        }else {
                            listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
                        }
                        if(formdata.get("flujo_eliminar") == null) {
                            ArrayList lstasegur =  (ArrayList)OB_IAX_CONVCOMESP.get("ASEGURADOS");
                            HashMap OB_IAX_PERSONAS = new HashMap();
                            if(!isEmpty(lstasegur)){
                                for(int i = 0;i<lstasegur.size();i++){
                                    OB_IAX_PERSONAS = new HashMap();
                                    OB_IAX_PERSONAS =(HashMap) ((HashMap)lstasegur.get(i)).get("OB_IAX_PERSONAS");
                                    
                                    Map tomador = new HashMap();
                                    //tomador.put("TNOMBRE", OB_IAX_PERSONAS.get("TNOMBRE"));
                                    tomador.put("TAPELLI1", OB_IAX_PERSONAS.get("TNOMBRE"));// EDSS TASK 72
                                    tomador.put("NNUMIDE", OB_IAX_PERSONAS.get("NNUMIDE"));
                                    tomador.put("SPERSON", OB_IAX_PERSONAS.get("SPERSON"));
                                    
                                    setObjetoALista(listaAsegurados, tomador, "OB_IAX_TOMADORES");
                                }
                            }
                        }                       
                        formdata.put("axisctr_asegurados",  listaAsegurados);
                        request.getSession().setAttribute("axisctr_asegurados", ((listaAsegurados == null) ?  new ArrayList(): listaAsegurados));
                        
                        //INI IAXIS 4081 AABG: Aqui se llena la lista de asegurados
                        formdata.put("CUSUALT",OB_IAX_CONVCOMESP.get("CUSUALT"));
                }else {
                    //Cuando es recargar se rellena el array de asegurados
                    //INI IAXIS 4081 AABG: Se lleva a cabo la recarga de asegurados
                    List listaAsegurados;
                    if( (List) request.getSession().getAttribute("axisctr_asegurados") == null) {
                        listaAsegurados = new ArrayList();
                    }else {
                        listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
                    }
                    formdata.put("axisctr_asegurados",  listaAsegurados);
                    request.getSession().setAttribute("axisctr_asegurados", ((listaAsegurados == null) ?  new ArrayList(): listaAsegurados));
                    //FIN IAXIS 4081 AABG: Se lleva a cabo la recarga de asegurados
                }
                
                //INI IAXIS 4081 AABG: Validacion para contener los productos
                if((formdata.get("flujo_eliminar") == null || !(Boolean)formdata.get("flujo_eliminar")) && request.getSession().getAttribute("LSTPRODUCTOS") == null) {
                     ArrayList lstprod =  (ArrayList)OB_IAX_CONVCOMESP.get("PRODUCTOS");
                     ArrayList prod =  new ArrayList();
                     HashMap lstpro = new HashMap();
                     HashMap OB_IAX_INFO = new HashMap();
                     if(!isEmpty(lstprod)){
                         logger.debug("---> lstprod:"+lstprod);
                         for(int i = 0;i<lstprod.size();i++){
                             logger.debug("---> producto:"+ lstprod.get(i));
                            // String[] producto = productos[i].split("/");
                             OB_IAX_INFO = new HashMap();
                             lstpro = new HashMap();
                             OB_IAX_INFO =(HashMap) ((HashMap)lstprod.get(i)).get("OB_IAX_INFO");
                             lstpro.put("SPRODUC",OB_IAX_INFO.get("NOMBRE_COLUMNA"));
                             lstpro.put("TPRODUC",OB_IAX_INFO.get("VALOR_COLUMNA"));
                             List<String> orderNumbers = new ArrayList<String>();   
                             lstpro.put("VALORES",obtenerTasas(IDCONVENIO, new BigDecimal(OB_IAX_INFO.get("NOMBRE_COLUMNA").toString()), request, thisAction));
                             prod.add(lstpro);
                         }
                     }
                     logger.debug("---> prod:"+prod);
                     formdata.put("LSTPRODUCTOS",prod);
                     request.getSession().setAttribute("LSTPRODUCTOS",prod);
                     
                   //INI IAXIS 4081 AABG: Se obtiene la tasa y el producto
                     if(prod != null && prod.size() > 0) {
                         List listaAseg = (List) request.getSession().getAttribute("axisctr_asegurados");
                         if(listaAseg != null && listaAseg.size() > 0) {
                             //formdata.put("NTASA",obtenerPropiedadValor(IDCONVENIO, listaAseg, prod, request, thisAction, 1));
                             formdata.put("NPRIMA",obtenerPropiedadValor(IDCONVENIO, listaAseg, prod, request, thisAction, 2, new BigDecimal(0)));
                             formdata.put("NPRIMAUSD",obtenerPropiedadValor(IDCONVENIO, listaAseg, prod, request, thisAction, 3, new BigDecimal(0)));
                             formdata.put("NPRIMAEUR",obtenerPropiedadValor(IDCONVENIO, listaAseg, prod, request, thisAction, 4, new BigDecimal(0)));
                             formdata.put("NGASTEXP",obtenerPropiedadValor(IDCONVENIO, listaAseg, prod, request, thisAction, 5, new BigDecimal(0)));
                         }                       
                     }
                     //FIN IAXIS 4081 AABG: Se obtiene la tasa y el producto
                }
               //FIN IAXIS 4081 AABG: Validacion para contener los productos               
                
                if (request.getParameter("NoRecargarLstComi")==null) {
                        ArrayList c = (ArrayList)OB_IAX_CONVCOMESP.get("COMISIONES");
                        ArrayList LTSCOMI = new ArrayList();
                        HashMap OB_IAX_GSTCOMISION = new HashMap();
                        logger.debug("---> comi:"+c);
                        for(int i=0;i<c.size();i++){   
                            Map comi = new HashMap();
                            Map OB_IAX_COMISION = new HashMap();
                            HashMap r = (HashMap)c.get(i);
                            OB_IAX_GSTCOMISION = (HashMap)r.get("OB_IAX_GSTCOMISION");
                            logger.debug("---> OB_IAX_GSTCOMISION:"+OB_IAX_GSTCOMISION);
                          //  HashMap r = (HashMap)OB_IAX_GSTCOMISION.get(i);
                            comi.put("CATRIBU", OB_IAX_GSTCOMISION.get("CMODCOM") );
                            comi.put("TATRIBU",OB_IAX_GSTCOMISION.get("TATRIBU"));
                            comi.put("PCCOMISI",OB_IAX_GSTCOMISION.get("PCOMISI"));
                            logger.debug("compani: "+comi);
                            OB_IAX_COMISION.put("OB_IAX_COMISION",comi);
                            LTSCOMI.add(OB_IAX_COMISION);
                        }
                        logger.debug("LTSCOMI: "+LTSCOMI);
                        request.getSession().setAttribute("LTSCOMI",LTSCOMI);
                    }
            }
        } 
        
         if(isEmpty(IDCONVENIO) &&( !isEmpty(MODO) && MODO.equals(new String("NUEVO")))){
            
            Map m = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_NEXT_CONV();
            logger.debug(m);
            tratarRETURNyMENSAJES(request,m);
            
            
            formdata.put("IDCONVENIO",m.get("PCCODCONV_OUT"));
            formdata.put("TDESCONV",null);
            formdata.put("FINIVIG",null); 
            formdata.put("FFINVIG",null); 
            formdata.put("CAGENTE",null); 
            formdata.put("SPERSON",null); 
            formdata.put("NOMBRE_TEXT",null); 
            formdata.put("NNUMIDE",null); 
            formdata.put("TNOMBRE",null);
            // INI BJHB 19-04-2022
            formdata.put("CACTIVI",null);
            // FIN BJHB 19-04-2022
            formdata.put("CUSUALT",usuario.getUsuario());
        
        }
         
       //INI IAXIS 4081 AABG: Para almacenar la lista de asociados en Nuevo
         if((!isEmpty(MODO) && MODO.equals(new String("NUEVO")))) {          

             List listaAsegurados;
            if( (List) request.getSession().getAttribute("axisctr_asegurados") == null) {
                listaAsegurados = new ArrayList();
            }else {
                listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
            }
                formdata.put("axisctr_asegurados",  listaAsegurados);
            request.getSession().setAttribute("axisctr_asegurados", ((listaAsegurados == null) ?  new ArrayList(): listaAsegurados));
            //EDSS TASK 72
            formdata.put("NNUMIDE",""); 
            formdata.put("TNOMBRE","");
            formdata.put("TAPELLI1","");
            formdata.put("TAPELLI2","");
         }
       //FIN IAXIS 4081 AABG: Para almacenar la lista de asociados en Nuevo
        
        if((!isEmpty(MODO) && MODO.equals(new String("MODNEW"))))    
            formdata.put("MODO","NUEVO");
        else
            if((!isEmpty(MODO) && MODO.equals(new String("MODMOD"))))    
                formdata.put("MODO","MODIFICAR");
        
        ArrayList lstcomi = (ArrayList)request.getSession().getAttribute("LTSCOMI"); 
        if(isEmpty(lstcomi)){
        
            Map m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(67));
            tratarRETURNyMENSAJES(request,m);
            ArrayList c = (ArrayList)m.get("RETURN");
            
            ArrayList LTSCOMI = new ArrayList();
            
            for(int i=0;i<c.size();i++){   
                Map comi = new HashMap();
                Map OB_IAX_COMISION = new HashMap();
                HashMap r = (HashMap)c.get(i);
                comi.put("CATRIBU", r.get("CATRIBU") );
                comi.put("TATRIBU",r.get("TATRIBU"));
                comi.put("PCCOMISI",new BigDecimal(0));
                logger.debug("compani: "+comi);
                OB_IAX_COMISION.put("OB_IAX_COMISION",comi);
                LTSCOMI.add(OB_IAX_COMISION);
            }
            logger.debug("LTSCOMI: "+LTSCOMI);
            request.getSession().setAttribute("LTSCOMI",LTSCOMI);
            
        }
        else {
                lstcomi=(ArrayList)request.getSession().getAttribute("LTSCOMI"); //[{OB_IAX_COMISION={CATRIBU=1, PCCOMISI=3,56, TATRIBU=Dire
                
                logger.debug("ANTES "+lstcomi);
                for (int i=0; i<lstcomi.size(); i++) {
                    
                    HashMap r=(HashMap)lstcomi.get(i);
                    HashMap OB_IAX_COMISION=(HashMap)r.get("OB_IAX_COMISION");
                    logger.debug("OB_IAX_COMISION?"+OB_IAX_COMISION);
                    if (OB_IAX_COMISION.get("PCCOMISI")!=null) {
                        logger.debug("OB_IAX_COMISION antes"+OB_IAX_COMISION);
                        OB_IAX_COMISION.put("PCCOMISI", OB_IAX_COMISION.get("PCCOMISI").toString().replace(',','.'));
                        logger.debug("OB_IAX_COMISION despues"+OB_IAX_COMISION);
                        //lstcomi.set(i,OB_IAX_COMISION);
                    }
                    
                }
                request.getSession().setAttribute("LTSCOMI",lstcomi);
                logger.debug("DESPUES "+lstcomi);
        }
      
        ArrayList lstprods = (ArrayList)request.getSession().getAttribute("LSTPRODUCTOS");
        String recprod = getCampoTextual(request,"RECPROD");
        if(isEmpty(lstprods) ||(!isEmpty(recprod) && recprod.equals(new String("RECARGAR"))) ){
        String LISTAPRODUCTOS = getCampoTextual(request,"LISTAPRODUCTOS");
        logger.debug("---> LISTAPRODUCTOS:"+LISTAPRODUCTOS);
        HashMap lstprod = new HashMap();
        ArrayList prod = new ArrayList();
        if(!isEmpty(LISTAPRODUCTOS)){
            String[] productos=  LISTAPRODUCTOS.split("x");
            logger.debug("---> productos:"+productos);
            for(int i = 0;i<productos.length;i++){
                logger.debug("---> producto:"+ productos[i]);
                String[] producto = productos[i].split("/");
                
                lstprod = new HashMap();
                if (!isEmpty(producto) && producto.length>0){
                    lstprod.put("SPRODUC",producto[0]);
                    if (producto.length>1)
                    lstprod.put("TPRODUC",producto[1]);
                  //INI IAXIS 4081 AABG: Se almacena los valores de las tasas
                    lstprod.put("VALORES", obtenerValoresProducto(producto[0].toString(), lstprods));
                  //FIN IAXIS 4081 AABG: Se almacena los valores de las tasas
                    prod.add(lstprod);
                }
            }
        }else {
            if(request.getSession().getAttribute("ProductosElmimiandos") == null || request.getSession().getAttribute("ProductosElmimiandos").toString().equals("FALSE")) {
                prod = (ArrayList)request.getSession().getAttribute("LSTPRODUCTOS"); 
            }                   
        }
            logger.debug("---> prod:"+prod);
            if(isEmpty(prod)) {//EDSS TASK 72 
                formdata.put("LSTPRODUCTOS",lstprods);
                request.getSession().setAttribute("LSTPRODUCTOS",lstprods); 
                logger.debug("---> lstprods_2:"+formdata.get("LSTPRODUCTOS"));
            }else {
                formdata.put("LSTPRODUCTOS",prod);
                request.getSession().setAttribute("LSTPRODUCTOS",prod); 
                logger.debug("---> prod2:"+formdata.get("LSTPRODUCTOS"));
            }
            
            
            //INI IAXIS 4081 AABG: Se obtiene la propiedad Valor (producto, tasa, prima)
            /*ArrayList lstasegur =  (ArrayList) request.getSession().getAttribute("axisctr_asegurados");
            HashMap OB_IAX_TOMADORES = new HashMap();
            if(!isEmpty(lstasegur)){
                for(int i = 0;i<lstasegur.size();i++){
                    OB_IAX_TOMADORES = new HashMap();
                    OB_IAX_TOMADORES =(HashMap) ((HashMap)lstasegur.get(i)).get("OB_IAX_TOMADORES");    
                    //INI IAXIS 4081 AABG: Se obtiene la propiedad Valor (producto, tasa, prima)
                    OB_IAX_TOMADORES.put("VALORES", obtenerPropiedadValor(IDCONVENIO, OB_IAX_TOMADORES.get("NNUMIDE").toString(), prod, request, thisAction, 2));
                    //FIN IAXIS 4081 AABG: Se obtiene la propiedad Valor (producto, tasa, prima)
                }
            }*/
            //FIN IAXIS 4081 AABG: Se obtiene la propiedad Valor (producto, tasa, prima)
          
            }

        }
            catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo m_form", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        } finally {
            this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
        }
    }


    public void m_aceptar(HttpServletRequest request, 
                          Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service m_aceptar");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);
        try {

            HashMap mavisos = this.f_Get_Avisos(request, this.whoami(this));
            BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request , mavisos);
            request.setAttribute("PLSTAVISOS", mavisos.get("PLSTAVISOS"));
            
           if (pRETURN!=null && pRETURN.intValue() != 1) {

           PAC_IAX_COMISIONEGOCIO pac_iax_comisionegocio = new PAC_IAX_COMISIONEGOCIO((Connection)request.getAttribute(Constantes.DB01CONN)); 
           BigDecimal IDCONVENIO = getCampoNumerico(request,"IDCONVENIO");
           String TDESCONV = getCampoTextual(request,"TDESCONV");
           Date FINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
           Date FFINVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINVIG")); 
           BigDecimal CAGENTE = getCampoNumerico(request,"CAGENTE"); 
         //INI IAXIS 4081 AABG: Se obtiene todos los Sperson
           String SPERSON = obtenerInfoPersonas(request, 1);
           String NNUMIDE = obtenerInfoPersonas(request, 2);
         //FIN IAXIS 4081 AABG: Se obtiene todos los Sperson
           ArrayList lstcomi = (ArrayList)request.getSession().getAttribute("LTSCOMI"); 
           ArrayList lstprod = (ArrayList)request.getSession().getAttribute("LSTPRODUCTOS");  
         //INI IAXIS 4081 AABG: Validacion para seleccionar al menos 1 producto
           if(lstprod == null || lstprod.size() <= 0) {
               formdata.put("RECPROD","RECARGAR");
               request.getSession().setAttribute("ProductosElmimiandos","FALSE");
               throw new Exception("Debe seleccionar al menos un producto.");
           }else if(!validarInformacionTasas(lstprod)) {
               formdata.put("RECPROD","RECARGAR");
               request.getSession().setAttribute("ProductosElmimiandos","FALSE");
               throw new Exception("Por favor diligencia todas las Tasas para los productos seleccionados.");
           }
         //INI IAXIS 4081 AABG: Validacion para seleccionar al menos 1 producto
           
         //INI IAXIS 4081 AABG: Se obtiene los nuevos parametros
           String TASA = getCampoTextual(request,"NTASA");
           String PRIMA = getCampoTextual(request,"NPRIMA");
           String PRIMAUSD = getCampoTextual(request,"NPRIMAUSD");
           String PRIMAEUR = getCampoTextual(request,"NPRIMAEUR");
           String GASTEXP = getCampoTextual(request,"NGASTEXP");
         //FIN IAXIS 4081 AABG: Se obtiene los nuevos parametros
            
           logger.debug("-->IDCONVENIO:"+IDCONVENIO); 
            logger.debug("-->TDESCONV:"+TDESCONV); 
            logger.debug("-->FINIVIG:"+FINIVIG); 
            logger.debug("-->FFINVIG:"+FFINVIG); 
            logger.debug("-->CAGENTE:"+CAGENTE); 
            logger.debug("-->SPERSON:"+SPERSON); 
            logger.debug("-->lstcomi:"+lstcomi); 
            logger.debug("-->lstprod:"+lstprod); 
            
            // INI BJHB 19-04-2022
            BigDecimal CACTIVI = getCampoNumerico(request,"CACTIVI"); 
            // INI BJHB 19-04-2022

          //INI IAXIS 4081 AABG: Se envia los nuevos parametros
            Map m = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_SET_DATCONVCOMESP(IDCONVENIO,TDESCONV,FINIVIG,
                                                                                              FFINVIG,
                                                                                              generarT_IAX_Info(request,usuario,new BigDecimal(2)),
                                                                                              generarT_IAX_Info(request,usuario,new BigDecimal(1)),
                                                                                              CAGENTE,
                                                                                              SPERSON,
                                                                                              NNUMIDE,
                                                                                              TASA,
                                                                                              PRIMA,
                                                                                              PRIMAUSD,
                                                                                              PRIMAEUR,
                                                                                              GASTEXP,
                                                                                              CACTIVI // BJHB 20-04-2022
                                                                                              );
          //INI IAXIS 4081 AABG: Se reinicia variables temporales si 
            /*if(m.get("RETURN").toString().equals("0")) {
                formdata.put("flujo_eliminar", null);
                formdata.put("axisctr_asegurados",  null);
                request.getSession().setAttribute("axisctr_asegurados",   null);
            }*/            
          //FIN IAXIS 4081 AABG: Se reinicia variables temporales
           
          //FIN IAXIS 4081 AABG: Se envia los nuevos parametros
            tratarRETURNyMENSAJES(request,m);
            formdata.put("RECPROD","RECARGAR");
            request.getSession().setAttribute("LSTPRODUCTOS",(ArrayList)request.getSession().getAttribute("LSTPRODUCTOS")); 
            
            /*String MODO=this.getCampoTextual(request,"MODO");
            if (MODO!=null && MODO.equals("NUEVO")) 
                formdata.put("MODO","MODNEW");
            else
            if (MODO!=null && MODO.equals("MODIFICAR")) 
                formdata.put("MODO","MODMOD");*/
           }           

        } catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo m_aceptar", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        } finally {
            this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
        }
    }

    public void m_buscar(HttpServletRequest request, 
                         Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service m_form");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);
        try {

            BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
            BigDecimal SRECREN = getCampoNumerico(request, "SRECREN");


            Map mapa_cabecera = new PAC_IAX_RENTAS((Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_RENTAS__F_GET_CAB_RENTA(SRECREN);
            logger.debug(mapa_cabecera);
            HashMap cabecera = (HashMap)mapa_cabecera.get("OOCABRENTA");
            //formdata.putAll(cabecera);  
            formdata.put("OOCABRENTA", cabecera);

            Map mapa_cuerpo = new PAC_IAX_RENTAS((Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_RENTAS__F_GET_PAGORENTA(SRECREN);
            logger.debug(mapa_cuerpo);
            HashMap cuerpo = (HashMap)mapa_cuerpo.get("OOPAGORENTA");
            //formdata.putAll(cuerpo);
            formdata.put("OOPAGORENTA", cuerpo);

        } catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo m_form", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        } finally {

                this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

        }
    }
    
    // INI IAXIS 4081 AABG: Se crea funcion para almacenar temporalmente el asegurado
    public void m_almacenar(HttpServletRequest request, 
            Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service m_form");
        try {
            Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
            formdata.put("flujo_eliminar", false);
            
            List listaAsegurados;
            if( (List) request.getSession().getAttribute("axisctr_asegurados") == null) {
                listaAsegurados = new ArrayList();
            }else {
                listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
            }
            
            //se valida que exista un registro seleccionado
            if(this.getCampoTextual(request,"NNUMIDE") == null || this.getCampoTextual(request,"NNUMIDE") == "") {
                formdata.put("RECPROD","RECARGAR");
                throw new Exception("Por favor seleccionar un asociado.");
            }           
            
            String validarNumIde = this.getCampoTextual(request,"NNUMIDE");
            //Se valida que no se registre un asociado duplicado
            for(int i=0; i<listaAsegurados.size(); i++) {
                HashMap m = (HashMap)((Map) listaAsegurados.get(i)).get("OB_IAX_TOMADORES");
                if(m.get("NNUMIDE").toString().equals(validarNumIde)) {
                    formdata.put("RECPROD","RECARGAR");
                    throw new Exception("El asociado ya se encuentra asignado.");
                }
            }
            
            Map tomador = new HashMap();
            tomador.put("TNOMBRE", this.getCampoTextual(request,"TNOMBRE"));
            tomador.put("TAPELLI1", this.getCampoTextual(request,"TAPELLI1"));
            tomador.put("TAPELLI2", this.getCampoTextual(request,"TAPELLI2"));
            tomador.put("NNUMIDE", this.getCampoTextual(request,"NNUMIDE"));
            tomador.put("SPERSON", this.getCampoTextual(request, "SPERSON"));
            setObjetoALista(listaAsegurados, tomador, "OB_IAX_TOMADORES");
            formdata.put("axisctr_asegurados",  listaAsegurados);
            request.getSession().setAttribute("axisctr_asegurados", ((listaAsegurados == null) ?  new ArrayList(): listaAsegurados));
            formdata.put("RECPROD","RECARGAR");
            
        }catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo m_almacenar", 
                    e);
           thisAction.guardarMensaje(request, "1000050", new Object[] { e.getMessage().toString() },Constantes.MENSAJE_ERROR);
       } finally {
    
               this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    
       }
    }
    // FIN IAXIS 4081 AABG: Se crea funcion para almacenar temporalmente el asegurado
    
 // INI IAXIS 4081 AABG: Se crea funcion para eliminar un asegurado temporal
    public void m_borrar_asegurado(HttpServletRequest request, 
            Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service m_form");
        try {
            Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
            formdata.put("flujo_eliminar", true);
            List listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
            BigDecimal NNUMIDE = this.getCampoNumerico(request, "NNUMIDE");
            
            quitaObjetoDeLista(listaAsegurados, bigDecimalToString(NNUMIDE), "NNUMIDE", "OB_IAX_TOMADORES");            
            request.removeAttribute("NNUMIDE");
            formdata.put("axisctr_asegurados",  listaAsegurados);
            request.getSession().setAttribute("axisctr_asegurados", ((listaAsegurados == null) ?  new ArrayList(): listaAsegurados));       
            formdata.put("LSTPRODUCTOS", (List)request.getSession().getAttribute("LSTPRODUCTOS"));
            
        }catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo m_borrar_asegurado", 
                    e);
           thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
       } finally {
    
               this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    
       }
    }
    // FIN IAXIS 4081 AABG: Se crea funcion para eliminar un asegurado temporal
    
 // INI IAXIS 4081 AABG: Se crea funcion para limpiar variables temporales
    public void cleanTemp(HttpServletRequest request, 
            Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service cleanTemp");
        try {
            request.getSession().setAttribute("axisctr_asegurados", null);
            request.getSession().setAttribute("flujo_eliminar", null);
            request.getSession().setAttribute("flujo_eliminar", null);
            request.getSession().setAttribute("LSTPRODUCTOS", null);
            request.getSession().setAttribute("codigo_convenio", null);
            
        }catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo cleanTemp", 
                    e);
           thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
       } finally {
    
               this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    
       }
    }
    // FIN IAXIS 4081 AABG: Se crea funcion para eliminar un asegurado temporal
    
    public void m_ajax_actualizar_persona(HttpServletRequest request, 
                                                   Axiscomi013Action thisAction) {
            logger.info("Axiscomi015Service m_ajax_actualizar_persona");
            UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
            HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);
            AjaxContainerService ajax = new AjaxContainerService();
            
            try {
                 BigDecimal SPERSON = 
                     this.getCampoNumerico(request, "SPERSON"); //(BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
                 BigDecimal CAGENTE = 
                     this.getCampoNumerico(request, "CAGENTE1"); //(BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
                 Map map = 
                     new PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, 
                                                                                                        CAGENTE);
                 logger.debug("get PERSONA()" + map);
                 BigDecimal RETURN = 
                     (BigDecimal)tratarRETURNyMENSAJES(request, map);
                 if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
                     //ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
                     Map OB_PERSONA = (Map)map.get("OBPERSONA");
                     logger.debug(OB_PERSONA);
                     ajax.rellenarPlAContenedorAjax(map);


                     ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
                 }



            } catch (Exception e) {
                logger.error("Axiscomi013Service m_ajax_actualizar_persona - Excepcion", 
                             e);
                ajax.rellenarExcepcionAContenedorAjax(e);
            } finally {
                this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
                request.setAttribute(Constantes.AJAXCONTAINER, 
                        ajax.procesarContenedorAjax());
            }
    } 
    
    public void m_ajax_insertpor(HttpServletRequest request) {
        logger.debug("Axiscomi013Service m_ajax_insertpor");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        try {
            
            BigDecimal PCCOMISI = getCampoNumerico(request, "PCCOMISI");
            BigDecimal PCMODCOM =  getCampoNumerico(request, "PCMODCOM");
            
            ArrayList lstcomi = (ArrayList)request.getSession().getAttribute("LTSCOMI");
            logger.debug("---> lstcomi:"+lstcomi);
            if(!isEmpty(lstcomi)){
                
                HashMap r = new HashMap();
              for(int i=0;i<lstcomi.size();i++){
                    r = (HashMap)lstcomi.get(i);
                    HashMap rr = (HashMap)r.get("OB_IAX_COMISION");
                    logger.debug("---> rr:"+rr);
                    BigDecimal catribu = (BigDecimal)rr.get("CATRIBU");
                    if(catribu.equals(PCMODCOM)){
                      rr.put("PCCOMISI",PCCOMISI.toString().replace('.',',')); //ver si con esto arreglamos el error numerico cuando pasamos a ala bbdd
                      Map OB_IAX_COMISION = new HashMap();
                      OB_IAX_COMISION.put("OB_IAX_COMISION",rr);
                      lstcomi.set(i,OB_IAX_COMISION);  
                      logger.debug("---> lstcompanias:"+lstcomi);
                    }
                }
            }

            request.getSession().setAttribute("LTSCOMI",lstcomi);
            ajax.guardarContenidoFinalAContenedorAjax(lstcomi);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
           
        } catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - mÃƒÂ©todo m_ajax_insertval", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, 
                                 ajax.procesarContenedorAjax());
        }
    }
    
    private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, BigDecimal cual) throws Exception {
     
         String USERNAME = ((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();
        
        ArrayList tinfo = null;
        if(cual.equals(new BigDecimal(1)))
            tinfo = (ArrayList)request.getSession().getAttribute("LTSCOMI"); 
        else
            tinfo = (ArrayList)request.getSession().getAttribute("LSTPRODUCTOS"); 
        
        TIaxInfo params = null;
        int count = 0;
        
  //      if(!isEmpty(tinfo)){
            int n=tinfo.size(); // numero de parametros
             logger.debug("n-->"+n);
            ObIaxInfo[] paramsList=new ObIaxInfo[n];
            // primero, llenar los parametros
            {
                ObIaxInfo paramObj=null;
                for (int i=0;i<tinfo.size();i++) {
                    HashMap xx  = (HashMap)tinfo.get(i);
                    
                    if(cual.equals(new BigDecimal(1))){
                        HashMap mm =(HashMap) xx.get("OB_IAX_COMISION");
                        logger.debug("mm-->"+mm);
                        if (!isEmpty(mm.get("PCCOMISI"))){
                            count ++;
                            logger.debug(mm.get("PCCOMISI").toString());
                            paramObj=new ObIaxInfo(String.valueOf( mm.get("CATRIBU")),mm.get("PCCOMISI").toString().replace('.',','), "", new BigDecimal(1)) ;
                            paramObj._SQL_NAME=UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
                            paramsList[i]=paramObj;
                        }
                    }
                    else{
                     //   HashMap mm =(HashMap) xx.get("OB_IAX_DESCCUADROCOMISION");
                        
                        if (!isEmpty(xx.get("SPRODUC"))){
                            count ++;
                            //INI IAXIS 4081 AABG: Se agrega los valores en el parametro tipoColumna
                            paramObj=new ObIaxInfo("SPRODUC",String.valueOf( xx.get("SPRODUC")), String.valueOf(xx.get("VALORES")), new BigDecimal(1)) ;
                          //INI IAXIS 4081 AABG: Se agrega los valores en el parametro tipoColumna
                            paramObj._SQL_NAME=UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
                            paramsList[i]=paramObj;
                        }
                    }
                }
            }
    
            if(count == 0)
                paramsList=new ObIaxInfo[count];
    
            // con la lista de parametros llenar el ojeto table
            params=new TIaxInfo(paramsList);
            params._SQL_NAME=UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
//        }
     //   if(count > 0)
            return params;
     //   else
     //       return null;
    }
    
    public void m_recargar(HttpServletRequest request, 
                       Axiscomi013Action thisAction) {
        logger.debug("Axiscomi013Service m_form");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);
        try {
        
        String LISTAPRODUCTOS = getCampoTextual(request,"LISTAPRODUCTOS");
        logger.debug("---> LISTAPRODUCTOS:"+LISTAPRODUCTOS);
        HashMap lstprod = new HashMap();
        ArrayList prod = new ArrayList();
        if(!isEmpty(LISTAPRODUCTOS)){
            String[] productos=  LISTAPRODUCTOS.split("x");
            logger.debug("---> productos:"+productos);
            for(int i = 0;i<productos.length;i++){
                logger.debug("---> producto:"+ productos[i]);
                String[] producto = productos[i].split("/");
                
                lstprod = new HashMap();
                if (!isEmpty(producto) && producto.length>0){
                    lstprod.put("SPRODUC",producto[0]);
                    if (producto.length>1)
                   lstprod.put("TPRODUC",producto[1]);
                    prod.add(lstprod);
                }
            }
        }
        logger.debug("---> prod:"+prod);
        formdata.put("LSTPRODUCTOS",prod);
        request.getSession().setAttribute("LSTPRODUCTOS",prod);
        

        }
            catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo m_form", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        } finally {
            this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
        }
    }

    public void m_ajax_actualizar_agente(HttpServletRequest request) {
        logger.info("Axisadm047Service m_ajax_busqueda_productos");
        AjaxContainerService ajax = new AjaxContainerService();

        try {
            String CAGENTE = getCampoTextual(request, "CAGENTE");
            Map m = (Map)this.ActualizaAgente(request, CAGENTE);
            ajax.rellenarPlAContenedorAjax(m);
            ajax.guardarContenidoFinalAContenedorAjax(m);

        } catch (Exception e) {
            logger.error("Error en el servicio Axisctr001Service - mÃƒÂ©todo m_ajax_actualizar_agente", 
                         e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, 
                                 ajax.procesarContenedorAjax());
        }
    }
    
    private Map ActualizaAgente(HttpServletRequest request, 
                                String CAGENTE) throws Exception {
        Map mapAgentes = new HashMap();

        // Cargar Agente de la BD
        Map agente = new HashMap();
        if (!isEmpty(CAGENTE)) {
            UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
            BigDecimal TIPAGENTE  = getCampoNumerico(request, "TIPAGENTE");
       /*     mapAgentes = 
                    new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, 
                                                                                                                  null, 
                                                                                                                  CAGENTE, 
                                                                                                                  new BigDecimal(1));
            */                                                                                                      
            // HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(NNUMIDE, NOMBRE,CAGENTE,new BigDecimal(1) );
            mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(null, null, new BigDecimal(CAGENTE), new BigDecimal(1), new String("NUEVA_PRODUCCION_ACTIVO"), TIPAGENTE);                                                                                                      
                                                                                                                                             
          //  HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null,null,CAGENTE,new BigDecimal(1),new String("NUEVA_PRODUCCION_ACTIVO"));
            logger.debug(mapAgentes);
            List agentes = (List)mapAgentes.get("RETURN");


            if (!isEmpty(mapAgentes.get("RETURN")))
                agente = (Map)agentes.get(0);
        }

        request.getSession().setAttribute("axisctr_agente", agente);

        return mapAgentes;
    }
    
    public void m_ajax_ver_agente(HttpServletRequest request) {
        AjaxContainerService ajax = new AjaxContainerService();
        try {
            String CODI = getCampoTextual(request, "CODI");

            if (request.getSession().getAttribute("axisctr014_listaAgentes") != 
                null) {
                List listaAgentes = 
                    (List)request.getSession().getAttribute("axisctr014_listaAgentes");
                Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

                if (!isEmpty(agente)) {
                    ajax.guardarContenidoFinalAContenedorAjax(agente);
                    request.getSession().setAttribute("axisctr_agente", 
                                                      agente);
                }
                listaAgentes = null;
            }
        } catch (Exception e) {
            logger.error("Error", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, 
                                 ajax.procesarContenedorAjax());
        }
    }
    
 // INI IAXIS 4081 AABG: Se crea funcion para obtener todos los Sperson y NNumide seleccionados
    private String obtenerInfoPersonas(HttpServletRequest request, int operacion) throws Exception {
        String resultado = "";
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        
        List listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
        if(listaAsegurados != null) {
            if(listaAsegurados.size() <= 0) {
                formdata.put("flujo_eliminar", true);
                formdata.put("LSTPRODUCTOS", (List)request.getSession().getAttribute("LSTPRODUCTOS"));
                throw new Exception("Debe seleccionar al menos un asegurado");
            }else {
                HashMap OB_IAX_PERSONAS = new HashMap();
                for(int i = 0;i<listaAsegurados.size();i++){
                    OB_IAX_PERSONAS = new HashMap();
                    OB_IAX_PERSONAS =(HashMap) ((HashMap)listaAsegurados.get(i)).get("OB_IAX_TOMADORES");
                    if(operacion == 1) {
                        resultado = resultado + OB_IAX_PERSONAS.get("SPERSON") + ";";   
                    }else {
                        resultado = resultado + OB_IAX_PERSONAS.get("NNUMIDE") + ";";   
                    }       
                }
            }       
        }else {
            throw new Exception("Debe seleccionar al menos un asegurado");
        }
        return resultado;
    }
 // FIN IAXIS 4081 AABG: Se crea funcion para obtener todos los Sperson seleccionados
    
 // FIN IAXIS 4081 AABG: Funcion para establecer la propiedad VALOR (prod-tasa-prima) de un asegurado en la consulta
    private String obtenerPropiedadValor(BigDecimal codConvenio, List listaAseg, ArrayList prods, HttpServletRequest request, Axiscomi013Action thisAction, int opcion, BigDecimal codGarantia) {
        String respuesta = "";
        try {
            PAC_IAX_COMISIONEGOCIO pac_iax_comisionegocio = new PAC_IAX_COMISIONEGOCIO((Connection)request.getAttribute(Constantes.DB01CONN));   
            if(codConvenio != null && codConvenio.compareTo(BigDecimal.ZERO) > 0) {
                HashMap OB_IAX_TOMADORES = new HashMap();
                OB_IAX_TOMADORES =(HashMap) ((HashMap)listaAseg.get(0)).get("OB_IAX_TOMADORES");
                String asegur = OB_IAX_TOMADORES.get("NNUMIDE").toString();
                HashMap r = (HashMap)prods.get(0);
                String codProd = r.get("SPRODUC").toString();
                
                Map m = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(codConvenio, new BigDecimal(asegur), new BigDecimal(codProd), new BigDecimal(opcion), codGarantia);
                tratarRETURNyMENSAJES(request,m);   
                BigDecimal dato = (BigDecimal)m.get("RETURN");
                respuesta = dato != null ? dato.toString() : "";
                
            }
        }catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo obtenerPropiedadValor", 
                    e);
           thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
       } finally {
           this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
       }
        return respuesta;
    }
    
    //INI IAXIS 4081 AABG: Funcion para obtener los valores de garantias del producto
    public String obtenerValoresProducto(String productoActual, ArrayList productos) {
        String valor = "";
        if(productos != null && productos.size() > 0) {
            HashMap OB_IAX_PRODUCTOS = new HashMap();
            for(int i=0; i<productos.size(); i++) {
                OB_IAX_PRODUCTOS = new HashMap();
                OB_IAX_PRODUCTOS =(HashMap) (HashMap)productos.get(i);
                if(OB_IAX_PRODUCTOS.get("SPRODUC").toString().contentEquals(productoActual)) {
                    valor = OB_IAX_PRODUCTOS.get("VALORES") != null ? OB_IAX_PRODUCTOS.get("VALORES").toString() : "";
                }
            }
        }
        return valor;
    }
   //FIN IAXIS 4081 AABG: Funcion para obtener los valores de garantias del producto
    
 // INI IAXIS 4081 AABG: Funcion para obtener el valor de la tasa desde BD
    private String obtenerTasas(BigDecimal codConvenio, BigDecimal codProducto, HttpServletRequest request, Axiscomi013Action thisAction) {
        String respuesta = "";
        try {
            PAC_IAX_COMISIONEGOCIO pac_iax_comisionegocio = new PAC_IAX_COMISIONEGOCIO((Connection)request.getAttribute(Constantes.DB01CONN));   
            if(codConvenio != null && codConvenio.compareTo(BigDecimal.ZERO) > 0) {
                
                HashMap map = new HashMap();
                map = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(codProducto,null,null);
                List listaGarantias = (List)tratarRETURNyMENSAJES(request, map,false);
                HashMap OB_IAX_GARANTIAS = new HashMap();
                if(listaGarantias != null && listaGarantias.size() > 0) {
                    for(int i = 0;i<listaGarantias.size();i++) {
                        OB_IAX_GARANTIAS = new HashMap();
                        OB_IAX_GARANTIAS =(HashMap) (HashMap)listaGarantias.get(i);
                        
                          // INI TASK 72 EDSS
                         // TASA = 1 | PRIMA NUEVA = 33 | PRIMA ENDOSO = 44
                         Map m = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(codConvenio, 
                                                                                                       new BigDecimal(0), 
                                                                                                       codProducto, 
                                                                                                       new BigDecimal(1),// TASA = 1  
                                                                                                       new BigDecimal(OB_IAX_GARANTIAS.get("CGARANT").toString()));
                         
                        Map m1 = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(codConvenio, 
                                                                                                       new BigDecimal(0), 
                                                                                                       codProducto, 
                                                                                                       new BigDecimal(33),// PRIMA NUEVA = 33 
                                                                                                       new BigDecimal(OB_IAX_GARANTIAS.get("CGARANT").toString()));
                        
                        Map m2 = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(codConvenio, 
                                                                                                        new BigDecimal(0), 
                                                                                                        codProducto, 
                                                                                                        new BigDecimal(44),// PRIMA ENDOSO= 44 
                                                                                                        new BigDecimal(OB_IAX_GARANTIAS.get("CGARANT").toString()));
                        tratarRETURNyMENSAJES(request,m);   
                        BigDecimal dato = (BigDecimal)m.get("RETURN");
                        BigDecimal pNueva = (BigDecimal)m1.get("RETURN");
                        BigDecimal pEndoso = (BigDecimal)m2.get("RETURN");
                        if(dato != null && dato.compareTo(BigDecimal.ZERO) > 0 && pEndoso != null && pEndoso.compareTo(BigDecimal.ZERO)>0 || pNueva != null && pNueva.compareTo(BigDecimal.ZERO) > 0) {
                            respuesta = respuesta + OB_IAX_GARANTIAS.get("CGARANT").toString() + "-" + dato.toString()+ "-" + pNueva.toString()+ "-" + pEndoso.toString() + "-~";
                        }
                        if(pNueva == null || pEndoso == null)
                            respuesta = respuesta + OB_IAX_GARANTIAS.get("CGARANT").toString() + "-" + dato.toString()+"-~"; 
                        //FIN TASK 72 EDSS
                    }                   
                }
            }
        }catch (Exception e) {
            logger.error("Error en el servicio Axiscomi013Service - mÃƒÂ©todo obtenerPropiedadValor", 
                    e);
           thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
       } finally {
           this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
       }
        return respuesta;
    }
 // FIN IAXIS 4081 AABG: Funcion para obtener el valor de la tasa desde BD   
    
  //INI IAXIS 4081 AABG: Funcion para validar que todas las tasas de los productos se encuentren diligenciadas
    public boolean validarInformacionTasas(ArrayList productos) {
        if(productos != null && productos.size() > 0) {
            HashMap OB_IAX_PRODUCTOS = new HashMap();
            for(int i=0; i<productos.size(); i++) {
                OB_IAX_PRODUCTOS = new HashMap();
                OB_IAX_PRODUCTOS =(HashMap) (HashMap)productos.get(i);
                if(OB_IAX_PRODUCTOS.get("VALORES") == null || OB_IAX_PRODUCTOS.get("VALORES").toString() == "") {
                    return false;
                }
            }
        }
        return true;
    }
  //FIN IAXIS 4081 AABG: Funcion para validar que todas las tasas de los productos se encuentren diligenciadas
}
