package axis.mvc.control.axis;

import java.io.IOException;
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
import axis.service.axis.Axisadm054Service;
import axis.util.Constantes;

public class Axisadm054Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm054Service miServicio = new Axisadm054Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm054Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm054Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizar_combos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		miServicio.m_ajax_actualizar_combos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm054Action buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward calcular(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm054Action calcular");
		miServicio.m_calcular(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm054Action borrar");
		miServicio.m_borrar(request, this);
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
	public ActionForward consulta_resultado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisadm054Action consulta_resultado");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		// BigDecimal CEMPRES = AxisBaseService.getCampoNumerico(request, "CEMPRES");

		String CADENA = AxisBaseService.getCampoTextual(request, "CADENA");
		log.debug("Axisadm054Action consulta_resultado CADENA : " + CADENA);

		logger.debug("---------> ENTRO CADENA" + CADENA);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward(CADENA));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisadm054.do?operation=form"));
		return mapping.findForward("saltar");
	}

	public ActionForward montar_fichero(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm054Action montar_fichero");
		miServicio.m_montar_fichero(request, this);
		return this.form(mapping, form, request, response);
	}

}
