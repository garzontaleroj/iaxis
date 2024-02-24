package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr052Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 15/01/2009
 * @since Java 5.0
 */
public class Axisctr052Service extends AxisBaseService {
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
		logger.debug("Axisctr052Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
			logger.debug(map);

			formdata.put("LSTPRODUCTOS", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr052Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisctr052Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			// BigDecimal SPROCES = BigDecimal.ZERO;
			BigDecimal SPROCES = null;
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			java.sql.Date DATAINI = stringToSqlDate(getCampoTextual(request, "DATAINI"));
			java.sql.Date DATAFIN = stringToSqlDate(getCampoTextual(request, "DATAFIN"));
			BigDecimal CREIMP = getCampoNumerico(request, "CREIMP");
			String CRECCIA = getCampoTextual(request, "CRECCIA");

			if (BigDecimal.ZERO.equals(CREIMP)) {
				CREIMP = null;
			}

			BigDecimal SPROIMP = getCampoNumerico(request, "SPROIMP");

			Map map = new PAC_IAX_GESTION_REC((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTION_REC__F_IMPR_PENDIENTE_MAN(SPRODUC, CAGENTE, SPROCES, NPOLIZA, NRECIBO,
							DATAINI, DATAFIN, CREIMP, SPROIMP, CRECCIA);

			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				request.setAttribute("buscarOK", true);
				formdata.put("SPROIMP", map.get("PSPROIMP2"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr052Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * Realiza una b�squeda del literal de Agente, en funci�n de su c�digo, por
	 * Ajax.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr052Service m_ajax_actualizar_agente");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map agente = null;

			if (!isEmpty(CAGENTE)) {
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, CAGENTE, BigDecimal.ONE);
				logger.debug(map);
				List<Map> listAgentes = (List<Map>) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(listAgentes))
					agente = listAgentes.get(0);

				ajax.rellenarPlAContenedorAjax(map);
			}

			ajax.guardarContenidoFinalAContenedorAjax(agente);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr052Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
