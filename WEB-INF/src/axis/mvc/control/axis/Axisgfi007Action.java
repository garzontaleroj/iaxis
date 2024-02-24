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
import axis.service.axis.Axisgfi007Service;

/**
 * Axisgfi007Action.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 */
public class Axisgfi007Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisgfi007Service miServicio = new Axisgfi007Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi007Action Init");

		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward borrar_errores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi007Action Init");
		return mapping.findForward("form");
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi007Action Form");
		miServicio.m_form(request);

		return mapping.findForward("form");

	}

	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi007Action Consultar");
		miServicio.m_consultar(request);
		return mapping.findForward("form");

	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi007Action Guardar");
		miServicio.m_guardar(request);
		return mapping.findForward("form");

	}

	public ActionForward borrar_bucle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi007Action Guardar");
		miServicio.m_borrar_bucle(request);
		return mapping.findForward("form");

	}

}
