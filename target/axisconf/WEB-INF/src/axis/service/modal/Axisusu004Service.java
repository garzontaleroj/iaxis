package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_USER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisusu004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisusu004Action.java
 */
public class Axisusu004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisusu004Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisusu004Action thisAction) {
		logger.debug("Axisusu004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axisusu004Action thisAction) {
		logger.debug("Axisusu004Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu004Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_buscar(HttpServletRequest request, Axisusu004Action thisAction) {
		logger.debug("Axisusu004Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_USER pacIaxUser = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = usuario.getCempres();
			String USER = null;
			String USERNAME = getCampoTextual(request, "USERNAME");
			BigDecimal CDELEGA = getCampoNumerico(request, "CDELEGA");

			Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_GET_USUARIO_VISION(USER, USERNAME);
			logger.debug(map);
			BigDecimal ok = new BigDecimal(String.valueOf(tratarRETURNyMENSAJES(request, map, false)));

			if (ok.intValue() == 0)
				formdata.put("LSTUSUARIOS", map.get("PTUSUARIO"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu004Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
