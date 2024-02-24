package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_USER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisusu002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisusu002Service.java 07/11/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastor</a>
 * @since Java 5.0
 */
public class Axisusu002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisusu002Action thisAction) {
		logger.debug("Axisusu002Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			/* Recuperar lista de Agentes */
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, null, new BigDecimal(2));
			logger.debug(map);
			LSTVALORES.put("LSTAGENTES", tratarRETURNyMENSAJES(request, map, false));
			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axisusu002Action thisAction) {
		logger.debug("Axisusu002Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_USER pacIaxUser = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = usuario.getCempres();
			String USER = null;
			String USERNAME = getCampoTextual(request, "USERNAME");
			BigDecimal CDELEGA = getCampoNumerico(request, "CDELEGA");

			Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_CONSULTA_USUARIOS(CEMPRES, USER, USERNAME, CDELEGA);
			logger.debug(map);

			formdata.put("LSTUSUARIOS", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu002Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	public void m_borrar(HttpServletRequest request, Axisusu002Action thisAction) {
		logger.debug("Axisusu002Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_USER pacIaxUser = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CUSUARI = AxisBaseService.getCampoTextual(request, "CUSUARI");

			Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_DEL_USUARIO(CUSUARI);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu002Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_ver_agente(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			logger.debug("Axisusu002Service m_ajax_ver_agente");

		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}