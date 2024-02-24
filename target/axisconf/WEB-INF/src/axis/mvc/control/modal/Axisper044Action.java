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
import axis.service.modal.Axisper044Service;

public class Axisper044Action extends AbstractDispatchAction implements Serializable {

	private static final long serialVersionUID = 5811484737803369918L;
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper044Service miServicio = new Axisper044Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward grabarMarcas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (miServicio.m_grabarMarcas(request, this).intValue() == 0) {
			return mapping.findForward("form");
		}
		return this.form(mapping, form, request, response);
	}

	public ActionForward crearMarca(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.crearMarca(request, this);
		return mapping.findForward("ajaxp");
	}

	public ActionForward listavalores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_listavalores(request, this);
		return mapping.findForward("ajaxp");
	}

}
