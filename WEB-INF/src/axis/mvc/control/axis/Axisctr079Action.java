package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr079Service;
import axis.util.Constantes;

/**
 * Axisctr079Action.java 04/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class Axisctr079Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr079Service miServicio = new Axisctr079Service();

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
		logger.debug("Axisctr079Action Init");
		miServicio.m_init(request);

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
		logger.debug("Axisctr079Action Form");

		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

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
	public ActionForward acceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr079Action aceptar");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_aceptar(request);

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
	public ActionForward ajax_recliqui(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr079Action recliqui");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_ajax_recliqui(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recliquiall(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr079Action recliquiAll");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_ajax_recliquiAll(request, this);
		return mapping.findForward("ajax");
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
	public ActionForward recliqui(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr079Action recliqui");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_ajax_recliqui(request, this);
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
	public ActionForward set_movliqui(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr079Action recliqui");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.set_movliqui(request, this);
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
	public ActionForward buscar_rec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr079Action buscar_rec");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_buscar_rec(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward consultarRebut(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr079Action consultarRebut");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		request.getSession().setAttribute("saltarRebuts", "0");
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisadm003.do?operation=init&saltar=0"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr079.do?operation=volverRec"));
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));
		this.topPila(request, "formdata_axissin006", formdata);
		return mapping.findForward("saltar");
	}

	public ActionForward volverRec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr079Action volver");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");

		String NRECIBO = AxisBaseService.getCampoTextual(request, "NRECIBO");
		Map formdata_axissin006 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin006");
		logger.debug("formdata- dp->" + formdata);
		if (!AxisBaseService.isEmpty(formdata_axissin006)) {
			formdata.putAll(formdata_axissin006);
			formdata.put("NRECIBO", NRECIBO);
			request.setAttribute(Constantes.FORMDATA, formdata);
		}
		miServicio.m_ajax_recliqui(request, this);
		return this.form(mapping, form, request, response);
		// return mapping.findForward ("ajax");
	}

}