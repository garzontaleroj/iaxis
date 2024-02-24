//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.mvc.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.cache.ConfigCache;
import axis.mvc.model.UsuarioBean;
import axis.service.AxisService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.Traductor;

public class AxisAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(AxisAction.class);
	private AxisService miServicio = new AxisService();

	/**
	 * Procesamiento de tickets. ecg 20121029
	 * http://mantis.srvcsi.com/view.php?id=23687#c127767
	 */
	public ActionForward ticket(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_ticket(request, this);
		return (ActionForward) request.getAttribute("TICKETDESTINO");
	}

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_init(request, this);

		// ecg20130207 http://mantis.srvcsi.com/view.php?id=24603#c137385 vulnerabilidad
		// login sesiones compartidas
		String comportamiento_sesiones_compartidas = ConfigCache.getConfig()
				.getProperty("comportamiento.sesiones.compartidas", "");
		if (comportamiento_sesiones_compartidas.equals("facebook")) {
			if (request.getSession(false).getAttribute(Constantes.USUARIO) != null) {
				UsuarioBean uBExistente = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
				if (uBExistente.getNombre() != null) {
					miServicio.m_init(request, this);
					return mapping.findForward("aplicacion"); // opci�n "facebook" va a "aplicacion"
				}
			}
		}
		if (comportamiento_sesiones_compartidas.equals("highlander")) {
			if (request.getSession(false).getAttribute(Constantes.USUARIO) != null) {
				UsuarioBean uBExistente = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
				if (uBExistente.getNombre() != null) {
					miServicio.m_init(request, this);
					this.guardarMensaje(request, "9903720", null, Constantes.MENSAJE_ERROR);
					// TODO: crear literal en vez de verbatim:
					this.guardarMensaje(request, "9904944", null, Constantes.MENSAJE_ERROR);
					return mapping.findForward("highlander"); // opci�n "highlander"
				}
			}
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward salir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_salir(request);
		return mapping.findForward("exitautologin");
	}

	public ActionForward forceUserLogout(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.getSession().setAttribute("forcedUserLogout", true);

		return this.salir(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// ecg20130207 http://mantis.srvcsi.com/view.php?id=24603#c137385 vulnerabilidad
		// login sesiones compartidas
		String comportamiento_sesiones_compartidas = ConfigCache.getConfig()
				.getProperty("comportamiento.sesiones.compartidas", "");
		if (comportamiento_sesiones_compartidas.equals("highlander")) {
			if (request.getSession(false).getAttribute(Constantes.USUARIO) != null) {
				UsuarioBean uBExistente = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
				if (uBExistente.getNombre() != null) {
					miServicio.m_init(request, this);
					this.guardarMensaje(request, "9903720", null, Constantes.MENSAJE_ERROR);
					// TODO: crear literal en vez de verbatim:
					this.guardarMensaje(request, "9904944", null, Constantes.MENSAJE_ERROR);
					return mapping.findForward("highlander"); // opci�n "highlander"
				}
			}
		}

		miServicio.m_aceptar(request, this);
		if (this.maxistipoMENSAJE(request).equals(new Integer(Constantes.MENSAJE_INFO))) {
			return mapping.findForward("aplicacion");
		} else {
			return this.form(mapping, form, request, response);
		}
	}

	public ActionForward reconectar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Integer numTries = (Integer) request.getSession().getAttribute("numTries");

		if (numTries == null) {
			numTries = new Integer(0);
		}

		if (numTries < 3) {
			miServicio.m_aceptar(request, this);
		} else {
			miServicio.m_salir(request);
		}

		request.setAttribute("sessionDidInvalidate",
				Traductor.traducir(AxisBaseService.getLocale(request).toString(), "1000058"));
		return mapping.findForward("aplicacion_trabajo");

	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_form(request, this);

		if (!AxisBaseService.isEmpty(request.getAttribute("autologin_para_este_usuario"))
				&& Boolean.TRUE.equals(request.getAttribute("autologin_para_este_usuario"))) {
			// Cargamos la pantalla de autologuin.
			return mapping.findForward("autologinform");
		} else {
			// Cargamos la pantalla de loguin
			return mapping.findForward("form");
		}
	}

	public ActionForward ajax_cambio_ayuda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		AbstractDispatchAction.setAyudaAbierta(false);
		return mapping.findForward("ajax");
	}
}
