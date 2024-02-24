package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr035Service.java 14/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr035Service extends AxisBaseService {
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
		logger.debug("Axisctr035Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		formdata.put("CEMPRES", usuario.getCempres());

		try {

			// Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas
			// Comprobamos si accedimos des de axisctr209 (PMODO = AUTORIZA_MASIVO)
			String PMODO = (String) getHiddenCampoTextual(request, "PMODO");
			if (PMODO == null || !"AUTORIZA_MASIVO".equals(PMODO)) {
				// Ejecuci�n normal.
				PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal SSEGURO = new BigDecimal(
						String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")));
				logger.debug("SSEGURO :: " + SSEGURO);

				Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_PERMITE_CAMBIO_FEFECTO(SSEGURO);
				logger.debug(map);
				request.setAttribute("permiteCambioFefecto", tratarRETURNyMENSAJES(request, map));

				map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_INFOPROPRETEN(SSEGURO);
				logger.debug("info :: " + map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					formdata.put("POBSERV", map.get("POBSERV"));
					request.getSession().setAttribute("PRETEN_FEFECTO_OUT", map.get("PFEFECTO"));
					formdata.put("FEFECTO", map.get("PFEFECTO"));
				}
			} else {
				// Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
				// retenidas
				BigDecimal NPOLIZA = getHiddenCampoNumerico(request, "NPOLIZA");
				request.getSession().setAttribute("NPOLIZA", NPOLIZA);
				formdata.put("FEFECTO", new java.util.Date());
				// Fi Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
				// retenidas
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr035Service - m�todo m_form", e);
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
		logger.debug("Axisctr035Service m_acceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			Map map = null;
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String TOBSERV = this.getHiddenCampoTextual(request, "TOBSERV");

			// Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas
			String PMODO = this.getHiddenCampoTextual(request, "PMODO");
			if (PMODO == null || !"AUTORIZA_MASIVO".equals(PMODO)) {
				BigDecimal SSEGURO = new BigDecimal(
						String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")));
				BigDecimal NMOVIMI = new BigDecimal(
						String.valueOf(request.getSession().getAttribute("PRETEN_NMOVIMI")));

				// java.sql.Date FEFECTO = new java.sql.Date( new
				// SimpleDateFormat("yyyy-MM-dd").parse
				// (String.valueOf(request.getSession().getAttribute("PRETEN_FEFECTO_OUT"))).getTime()
				// );
				java.sql.Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
				if (FEFECTO == null) {
					FEFECTO = stringToSqlDate(getHiddenCampoTextual(request, "HFEFECTO"));
				}
				logger.debug("PARAMS :: " + SSEGURO + "::" + NMOVIMI + "::" + FEFECTO);

				map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA(SSEGURO, NMOVIMI,
						FEFECTO, TOBSERV);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					request.setAttribute("OK_acceptar", "0");

					if (!isEmpty(map.get("MENSAJES")))
						request.getSession().setAttribute("PRETEN_MENSAJES",
								((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
										.get("CERROR"));

				}
			} else {
				// Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
				// retenidas
				// AUTORIZACI�N MASIVA
				String CCONTROLS = (String) getHiddenCampoTextual(request, "CCONTROLS");
				BigDecimal NPOLIZA = new BigDecimal(String.valueOf(request.getSession().getAttribute("NPOLIZA")));

				map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA_MASIVO(
						new BigDecimal(0), NPOLIZA, TOBSERV, CCONTROLS);

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
			logger.error("Error en el servicio Axisctr035Service - m�todo m_acceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}