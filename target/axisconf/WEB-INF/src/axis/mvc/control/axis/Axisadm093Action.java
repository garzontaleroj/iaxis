/*********************************************************************************************************************/
/***********************************************JBENITEZ - APRIL 2015 - BUG 33886/199826******************************/
/*********************************************************************************************************************/
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

/***********************************************IMPORTING PACKAGES*******************************************/
import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisadm093Service;

/***********************************************
 * CLASS DEFINITION
 *******************************************/
public class Axisadm093Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm093Service miServicio = new Axisadm093Service();

	/***************************************************************************************************************/
	/***********************************************
	 * STARTING FUNCTIONS
	 *******************************************/
	/***************************************************************************************************************/

	/***********************************************
	 * INIT METHOD - JBENITEZ
	 *******************************************/
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm093Action Init");
		return this.form(mapping, form, request, response);
	}

	/***********************************************
	 * FORM METHOD - JBENITEZ
	 *******************************************/
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm093Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/***********************************************
	 * ACTION FOR SEARCH AMOUNTS - JBENITEZ
	 *******************************************/
	public ActionForward ajax_search_amount(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_search_amount");
		miServicio.m_ajax_search_amount(request);
		return mapping.findForward("ajax");
	}

	/***********************************************
	 * ACTION FOR DELETE AMOUNTS - JBENITEZ
	 *******************************************/
	public ActionForward ajax_delete_amount(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_delete_amount");
		miServicio.m_ajax_delete_amount(request);
		return mapping.findForward("ajax");
	}

	/***********************************************
	 * ACTION FOR TRANSSACTION AMOUNTS - JBENITEZ
	 *******************************************/
	public ActionForward PagoPoliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm093Action: DoTransaction");
		miServicio.m_PagoPoliza(request, this);
		return mapping.findForward("ajax");
	}

	/***********************************************
	 * ACTION FOR SEARCH AMOUNTS - JBENITEZ
	 *******************************************/
	public ActionForward loadBox(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_search_amount");
		miServicio.m_loadBox(request);
		return mapping.findForward("ajax");
	}

	/***********************************************
	 * ACTION FOR TRANSSACTION AMOUNTS - JBENITEZ
	 *******************************************/
	public ActionForward DoTransaction(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm093Action: DoTransaction");
		miServicio.m_DoTransaction(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisadm093Action m_ajax_actualizar_persona");

		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

}