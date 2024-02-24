package axis.mvc.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.daemon.AxisRequestProcessor;
import axis.service.MainService;

public class MainAction extends AbstractDispatchAction {
	// boolean isMenuDone = false;
	static Log logger = LogFactory.getLog(MainAction.class);

	private MainService miServicio = new MainService();

	public ActionForward oculto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("oculto");
	}

	public ActionForward logo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("logo");
	}

	public ActionForward menu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_menu(request, this);
		// isMenuDone = true;
		return mapping.findForward("menu");
	}

	public ActionForward submenu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// while (!isMenuDone) {
		// // Buclar para esperar a la generaci�n del XML del men�
		// }
		// isMenuDone = false; // Reinicializar isMenuDone
		miServicio.m_submenu(request, this);
		return mapping.findForward("submenu");
	}

	public ActionForward teaser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_teaser(request, this);
		return mapping.findForward("teaser");
	}

	public ActionForward frames(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_frames(request, this);
		return mapping.findForward("frames");
	}

	public ActionForward blanc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("blanc");
	}

	public ActionForward trabajo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_trabajo(request, this);
		return mapping.findForward("trabajo");
	}

	/*
	 * public ActionForward axiscabecera(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * miServicio.m_axiscabecera(request, this); return
	 * mapping.findForward("axiscabecera"); }
	 */

	public ActionForward cabecera(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_cabecera(request, this);
		return mapping.findForward("cabecera");
	}

	public ActionForward pie(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_pie(request, this);
		return mapping.findForward("pie");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_cancelar(request, this);
		return this.trabajo(mapping, form, request, response);
	}

	public ActionForward closeAll(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			request.getSession(false).invalidate();

		} catch (Exception e) {
			// Sesi�n ya invalidada, sesi�n nula, etc.
			// No hace falta sacar mensaje por la consola del servidor.
		} finally {
			new AxisRequestProcessor().extractConnection(request); // WLX//AXIS-WLS2CLUSTER-Ready
		}
		return null;
	}

}
