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
import axis.service.axis.Axisren002Service;

/**
 * Axisren002Action.java 04/07/2008
 * 
 */
public class Axisren002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisren002Service miServicio = new Axisren002Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisren002Action Init");
		miServicio.m_init(request, this);
		if (request.getParameter("paginar") == null) {
		}

		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisren002Action Form");
		miServicio.m_form(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisren002Action aceptar");
		miServicio.m_aceptar(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisren002Action buscar");
		miServicio.m_buscar(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return this.form(mapping, form, request, response);
	}

	/*
	 * *****************************************************************************
	 * *****
	 */
	/*
	 * ******************************** nuevas funciones
	 * ********************************
	 */
	/*
	 * *****************************************************************************
	 * *****
	 */

	public ActionForward ajax_blogproxpagos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_ajax_bloq_proxpagos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_calcrentas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_ajax_calc_rentas(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actpagosrenta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_ajax_act_pagorenta(request);
		return mapping.findForward("ajax");
	}

}
