package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr065Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr065Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr065Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr065Action thisAction) {
		logger.debug("Axisctr065Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr065Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			// this.f_Cargar_Propiedades_Pantalla(request,this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr065Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String cversion = getCampoTextual(request, "CVERSION");
			String tmarca = getCampoTextual(request, "TMARCA");

			cargarDatosCombos(request);
			logger.debug("---------- axisctr065 VALOR version  :" + cversion + " marca:" + tmarca);
			if (!isEmpty(cversion)) {
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(cversion, new BigDecimal(0), null);
				logger.debug("-- ver:" + map);
				if (!isEmpty(tratarRETURNyMENSAJES(request, map)))
					request.getSession().setAttribute("axisctr065_Version",
							((ArrayList) tratarRETURNyMENSAJES(request, map)).get(0));

				HashMap r = (HashMap) ((ArrayList) tratarRETURNyMENSAJES(request, map)).get(0);
				if (!isEmpty(r.get("CTIPVEH"))) {
					// Lista Clase vehiculos
					Map map2 = new PAC_IAX_LISTVALORES_AUT(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(String.valueOf(r.get("CTIPVEH")));
					request.setAttribute("LSTCCLAVEH", (List) tratarRETURNyMENSAJES(request, map2));
				}
			} else {
				request.getSession().removeAttribute("axisctr065_Version");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr065Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			// this.f_Cargar_Propiedades_Pantalla(request,this.whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Lista combustible
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(291));
		logger.debug(map);
		request.setAttribute("COMBUSTIBLE", (List) tratarRETURNyMENSAJES(request, map));

		// Lista tipo vehicle
		map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH();
		logger.debug(map);
		request.setAttribute("LSTCTIPVEH", (List) tratarRETURNyMENSAJES(request, map));
	}

	/**
	 * Funcion que recupera la clase de vehiculo dependiendo del tipo del vehiculo
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_clasesveh(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CTIPVEH = getCampoTextual(request, "CTIPVEH");
			logger.debug("---------- VALOR CTIPVEH  :" + CTIPVEH);
			if (!isEmpty(CTIPVEH)) {
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(CTIPVEH);
				logger.debug(map);
				if (!isEmpty(map)) {
					List clases = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(clases);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr065Service - m�todo m_ajax_recuperar_clasesveh", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request,this.whoami(this));
		}
	}
}
