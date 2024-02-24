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
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr093Service;

public class Axisctr093Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr093Service miServicio = new Axisctr093Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action Form");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_poliza_destino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr093Action ajax_poliza_destino");
		miServicio.m_ajax_poliza_destino(request);
		return mapping.findForward("ajax");
	}

	public ActionForward confirmar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action confirmar");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_confirmar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward demorar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action demorar");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_demorar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward rechazar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action rechazar");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_rechazar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward anular(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action anular");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_anular(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward grabar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action grabar");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_grabar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward desconfirmar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action desconfirmar");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_desconfirmar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward traspasar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action traspasar");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_traspasar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward infoDatosFiscales(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr093Action infoDatosFiscales");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_infoDatosFiscales(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_ccodpla_traspas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr093Action ajax_ccodpla_traspas");
		miServicio.m_ajax_ccodpla_traspas(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_ccompani_traspas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr093Action ajax_ccompani_traspas");
		miServicio.m_ajax_ccompani_traspas(request);
		return mapping.findForward("ajax");
	}
}
