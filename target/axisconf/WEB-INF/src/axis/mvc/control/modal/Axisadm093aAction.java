/*********************************************************************************************************************/
/***********************************************JBENITEZ - APRIL 2015 - BUG 33886/199826******************************/
/*********************************************************************************************************************/
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

/***********************************************IMPORTING PACKAGES*******************************************/
import axis.mvc.control.AbstractDispatchAction;
import axis.service.modal.Axisadm093aService;

/***********************************************
 * CLASS DEFINITION
 *******************************************/
public class Axisadm093aAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm093aService miServicio = new Axisadm093aService();

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
		logger.debug("Axisadm093aAction Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/***********************************************
	 * Metodo ajax valida existencia poliza
	 *******************************************/
	public ActionForward ajax_search_amount(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		log.info("Axisctr001Action ajax_search_amount");
		miServicio.m_ajax_existe_poliza(request);
		return mapping.findForward("ajax");
	}

}