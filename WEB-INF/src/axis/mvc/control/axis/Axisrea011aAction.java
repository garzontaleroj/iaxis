//Revision:# qB5hxxwPvTmB084Tb/qTdA== #
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
import axis.service.axis.Axisrea011aService;

/**
 * Axisrea011aService.java 29/06/2008
 */
public class Axisrea011aAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea011aService miServicio = new Axisrea011aService();

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
		logger.debug("Axisrea011aService Init");
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
		logger.debug("Axisrea011aService Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward descargar_reporte(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		logger.debug("Axisrea011aService Buscar");
		miServicio.m_descargar_reporte(request, this);
		// return this.form(mapping, form, request, response);
		return mapping.findForward("json"); // json ya esta predefindo como
											// mapping

	}

	public ActionForward tunnel_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_tunnel_doc(request, response);
		return this.form(mapping, form, request, response);
	}
}