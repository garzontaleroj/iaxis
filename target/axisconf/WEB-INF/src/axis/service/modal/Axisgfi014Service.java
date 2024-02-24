package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisgfi014Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisgfi014Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisgfi014Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal NTRAMO = getCampoNumerico(request, "NTRAMO");

			String CONCEPTO = getCampoTextual(request, "CONCEPTO");
			String CONCEPTO_FRANJA = getCampoTextual(request, "CONCEPTO_FRANJA");
			String CONCEPTO_VALOR = getCampoTextual(request, "CONCEPTO_VALOR");

			// Actualizamos valores en el formdata
			formdata.put("NTRAMO", NTRAMO);
			formdata.put("CONCEPTO", CONCEPTO);
			formdata.put("CONCEPTO_FRANJA", CONCEPTO_FRANJA);
			formdata.put("CONCEPTO_VALOR", CONCEPTO_VALOR);

			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_VIGTRAMOS(NTRAMO);
			ArrayList lista_vigencias = (ArrayList) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("lista_vigencias", lista_vigencias);
			formdata.put("DETTRAMO", null);

			if (lista_vigencias != null && formdata.get("DETRAMO") == null) {
				HashMap mapa = (HashMap) lista_vigencias.get(0);
				formdata.put("DETTRAMO", mapa.get("DETALLE_TRAMO"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
	public

			void m_alta(HttpServletRequest request) {
		logger.debug("Axisgfi014Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		request.removeAttribute("NFACT");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		Date FECHA_ACTUAL = new Date(today.getTime());
		return FECHA_ACTUAL;

	}

	/**
	 * Carga las garantias a partir del SSEGURO
	 * 
	 * @param request
	 */
	public void m_ajax_ordenes(HttpServletRequest request) {
		logger.debug("Axisgfi014Service m_ajax_ordenes");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal DETALLE_TRAMO = getCampoNumerico(request, "DETALLE_TRAMO");

			PAC_IAX_GFI pac_axis_siniestros = new PAC_IAX_GFI(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_GFI__F_GET_DETVIGTRAMOS(DETALLE_TRAMO);
			logger.debug(map);

			if (!isEmpty(map)) {
				List listaDetalle = (List) tratarRETURNyMENSAJES(request, map);
				ajax.guardarContenidoFinalAContenedorAjax(listaDetalle);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi014Service - m�todo m_ajax_ordenes", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	public void m_guardar_vigencia(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NTRAMO = getCampoNumerico(request, "NTRAMO");
			BigDecimal DETALLE_TRAMO = getCampoNumerico(request, "DETALLE_TRAMO");
			Date FECHA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
			java.sql.Date FECHA_2 = FECHA != null ? new java.sql.Date(FECHA.getTime()) : null;

			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABARVIGTRAM(NTRAMO, FECHA, DETALLE_TRAMO);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			m_recargar(request); //

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	public void m_guardar_detalle_vigencia(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal DETALLE_TRAMO_VIGENCIA = getCampoNumerico(request, "DETALLE_TRAMO_VIGENCIA"); // ???
			BigDecimal ORDEN = getCampoNumerico(request, "ORDEN");
			BigDecimal DESDE = getCampoNumerico(request, "DESDE");
			BigDecimal HASTA = getCampoNumerico(request, "HASTA");
			BigDecimal VALOR = getCampoNumerico(request, "VALOR");
			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABARDETVIGTRAM(DETALLE_TRAMO_VIGENCIA, ORDEN, DESDE, HASTA, VALOR);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			m_recargar(request); // Recargar� toda la pantalla - seccion vigencias incluida

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	private void m_recargar(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NTRAMO = getCampoNumerico(request, "NTRAMO");

			String CONCEPTO = getCampoTextual(request, "CONCEPTO");
			String CONCEPTO_FRANJA = getCampoTextual(request, "CONCEPTO_FRANJA");
			String CONCEPTO_VALOR = getCampoTextual(request, "CONCEPTO_VALOR");

			// Actualizamos valores en el formdata
			formdata.put("NTRAMO", NTRAMO);
			formdata.put("CONCEPTO", CONCEPTO);
			formdata.put("CONCEPTO_FRANJA", CONCEPTO_FRANJA);
			formdata.put("CONCEPTO_VALOR", CONCEPTO_VALOR);

			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_VIGTRAMOS(NTRAMO);
			ArrayList lista_vigencias = (ArrayList) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("lista_vigencias", lista_vigencias);
			if (lista_vigencias != null && formdata.get("DETTRAMO") == null) { // TRAMO
				HashMap mapa = (HashMap) lista_vigencias.get(0);
				formdata.put("DETTRAMO", mapa.get("DETALLE_TRAMO"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	public void m_borrar_vigencia(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NTRAMO = getCampoNumerico(request, "NTRAMO");
			BigDecimal DETALLE_TRAMO = getCampoNumerico(request, "DETALLE_TRAMO");

			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_ELIMINARVIGENCIA(NTRAMO, DETALLE_TRAMO);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			m_recargar(request); //

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	public void m_borrar_detalle_vigencia(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NTRAMO = getCampoNumerico(request, "NTRAMO");
			BigDecimal DETALLE_TRAMO = getCampoNumerico(request, "DETALLE_TRAMO");
			BigDecimal ORDEN = getCampoNumerico(request, "ORDEN");
			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_ELIMINARDETVIGENCIA(DETALLE_TRAMO, ORDEN);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			m_recargar(request); //

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
