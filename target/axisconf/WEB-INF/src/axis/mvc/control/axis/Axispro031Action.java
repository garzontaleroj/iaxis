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
import axis.service.axis.Axispro031Service;

public class Axispro031Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro031Service miServicio = new Axispro031Service();

	/**
	 * Es llamado para editar una actividad. Se produce al darle al bot�n
	 * corrspondiente Luego ejecuta el m�todo Form.
	 * 
	 * @since Java 5.0
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@SuppressWarnings("unchecked")
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro031Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizarISSELEC(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro031Action actualizarISSELEC");
		miServicio.m_actualizarISSELEC(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward duplicar_actividad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro031Action duplicar_actividad");
		miServicio.m_duplicar_actividad(request, this);
		return mapping.findForward("saltar");
	}

	public ActionForward volverDuplicar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action volverActividad");
		miServicio.m_volverDuplicar(request, this);
		return this.form(mapping, form, request, response);
	}
}
