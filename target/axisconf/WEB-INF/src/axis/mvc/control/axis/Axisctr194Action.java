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
import axis.mvc.model.UsuarioBean;
import axis.service.axis.Axisctr194Service;
import axis.util.Constantes;

public class Axisctr194Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr194Service miServicio = new Axisctr194Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action Buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward modificarbloqueo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action modificarbloqueo");
		miServicio.m_modificarbloqueo(request);
		return mapping.findForward("json");
	}

	public ActionForward activarBotones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action activarBotones");
		miServicio.m_activarBotones_json(request);
		return mapping.findForward("json");
	}

	public ActionForward suplementos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action suplementos");
		miServicio.m_suplementos(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward("/axis_axisctr020.do?operation=form"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr194.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward emitir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action emitir");
		miServicio.m_emitir(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr018.do?operation=buscar"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr194.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward retenidas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action retenidas");
		miServicio.m_retenidas(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr034.do?operation=buscar"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr194.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward cartera(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		log.info("Axisctr194Action cartera");

		miServicio.m_cartera(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr050.do?operation=form&RADIO=2&CEMPRES=" + usuario.getCempres()));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr194.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action volver");
		miServicio.m_volver(request, this);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward haysuplementos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action haysuplementos");
		miServicio.m_haysuplementos_json(request);
		return mapping.findForward("json");
	}

	public ActionForward marcar_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action marcar_json");
		miServicio.m_marcar_json(request);
		return mapping.findForward("json");
	}

	public ActionForward cartera_cero(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr194Action cartera_cero");
		miServicio.m_cartera_cero(request, this);
		// return this.form(mapping,form,request,response);
		return mapping.findForward("json");
	}

}
