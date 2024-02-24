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
import axis.service.axis.Axissin003Service;
import axis.util.Constantes;

public class Axissin003Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axissin003Service miServicio = new Axissin003Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin003Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin003Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cargarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action cargarDatos");
		miServicio.m_cargarDatos(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/
	/*********************************************************************************************************************/

	public ActionForward consultarPoliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action consultarPoliza");
		miServicio.m_consultarPoliza(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarPoliza"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin003.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr018Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}
}