
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
import axis.service.axis.Axislist004Service;

/**
 * NOMBRE: Axislist004Action.java Referencia:
 * http://mantis.srvcsi.com/view.php?id=27005#c145079 Pantallas de mantenimiento
 * de listados/reports
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 24/05/2013 ECG Versi�n inicial
 */
public class Axislist004Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axislist004Service miServicio = new Axislist004Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist004Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist004Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward recuperar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist004Action Form");
		miServicio.m_recuperar(request, this);
		return this.form(mapping, form, request, response);
	}

	/*
	 * public ActionForward alta(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { log.info("Axislist004Action Form");
	 * miServicio.m_alta(request, this); miServicio.m_recuperar(request, this);
	 * return this.form(mapping, form, request, response); }
	 */

	public ActionForward nuevo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist004Action Form");
		miServicio.m_nuevo(request, this);
		return this.form(mapping, form, request, response);
	}

	/*
	 * public ActionForward modificar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { log.info("Axislist004Action Form");
	 * miServicio.m_modificar(request, this); miServicio.m_recuperar(request, this);
	 * return this.form(mapping, form, request, response); }
	 */

	/*
	 * public ActionForward aceptar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { log.info("Axislist004Action aceptar");
	 * miServicio.m_aceptar(request, this); return this.form(mapping, form, request,
	 * response); }
	 */

	public ActionForward miajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_miajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		log.info("Axislist004Action guardar");
		miServicio.m_guardar(request, this);
		miServicio.m_recuperar(request, this);
		return this.form(mapping, form, request, response);
	}
}
