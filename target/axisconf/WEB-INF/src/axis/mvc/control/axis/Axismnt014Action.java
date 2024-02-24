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
import axis.service.axis.Axismnt014Service;

public class Axismnt014Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axismnt014Service miServicio = new Axismnt014Service();

	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismnt014Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismnt014Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/**
	 */
	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismnt014Action Aceptar");
		miServicio.m_aceptar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_cargarProductos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: m_ajax_cargaragrupaciones");
		miServicio.m_ajax_cargarProductos(request);
		return mapping.findForward("ajax");
	}

}
