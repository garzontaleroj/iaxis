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
import axis.service.modal.Axiscoa003Service;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * ALTA Y MANTENIMIENTO CUENTAS COASEGURO - AXISCOA082 segun analisis!
 */
public class Axiscoa003Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscoa003Service miServicio = new Axiscoa003Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa003Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa003Action Form");
		miServicio.m_form(request, this);

		return mapping.findForward("form");
	}

	public ActionForward recuperar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa003Action recuperar");
		miServicio.m_recuperar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa003Action Form");
		miServicio.m_aceptar(request, this);
		miServicio.m_recuperar(request, this);
		return this.form(mapping, form, request, response);
	}

	/*
	 * public ActionForward ajax_busqueda_dh (ActionMapping mapping, ActionForm
	 * form, HttpServletRequest request, HttpServletResponse response) throws
	 * IOException, ServletException { log.debug("Axiscoa003Action ajax_buscar_dh");
	 * miServicio.m_ajax_cargar_dh (request); return mapping.findForward ("ajax"); }
	 */

}
