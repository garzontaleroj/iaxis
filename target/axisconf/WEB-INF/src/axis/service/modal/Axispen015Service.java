package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen015Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen015Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen015Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispen015Action thisAction) {
		logger.debug("Axispen015Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			Map map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(null, null, null, null, null, null);
			logger.debug("---> planes:" + map);
			request.setAttribute("list_planes", (List) map.get("PLANPENSIONES"));

			BigDecimal CCODPLAN = getCampoNumerico(request, "CCODPLAN");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			if (!isEmpty(CCODPLAN) && !isEmpty(SPERSON)) {
				map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PENSIONES__F_GET_OB_PROMOTORES(CCODPLAN, SPERSON);

				logger.debug("---> map:" + map);
				Map map2 = (Map) map.get("PROMOTORES");
				formdata.put("VCONTRATO", map2.get("NPOLIZA"));
				formdata.put("IVALORL", map2.get("NVALPARSP"));
				formdata.put("PLANESPEN", map2.get("CCODPLA"));

				Map persona = (Map) map2.get("PERSONA");
				formdata.put("SPERSON", persona.get("SPERSON"));
				formdata.put("NNUMIDE", persona.get("NNUMIDE"));
				formdata.put("NOMBRE", persona.get("TNOMBRE"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen015Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_guardar(HttpServletRequest request) {
		logger.debug("Axispen015Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal PLANESPEN = getCampoNumerico(request, "PLANESPEN");
			BigDecimal VCONTRATO = getCampoNumerico(request, "VCONTRATO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal IVALORL = getCampoNumerico(request, "IVALORL");

			Map map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_SET_PROMOTORES(PLANESPEN, SPERSON, VCONTRATO, null, IVALORL, null);
			logger.debug("----> map" + map);

			if (((BigDecimal) map.get("RETURN")).intValue() == 0)
				formdata.put("OK", 1);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen015Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_actualiza_persona(HttpServletRequest request) {
		logger.debug("Axissin007Service m_ajax_actualiza_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");

			if (isEmpty(CAGENTE)) {
				CAGENTE = usuario.getCagente();
			}

			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - m�todo m_ajax_actualiza_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
