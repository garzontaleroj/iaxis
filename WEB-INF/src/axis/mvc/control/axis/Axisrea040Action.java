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
import axis.service.axis.Axisrea040Service;

/**
 *
 * @since Java 5.0
 */
public class Axisrea040Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea040Service miServicio = new Axisrea040Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward reparte(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action Reparte");
		miServicio.m_reparte(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_actualiza_version(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action actualizar_combos");
		miServicio.m_ajax_actualiza_version(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_tramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action actualizar_tramos");

		miServicio.m_ajax_actualiza_tramos(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_pantalla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action ajax_actualiza_pantalla");

		miServicio.m_ajax_actualiza_pantalla(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_garantias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action ajax_actualiza_garantias");

		miServicio.m_ajax_actualiza_garantias(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_garantias_fil(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action ajax_actualiza_garantias_fil");

		miServicio.m_ajax_actualiza_garantias_fil(request);

		return mapping.findForward("ajax");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action Cancelar");
		miServicio.m_cancelar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea040Action Guardar");
		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

}
