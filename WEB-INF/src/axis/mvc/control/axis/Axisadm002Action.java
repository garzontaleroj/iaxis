package axis.mvc.control.axis;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisadm002Service;

/**
 * Axisadm002Action.java 04/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class Axisadm002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm002Service miServicio = new Axisadm002Service();

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
		logger.debug("Axisadm002Action Init");
		request.getSession().removeAttribute("REC_LSTRECIBOS");
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
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm002Action Form");
		miServicio.m_form(request);

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
	public ActionForward salir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm002Action salir");

		if (request.getParameter("paginar") == null) {
			/* Quitar ciertos datos de otros productos que hayan quedado en Session */

			Enumeration<String> attributeNames = request.getSession().getAttributeNames();

			while (attributeNames.hasMoreElements()) {
				String attribute = attributeNames.nextElement();
				if (attribute.startsWith("REC_"))
					request.getSession().removeAttribute(attribute);
			}
		}

		return mapping.findForward("ajax");
	}

	/**
	 * 
	 * @param mapping
	 * @param unificar recibo
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward desunificar_recibos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm003Action desUnificar recibos");
		miServicio.m_desunificar_recibos(request);

		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param unificar recibo
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward unificar_recibos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm002Action Unificar recibos");
		miServicio.m_unificar_recibos(request);

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		miServicio.m_form(request);
		return mapping.findForward("form");
	}

}