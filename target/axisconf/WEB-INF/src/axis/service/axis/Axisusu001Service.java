package axis.service.axis;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_USER;
import axis.mvc.control.axis.Axisusu001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;

public class Axisusu001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que inicializa los valores de la pantalla: recuperar lista de idiomas
	 * y recuperar Datos de Usuario.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request, Axisusu001Action thisAction) {
		logger.debug("Axisusu001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			leerCamposFormulario(request, usuario);

		} catch (Exception e) {
			logger.error("Error en el servicio axisusu001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void leerCamposFormulario(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		/* Recuperar lista de idiomas */
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
		logger.debug(map);
		List LISTA_IDIOMAS = (List) tratarRETURNyMENSAJES(request, map);
		formdata.put("LISTA_IDIOMAS", LISTA_IDIOMAS);

		/* Recuperar datos del usuario actual */
		map = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_USER__F_GET_DATUSUARIO(null);
		logger.debug(map);
		Map OB_IAX_USER = (Map) tratarRETURNyMENSAJES(request, map);

		formdata.put("OB_IAX_USER", OB_IAX_USER);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que guarda los cambios en los datos de usuario. Se ejecuta en proceso
	 * request/response tradicional, ya que si se cambia el CIDIOMA, hay que
	 * recargar la p�gina. Para ello: - Actualiza la variable de sesi�n
	 * Constantes.LOCALE - Actualiza el CIDIOMA del usuario activo.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_guardarDatosUsuarioRequest(HttpServletRequest request, Axisusu001Action thisAction) {
		logger.debug("Axisusu001Service m_guardarDatosUsuarioRequest");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			String CUSUARI = getCampoTextual(request, "CUSUARI");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			BigDecimal CIDIOMA = getHiddenCampoNumerico(request, "CIDIOMA");

			Map map = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_USER__F_SET_DATUSUARIO(CUSUARI, NOMBRE, CIDIOMA);
			logger.debug(map);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (new BigDecimal(0).equals(RETURN)) {
				String locale = ConversionUtil.CIDIOMA2locale(CIDIOMA);

				if (!isEmpty(locale)) {
					// Cambiar el locale de la aplicaci�n
					request.getSession().setAttribute(Constantes.LOCALE, locale);
					// Cambiar el locale e idioma del usuario
					usuario.setLocale(locale);
					usuario.setCidioma(CIDIOMA);
				}
			}

			// Recargar nuevos campos del formulario
			leerCamposFormulario(request, usuario);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu001Service - m�todo m_guardarDatosUsuarioRequest", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que guarda los cambios en los datos de usuario, siempre que no se haya
	 * cambiado el idioma. La llamada a este m�todo se ejecuta v�a Ajax.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_guardarDatosUsuarioAjax(HttpServletRequest request) {
		logger.debug("Axisusu001Service m_guardarDatosUsuarioAjax");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUSUARI = getCampoTextual(request, "CUSUARI");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			BigDecimal CIDIOMA = getHiddenCampoNumerico(request, "CIDIOMA");

			Map map = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_USER__F_SET_DATUSUARIO(CUSUARI, NOMBRE, CIDIOMA);
			logger.debug(map);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu001Service - m�todo m_guardarDatosUsuarioAjax", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que guarda los cambios en los datos de conexi�n. La llamada a este
	 * m�todo se ejecuta v�a Ajax.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_guardarDatosConexion(HttpServletRequest request) {
		logger.debug("Axisusu001Service m_guardarDatosConexion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUSUARI = getCampoTextual(request, "CUSUARI");
			String OLDPWD = getCampoTextual(request, "OLDPWD");
			String NEWPWD = getCampoTextual(request, "NEWPWD");

			Map map = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_USER__F_SET_PASSWORD(CUSUARI, OLDPWD, NEWPWD);

			// TODO: Este loggeo hay que quitarlo en producci�n. No puede ser que por la
			// consola
			// del Servidor vayan saliendo los passwords de los usuarios.
			logger.debug(map);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu001Service - m�todo m_guardarDatosConexion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}