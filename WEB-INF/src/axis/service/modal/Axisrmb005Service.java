package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REEMBOLSOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrmb005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrmb005Service.java 20/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a> - Finalizar Desarrollo -
 *         Modificaci�n Funciones PL
 * @since Java 5.0
 */
public class Axisrmb005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * 
	 * @param request
	 */

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrmb005Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			logger.debug("MENSAJES ====================================================" + mensajes);

			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal NFACT = getCampoNumerico(request, "NFACT");
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");

			/* Recuperar los datos del reembolso */
			if (!isEmpty(NREEMB)) {
				Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATREEMB(NREEMB);
				logger.debug(map);
				Map OB_IAX_REEMBOLSO = (Map) tratarRETURNyMENSAJES(request, map);

				if (OB_IAX_REEMBOLSO != null)
					formdata.putAll(OB_IAX_REEMBOLSO);
			}
			mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			logger.debug("MENSAJES ====================================================" + mensajes);

			/* Recuperar los datos de la factura */
			if (!isEmpty(NFACT)) {
				Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBFACT(NREEMB, NFACT);
				logger.debug(map);
				Map OB_IAX_FACTURA = (Map) tratarRETURNyMENSAJES(request, map);

				if (OB_IAX_FACTURA != null)
					formdata.putAll(OB_IAX_FACTURA);

			}
			mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			logger.debug("MENSAJES ====================================================" + mensajes);
			/* Recuperar datos del acto */
			if (!isEmpty(NLINEA) && !isEmpty(NFACT) && !isEmpty(NREEMB)) {

				Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBACTFACT(NREEMB, NFACT, NLINEA);
				logger.debug("DATOS ACTO  axisrmb005---------------------------------------->" + map);
				Map OB_IAX_ACTO = (Map) tratarRETURNyMENSAJES(request, map);

				if (OB_IAX_ACTO != null) {
					formdata.putAll(OB_IAX_ACTO);
				}

			} else {
				Object obj = new Object();
				Map mapa = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal("893"), "CATRIBU=1");
				ArrayList lixt_acto = (ArrayList) tratarRETURNyMENSAJES(request, mapa);
				if (lixt_acto != null) {
					HashMap mapa_lixt_acto = (HashMap) lixt_acto.get(0);
					String lit_acto = (String) mapa_lixt_acto.get("TATRIBU");
					formdata.put("TORIGEN", lit_acto);
				}
			}

			mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			logger.debug("MENSAJES ====================================================" + mensajes);

			/* Recuperamos validez del campo IAHORRO */
			Map mapa = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_ISPERFILCOMPANY();
			BigDecimal validado_IAHORRO = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (validado_IAHORRO != null && validado_IAHORRO.intValue() == 1) {
				formdata.put("IAHORRO_OK", "1");
			} else {
				formdata.put("IAHORRO_OK", "0");
			}

			Map map1 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOACTOS();

			logger.debug("F_GET_LSTTIPOACTO return: " + map1);

			List listaTipos = (List) tratarRETURNyMENSAJES(request, map1);
			formdata.put("listaTipos", listaTipos);
			listaTipos = null;

			mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			logger.debug("MENSAJES ====================================================" + mensajes);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb005Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
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

	public void m_alta_acto(HttpServletRequest request) {
		logger.debug("Axisrmb005Service m_alta_acto");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			String CACTO = getCampoTextual(request, "CACTO");
			BigDecimal NACTO = getCampoNumerico(request, "NACTO");
			BigDecimal PREEMB = getCampoNumerico(request, "PREEMB");
			Date FACTO = getCampoTextual(request, "FACTO") != null ? sdf.parse(getCampoTextual(request, "FACTO"))
					: null;
			java.sql.Date FACTO_2 = FACTO != null ? new java.sql.Date(FACTO.getTime()) : null;
			Date FBAJA = getCampoTextual(request, "FBAJA") != null ? sdf.parse(getCampoTextual(request, "FBAJA"))
					: null;
			java.sql.Date FBAJA_2 = FBAJA != null ? new java.sql.Date(FBAJA.getTime()) : null;
			Date FTRANS = getCampoTextual(request, "FTRANS") != null ? sdf.parse(getCampoTextual(request, "FTRANS"))
					: null;
			java.sql.Date FTRANS_2 = FTRANS != null ? new java.sql.Date(FTRANS.getTime()) : null;

			BigDecimal ITOT = getCampoNumerico(request, "ITOT");
			BigDecimal IEXTRA = getCampoNumerico(request, "IEXTRA");
			BigDecimal IPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal IAHORRO = getCampoNumerico(request, "IAHORRO");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal NFACT = getCampoNumerico(request, "NFACT");

			BigDecimal ITARCASS = getCampoNumerico(request, "ITARCASS");
			BigDecimal ICASS = getCampoNumerico(request, "ICASS");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			BigDecimal IPAGOCOMP = getCampoNumerico(request, "IPAGOCOMP");

			/* Alta Acto */
			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_SET_REEMBFACTACT(NREEMB, NFACT, CACTO, NACTO, FACTO_2, ITARCASS,
							ICASS, PREEMB, ITOT, IEXTRA, IPAGO, IAHORRO, FBAJA_2, NLINEA, CTIPO, IPAGOCOMP, FTRANS_2);

			logger.debug("------ERRORES-------ERRORES-------ERRORES---------:" + map);

			if (map != null) {
				BigDecimal nueva_linea = (BigDecimal) map.get("PNLINEANEW");
				formdata.put("NLINEA", nueva_linea);
				if (nueva_linea != null && nueva_linea.intValue() > 0) {
					formdata.put("ALTAL", 0);
				} else {
					formdata.put("ALTAL", 1);
				}
				formdata.put("NLINEA", nueva_linea);

				BigDecimal CTIPOMSJ = (BigDecimal) map.get("CTIPOMSJ");

				if (CTIPOMSJ == null || CTIPOMSJ.intValue() == 1) {
					tratarRETURNyMENSAJES(request, map);
					HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
					logger.debug("MENSAJES ====================================================" + mensajes);
				} else {

					if (CTIPOMSJ.intValue() == 2) {
						ArrayList lista_errores = (ArrayList) map.get("MENSAJES");
						String desc_error = "TEXTO DE PRUEBA";
						logger.debug("------ERRORES-------ERRORES-------ERRORES---------:" + lista_errores);

						if (lista_errores != null) {
							Map mapa_error = (Map) lista_errores.get(0);
							logger.debug("------ERRORES-------ERRORES-------ERRORES---------:" + mapa_error);
							Map mapa_error2 = (Map) mapa_error.get("OB_IAX_MENSAJES");
							desc_error = (String) mapa_error2.get("TERROR");
							logger.debug("------ERRORES-------ERRORES-------ERRORES---------:" + desc_error);
						}

						formdata.put("DESCRIPCION_ERROR", desc_error);

					}
				}

			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb005Service - m�todo m_alta_acto", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar_errores(HttpServletRequest request) {
		logger.debug("Axisrmb005Service m_borrar errores");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_NETEJA_ERRORS();
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb005Service - m�todo m_borrar_errores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE AJAX
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request, thisAction
	 */

	public void m_ajax_actualiza_importes(HttpServletRequest request, Axisrmb005Action thisAction) {

		logger.debug("Axisrmb005Service m_ajax_actualiza_importes");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CACTO = getCampoTextual(request, "CACTO");
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			Date FACTO = getCampoTextual(request, "FACTO") != null ? sdf.parse(getCampoTextual(request, "FACTO"))
					: null;
			java.sql.Date FACTO_2 = FACTO != null ? new java.sql.Date(FACTO.getTime()) : null;

			/* Llamada a actualizar importes */
			Map mapaImportes = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_GET_IMPORTACTO(NREEMB, CACTO, FACTO_2);
			logger.debug("DATOS PAGO  axisrmb005---------------------------------------->" + mapaImportes);

			if (!isEmpty(mapaImportes)) {
				BigDecimal cuentasTomador = (BigDecimal) ajax.rellenarPlAContenedorAjax(mapaImportes);
				ajax.guardarContenidoFinalAContenedorAjax(mapaImportes);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb005Service - m�todo m_ajax_actualiza_importes", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request, thisAction
	 */

	public void m_ajax_obtener_importe(HttpServletRequest request, Axisrmb005Action thisAction) {

		logger.debug("Axisrmb005Service m_ajax_obtener_importe");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			String CACTO = getCampoTextual(request, "CACTO");
			BigDecimal NACTOS = getCampoNumerico(request, "NACTO");
			BigDecimal ICASS = getCampoNumerico(request, "ICASS");
			BigDecimal IPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal PREEMB = getCampoNumerico(request, "PREEMB");
			BigDecimal ITARCASS = getCampoNumerico(request, "ITARCASS");

			logger.debug(ITARCASS);

			Date FACTO = getCampoTextual(request, "FACTO") != null ? sdf.parse(getCampoTextual(request, "FACTO"))
					: null;
			java.sql.Date FACTO_2 = FACTO != null ? new java.sql.Date(FACTO.getTime()) : null;

			/* Llamada a actualizar importes */
			Map mapaImportes = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_CALCACTO(NREEMB, CACTO, FACTO_2, NACTOS, ITARCASS, ICASS, IPAGO,
							PREEMB);
			logger.debug("DATOS PAGO  axisrmb005---------------------------------------->" + mapaImportes);

			if (!isEmpty(mapaImportes)) {
				BigDecimal cuentasTomador = (BigDecimal) ajax.rellenarPlAContenedorAjax(mapaImportes);
				ajax.guardarContenidoFinalAContenedorAjax(mapaImportes);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb005Service - m�todo m_ajax_actualiza_importes", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_ajax_obtener_importe_comp(HttpServletRequest request, Axisrmb005Action thisAction) {

		logger.debug("Axisrmb005Service m_ajax_obtener_importe_comp");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal ITOT = getCampoNumerico(request, "ITOT");
			BigDecimal IPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal ICASS = getCampoNumerico(request, "ICASS");

			logger.debug(ITOT);

			/* Llamada a actualizar importes complementos */
			Map mapaImportes = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_CALCOMPLEMENTARIO(ITOT, IPAGO, ICASS);
			logger.debug("DATOS PAGO COMPLEMENTO axisrmb005---------------------------------------->" + mapaImportes);

			if (!isEmpty(mapaImportes)) {
				BigDecimal cuentasTomador = (BigDecimal) ajax.rellenarPlAContenedorAjax(mapaImportes);
				ajax.guardarContenidoFinalAContenedorAjax(mapaImportes);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb005Service - m�todo m_ajax_actualiza_importes_comp", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/*
	 * m�todo que recoge la lista de CACTOS
	 */

	public void m_ajax_acto(HttpServletRequest request, Axisrmb005Action thisAction) {
		logger.debug("Axisrmb005Service m_ajax_acto");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			String CACTO = this.getCampoTextual(request, "CACTO");
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
			String AGR_SALUD = this.getCampoTextual(request, "AGR_SALUD");
			PAC_IAX_DESCVALORES pac_axis_acto = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CACTO")) {
				Map map = pac_axis_acto.ejecutaPAC_IAX_DESCVALORES__F_DESCREEMBACTOS(CACTO, CGARANT, AGR_SALUD);

				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map acto = new HashMap();
					acto.put("CACTO", CACTO);
					acto.put("TACTO", map.get("RETURN"));
					formdata.put("CACTO", CACTO);
					formdata.put("TACTO", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(acto);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map acto = new HashMap();
					acto.put("CACTO", CACTO);
					formdata.put("CACTO", CACTO);
					acto.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(acto);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb005Service - m�todo m_ajax_acto", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
