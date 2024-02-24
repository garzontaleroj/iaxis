package axis.mvc.control.axis;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisrmb002Service;
import axis.util.Constantes;

/**
 * Axisrmb002Action.java 20/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class Axisrmb002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrmb002Service miServicio = new Axisrmb002Service();

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
		logger.debug("Axisrmb002Action Init");

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
	public ActionForward borrar_errores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrmb002Action Init");
		miServicio.m_borrar_errores(request);
		miServicio.m_form(request);
		return mapping.findForward("form");
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
		logger.debug("Axisrmb002Action Form");
		miServicio.m_form(request);

		return mapping.findForward("form");

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
	public ActionForward salir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrmb002Action salir");

		if (request.getParameter("paginar") == null) {
			/* Quitar ciertos datos de otros productos que hayan quedado en Session */

			Enumeration<String> attributeNames = request.getSession().getAttributeNames();

			while (attributeNames.hasMoreElements()) {
				String attribute = attributeNames.nextElement();
				if (attribute.startsWith("RMB_"))
					request.getSession().removeAttribute(attribute);
			}
		}

		return mapping.findForward("ajax");
	}

	/* FUNCIONES AJAX */

	public ActionForward seleccionar_documentacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_seleccionar_documentacion(request);
		return mapping.findForward("ajax");
	}

	public ActionForward consultar_pol(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisrmb002Action consultar");
		miServicio.m_consultar_pol(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultar_pol"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisrmb002.do?operation=volver_pol"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver_pol(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrmb002Action volver_pol");
		miServicio.m_volver_pol(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward control_acto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrmb002Action control_acto");
		miServicio.m_control_acto(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_act_factura(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrmb002Action ajax_act_factura");
		miServicio.m_ajax_act_factura(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_edit_factura(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrmb002Action ajax_edit_factura");
		miServicio.m_ajax_edit_factura(request);
		return mapping.findForward("ajax");
	}

}