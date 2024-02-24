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
import axis.service.axis.Axisadm031Service;

/**
 * Axisadm031Action.java 04/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class Axisadm031Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm031Service miServicio = new Axisadm031Service();

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
		logger.debug("Axisadm031Action Init");
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
		logger.debug("Axisadm031Action Form");
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
		logger.debug("Axisadm031Action aceptar");
		miServicio.m_aceptar(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward generar_listados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm031Action aceptar");
		miServicio.m_generar_listados(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward generar_cartas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm031Action aceptar");
		miServicio.m_generar_cartas(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_guardarRecRevis(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_guardarRecRevis(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_setestimp(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_setestimp(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_setcaccpre(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_setcaccpre(request);
		return mapping.findForward("ajax");
	}

}