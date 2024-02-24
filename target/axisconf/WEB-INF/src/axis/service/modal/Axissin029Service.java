package axis.service.modal;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.mvc.control.modal.Axissin029Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin029Service.java - B�squeda Causas Estado Siniestro
 * 
 * @author <a href="mailto:lcalvo@csi-ti.com"Luz Calvo</a>
 */
public class Axissin029Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axissin029Action thisAction) {
		try {
			this.cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin025Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin029Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio axissin002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	private void cargarCombos(HttpServletRequest request, Axissin029Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES_SIN pacIaxListValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCAUSAS();
			// new
			// PAC_IAX_LISTVALORES_SIN((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCASSIN_CODMOTCAU();
			logger.debug(m);
			listValores.put("lst_causas", tratarRETURNyMENSAJES(request, m));

			m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCESTSIN();
			logger.debug(m);
			listValores.put("lst_estados", tratarRETURNyMENSAJES(request, m));
			formdata.put("listvalores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin029Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			formdata.put("listValores", listValores);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la b�squeda de un siniestro, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List en
	 * sesi�n llamada AXISSIN_LISTASINIESTROS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public

			void m_guardar(HttpServletRequest request, Axissin029Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin029Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
		}
	}

}
