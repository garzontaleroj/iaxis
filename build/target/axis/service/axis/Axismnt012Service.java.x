package axis.service.axis;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REHABILITA;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axismnt012Action;
import axis.mvc.control.axis.Axisadm004Action;
import axis.mvc.control.axis.Axisctr093Action;
import axis.mvc.control.axis.Axissin006Action;
import axis.mvc.model.UsuarioBean;

import axis.util.Constantes;
import axis.util.ConversionUtil;

import java.math.BigDecimal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
      NOMBRE:    Axismnt012Service.java
      @author XPL
      Fecha: 10/05/2010
      PROP�SITO (descripci�n Service): 
      Ejemplo : Mantenimiento de logs de procesos de carga
  
      REVISIONES:
      Ver        Fecha        Autor             Descripci�n
      ---------  ----------  ---------------  ------------------------------------
      1.0        10/05/2010   XPL(iniciales)     1. Creaci�n del Service. 14455: ENSA101 - Proc�s de c�rrega de fitxers
 */
public class Axismnt012Service extends AxisBaseService {
    Log logger = LogFactory.getLog(this.getClass());

    /*********************************************************************************************************************/
    /*********************************************** M�TODOS DE INICIALIZACION *******************************************/
    /*********************************************************************************************************************/

    /**
     * M�todo que se llama al inicio de este flujo. 
     * Puede servirnos para inicializar variables.
     * 
     * @param request
     * @param thisAction
     */
    public void m_init(HttpServletRequest request, 
                       Axismnt012Action thisAction) {
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);
        try {

        } catch (Exception e) {
            thisAction.guardarMensaje(request, "1000050", 
                                      new Object[] { e.toString() }, 
                                      Constantes.MENSAJE_ERROR);
        } finally {
            this.configForm(request, whoami(this));
            this.cargaDependencias(request, 
                                   (List)request.getAttribute("DEPENDENCIAS"));
        }

    }

    /**
     * 
     * @param request
     */
    @SuppressWarnings("all")
    public void m_form(HttpServletRequest request, 
                       Axismnt012Action thisAction) {
        logger.debug("Axismnt012Service m_form");
        UsuarioBean usuario = 
            (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);
        //Metode que ens formatejar� tots els imports, Sistema europeo o americ�
        //En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
        this.formattingNumericValues(request);

        try {

            PAC_IAX_GESTION_PROCESOS pac_axis_procesos = 
                new PAC_IAX_GESTION_PROCESOS(usuario.getConnection());

            BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
            BigDecimal NLINEA = this.getCampoNumerico(request, "NLINEA");
            BigDecimal NERROR = this.getCampoNumerico(request, "NERROR");
            String TFICHERO = this.getCampoTextual(request, "TFICHERO");
            java.sql.Date FINI = 
                this.stringToSqlDate(this.getCampoTextual(request, "FINI"));
            java.sql.Date FFIN = 
                this.stringToSqlDate(this.getCampoTextual(request, "FFIN"));
            BigDecimal CESTADO = this.getCampoNumerico(request, "CESTADO");


            Map map = 
                pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERA(SPROCES, 
                                                                                             TFICHERO, 
                                                                                             FINI, 
                                                                                             FFIN, 
                                                                                             CESTADO);
            logger.debug(map);
            if (((BigDecimal)this.tratarRETURNyMENSAJES(request, 
                                                        map)).intValue() == 
                0) {
                    formdata.put("ctrlCabecera", map.get("PCURCARGA"));
                 
                    if (!isEmpty(map.get("PCURCARGA")) && isEmpty(SPROCES)){
                        ArrayList carga = (ArrayList)map.get("PCURCARGA");
                        if (carga.size()> 0){ 
                            Map m = (Map)carga.get(0);
                            SPROCES = new BigDecimal(String.valueOf( m.get("SPROCES")));
                            formdata.put("SPROCES",SPROCES);
                        }
                    }

                    map = 
    pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA(SPROCES,NLINEA);
                    logger.debug(map);
                    if (((BigDecimal)this.tratarRETURNyMENSAJES(request, 
                                                                map)).intValue() == 
                        0){
                        formdata.put("ctrlLinea", map.get("PCURCARGALINEA"));
                            if (!isEmpty(map.get("PCURCARGALINEA")) && isEmpty(NLINEA)){
                                ArrayList PCURCARGALINEA = (ArrayList)map.get("PCURCARGALINEA");
                                if (PCURCARGALINEA.size()> 0){ 
                                    Map m = (Map)PCURCARGALINEA.get(0);
                                    NLINEA = new BigDecimal(String.valueOf( m.get("NLINEA")));
                                    formdata.put("NLINEA",NLINEA);
                                }
                            }
                                        map = 
                        pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA_ERROR(SPROCES,NLINEA,NERROR);
                                        logger.debug(map);
                                        if (((BigDecimal)this.tratarRETURNyMENSAJES(request, 
                                                                                    map)).intValue() == 
                                            0){
                                                formdata.put("ctrlLineaError", map.get("PCURCARGALINEA_ERRS"));
                                                if (!isEmpty(map.get("PCURCARGALINEA_ERRS")) && isEmpty(NERROR)){
                                                    ArrayList PCURCARGALINEA_ERRS = (ArrayList)map.get("PCURCARGALINEA_ERRS");
                                                    if (PCURCARGALINEA_ERRS.size()> 0){ 
                                                        Map m = (Map)PCURCARGALINEA_ERRS.get(0);
                                                        NERROR = new BigDecimal(String.valueOf( m.get("NERROR")));
                                                        formdata.put("NERROR",NERROR);
                                                    }
                                                }
                                            }
                        }
             }


            this.m_cargarCombos(request, thisAction);

        } catch (Exception e) {
            logger.error("Error en el servicio Axismnt012Service - m�todo m_form", 
                         e);
            thisAction.guardarMensaje(request, "1000050", 
                                      new Object[] { e.toString() }, 
                                      Constantes.MENSAJE_ERROR);
        } finally {

            this.configForm(request, whoami(this));
            this.cargaDependencias(request, 
                                   (List)request.getAttribute("DEPENDENCIAS"));
        }
    }

    /**
     * Metodo que cargar� la lista de valores de la pantalla.
     * XPL 03052010 BUG XXX
     * @param request
     */
    private void m_cargarCombos(HttpServletRequest request, 
                                Axismnt012Action thisAction) {
        logger.debug("Axismnt012Service m_cargarCombos");
        UsuarioBean usuario = 
            (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);

        try {

            
                 
            
            

        } catch (Exception e) {
            logger.error("Error en el servicio Axismnt012Service - m�todo m_cargarCombos", 
                         e);
            thisAction.guardarMensaje(request, "1000050", 
                                      new Object[] { e.toString() }, 
                                      Constantes.MENSAJE_ERROR);
        }
    }
    /*********************************************************************************************************************/
    /*********************************************** Metodos AJAX *********************************************/
    /*********************************************************************************************************************/    
     public void m_ajax_busqueda_lineas(HttpServletRequest request) {
         logger.debug("Axismnt012Service m_ajax_busqueda_lineas");
         UsuarioBean usuario = 
             (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
         HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);             
         AjaxContainerService ajax = new AjaxContainerService();
         try {
          
             PAC_IAX_GESTION_PROCESOS pac_axis_procesos = 
                 new PAC_IAX_GESTION_PROCESOS(usuario.getConnection());
             BigDecimal SPROCES = this.getCampoNumerico(request,"SPROCES");
             BigDecimal NLINEA = this.getCampoNumerico(request,"NLINEA");

             Map map =
             pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA(SPROCES,NLINEA);
             logger.debug(map);
             if (((BigDecimal)this.tratarRETURNyMENSAJES(request, 
                                                         map)).intValue() == 
                 0){
                     formdata.put("ctrlLinea",map.get("PCURCARGALINEA") );
                     if (!isEmpty(map.get("PCURCARGALINEA")) && isEmpty(NLINEA)){
                         ArrayList PCURCARGALINEA = (ArrayList)map.get("PCURCARGALINEA");
                         if (PCURCARGALINEA.size()> 0){ 
                             Map m = (Map)PCURCARGALINEA.get(0);
                             NLINEA = new BigDecimal(String.valueOf( m.get("NLINEA")));
                             formdata.put("NLINEA",NLINEA);
                         }
                     }
                     ajax.rellenarPlAContenedorAjax(map);
                     ajax.guardarContenidoFinalAContenedorAjax(map);
                 }
         } catch (Exception e) {
             logger.error("Error en el servicio Axismnt012Service - m�todo m_ajax_busqueda_lineas", 
                          e);
             ajax.rellenarExcepcionAContenedorAjax(e);
         } finally {
             request.setAttribute(Constantes.AJAXCONTAINER, 
                                  ajax.procesarContenedorAjax());
         }
     }
     
    public void m_ajax_busqueda_errores(HttpServletRequest request) {
        logger.debug("Axismnt012Service m_ajax_busqueda_errores");
        UsuarioBean usuario = 
            (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);             
        AjaxContainerService ajax = new AjaxContainerService();
        try {
         
            PAC_IAX_GESTION_PROCESOS pac_axis_procesos = 
                new PAC_IAX_GESTION_PROCESOS(usuario.getConnection());
            BigDecimal SPROCES = this.getCampoNumerico(request,"SPROCES");
            BigDecimal NLINEA = this.getCampoNumerico(request,"NLINEA");
            BigDecimal NERROR = this.getCampoNumerico(request,"NERROR");

            Map map = 
                        pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA_ERROR(SPROCES,NLINEA,NERROR);
                                        logger.debug(map);
                                        if (((BigDecimal)this.tratarRETURNyMENSAJES(request, 
                                                                                    map)).intValue() == 
                                            0){
                                            formdata.put("ctrlLineaError", map.get("PCURCARGALINEA_ERRS"));
                                            if (!isEmpty(map.get("PCURCARGALINEA_ERRS")) && isEmpty(NERROR)){
                                                ArrayList PCURCARGALINEA_ERRS = (ArrayList)map.get("PCURCARGALINEA_ERRS");
                                                if (PCURCARGALINEA_ERRS.size()> 0){ 
                                                    Map m = (Map)PCURCARGALINEA_ERRS.get(0);
                                                    NERROR = new BigDecimal(String.valueOf( m.get("NERROR")));
                                                    formdata.put("NERROR",NERROR);
                                                }
                                            }
                    ajax.rellenarPlAContenedorAjax(map);
                    ajax.guardarContenidoFinalAContenedorAjax(map);
                }
        } catch (Exception e) {
            logger.error("Error en el servicio Axismnt012Service - m�todo m_ajax_busqueda_errores", 
                         e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, 
                                 ajax.procesarContenedorAjax());
        }
    }
     
    public

    void m_navegar(HttpServletRequest request, 
                           Axismnt012Action thisAction) {
        logger.debug("Axismnt012Action m_navegar");
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);
        try {
        
            // Push de los datos necesarios a la pila
          
            BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
            BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
            BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
            BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
            String NSINIES = getCampoTextual(request, "NSINIES");
            String NSINIESselected = getCampoTextual(request, "NSINIESselected");
            
            BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
            BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
            
            
            thisAction.topPila(request, "SPROCES", SPROCES);
            thisAction.topPila(request, "NLINEA", NLINEA);

            thisAction.topPila(request, "SSEGURO", SSEGURO);
            thisAction.topPila(request, "SPERSON", SPERSON);
            thisAction.topPila(request, "NRECIBO", NRECIBO);
            thisAction.topPila(request, "NTRAMIT", NTRAMIT);
            thisAction.topPila(request, "NSINIES", NSINIES);
            thisAction.topPila(request, "NSINIESselected", NSINIESselected);


            thisAction.topPila(request, "formdata_axismnt012", formdata);
            this.configForm(request, this.whoami(this));
            this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));            
            
        } catch (Exception e) {
            logger.error("Error en el servicio Axissin006Service - m�todo m_consultarPoliza", 
                         e);
            thisAction.guardarMensaje(request, "1000050", 
                                      new Object[] { e.toString() }, 
                                      Constantes.MENSAJE_ERROR);
        }
    //         this.configForm(request, this.whoami(this));
    //         this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
    }

    public void m_volver(HttpServletRequest request, 
                         Axismnt012Action thisAction) {
        logger.debug("Axismnt012Action m_volver");
        HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);
        try {
            formdata.put("NSINIES", (String)thisAction.removeTopPila(request, 
                                                                                 "NSINIES"));
                                                                                 
            formdata.put("SPERSON", 
                         bigDecimalToString((BigDecimal)thisAction.removeTopPila(request, 
                                                                                 "SPERSON")));     
            formdata.put("NRECIBO", 
                         bigDecimalToString((BigDecimal)thisAction.removeTopPila(request, 
                                                                                 "NRECIBO")));
            formdata.put("NTRAMIT", 
                         bigDecimalToString((BigDecimal)thisAction.removeTopPila(request, 
                                                                                 "NTRAMIT")));                                                                                  
            formdata.put("SSEGURO", 
                         bigDecimalToString((BigDecimal)thisAction.removeTopPila(request, 
                                                                                 "SSEGURO")));

            formdata.put("SPROCES", 
                         bigDecimalToString((BigDecimal)thisAction.removeTopPila(request, 
                                                                                 "SPROCES")));       
            formdata.put("NLINEA", 
                         bigDecimalToString((BigDecimal)thisAction.removeTopPila(request, 
                                                                                 "NLINEA")));                                                                                 
                                                                                         
        } catch (Exception e) {
            logger.error("Error en el servicio Axismnt012Action - m�todo m_volver", 
                         e);
            thisAction.guardarMensaje(request, "1000050", 
                                      new Object[] { e.toString() }, 
                                      Constantes.MENSAJE_ERROR);
        }
        this.configForm(request, this.whoami(this));
        this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));         
    }
    
    

}
