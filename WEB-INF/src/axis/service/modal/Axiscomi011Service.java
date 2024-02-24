package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.modal.Axiscomi011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axiscomi011Service.java 06/10/2011
 * 
 * @author <a href="joan_torres@csi-ti.com">Joan Torres</a>
 * @since Java 5.0
 */
public class Axiscomi011Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axiscomi011Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PSPRODUC = this.getHiddenCampoNumerico(request, "PSPRODUC");
			BigDecimal PCACTIVI = this.getHiddenCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = this.getHiddenCampoNumerico(request, "PCGARANT");
			BigDecimal PCCOMISI = this.getHiddenCampoNumerico(request, "PCCOMISI");
			BigDecimal PCMODCOM = this.getHiddenCampoNumerico(request, "PCMODCOM");
			logger.debug(
					"Params ----> " + PSPRODUC + "#" + PCACTIVI + "#" + PCGARANT + "#" + PCCOMISI + "#" + PCMODCOM);
			// java.sql.Date PFINIVIG =
			// this.stringToSqlDate(this.getHiddenCampoTextual(request,"PFINIVIG"));
			Map mp = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_FECHAVIGENCIA(PCCOMISI);
			logger.debug("mp ----> " + mp);
			java.sql.Date PFINIVIG = (java.sql.Date) mp.get("RETURN");

			formdata.put("PSPRODUC", PSPRODUC);
			formdata.put("PCACTIVI", PCACTIVI);
			formdata.put("PCGARANT", PCGARANT);
			formdata.put("PCCOMISI", PCCOMISI);
			formdata.put("PCMODCOM", PCMODCOM);
			formdata.put("PFINIVIG", PFINIVIG);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(67));
			ArrayList lista_mod = (ArrayList) tratarRETURNyMENSAJES(request, map, false);

			for (int i = 0; i < lista_mod.size(); i++) {
				if ((((HashMap) lista_mod.get(i)).get("CATRIBU")).equals(PCMODCOM)) {
					formdata.put("TMODCOM", (String) (((HashMap) lista_mod.get(i)).get("TATRIBU")));
				}
			}

			Map m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI, PCGARANT, null, PCMODCOM,
							PFINIVIG);
			logger.debug(m);
			tratarRETURNyMENSAJES(request, m);

			this.dbGetCriterios(request);

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
	public void m_form(HttpServletRequest request, Axiscomi011Action thisAction) {
		logger.debug("Axiscomi011Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal PSPRODUC = this.getHiddenCampoNumerico(request, "PSPRODUC");
			BigDecimal PCACTIVI = this.getHiddenCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = this.getHiddenCampoNumerico(request, "PCGARANT");
			BigDecimal PCCOMISI = this.getHiddenCampoNumerico(request, "PCCOMISI");
			BigDecimal PCMODCOM = this.getHiddenCampoNumerico(request, "PCMODCOM");
			java.sql.Date PFINIVIG = this.stringToSqlDate(this.getHiddenCampoTextual(request, "PFINIVIG"));

			logger.debug("Params ----> " + PSPRODUC + "#" + PCACTIVI + "#" + PCGARANT + "#" + PCCOMISI + "#" + PCMODCOM
					+ "#" + PFINIVIG);

			formdata.put("PSPRODUC", PSPRODUC);
			formdata.put("PCACTIVI", PCACTIVI);
			formdata.put("PCGARANT", PCGARANT);
			formdata.put("PCCOMISI", PCCOMISI);
			formdata.put("PCMODCOM", PCMODCOM);
			formdata.put("PFINIVIG", PFINIVIG);

			Map m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI, PCGARANT, null, PCMODCOM,
							PFINIVIG);
			logger.debug(m);
			tratarRETURNyMENSAJES(request, m, false);
			ArrayList lista = (ArrayList) m.get("PT_COMISION");
			formdata.put("PT_COMISION", lista);
			if (lista.size() > 0) {
				Map mm = (Map) lista.get(0);
				formdata.put("CCRITERIO", ((Map) mm.get("OB_IAX_DETCOMISION")).get("CCRITERIO"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt163Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	public void m_aceptar(HttpServletRequest request, Axiscomi011Action thisAction) {
		logger.debug("Axiscomi011Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		try {
			HashMap map = new HashMap();

			map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_SET_TRASPASO_DETALLE_OBJ_BD();
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (resultado.intValue() == 0)
				request.setAttribute("resultadoOK", "OK");
			else if (resultado.intValue() == -1)
				request.setAttribute("resultadoOK", "K");
			else
				request.setAttribute("resultadoOK", "KO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi011Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_del_detalle(HttpServletRequest request) {
		logger.debug("Axiscomi011Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal PSPRODUC = this.getHiddenCampoNumerico(request, "PSPRODUC");
			BigDecimal PCACTIVI = this.getHiddenCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = this.getHiddenCampoNumerico(request, "PCGARANT");
			BigDecimal PCCOMISI = this.getHiddenCampoNumerico(request, "PCCOMISI");
			BigDecimal PCMODCOM = this.getHiddenCampoNumerico(request, "PCMODCOM");
			String PFINIVIG_text = this.getHiddenCampoTextual(request, "PFINIVIG");
			java.sql.Date PFINIVIG = this.stringToSqlDate(PFINIVIG_text);
			//
			BigDecimal NDESDE = this.getCampoNumerico(request, "NDESDE");
			BigDecimal NHASTA = this.getCampoNumerico(request, "NHASTA");
			BigDecimal CCRITERIO = this.getCampoNumerico(request, "CCRITERIO");

			BigDecimal NINIALT = this.getCampoNumerico(request, "NINIALT");

			Map m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_DEL_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI, PCGARANT, null, PCMODCOM,
							PFINIVIG, NINIALT, CCRITERIO, NHASTA, NDESDE);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi011Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_guardar_detalle(HttpServletRequest request) {
		logger.debug("Axiscomi011 m_guardar_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PSPRODUC = this.getHiddenCampoNumerico(request, "PSPRODUC");
			BigDecimal PCACTIVI = this.getHiddenCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = this.getHiddenCampoNumerico(request, "PCGARANT");
			BigDecimal PCCOMISI = this.getHiddenCampoNumerico(request, "PCCOMISI");
			BigDecimal PCMODCOM = this.getHiddenCampoNumerico(request, "PCMODCOM");
			String PFINIVIG_text = this.getHiddenCampoTextual(request, "PFINIVIG");
			java.sql.Date PFINIVIG = this.stringToSqlDate(PFINIVIG_text);
			//
			BigDecimal PCOMISI = this.getCampoNumerico(request, "PCOMISI");
			BigDecimal NINIALT = this.getCampoNumerico(request, "NINIALT");
			BigDecimal HNINIALT = this.getCampoNumerico(request, "HNINIALT");
			BigDecimal NFINALT = this.getCampoNumerico(request, "NFINALT");
			BigDecimal NDESDE = this.getCampoNumerico(request, "NDESDE");
			BigDecimal NHASTA = this.getCampoNumerico(request, "NHASTA");
			BigDecimal CCRITERIO = this.getCampoNumerico(request, "CCRITERIO");

			logger.debug("Params ----> " + PSPRODUC + "#" + PCACTIVI + "#" + PCGARANT + "#" + PCCOMISI + "#" + PCMODCOM
					+ "#" + PFINIVIG_text + "#" + PFINIVIG + "#" + PCOMISI + "#" + NINIALT + "#" + NFINALT + "#"
					+ CCRITERIO + "#" + NDESDE + "#" + NHASTA);

			if (PCOMISI != null && NINIALT != null && NFINALT != null) {
				Map m;
				if (HNINIALT != null) {
					m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_COMISIONES__F_DEL_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI, PCGARANT, null,
									PCMODCOM, PFINIVIG, HNINIALT, CCRITERIO, NDESDE, NHASTA);
					logger.debug(m);
				}
				m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_COMISIONES__F_SET_DETALLE_COMISION(PCCOMISI, PSPRODUC, PCACTIVI, PCGARANT, null,
								PCMODCOM, PFINIVIG, PCOMISI, NINIALT, NFINALT, CCRITERIO, NDESDE, NHASTA, null);
				logger.debug(m);
				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm011Service - m�todo m_guardar_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cancelar_desglose(HttpServletRequest request) {
		logger.debug("Axiscomi011Service m_ajax_cancelar_desglose");
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal PSPRODUC = this.getHiddenCampoNumerico(request, "PSPRODUC");
			BigDecimal PCACTIVI = this.getHiddenCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = this.getHiddenCampoNumerico(request, "PCGARANT");
			BigDecimal PCCOMISI = this.getHiddenCampoNumerico(request, "PCCOMISI");
			BigDecimal PCMODCOM = this.getHiddenCampoNumerico(request, "PCMODCOM");
			java.sql.Date PFINIVIG = this.stringToSqlDate(this.getHiddenCampoTextual(request, "PFINIVIG"));

			Map m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_CANC_DETCOM_ALT(PCCOMISI, PSPRODUC, PCACTIVI, PCGARANT, null,
							PCMODCOM, PFINIVIG);

			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi011Service - m�todo m_ajax_cancelar_desglose", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de criterios.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCriterios(HttpServletRequest request) throws Exception {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos criterios:" + getCampoTextual(request, "CCRITERIO") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1200));
		logger.debug(m);
		List criterios = (List) tratarRETURNyMENSAJES(request, m, false);

		request.getSession().setAttribute("criterios", criterios);
		return criterios;
	}

	/**
	 * M�todo que recupera los valores del combo de criterios
	 * 
	 * @param request
	 */
	public void m_ajax_busqueda_criterios(HttpServletRequest request) {
		logger.debug("Axiscomi007Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCriterios(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_criterios", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

}
