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
import axis.service.modal.Axisusu006Service;

/**
 * Axisusu006Action.java
 * 07/11/2008
 * @author <a href="xgallego@csi-ti.com">Xavier Gallego</a>
 * @since Java 5.0
 */

/**
 * Axisusu006Action.java 10/12/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastor</a>
 * @since Java 5.0 Reestructuraci� Manteniment Usuaris (Actions, Services)
 */
public class Axisusu006Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisusu006Service miServicio = new Axisusu006Service();

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
		logger.debug("Axisusu006Action Init");
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
		logger.debug("Axisusu006Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
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
	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisusu006Action aceptar");
		miServicio.m_aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

}
