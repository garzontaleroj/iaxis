/*********************************************************************************************************************/
/***********************************************JBENITEZ - APRIL 2015 - BUG 33886/199826******************************/
/*********************************************************************************************************************/
package axis.mvc.control.modal;

/***********************************************IMPORTING PACKAGES*******************************************/

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
import axis.service.modal.Axisadm093bService;

/***********************************************
 * CLASS DEFINITION
 *******************************************/
public class Axisadm093bAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm093bService miServicio = new Axisadm093bService();

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
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	/***********************************************
	 * FORM METHOD - JBENITEZ
	 *******************************************/
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/***********************************************
	 * ACTION FOR BUSCAR - JBENITEZ
	 *******************************************/
	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	/***********************************************
	 * ACTION FOR BUSQUEDA PERSONA - JBENITEZ
	 *******************************************/
	public ActionForward busqueda_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisadm093bAction: busqueda_persona");
		miServicio.m_busqueda_persona(request, this);
		return mapping.findForward("form");
	}
}
