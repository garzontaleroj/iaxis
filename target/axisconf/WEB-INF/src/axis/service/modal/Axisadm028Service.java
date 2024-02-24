package axis.service.modal;

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
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm028Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm028Service m_form");

		try {
			// Al cargar la pantalla borramos, si existe, la var T_IAX_RECIBOS si ha sido
			// creada anteriormente
			if (request.getSession() != null && request.getSession().getAttribute("T_IAX_RECIBOS") != null)
				request.getSession().removeAttribute("T_IAX_RECIBOS");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm028Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm028Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			String TESTREC = getCampoTextual(request, "TESTREC");

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Map map=pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_ACCION(NRECIBO);
			Map map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_ACCIONES(NRECIBO, new BigDecimal(1));
			List T_ACCIONES = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_ACCIONES);

			request.setAttribute("T_ACCIONES", T_ACCIONES);
			request.setAttribute("NRECIBO", NRECIBO);
			request.setAttribute("TESTREC", TESTREC);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm028Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una llamada a F_GET_ACCIONES para saber si el recibo seleccionado
	 * tiene acciones. Si tiene exactamente 1 acci�n a realizar, devuelve v�a Ajax
	 * su CFORM (pantalla destino de la acci�n) para que la pantalla AXISCTR020
	 * pueda navegar a esa pantalla. Si no, no devolver� CFORM, y la pantalla
	 * AXISCTR020 sabr� que tiene que abrir el modal AXISADM028 para escoger acci�n.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_gestionar_recibos(HttpServletRequest request) {
		logger.debug("Axisadm028Service m_gestionar_recibos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_ACCIONES(NRECIBO, new BigDecimal(1));
			logger.debug(map);

			List<Map> T_ACCIONES = (List<Map>) ajax.rellenarPlAContenedorAjax(map);

			BigDecimal PSALTAR = (BigDecimal) map.get("PSALTAR");

			if (!isEmpty(PSALTAR)) {
				Map resultado = new HashMap();
				resultado.put("NRECIBO", NRECIBO);
				resultado.put("PSALTAR", PSALTAR);

				if (PSALTAR.equals(BigDecimal.ONE) && !isEmpty(T_ACCIONES)) {
					resultado.put("CFORM", T_ACCIONES.get(0).get("CFORM"));
				}

				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm028Service - m�todo m_gestionar_recibos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
