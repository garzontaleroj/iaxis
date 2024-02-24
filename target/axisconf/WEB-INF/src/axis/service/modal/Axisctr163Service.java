package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr163Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr163Action.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr163Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	// f_get_detallegarantia
	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr163Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.dbGrabarObjetoDb(request, usuario);
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr163Action thisAction) {
		logger.debug("Axiscrt163Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			if (!isEmpty(this.getCampoTextual(request, "origen"))
					&& this.getCampoTextual(request, "origen").equals("axisctr009"))
				AbstractDispatchAction.topPila(request, "CMODO", "GENERAL");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");
			BigDecimal NDETGAR = this.getHiddenCampoNumerico(request, "NDETGAR");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLEGARANTIA(NRIESGO, CGARANT, NDETGAR);
			logger.debug(map);

			if (!isEmpty(this.tratarRETURNyMENSAJES(request, map)))
				formdata.putAll((HashMap) this.tratarRETURNyMENSAJES(request, map));

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt163Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla.
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisctr163Action thisAction) {
		logger.debug("Axiscrt163Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			/*
			 * Combo de ejemplo :
			 * 
			 * PAC_IAX_LISTVALORES pac_axis_listValores = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 * 
			 * 
			 * Cargar la lista de Conceptos
			 */
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt163Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	public void m_ajax_del_detalle(HttpServletRequest request) {
		logger.debug("Axisctr163Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");

			BigDecimal NMOVIMI = this.getHiddenCampoNumerico(request, "NMOVIMI");
			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "NORDEN");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_DEL_DESGLOSEGAR(SSEGURO, CGARANT, NRIESGO, NMOVIMI, NORDEN);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr163Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_guardar_detalle(HttpServletRequest request) {
		logger.debug("Axisctr163 m_guardar_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");

			BigDecimal NMOVIMI = this.getHiddenCampoNumerico(request, "NMOVIMI");
			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "NORDEN");
			BigDecimal CCONCEPTO = this.getHiddenCampoNumerico(request, "CCONCEPTO");
			String TDESCRIPCION = this.getHiddenCampoTextual(request, "TDESCRIPCION");
			BigDecimal ICAPITAL = this.getHiddenCampoNumerico(request, "ICAPITAL");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_DESGLOSEGAR(SSEGURO, CGARANT, NRIESGO, NMOVIMI, NORDEN, CCONCEPTO,
							TDESCRIPCION, ICAPITAL);
			logger.debug(m);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(m, new String[] { "PNSEQ_OUT" });

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map PNSEQ_OUT = new HashMap();
				PNSEQ_OUT.put("PNSEQ_OUT", resultadoAjax[1]);
				logger.debug(resultadoAjax[1]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(PNSEQ_OUT);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm036Service - m�todo m_guardar_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cancelar_desglose(HttpServletRequest request) {
		logger.debug("Axisctr163Service m_ajax_cancelar_desglose");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BD(NRIESGO);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr163Service - m�todo m_ajax_cancelar_desglose", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
