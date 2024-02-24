package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispro040Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro041Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro040Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga inicial de la pantalla. Carga de BD: - Los datos t�cnicos. - Los
	 * diferentes valores de los combos. - Llama a #m_cargarCuadroInteres
	 * 
	 * @param request
	 */

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axispro040Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(33));
			request.setAttribute("LISTTIPGAR", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(34));
			request.setAttribute("LISTTIPCAP", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro041Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
		}
	}

	/**
	 * M�todo que realiza la b�squeda de preguntas en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscargar(HttpServletRequest request, Axispro040Action thisAction) {
		logger.debug("Axispro040Service m_buscarpreg");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");

			Map map = new PAC_IAX_DESCVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCVALORES__F_DESCGARANT(CGARANT, usuario.getCidioma());

			logger.debug("----> descgarant:" + map);
			if (!isEmpty(map.get("PTGARANT")))
				formdata.put("TGARANT", map.get("PTGARANT"));
			else
				formdata.remove("CGARANT");

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro042Service - m�todo m_buscarpreg", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que asigna la garantia al producto
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_setgarantia(HttpServletRequest request, Axispro040Action thisAction) {
		logger.debug("Axispro040Service m_setgarantia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal CTIPGAR = getCampoNumerico(request, "CTIPGAR");
			BigDecimal CTIPCAP = getCampoNumerico(request, "CTIPCAP");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_GARANTIAPROD(SPRODUC, CGARANT, CACTIVI, NORDEN, CTIPGAR, CTIPCAP);

			logger.debug("----> garantia guardada:" + map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				request.setAttribute("OK", 1);
			}
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro042Service - m�todo m_setgarantia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
