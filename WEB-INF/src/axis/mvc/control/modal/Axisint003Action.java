
/**
 * Axisint003Action.java
 * 30/06/2010
 * @author <a href="pfeliu@csi-ti.com">Pablo Feliu</a>
 */
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
import axis.service.modal.Axisint003Service;

public class Axisint003Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisint003Service miServicio = new Axisint003Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint003Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint003Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward grabar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint003Action Grabar");
		miServicio.m_grabar(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * Metodos AJAX
	 ********************************************************/
	/*********************************************************************************************************************/
	public ActionForward ajax_grabar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint003Action ajax_grabar");
		miServicio.m_ajax_grabar(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_setcestado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint003Action ajax_setcestado");
		miServicio.m_ajax_setCestado(request, this);
		return mapping.findForward("ajax");
	}

}
