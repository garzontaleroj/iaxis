package axis.mvc.control.modal;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.modal.Axisper045Service;

public class Axisper045Action extends AbstractDispatchAction implements Serializable {

	private static final long serialVersionUID = -8984338468929737857L;
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper045Service miServicio = new Axisper045Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		System.out.println("en el aCTION metodo m_init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		System.out.println("en el aCTION metodo FORM");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward crearMarca(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.crearMarca(request, this);
		return mapping.findForward("form");
	}

}
