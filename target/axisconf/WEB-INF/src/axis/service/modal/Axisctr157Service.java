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
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr157Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr157Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisctr157Service extends AxisBaseService {
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

	public void m_form(HttpServletRequest request, Axisctr157Action thisAction) {
		logger.debug("Axisctr157Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap listValores = new HashMap();
		try {
			// Lista tipo de cuentas
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
			logger.debug("cccc:" + map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

			request.setAttribute("listValores", listValores);
			// m_carga_lista_depositaria(request, formdata);

			BigDecimal CFON = getCampoNumerico(request, "CFON");
			String FONDGS = getCampoTextual(request, "CFONDGS");
			String DEPDGS = getCampoTextual(request, "CDEP");
			String NOMFON = getCampoTextual(request, "NFON");
			String NOMDEP = getCampoTextual(request, "NDEP");
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIP");
			String CBANCAR = getCampoTextual(request, "CBAN");
			BigDecimal CTRASP = getCampoNumerico(request, "CTRA");

			formdata.put("CASEG", CFON);
			formdata.put("CCODDGS", FONDGS);
			formdata.put("TNOMBRE", NOMFON);
			formdata.put("CDEPDGS", DEPDGS);
			formdata.put("TDEPDGS", NOMDEP);
			formdata.put("CTIPBAN", CTIPBAN);
			formdata.put("CBANCAR", CBANCAR);
			formdata.put("CLISTBLANC", CTRASP);
			formdata.put("MOD", getCampoTextual(request, "modus"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr157Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
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

	public void m_grabar(HttpServletRequest request, Axisctr157Action thisAction) {
		logger.debug("Axisctr157Service m_grabar");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		/*
		 * formdata.put("CASEG", CFON); formdata.put("CCODDGS", FONDGS);
		 * formdata.put("TNOMBRE", NOMFON); formdata.put("CDEPDGS", DEPDGS);
		 * formdata.put("TDEPDGS", NOMDEP);
		 */

		BigDecimal CFON = getCampoNumerico(request, "CASEG");
		BigDecimal CDEP = getCampoNumerico(request, "CDEPDGS");
		String MODO = getCampoTextual(request, "MOD");

		String CBANCAR = getCampoTextual(request, "CBANCAR");
		BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
		BigDecimal CLISTBLANC = getCampoNumerico(request, "CLISTBLANC");

		try {

			Map map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_SET_PDEPOSITARIAS(CFON, null, CDEP, null, null, null, CTIPBAN, CBANCAR,
							CLISTBLANC, null, MODO);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				formdata.put("ok", "ok");

			/*
			 * formdata.put("CCODDGS2", CCODDGS); formdata.put("TNOMBRE2", TNOMBRE);
			 * formdata.put("CCODPLA2", CCODPLA);
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axictr157 Service - m�todo  m_nueva_gestora", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_depo(HttpServletRequest request) {

		logger.debug("Axisctr157Service m_ajax_depo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CDEPDGS = this.getCampoNumerico(request, "CDEP2");

			logger.debug("depo:" + CDEPDGS);

			// encuentro datos
			HashMap m = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_GET_OB_PDEPOSITARIAS(CDEPDGS);
			logger.debug(m);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				logger.debug("OK.OK");
				ajax.guardarContenidoFinalAContenedorAjax(m.get("PDEPOSITARIAS"));
			} else {
				logger.debug("KO!!!");
				formdata.put("CDEPDGS", "");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_ajax_poliza_destino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

}
