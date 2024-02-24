package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INSPECCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisins001Service extends AxisBaseService {

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
		logger.debug("Axisins001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String CMATRIC = getCampoTextual(request, "CMATRIC");
			BigDecimal CTIPMAT = getCampoNumerico(request, "CTIPMAT");
			BigDecimal SORDEN = getCampoNumerico(request, "SORDEN");
			BigDecimal NINSPECCION = getCampoNumerico(request, "NINSPECCION");

			PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa_aux = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_IRORDENES("POL", CTIPMAT, CMATRIC,
					SORDEN, NINSPECCION);

			List l_aux = (List) (tratarRETURNyMENSAJES(request, mapa_aux));
			if (l_aux != null) {
				request.setAttribute("IRORDENES", l_aux);
			}
			request.setAttribute("SORDEN", SORDEN);
			request.setAttribute("NINSPECCION", NINSPECCION);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisins001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_cargar_inspecciones(HttpServletRequest request) {
		logger.debug("Axisins001Service m_cargar_inspecciones");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal SORDEN = getCampoNumerico(request, "SORDEN");
			BigDecimal NINSPECCION = getCampoNumerico(request, "NINSPECCION");

			PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONES(SORDEN, NINSPECCION);

			List l_aux = (List) (tratarRETURNyMENSAJES(request, map));

			List RESULTADO = new ArrayList();
			int size = l_aux == null ? 0 : l_aux.size();
			for (int i = 0; i < size; i++) {
				map.remove("IRINSPECCIONES");
				map.put("IRINSPECCIONES", l_aux.get(i));
				RESULTADO.add(map);
			}

			if (size == 1)
				m_cargar_detalle(request, RESULTADO);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisins001Service - m�todo m_cargar_inspecciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cargar_detalle(HttpServletRequest request, List RESULTADO) {
		logger.debug("Axisins001Service m_cargar_detalle");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal SORDEN = getCampoNumerico(request, "SORDEN");
			BigDecimal NINSPECCION = getCampoNumerico(request, "NINSPECCION");
			if (RESULTADO == null)
				RESULTADO = new ArrayList();
			PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* ini datos tabla IRINSPECCIONESDVEH */
			Map map = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDVEH(SORDEN, NINSPECCION);
			List l_aux = (List) (tratarRETURNyMENSAJES(request, map));
			int size = l_aux == null ? 0 : l_aux.size();
			for (int i = 0; i < size; i++) {
				map.remove("IRINSPECCIONESDVEH");
				map.put("IRINSPECCIONESDVEH", l_aux.get(i));
				RESULTADO.add(map);

			}
			/* fi datos tabla IR_INSPECCIONES_DVEH */

			/* ini datos tabla IR_INSPECCIONES_ACC */
			PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESACC(SORDEN, NINSPECCION);

			l_aux = (List) (tratarRETURNyMENSAJES(request, map));
			size = l_aux == null ? 0 : l_aux.size();
			for (int i = 0; i < size; i++) {
				map.remove("IRINSPECCIONESACC");
				map.put("IRINSPECCIONESACC", l_aux.get(i));
				RESULTADO.add(map);

			}
			/* fi datos tabla IR_INSPECCIONES_ACC */

			/* ini datos tabla IR_INSPECCIONES_DOC */
			PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_IRINSPECCIONESDOC(SORDEN, NINSPECCION);

			l_aux = (List) (tratarRETURNyMENSAJES(request, map));
			size = l_aux == null ? 0 : l_aux.size();
			for (int i = 0; i < size; i++) {
				map.remove("IRINSPECCIONESDOC");
				map.put("IRINSPECCIONESDOC", l_aux.get(i));
				RESULTADO.add(map);

			}
			/* fi datos tabla IR_INSPECCIONES_DOC */
			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisins001Service - m�todo m_cargar_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
