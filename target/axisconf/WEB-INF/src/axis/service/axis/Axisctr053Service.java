package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr053Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 15/01/2009
 * @since Java 5.0
 */
public class Axisctr053Service extends AxisBaseService {
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
		logger.debug("Axisctr053Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPROIMP = getCampoNumerico(request, "SPROIMP");
			BigDecimal CIDIOMA = usuario.getCidioma();

			BigDecimal dtRecibosOffset = getCampoNumerico(request, "dtRecibosOffset");

			if (!isEmpty(dtRecibosOffset))
				request.setAttribute("dtRecibosOffset", dtRecibosOffset);

			if (!isEmpty(SPROIMP)) {
				PAC_IAX_GESTION_REC pacIaxGestionRec = new PAC_IAX_GESTION_REC(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxGestionRec.ejecutaPAC_IAX_GESTION_REC__F_GET_IMPR_PENDIENTE_MAN(SPROIMP, CIDIOMA);
				logger.debug(map);

				List<Map> LSTRECIBOS = (List<Map>) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(LSTRECIBOS)) {
					request.setAttribute("LSTRECIBOS", LSTRECIBOS);
					request.setAttribute("PITOTALR",
							!isEmpty(map.get("PITOTALR")) ? map.get("PITOTALR") : Double.valueOf(0.0));
				} else {
					// No se han encontrado datos
					AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr053Service - m�todo m_form", e);
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
	public void m_cancelar(HttpServletRequest request) {
		logger.debug("Axisctr053Service m_cancelar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal SPROIMP = getCampoNumerico(request, "SPROIMP");

			if (!isEmpty(SPROIMP)) {
				PAC_IAX_GESTION_REC pacIaxGestionRec = new PAC_IAX_GESTION_REC(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxGestionRec.ejecutaPAC_IAX_GESTION_REC__F_CANCEL_IMPRESION_MAN(SPROIMP);
				logger.debug(map);

				ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(map));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr053Service - m�todo m_cancelar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axisctr053Service m_imprimir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPROIMP = getCampoNumerico(request, "SPROIMP");
			BigDecimal CIDIOMA = usuario.getCidioma();

			PAC_IAX_GESTION_REC pacIaxGestionRec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxGestionRec.ejecutaPAC_IAX_GESTION_REC__F_IMPRESION_RECIBOS_MAN(SPROIMP, CIDIOMA);
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				request.getSession().setAttribute("FICHERO", map.get("PFICHERO"));
				formdata.put("impreso", "true");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr053Service - m�todo m_imprimir", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_seleccionar_recibo(HttpServletRequest request) {
		logger.debug("Axisctr053Service m_seleccionar_recibo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPROIMP = getCampoNumerico(request, "SPROIMP");

			if (!isEmpty(SPROIMP)) {
				BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
				BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");

				PAC_IAX_GESTION_REC pacIaxGestionRec = new PAC_IAX_GESTION_REC(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxGestionRec.ejecutaPAC_IAX_GESTION_REC__F_SET_IMPR_PENDIENTE_MAN(SPROIMP, NRECIBO,
						CESTADO);
				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr053Service - m�todo m_seleccionar_recibo", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_seleccionar_todos(HttpServletRequest request) {
		logger.debug("Axisctr053Service m_seleccionar_todos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPROIMP = getCampoNumerico(request, "SPROIMP");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");

			if (!isEmpty(SPROIMP)) {
				PAC_IAX_GESTION_REC pacIaxGestionRec = new PAC_IAX_GESTION_REC(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = new HashMap();

				if (BigDecimal.ONE.equals(CESTADO))
					map = pacIaxGestionRec.ejecutaPAC_IAX_GESTION_REC__F_SELEC_TODOS_RECIBOS(SPROIMP);
				else
					map = pacIaxGestionRec.ejecutaPAC_IAX_GESTION_REC__F_DESSELEC_TODOS_RECIBOS(SPROIMP);

				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr053Service - m�todo m_seleccionar_todos", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}
}
