package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FACTURAS;
import axis.jdbc.PAC_IAX_GEDOX;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axisfis003Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisfis003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/******************************************************
	 * z
	 ***************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisfis003Action thisAction) {
		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			String NFACT = getCampoTextual(request, "NFACT");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_INICIALIZAFACTURA(NFACT, CAGENTE);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisfis003Action thisAction) {
		logger.debug("Axisfis003Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1100));
			logger.debug(map);
			LISTVALORES.put("LSTCONCEPTO", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			this.m_buscar(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm057Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_buscar(HttpServletRequest request, Axisfis003Action thisAction) {
		logger.debug("Axisfis003Service m_buscar");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String NFACT = getCampoTextual(request, "NFACT");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_GET_FACTURA(NFACT);
			logger.debug("----> Factura:" + map.get("POFACTURAS"));

			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));

			} else {
				formdata.put("OK", new BigDecimal(1));
			}

			BigDecimal IDDOCGEDOX = (BigDecimal) ((Map) map.get("POFACTURAS")).get("IDDOCGEDOX");
			if (!this.isEmpty(IDDOCGEDOX)) {
				Map map2 = new PAC_IAX_GEDOX((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GEDOX__F_GEDOX_VERDOC(IDDOCGEDOX);
				logger.debug("----> IDDOCGEDOX:" + map2);
				tratarRETURNyMENSAJES(request, map2);
				((Map) map.get("POFACTURAS")).put("RUTAGEDOX", map2);
			}

			formdata.put("OB_FACTURA", map.get("POFACTURAS"));
			logger.debug("----> formdata:" + formdata);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, Axisfis003Action thisAction) {
		logger.debug("Axisfis003Service m_aceptar");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String NFACT = getCampoTextual(request, "NFACT");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_SET_DETFACTURA(NFACT);

			tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map.get("RETURN")))
				if (map.get("RETURN").equals(new BigDecimal(0))) {
					formdata.put("NFACT", "");
				}
			this.m_init(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_emitir(HttpServletRequest request, Axisfis003Action thisAction) {
		logger.debug("Axisfis003Service m_emitir");
		try {

			String NFACT = getCampoTextual(request, "NFACT");
			// BigDecimal SFACT = getHiddenCampoNumerico(request,"SFACT");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_EMITIR_FACTURA(CEMPRES, NFACT, CAGENTE);

			tratarRETURNyMENSAJES(request, map);

			this.m_init(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_emitir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_anular(HttpServletRequest request, Axisfis003Action thisAction) {
		logger.debug("Axisfis003Service m_anular");
		try {

			String NFACT = getCampoTextual(request, "NFACT");
			// BigDecimal SFACT = getHiddenCampoNumerico(request,"SFACT");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_ANULAR_FACTURA(CEMPRES, NFACT, CAGENTE);

			tratarRETURNyMENSAJES(request, map);

			this.m_init(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_anular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_del_detalle(HttpServletRequest request) {
		logger.debug("Axisfis003Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String NFACT = getCampoTextual(request, "PNFACT");
			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "PNORDEN");

			Map m = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_DEL_OBJ_DETFACTURA(NFACT, NORDEN);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_guardar_detalle(HttpServletRequest request) {
		logger.debug("Axisfis003Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String PNFACT = getCampoTextual(request, "PNFACT");
			BigDecimal PNORDEN = this.getHiddenCampoNumerico(request, "PNORDEN");
			BigDecimal PTCONCEPTO = this.getHiddenCampoNumerico(request, "PTCONCEPTO");
			BigDecimal PIIMPORTE = this.getHiddenCampoNumerico(request, "PIIMPORTE");
			// BigDecimal PIIPRF = this.getHiddenCampoNumerico(request,"PIIPRF");
			// BigDecimal PIIMPCTA = this.getHiddenCampoNumerico(request,"PIIMPCTA");

			Map m = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_SET_OBJ_DETFACTURA(PNFACT, PNORDEN, PTCONCEPTO, PIIMPORTE);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_ins_detalle(HttpServletRequest request) {
		logger.debug("Axisfis003Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String PNFACT = getCampoTextual(request, "PNFACT");

			Map m = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_INSERT_OBJ_DETFACTURA(PNFACT);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_autoriza(HttpServletRequest request, Axisfis003Action thisAction) {
		logger.debug("Axisfis003Service m_autoriza");
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String NFACT = getCampoTextual(request, "NFACT");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_AUTORIZA_FACTURA(CEMPRES, NFACT, CAGENTE);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis003Service - m�todo m_autoriza", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
