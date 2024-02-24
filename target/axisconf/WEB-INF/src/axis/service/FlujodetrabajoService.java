//Revision:# 53JAWR33NEKVDt0XRfbcRA== #
package axis.service;

import java.io.File;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_LOG;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_TRANSFERENCIAS;
import axis.mvc.control.FlujodetrabajoAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class FlujodetrabajoService implements Serializable {

	private static final long serialVersionUID = -6876398492991055899L;
	static Log logger = LogFactory.getLog(FlujodetrabajoService.class);

	public void m_init(HttpServletRequest request, FlujodetrabajoAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// limpiar la session de posibles flujos de trabajo anteriores
			request.getSession().removeAttribute(Constantes.FLUJODETRABAJO);
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Venimos desde el memnu, y tenemos que
	 * <ul>
	 * <li>recuperar/tratar PRODUCTO, MODO, FORM_ACT
	 * <li>limpiar la pila de procesos de todo
	 * <li>crear nuevo top de la pila
	 * <li>si ver lanzamos una pantalla propia de la app, o (si no la tenemos) lo
	 * lanzamos como un Oracle FORM
	 * </ul>
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, FlujodetrabajoAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			String PRODUCTO = AxisBaseService.getCampoTextual(request, "PRODUCTO");
			String MODO = AxisBaseService.getCampoTextual(request, "MODO");
			String FORM_ACT = AxisBaseService.getCampoTextual(request, "FORM_ACT");
			String CMENU = AxisBaseService.getCampoTextual(request, "CMENU");

			BigDecimal SPRODUC = null;
			try {
				SPRODUC = new BigDecimal(PRODUCTO);
			} catch (Exception e) {
				logger.debug("PRODUCTO no numerico, SPRODUC queda como 'null'");
			}
			String CMODO = MODO;
			String CFORM = FORM_ACT.toUpperCase();

//            usuario.resetearPila();

			thisAction.getPila(request).clear();

			// logActividad(usuario, CMODO, CFORM);

			thisAction.pushPila(request);
			thisAction.topPila(request, "CMODO", CMODO);
			thisAction.topPila(request, "CFORM", CFORM);
			thisAction.topPila(request, "SPRODUC", SPRODUC);
			thisAction.topPila(request, "CMENU", CMENU);

			// si tengo al fichero - bien, voy por WEB, sino, debo lanzar al form
			File fFile = null;
			String FORM = CFORM;

			try {
				FORM = FORM.toLowerCase();
				fFile = new File(Constantes.REALPATH + "/WEB-INF/jsp/axis/" + FORM + ".jsp");
				if (fFile == null || !fFile.exists()) {
					fFile = new File(Constantes.REALPATH + "/WEB-INF/jsp/" + FORM + ".jsp");
				}
			} catch (Exception e) {
				logger.error("No se ha podido crear un objeto 'File' a partir de " + Constantes.REALPATH
						+ "/WEB-INF/jsp/axis/" + FORM + ".jsp", e);
			}

			if (fFile == null || !fFile.exists()) { // debe ser un Oracle FORM
				request.setAttribute("actionforward", "formlauncher");
			} else { // lo tenemos es local, asi vamos a por la web
				if (SPRODUC == null && CFORM != null) {
					request.setAttribute("actionforward", AxisCodeWizard.primeraPantallaDesdeMenu(CFORM));
				} else {
					// TODO: y que paso si NO sabemos montar un forward?
					request.setAttribute("actionforward", null);
				}
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void eliminarAtributsSessio(HttpServletRequest request) {

		// atributs sessi� axisctr002
		request.getSession().removeAttribute("axisctr_tomadores");
		request.getSession().removeAttribute("axisctr_tomador");
		request.getSession().removeAttribute("Preguntar_asegurado");
		request.getSession().removeAttribute("axisctr_multi_registro_tomadores");

		// atributs sessi� axisctr003
		request.getSession().removeAttribute("axisctr_multi_registro_asegurados");
		request.getSession().removeAttribute("axisctr_asegurados");
		request.getSession().removeAttribute("axisctr_asegurado");

	}

	private void operacionesEspecialesDeCANCELAR(HttpServletRequest request, FlujodetrabajoAction thisAction)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String forigen = AxisBaseService.getCampoTextual(request, "forigen");
		if (forigen == null)
			forigen = "aabbcczz12345@@##";

		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// axisctr100:
			// 1. PAC_IAX_PRODUCCION__LIMPIARTEMPORALES sin mas
			// 24656/131450.2012.12.04.NMM.Afegim "axisctr207"
			// bug 0025862 afegir axisctr192
			if (forigen.equalsIgnoreCase("axisctr001") || forigen.equalsIgnoreCase("axisctr002")
					|| forigen.equalsIgnoreCase("axisctr003") || forigen.equalsIgnoreCase("axisctr004")
					|| forigen.equalsIgnoreCase("axisctr005") || forigen.equalsIgnoreCase("axisctr006")
					|| forigen.equalsIgnoreCase("axisctr007") || forigen.equalsIgnoreCase("axisctr008")
					|| forigen.equalsIgnoreCase("axisctr009") || forigen.equalsIgnoreCase("axisctr010")
					|| forigen.equalsIgnoreCase("axisctr011") || forigen.equalsIgnoreCase("axisctr012")
					|| forigen.equalsIgnoreCase("axisctr013") || forigen.equalsIgnoreCase("axisctr014")
					|| forigen.equalsIgnoreCase("axisctr015") || forigen.equalsIgnoreCase("axisctr026")
					|| forigen.equalsIgnoreCase("axisctr031") || forigen.equalsIgnoreCase("axisctr041")
					|| forigen.equalsIgnoreCase("axisctr061") || forigen.equalsIgnoreCase("axisctr091")
					|| forigen.equalsIgnoreCase("axisctr148") || forigen.equalsIgnoreCase("axisctr152")
					|| forigen.equalsIgnoreCase("axisctr153") || forigen.equalsIgnoreCase("axisctr154")
					|| forigen.equalsIgnoreCase("axisctr175") || forigen.equalsIgnoreCase("axisctr191")
					|| forigen.equalsIgnoreCase("axisctr192") || forigen.equalsIgnoreCase("axisctr205")
					|| forigen.equalsIgnoreCase("axissin001") || forigen.equalsIgnoreCase("axissin003")
					|| forigen.equalsIgnoreCase("axisctr207") || forigen.equalsIgnoreCase("axisctr216")
					|| forigen.equalsIgnoreCase("axisctr217") || forigen.equalsIgnoreCase("axisctr306")
					|| forigen.equalsIgnoreCase("axisctr505")) {
				try {
					eliminarAtributsSessio(request);
					pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__LIMPIARTEMPORALES();
				} catch (Exception e) {
					logger.error("forigen=" + forigen
							+ " causa error en PAC_IAX_PRODUCCION__LIMPIARTEMPORALES. Este error NO se propaga al usuario.",
							e);
				}
			}

			else if (forigen.equalsIgnoreCase("axisctr100") || forigen.equalsIgnoreCase("axisctr026")) {
				try {
					pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__LIMPIARTEMPORALES();
				} catch (Exception e) {
					logger.error("forigen=" + forigen
							+ " causa error en PAC_IAX_SIMULACIONES__LIMPIARTEMPORALES. Este error NO se propaga al usuario.",
							e);
				}
			}
			// INI CJMR IAXIS-5428 2019/12/06
			else if (forigen.equalsIgnoreCase("axisctr024")
					&& "true".equals(request.getParameter("limpiarTemporales"))) {
				try {
					pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES();
					((ArrayList) request.getSession().getAttribute(Constantes.PILA)).clear();
				} catch (Exception e) {
					logger.error("forigen=" + forigen
							+ " causa error en PAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES. Este error NO se propaga al usuario.",
							e);
				}

			}
			// FIN CJMR IAXIS-5428 2019/12/06
			/* CONF-274 - 20161125 - JLTS - Se adiciona la pantalla axisctr069 */
			else if (forigen.equalsIgnoreCase("axisctr069") || forigen.equalsIgnoreCase("axisctr020")
					|| (forigen.equalsIgnoreCase("axisctr024")
							&& !"false".equals(request.getParameter("limpiarTemporales")))) {
				try {
					/*
					 * Es comenta ja que el pac_iax_suplementos.limpiartemporales ja neteja de les
					 * taules est BUG axis11557 XPL 28/10/2009 if
					 * ("true".equals(request.getParameter("MODIF_PROP"))) {
					 * 
					 * BigDecimal SSEGURO=(BigDecimal)AbstractDispatchAction.topPila(request,
					 * "SSEGURO");
					 * pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES(
					 * SSEGURO); }
					 */

					pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES();
				} catch (Exception e) {
					logger.error("forigen=" + forigen
							+ " causa error en PAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES. Este error NO se propaga al usuario.",
							e);
				}
			} else if (forigen.equalsIgnoreCase("axisadm039")) {
				try {
					PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map maptrans = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO();
					logger.debug(maptrans);
				} catch (Exception e) {
					logger.error("forigen=" + forigen
							+ " causa error en PAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO. Este error NO se propaga al usuario.",
							e);
				}
			}

		} catch (Exception e) {
		}

	}

	/**
	 * cancela proceso actual (sea flujo o no)
	 * <ul>
	 * <li>debe limpiar los formdata para que no se pasen al "pop.top" de la pila
	 * (si haya)
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cancelar(HttpServletRequest request, FlujodetrabajoAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			operacionesEspecialesDeCANCELAR(request, thisAction);
			formdata.clear();

			// pop de la pila
			HashMap poppedTopDeLaPila = thisAction.popPila(request);
			if (thisAction.getPila(request).size() != 0) {
				if (thisAction.topPila(request, Constantes.SALTARORIGENACTION) != null) {
					request.setAttribute(Constantes.FORWARDACTION,
							thisAction.topPila(request, Constantes.SALTARORIGENACTION));
					thisAction.removeTopPila(request, Constantes.SALTARORIGENACTION);
				}
			}

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public ActionForward m_saltar(HttpServletRequest request, FlujodetrabajoAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			ActionForward tempForward = (ActionForward) thisAction.topPila(request, Constantes.SALTARDESTINOACTION);
			thisAction.removeTopPila(request, Constantes.SALTARDESTINOACTION);

			Map passTopPila = (Map) request.getAttribute(Constantes.PASSTOPPILA);
			thisAction.pushPila(request, passTopPila);

			return tempForward;
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		return null;
	}

	/**
	 * Log de la activdad desde "pinchar" una opcion del menu
	 * 9290-20090302-XVM-Habilitar el log de actividad
	 * 
	 * @param usuario
	 * @param CMODO
	 * @param CFORM
	 */
	public void logActividad(HttpServletRequest request, UsuarioBean usuario, String CMODO, String CFORM) {
		try {
			new PAC_IAX_LOG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD(CFORM, CMODO, null, null);
		} catch (Exception e) {
			logger.warn("No he podido logear la actividad CMODO, CFORM:" + CMODO + "," + CFORM + " por:" + e);
		}

	}

}
