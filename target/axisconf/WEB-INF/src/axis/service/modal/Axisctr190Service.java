//Revision:# WYVRR4oDpzRyPZUnQBn1Pw== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr190Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request) {

		try {

			log.debug("Axisctr190Service m_form");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			log.debug("SSEGURO : " + SSEGURO);

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

		} catch (Exception e) {
			log.error("Error en el servicio Axisctr190Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_aceptar(HttpServletRequest request) {
		log.debug("Axisctr190Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_TEXT");

			java.sql.Date FEFECTO = stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"));
			String RESUMEN = this.getHiddenCampoTextual(request, "RESUMEN");
			log.debug("SSEGURO : " + SSEGURO);
			log.debug("FEFECTO : " + FEFECTO);
			log.debug("RESUMEN : " + RESUMEN);
			// FIXME PTIPOTABLAS de momento a 0
			BigDecimal PTIPOTABLAS = new BigDecimal(0);
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = new HashMap();
			map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_DUP_SEGURO(SSEGURO, FEFECTO, RESUMEN, PTIPOTABLAS,
					CAGENTE);
			log.debug("Axisctr190Service map:" + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK_acceptar", "0");

				if (!isEmpty(map.get("MENSAJES")))
					request.getSession().setAttribute("PRETEN_MENSAJES",
							((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES")).get("TERROR"));
				request.getSession().setAttribute("SOLICITUDUPLIC", map.get("PNSOLICIDEST"));

			}
		} catch (Exception e) {
			log.error("Error en el servicio Axisctr190Service - m�todo m_acceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {

			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
