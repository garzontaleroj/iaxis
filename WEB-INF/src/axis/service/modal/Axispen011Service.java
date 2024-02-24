package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen011Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen011Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispen011Action thisAction) {
		logger.debug("Axispen011Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			cargarValoresDesplegables(request, thisAction, usuario, formdata);
			if (request.getParameter("parametro").equalsIgnoreCase("mod")) {

				BigDecimal CCODGES = getCampoNumerico(request, "codigo");

				m_modificar_depositaria(request, CCODGES, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen011Service - m�todo m_form", e);
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
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, Axispen011Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(null);
			logger.debug(map);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axispen011Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (isEmpty(formdata.get("listValores"))) {
				formdata.put("listValores", listValores);
			}
		}
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
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_nueva_depositaria(HttpServletRequest request) {
		logger.debug("Axispen011Service m_nueva_depositaria");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal CCODDEP = getCampoNumerico(request, "CCODDEP");
		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
		BigDecimal NNUMIDE = getCampoNumerico(request, "NNUMIDE");
		String FALTA = getCampoTextual(request, "FALTA");
		BigDecimal FBAJA = null;
		BigDecimal CBANCO = null;

		// Carga de actividades de producto
		try {

			// Map map =
			// new
			// PAC_IAX_PENSIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PENSIONES__F_SET_PDEPOSITARIAS(CCODDEP,FALTA,FBAJA,SPERSON,CBANCO);

			// tratarRETURNyMENSAJES(request, map);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axipen011 Service - m�todo  m_nueva_depositaria", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_modificar_depositaria(HttpServletRequest request, BigDecimal CCODDEP, Map formdata) {
		logger.debug("Axispen011Service m_modificar_depositaria");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Carga de actividades de producto
		try {

			Map map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_GET_OB_PDEPOSITARIAS(CCODDEP);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			formdata.putAll((HashMap) map.get("PDEPOSITARIAS"));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axipen011 Service - m�todo  m_modificar_depositaria", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
