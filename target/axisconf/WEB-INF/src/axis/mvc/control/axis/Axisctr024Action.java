//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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
import axis.service.axis.Axisctr024Service;

public class Axisctr024Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr024Service miServicio = new Axisctr024Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr024Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr024Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward emitirPropuesta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr024Action emitirPropuesta");
		miServicio.m_emitirPropuesta(request);
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr024Action aceptar");
		miServicio.m_aceptar(request);
		return mapping.findForward("ajax");
	}

	/** Added for back button (IAXIS-4321) PK-16/06/2019 Start */
	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr024Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	/** Added for back button (IAXIS-4321) PK-16/06/2019 End */

	public ActionForward aceptar_modif_prop(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr024Action m_aceptar_modif_prop");
		miServicio.m_aceptar_modif_prop(request);
		return mapping.findForward("ajax");
	}

	public ActionForward guardar_prop(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr024Action guardar_prop");
		miServicio.m_guardar_prop(request);
		return mapping.findForward("ajax");
	}

	// INI 18351: LCOL003 - Documentaci�n requerida en contrataci�n y suplementos
	public ActionForward ajax_valdocrequerida(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr009Action valdocrequerida");
		miServicio.m_ajax_valdocrequerida(request);
		return mapping.findForward("ajax");
	}

	// FI 18351: LCOL003 - Documentaci�n requerida en contrataci�n y suplementos

	// INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos
	public ActionForward preguntaProgagaSupl(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr024Action preguntaProgagaSupl");
		miServicio.m_preguntaProgagaSupl_json(request);
		return mapping.findForward("json");
	}

	// FI INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos

	// INICIO CONF-172
	public ActionForward guardar_supl(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr024Action guardar_prop");
		miServicio.m_guardar_supl(request);
		return mapping.findForward("ajax");
	}// FIN CONF-172
}