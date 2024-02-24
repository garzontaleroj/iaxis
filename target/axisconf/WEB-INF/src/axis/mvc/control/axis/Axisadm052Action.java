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
import axis.service.axis.Axisadm052Service;

/**
 * Axisadm052Action.java
 * 
 * @since Java 5.0
 */
public class Axisadm052Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm052Service miServicio = new Axisadm052Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm052Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm052Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm052Action buscar");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward montar_fichero(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm052Action montar_fichero");
		miServicio.m_montar_fichero(request);
		return mapping.findForward("form");
	}

	public ActionForward traspasar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm052Action traspasar");
		miServicio.m_traspasar(request);
		return mapping.findForward("form");
	}

	public ActionForward contabiliza_diario(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm052Action contabiliza_diario");
		miServicio.m_contabiliza_diario(request);
		return mapping.findForward("form");
	}

	public ActionForward filtrar_buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm052Action filtrar_buscar");
		miServicio.m_filtrar_buscar(request);
		return this.form(mapping, form, request, response);
	}

}