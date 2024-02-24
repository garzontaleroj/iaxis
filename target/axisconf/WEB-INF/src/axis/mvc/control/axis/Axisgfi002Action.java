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
import axis.service.axis.Axisgfi002Service;
import axis.util.Constantes;

public class Axisgfi002Action extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axisgfi002Action.class);

	private Axisgfi002Service miServicio = new Axisgfi002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward recarga_datos_formula(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_recargar(request, this);
		return mapping.findForward("recarga");
	}

	public ActionForward buscar_formula(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_bucar_formula(request, this);
		return mapping.findForward("form");
	}

	public ActionForward grabar_formula(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabar_formula(request, this);
		miServicio.m_recargar(request, this);
		return mapping.findForward("recarga");
	}

	/*
	 * *************************** FUNCIONES NAVAGACION APLICACIONES
	 * **********************
	 */
	public ActionForward consultar_tramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisgfi002Action consultar_tramos");
		miServicio.m_consultar_tramos(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultar_tramos"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisgfi002.do?operation=volver_tramos"));
		return mapping.findForward("saltar");
	}

	public ActionForward consultar_terminos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisgfi002Action consultar_terminos");
		miServicio.m_consultar_terminos(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultar_terminos"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisgfi002.do?operation=volver_terminos"));
		return mapping.findForward("saltar");
	}

	public ActionForward consultar_bucles(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisgfi002Action consultar_terminos");
		miServicio.m_consultar_terminos(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultar_bucles"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisgfi002.do?operation=volver_terminos"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver_tramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisgfi002Action volver_tramos");
		miServicio.m_volver_tramos(request, this);
		/*
		 * miServicio.m_recargar(request,this); BigDecimal
		 * PCLAVE=AxisBaseService.getCampoNumerico(request, "PCLAVE");
		 * log.debug("PCLAVE : "+PCLAVE); if (PCLAVE!= null) return
		 * this.buscar_formula(mapping, form, request, response); else return
		 * mapping.findForward("form");
		 */

		miServicio.m_bucar_formula(request, this);
		miServicio.m_recargar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward volver_terminos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisgfi002Action volver_terminos");
		miServicio.m_volver_terminos(request, this);
		/*
		 * miServicio.m_recargar(request,this); BigDecimal
		 * PCLAVE=AxisBaseService.getCampoNumerico(request, "PCLAVE");
		 * log.debug("PCLAVE : "+PCLAVE); if (PCLAVE!= null) return
		 * this.buscar_formula(mapping, form, request, response); else return
		 * mapping.findForward("form");
		 */

		miServicio.m_bucar_formula(request, this);
		miServicio.m_recargar(request, this);
		return mapping.findForward("form");

	}

	public ActionForward ajax_ejecutar_formula(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		log.info("Axisgfi002Action ajax_ejecutar_formula");
		miServicio.m_ajax_ejecutar_formula(request);
		return mapping.findForward("ajax");
	}

}
