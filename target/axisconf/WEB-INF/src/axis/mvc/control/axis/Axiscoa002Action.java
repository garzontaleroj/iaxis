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
import axis.service.axis.Axiscoa002Service;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * MANTENIMIENTO CUENTAS Y LIQUIDACI�N COA. - AXISCOA081 segun analisis!
 */
public class Axiscoa002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscoa002Service miServicio = new Axiscoa002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscoa002Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscoa002Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward recuperar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscoa002Action recuperar");
		miServicio.m_recuperar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward delete_linea(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscoa002Action delete_linea");
		miServicio.m_delete_linea(request, this);
		miServicio.m_recuperar(request, this);
		return this.form(mapping, form, request, response);
	}

	/*
	 * public ActionForward liquidar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { log.info("Axiscoa002Action liquida");
	 * miServicio.m_liquidar(request, this); miServicio.m_recuperar(request, this);
	 * return this.form(mapping, form, request, response); }
	 */

	public ActionForward recuperarsprocesajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_recuperarsprocesajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

}
