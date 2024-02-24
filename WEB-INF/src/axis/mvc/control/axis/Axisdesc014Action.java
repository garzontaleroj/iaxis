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
import axis.service.axis.Axisdesc014Service;

public class Axisdesc014Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisdesc014Service miServicio = new Axisdesc014Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisppro047Action Init");
		miServicio.m_init(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc014Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_descuentos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_busqueda_descuentos(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// log.info("Axisctr207Action selected_garantia_json");
		miServicio.m_busqueda_detalle(request, this);
		return mapping.findForward("form");
	}

	public ActionForward borrarDescuento(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrarDescuento(request, this);
		miServicio.m_busqueda_descuentos(request, this);
		return mapping.findForward("form");
	}

	public ActionForward borrarDescuentoLin(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrarDescuentoLin(request, this);
		miServicio.m_busqueda_descuentos(request, this);
		return mapping.findForward("form");
	}

}