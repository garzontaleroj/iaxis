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
import axis.service.axis.Axisrea045Service;

public class Axisrea045Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea045Service miServicio = new Axisrea045Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea045Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea045Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizarPorcentajeCesion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axissin006Action reaseguro");
		miServicio.m_actualizarPorcentajeCesion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward validaFechas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro");
		miServicio.m_validaFechas(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward busca_cesiones_manuales(ActionMapping mapping, ActionForm form, HttpServletRequest request,

			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro");
		miServicio.m_busca_cesiones_manuales(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ejecutarSimulacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro ejecutarSimulacion");
		miServicio.m_ejecutarSimulacion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward nuevaCesion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro ejecutarSimulacion");
		miServicio.m_nuevaCesion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward compruebaPorcentajes(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro compruebaPorcentajes");
		miServicio.m_compruebaPorcentajes(request, this);
		return mapping.findForward("form");
	}

	public ActionForward salirPrincipal(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro salirPrincipal");
		return mapping.findForward("cancelar");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro cancelar");
		miServicio.m_cancelar(request, this);
		return mapping.findForward("cancelar");
	}

	public ActionForward actualizaTramo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro cancelar");
		miServicio.m_actualizaTramo(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ejecutarBorrado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea045Action reaseguro cancelar");
		miServicio.m_ejecutarBorrado(request, this);
		return this.form(mapping, form, request, response);
	}

}
