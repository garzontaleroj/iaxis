package axis.mvc.control.axis;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisper048Service;
import axis.util.Constantes;

/**
 * Axisper048Action.java
 * 
 * @since Java 5.0
 */
public class Axisper048Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper048Service miServicio = new Axisper048Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper048Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper048Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * MÉTODOS DE ACTUALIZACIÓN
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper048Action Aceptar");
		miServicio.m_aceptar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper048Action Consultar");
		miServicio.m_consultar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper048Action volver");
		miServicio.m_volver(request, this);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		request.removeAttribute("subpantalla");
		return new ActionForward("/axis_axisper048.do?operation=buscar");
	}

}
