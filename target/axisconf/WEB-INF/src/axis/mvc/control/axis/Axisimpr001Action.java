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
import axis.service.axis.Axisimpr001Service;

/**
 * Axisimpr001Action.java 04/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class Axisimpr001Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisimpr001Service miServicio = new Axisimpr001Service();

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
		logger.debug("Axisimpr001Action Init");
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
		logger.debug("Axisimpr001Action Form");
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
		logger.debug("Axisimpr001Action salir");

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
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward imprimir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisimpr001Action imprimir");
		miServicio.m_imprimir(request);

		return mapping.findForward("form");
	}
}