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

import axis.jdbc.PAC_IAX_COBRADOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisage032Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisage032Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisage032Action thisAction) {
		try {
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Rellena la combo de estado de liquidacion. para poder realizar una b�squeda
	 * nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisage032Action thisAction) {

		log.debug("Axisage032Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = usuario.getCempres();
		request.setAttribute("CEMPRES", CEMPRES);
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map forma_de_cobro = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(32002));
			log.debug("forma_de_cobro: " + forma_de_cobro);
			List formaCobro = (List) tratarRETURNyMENSAJES(request, forma_de_cobro);
			request.getSession().setAttribute("FORMA_DE_COBRO", formaCobro);

			Map map4 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRES);
			List T_IAX_COBRADORES = (List) tratarRETURNyMENSAJES(request, map4);

			request.setAttribute("REC_IAX_COBRADORES", !isEmpty(T_IAX_COBRADORES) ? T_IAX_COBRADORES : new ArrayList());

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Rellena la combo de estado de liquidacion. para poder realizar una b�squeda
	 * nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_modificar(HttpServletRequest request, Axisage032Action thisAction) {

		log.debug("Axisage032Service m_modificar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map forma_de_cobro = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(32002));
			log.debug("forma_de_cobro: " + forma_de_cobro);
			List formaCobro = (List) tratarRETURNyMENSAJES(request, forma_de_cobro);
			request.getSession().setAttribute("FORMA_DE_COBRO", formaCobro);
			SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");

			BigDecimal NLIQLIN = getCampoNumerico(request, "NLIQLIN_aux");
			BigDecimal CCOBRO = getCampoNumerico(request, "CCOBRO_aux");
			String DOCUMENTO = getCampoTextual(request, "DOCUMENTO_aux");
			String TBANCO = getCampoTextual(request, "TBANCO_aux");
			BigDecimal BANCO = getCampoNumerico(request, "BANCO_aux");
			String IMPORTE = getCampoTextual(request, "IMPORTE_aux");
			Date FDOCUMENTO = null;
			if (getCampoTextual(request, "FDOCUMENTO_aux") != null
					&& getCampoTextual(request, "FDOCUMENTO_aux") != "") {
				FDOCUMENTO = new java.sql.Date(
						(formatoDelTexto.parse(getCampoTextual(request, "FDOCUMENTO_aux"))).getTime());
			}

			BigDecimal CEMPRES = usuario.getCempres();
			Map map4 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRES);
			List T_IAX_COBRADORES = (List) tratarRETURNyMENSAJES(request, map4);

			request.setAttribute("REC_IAX_COBRADORES", !isEmpty(T_IAX_COBRADORES) ? T_IAX_COBRADORES : new ArrayList());
			String OBSERVACIONES = getCampoTextual(request, "OBSERVACIONES_aux");

			formdata.put("CATRIBU", CCOBRO);
			formdata.put("DOCUM", DOCUMENTO);
			formdata.put("TBANCO", TBANCO);
			formdata.put("CBANCO", BANCO);
			formdata.put("IIMPORTE", Float.parseFloat(IMPORTE));
			formdata.put("FDOC", FDOCUMENTO);
			formdata.put("TNATRIE", OBSERVACIONES);
			formdata.put("NLIQLIN", NLIQLIN);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	 * Realiza una b�squeda de bancos
	 * 
	 * @see Axisage032Service#bancos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_banco(HttpServletRequest request) {
		log.info("Axisage032Service m_ajax_actualizar_banco");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			Map m = (Map) this.ActualizaBanco(request, CBANCO);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			log.error("Error en el servicio Axisage032Service - m�todo m_ajax_actualizar_banco", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaBanco(HttpServletRequest request, BigDecimal CBANCO) throws Exception {

		Map mapBancos = new HashMap();

		// Cargar Bancos de la BD
		Map banco = new HashMap();
		if (!isEmpty(CBANCO)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			mapBancos = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(CBANCO, null);
			log.debug(mapBancos);
			List bancos = (List) mapBancos.get("RETURN");
			if (!isEmpty(mapBancos.get("RETURN")))
				banco = (Map) bancos.get(0);
		}

		request.setAttribute("axisctr_banco", banco);
		return mapBancos;
	}

	/**
	 * Dado un banco seleccionado en el modal de selecci�n de bancos (axisadm062),
	 * �ste m�todo recibe el atributo CBANCO del banco y lo pone en el par�metro de
	 * sesi�n axisctr_banco.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_banco(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");

			if (!isEmpty(CBANCO)) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_COBRADOR__F_GET_DESBANCO(CBANCO);
				log.debug("----> TBANCO axisage032:" + map.get("PTBANCO"));
				tratarRETURNyMENSAJES(request, map, false);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}

		} catch (Exception e) {
			log.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
