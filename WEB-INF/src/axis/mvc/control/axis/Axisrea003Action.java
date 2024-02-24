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
import axis.service.axis.Axisrea003Service;

/**
 * Axisrmb003Action.java 20/08/2008
 * 
 * @author <a href="icanada@csi-ti.com">Iv�n Ca�ada</a>
 */
public class Axisrea003Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea003Service miServicio = new Axisrea003Service();

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
		logger.debug("Axisrea003Action Init");

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
		logger.debug("Axisrea003Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");

	}

	public ActionForward guardar_contrato(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea003Action guardar_contrato");
		miServicio.m_guardar_contrato(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_tramo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea003Action borrar_tramo");
		miServicio.m_borrar_tramo(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_cuadro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea003Action borrar_cuadro");
		miServicio.m_borrar_cuadro(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ActualitzarDisplays(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		/*
		 * if (request.getParameter("paginar") != null
		 * ||request.getParameter("subpantalla" ) != null){ String operation =
		 * request.getParameterValues("subpantalla")[request.getParameterValues(
		 * "subpantalla").length - 1]; logger.debug(operation);
		 * request.setAttribute("subpantalla", operation); }
		 */
		logger.debug("Axisrea003Action ActualizarDisplays");
		miServicio.m_ActualitzarDisplays(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ModificarContrato(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisrea003Action ModificarContrato");
		miServicio.m_ModificarContrato(request, this);
		return mapping.findForward("form");
	}

	public ActionForward BorrarObjCache(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisrea003Action BorrarObjCache");
		miServicio.m_BorrarObjCache(request, this);
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
	public ActionForward actualizar_combos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea003Action actualizar_combos");

		miServicio.m_ajax_actualizar_combos(request);

		return mapping.findForward("ajax");
	}

	public ActionForward delete_contrato(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea003Action delete_contrato");

		miServicio.m_delete_contrato(request);

		return mapping.findForward("ajax");
	}

}
