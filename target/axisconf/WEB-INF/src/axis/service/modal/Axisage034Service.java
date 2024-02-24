//Revision:# SEyaxSIAugw12BgUH/vigw== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AUTOLIQUIDA;
import axis.jdbc.PAC_IAX_COBRADOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisage034Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr034Service;
import axis.util.Constantes;

public class Axisage034Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisage034Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisage034Action thisAction) {

		log.debug("Axisage034Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = usuario.getCempres();
		request.setAttribute("CEMPRES", CEMPRES);
		BigDecimal CAGECLAVE = new BigDecimal(request.getParameter("CAGECLAVE"));
		request.setAttribute("CAGECLAVE", CAGECLAVE);
		String CUSUARI = request.getParameter("CUSUARI");
		request.setAttribute("CUSUARI", CUSUARI);

		String CMODO = request.getParameter("CMODO");
		request.setAttribute("CMODO", CMODO);

		Date FCOBRO = stringToSqlDate(request.getParameter("FCOBRO"));
		request.setAttribute("FCOBRO", FCOBRO);
		Date FLIQUIDA = stringToSqlDate(request.getParameter("FLIQUIDA"));
		request.setAttribute("FLIQUIDA", FLIQUIDA);

		BigDecimal SPROLIQ;
		log.debug("form sproliq #####" + request.getAttribute("SPROLIQ"));

		if (!isEmpty(request.getAttribute("SPROLIQ")))
			SPROLIQ = (BigDecimal) (request.getAttribute("SPROLIQ"));
		else {
			if (request.getParameter("SPROLIQ").equals(""))
				SPROLIQ = new BigDecimal("0");
			else
				SPROLIQ = new BigDecimal(request.getParameter("SPROLIQ"));
		}
		request.setAttribute("SPROLIQ", SPROLIQ);
		try {
			log.debug(CEMPRES + " " + CAGECLAVE + " " + SPROLIQ);
			PAC_IAX_AUTOLIQUIDA pac_iax_autoliquida = new PAC_IAX_AUTOLIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map autoliq = pac_iax_autoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(SPROLIQ, CEMPRES,
					CAGECLAVE);
			List listautoliq = (List) tratarRETURNyMENSAJES(request, autoliq);
			request.getSession().setAttribute("T_IAX_AUTOLIQUIDAAGE", listautoliq);
			log.debug(listautoliq);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*******************************************************************************
	 * ************************************METODOS MARCAR Y DESMARCAR
	 * TODOS*****************
	 *******************************************************************************************/
	public void m_marcar_todos(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		log.info("Axisage034Service m_ajax_actualizar_check");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map autoliq = null;
		BigDecimal CEMPRES = usuario.getCempres();
		request.setAttribute("CEMPRES", CEMPRES);
		BigDecimal CAGECLAVE = new BigDecimal(request.getParameter("CAGECLAVE"));
		request.setAttribute("CAGECLAVE", CAGECLAVE);
		String CUSUARI = request.getParameter("CUSUARI");
		request.setAttribute("CUSUARI", CUSUARI);
		BigDecimal CMARCADO = new BigDecimal(request.getParameter("CMARCADO"));// new BigDecimal(1);

		Date FCOBRO = stringToSqlDate(request.getParameter("FCOBRO"));
		request.setAttribute("FCOBRO", FCOBRO);
		Date FLIQUIDA = stringToSqlDate(request.getParameter("FLIQUIDA"));
		request.setAttribute("FLIQUIDA", FLIQUIDA);

		BigDecimal SPROLIQ;
		log.debug("form sproliq #####" + request.getAttribute("SPROLIQ"));

		if (!isEmpty(request.getAttribute("SPROLIQ")))
			SPROLIQ = (BigDecimal) (request.getAttribute("SPROLIQ"));
		else {
			if (request.getParameter("SPROLIQ").equals(""))
				SPROLIQ = new BigDecimal("0");
			else
				SPROLIQ = new BigDecimal(request.getParameter("SPROLIQ"));
		}
		request.setAttribute("SPROLIQ", SPROLIQ);

		try {
			PAC_IAX_AUTOLIQUIDA pac_iax_autoliquida = new PAC_IAX_AUTOLIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map autoliqGet = pac_iax_autoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(SPROLIQ, CEMPRES,
					CAGECLAVE);
			List listautoliq = (List) tratarRETURNyMENSAJES(request, autoliqGet);
			log.debug(listautoliq);
			if (listautoliq != null) {
				for (int i = 0; i < listautoliq.size(); i++) {
					Map mo = (Map) ((Map) listautoliq.get(i)).get("OB_IAX_AUTOLIQUIDAAGE");
					BigDecimal CAGENTE = (BigDecimal) mo.get("CAGENTE");
					log.error("alor del mapa   " + mo);
					BigDecimal NLIQMEN = (BigDecimal) mo.get("NLIQMEN");

					BigDecimal CESTAUTOLIQ = (BigDecimal) mo.get("CESTAUTOLIQ");
					BigDecimal IIMPORTE = (BigDecimal) mo.get("IIMPORTE");

					BigDecimal IDIFGLOBAL = (BigDecimal) mo.get("IDIFGLOBAL");

					autoliq = pac_iax_autoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDAAGE(CAGENTE, NLIQMEN,
							CESTAUTOLIQ, IIMPORTE, CUSUARI, FCOBRO, CMARCADO, IDIFGLOBAL, FLIQUIDA, CEMPRES, CAGECLAVE,
							SPROLIQ);

					if (((BigDecimal) tratarRETURNyMENSAJES(request, autoliq)).intValue() == 0) {
						SPROLIQ = ((BigDecimal) autoliq.get("OPSPROLIQ"));
					}

					log.debug("#####-" + SPROLIQ);

					request.getSession().setAttribute("SPROLIQ", SPROLIQ);
					request.setAttribute("SPROLIQ", SPROLIQ);

					formdata.put("SPROLIQ", SPROLIQ);
					autoliq.put("SPROLIQ", SPROLIQ);

					log.debug("#####$$-" + request.getAttribute("SPROLIQ"));
					// Map m = (Map)this.ActualizaBanco(request, CBANCO);

				}

			}

			ajax.rellenarPlAContenedorAjax(autoliq);
			ajax.guardarContenidoFinalAContenedorAjax(autoliq);

		} catch (Exception e) {
			log.error("Error en el servicio Axisage034Service - m�todo m_marcar_todos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Actualiza el check de recibos y sus totales por Ajax.
	 * 
	 * @see Axisctr034Service#actualizar_check
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_check(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		log.info("Axisage034Service m_ajax_actualizar_check");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal CAGENTE = new BigDecimal(request.getParameter("CAGENTE"));
			request.setAttribute("CAGENTE", CAGENTE);
			BigDecimal NLIQMEN = "".equals(request.getParameter("NLIQMEN")) || null == request.getParameter("NLIQMEN")
					? new BigDecimal(0)
					: new BigDecimal(request.getParameter("NLIQMEN"));
			request.setAttribute("NLIQMEN", NLIQMEN);
			// BigDecimal CESTAUTOLIQ=new BigDecimal(request.getParameter("CESTAUTOLIQ"));
			BigDecimal CESTAUTOLIQ = "".equals(request.getParameter("CESTAUTOLIQ"))
					|| null == request.getParameter("CESTAUTOLIQ") ? new BigDecimal(1)
							: new BigDecimal(request.getParameter("CESTAUTOLIQ"));
			request.setAttribute("CESTAUTOLIQ", CESTAUTOLIQ);
			BigDecimal IIMPORTE = "".equals(request.getParameter("IIMPORTE"))
					|| null == request.getParameter("IIMPORTE") ? new BigDecimal(0)
							: new BigDecimal(request.getParameter("IIMPORTE"));
			// BigDecimal IIMPORTE = new BigDecimal(0);
			request.setAttribute("IIMPORTE", IIMPORTE);
			String CUSUARI = request.getParameter("CUSUARI");
			request.setAttribute("CUSUARI", CUSUARI);

			BigDecimal CEMPRES = new BigDecimal(request.getParameter("CEMPRES"));
			request.setAttribute("CEMPRES", CEMPRES);

			Date FCOBRO = stringToSqlDate(request.getParameter("FCOBRO"));
			request.setAttribute("FCOBRO", FCOBRO);
			Date FLIQUIDA = stringToSqlDate(request.getParameter("FLIQUIDA"));
			request.setAttribute("FLIQUIDA", FLIQUIDA);

			BigDecimal CAGECLAVE = new BigDecimal(request.getParameter("CAGECLAVE"));
			request.setAttribute("CAGECLAVE", CAGECLAVE);

			BigDecimal SPROLIQ;

			log.debug("##########-->" + formdata.get("SPROLIQ") + "-" + request.getParameter("SPROLIQ") + "-"
					+ request.getAttribute("SPROLIQ") + "-" + getHiddenCampoNumerico(request, "SPROLIQ"));

			if (!isEmpty(formdata.get("SPROLIQ")) && !"".equals(request.getParameter("SPROLIQ"))
					&& !"0".equals(formdata.get("SPROLIQ")))
				SPROLIQ = (BigDecimal) formdata.get("SPROLIQ");
			else {
				if (!isEmpty(request.getAttribute("SPROLIQ")))
					SPROLIQ = (BigDecimal) (request.getAttribute("SPROLIQ"));
				else {
					if (request.getParameter("SPROLIQ").equals(""))
						SPROLIQ = new BigDecimal("0");
					else
						SPROLIQ = new BigDecimal(request.getParameter("SPROLIQ"));
				}
			}

			BigDecimal IDIFGLOBAL = "".equals(request.getParameter("IDIFGLOBAL"))
					|| null == request.getParameter("IDIFGLOBAL") ? new BigDecimal(0)
							: getCampoNumerico(request, "IDIFGLOBAL");
			request.setAttribute("IDIFGLOBAL", IDIFGLOBAL);

			BigDecimal CMARCADO = new BigDecimal(request.getParameter("CMARCADO"));
			request.setAttribute("CMARCADO", CMARCADO);

			log.debug(CEMPRES + " " + CAGECLAVE + " " + SPROLIQ + " " + IDIFGLOBAL);
			PAC_IAX_AUTOLIQUIDA pac_iax_autoliquida = new PAC_IAX_AUTOLIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map autoliq = pac_iax_autoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDAAGE(CAGENTE, NLIQMEN,
					CESTAUTOLIQ, IIMPORTE, CUSUARI, FCOBRO, CMARCADO, IDIFGLOBAL, FLIQUIDA, CEMPRES, CAGECLAVE,
					SPROLIQ);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, autoliq)).intValue() == 0) {
				SPROLIQ = ((BigDecimal) autoliq.get("OPSPROLIQ"));
			}

			log.debug("#####-" + SPROLIQ);

			request.getSession().setAttribute("SPROLIQ", SPROLIQ);
			request.setAttribute("SPROLIQ", SPROLIQ);

			formdata.put("SPROLIQ", SPROLIQ);
			autoliq.put("SPROLIQ", SPROLIQ);

			log.debug("#####$$-" + request.getAttribute("SPROLIQ"));
			// Map m = (Map)this.ActualizaBanco(request, CBANCO);
			ajax.rellenarPlAContenedorAjax(autoliq);
			ajax.guardarContenidoFinalAContenedorAjax(autoliq);

		} catch (Exception e) {
			log.error("Error en el servicio Axisage034Service - m�todo m_ajax_actualizar_check", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
	public void m_modificar(HttpServletRequest request, Axisage034Action thisAction) {

		log.debug("Axisage034Service m_modificar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NLIQMEN = getCampoNumerico(request, "NLIQMEN");
				BigDecimal CEMPRES = getHiddenCampoNumerico(request, "HCEMPRES");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				BigDecimal CESTADO = getHiddenCampoNumerico(request, "HCESTADO");
				Date FLIQUIDA = stringToSqlDate(getCampoTextual(request, "FLIQUIDA"));
				Date FCOBRO = stringToSqlDate(getCampoTextual(request, "FCOBRO"));
				BigDecimal CTOMADOR = getCampoNumerico(request, "CTOMADOR");
				String CUSUARIO = getCampoTextual(request, "CUSUARIO");
				BigDecimal IIMPORTE = getCampoNumerico(request, "IIMPORTE");
				BigDecimal IDIFGLOBAL = getCampoNumerico(request, "IDIFGLOBAL");
				// BigDecimal total_difglobal =
				// (BigDecimal)request.getSession().getAttribute("total_difglobal");
				List LISTDOC = (List) request.getSession().getAttribute("lista_liquida_documentos");
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				List LISTAPU = (List) request.getSession().getAttribute("lista_liquida_apuntes");
				BigDecimal SPROLIQ = getCampoNumerico(request, "SPROLIQ");
				String modo = (String) request.getSession().getAttribute("CMODO");
				BigDecimal YCH = new BigDecimal(1);
				BigDecimal PCPROCES = null;
				BigDecimal PONLIQMEN = null;
				BigDecimal POCESTADO = null;

				boolean guardado_ok = true;

				PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map CabMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACAB("G", NLIQMEN, CEMPRES,
						CAGENTE, CESTADO, FLIQUIDA, FCOBRO, CTOMADOR, CUSUARIO, IIMPORTE, SPROLIQ, IDIFGLOBAL);
				log.debug("guardar cabecera:" + CabMap);
				if (!CabMap.get("RETURN").equals(new BigDecimal(0))) {
					tratarRETURNyMENSAJES(request, CabMap);
					guardado_ok = false;
				} else {
					PCPROCES = ((BigDecimal) CabMap.get("PCPROCES"));
					PONLIQMEN = ((BigDecimal) CabMap.get("PONLIQMEN"));
				}
			}

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
	 * @see Axisage034Service#bancos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_banco(HttpServletRequest request) {
		log.info("Axisage034Service m_ajax_actualizar_banco");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			Map m = (Map) this.ActualizaBanco(request, CBANCO);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			log.error("Error en el servicio Axisage034Service - m�todo m_ajax_actualizar_banco", e);
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
