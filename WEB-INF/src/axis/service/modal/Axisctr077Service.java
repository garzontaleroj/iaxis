package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr077Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr077Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr077Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr077Action thisAction) {
		logger.debug("Axisctr077Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr077Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr077Action thisAction) {
		logger.debug("Axisctr077Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			Map map = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_FECHA_DIFERIR(SSEGURO);
			logger.debug(map);
			BigDecimal bot_activos = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("BOT_ACTIVOS", bot_activos);
			request.setAttribute("PFECHAP", map.get("PFECHAP"));

			if (bot_activos.intValue() == 1)
				request.setAttribute("PORDEFECTO", "F_FCARPRO");
			else if (bot_activos.intValue() == 0)
				request.setAttribute("PORDEFECTO", map.get("PFECHAP"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr077Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Difiere el suplemento
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 **/
	public void m_diferirpropuesta(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr077Service m_diferir");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			String tipo = getCampoTextual(request, "OPCIONMARCADA");
			logger.debug("--------- tipo:" + tipo);

			Map grabarDatosVersion = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_DIFERIRPROPUESTA(tipo);
			logger.debug(grabarDatosVersion);
			// tratarRETURNyMENSAJES(request, grabarDatosVersion);
			ArrayList lista = (ArrayList) grabarDatosVersion.get("MENSAJES");
			HashMap objeto = (HashMap) lista.get(0);
			HashMap ob_iax_mensaje = (HashMap) objeto.get("OB_IAX_MENSAJES");
			request.setAttribute("MENSAJE", ob_iax_mensaje.get("TERROR"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr077Service - m�todo m_diferirpropuesta", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
