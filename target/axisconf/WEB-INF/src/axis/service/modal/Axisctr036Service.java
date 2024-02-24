package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_UNDERWRITING;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr036Service.java 14/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr036Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr036Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			/*
			 * BigDecimal SSEGURO = new
			 * BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")
			 * )); //PRETEN_NMOVIMI logger.debug("SSEGURO :: "+SSEGURO);
			 */

			BigDecimal SSEGURO = new BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")));
			BigDecimal NMOVIMI = new BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_NMOVIMI")));

			PAC_IAX_UNDERWRITING pac_iax_underwriting = new PAC_IAX_UNDERWRITING(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map enferm = pac_iax_underwriting.ejecutaPAC_IAX_UNDERWRITING__F_GET_ICD10CODES(SSEGURO, NMOVIMI);
			List listEnferm = (List) tratarRETURNyMENSAJES(request, enferm, false);
			request.getSession().setAttribute("axisctr_listaenfermedades", listEnferm);

			HashMap listasrechazopol = new HashMap();

			PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MOTIVOSRECHAZOPOL();
			logger.debug(map);
			List rechazospol = (List) tratarRETURNyMENSAJES(request, map);
			listasrechazopol.put("rechazos", rechazospol);

			Map map2 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001026));
			List periodo = (List) tratarRETURNyMENSAJES(request, map2);
			listasrechazopol.put("lstperiodo", periodo);

			request.getSession().setAttribute("axisctr_listasDatosRechazos", listasrechazopol);

			// Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas
			// Comprobamos si accedimos des de axisctr209 (PMODO = AUTORIZA_MASIVO)
			String PMODO = (String) getHiddenCampoTextual(request, "PMODO");
			if (!isEmpty(PMODO) && "AUTORIZA_MASIVO".equals(PMODO)) {
				// Guardamos en la session el NPOLIZA.
				BigDecimal NPOLIZA = getHiddenCampoNumerico(request, "NPOLIZA");
				request.getSession().setAttribute("NPOLIZA", NPOLIZA);
			}
			// Fi Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr036Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * 
	 * @param request
	 * @return True si la grabaci�n ha ido bien, false si ha ido mal
	 */
	@SuppressWarnings("all")
	public void m_acceptar(HttpServletRequest request) {
		logger.debug("Axisctr036Service m_acceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String VALORESSELECT = getCampoTextual(request, "ENFERSEL");
			BigDecimal pPCMOTMOV = getCampoNumerico(request, "CMOTMOV");
			String TOBSERV = getCampoTextual(request, "TOBSERV");

			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas
			Map map = null;
			String PMODO = this.getHiddenCampoTextual(request, "PMODO");
			if (PMODO == null || !"AUTORIZA_MASIVO".equals(PMODO)) {
				BigDecimal SSEGURO = new BigDecimal(
						String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")));
				BigDecimal NMOVIMI = new BigDecimal(
						String.valueOf(request.getSession().getAttribute("PRETEN_NMOVIMI")));
				BigDecimal NSUPLEM = new BigDecimal(
						String.valueOf(request.getSession().getAttribute("PRETEN_NSUPLEM")));

				String POSTPPER = getCampoTextual(request, "POSTPPER");
				BigDecimal PERPOST = getCampoNumerico(request, "PERPOST");
				map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA(SSEGURO, NMOVIMI,
						pPCMOTMOV, NSUPLEM, TOBSERV, POSTPPER, PERPOST);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					Map mapRe;
					if (!isEmpty(VALORESSELECT)) {
						PAC_IAX_UNDERWRITING pac_iax_under = new PAC_IAX_UNDERWRITING(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						mapRe = pac_iax_under.ejecutaPAC_IAX_UNDERWRITING__F_SETRECHAZO_ICD10CODES(SSEGURO, NMOVIMI,
								VALORESSELECT);
						if (((BigDecimal) tratarRETURNyMENSAJES(request, mapRe)).intValue() == 0) {
							request.setAttribute("OK_acceptar", "0");
							if (!isEmpty(map.get("MENSAJES")))
								request.getSession().setAttribute("PRETEN_MENSAJES",
										((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
												.get("CERROR"));

							if (!isEmpty(mapRe.get("MENSAJES")))
								request.getSession().setAttribute("PRETEN_MENSAJES",
										((Map) ((Map) ((List) mapRe.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
												.get("CERROR"));
						}
					} else {
						request.setAttribute("OK_acceptar", "0");
						if (!isEmpty(map.get("MENSAJES")))
							request.getSession().setAttribute("PRETEN_MENSAJES",
									((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
											.get("CERROR"));
					}
				}
			} else {
				// Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
				// retenidas
				// RECHAZAR PROPUESTAS MASIVAMENTE
				String CCONTROLS = (String) getHiddenCampoTextual(request, "CCONTROLS");
				BigDecimal NPOLIZA = new BigDecimal(String.valueOf(request.getSession().getAttribute("NPOLIZA")));

				map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA_MASIVO(NPOLIZA,
						pPCMOTMOV, TOBSERV, CCONTROLS);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					request.setAttribute("OK_acceptar", "0");

					if (!isEmpty(map.get("MENSAJES"))) {
						// Iteramos map.get("MENSAJES") para guardar TODOS los TERROR
						List listaMensajes = (List) map.get("MENSAJES");
						String mensaje = "verbatim:";
						for (int i = 0; i < listaMensajes.size(); i++) {
							mensaje += (String) ((Map) ((Map) listaMensajes.get(i)).get("OB_IAX_MENSAJES"))
									.get("TERROR") + "<br>";
						}
						request.getSession().setAttribute("PRETEN_MENSAJES", mensaje);
					}
				}
				// Fi Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
				// retenidas
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr036Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}