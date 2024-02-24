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
import axis.service.axis.Axiscoa001Service;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * CONSULTA CUENTAS COASEGURO - AXISCOA080 segun analisis!
 */
public class Axiscoa001Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscoa001Service miServicio = new Axiscoa001Service();

	public ActionForward itemchangesjaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_itemchangesjaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa001Action Init");
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa001Action Buscar");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa001Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward recargar_pantalla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa001Action recargar_pantalla");
		miServicio.m_recargar_pantalla(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward recuperarsprocesajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_recuperarsprocesajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa001Action cancelar");
		miServicio.m_cancelar(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward liquidar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa001Action Buscar");
		miServicio.m_liquidar(request, this);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward descargar_reporte(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		logger.debug("Axiscoa001Action Buscar");
		miServicio.m_descargar_reporte(request, this);
		// return this.form(mapping, form, request, response);
		return mapping.findForward("json"); // json ya esta predefindo como
											// mapping

	}

	public ActionForward tunnel_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_tunnel_doc(request, response);
		return this.form(mapping, form, request, response);
	}
}
