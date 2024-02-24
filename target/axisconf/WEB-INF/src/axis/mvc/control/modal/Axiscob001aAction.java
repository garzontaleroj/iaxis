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
import axis.service.modal.Axiscob001aService;

public class Axiscob001aAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscob001aService miServicio = new Axiscob001aService();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward busqueda_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper021Action: busqueda_persona");
		miServicio.m_busqueda_persona(request, this);

		return mapping.findForward("form");
	}

	public ActionForward delete_caja(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axiscob001a: delete_caja");
		miServicio.m_delete_cajamov(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward aplicar_caja(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axiscob001a: aplicar_caja");
		miServicio.m_aplicar(request, this);

		return mapping.findForward("form");
	}

	public ActionForward insertar_break(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axiscob001bAction: Insertar Break Down Reembolsos");
		miServicio.m_insertar_break(request, this);

		return mapping.findForward("form");
	}

}
