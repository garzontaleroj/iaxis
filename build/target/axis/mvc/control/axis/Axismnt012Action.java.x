package axis.mvc.control.axis;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axismnt012Service;

import axis.util.Constantes;

import java.io.IOException;

import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
      NOMBRE:    Axismnt012Action.java
      @author XPL
      Fecha: 10/05/2010
      PROPÓSITO (descripción Action): 
      Ejemplo : Mantenimiento de logs de procesos de carga
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        10/05/2010   XPL(iniciales)     1. Creación del Action. 14455: ENSA101 - Procés de càrrega de fitxers
 */
public class Axismnt012Action extends AbstractDispatchAction {

    Log logger = LogFactory.getLog(this.getClass());
    private Axismnt012Service miServicio=new Axismnt012Service();

    public ActionForward init(ActionMapping mapping, ActionForm form, 
                              HttpServletRequest request, 
                              HttpServletResponse response) throws IOException, 
                                                                   ServletException {
        log.info("Axismnt012Action Init");
        miServicio.m_init(request,this);
        return this.form(mapping,form,request,response);
    }
    public ActionForward form(ActionMapping mapping, ActionForm form, 
                              HttpServletRequest request, 
                              HttpServletResponse response) throws IOException, 
                                                                   ServletException {
        log.info("Axismnt012Action form");
        miServicio.m_form(request,this);
        return mapping.findForward("form");
    }

   
    
    /*********************************************************************************************************************/
    /*********************************************** Metodos AJAX *********************************************/
    /*********************************************************************************************************************/    
    
     public ActionForward ajax_busqueda_lineas(ActionMapping mapping, ActionForm form, 
                               HttpServletRequest request, 
                               HttpServletResponse response) throws IOException, 
                                                                    ServletException {
         log.info("Axismnt012Action ajax_busqueda_lineas");
         miServicio.m_ajax_busqueda_lineas(request);
         return mapping.findForward("ajax");
     }
     
    public ActionForward ajax_busqueda_errores(ActionMapping mapping, ActionForm form, 
                              HttpServletRequest request, 
                              HttpServletResponse response) throws IOException, 
                                                                   ServletException {
        log.info("Axismnt012Action ajax_busqueda_errores");
        miServicio.m_ajax_busqueda_errores(request);
        return mapping.findForward("ajax");
    }
     
    
    
    
    /*********************************************************************************************************************/
    /*********************************************** Metodos de Navegacion *********************************************/
    /*********************************************************************************************************************/    
  
    
   
     public ActionForward navegarPoliza (ActionMapping mapping, ActionForm form, 
                               HttpServletRequest request, 
                               HttpServletResponse response) throws IOException, 
                                                                    ServletException {
         log.info("Axismnt012Action consultarPoliza");
         miServicio.m_navegar(request, this);
         this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarPoliza"));
         this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axismnt012.do?operation=volver") );
         return mapping.findForward("saltar");
     }
    public ActionForward navegarPersona (ActionMapping mapping, ActionForm form, 
                              HttpServletRequest request, 
                              HttpServletResponse response) throws IOException, 
                                                                   ServletException {
        log.info("Axismnt012Action navegarPersona");
        miServicio.m_navegar(request, this);
        this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarPersona"));
        this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axismnt012.do?operation=volver") );
        return mapping.findForward("saltar");
    }
    public ActionForward navegarRecibo (ActionMapping mapping, ActionForm form, 
                              HttpServletRequest request, 
                              HttpServletResponse response) throws IOException, 
                                                                   ServletException {
        log.info("Axismnt012Action navegarRecibo");
        miServicio.m_navegar(request, this);
        request.getSession().setAttribute("subpantalla_mdl", "recibos");
        request.getSession().setAttribute("saltarRebuts", "0");
        request.setAttribute("buscar", "true");
        this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarRecibo"));
        this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axismnt012.do?operation=volver") );
        return mapping.findForward("saltar");
    }
    public ActionForward navegarSiniestro (ActionMapping mapping, ActionForm form, 
                              HttpServletRequest request, 
                              HttpServletResponse response) throws IOException, 
                                                                   ServletException {
        log.info("Axismnt012Action navegarSiniestro");
        miServicio.m_navegar(request, this);
        this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarSiniestro"));
        this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axismnt012.do?operation=volver") );
        return mapping.findForward("saltar");
    }

     public ActionForward volver(ActionMapping mapping, ActionForm form,  HttpServletRequest request,  HttpServletResponse response) throws IOException,  ServletException {
         log.info("Axismnt012Action volver");
         miServicio.m_volver(request, this);
         return this.form(mapping, form, request, response);
     }
     /*********************************************************************************************************************/
     /*********************************************** Fin Navegacion *********************************************/
     /*********************************************************************************************************************/    
}
