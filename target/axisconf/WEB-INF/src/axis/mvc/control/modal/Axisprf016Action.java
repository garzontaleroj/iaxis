package axis.mvc.control.modal;

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
import axis.service.modal.Axisprf016Service;

/**
 * Axisprf016Action.java
 * 
 * @since Java 5.0
 */
public class Axisprf016Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisprf016Service miServicio = new Axisprf016Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisprf016Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisprf016Action Form");

		miServicio.m_form(request);
		return mapping.findForward("form");

	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisprf016Action actualizardoc");

		miServicio.m_guardar(request);
		return this.form(mapping, form, request, response);

	}

	/* INI-WAJ */
	public ActionForward ajax_busqueda_tip_indica(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf016Action ajax_busqueda_tip_indica");
		miServicio.m_ajax_busqueda_tip_indica(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_tip_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf016Action ajax_busqueda_tip_agente");
		miServicio.m_ajax_busqueda_tip_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward guardarindica(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisprf016Action guardarindica");

		miServicio.m_guardarindica(request);
		return this.form(mapping, form, request, response);

	}
	/* FIN-WAJ */

}
