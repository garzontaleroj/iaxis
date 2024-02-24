//Revision:# EM4QQU3xbXsus/ma0a4WOQ== #
package axis.mvc.control.axis;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisint001Service;
import axis.util.Constantes;

/**
 * NOMBRE: Axisint001Action.java
 * 
 * @author XPL Fecha: 10/05/2010 PROP�SITO (descripci�n Action): Ejemplo :
 *         Mantenimiento de logs de procesos de carga
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 10/05/2010
 *         XPL(iniciales) 1. Creaci�n del Action. 14455: ENSA101 - Proc�s de
 *         c�rrega de fitxers
 */
public class Axisint001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisint001Service miServicio = new Axisint001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * Metodos AJAX
	 ********************************************************/

	/*********************************************************************************************************************/
	public ActionForward ajax_busqueda_lineas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action ajax_busqueda_lineas");
		miServicio.m_ajax_busqueda_lineas(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_errores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action ajax_busqueda_errores");
		miServicio.m_ajax_busqueda_errores(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_generar_resultados_map(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action ajax_generar_resultados_map");
		miServicio.m_ajax_generar_resultados_map(request);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * Metodos de Navegacion
	 ***********************************************/

	/*********************************************************************************************************************/
	public

			ActionForward navegarPoliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action navegarPoliza");
		miServicio.m_navegar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarPoliza"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisint001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward navegarPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action navegarPersona");
		miServicio.m_navegar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarPersona"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisint001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward navegarRecibo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action navegarRecibo");
		miServicio.m_navegar(request, this);
		request.getSession().setAttribute("subpantalla_mdl", "recibos");
		request.getSession().setAttribute("saltarRebuts", "0");
		request.setAttribute("buscar", "true");
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarRecibo"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisint001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward navegarSiniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action navegarSiniestro");
		miServicio.m_navegar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarSiniestro"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisint001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * Fin Navegacion
	 ******************************************************/
	/*********************************************************************************************************************/

	/*********************************************************************************************************************/
	/***********************************************
	 * Metodos de Reproceso
	 ************************************************/

	/*********************************************************************************************************************/
	public ActionForward reprocesar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action reprocesar");
		miServicio.m_reprocesar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ejecutar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action ejecutar");
		miServicio.m_ejecutar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ActualizaTablaErr(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action ActualizaTablaErr");
		miServicio.m_ActualizaTablaErr(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward busqueda_lineas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		String forward = request.getParameter("forward");

		miServicio.m_busqueda_lineas(request, this);
		if (forward != null) {
			return mapping.findForward(forward);
		}
		return mapping.findForward("form");
	}

}
